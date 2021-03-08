/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "SEGGER_RTT.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define LED_4_GREEN_Pin GPIO_PIN_13
#define LED_4_GREEN_GPIO_Port GPIOC
#define LED_1_RED_Pin GPIO_PIN_2
#define LED_1_RED_GPIO_Port GPIOA
#define NRF_FLOW_CTRL_Pin GPIO_PIN_3
#define NRF_FLOW_CTRL_GPIO_Port GPIOA
#define E_MDM_IO1_Pin GPIO_PIN_4
#define E_MDM_IO1_GPIO_Port GPIOC
#define E_MDM_IO2_Pin GPIO_PIN_5
#define E_MDM_IO2_GPIO_Port GPIOC
#define LED_BLUE_Pin GPIO_PIN_1
#define LED_BLUE_GPIO_Port GPIOB
#define LED_2_GREEN_Pin GPIO_PIN_12
#define LED_2_GREEN_GPIO_Port GPIOB
#define LED_3_RED_Pin GPIO_PIN_10
#define LED_3_RED_GPIO_Port GPIOC
#define E_MDM_IO3_Pin GPIO_PIN_11
#define E_MDM_IO3_GPIO_Port GPIOC
#define E_MDM_IO4_Pin GPIO_PIN_8
#define E_MDM_IO4_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
