#include <stdint.h>
#include <stm32f4xx_hal.h>

#include "SEGGER_RTT.h"

#include "LEDflow.h"

extern I2C_HandleTypeDef hi2c1;

/* debug variable define */
static uint8_t testreg = 0;
static uint8_t testregval = 0;
static uint8_t testread = 0;
static uint8_t statuslp = 0;
static uint16_t testdata16 = 0;
static uint8_t testdata2[2] = {0};

int8_t lp55231_I2C_read(uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    uint8_t device_address;
    HAL_StatusTypeDef state;

    device_address = LP55231SQX_I2C_ADDR << 1; //addr MSB first, 8th bit is 0 for WRITE
    state = HAL_I2C_Master_Transmit(&hi2c1, device_address, &reg_addr, 1, LP55231_I2C_TIMEOUT);
    device_address |= 0x01; //8th bit is 1 for READ
    state = HAL_I2C_Master_Receive(&hi2c1, device_address, data, len, LP55231_I2C_TIMEOUT);

    return state;
}

int8_t lp55231_I2C_write(uint8_t reg_addr, uint8_t *data, uint16_t len)
{
    uint8_t device_address;
    HAL_StatusTypeDef state;
    uint8_t bufferlen = len + 1;
    uint8_t buffer[bufferlen];

    buffer[0] = reg_addr;
    device_address = LP55231SQX_I2C_ADDR << 1;           //addr MSB first, 8th bit is 0 for WRITE
    if (len > 1 && (reg_addr > 0x16 && reg_addr < 0x1E)) //multiple reg write not allowed for reg0x16~0x1E
    {
        SEGGER_RTT_printf(0, "lp55231: I2C reg counter not incremented for 0x16~0x1E [ERROR]\n");
    }
    else
    {
        for (int i = 1; i < bufferlen; i++)
        {
            buffer[i] = data[i - 1];
        }
    }
    state = HAL_I2C_Master_Transmit(&hi2c1, device_address, buffer, bufferlen, LP55231_I2C_TIMEOUT);

    return state;
}

void lp55231_reset()
{
    uint8_t data = 0xFF;
    lp55231_I2C_write(0x3D, &data, 1);
}

uint8_t lp5_getflag(uint8_t reg, uint8_t msk)
{
    uint8_t data;
    lp55231_I2C_read(LP55231SQX_I2C_ADDR, &data, 1);
    data &= msk;
    return data;
}

/* LED Driver Instructions */
uint16_t ramp1(uint8_t prescale, uint8_t steptime, uint8_t sign, uint8_t increments)
{
    uint16_t data = 0;
    data |= (prescale << 14) | (steptime << 9) | (sign << 8) | (increments);
    return data;
}
/* LED Driver Instructions END */

/* LED Mapping Instructions */
//addr is 0-95
uint16_t mux_ld_start(uint8_t addr)
{
    uint16_t data;
    data = 0b10011110;
    data <<= 8;
    data |= addr;
    return data;
}

//addr is 0-95
uint16_t mux_map_start(uint8_t addr)
{
    uint16_t data;
    data = 0b10011100;
    data <<= 8;
    data |= addr;
    return data;
}

//addr is 0-95
uint16_t mux_ld_end(uint8_t addr)
{
    uint16_t data;
    data = 0b1001110010000000;
    data |= addr;
    return data;
}

uint16_t mux_sel(uint8_t led_sel)
{
    uint16_t data;
    data = 0b1001110100000000;
    data |= led_sel;
    return data;
}
/* LED Mapping Instructions END */

void write_single_instruction(uint16_t in, uint8_t addr)
{
    uint8_t data[2];

    data[0] = addr / 16;
    lp55231_I2C_write(LP5_REG_PROG_MEM_PAGE_SEL, data, 1);

    data[1] = in & 0x00FF; //LSB
    data[0] = in >> 8;     //MSB first

    lp55231_I2C_write((addr % 16) * 2 + 0x50, data, 2);
}

void waitEngineBusy()
{
    while (lp5_getflag(LP5_REG_STATUS, LP5_STATUS_ENGINE_BUSY_msk))
        ;
}

void lp55231_Init()
{
    //reset
    lp55231_reset();

    //enable
    lp55231_I2C_read(0x00, &testregval, 1);
    testregval |= 0b01000000;
    lp55231_I2C_write(0x00, &testregval, 1);
    while (lp5_getflag(LP5_REG_STATUS, LP5_STATUS_STARTUP_BUSY_msk))
        ;

    //Internal clk enable, charge pump force bypass, pwm power save, operation
    lp55231_I2C_read(0x36, &testregval, 1);
    testregval |= 0b01001101;
    lp55231_I2C_write(0x36, &testregval, 1);

    //load program mode
    testregval = 0;
    lp55231_I2C_write(0x01, &testregval, 1); //hold first
    testregval = 0b00010101;
    lp55231_I2C_write(0x01, &testregval, 1);
    //init engine
    waitEngineBusy();

    //PWM D7 100
    testregval = 4;
    lp55231_I2C_write(0x16, &testregval, 1);
    //PWM D8 100
    testregval = 2;
    lp55231_I2C_write(0x19, &testregval, 1);
    //PWM D9 100
    testregval = 2;
    lp55231_I2C_write(0x1B, &testregval, 1);

    /* TODO chip program problem
    //program engine
    uint16_t test16 = 0xFFAA;
    write_single_instruction(ramp1(1, 12, 0, 8), 10); //tested valid
    write_single_instruction(test16, 1);              //tested valid
    lp55231_I2C_read(0x52, &testread, 1);

    //excu1 hold engine
    testregval = 0b01000000; //hold engine, hold already
    lp55231_I2C_write(0x00, &testregval, 1);
    //set PC

    //check if any led mapped to the engines
    testread = 0xFF;
    lp55231_I2C_read(0x70, &testread, 1);
    testread = 0xFF;
    lp55231_I2C_read(0x71, &testread, 1);

    //excu1 free run
    testregval = 0b01010101; //free run
    lp55231_I2C_write(0x00, &testregval, 1);

    //excu2 run mode
    testregval = 0b00101010;
    lp55231_I2C_write(0x01, &testregval, 1);
    */
}