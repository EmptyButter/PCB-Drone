#include "uart.h"
#include "pinout.h"
#include <nrf.h>
#include <nrf_gpio.h>
#include <stdbool.h>

static bool isInit = false;

#define Q_LENGTH 128

static char rxq[Q_LENGTH];
static int head = 0;
static int tail = 0;

static int dropped = 0;
static char dummy;

int error = 0;

void UART0_IRQHandler()
{
    int nhead = head + 1;

    NRF_UART0->EVENTS_RXDRDY = 0;

    //check if queue is not full
    if (nhead >= Q_LENGTH) nhead = 0;
    if (nhead == tail)
    {
        dummy = NRF_UART0->RXD;
        dropped++;
        return;
    }

    //push data in queue
    rxq[head++] = NRF_UART0->RXD;
    if (head >= Q_LENGTH) head = 0;
}

void uartInit()
{
    NRF_GPIO->PIN_CNF[8] &= ~GPIO_PIN_CNF_PULL_Msk;
    NRF_GPIO->PIN_CNF[8] |= (GPIO_PIN_CNF_PULL_Pulldown << GPIO_PIN_CNF_PULL_Pos);

    NRF_GPIO->PIN_CNF[UART_TX_PIN] = (NRF_GPIO->PIN_CNF[UART_TX_PIN] & (~GPIO_PIN_CNF_DRIVE_Msk)) | (GPIO_PIN_CNF_DRIVE_S0S1 << GPIO_PIN_CNF_DRIVE_Pos);

    NRF_UART0->PSELTXD = UART_TX_PIN;
    NRF_GPIO->DIRSET = 1 << UART_TX_PIN;
    NRF_GPIO->OUTSET = 1 << UART_TX_PIN;

    NRF_UART0->PSELRXD = UART_RX_PIN;
    NRF_GPIO->DIRSET = 1 << UART_RX_PIN;

    NRF_UART0->PSELRTS = UART_RTS_PIN;
    NRF_GPIO->DIRSET = 1 << UART_RTS_PIN;
    NRF_GPIO->OUTSET = 1 << UART_RTS_PIN;

    NRF_UART0->CONFIG = UART_CONFIG_HWFC_Msk;

    NRF_UART0->BAUDRATE = UART_BAUDRATE_BAUDRATE_Baud115200;

    NRF_UART0->ENABLE = UART_ENABLE_ENABLE_Enabled;

    NRF_UART0->TASKS_STARTRX = 1;

    NVIC_SetPriority(UART0_IRQn, 3);
    NVIC_EnableIRQ(UART0_IRQn);

    NRF_UART0->INTENSET = UART_INTENSET_RXDRDY_Msk;

    NRF_UART0->TASKS_STARTTX = 1;

    isInit = true;
}

void uartDeinit()
{
    NRF_UART0->TASKS_STOPRX = 1;
    NRF_UART0->TASKS_STOPTX = 1;
    NRF_UART0->ENABLE = 0;

    nrf_gpio_cfg_input(UART_TX_PIN, NRF_GPIO_PIN_NOPULL);
    nrf_gpio_cfg_input(UART_RX_PIN, NRF_GPIO_PIN_NOPULL);

    isInit = false;
}

void uartPuts(char *string)
{
    if (!isInit)
        return;

    while (*string)
    {
        uartPutc(*string++);
    }
}

void uartSend(char *data, int len)
{
    if (!isInit)
        return;

    while (len--)
    {
        uartPutc(*data++);
    }
}

void uartPutc(char c)
{
    if (!isInit)
        return;

    NRF_UART0->TXD = c;
    while (!NRF_UART0->EVENTS_TXDRDY)
        ;
    NRF_UART0->EVENTS_TXDRDY = 0;
}

char uartGetc()
{
    char c = 0;

    if (!isInit)
        return c;

    if (head != tail)
    {
        c = rxq[tail++];
        if (tail >= Q_LENGTH) tail = 0;
    }
}

bool uartIsDataReceived()
{
    if (!isInit)
        return false;

    return head != tail;
}