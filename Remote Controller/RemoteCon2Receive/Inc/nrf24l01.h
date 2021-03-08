/*
MIT License

Copyright (c) 2016 D. Nesvera

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef NRF24L01_H
#define NRF24L01_H

#ifdef __cplusplus
 extern "C" {
#endif

#include "stm32f1xx_hal.h"
#include "stm32f1xx_hal_spi.h"

/**
 * @brief  Transmission status enumeration
 */
typedef enum {
	NRF24L01_Transmit_Status_Lost = 0x00,   /*!< Message is lost, reached maximum number of retransmissions */
	NRF24L01_Transmit_Status_Ok = 0x01,     /*!< Message sent successfully */
	NRF24L01_Transmit_Status_Sending = 0xFF /*!< Message is still sending */
} NRF24L01_Transmit_Status_t;

/**
 * @brief  Data rate enumeration
 */
typedef enum {
	NRF24L01_DataRate_2M,  /*!< Data rate set to 2Mbps */
	NRF24L01_DataRate_1M,  /*!< Data rate set to 1Mbps */
	NRF24L01_DataRate_250k /*!< Data rate set to 250kbps */
} NRF24L01_DataRate_t;

/**
 * @brief  Output power enumeration
 */
typedef enum {
	NRF24L01_OutputPower_M18dBm,		/*!< Output power set to -18dBm */
	NRF24L01_OutputPower_M12dBm, 		/*!< Output power set to -12dBm */
	NRF24L01_OutputPower_M6dBm,  		/*!< Output power set to -6dBm */
	NRF24L01_OutputPower_0dBm    		/*!< Output power set to 0dBm */
} NRF24L01_OutputPower_t;

/**
 * @brief  CRC encoding scheme enumeration

 */
typedef enum{
	NRF24L01_CRC_Disable = 0,
	NRF24L01_CRC_8,
	NRF24L01_CRC_16
} NRF24L01_CrcLength_t;

/**
 * @brief  Struct of the NRF24L01 pins
 */
typedef struct {
	GPIO_TypeDef* GPIOx;
	uint16_t GPIO_Pin;	
} PIN_t;

typedef struct {
	PIN_t CE;
	PIN_t CSN;
	PIN_t SCK;
	PIN_t MOSI;
	PIN_t MISO;
	PIN_t IRQ;
} NRF24L01_Pins_t;

/* Gets interrupt status from device */
#define NRF24L01_GET_INTERRUPTS     TM_NRF24L01_GetStatus()

/* Interrupt masks */
#define NRF24L01_IRQ_DATA_READY     0x40 /*!< Data ready for receive */
#define NRF24L01_IRQ_TRAN_OK        0x20 /*!< Transmission went OK */
#define NRF24L01_IRQ_MAX_RT         0x10 /*!< Max retransmissions reached, last transmission failed */

/* NRF24L01+ registers*/
#define NRF24L01_REG_CONFIG				0x00	//Configuration Register
#define NRF24L01_REG_EN_AA				0x01	//Enable ‘Auto Acknowledgment’ Function
#define NRF24L01_REG_EN_RXADDR		0x02	//Enabled RX Addresses
#define NRF24L01_REG_SETUP_AW			0x03	//Setup of Address Widths (common for all data pipes)
#define NRF24L01_REG_SETUP_RETR		0x04	//Setup of Automatic Retransmission
#define NRF24L01_REG_RF_CH				0x05	//RF Channel
#define NRF24L01_REG_RF_SETUP			0x06	//RF Setup Register
#define NRF24L01_REG_STATUS				0x07	//Status Register
#define NRF24L01_REG_OBSERVE_TX		0x08	//Transmit observe register
#define NRF24L01_REG_RPD					0x09
#define NRF24L01_REG_RX_ADDR_P0		0x0A	//Receive address data pipe 0. 5 Bytes maximum length.
#define NRF24L01_REG_RX_ADDR_P1		0x0B	//Receive address data pipe 1. 5 Bytes maximum length.
#define NRF24L01_REG_RX_ADDR_P2		0x0C	//Receive address data pipe 2. Only LSB
#define NRF24L01_REG_RX_ADDR_P3		0x0D	//Receive address data pipe 3. Only LSB
#define NRF24L01_REG_RX_ADDR_P4		0x0E	//Receive address data pipe 4. Only LSB
#define NRF24L01_REG_RX_ADDR_P5		0x0F	//Receive address data pipe 5. Only LSB
#define NRF24L01_REG_TX_ADDR			0x10	//Transmit address. Used for a PTX device only
#define NRF24L01_REG_RX_PW_P0			0x11
#define NRF24L01_REG_RX_PW_P1			0x12
#define NRF24L01_REG_RX_PW_P2			0x13
#define NRF24L01_REG_RX_PW_P3			0x14
#define NRF24L01_REG_RX_PW_P4			0x15
#define NRF24L01_REG_RX_PW_P5			0x16
#define NRF24L01_REG_FIFO_STATUS	0x17	//FIFO Status Register
#define NRF24L01_REG_DYNPD				0x1C	//Enable dynamic payload length
#define NRF24L01_REG_FEATURE			0x1D

