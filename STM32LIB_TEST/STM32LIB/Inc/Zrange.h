#ifndef __ZRANGE_H__
#define __ZRANGE_H__

#include <stdint.h>
#include "vl53l0x_platform.h"

typedef enum
{
    VL53L0X_SENSE_DEFAULT = 0,
    VL53L0X_SENSE_LONG_RANGE,
    VL53L0X_SENSE_HIGH_SPEED,
    VL53L0X_SENSE_HIGH_ACCURACY
} VL53L0X_Sense_config_t;

int8_t VL53L0x_configSensor(VL53L0X_Dev_t *Dev, VL53L0X_Sense_config_t vlconfig);

#endif