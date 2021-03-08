#include "sensor.h"
#include "bmp3.h"
#include "i2c.h"
#include "main.h"
#include "math.h"
#include <stdio.h>

// Variance threshold to take zero bias for gyro
#define GYRO_VARIANCE_BASE 10000
#define GYRO_VARIANCE_THRESHOLD_X (GYRO_VARIANCE_BASE)
#define GYRO_VARIANCE_THRESHOLD_Y (GYRO_VARIANCE_BASE)
#define GYRO_VARIANCE_THRESHOLD_Z (GYRO_VARIANCE_BASE)
#define GYRO_NBR_OF_AXES 3
#define GYRO_MIN_BIAS_TIMEOUT_MS (unsigned int)(1000)

#define SENSORS_ACC_SCALE_SAMPLES 200

extern I2C_HandleTypeDef hi2c3;

static bool isInit = false;

static struct bmp3_dev bmp388;

static struct bmi088_dev bmi088;
static struct bmi088_sensor_data gyroRaw;
static struct bmi088_sensor_data accelRaw;

sensorData_t sensorData;

static bool gyroBiasFound = false;
static BiasObj gyroBiasRunning;
static BiasObj checkSteadyState;
static Axis3f gyroBias;
Axis3f accScaled;

static float accScaleSum = 0;
static float accScale = 1;
static bool accScaleFound = false;
static uint32_t accScaleSumCount = 0;

static bool isBarometerPresent = false;

int8_t bmi088_I2C_read(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    HAL_StatusTypeDef state;
    state = HAL_I2C_Master_Transmit(&hi2c3, dev_addr, &reg_addr, 1, I2C_TIMEOUT);
    state = HAL_I2C_Master_Receive(&hi2c3, dev_addr, data, len, I2C_TIMEOUT);
    return state;
}

int8_t bmi088_I2C_write(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    uint8_t bufferlen = len + 1;
    uint8_t buffer[bufferlen];
    buffer[0] = reg_addr;
    for (int i = 1; i < bufferlen; i++)
    {
        buffer[i] = data[i - 1];
    }
    HAL_StatusTypeDef state;
    state = HAL_I2C_Master_Transmit(&hi2c3, dev_addr, buffer, bufferlen, I2C_TIMEOUT);
    return state;
}

/**
 * Adds a new value to the variance buffer and if it is full
 * replaces the oldest one. Thus a circular buffer.
 */
static void sensorsAddBiasValue(BiasObj *bias, int16_t x, int16_t y, int16_t z)
{
    bias->bufHead->x = x;
    bias->bufHead->y = y;
    bias->bufHead->z = z;
    bias->bufHead++;

    if (bias->bufHead >= &bias->buffer[SENSORS_NBR_OF_BIAS_SAMPLES])
    {
        bias->bufHead = bias->buffer;
        bias->isBufferFilled = true;
    }
}

/**
 * Calculates the variance and mean for the bias buffer.
 */
static void sensorsCalculateVarianceAndMean(BiasObj *bias, Axis3f *varOut, Axis3f *meanOut)
{
    uint32_t i;
    int64_t sum[GYRO_NBR_OF_AXES] = {0};
    int64_t sumSq[GYRO_NBR_OF_AXES] = {0};

    for (i = 0; i < SENSORS_NBR_OF_BIAS_SAMPLES; i++)
    {
        sum[0] += bias->buffer[i].x;
        sum[1] += bias->buffer[i].y;
        sum[2] += bias->buffer[i].z;
        sumSq[0] += bias->buffer[i].x * bias->buffer[i].x;
        sumSq[1] += bias->buffer[i].y * bias->buffer[i].y;
        sumSq[2] += bias->buffer[i].z * bias->buffer[i].z;
    }

    varOut->x = (sumSq[0] - ((int64_t)sum[0] * sum[0]) / SENSORS_NBR_OF_BIAS_SAMPLES);
    varOut->y = (sumSq[1] - ((int64_t)sum[1] * sum[1]) / SENSORS_NBR_OF_BIAS_SAMPLES);
    varOut->z = (sumSq[2] - ((int64_t)sum[2] * sum[2]) / SENSORS_NBR_OF_BIAS_SAMPLES);

    meanOut->x = (float)sum[0] / SENSORS_NBR_OF_BIAS_SAMPLES;
    meanOut->y = (float)sum[1] / SENSORS_NBR_OF_BIAS_SAMPLES;
    meanOut->z = (float)sum[2] / SENSORS_NBR_OF_BIAS_SAMPLES;
}

