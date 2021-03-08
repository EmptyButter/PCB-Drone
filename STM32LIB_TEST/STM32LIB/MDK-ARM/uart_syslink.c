#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "SEGGER_RTT.h"
#include "stm32f4xx.h"
#include "uart_syslink.h"

static bool isInit = false;

volatile syslinkPacket_t syslinkPacket = {0};
static volatile uint8_t cksum1 = 0;
static volatile uint8_t cksum2 = 0;
static volatile uint8_t dataIndex = 0;
extern UART_HandleTypeDef huart6;

void uartsyslinkInit(void)
{
    if (HAL_UART_GetState(&huart6) != HAL_UART_STATE_READY)
    {
        printf("syslinkInit: uart not ready\n");
        return;
    }
    else
    {
        printf("syslinkInit: uart ready\n");
        //        USART6->CR1 |= USART_CR1_RXNEIE_Msk;
        __HAL_UART_ENABLE_IT(&huart6, UART_IT_RXNE);
        if (__HAL_UART_GET_IT_SOURCE(&huart6, UART_IT_RXNE))
        {
            printf("syslink uart receive interrupt enabled.\n");
        }
        else
        {
            printf("syslink uart receive interrupt not enabled!\n");
        }
    }
}

void uartsyslinkHandleDataFromISR(uint8_t c)
{
    
    switch (rxState)
    {
    case state_first_start:
        rxState = (c == START_BYTE1) ? state_second_start : state_first_start;
        break;
    case state_second_start:
        rxState = (c == START_BYTE2) ? state_type : state_first_start;
        break;
    case state_type:
    printf("%d", c);
        cksum1 = c;
        cksum2 = cksum1;
        syslinkPacket.type = c;
        rxState = state_length;
        break;
    case state_length:
        if (c <= SYSLINK_MTU)
        {
            syslinkPacket.length = c;
            cksum1 += c;
            cksum2 += cksum1;
            dataIndex = 0;
            rxState = state_data;
        }
        else
        {
            rxState = state_first_start;
        }
        break;
    case state_data:
        syslinkPacket.data[dataIndex] = c;
        cksum1 += c;
        cksum2 += cksum1;
        dataIndex++;
        if (dataIndex == syslinkPacket.length)
        {
            rxState = state_cksum1;
        }
        break;
    case state_cksum1:
        if (cksum1 == c)
        {
            rxState = state_cksum2;
        }
        else
        {
            rxState = state_first_start;
        }
        break;
    case state_cksum2:
        if (cksum2 == c)
        {

            rxState = state_first_start;
        }
        else
        {
            rxState = state_first_start;
        }
        break;
    default:
        printf("uartsyslinkHandleDateFromISR() error! default reached.\n");
        break;
    }
}

void uartsyslinkIsr(void)
{
    if (USART6->SR & USART_SR_RXNE)
    {
        uint8_t rxDataFromInterrupt = (uint8_t)(USART6->DR & 0xFF);
        uartsyslinkHandleDataFromISR(rxDataFromInterrupt);
    }
    else
    {
        asm volatile(""
                     : "=m"(USART6->SR)
                     : "r"(USART6->SR)); // force non-optimizable reads
        asm volatile(""
                     : "=m"(USART6->DR)
                     : "r"(USART6->DR)); // of these two registers
    }
}
//define in stm32f4xx_it.c
//void __attribute__((used)) USART6_IRQHandler(void)
//{
//    uartsyslinkIsr();
//}