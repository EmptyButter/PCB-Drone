#ifndef __UART_H__
#define __UART_H__

#include <stdbool.h>

void uartInit();

void uartDeinit();

void uartPuts(char* string);

void uartSend(char* data, int len);

void uartPutc(char c);

bool uartIsDataReceived();

char uartGetc();

#endif //__UART_H__