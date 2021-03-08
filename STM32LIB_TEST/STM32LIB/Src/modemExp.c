
#include "main.h"
#include "stm32f4xx_hal.h"

extern UART_HandleTypeDef huart3;

void ModemInit()
{
    /* hold PWR_ON_N (modem) down for 2 seconds to power up */
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_5, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(E_MDM_IO4_GPIO_Port, E_MDM_IO4_Pin, GPIO_PIN_SET);
    
    HAL_Delay(2000);
    HAL_GPIO_WritePin(E_MDM_IO4_GPIO_Port, E_MDM_IO4_Pin, GPIO_PIN_RESET);

    HAL_Delay(5000);
    uint8_t command[] = "AT\r";
    while (1)
    {
        uint8_t data = 0xAA;
        HAL_StatusTypeDef state;
        //HAL_UART_Transmit(&huart3, &data, 1, 10);
                state = HAL_UART_Transmit(&huart3, command, sizeof(command), 1000);
                state = HAL_UART_Receive(&huart3, &data, 1, 1000);
                SEGGER_RTT_printf(0, "recieve status: %u.\n", state);
                if (state == HAL_OK)
                {
                    SEGGER_RTT_printf(0, "%c\n", data);
                }
    }
}