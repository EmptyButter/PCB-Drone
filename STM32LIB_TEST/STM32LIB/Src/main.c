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
#include "spi.h"
#include "tim.h"
#include "usart.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <math.h>
#include <stdio.h>
#include <string.h>

#include "SEGGER_RTT.h"
#include "num.h"
#include "uart_syslink.h"

#include "LED_sequence.h"
#include "controller.h"
#include "motor_pwr_out.h"
#include "sensor.h"
#include "stateEstimator.h"

#include "LEDflow.h"
#include "Zrange.h"
#include "vl53l0x_api.h"
#include "vl53l0x_platform.h"

#include "modemExp.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define BMI088_ACC_ADDRESS 0x18 << 1
#define BMI088_GYR_ADDRESS 0x69 << 1
#define BMP388_ADDRESS 0x77 << 1
#define LOW_BATT_THRESHOLD 3.55
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
int globaltest;

float AXmg = 0;
float AYmg = 0;
float AZmg = 0;

uint8_t uartData[64] = {};
extern syslinkPacket_t syslinkPacket;
uint8_t uartDataReceived = 0;
setpoint_t cmdsetpoint;

extern I2C_HandleTypeDef hi2c3;

VL53L0X_Dev_t vl53l0C;
VL53L0X_DeviceInfo_t vl53l0cDeviceInfo;
int test[32] = {0};
VL53L0X_RangingMeasurementData_t testdata;
uint32_t refSpadCount;
uint8_t isApertureSpads;
uint8_t VhvSettings;
uint8_t PhaseCal;

//for syslink float data
union {
	uint8_t bytes[4];
	float afloat;
} bytes2afloat;

float Vbatt = 0;

//current drone operating mode
static enum OpMode {
	StartUp,
	TestMode1,
	ChargingMode,
	NormalMode
} currentOpMode = StartUp;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

void Stabilizer_task(uint32_t taskperiod)
{
	static uint32_t taskStartDelay = 0;
	static uint32_t I2C3_tickcount = 0;
	static uint32_t tick = 0;
	if (HAL_GetTick() - I2C3_tickcount >= taskperiod) {

		sensorDataUpdate(); //1000Hz

		stateEstimatorUpdate(tick); //250Hz

		stateControllerUpdate(tick); //attitude 250Hz, rate 500Hz

		if (HAL_GetTick() - taskStartDelay > 2000) //delay powerout for stateEstimate ajust.
		{
			powerDistributionUpdate();
		}

		tick++;

		I2C3_tickcount = HAL_GetTick();
	}
}

void Syslink_task(uint32_t taskperiod) //TODO: Optimize this. Can only read one packet per taskperiod, other packages arrived within the period time is discarded.
{
	static uint32_t task_tickcount = 0;
	static uint32_t cmd_timeout_tickcount = 0;
	if (HAL_GetTick() - task_tickcount > taskperiod) {
		if (uartDataReceived) {
			if (syslinkPacket.type == 0x01) {
				if (currentOpMode != NormalMode) {
					currentOpMode = NormalMode;
				}
				SEGGER_RTT_printf(0, "%hu,%hu,%hu,%hu\n", syslinkPacket.data[0], syslinkPacket.data[1], syslinkPacket.data[2], syslinkPacket.data[3]);
				cmdsetpoint.thrust = constrain((syslinkPacket.data[3] - 120) * 2, 1, 255);
				float p = syslinkPacket.data[1];
				float r = syslinkPacket.data[0];
				float y = syslinkPacket.data[2];
				cmdsetpoint.attitude.pitch = (p - 123) / 3 * 1;
				cmdsetpoint.attitude.roll = (r - 122) / 3 * 1;
				cmdsetpoint.attitudeRate.yaw = -(y - 122) * 2;
				cmdsetpoint.attitude.pitch = deadband(cmdsetpoint.attitude.pitch, 2);
				cmdsetpoint.attitude.roll = deadband(cmdsetpoint.attitude.roll, 2);
				cmdsetpoint.attitudeRate.yaw = deadband(cmdsetpoint.attitudeRate.yaw, 5);
				//SEGGER_RTT_printf(0, "pitch:%-5d, roll:%-5d\n", (int)cmdsetpoint.attitude.pitch, (int)cmdsetpoint.attitude.roll);

				//cmdsetpoint.thrust = 0; //disable motor for testing.

				cmdsetpoint.velocity.z = constrain(((float)syslinkPacket.data[3] - 120) / 130 * 0.7, -1, 1);
				cmdsetpoint.velocity.z = deadband(cmdsetpoint.velocity.z, 0.1f);
				cmdsetpoint.velocity.z = 0; //disable for testing
				//SEGGER_RTT_printf(0, "set.vZ:%d cm/s\n", (int)(cmdsetpoint.velocity.z * 100));

				cmdsetpoint.position.z = constrain(((float)syslinkPacket.data[3] - 120) / 100, 0, 1.5);
				cmdsetpoint.position.z = 0.8;
				//SEGGER_RTT_printf(0, "\n\nset.Z:%d cm/s\n", (int)(cmdsetpoint.position.z * 100));

				cmdSetPoint(&cmdsetpoint);

				//shutdown motors timer
				cmd_timeout_tickcount = HAL_GetTick();
			} else if (syslinkPacket.type == 0x03) { //Vbatt
				for (int i = 0; i < 4; i++)
					bytes2afloat.bytes[i] = syslinkPacket.data[i];
				Vbatt = bytes2afloat.afloat;

				//SEGGER_RTT_printf(0, "%hu,%hu,%hu,%hu\n", syslinkPacket.data[0], syslinkPacket.data[1], syslinkPacket.data[2], syslinkPacket.data[3]);
			} else if (syslinkPacket.type == 0x05) { //Charging Mode
				if (currentOpMode != ChargingMode) {
					currentOpMode = ChargingMode;
                                        
				}
			} else if (syslinkPacket.type == 0x06) {
				if (currentOpMode != NormalMode) {
					currentOpMode = NormalMode;
					LedSeqRun(FlyingRemoteCon);
				}
			}
			/* Clear packet container before able to recieve new packet */
			memset(&syslinkPacket, 0, sizeof(syslinkPacket));
			uartDataReceived = 0;
		}

		//If not getting control packet for more than 100ms, shutdown motors
		if (HAL_GetTick() - cmd_timeout_tickcount > 100) {
			cmdsetpoint.thrust = 0;
			cmdsetpoint.velocity.z = 0;
			cmdsetpoint.attitude.yaw = getYaw();
			cmdSetPoint(&cmdsetpoint);
		}
		task_tickcount = HAL_GetTick();
	}
}

