#ifndef __SENSOR_H__
#define __SENSOR_H__

/* standard library */
#include "stdbool.h"
#include "stdint.h"

/* st library */
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal_i2c.h"

/* project specific library */
#include "SEGGER_RTT.h"

/* driver library */
#include "bmi088.h"
#include "stabilizer_typedef.h"

//left aligned for 7bits address with st hal i2c library 
#define BMI088_ACC_ADDRESS 0x18 << 1
#define BMI088_GYR_ADDRESS 0x69 << 1
#define BMP388_ADDRESS 0x77 << 1

#define ACC_CHIPID 0x1E
#define GYR_CHIPID 0x0F

#define I2C_TIMEOUT 10

#define SENSORS_BMI088_ACCEL_CFG        24
#define SENSORS_BMI088_DEG_PER_LSB_CFG  (2.0f *2000.0f) / 65536.0f
#define SENSORS_BMI088_G_PER_LSB_CFG    (2.0f * (float)SENSORS_BMI088_ACCEL_CFG) / 65536.0f

#define SENSORS_NBR_OF_BIAS_SAMPLES  512

typedef struct
{
  Axis3f     bias;
  Axis3f     variance;
  Axis3f     mean;
  bool       isBiasValueFound;
  bool       isBufferFilled;
  Axis3i16*  bufHead;
  Axis3i16   buffer[SENSORS_NBR_OF_BIAS_SAMPLES];
} BiasObj;

void sensorsInit(void);
void sensorDataUpdate(void);
bool sensorInitTest(void);
bool sensorCalibTest(void);
bool sensor_I2C_reInit(void);




#endif //__sensor_h__