/* Registers default values */
#define NRF24L01_REG_DEFAULT_VAL_CONFIG				0x08
#define NRF24L01_REG_DEFAULT_VAL_EN_AA				0x3F
#define NRF24L01_REG_DEFAULT_VAL_EN_RXADDR		0x03
#define NRF24L01_REG_DEFAULT_VAL_SETUP_AW			0x03
#define NRF24L01_REG_DEFAULT_VAL_SETUP_RETR		0x03
#define NRF24L01_REG_DEFAULT_VAL_RF_CH				0x02
#define NRF24L01_REG_DEFAULT_VAL_RF_SETUP			0x0E
#define NRF24L01_REG_DEFAULT_VAL_STATUS				0x0E
#define NRF24L01_REG_DEFAULT_VAL_OBSERVE_TX		0x00
#define NRF24L01_REG_DEFAULT_VAL_RPD					0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P0_0	0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P0_1	0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P0_2	0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P0_3	0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P0_4	0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P1_0	0xC2
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P1_1	0xC2
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P1_2	0xC2
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P1_3	0xC2
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P1_4	0xC2
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P2		0xC3
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P3		0xC4
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P4		0xC5
#define NRF24L01_REG_DEFAULT_VAL_RX_ADDR_P5		0xC6
#define NRF24L01_REG_DEFAULT_VAL_TX_ADDR_0		0xE7
#define NRF24L01_REG_DEFAULT_VAL_TX_ADDR_1		0xE7
#define NRF24L01_REG_DEFAULT_VAL_TX_ADDR_2		0xE7
#define NRF24L01_REG_DEFAULT_VAL_TX_ADDR_3		0xE7
#define NRF24L01_REG_DEFAULT_VAL_TX_ADDR_4		0xE7
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P0			0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P1			0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P2			0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P3			0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P4			0x00
#define NRF24L01_REG_DEFAULT_VAL_RX_PW_P5			0x00
#define NRF24L01_REG_DEFAULT_VAL_FIFO_STATUS	0x17		//0x11 do codigo original
#define NRF24L01_REG_DEFAULT_VAL_DYNPD				0x00
#define NRF24L01_REG_DEFAULT_VAL_FEATURE			0x00

/* Commands */
#define NRF24L01_CMD_R_REGISTER          0x00
#define NRF24L01_CMD_W_REGISTER          0x20
#define NRF24L01_CMD_R_RX_PAYLOAD        0x61
#define NRF24L01_CMD_W_TX_PAYLOAD        0xA0
#define NRF24L01_CMD_FLUSH_TX            0xE1
#define NRF24L01_CMD_FLUSH_RX            0xE2
#define NRF24L01_CMD_REUSE_TX_PL         0xE3
#define NRF24L01_CMD_ACTIVATE            0x50
#define NRF24L01_CMD_R_RX_PL_WID         0x60
#define NRF24L01_CMD_W_ACK_PAYLOAD       0xA8
#define NRF24L01_CMD_W_TX_PAYLOAD_NOACK  0xB0
#define NRF24L01_CMD_NOP                 0xFF

#define NRF24L01_SPI_TIMEOUT 100
#define NRF24L01_TX_TIMEOUT 500
#define NRF24L01_RX_TIMEOUT 500

/* Configuration register*/
#define NRF24L01_MASK_RX_DR		6
#define NRF24L01_MASK_TX_DS		5
#define NRF24L01_MASK_MAX_RT	4
#define NRF24L01_EN_CRC				3
#define NRF24L01_CRCO					2
#define NRF24L01_PWR_UP				1
#define NRF24L01_PRIM_RX			0

/* RX/TX control */
#define PRX		1		// primary receiver mode
#define PTX		0		// primary transmitter mode

