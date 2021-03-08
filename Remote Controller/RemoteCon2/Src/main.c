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

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "nrf24l01.h"
#include "stdio.h"
#include <string.h>
#include "LED_ops.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

#define ADC_BUFF_SIZE 5

struct structPackage { // Size should not exceed 32Bytes
	//uint8_t size;//should be handled by the EazyDMA,however this is legacy version, some twist at the recieving library code would be required
	union {		//first byte is omitted at receive NRF for some reason.
		uint8_t s1;
		struct {
			uint8_t ack :1;
			uint8_t pid :2;
		};
	};
	uint8_t data[29];
} txPackage;

struct structPackageRx { // Size should not exceed 32Bytes
	//uint8_t size;//should be handled by the EazyDMA,however this is legacy version, some twist at the recieving library code would be required
	union {		//first byte is omitted at receive NRF for some reason.
		uint8_t s1;
		struct {
			uint8_t ack :1;
			uint8_t pid :2;
		};
	};
	uint8_t data[30];
} RxPackage;

NRF24L01_Pins_t NRF24L01_Pins;
uint8_t channel = 80; // Channel(decimal)
uint8_t payload = 32;
uint8_t pipeIn[] = { 0xE7, 0xE6, 0xE5, 0xE4, 0xE3 };
uint8_t pipeOut[] = { 0xC2, 0xC2, 0xC2, 0xC2, 0xC2 };

uint16_t adc_buff[ADC_BUFF_SIZE] = { 0 };
uint32_t g_ADCValue[8] = { 0 };

uint8_t received = 0;
uint8_t transmitted = 0;

int g_MeasurementNumber = 0;

uint8_t LEDArrayOut[4] = { 0xAA, 0xAA, 0xAA, 0xAA };
uint8_t LEDArrayOutCharIndex[4] = { };

uint8_t LEDArrayList[] = { 0b11111100,	//0
		0b01100000, //1
		0b11011010, //2
		0b11110010, //3
		0b01100110, //4
		0b10110110, //5
		0b10111110,	//6
		0b11100000, //7
		0b11111110, //8
		0b11110110, //9
		0b11101110, //A
		0b00111110, //b
		0b10011100,	//C
		0b01111010, //d
		0b10011110, //E
		0b10001110 //F
		};

struct {
	uint32_t isUp :1;
	uint32_t isDown :1;
	uint32_t isLeft :1;
	uint32_t isRight :1;
	uint32_t prevXDir :4;
	uint32_t prevYDir :4;
	uint32_t isButtonDown :1;
	uint32_t PressedTimerStart :1;
	uint32_t ShortPressed :1;
	uint32_t LongPressed :1;
	uint32_t isButtonHold :1;
} JoystickStates;

struct {
	uint32_t isUp :1;
	uint32_t isDown :1;
	uint32_t isLeft :1;
	uint32_t isRight :1;
	uint32_t prevXDir :4;
	uint32_t prevYDir :4;
	uint32_t isButtonDown :1;
	uint32_t PressedTimerStart :1;
	uint32_t ShortPressed :1;
	uint32_t LongPressed :1;
	uint32_t isButtonHold :1;
} Joystick2States;

struct {
	uint32_t UpRequest :1;
	uint32_t DownRequest :1;
	uint32_t LeftRequest :1;
	uint32_t RightRequest :1;
	uint32_t ButtonLongPressRequest :1;
	uint32_t ButtonShortPressRequest :1;
	uint32_t RadioTxRequest :1;
} JoystickMngmt;

struct {
	uint32_t Reset :1;
	uint32_t DownRequest :1;
	uint32_t LeftRequest :1;
	uint32_t RightRequest :1;
	uint32_t Blink :1;
} DisplayMode;

struct {
	uint32_t TxContinuousMode :1;
	uint32_t DisplayTestMode :1 ;
} OperatingMode;

enum JoystickDir {
	JoystickDir_Up,
	JoystickDir_Down,
	JoystickDir_Left,
	JoystickDir_Right,
	JoystickDir_XReset,
	JoystickDir_YReset
};
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

SPI_HandleTypeDef hspi1;

TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI1_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM4_Init(void);
/* USER CODE BEGIN PFP */
void nRF24_Init(void);
void printReg8(const char *regname, uint8_t value);
void LedArrayWrite(uint8_t LedNumber, uint8_t Number);
void LedArray_Init(void);
void LedArrayReset(void);
void LED_RGB_SetValue(uint8_t RGB, uint16_t value);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* printf redirect to SWV debug */
int _write(int file, char *ptr, int len) {
	int i = 0;
	for (i = 0; i < len; i++) {
		ITM_SendChar((*ptr++));
	}
	return len;
}

