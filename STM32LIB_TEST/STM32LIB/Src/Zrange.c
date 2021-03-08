
#include "SEGGER_RTT.h"

#include "Zrange.h"
#include "vl53l0x_api.h"

int8_t VL53L0x_configSensor(VL53L0X_Dev_t *Dev, VL53L0X_Sense_config_t vlconfig)
{
    int8_t Status = 0;
    Status = VL53L0X_SetLimitCheckEnable(
        Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, 1);

    if (Status == 0)
    {
        Status = VL53L0X_SetLimitCheckEnable(
            Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, 1);
    }

    if (Status != 0)
        return -1;

    switch (vlconfig)
    {
    case VL53L0X_SENSE_DEFAULT:
        SEGGER_RTT_printf(0, "VL53L0X_SENSE_DEFAULT.\n");
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckEnable(
                Dev, VL53L0X_CHECKENABLE_RANGE_IGNORE_THRESHOLD, 1);
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckValue(
                Dev, VL53L0X_CHECKENABLE_RANGE_IGNORE_THRESHOLD,
                (FixPoint1616_t)(1.5 * 0.023 * 65536));
        }
        break;
    case VL53L0X_SENSE_LONG_RANGE:
        SEGGER_RTT_printf(0, "VL53L0X_SENSE_LONG_RANGE.\n");
        Status = VL53L0X_SetLimitCheckValue(
            Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE,
            (FixPoint1616_t)(0.1 * 65536));
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckValue(Dev,
                VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE,
                (FixPoint1616_t)(60 * 65536));
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetMeasurementTimingBudgetMicroSeconds(Dev, 33000);
        }

        if (Status == 0)
        {
            Status = VL53L0X_SetVcselPulsePeriod(Dev,
                VL53L0X_VCSEL_PERIOD_PRE_RANGE, 18);
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetVcselPulsePeriod(
                Dev, VL53L0X_VCSEL_PERIOD_FINAL_RANGE, 14);
        }
        break;
    case VL53L0X_SENSE_HIGH_SPEED:
        SEGGER_RTT_printf(0, "VL53L0X_SENSE_HIGH_SPEED.\n");
        Status = VL53L0X_SetLimitCheckValue(
            Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE,
            (FixPoint1616_t)(0.25 * 65536));
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckValue(Dev,
                VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE,
                (FixPoint1616_t)(32 * 65536));
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetMeasurementTimingBudgetMicroSeconds(Dev, 30000);
        }
        break;
    case VL53L0X_SENSE_HIGH_ACCURACY:
        // increase timing budget to 200 ms
        SEGGER_RTT_printf(0, "VL53L0X_SENSE_HIGH_ACCURACY.\n");
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, (FixPoint1616_t)(0.25 * 65536));
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckValue(Dev, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE,
                (FixPoint1616_t)(18 * 65536));
        }
        if (Status == 0)
        {
            Status = VL53L0X_SetMeasurementTimingBudgetMicroSeconds(Dev, 200000);
        }
        // Not sure about ignore threhold, try turnning it off...
        if (Status == 0)
        {
            Status = VL53L0X_SetLimitCheckEnable(
                Dev, VL53L0X_CHECKENABLE_RANGE_IGNORE_THRESHOLD, 0);
        }

        break;
    }

    return !(Status == 0);
}