#ifndef __UART_SYSLINK_H__
#define __UART_SYSLINK_H__

#include <stdbool.h> 
#include "syslink.h"

void uartsyslinkInit(void);

void uartsyslinkIsr(void);

bool uartsyslinkTest(void);










#endif