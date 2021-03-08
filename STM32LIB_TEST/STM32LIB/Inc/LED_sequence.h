#ifndef __LED_SEQUENCE__
#define __LED_SEQUENCE__

#define SEQQ_MAX_ITEM_NUM 8

typedef enum
{
    IMUcalibrating,
    SystemInitFailed,
    InitSuccess,
    FlyingRemoteCon,
    BatteryLow,
    Charging,
} ledSequence_t;

typedef struct seqQ_s
{
    uint8_t index;
    uint8_t number;
    ledSequence_t item[SEQQ_MAX_ITEM_NUM];
} seqQ_t;

void LED_Init(void);

void LED_task(void);

bool LEDTest(void);

void LedSeqRun(ledSequence_t seq);

ledSequence_t CurrentLedSeq(void);


#endif //__LED_SEQUENCE__