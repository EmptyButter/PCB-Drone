

#include "LED_ops.h"
#include "main.h"



void LED_onboard_blink(uint16_t period){
	static uint32_t funcTick = 0;
	if(HAL_GetTick() - funcTick >= period){
		HAL_GPIO_TogglePin(Onboard_LED_GPIO_Port, Onboard_LED_Pin);
		funcTick = HAL_GetTick();
	}
}
