#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "stm32f4xx_hal.h"

#include "LED_sequence.h"
#include "main.h"

static bool isInit = false;

enum ledNo_t {
	led1 = 0,
	led2,
	led3,
	led4,
	ledblue
};

static ledSequence_t ledSequence;
static bool isBusy = false;
static seqQ_t seq_Q = {0};

extern float Vbatt;

void led_write(enum ledNo_t led, const char *string)
{
	GPIO_PinState state;
	if (strcmp(string, "on") == 0) {
		state = GPIO_PIN_RESET;
	} else if (strcmp(string, "off") == 0) {
		state = GPIO_PIN_SET;
	}

	switch (led) {
	case led1:
		HAL_GPIO_WritePin(LED_1_RED_GPIO_Port, LED_1_RED_Pin, state);
		break;
	case led2:
		HAL_GPIO_WritePin(LED_2_GREEN_GPIO_Port, LED_2_GREEN_Pin, state);
		break;
	case led3:
		HAL_GPIO_WritePin(LED_3_RED_GPIO_Port, LED_3_RED_Pin, state);
		break;
	case led4:
		HAL_GPIO_WritePin(LED_4_GREEN_GPIO_Port, LED_4_GREEN_Pin, state);
		break;
	case ledblue:
		HAL_GPIO_WritePin(LED_BLUE_GPIO_Port, LED_BLUE_Pin, state);
		break;
	default:
		SEGGER_RTT_printf(0, "Led write [error].\n");
		break;
	}
}

void led_toggle(enum ledNo_t led)
{
	switch (led) {
	case led1:
		HAL_GPIO_TogglePin(LED_1_RED_GPIO_Port, LED_1_RED_Pin);
		break;
	case led2:
		HAL_GPIO_TogglePin(LED_2_GREEN_GPIO_Port, LED_2_GREEN_Pin);
		break;
	case led3:
		HAL_GPIO_TogglePin(LED_3_RED_GPIO_Port, LED_3_RED_Pin);
		break;
	case led4:
		HAL_GPIO_TogglePin(LED_4_GREEN_GPIO_Port, LED_4_GREEN_Pin);
		break;
	case ledblue:
		HAL_GPIO_TogglePin(LED_BLUE_GPIO_Port, LED_BLUE_Pin);
		break;
	default:
		SEGGER_RTT_printf(0, "Led write [error].\n");
		break;
	}
}

void LED_Init()
{
	led_write(led1, "off");
	led_write(led2, "off");
	led_write(led3, "off");
	led_write(led4, "off");
	led_write(ledblue, "on");

	isInit = true;
}

void seq_IMUcalibriting()
{
	isBusy = true;
	static int i = 0;
	static uint32_t tick = 0;
	if (HAL_GetTick() - tick > 200) {
		led_write(i, "on");
		if (i > 0)
			led_write(i - 1, "off");
		else
			led_write(3, "off");
		i++;
		i = i == 4 ? 0 : i;
		tick = HAL_GetTick();
		isBusy = false;
	}
}

//Note: Delay in this function
void seq_SystemInitFailed()
{

	isBusy = true;
	static bool RunOnce = false;
	if (!RunOnce) {
		HAL_Delay(10);
		led_write(led2, "off");
		led_write(led4, "off");
		led_write(ledblue, "off");
		HAL_Delay(10);
		RunOnce = true;
	}

	static uint32_t tick = 0;
	if (HAL_GetTick() - tick >= 1000) {
		led_toggle(led1);
		led_toggle(led3);
		tick = HAL_GetTick();
		isBusy = false;
	}
}

//Note: Delay in this function
void seq_InitSuccess()
{

	isBusy = true;
	static bool RunOnce = false;
	if (!RunOnce) {
		RunOnce = true;
		led_write(led1, "off");
		led_write(led2, "off");
		led_write(led3, "off");
		led_write(led4, "off");
		led_write(ledblue, "off");

		for (int i = 0; i < 4; i++) {
			HAL_Delay(100);
			led_toggle(led1);
			led_toggle(led2);
			led_toggle(led3);
			led_toggle(led4);
		}
	}
	isBusy = false;
}