int ConvTime = 0;
int AdcConvDone = 0;

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) {
	__NOP();
}

void HAL_ADC_ErrorCallback(ADC_HandleTypeDef* hadc) {
	printf("adc error=%lu \n", HAL_GetTick() - ConvTime);
//	HAL_ADC_Stop_DMA(&hadc1);
}

/* Task 1 */
void LED_onboard_task(uint32_t taskPeriod) {
	static uint32_t taskTick = 0;
	if (HAL_GetTick() - taskTick >= taskPeriod) {
		if (OperatingMode.TxContinuousMode) {
			LED_onboard_blink(25);
		} else {
			HAL_GPIO_WritePin(Onboard_LED_GPIO_Port, Onboard_LED_Pin,
					GPIO_PIN_RESET);
		}
		taskTick = HAL_GetTick();
	}
}

/* Task 2 */
void RGB_light_task(uint32_t taskPeriod) {
	static uint32_t taskTick = 0;
	if (HAL_GetTick() - taskTick >= taskPeriod) {
		float LED_Bright_K = (float) adc_buff[2] / 4096;
		//LED_Bright_K = 0.5; //disable
		LED_RGB_SetValue('R', adc_buff[3] / 2 * LED_Bright_K);
		LED_RGB_SetValue('G', adc_buff[0] / 2 * LED_Bright_K);
		LED_RGB_SetValue('B', adc_buff[1] / 2 * LED_Bright_K);

		//printf("[0]:%-5d, [1]:%-5d, [2]:%-5d, [3]:%-5d ,[4]:%-5d\n",adc_buff[0], adc_buff[1], adc_buff[2], adc_buff[3], adc_buff[4]);
		if (HAL_GPIO_ReadPin(Onboard_BUT_GPIO_Port, Onboard_BUT_Pin)
				== GPIO_PIN_SET) {
			HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, GPIO_PIN_SET);
		} else {
			HAL_GPIO_WritePin(BUZZER_GPIO_Port, BUZZER_Pin, GPIO_PIN_RESET);
		}
		taskTick = HAL_GetTick();
	}
}

/* Task 3 */
void nRF24_task(uint32_t taskPeriod) {
	static uint32_t taskTick = 0;
	if (HAL_GetTick() - taskTick >= taskPeriod) {
		if (OperatingMode.TxContinuousMode) {

			//workaround of no ack.
			if (txPackage.pid == 3) {
				txPackage.pid = 0;
			} else {
				txPackage.pid++;
			}

			//load package
			txPackage.data[0] = 0x01;	//packet type: command packet
			txPackage.data[1] = 0x04; 	//data length
			txPackage.data[2] = adc_buff[0] >> 4; //scale down from 4095 to 255
			txPackage.data[3] = adc_buff[1] >> 4;
			txPackage.data[4] = adc_buff[3] >> 4;
			txPackage.data[5] = adc_buff[4] >> 4;

			//transmit package
			NRF24L01_Transmit(&txPackage);
			printf("nrf transmit\n");
		}
		taskTick = HAL_GetTick();
	}
}

