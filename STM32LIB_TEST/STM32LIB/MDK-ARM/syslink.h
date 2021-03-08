#ifndef __SYSLINK_H__
#define __SYSLINK_H__

#include <stdbool.h>

#define SYSLINK_MTU 32

#define START_BYTE1 0xEB
#define START_BYTE2 0xCE

#define SYSLINK_RADIO_RAW 0x00
#define SYSLINK_RADIO_COMMAND 0x01
#define SYSLINK_RADIO_DATARATE 0x02

typedef struct 
{
    uint8_t type;
    uint8_t length;
    char data[SYSLINK_MTU];
}syslinkPacket_t;

static enum {
    state_first_start,
    state_second_start,
    state_length,
    state_type,
    state_data,
    state_cksum1,
    state_cksum2,
    state_done
} rxState = state_first_start;


#endif