void seq_FlyingRemoteCon()
{

	isBusy = true;

	static uint32_t tick = 0;
	static uint32_t tick2 = 0;
	static uint8_t flag = 0;

	static bool RunOnce = false;
	if (!RunOnce) {
		RunOnce = true;
		led_write(led1, "off");
		led_write(led2, "on");
		led_write(led3, "off");
		led_write(led4, "on");
		led_write(ledblue, "off");
		tick = HAL_GetTick();
	}
	if (HAL_GetTick() - tick >= 3000) {
		led_toggle(led1);
		led_toggle(led3);
		tick = HAL_GetTick();
		tick2 = HAL_GetTick();
		flag = 1;
	}
	if (HAL_GetTick() - tick2 >= 25 && flag == 1) {
		led_toggle(led1);
		led_toggle(led3);
		flag = 0;
		isBusy = false;
	}
}

void seq_BatteryLow()
{
	isBusy = true;
	static bool RunOnce = false;
	if (!RunOnce) {

		RunOnce = true;
		led_write(led1, "on");
		led_write(led2, "off");
		led_write(led3, "on");
		led_write(led4, "off");
		led_write(ledblue, "off");
	}
	isBusy = false;
}

void seq_Charging()
{
	isBusy = true;
	static uint32_t tick = 0;
	static bool RunOnce = false;
	int blinkperiod = 0;

	if (!RunOnce) {
		RunOnce = true;
		led_write(led2, "on");	//green
		led_write(led4, "on");	//green
		led_write(led1, "off"); //red
		led_write(led3, "off"); //red
	}

	SEGGER_RTT_printf(0, "Vbatt %d V\n", (int)(Vbatt * 100));
	if (Vbatt < 4.15) {
		blinkperiod = (-300) * (int)Vbatt + 1460;

		if (HAL_GetTick() - tick > blinkperiod) {
			led_toggle(led2); //green
			led_toggle(led4); //green

			tick = HAL_GetTick();
			isBusy = false;
		}
	} else {
		led_write(led2, "on"); //green
		led_write(led4, "on"); //green
		isBusy = false;
	}
}

static void pushQ(ledSequence_t seq)
{
	for (int i = seq_Q.number; i > 0; i--) {
		seq_Q.item[i] = seq_Q.item[i - 1];
	}
	seq_Q.item[0] = seq;
	seq_Q.number++;
	if (seq_Q.number > 1) {
		seq_Q.index++;
	}
}

static void Qhandler()
{

	if (seq_Q.number > 1) //more than one item in the queue.
	{
		if (!isBusy) //no sequence is currently running. Run next item.
		{
			ledSequence = seq_Q.item[seq_Q.index];
			seq_Q.item[seq_Q.index] = 0;
			seq_Q.number--;
			seq_Q.index--;
		}
	} else //only one item in the queue. Keep running that item.
	{
		ledSequence = seq_Q.item[seq_Q.index];
	}
}

void LED_task(void)
{
	static uint32_t taskTick = 0;
	if (HAL_GetTick() - taskTick >= 0) {
		Qhandler();
		switch (ledSequence) {
		case IMUcalibrating:
			seq_IMUcalibriting();
			break;
		case SystemInitFailed:
			seq_SystemInitFailed();
			break;
		case InitSuccess:
			seq_InitSuccess();
			break;
		case FlyingRemoteCon:
			seq_FlyingRemoteCon();
			break;
		case BatteryLow:
			seq_BatteryLow();
			break;
		case Charging:
			seq_Charging();
			break;
		}
		taskTick = HAL_GetTick();
	}
}

void LedSeqRun(ledSequence_t seq)
{
	pushQ(seq);
}

ledSequence_t CurrentLedSeq()
{
	return ledSequence;
}

bool LEDTest()
{
	return isInit;
}