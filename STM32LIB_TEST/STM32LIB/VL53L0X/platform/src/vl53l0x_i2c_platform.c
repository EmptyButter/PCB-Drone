#include "vl53l0x_i2c_platform.h"
#include "stm32f4xx_hal.h"

#define I2C_TIMEOUT 10

extern I2C_HandleTypeDef hi2c1;

int32_t VL53L0X_write_multi(uint8_t address, uint8_t index, uint8_t *pdata, int32_t count)
{
    uint8_t bufferlen = count + 1; //data length including register address
    uint8_t buffer[bufferlen];
    buffer[0] = index; //register address
    for (int i = 1; i < bufferlen; i++)
    {
        buffer[i] = pdata[i - 1];
    }
    HAL_StatusTypeDef state;
    state = HAL_I2C_Master_Transmit(&hi2c1, address, buffer, bufferlen, I2C_TIMEOUT);
   
    return state;
}

int32_t VL53L0X_read_multi(uint8_t address, uint8_t index, uint8_t *pdata, int32_t count)
{
    HAL_StatusTypeDef state;
    state = HAL_I2C_Master_Transmit(&hi2c1, address, &index, 1, I2C_TIMEOUT);
    state = HAL_I2C_Master_Receive(&hi2c1, address, pdata, count, I2C_TIMEOUT);

    return state;
}

int32_t VL53L0X_write_byte(uint8_t address, uint8_t index, uint8_t data)
{
    return VL53L0X_write_multi(address, index, &data, 1);
}

int32_t VL53L0X_write_word(uint8_t address, uint8_t index, uint16_t data)
{
    uint8_t buff[2];
    buff[1] = data & 0xFF;
    buff[0] = data >> 8;
    return VL53L0X_write_multi(address, index, buff, 2);
}

int32_t VL53L0X_write_dword(uint8_t address, uint8_t index, uint32_t data)
{
    uint8_t buff[4];
    buff[3] = data & 0xFF;
    buff[2] = data >> 8;
    buff[1] = data >> 16;
    buff[0] = data >> 24;
    return VL53L0X_write_multi(address, index, buff, 4);
}

int32_t VL53L0X_read_byte(uint8_t address, uint8_t index, uint8_t *pdata)
{
    return VL53L0X_read_multi(address, index, pdata, 1);
}

int32_t VL53L0X_read_word(uint8_t address, uint8_t index, uint16_t *pdata)
{
    uint8_t buff[2];
    int state = VL53L0X_read_multi(address, index, buff, 2);

    uint16_t temp = 0;
    temp = buff[0] << 8;
    temp |= buff[1];

    *pdata = temp;

    return state;
}

int32_t VL53L0X_read_dword(uint8_t address, uint8_t index, uint32_t *pdata)
{
    uint8_t buff[4];
    int state = VL53L0X_read_multi(address, index, buff, 4);

    uint32_t temp = 0;
    temp = buff[0] << 24;
    temp |= buff[1] << 16;
    temp |= buff[2] << 8;
    temp |= buff[3] << 16;

    *pdata = temp;

    return state;
}