/**
 * Checks if the variances is below the predefined thresholds.
 * The bias value should have been added before calling this.
 * @param bias  The bias object
 */
static bool sensorsFindBiasValue(BiasObj *bias)
{
    static int32_t varianceSampleTime;
    bool foundBias = false;

    if (bias->isBufferFilled)
    {
        sensorsCalculateVarianceAndMean(bias, &bias->variance, &bias->mean);

        if (bias->variance.x < GYRO_VARIANCE_THRESHOLD_X &&
            bias->variance.y < GYRO_VARIANCE_THRESHOLD_Y &&
            bias->variance.z < GYRO_VARIANCE_THRESHOLD_Z &&
            (varianceSampleTime + GYRO_MIN_BIAS_TIMEOUT_MS < HAL_GetTick()))
        {
            varianceSampleTime = HAL_GetTick();
            bias->bias.x = bias->mean.x;
            bias->bias.y = bias->mean.y;
            bias->bias.z = bias->mean.z;
            foundBias = true;
            bias->isBiasValueFound = true;
        }
    }

    return foundBias;
}

/**
 * Calculates the bias first when the gyro variance is below threshold. Requires a buffer
 * but calibrates platform first when it is stable.
 */
static bool processGyroBias(int16_t gx, int16_t gy, int16_t gz, Axis3f *gyroBiasOut)
{
    sensorsAddBiasValue(&gyroBiasRunning, gx, gy, gz);

    if (!gyroBiasRunning.isBiasValueFound)
    {
        sensorsFindBiasValue(&gyroBiasRunning);
        if (gyroBiasRunning.isBiasValueFound)
        {
        }
    }
    gyroBiasOut->x = gyroBiasRunning.bias.x;
    gyroBiasOut->y = gyroBiasRunning.bias.y;
    gyroBiasOut->z = gyroBiasRunning.bias.z;

    return gyroBiasRunning.isBiasValueFound;
}

/**
 * Calculates accelerometer scale out of SENSORS_ACC_SCALE_SAMPLES samples. Should be called when
 * platform is stable.
 */
static bool processAccScale(int16_t ax, int16_t ay, int16_t az)
{
    if (!accScaleFound)
    {
        accScaleSum += sqrtf(powf(ax * SENSORS_BMI088_G_PER_LSB_CFG, 2) + powf(ay * SENSORS_BMI088_G_PER_LSB_CFG, 2) + powf(az * SENSORS_BMI088_G_PER_LSB_CFG, 2));
        accScaleSumCount++;

        if (accScaleSumCount == SENSORS_ACC_SCALE_SAMPLES)
        {
            accScale = accScaleSum / SENSORS_ACC_SCALE_SAMPLES;
            accScaleFound = true;
        }
    }

    return accScaleFound;
}