/* Task 4 */
void Display_task(uint32_t LEDscanTick, uint32_t LEDcontentTick) {
	static uint32_t taskTick1 = 0;
	static uint32_t taskTick2 = 0;
	if (HAL_GetTick() - taskTick1 >= LEDscanTick) {
		static uint8_t time_count = 1;
		LedArrayReset();
		LedArrayWrite(time_count, LEDArrayOut[time_count - 1]);
		time_count++;
		if (time_count == 5)
			time_count = 1;
		taskTick1 = HAL_GetTick();
	}
	if (HAL_GetTick() - taskTick2 >= LEDcontentTick) {
		if (OperatingMode.TxContinuousMode) {
			//display raw thrust value 0~255.
			uint32_t thrust;

			thrust = adc_buff[4] >> 4;

			for (int i = 2; i >= 0; i--) {
				LEDArrayOut[i] = LEDArrayList[thrust % 10];
				thrust = thrust / 10;
			}
			LEDArrayOut[3] = 0b00000000;


		}

		if (OperatingMode.DisplayTestMode) {

			static uint8_t LED_NO_TO_UPDATE = 0;
			if (JoystickMngmt.UpRequest) {
				if (LEDArrayOutCharIndex[LED_NO_TO_UPDATE]
						== sizeof(LEDArrayList) - 1) {
					LEDArrayOutCharIndex[LED_NO_TO_UPDATE] = 0;
				} else {
					LEDArrayOutCharIndex[LED_NO_TO_UPDATE]++;
				}
				LEDArrayOut[LED_NO_TO_UPDATE] =
						LEDArrayList[LEDArrayOutCharIndex[LED_NO_TO_UPDATE]];
				JoystickMngmt.UpRequest = 0;
			}
			if (JoystickMngmt.DownRequest) {
				if (LEDArrayOutCharIndex[LED_NO_TO_UPDATE] == 0) {
					LEDArrayOutCharIndex[LED_NO_TO_UPDATE] =
							sizeof(LEDArrayList) - 1;
				} else {
					LEDArrayOutCharIndex[LED_NO_TO_UPDATE]--;
				}
				LEDArrayOut[LED_NO_TO_UPDATE] =
						LEDArrayList[LEDArrayOutCharIndex[LED_NO_TO_UPDATE]];
				JoystickMngmt.DownRequest = 0;
			}
			if (JoystickMngmt.RightRequest) {
				if (LED_NO_TO_UPDATE == 3) {
					LED_NO_TO_UPDATE = 0;
				} else {
					LED_NO_TO_UPDATE++;
				}
				JoystickMngmt.RightRequest = 0;
			}
			if (JoystickMngmt.LeftRequest) {
				if (LED_NO_TO_UPDATE == 0) {
					LED_NO_TO_UPDATE = 3;
				} else {
					LED_NO_TO_UPDATE--;
				}
				JoystickMngmt.LeftRequest = 0;
			}
			if (JoystickMngmt.ButtonShortPressRequest) {
				JoystickMngmt.UpRequest = 1;
				JoystickMngmt.ButtonShortPressRequest = 0;
			}
			if (JoystickMngmt.ButtonLongPressRequest) {
				if (DisplayMode.Blink) {
					DisplayMode.Blink = 0;
				} else {
					DisplayMode.Blink = 1;

				}
				JoystickMngmt.ButtonLongPressRequest = 0;
			}
		}

		taskTick2 = HAL_GetTick();
	}
}