void PM_task()
{
	static uint32_t tick = 0;
	if (HAL_GetTick() - tick >= 500) {
		if (Vbatt < 3.65) {
			if (CurrentLedSeq() != BatteryLow)
				LedSeqRun(BatteryLow);
		}
		tick = HAL_GetTick();
	}
}

void OperatingMode_task()
{
    
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
	SEGGER_RTT_printf(0, "HAL Init [OK]\n");
	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */
	SEGGER_RTT_printf(0, "SystemClock Config [OK]\n");
	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_TIM2_Init();
	MX_TIM3_Init();
	MX_TIM4_Init();
	MX_I2C3_Init();
	MX_USART6_UART_Init();
	MX_I2C1_Init();
	MX_SPI1_Init();
	MX_USART3_UART_Init();
	/* USER CODE BEGIN 2 */
	SEGGER_RTT_printf(0, "Peripheral Init [OK]\n");

	bool pass = true;
	LED_Init();
	uartsyslinkInit();
	sensorsInit();
	ControllerInit();
	MotorPowerInit();
	//LED_1_RED_GPIO_Port->OTYPER |= GPIO_OTYPER_OT2;
	//    while (1)
	//    {
	//    HAL_GPIO_WritePin(LED_1_RED_GPIO_Port,LED_1_RED_Pin,GPIO_PIN_SET);
	//    HAL_Delay(500);
	//    HAL_GPIO_WritePin(LED_1_RED_GPIO_Port,LED_1_RED_Pin,GPIO_PIN_RESET);
	//    HAL_Delay(500);
	//    }
	int8_t status;
	vl53l0C.I2cDevAddr = 0x52;
	vl53l0C.comms_type = I2C;
	vl53l0C.comms_speed_khz = 100;
	//for some reason "typedef VL53L0X_Dev_t* VL53L0X_DEV" object doesn't pass value correctly
	//use "VL53L0X_Dev_t" object instead
	status = VL53L0X_DataInit(&vl53l0C);
	if (status == 0)
		SEGGER_RTT_printf(0, "VL53L0C Init [OK]\n", status);
	else
		SEGGER_RTT_printf(0, "VL53L0C Init [FAILED] \n", status);
	status = VL53L0X_GetDeviceInfo(&vl53l0C, &vl53l0cDeviceInfo);
	status = VL53L0X_StaticInit(&vl53l0C);

	status = VL53L0X_PerformRefSpadManagement(&vl53l0C, &refSpadCount, &isApertureSpads);

	status = VL53L0X_PerformRefCalibration(&vl53l0C, &VhvSettings, &PhaseCal);

	status = VL53L0X_SetDeviceMode(&vl53l0C, VL53L0X_DEVICEMODE_CONTINUOUS_RANGING);
	//SEGGER_RTT_printf(0, "status = %d \n", status);

	status = VL53L0x_configSensor(&vl53l0C, VL53L0X_SENSE_LONG_RANGE);
	//SEGGER_RTT_printf(0, "status = %d \n", status);

	uint32_t measurementtime = HAL_GetTick();
	status = VL53L0X_PerformSingleRangingMeasurement(&vl53l0C, &testdata);
	measurementtime = HAL_GetTick() - measurementtime;
	if (status == 0) {
		SEGGER_RTT_printf(0, "Measured Z range once: %d mm, in %d ms \n", testdata.RangeMilliMeter, measurementtime);
		SEGGER_RTT_printf(0, "status = %d \n", status);
	} else {
		SEGGER_RTT_printf(0, "Z range measurement [Failed] \n", status);
	}

	if (status == 0) {
		status = VL53L0X_SetDeviceMode(&vl53l0C, VL53L0X_DEVICEMODE_CONTINUOUS_RANGING);
		SEGGER_RTT_printf(0, "status = %d \n", status);

		status = VL53L0X_StartMeasurement(&vl53l0C);
		SEGGER_RTT_printf(0, "status = %d \n", status);
	}
	uint8_t newdataRdy = 0;
	uint8_t newdatatime = HAL_GetTick();
	while (1) //VL53L0x test loop.
	{
		break;
		status = VL53L0X_GetMeasurementDataReady(&vl53l0C, &newdataRdy);
		if (newdataRdy && status == 0) {
			newdataRdy = 0;
			newdatatime = HAL_GetTick() - newdatatime;
			VL53L0X_GetRangingMeasurementData(&vl53l0C, &testdata);
			SEGGER_RTT_printf(0, "Range=%d mm, in %d ms ", testdata.RangeMilliMeter, newdatatime);
			if (testdata.RangeStatus != 0)
				SEGGER_RTT_printf(0, " Invalid data");
			SEGGER_RTT_printf(0, "\n");
			newdatatime = HAL_GetTick();
			VL53L0X_ClearInterruptMask(&vl53l0C, 0);
		}
	}

	//lp55231_Init();

	//ModemInit();

	pass &= LEDTest();
	pass &= uartsyslinkTest();
	pass &= sensorInitTest();
	pass &= controllerTest();
	pass &= MotorPowerTest();

	/* handle specific failed tests */
	if (pass != true) {
		if (sensorInitTest() == false) {
			pass &= sensor_I2C_reInit();
		}
		//test again after handling failed tests
		pass = true;
		pass &= LEDTest();
		pass &= uartsyslinkTest();
		pass &= sensorInitTest();
		pass &= controllerTest();
		pass &= MotorPowerTest();
	}

	//PM init
	while (1) {

		if (uartDataReceived) {
			if (syslinkPacket.type == 0x03) {
				for (int i = 0; i < 4; i++)
					bytes2afloat.bytes[i] = syslinkPacket.data[i];
				Vbatt = bytes2afloat.afloat;
				SEGGER_RTT_printf(0, "Init Vbatt = %d mV\n", (int)(Vbatt * 1000));
			}
			if (syslinkPacket.type == 0x04 ||
			    syslinkPacket.type == 0x05 ||
			    syslinkPacket.type == 0x06) {
				if (syslinkPacket.type == 0x04)
					currentOpMode = TestMode1;
				else if (syslinkPacket.type == 0x05)
					currentOpMode = ChargingMode;
				else if (syslinkPacket.type == 0x06)
					currentOpMode = NormalMode;
			}
			uartDataReceived = 0;
		}

		if (currentOpMode == NormalMode && Vbatt != 0) {
			if (Vbatt < LOW_BATT_THRESHOLD) {
				if (CurrentLedSeq() != BatteryLow) {
					LedSeqRun(BatteryLow);
					SEGGER_RTT_printf(0, "Battery LOW [ERROR]\n");
				}
			} else {
				break;
			}
		} else if (currentOpMode == ChargingMode) {
			if (CurrentLedSeq() != Charging)
				LedSeqRun(Charging);
		}
		LED_task();
	}

	//TODO:test, don't do sensor test when no battery. usb power can't drive opticalflow board, causing sensor reading problem
	if (sensorInitTest()) {
		SEGGER_RTT_printf(0, "Calibrating senors...\n");
		LedSeqRun(IMUcalibrating);
		uint32_t timer = HAL_GetTick();
		while (sensorCalibTest() != true) {
			LED_task();
			sensorDataUpdate();
			if (HAL_GetTick() - timer > 15000) {
				SEGGER_RTT_printf(0, "Calibrating senors timeout [ERROR]\n");
				break;
			}
		}
	}
	pass &= sensorCalibTest();

	if (pass != true) {
		SEGGER_RTT_printf(0, "System init failed [ERROR]\n");
		LedSeqRun(SystemInitFailed);
		while (1) {
			LED_task();
		}
	}
	SEGGER_RTT_printf(0, "Calibrated sensors [OK]\n");
	SEGGER_RTT_printf(0, "System Initialized [OK]\n");
	LedSeqRun(InitSuccess);
	LedSeqRun(FlyingRemoteCon);

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1) {
		Stabilizer_task(1); //1000Hz

		Syslink_task(1); //1000Hz

		LED_task();

		PM_task();

		OperatingMode_task();
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
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLM = 8;
	RCC_OscInitStruct.PLL.PLLN = 128;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 4;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}
	/** Initializes the CPU, AHB and APB busses clocks 
  */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK) {
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
	SEGGER_RTT_printf(0, "ERROR_HANDLER!\n");
	while (1)
		;
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
     tex: SEGGER_RTT_printf(0, "Wrong parameters value: file %s on line %d\r\n", file, line) */
	/* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/