/* Enable auto acknowledgment*/
#define NRF24L01_ENAA_P5		5
#define NRF24L01_ENAA_P4		4
#define NRF24L01_ENAA_P3		3
#define NRF24L01_ENAA_P2		2
#define NRF24L01_ENAA_P1		1
#define NRF24L01_ENAA_P0		0

/* Enable rx addresses */
#define NRF24L01_ERX_P5			5
#define NRF24L01_ERX_P4			4
#define NRF24L01_ERX_P3			3
#define NRF24L01_ERX_P2			2
#define NRF24L01_ERX_P1			1
#define NRF24L01_ERX_P0			0

/* Setup of address width */
#define NRF24L01_AW				0 //2 bits

/* Setup of auto re-transmission*/
#define NRF24L01_ARD			4 //4 bits
#define NRF24L01_ARC			0 //4 bits

/* RF setup register*/
#define NRF24L01_PLL_LOCK			4
#define NRF24L01_RF_DR_LOW		5
#define NRF24L01_RF_DR_HIGH		3
#define NRF24L01_RF_DR				3
#define NRF24L01_RF_PWR				1 //2 bits

/* General status register */
#define NRF24L01_RX_DR			6
#define NRF24L01_TX_DS			5
#define NRF24L01_MAX_RT			4
#define NRF24L01_RX_P_NO		1 //3 bits
#define NRF24L01_TX_FULL		0

/* Transmit observe register */
#define NRF24L01_PLOS_CNT		4 //4 bits
#define NRF24L01_ARC_CNT		0 //4 bits

/* FIFO status*/
#define NRF24L01_TX_REUSE		6
#define NRF24L01_FIFO_FULL	5
#define NRF24L01_TX_EMPTY		4
#define NRF24L01_RX_FULL		1
#define NRF24L01_RX_EMPTY		0

//Dynamic length
#define NRF24L01_DPL_P0			0
#define NRF24L01_DPL_P1			1
#define NRF24L01_DPL_P2			2
#define NRF24L01_DPL_P3			3
#define NRF24L01_DPL_P4			4
#define NRF24L01_DPL_P5			5

/* Transmitter power*/
#define NRF24L01_M18DBM			0 //-18 dBm
#define NRF24L01_M12DBM			1 //-12 dBm
#define NRF24L01_M6DBM			2 //-6 dBm
#define NRF24L01_0DBM				3 //0 dBm

/* Data rates */
#define NRF24L01_2MBPS			0
#define NRF24L01_1MBPS			1
#define NRF24L01_250KBPS		2

/* Configuration */
#define NRF24L01_CONFIG			((1 << NRF24L01_EN_CRC) | (0 << NRF24L01_CRCO))

#define NRF24L01_TRANSMISSON_OK 			0
#define NRF24L01_MESSAGE_LOST   			1

#define NRF24L01_CHECK_BIT(value, bit)       (value & (1 << bit))


/**
 * @brief	Assert the CE pin
*/
void NRF24L01_CE_LOW(void);

/**
 * @brief	Assert the CE pin
*/
void NRF24L01_CE_HIGH(void);

/**
 * @brief De-assert the CSN pin
*/
void NRF24L01_CSN_LOW(void);

/**
 * @brief Assert the CSN pin
*/
void NRF24L01_CSN_HIGH(void);

/**
 * @brief	Assert bits [6] [5] [4] to clear this bits of STATUS register
 */
void NRF24L01_ClearInterrupts(void);

/**
 * @brief  Flush TX FIFO, used in TX mode
*/
void NRF24L01_FlushTx(void);

/**
 * @brief	Flush RX FIFO, used in RX mode.
 * @note 	Should not be executed during transmission of acknowledge, that is, acknowledge package
					will not be completed.
*/
void NRF24L01_FlushRx(void);

/**
 * @brief  Initializes NRF24L01 module
 * @param  channel: channel you will use for communication, from 0 to 125 eg. working frequency from 2.4 to 2.525 GHz
 * @param  payload_size: maximum data to be sent in one packet from one NRF to another.
 * @note   Maximal payload size is 32bytes
 * @param  hspi: pointer to a SPI_HandleTypeDef structure that contains
 *                the configuration information for SPI module.
 * @retval 1
 */
uint8_t NRF24L01_Init(uint8_t channel, uint8_t payload_size, SPI_HandleTypeDef *hspi, NRF24L01_Pins_t pins );

