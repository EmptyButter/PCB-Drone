#include <string.h>

#include "pinout.h"
#include "pm.h"

#include "nrf.h"
#include "nrf_drv_adc.h"
#include "nrf_gpio.h"

#include "syslink.h"
#include "systick.h"

#define ADC_BUFFER_SIZE 10									     /**< Size of buffer for ADC samples.  */
static nrf_adc_value_t adc_buffer[ADC_BUFFER_SIZE];						     /**< ADC buffer. */
static nrf_drv_adc_channel_t m_channel_config = NRF_DRV_ADC_DEFAULT_CHANNEL(NRF_ADC_CONFIG_INPUT_2); /**< Channel instance. Default configuration used. */

static struct syslinkPacket sysPacket;

union {
	float ival;
	uint8_t bval[4];
} uint32asBytes;

static float Vbatt = 0;

static void adc_event_handler(nrf_drv_adc_evt_t const *p_event)
{
	if (p_event->type == NRF_DRV_ADC_EVT_DONE) {
		uint32_t i;
		for (i = 0; i < p_event->data.done.size; i++) {
			printf("Current sample value: %d\r\n", p_event->data.done.p_buffer[i]);
		}
	}
}

void pm_adc_init()
{
	ret_code_t ret_code;
	nrf_drv_adc_config_t config = NRF_DRV_ADC_DEFAULT_CONFIG;

	ret_code = nrf_drv_adc_init(&config, adc_event_handler);

	m_channel_config.config.config.input = NRF_ADC_CONFIG_SCALING_INPUT_TWO_THIRDS;
	nrf_drv_adc_channel_enable(&m_channel_config);

	//discard first read, which for some reason not correct.
	nrf_adc_value_t result;
	for (int i = 0; i < 500; i++)
		nrf_drv_adc_sample_convert(&m_channel_config, &result);
}

void pmInit()
{

	nrf_gpio_cfg_output(VEN_PIN); //enable VCC even if VUSB is not present
	nrf_gpio_pin_set(VEN_PIN);

	nrf_gpio_cfg_output(VBATT_SINK_PIN); //enable battery sink
	nrf_gpio_cfg(
	    VBATT_SINK_PIN,
	    NRF_GPIO_PIN_DIR_OUTPUT,
	    NRF_GPIO_PIN_INPUT_DISCONNECT,
	    NRF_GPIO_PIN_NOPULL,
	    NRF_GPIO_PIN_S0S1,
	    NRF_GPIO_PIN_NOSENSE);

	nrf_gpio_cfg_input(PM_CHG_PIN, NRF_GPIO_PIN_PULLUP);
	nrf_gpio_cfg_input(PM_PGOOD_PIN, NRF_GPIO_PIN_PULLUP);

	nrf_gpio_cfg_output(PM_CHG_EN_PIN); //enable battery charging enable
	nrf_gpio_cfg_output(PM_EN1_PIN);
	nrf_gpio_cfg_output(PM_EN2_PIN);

	//nrf_gpio_cfg_input(PM_EN1_PIN, NRF_GPIO_PIN_PULLUP);
	//nrf_gpio_cfg_input(PM_EN2_PIN, NRF_GPIO_PIN_PULLUP);

	pm_adc_init();
}

void Debugfunction()
{
	if (pmUSBPower()) {
		printf("USBPower detected.\n");
	} else {
		printf("USBPower not detected.\n");
	}
	if (pmIsCharging()) {
		printf("pmIsCharging.\n");
	} else {
		printf("pmIs Not Charging.\n");
	}
}

void pmProcess()
{
	static uint32_t msTick = 0;
	if (systick_GetTick_ms() - msTick >= 100) //100ms period (10 Hz)
	{
		/* Read battery voltage */
		nrf_adc_value_t result;
		for (int i = 0; i < 5; i++)
			nrf_drv_adc_sample_convert(&m_channel_config, &result);
		Vbatt = result / 1023.0f * 1.2f * 9.0f * 0.5f;

		/* Send the voltage data to STM32 through UART */
		uint32asBytes.ival = Vbatt;
		//printf("sample %u , %.2fV \n", result, Vbatt);
		printf("Battery %.2fV \n", Vbatt);
		memset(&sysPacket, 0, sizeof(sysPacket)); //clear packet,before loading.
		sysPacket.type = SYSLINK_PM_VBATT;
		sysPacket.length = sizeof(float);
		memcpy(sysPacket.data, uint32asBytes.bval, sysPacket.length);
		//sysPacket.data[1] = rx_payload.rssi;
		syslinkSend(&sysPacket);

		/* Battery charging management */
		Debugfunction();
		ChargingManagement();
		printf("\n\n");

		msTick = systick_GetTick_ms();
	}
}

void ChargingManagement()
{
	if (isBattOK()) {
		if (pmUSBPower() &&
		    nrf_gpio_pin_read(BUTTON_PIN) == 0) {
			//USB power present, Battery good. Charging&TestMode2.
			EnableCharging();
			nrf_gpio_pin_set(VEN_PIN); //start STM32
			OperatingMode(ChargingMode);
		} else {
			//USB power not present, Battery good. NormalMode.
			DisableCharging();
			OperatingMode(NormalMode);
		}
	} else {
		//USB power present, Battery no good, TestMode1.
		OperatingMode(TestMode1);
	}
}

void OperatingMode(enum OpMode mode)
{
	memset(&sysPacket, 0, sizeof(sysPacket)); //clear packet,before loading.
	switch (mode) {
	case TestMode1:
		sysPacket.type = SYSLINK_OPMODE_TEST1;
		break;

	case ChargingMode:
		sysPacket.type = SYSLINK_OPMODE_CHARGING;
		break;

	case NormalMode:
		sysPacket.type = SYSLINK_OPMODE_NORMAL;
		break;
	}
	sysPacket.length = 1;
	syslinkSend(&sysPacket);
}

bool isBattOK()
{
	return Vbatt >= 3.1;
}

bool pmUSBPower()
{
	return nrf_gpio_pin_read(PM_PGOOD_PIN) == 0;
}

bool pmIsCharging()
{
	return nrf_gpio_pin_read(PM_CHG_PIN) == 0;
}

void EnableCharging()
{
	//ILIM 1.1A fast charge
        nrf_gpio_pin_clear(PM_EN1_PIN);
	nrf_gpio_pin_set(PM_EN2_PIN);
	
	//Enable Charging
	nrf_gpio_pin_clear(PM_CHG_EN_PIN);
}

void DisableCharging()
{
	//Disable Charging
	nrf_gpio_pin_set(PM_CHG_EN_PIN);
	//USB suspend mode
	nrf_gpio_pin_clear(PM_EN1_PIN);
	nrf_gpio_pin_set(PM_EN2_PIN);
}