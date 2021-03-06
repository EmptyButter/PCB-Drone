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
#include "stm32f1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

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

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define Joystick_Sw_Pin GPIO_PIN_13
#define Joystick_Sw_GPIO_Port GPIOC
#define Joystick2_Sw_Pin GPIO_PIN_14
#define Joystick2_Sw_GPIO_Port GPIOC
#define OnOff_Pin GPIO_PIN_15
#define OnOff_GPIO_Port GPIOC
#define Onboard_BUT_Pin GPIO_PIN_0
#define Onboard_BUT_GPIO_Port GPIOA
#define Onboard_LED_Pin GPIO_PIN_2
#define Onboard_LED_GPIO_Port GPIOB
#define SPI_CE_Pin GPIO_PIN_10
#define SPI_CE_GPIO_Port GPIOB
#define BUZZER_Pin GPIO_PIN_11
#define BUZZER_GPIO_Port GPIOB
#define LED1_select_Pin GPIO_PIN_12
#define LED1_select_GPIO_Port GPIOB
#define LED2_select_Pin GPIO_PIN_13
#define LED2_select_GPIO_Port GPIOB
#define LED3_select_Pin GPIO_PIN_14
#define LED3_select_GPIO_Port GPIOB
#define LED4_select_Pin GPIO_PIN_15
#define LED4_select_GPIO_Port GPIOB
#define SER_Pin GPIO_PIN_8
#define SER_GPIO_Port GPIOA
#define _OE_Pin GPIO_PIN_11
#define _OE_GPIO_Port GPIOA
#define RCLK_Pin GPIO_PIN_12
#define RCLK_GPIO_Port GPIOA
#define SRCLK_Pin GPIO_PIN_15
#define SRCLK_GPIO_Port GPIOA
#define SRCLR_Pin GPIO_PIN_4
#define SRCLR_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
