/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "dma.h"
#include "gpio.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "SEGGER_RTT.h"
#include "syslink.h"
#include <math.h>
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define START_BYTE1 0xEB
#define START_BYTE2 0xCE

#define BMI088_ACC_ADDRESS 0x30 //shift to left from 0x18
#define BMI088_GYR_ADDRESS 0xD2 //shift to left from 0x69
#define BMP388_ADDRESS 0xEE     //shift to left from 0x77
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
float AXmg = 0;
float AYmg = 0;
float AZmg = 0;

uint8_t uartData[64] = {};
struct syslinkPacket syslinkPacket;

uint8_t uartDataReceived = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

void IMU_task(uint32_t taskperiod)
{
    static uint32_t I2C3_tickcount = 0;
    if (HAL_GetTick() - I2C3_tickcount > taskperiod)
    {
        static uint8_t tData[6];
        uint8_t BMI088_stats1 = 0;
        uint8_t BMI088_stats2 = 0;
        uint8_t Reg = 0;
        uint8_t RegVal = 0;
        uint8_t ACC_RANGE_val = 0;
        //          BMI088_stats1 = HAL_I2C_Master_Transmit(&hi2c3, BMI088_GYR_ADDRESS, &tData, 1, HAL_MAX_DELAY );
        //          BMI088_stats2 = HAL_I2C_Master_Receive(&hi2c3, BMI088_GYR_ADDRESS, &tData, 1, HAL_MAX_DELAY);
        //          printf("Transmit stats:%u ,", BMI088_stats1);
        //          printf("%u \n", tData);
        tData[0] = 0x7D;
        tData[1] = 0x04;
        BMI088_stats1 = HAL_I2C_Master_Transmit(&hi2c3, BMI088_ACC_ADDRESS, tData, 2, HAL_MAX_DELAY);
        HAL_Delay(50);
        Reg = 0x7D; //ACC_PWR_CONF reg
        Reg = 0x00;
        BMI088_stats1 = HAL_I2C_Master_Transmit(&hi2c3, BMP388_ADDRESS, &Reg, 1, HAL_MAX_DELAY);
        BMI088_stats2 = HAL_I2C_Master_Receive(&hi2c3, BMP388_ADDRESS, &RegVal, 1, HAL_MAX_DELAY);
        Reg = 0x41; //ACC_RANGE reg
        BMI088_stats1 = HAL_I2C_Master_Transmit(&hi2c3, BMI088_ACC_ADDRESS, &Reg, 1, HAL_MAX_DELAY);
        BMI088_stats2 = HAL_I2C_Master_Receive(&hi2c3, BMI088_ACC_ADDRESS, &RegVal, 1, HAL_MAX_DELAY);
        ACC_RANGE_val = RegVal;
        HAL_Delay(2);
        Reg = 0x12; //ACC_DATA reg
        BMI088_stats1 = HAL_I2C_Master_Transmit(&hi2c3, BMI088_ACC_ADDRESS, &Reg, 1, HAL_MAX_DELAY);
        BMI088_stats2 = HAL_I2C_Master_Receive(&hi2c3, BMI088_ACC_ADDRESS, tData, 6, HAL_MAX_DELAY);
        int16_t AX = tData[1] * 256 + tData[0];
        int16_t AY = tData[3] * 256 + tData[2];
        int16_t AZ = tData[5] * 256 + tData[4];
        AXmg = (float)AX / 32768 * 1000 * pow(2, ACC_RANGE_val + 1) * 1.5;
        AYmg = (float)AY / 32768 * 1000 * pow(2, ACC_RANGE_val + 1) * 1.5;
        AZmg = (float)AZ / 32768 * 1000 * pow(2, ACC_RANGE_val + 1) * 1.5;
        //        printf("%d, %d, %d\n", tData[0], AYmg, AZmg);

        I2C3_tickcount = HAL_GetTick();
    }
}

void Blink_IMU_task(uint32_t taskperiod)
{
    static uint32_t IMU_test_blink_tickcount = 0;
    if (HAL_GetTick() - IMU_test_blink_tickcount > taskperiod)
    {
        static int period;
        period = (1000 - abs(AXmg)) / 2;
        static uint32_t IMU_blink_periodtick = 0;
        if (HAL_GetTick() - IMU_blink_periodtick > period)
        {
            HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_1);
            IMU_blink_periodtick = HAL_GetTick();
        }
        IMU_test_blink_tickcount = HAL_GetTick();
    }
}

