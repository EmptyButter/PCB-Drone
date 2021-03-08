#include <stdbool.h>
#include <stdint.h>

#define SYSLINK_MTU 32

#define START_BYTE1 0xEB
#define START_BYTE2 0xCE

#define SYSLINK_RADIO_RAW 0x00
#define SYSLINK_RADIO_COMMAND 0x01
#define SYSLINK_RADIO_DATARATE 0x02
#define SYSLINK_PM_VBATT 0x03
#define SYSLINK_OPMODE_TEST1 0x04
#define SYSLINK_OPMODE_CHARGING 0x05
#define SYSLINK_OPMODE_NORMAL 0x06


struct syslinkPacket
{
    uint8_t type;
    uint8_t length;
    char data[SYSLINK_MTU];
};

static enum {
    state_first_start,
    state_second_start,
    state_length,
    state_type,
    state_data,
    state_cksum1,
    state_cksum2,
    state_done
} state = state_first_start;

bool syslinkReceive(struct syslinkPacket *packet);

bool syslinkSend(struct syslinkPacket *packet);

void syslinkReset();