/**
 * @brief  Sets own address. This is used for settings own id when communication with other modules
 * @note   "Own" address of one device must be the same as "TX" address of other device (and vice versa),
 *         if you want to get successful communication
 * @param  *adr: Pointer to 5-bytes length array with address
 * @retval None
 */
void NRF24L01_SetRxAddress(uint8_t* adr);

/**
 * @brief  Sets address you will communicate with
 * @note   "Own" address of one device must be the same as "TX" address of other device (and vice versa),
 *         if you want to get successful communication
 * @param  *adr: Pointer to 5-bytes length array with address
 * @retval None
 */
void NRF24L01_SetTxAddress(uint8_t* adr);

/**
 * @brief  Gets number of retransmissions needed in last transmission
 * @param  None
 * @retval Number of retransmissions, between 0 and 15.
 */
uint8_t NRF24L01_GetRetransmissionsCount(void);

/**
 * @brief  Sets NRF24L01+ to TX mode
 * @note   In this mode is NRF able to send data to another NRF module
 * @param  None
 * @retval None
 */
void NRF24L01_PowerUpTx(void);

/**
 * @brief  Sets NRF24L01+ to RX mode
 * @note   In this mode is NRF able to receive data from another NRF module.
 *         This is default mode and should be used all the time, except when sending data
 * @param  None
 * @retval None
 */
void NRF24L01_PowerUpRx(void);

/**
 * @brief  Sets NRF24L01+ to power down mode
 * @note   In power down mode, you are not able to transmit/receive data.
 *         You can wake up device using @ref TM_NRF24L01_PowerUpTx() or @ref TM_NRF24L01_PowerUpRx() functions
 *				 All register values available are maintained and th SPI is kept active.
 * @param  None
 * @retval None
 */
void NRF24L01_PowerDown(void);

/**
 * @brief  Leave low-power mode
 * @param  None
 * @retval None
 */
void NRF24L01_PowerUP(void);

/**
 * @brief  Gets transmissions status
 * @param  None
 * @retval Transmission status. Return is based on @ref TM_NRF24L01_Transmit_Status_t enumeration
 */
NRF24L01_Transmit_Status_t NRF24L01_GetTransmissionStatus(void);

/**
 * @brief  Transmits data with NRF24L01+ to another NRF module
 * @param  *data: Pointer to 8-bit array with data.
 *         Maximum length of array can be the same as "payload_size" parameter on initialization
 * @retval This parameter can be a value of @ref NRF24L01_Transmit_Status_t enumeration
 */
NRF24L01_Transmit_Status_t NRF24L01_Transmit(const void *data);

/**
 * @brief  Checks if data is ready to be read from NRF24L01+
 * @param  None
 * @retval Data ready status:
 *            - 0: No data available for receive in bufferReturns
 *            - > 0: Data is ready to be collected
 */
uint8_t NRF24L01_DataReady(void);

/**
 * @brief  Gets data from NRF24L01+
 * @param  *data: Pointer to 8-bits array where data from NRF will be saved
 * @retval None
 */
void NRF24L01_GetData(uint8_t *data);

/**
 * @brief  Sets working channel
 * @note   Channel value is just an offset in units MHz from 2.4GHz
 *         For example, if you select channel 65, then operation frequency will be set to 2.465GHz.
 *				 The channel occupies a bandwidth of less than 1MHz at 250kbps and 1Mbps and a bandwidth
 *				 of less than 2MHz at 2Mbps.
 * @param  channel: RF channel where device will operate between 0 and 125
 * @retval None 
 */
void NRF24L01_SetChannel(uint8_t channel);

/**
 * @brief  Sets RF parameters for NRF24L01+
 * @param  DataRate: Data rate selection for NRF module. This parameter can be a value of @ref TM_NRF24L01_DataRate_t enumeration
 * @param  OutPwr: Output power selection for NRF module. This parameter can be a value of @ref TM_NRF24L01_OutputPower_t enumeration
 * @retval None
 */
void NRF24L01_SetRF( NRF24L01_DataRate_t DataRate, NRF24L01_OutputPower_t OutPwr);

/**
 * @brief  Sets Power Amplifier(PA) level to one of four levels.
 * @param  OutPwr: Output power selection for NRF module. This parameter can be a value of @ref TM_NRF24L01_OutputPower_t enumeration
 * @retval None
 */
void NRF24L01_SetPaLevel( NRF24L01_OutputPower_t OutPwr );