void Syslink_task(uint32_t taskperiod)
{
    static uint32_t task_tickcount = 0;
    if (HAL_GetTick() - task_tickcount > taskperiod)
    {
        uint16_t timeout = 10;
        uint16_t byteNum = 64;
        uint16_t ret;
        uint8_t cksum1 = 0;
        uint8_t cksum2 = 0;
        bool syslinkPacketReceived = false;

        for (int i = 0; i < byteNum; i++)
            uartData[i] = 0;

        ret = HAL_UART_Receive(&huart6, uartData, byteNum, 1);

        int i = 0;
        int j = 0;
        while (uartData[i] != START_BYTE1 && i != byteNum - 5) i++; //break when start byte match, or reached near end of buffer.
        i++;
        if (i < byteNum - 4 && uartData[i] == START_BYTE2)
        {
            i++;

            syslinkPacket.type = uartData[i++]; //n-3
            cksum1 = syslinkPacket.type;
            cksum2 = cksum1;

            syslinkPacket.length = uartData[i++]; //n-2
            cksum1 += syslinkPacket.length;
            cksum2 += cksum1;

            if (syslinkPacket.length + 2 < byteNum - i && syslinkPacket.length != 0) //if complete data in the buffer.
            {
                for (j = 0; j < syslinkPacket.length; j++)
                {
                    syslinkPacket.data[j] = uartData[i++];
                    cksum1 += syslinkPacket.data[j];
                    cksum2 += cksum1;
                }
                if (cksum1 == uartData[i++])
                {
                    if (cksum2 == uartData[i])
                    {
                        syslinkPacketReceived = true;
                    }
                    else
                    {
                        syslinkPacketReceived = false;
                    }
                }
                else //data not complete in the buffer, abort.
                {
                    syslinkPacketReceived = false;
                }
            }
            else //start byte2 not match, or data not complete in the buffer.
            {
                syslinkPacketReceived = false;
            }
        }
        else
        {
            syslinkPacketReceived = false;
        }

        if (syslinkPacketReceived == false)
        {
            for (int i = 0; i < byteNum; i++)
                uartData[i] = 0;
        }

        if (syslinkPacketReceived == true)
        {
            for (int i = 0; i < syslinkPacket.length; i++)
                printf("%hu, ", syslinkPacket.data[i]);
            printf("\n");
        }

        task_tickcount = HAL_GetTick();
    }
}

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
    /* USER CODE BEGIN 1 */

    /* USER CODE END 1 */

    /* MCU Configuration--------------------------------------------------------*/

    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* USER CODE BEGIN Init */
    printf("HAL_Init()\n");
    /* USER CODE END Init */

    /* Configure the system clock */
    SystemClock_Config();

    /* USER CODE BEGIN SysInit */
    printf("SystemClock_Config()\n");
    /* USER CODE END SysInit */

    /* Initialize all configured peripherals */
    MX_GPIO_Init();
    MX_DMA_Init();
    MX_TIM2_Init();
    MX_TIM3_Init();
    MX_TIM4_Init();
    MX_I2C3_Init();
    MX_USART6_UART_Init();
    /* USER CODE BEGIN 2 */
    printf("PeriphInit()\n");

    uint32_t toggle_tickcount = 0;
    uint32_t I2C3_tickcount = 0;

    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&htim2, TIM_CHANNEL_2);
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3);
    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_4);
    printf("PWM_Init()\n");
    /* USER CODE END 2 */

    /* Infinite loop */
    /* USER CODE BEGIN WHILE */
    printf("MainLoop()\n");

    while (1)
    {
                IMU_task(10);

             Blink_IMU_task(10);

        Syslink_task(1);
        /* USER CODE END WHILE */

        /* USER CODE BEGIN 3 */
    }
    /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
    RCC_OscInitTypeDef RCC_OscInitStruct = {0};
    RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

    /** Configure the main internal regulator output voltage 
  */
    __HAL_RCC_PWR_CLK_ENABLE();
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
    /** Initializes the CPU, AHB and APB busses clocks 
  */
    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
    if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
    {
        Error_Handler();
    }
    /** Initializes the CPU, AHB and APB busses clocks 
  */
    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
    {
        Error_Handler();
    }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
    /* USER CODE BEGIN Error_Handler_Debug */
    /* User can add his own implementation to report the HAL error return state */

    /* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
    /* USER CODE BEGIN 6 */
    /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
    /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/