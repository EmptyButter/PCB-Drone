#include <nrf.h>

static unsigned int mstick = 0;

void TIMER1_IRQHandler()
{
    mstick++;
    NRF_TIMER1->EVENTS_COMPARE[0] = 0;
}

void systickInit()
{
    NRF_TIMER1->TASKS_CLEAR = 1;

    NRF_TIMER1->PRESCALER = 4;
    NRF_TIMER1->CC[0] = 1000;
    NRF_TIMER1->SHORTS = 1UL << TIMER_SHORTS_COMPARE0_CLEAR_Pos;
    NRF_TIMER1->INTENSET = 1UL << TIMER_INTENSET_COMPARE0_Pos;
    NVIC_SetPriority(TIMER1_IRQn, 3);
    NVIC_EnableIRQ(TIMER1_IRQn);

    NRF_TIMER1->TASKS_START = 1;
}

unsigned int systick_GetTick_ms()
{
    return mstick;
}