/**
 * @brief  Gets the current Power Amplifier(PA) level.
 * @retval Returns a value from the NRF24L01_OutputPower_t enum describing the current PA setting.
 */
NRF24L01_OutputPower_t NRF24L01_GetPaLevel( void );

/**
 * @brief  Set the transmission data rate
 * @param  DataRate: Data rate selection for NRF module. This parameter can be a value of @ref TM_NRF24L01_DataRate_t enumeration
 */
void NRF24L01_SetDataRate( NRF24L01_DataRate_t DataRate );

/**
 * @brief  Gets the current transmission data rate.
 * @retval Returns a value from the NRF24L01_DataRate_t enum describing the current data rate.
 */
NRF24L01_DataRate_t NRF24L01_GetDataRate( void );

/**
 * @brief  Gets NRLF+ status register value
 * @param  None
 * @retval Status register from NRF
 */
uint8_t NRF24L01_GetStatus(void);

/**
 * @brief  Gets NRLF+ status register value
 * @param  Length: length for 8bits, 16bits or disable CRC
 * @retval None
 */
void NRF24L01_SetCrcLength( NRF24L01_CrcLength_t length );

// void NRF24L01_getCrcLength( NRF24L01_CrcLength_t length );

/**
 * @brief  Test whether there are bytes available to be read
 * @note	 Use this version to discover on which pipe the message arrived.
 * @retval true(0x01) if there is a payload available, false(0x00) if there is no payload
 */
uint8_t NRF24L01_Available( uint8_t* pipe_num );

/**
 * @brief  Enable or disable auto-acknowledgment function
 * @note	 This is enabled by default, so it's only needed if you want to turn it off for some reason.
 * @param	 pipe: which pipeline you want to modify - 0xFF disable all pipes
 * @param  State: 0x00 = disable 	0x01 = enable
 * @retval None
 */
void NRF24L01_SetAutoAck( uint8_t pipe, uint8_t state );

/**
 * @brief  Test whether there was a carrier on the line for the previous listening period
 * @note	 Useful to check for interference on the current channel.
 * @retval true(0x01) if received power levels above -64dBm, false(0x00) if received power is less than -64dBm.
 */
uint8_t NRF24L01_TestCarrier(void);

/**
 * @brief  Open a pipe for writing - transmission
 * @note	 Only one pipe can be open at once, but you can change the pipe you will listen to. Do not call
 * 				 call this this while actively listening, call stopListening() fist.
 * @param  Address: 
 * @retval None
 */
void NRF24L01_OpenWritingPipe( uint8_t* address );

/**
 * @brief  Open a pipe for reading - receive
 * @note	 Up to 6 pipes can be open for reading at once.  Open all the
 *  			 reading pipes, and then call startListening().
 * @param  Number: which pipe to open, 0-5
 * @param  Address: the 40bits address of the pipe to open
 * @retval None
 */
void NRF24L01_OpenReadingPipe( uint8_t number, uint8_t* address );

/**
 * @brief  Start listening on the pipes opened for reading. - Go to Rx mode
 * @note	 Be sure to call openReadingPipe() first.  Do not call write() while
   * 			 in this mode, without first calling stopListening().  Call
   * 			 isAvailable() to check for incoming traffic, and read() to get it.
 * @retval None
 */
void NRF24L01_StartListening(void);

/**
 * @brief  Stop listening for incoming messages -  return to standby-I
 * @note	 Do this before calling write().
 * @retval None
 */
void NRF24L01_StopListening(void);

/**
 * @brief  Read the payload
 * @note	 Return the last payload received
 * @param  Data: pointer to a buffer where the data should be written
 * @retval None
 */
uint8_t NRF24L01_Read(void* data);

/**
 * @brief  Get Static payload size
 * @retval Number of bytes in the payload
 */
uint8_t NRF24L01_GetPayloadSize(void);

/**
 * @brief  Get Dynamic payload size
 * @retval Payload size of last received dynamic payload
 */
uint8_t NRF24L01_GetDynamicPayloadSize(void);

/**
 * @brief  Set the number and delay of retries upon failed submit
 * @param  delay How long to wait between each retry, in multiples of 250us,
 * max is 15.  0 means 250us, 15 means 4000us.
 * @param  count How many retries before giving up, max 15
 * @retval NONE
 */
void NRF24L01_SetRetries(uint8_t delay, uint8_t count);


#endif /* __NRF24L01_H */
