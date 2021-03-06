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
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

#define ADC_BUFF_SIZE 8

struct structPackage { // Size should not exceed 32Bytes
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
uint8_t pipeOut[] = { 0xE7, 0xE6, 0xE5, 0xE4, 0xE3 };

uint16_t adc_buff[ADC_BUFF_SIZE] = { 0 };
uint32_t g_ADCValue = 0;
int g_MeasurementNumber = 0;
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

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_SPI1_Init(void);
/* USER CODE BEGIN PFP */
void nRF24_Init(void);
void printReg8(const char *regname, uint8_t value);
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

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) {

	HAL_ADC_Stop_DMA(&hadc1);
}
/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {
	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */
	printf("HAL Initialized. \n");
	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */
	printf("SystemClock Initialized. \n");
	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_ADC1_Init();
	MX_SPI1_Init();
	/* USER CODE BEGIN 2 */
	printf("IO Initialized. \n");
	HAL_Delay(10);

	nRF24_Init();
	printf("nRF24 Initialized. \n");

	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_SET);
	HAL_Delay(1);
	/* Tasks init */
	uint32_t nRF24_rece_at = 0; // hold the time of last receive
	uint32_t nRF24_read_at = 0;
	uint32_t LED_send_at = 0;
	uint32_t ADC_send_at = 0;

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */

	int toggle = 1;
	int period = 0;
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
//		NRF24L01_TestCarrier();
//		printReg8("RPD",NRF24L01_REG_RPD);
//		HAL_Delay(100);

		/* Task 1 nRF24 Receive */
		if (NRF24L01_Available(NULL) != 0) {
			uint32_t time = HAL_GetTick() - nRF24_rece_at;
			while (NRF24L01_Read(&RxPackage) != 0) {
			}

			printf("x1: %d , x2: %d , x3: %d", RxPackage.data[0], RxPackage.data[1],RxPackage.data[2]);
			printf(" period: %lu \n", time);

			nRF24_rece_at = HAL_GetTick();
		}

		/* Task 2 LED brightness */
		if (toggle == 1) {
			period = g_ADCValue * 20 / 4096;
		} else if (toggle == 0) {
			period = 20 - g_ADCValue * 20 / 4096;
		}
		if (HAL_GetTick() - LED_send_at >= RxPackage.data[0]/40) {
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);
			toggle = toggle ? 0 : 1;
			LED_send_at = HAL_GetTick();
		}

		/* USER CODE BEGIN 3 */
	}
	/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };
	RCC_PeriphCLKInitTypeDef PeriphClkInit = { 0 };

	/** Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI_DIV2;
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL16;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}
	/** Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK) {
		Error_Handler();
	}
	PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
	PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
	if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK) {
		Error_Handler();
	}
}

/**
 * @brief ADC1 Initialization Function
 * @param None
 * @retval None
 */
static void MX_ADC1_Init(void) {

	/* USER CODE BEGIN ADC1_Init 0 */

	/* USER CODE END ADC1_Init 0 */

	ADC_ChannelConfTypeDef sConfig = { 0 };

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
	hadc1.Init.NbrOfConversion = 2;
	if (HAL_ADC_Init(&hadc1) != HAL_OK) {
		Error_Handler();
	}
	/** Configure Regular Channel
	 */
	sConfig.Channel = ADC_CHANNEL_1;
	sConfig.Rank = ADC_REGULAR_RANK_1;
	sConfig.SamplingTime = ADC_SAMPLETIME_13CYCLES_5;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
	/** Configure Regular Channel
	 */
	sConfig.Channel = ADC_CHANNEL_2;
	sConfig.Rank = ADC_REGULAR_RANK_2;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
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
static void MX_SPI1_Init(void) {

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
	if (HAL_SPI_Init(&hspi1) != HAL_OK) {
		Error_Handler();
	}
	/* USER CODE BEGIN SPI1_Init 2 */

	/* USER CODE END SPI1_Init 2 */

}

/** 
 * Enable DMA controller clock
 */
static void MX_DMA_Init(void) {

	/* DMA controller clock enable */
	__HAL_RCC_DMA1_CLK_ENABLE()
	;

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
static void MX_GPIO_Init(void) {
	GPIO_InitTypeDef GPIO_InitStruct = { 0 };

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOD_CLK_ENABLE()
	;
	__HAL_RCC_GPIOA_CLK_ENABLE()
	;
	__HAL_RCC_GPIOB_CLK_ENABLE()
	;

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_RESET);

	/*Configure GPIO pin : PB2 */
	GPIO_InitStruct.Pin = GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	/*Configure GPIO pin : PB0 */
	GPIO_InitStruct.Pin = GPIO_PIN_0;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);



}

/* USER CODE BEGIN 4 */
void printReg8(const char *name, uint8_t value) {
	uint8_t mask;

	printf("%s : ", name);
	for (mask = 0x80; mask != 0; mask >>= 1) { //be careful of unsigned value compare
		printf("%d", NRF24L01_ReadRegister(value) & mask ? 1 : 0);
	}
	printf("\n");
}

void nRF24_Init() {
	/* Pins are used to in chip select functions */

	NRF24L01_Pins.CE.GPIOx = GPIOB;
	NRF24L01_Pins.CE.GPIO_Pin = GPIO_PIN_0;
	NRF24L01_Pins.CSN.GPIOx = GPIOA; // Declara pinos especificos da spi
	NRF24L01_Pins.CSN.GPIO_Pin = GPIO_PIN_4;
	NRF24L01_Pins.IRQ.GPIOx = NULL; // Interrupt pin is not used yet
	NRF24L01_Pins.IRQ.GPIO_Pin = NULL;
	NRF24L01_Pins.MISO.GPIOx = GPIOA;
	NRF24L01_Pins.MISO.GPIO_Pin = GPIO_PIN_6;
	NRF24L01_Pins.MOSI.GPIOx = GPIOA;
	NRF24L01_Pins.MOSI.GPIO_Pin = GPIO_PIN_7;
	NRF24L01_Pins.SCK.GPIOx = GPIOA;
	NRF24L01_Pins.SCK.GPIO_Pin = GPIO_PIN_5;

	/* Initialize NRF24L01 on channel 80 and n bytes of payload */
	/* By default 2Mbps data rate and 0dBm output power */
	NRF24L01_Init(channel, payload, &hspi1, NRF24L01_Pins); //REVER
	printf("first init done.\n\n");

	/* Set 2MBps data rate and -18dBm output power */
	NRF24L01_SetRF(NRF24L01_DataRate_1M, NRF24L01_OutputPower_0dBm);
	printReg8("RF_SETUP",NRF24L01_REG_RF_SETUP);

	/* Enable auto acknowledgement */
	NRF24L01_SetAutoAck(0xFF, 0); // 0xFF Enable all or if you want enable just pipe 3, insert 3
								  // Have some trouble with ack enable... many lost packages

	/* Enable CRC 2bytes */
	NRF24L01_SetCrcLength(NRF24L01_CRC_16);

	/* Open a reading pipe with an address*/
	NRF24L01_OpenReadingPipe(1, pipeOut);
	HAL_Delay(1);
	printReg8("ADDR_P1",NRF24L01_REG_RX_ADDR_P0+1);

	NRF24L01_StartListening();
	HAL_Delay(1);
	printReg8("CONFIG",NRF24L01_REG_CONFIG);

	NRF24L01_TestCarrier();
	printReg8("RPD",NRF24L01_REG_RPD);

}
/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
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