/* Task 5 */
void Joystick_mngmnt_task(uint32_t taskPeriod) {
	static uint32_t taskTick = 0;
	if (HAL_GetTick() - taskTick >= taskPeriod) {
		if (adc_buff[0] < 100) {	//left and right
			if (JoystickStates.prevXDir == JoystickDir_XReset) {
				JoystickMngmt.LeftRequest = 1;
			}
			JoystickStates.isLeft = 1;
			JoystickStates.prevXDir = JoystickDir_Left;
		} else if (adc_buff[0] > 4000) {
			if (JoystickStates.prevXDir == JoystickDir_XReset) {
				JoystickMngmt.RightRequest = 1;
			}
			JoystickStates.isRight = 1;
			JoystickStates.prevXDir = JoystickDir_Right;
		} else {
			JoystickStates.isLeft = 0;
			JoystickStates.isRight = 0;
			JoystickStates.prevXDir = JoystickDir_XReset;
		}
		if (adc_buff[1] < 100) {	//up and down
			if (JoystickStates.prevYDir == JoystickDir_YReset) {
				JoystickMngmt.UpRequest = 1;
			}
			JoystickStates.isUp = 1;
			JoystickStates.prevYDir = JoystickDir_Up;
		} else if (adc_buff[1] > 3900) {
			if (JoystickStates.prevYDir == JoystickDir_YReset) {
				JoystickMngmt.DownRequest = 1;
			}
			JoystickStates.isDown = 1;
			JoystickStates.prevYDir = JoystickDir_Down;
		} else {
			JoystickStates.isUp = 0;
			JoystickStates.isDown = 0;
			JoystickStates.prevYDir = JoystickDir_YReset;
		}
		if (HAL_GPIO_ReadPin(Joystick_Sw_GPIO_Port, Joystick_Sw_Pin)
				== GPIO_PIN_RESET) {
			JoystickStates.isButtonDown = 1;
		} else {
			JoystickStates.isButtonDown = 0;
		}
		static uint32_t ButtonDownTime = 0;
		if (JoystickStates.isButtonDown == 1	//Button
		&& JoystickStates.PressedTimerStart == 0) {
			ButtonDownTime = HAL_GetTick();
			JoystickStates.PressedTimerStart = 1;
		}
		uint32_t ButtonDownTimeTemp = HAL_GetTick() - ButtonDownTime;
		if (ButtonDownTimeTemp > 50 && ButtonDownTimeTemp <= 500) {	//short press button
			if (JoystickStates.isButtonDown == 0) {	//release button at this time
				JoystickMngmt.ButtonShortPressRequest = 1;
				OperatingMode.TxContinuousMode ^= 1;
				JoystickStates.PressedTimerStart = 0;	//reset hold timer
			}
		} else if (ButtonDownTimeTemp > 500 || ButtonDownTimeTemp < 1000) {	//long press button
			if (JoystickStates.isButtonDown == 0) {	//release button at this time
				JoystickMngmt.ButtonLongPressRequest = 1;
				JoystickStates.PressedTimerStart = 0;//stop button hold count timer
			}
		} else if (ButtonDownTimeTemp >= 1000) {
			JoystickStates.isButtonHold = 1;
		}

		if (JoystickStates.isButtonDown == 0) {
			ButtonDownTime = HAL_GetTick();
			JoystickStates.isButtonHold = 0;
		}

		taskTick = HAL_GetTick();
	}
}
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

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_USART1_UART_Init();
  MX_ADC1_Init();
  MX_TIM4_Init();
  /* USER CODE BEGIN 2 */

	/* Tasks init */
	printf("IO Initialized. \n");	//IO
	HAL_Delay(10);

	nRF24_Init();	// nRF
	printf("nRF24 Initialized. \n");

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_SET); //Onboard LED
	HAL_Delay(1);

	LedArray_Init();	//LED display
	for (int i = 0; i < 4; i++)
		LEDArrayOut[i] = LEDArrayList[0];

	memset(&txPackage.data, '\0', sizeof(txPackage.data)); // txPackage
	uint8_t testmsg[] = "htesttest";
	memcpy(txPackage.data, testmsg, sizeof(testmsg));

	//	HAL_ADC_Start(&hadc1);
	HAL_ADC_Start_DMA(&hadc1, (uint32_t *) adc_buff, ADC_BUFF_SIZE); //ADC

	HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_2); // RGB light
	HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_3);
	HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_4);
	LED_RGB_SetValue('R', 1000);
	LED_RGB_SetValue('G', 1000);
	LED_RGB_SetValue('B', 1000);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

		/* Task 1 LED brightness */
		LED_onboard_task(10);

		/* Task 2 RGB light */
		RGB_light_task(10);

		/* Task 3 nRF24 Transmit */
		nRF24_task(20);

		/* task 4 LED Array */
		Display_task(3, 20);

		/* task 5 Joystick management */
		Joystick_mngmnt_task(20);

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
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL8;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Common config 
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ScanConvMode = ADC_SCAN_ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 5;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel 
  */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel 
  */
  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = ADC_REGULAR_RANK_2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel 
  */
  sConfig.Channel = ADC_CHANNEL_3;
  sConfig.Rank = ADC_REGULAR_RANK_3;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel 
  */
  sConfig.Channel = ADC_CHANNEL_8;
  sConfig.Rank = ADC_REGULAR_RANK_4;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel 
  */
  sConfig.Channel = ADC_CHANNEL_9;
  sConfig.Rank = ADC_REGULAR_RANK_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_HARD_OUTPUT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_64;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief TIM4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM4_Init(void)
{

  /* USER CODE BEGIN TIM4_Init 0 */

  /* USER CODE END TIM4_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM4_Init 1 */

  /* USER CODE END TIM4_Init 1 */
  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 0;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 2000;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim4, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM4_Init 2 */

  /* USER CODE END TIM4_Init 2 */
  HAL_TIM_MspPostInit(&htim4);

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/** 
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void) 
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, Onboard_LED_Pin|SPI_CE_Pin|BUZZER_Pin|LED1_select_Pin 
                          |LED2_select_Pin|LED3_select_Pin|LED4_select_Pin|SRCLR_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, SER_Pin|_OE_Pin|RCLK_Pin|SRCLK_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : Joystick_Sw_Pin Joystick2_Sw_Pin OnOff_Pin */
  GPIO_InitStruct.Pin = Joystick_Sw_Pin|Joystick2_Sw_Pin|OnOff_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pin : Onboard_BUT_Pin */
  GPIO_InitStruct.Pin = Onboard_BUT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(Onboard_BUT_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : Onboard_LED_Pin SPI_CE_Pin BUZZER_Pin SRCLR_Pin */
  GPIO_InitStruct.Pin = Onboard_LED_Pin|SPI_CE_Pin|BUZZER_Pin|SRCLR_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : LED1_select_Pin LED2_select_Pin LED3_select_Pin LED4_select_Pin */
  GPIO_InitStruct.Pin = LED1_select_Pin|LED2_select_Pin|LED3_select_Pin|LED4_select_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : SER_Pin _OE_Pin RCLK_Pin SRCLK_Pin */
  GPIO_InitStruct.Pin = SER_Pin|_OE_Pin|RCLK_Pin|SRCLK_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
void printReg8(const char *name, uint8_t value) {
	uint8_t mask;
	printf("%s : ", name);
	for (mask = 0x80; mask != 0; mask >>= 1) { //be careful of unsigned value compare
		printf("%d", value & mask ? 1 : 0);
	}
	printf(" ");
}

/* PWM period = 2000 */
void LED_RGB_SetValue(uint8_t RGB, uint16_t value) {
	TIM_OC_InitTypeDef sConfigOC;
	uint8_t Channel = TIM_CHANNEL_2;
	/* R and B switched on breakout board */
	if (RGB == 'R') {
		Channel = TIM_CHANNEL_4;
	} else if (RGB == 'G') {
		Channel = TIM_CHANNEL_3;
	} else if (RGB == 'B') {
		Channel = TIM_CHANNEL_2;
	}
	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = value;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, Channel);
	HAL_TIM_PWM_Start(&htim4, Channel);
}

void LedArrayReset() {
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_11, GPIO_PIN_SET);

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);

}

