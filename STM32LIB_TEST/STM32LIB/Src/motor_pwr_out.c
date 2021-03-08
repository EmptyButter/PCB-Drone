#include <stdint.h>
#include <stm32f4xx_hal.h>
#include <stm32f4xx_hal_tim.h>

#include "SEGGER_RTT.h"
#include "motor_pwr_out.h"
#include "num.h"

extern TIM_HandleTypeDef htim4;
extern TIM_HandleTypeDef htim3;
extern TIM_HandleTypeDef htim2;
extern void Error_Handler(void);

extern control_t control;

extern float Vbatt;

static bool isInit = false;

static struct motorPower_s
{
    union
    {
        struct
        {
            uint32_t m1;
            uint32_t m2;
            uint32_t m3;
            uint32_t m4;
        };
        uint32_t m[4];
    };
} motorPower;

uint16_t limitUint16(int32_t value)
{
    if (value > UINT16_MAX)
    {
        value = UINT16_MAX;
    }
    else if (value < 0)
    {
        value = 0;
    }

    return (uint16_t)value;
}

void motorSetPWM()
{
    TIM_OC_InitTypeDef sConfigOC = {0};

    sConfigOC.OCMode = TIM_OCMODE_PWM1;
    sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
    sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;

    HAL_TIM_PWM_Stop(&htim2, TIM_CHANNEL_1);
    HAL_TIM_PWM_Stop(&htim2, TIM_CHANNEL_2);
    HAL_TIM_PWM_Stop(&htim3, TIM_CHANNEL_3);
    HAL_TIM_PWM_Stop(&htim4, TIM_CHANNEL_4);

    /* Motor 1 */

    sConfigOC.Pulse = motorPower.m1;
    if (HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
    {
        Error_Handler();
    }

    /* Motor 2 */
    sConfigOC.Pulse = motorPower.m2;
    if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
    {
        Error_Handler();
    }

    /* Motor 3 */
    sConfigOC.Pulse = motorPower.m3;
    if (HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
    {
        Error_Handler();
    }

    /* Motor 4 */
    sConfigOC.Pulse = motorPower.m4;
    if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
    {
        Error_Handler();
    }

    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_2);
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_4);

    //SEGGER_RTT_printf(0, "m1:%-4d, m2:%-4d, m3:%-4d, m4:%-4d\n", motorPower.m1, motorPower.m2, motorPower.m3, motorPower.m4);
}

void ClearMotorPower()
{
    for (int i = 0; i < 4; i++)
    {
        motorPower.m[i] = 0;
    }
}

void motorConstrain(uint32_t max)
{
    for (int i = 0; i < 4; i++)
    {
        motorPower.m[i] = motorPower.m[i] > max ? max : motorPower.m[i];
    }
}

uint16_t thrustBatCompensation(uint16_t ithrust)
{
    uint16_t ratio;
    float thrust = ((float)ithrust / 255.0f) * 60 * 1.25; //1.25
    float volts = -0.0006239f * thrust * thrust + 0.088f * thrust;
    float supply_voltage = Vbatt;
    float percentage = volts / supply_voltage;
    percentage = percentage > 1.0f ? 1.0f : percentage;
    ratio = percentage * 255.0f;

    return ratio;
}

void powerDistribution(control_t *control)
{
    int16_t r = control->roll / 2.0f;
    int16_t p = control->pitch / 2.0f;
    //control->yaw = 0;
    motorPower.m1 = limitUint16(control->thrust + r + p + control->yaw);
    motorPower.m2 = limitUint16(control->thrust + r - p - control->yaw);
    motorPower.m3 = limitUint16(control->thrust - r - p + control->yaw);
    motorPower.m4 = limitUint16(control->thrust - r + p - control->yaw);
    //SEGGER_RTT_printf(0, "m1:%-4d, m2:%-4d, m3:%-4d, m4:%-4d\n ,", motorPower.m1, motorPower.m2, motorPower.m3, motorPower.m4);

    if (control->thrust == 0)
        ClearMotorPower();

    /* Thrust battery compensation */
    motorPower.m1 = thrustBatCompensation(motorPower.m1);
    motorPower.m2 = thrustBatCompensation(motorPower.m2);
    motorPower.m3 = thrustBatCompensation(motorPower.m3);
    motorPower.m4 = thrustBatCompensation(motorPower.m4);

    uint32_t maxPower = 254;
    motorConstrain(maxPower);
    //    motorPower.m1 = motorPower.m1 > 60 ? 60 : motorPower.m1; for video editing
    //    motorPower.m4 = motorPower.m4 > 60 ? 60 : motorPower.m4;
    motorSetPWM();
}

void powerDistributionUpdate()
{
    powerDistribution(&control);
}

void MotorPowerInit()
{
    HAL_StatusTypeDef status = HAL_OK;
    status |= HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
    status |= HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_2);
    status |= HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
    status |= HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_4);
    if (status == HAL_OK)
    {
        isInit = true;
    }
    else
    {
        isInit = false;
    }
    return;
}

bool MotorPowerTest()
{
    return isInit;
}

void motorTest()
{
    motorPower.m1 = 10; // of 255
    motorPower.m2 = 10; // 
    motorPower.m3 = 10; // 
    motorPower.m4 = 10; // 
    motorSetPWM();
}