#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nrf.h"
#include "nrf_delay.h"
#include "nrf_drv_adc.h"
#include "nrf_drv_common.h"
#include "nrf_gpio.h"
#include "nrf_systick.h"

#include "nrf_error.h"
#include "nrf_esb.h"
#include "nrf_esb_error_codes.h"

#include "pm.h"
#include "syslink.h"
#include "systick.h"
#include "uart.h"

#include "pinout.h"

#define BUTTER_DEBUG

nrf_esb_payload_t rx_payload;
nrf_esb_payload_t tx_payload;

static struct syslinkPacket sysPacket;

uint8_t received = 0;
uint8_t transmitted = 0;

/*private function declaration
*
*/
void Uart_test_loop();

/*private function prototype
*
*/
void gpio_init(void)
{
	nrf_gpio_cfg_input(LED_PIN, GPIO_PIN_CNF_PULL_Pullup); //use pull up voltage to light the led

	nrf_gpio_cfg_output(VEN_PIN); //enable VCC while using only battery
	nrf_gpio_pin_clear(VEN_PIN);

	nrf_gpio_cfg_output(VBATT_SINK_PIN); //enable battery sink
	nrf_gpio_cfg(
	    VBATT_SINK_PIN,
	    NRF_GPIO_PIN_DIR_OUTPUT,
	    NRF_GPIO_PIN_INPUT_DISCONNECT,
	    NRF_GPIO_PIN_NOPULL,
	    NRF_GPIO_PIN_S0S1,
	    NRF_GPIO_PIN_NOSENSE);

	nrf_gpio_cfg_input(BUTTON_PIN, GPIO_PIN_CNF_PULL_Pullup); //enable button

#ifdef BUTTER_DEBUG
	printf("GPIO initialized.\n");
#endif
}

void clocks_start(void)
{
	NRF_CLOCK->EVENTS_HFCLKSTARTED = 0;
	NRF_CLOCK->TASKS_HFCLKSTART = 1;
	while (NRF_CLOCK->EVENTS_HFCLKSTARTED == 0)
		;
}

void nrf_esb_event_handler(nrf_esb_evt_t const *p_event)
{
	switch (p_event->evt_id) {
	case NRF_ESB_EVENT_TX_SUCCESS:
		transmitted = 1;
		printf("TX_SUCCESS\n");
		break;
	case NRF_ESB_EVENT_TX_FAILED:
		printf("TX_FAILED\n");
		break;
	case NRF_ESB_EVENT_RX_RECEIVED:
		if (nrf_esb_read_rx_payload(&rx_payload) == NRF_SUCCESS) {
			for (int i = 0; i < rx_payload.length; i++)
				printf("%hu, ", rx_payload.data[i]);
			printf("\n");
		}
		received = 1;
		break;
	}
}

uint32_t esb_init_txrx(void)
{
	uint32_t err_code;
	uint8_t base_addr_0[4] = {0xE6, 0xE5, 0xE4, 0xE3};
	uint8_t base_addr_1[4] = {0xC2, 0xC2, 0xC2, 0xC2};
	uint8_t addr_prefix[8] = {0xE7, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8};
	nrf_esb_config_t nrf_esb_config = NRF_ESB_DEFAULT_CONFIG;
	nrf_esb_config.bitrate = NRF_ESB_BITRATE_1MBPS;
	nrf_esb_config.mode = NRF_ESB_MODE_PTX;
	nrf_esb_config.event_handler = nrf_esb_event_handler;
	nrf_esb_config.crc = NRF_ESB_CRC_16BIT;
	nrf_esb_config.tx_mode = NRF_ESB_TXMODE_AUTO;
	nrf_esb_config.retransmit_delay = 250;
	nrf_esb_config.retransmit_count = 3,

	nrf_esb_config.payload_length = 31;		      //for receiving only.
	nrf_esb_config.protocol = NRF_ESB_PROTOCOL_ESB_NOACK; //added protocol to comm with nRF24l01
	nrf_esb_config.selective_auto_ack = true;	      //not relevant in this project.

	nrf_esb_set_rf_channel(80);

	err_code = nrf_esb_init(&nrf_esb_config);
	err_code = nrf_esb_set_base_address_0(base_addr_0);
	err_code = nrf_esb_set_base_address_1(base_addr_1);
	err_code = nrf_esb_set_prefixes(addr_prefix, 8);

	//  RF51:length = RF24:length - 1
	tx_payload.length = 31;
	tx_payload.noack = true;
	tx_payload.data[0] = 5;
	tx_payload.data[1] = 6;
	tx_payload.data[2] = 7;

	printf("esb initialized.\n");
	return err_code;
}

void Switch_Task()
{
	if (nrf_gpio_pin_read(BUTTON_PIN) == 1) {
		nrf_gpio_pin_set(VEN_PIN);
	} else {
		if (!pmIsCharging())
			nrf_gpio_pin_clear(VEN_PIN);
	}
}

void Radio_Task()
{
	if (received) {
		received = 0;
		if (rx_payload.data[0] & 0x01 == 1) {
			memset(&sysPacket, 0, sizeof(sysPacket)); //clear packet,before loading.
			printf("Radio Packet Receievd. Type: command\n");
			sysPacket.type = SYSLINK_RADIO_COMMAND;
			sysPacket.length = rx_payload.data[1]; //use second data byte as data length.
			memcpy(sysPacket.data, &rx_payload.data[2], sysPacket.length);
			//sysPacket.data[1] = rx_payload.rssi;
			syslinkSend(&sysPacket);
		}
		if (transmitted) //not implemented yet
		{
			transmitted = 0;
			nrf_esb_start_rx();
		}
	}
}

void PM_Task()
{
	pmProcess();
}
/* radio packet format:
 * +--------+---------+=====================+
 * |  TYPE  | RESERVE | DATA                |   
 * +--------+---------+=====================+
 * 
 * - Type and Reserve are uint8_t
 * - data is uint8_t
 * - packet long 31 bytes
 */

/*********************************************************************
 *
 *       main()
 *
 *  Function description
 *   Application entry point. 
 */
int main(void)
{
	gpio_init();
	clocks_start();
	pmInit();
	esb_init_txrx();
	uartInit();

	nrf_esb_start_rx();
	systickInit();
	while (1) {
		//Uart_test_loop();
		Radio_Task();
		Switch_Task();
		PM_Task();
	}
}

void Uart_test_loop() //packet length = data length + 6
{
	sysPacket.type = 0x01;
	sysPacket.length = 8;
	sysPacket.data[0] = 1;
	sysPacket.data[1] = 2;
	sysPacket.data[2] = 3;
	for (int i = 3; i < sysPacket.length - 1; i++) {
		sysPacket.data[i] = i - 2;
	}
	while (1) {
		bool ret;
		ret = syslinkSend(&sysPacket);
		printf("syslinkSend:%u\n", ret);
		nrf_delay_ms(500);
	}
}
/*************************** End of file ****************************/