void LedArrayWrite(uint8_t LedNumber, uint8_t Number) {
	for (uint8_t i = 0; i < 8; i++) {
		if (Number & (1 << i)) {
			HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_SET);
		} else {
			HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_RESET);
		}
		/* SRCLK clock once to let 1 bit go thru */
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);
	}
	/* RCLK clock once to store the byte */
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);
	/* Enable shift register output data */
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_11, GPIO_PIN_RESET);

	switch (LedNumber) {
	case 1:
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
		break;
	case 2:
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);
		break;
	case 3:
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
		break;
	case 4:
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_RESET);
		break;
	}

}

void LedArray_Init() {
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_8, GPIO_PIN_RESET);	//SER
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_11, GPIO_PIN_SET);	//_OE
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);	//RCLK
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);	//SRCLK
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);		//_SRCLR

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);	//HIGH IMPEDANCE
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_SET);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_15, GPIO_PIN_SET);

}

void nRF24_Init() {
	/* Pins are used to in chip select functions */

	NRF24L01_Pins.CE.GPIOx = GPIOB;
	NRF24L01_Pins.CE.GPIO_Pin = GPIO_PIN_10;
	NRF24L01_Pins.CSN.GPIOx = GPIOA; // Declara pinos especificos da spi
	NRF24L01_Pins.CSN.GPIO_Pin = GPIO_PIN_4;
	NRF24L01_Pins.IRQ.GPIOx = NULL; // Interrupt pin is not used yet
	NRF24L01_Pins.IRQ.GPIO_Pin = 0;
	NRF24L01_Pins.MISO.GPIOx = GPIOA;
	NRF24L01_Pins.MISO.GPIO_Pin = GPIO_PIN_6;
	NRF24L01_Pins.MOSI.GPIOx = GPIOA;
	NRF24L01_Pins.MOSI.GPIO_Pin = GPIO_PIN_7;
	NRF24L01_Pins.SCK.GPIOx = GPIOA;
	NRF24L01_Pins.SCK.GPIO_Pin = GPIO_PIN_5;

	/* Initialize NRF24L01 on channel 80 and n bytes of payload */
	/* By default 2Mbps data rate and 0dBm output power */
	NRF24L01_Init(channel, payload, &hspi1, NRF24L01_Pins); //REVER

	/* Set 2MBps data rate and -18dBm output power */
	NRF24L01_SetRF(NRF24L01_DataRate_1M, NRF24L01_OutputPower_0dBm);

	/* Enable auto acknowledgement */
	NRF24L01_SetAutoAck(0xFF, 1); // 0xFF Enable all or if you want enable just pipe 3, insert 3
								  // Have some trouble with ack enable... many lost packages

	/* Enable CRC 2bytes */
	NRF24L01_SetCrcLength(NRF24L01_CRC_16);

	/* Open a writing pipe with an address*/
	NRF24L01_OpenWritingPipe(pipeOut);
	HAL_Delay(1);

	/* Open a reading pipe */
	NRF24L01_OpenReadingPipe(1, pipeIn);
	HAL_Delay(1);
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	while (1)
		;
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
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