void sensorDataUpdate(void)
{
    /* get data from sensors */
    bmi088_get_gyro_data(&gyroRaw, &bmi088);
    bmi088_get_accel_data(&accelRaw, &bmi088);

    /* calibrate if necessary */
    gyroBiasFound = processGyroBias(gyroRaw.x, gyroRaw.y, gyroRaw.z, &gyroBias);
    if (gyroBiasFound)
    {
        processAccScale(accelRaw.x, accelRaw.y, accelRaw.z);
    }

    /* Gyro */
    sensorData.gyro.x = (gyroRaw.x - gyroBias.x) * SENSORS_BMI088_DEG_PER_LSB_CFG;
    sensorData.gyro.y = (gyroRaw.y - gyroBias.y) * SENSORS_BMI088_DEG_PER_LSB_CFG;
    sensorData.gyro.z = (gyroRaw.z - gyroBias.z) * SENSORS_BMI088_DEG_PER_LSB_CFG;

    /* Acelerometer */
    sensorData.acc.x = accelRaw.x * SENSORS_BMI088_G_PER_LSB_CFG / accScale;
    sensorData.acc.y = accelRaw.y * SENSORS_BMI088_G_PER_LSB_CFG / accScale;
    sensorData.acc.z = accelRaw.z * SENSORS_BMI088_G_PER_LSB_CFG / accScale;

    //SEGGER_RTT_printf(0, "gx:%-5d gy:%-5d gz:%-5d ax:%-5d ay:%-5d az:%-5d RAW\n", gyroRaw.x, gyroRaw.y, gyroRaw.z, accelRaw.x, accelRaw.y, accelRaw.z);
    //SEGGER_RTT_printf(0, "gx:%-5d gy:%-5d gz:%-5d ax:%-5d ay:%-5d az:%-5d POST\n", (int)sensorData.gyro.x, (int)sensorData.gyro.y, (int)sensorData.gyro.z, (int)(sensorData.acc.x*1000), (int)(sensorData.acc.y*1000), (int)(sensorData.acc.z*1000));
    //printf("gx:%-5f gy:%-5f gz:%-5f ax:%-5f ay:%-5f az:%-5f POST\n", sensorData.gyro.x, sensorData.gyro.y, sensorData.gyro.z, sensorData.acc.x, sensorData.acc.y, sensorData.acc.z);
    if (isBarometerPresent)
    {
        static uint8_t baroMeasDelay = 200; //sensor task 1000Hz, baro read 50Hz. delay 200 sensor cycles.'
        if (--baroMeasDelay == 0)
        {
            uint8_t sensor_select = BMP3_PRESS | BMP3_TEMP;
            struct bmp3_data data;
            baro_t *baro388 = &sensorData.baro;
            bmp3_get_sensor_data(sensor_select, &data, &bmp388);
            //printf("BMP388 read T:%0.2f  P:%0.2f\n", data.temperature, data.pressure / 1000.0f);
        }
    }
}

void sensorsDeviceInit(void)
{
    if (isInit)
    {
        return;
    }

    int8_t rslt;
    uint8_t regval;

    /* BMI088 interface register */
    bmi088.accel_id = BMI088_ACC_ADDRESS;
    bmi088.gyro_id = BMI088_GYR_ADDRESS;
    bmi088.interface = BMI088_I2C_INTF;
    bmi088.read = bmi088_I2C_read;
    bmi088.write = bmi088_I2C_write;
    bmi088.delay_ms = HAL_Delay;

    /* gyro */
    rslt = bmi088_gyro_init(&bmi088);
    if (rslt == 0)
    {
        SEGGER_RTT_printf(0, "BMI088 Gyro I2C connection [OK]\n");

        /* set power mode of gyro */
        rslt |= bmi088_set_gyro_power_mode(&bmi088);

        /* set bandwidth and range gyro */
        bmi088.gyro_cfg.bw = BMI088_GYRO_BW_116_ODR_1000_HZ;
        bmi088.gyro_cfg.range = BMI088_GYRO_RANGE_2000_DPS;
        bmi088.gyro_cfg.odr = BMI088_GYRO_BW_116_ODR_1000_HZ;
        rslt |= bmi088_set_gyro_meas_conf(&bmi088);
        //bmi088_I2C_read(BMI088_GYR_ADDRESS, 0x10, &regval, 1);
        //bmi088_I2C_read(BMI088_GYR_ADDRESS, 0x0F, &regval, 1);

        /* get one set data */
        bmi088.delay_ms(50);
        struct bmi088_sensor_data gyr;
        rslt |= bmi088_get_gyro_data(&gyr, &bmi088);
    }
    else
    {
        SEGGER_RTT_printf(0, "BMI088 Gyro connection [FAIL]\n");
        isInit = false;
        return;
    }

    /* ACCEL */
    rslt |= bmi088_accel_switch_control(&bmi088, BMI088_ACCEL_POWER_ENABLE);
    bmi088.delay_ms(5);
    rslt = bmi088_accel_init(&bmi088);
    if (rslt == 0)
    {
        SEGGER_RTT_printf(0, "BMI088 Accel I2C connection [OK] \n");
        /* set power mode */
        bmi088.accel_cfg.power = BMI088_ACCEL_PM_ACTIVE;
        rslt |= bmi088_set_accel_power_mode(&bmi088);
        bmi088.delay_ms(30);

        /* set bandwidth and range */
        bmi088.accel_cfg.bw = BMI088_ACCEL_BW_OSR4;
        bmi088.accel_cfg.range = BMI088_ACCEL_RANGE_24G;
        bmi088.accel_cfg.odr = BMI088_ACCEL_ODR_1600_HZ;
        rslt |= bmi088_set_accel_meas_conf(&bmi088);

        /* get one set data */
        struct bmi088_sensor_data acc;
        rslt |= bmi088_get_accel_data(&acc, &bmi088);
    }
    else
    {
        SEGGER_RTT_printf(0, "BMI088 Accel I2C connection [FAIL]\n");
        isInit = false;
        return;
    }

    /* BMP388 */
    bmp388.dev_id = BMP388_ADDRESS;
    bmp388.intf = BMP3_I2C_INTF;
    bmp388.read = bmi088_I2C_read;
    bmp388.write = bmi088_I2C_write;
    bmp388.delay_ms = HAL_Delay;

    int i = 3;
    do
    {
        bmp388.delay_ms(1);
        //For some reason it often doesn't work first time
        rslt = bmp3_init(&bmp388);
    } while (rslt != BMP3_OK && i-- > 0);

    if (rslt == BMP3_OK)
    {
        isBarometerPresent = true;
        SEGGER_RTT_printf(0, "BMP388 I2C connection [OK]\n");
        uint32_t settings_select;
        /* Select enable pressure and temperature */
        bmp388.settings.press_en = BMP3_ENABLE;
        bmp388.settings.temp_en = BMP3_ENABLE;
        /* Select output data rate, oversampling, IIR filter settings
    according to the datasheet recommand table */
        bmp388.settings.odr_filter.press_os = BMP3_OVERSAMPLING_8X;
        bmp388.settings.odr_filter.temp_os = BMP3_NO_OVERSAMPLING;
        bmp388.settings.odr_filter.odr = BMP3_ODR_50_HZ;
        bmp388.settings.odr_filter.iir_filter = BMP3_IIR_FILTER_COEFF_3;
        /* Assign the settings */
        settings_select = BMP3_PRESS_EN_SEL | BMP3_TEMP_EN_SEL | BMP3_PRESS_OS_SEL | BMP3_ODR_SEL | BMP3_IIR_FILTER_SEL;
        rslt = bmp3_set_sensor_settings(settings_select, &bmp388);
        /* Set the power mode to NORMAL MODE */
        bmp388.settings.op_mode = BMP3_NORMAL_MODE;
        rslt = bmp3_set_op_mode(&bmp388);

        bmp388.delay_ms(50); //wait before first read out
        uint8_t sensor_sel;
        struct bmp3_data data;
        /* Sensor component selection */
        sensor_sel = BMP3_PRESS | BMP3_TEMP;
        rslt = bmp3_get_sensor_data(sensor_sel, &data, &bmp388);

        //printf("BMP388 read T:%0.2f  P:%0.2f\n", data.temperature, data.pressure / 100.0f);
    }
    else
    {
        SEGGER_RTT_printf(0, "BMP388 I2C connection [FAIL]\n");
        isInit = false;
        return;
    }

    /* Init 2nd order filter here if any */

    isInit = true;
}

void sensorsInit(void)
{
    if (isInit)
    {
        return;
    }
    /* init gyro bias object */
    gyroBiasRunning.isBufferFilled = false;
    gyroBiasRunning.bufHead = gyroBiasRunning.buffer;

    /* init sensors chip settings */
    sensorsDeviceInit();

    /* wait until quad body is steady */
}

bool sensorCalibTest()
{
    return gyroBiasFound;
}

bool sensorInitTest()
{
    return isInit;
}

//reset "I2C busy status" caused by resetting MCU while communicating with IMU sensors.
bool sensor_I2C_reInit()
{
    SEGGER_RTT_printf(0, "ReInit I2C and senosrs...\n");

    HAL_I2C_DeInit(&hi2c3); //DeInit I2C3 first.
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_8;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
    for (int i = 0; i < 50; i++) //toggle I2C CLK pin to let unfinished slave data line go thru.
    {
        HAL_Delay(1);
        HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_8);
    }
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);

    MX_I2C3_Init(); //Init I2C3 again.

    sensorsInit(); //Init sensors again.
    return sensorInitTest();
}