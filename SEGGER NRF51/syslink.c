#include <stdbool.h>
#include <stdint.h>

#include <nrf.h>

#include "pinout.h"
#include "syslink.h"
#include "uart.h"

/* Frame format:
 * +----+-----+------+-----+=============+-----+-----+
 * |  START   | TYPE | LEN | DATA        |   CKSUM   |
 * +----+-----+------+-----+=============+-----+-----+
 *
 * - Start is 2 bytes constant, defined bellow
 * - Length and type are uint8_t
 * - Length define the data length
 * - CKSUM is 2 bytes Fletcher 8 bit checksum. See rfc1146.
 *   Checksum is calculated with TYPE, LEN and DATA
 */


void syslinkRet()
{
    state = state_first_start;
}

bool syslinkReceive(struct syslinkPacket *packet)
{
    static int index = 0;
    static int length = 0;
    static uint8_t cksum_a = 0, cksum_b = 0;
    char c;

    packet->length = 0;

    if (state == state_done)
    {
        state = state_first_start;
        index = 0;
    }

    while (uartIsDataReceived() && (state != state_done))
    {
        c = uartGetc();

        switch (state)
        {
        case state_first_start:
            state = (c == START_BYTE1) ? state_second_start : state_first_start;
            break;
        case state_second_start:
            state = (c == START_BYTE2) ? state_type : state_first_start;
            break;
        case state_type:
            packet->type = c;
            cksum_a = c;
            cksum_b = cksum_a;
            state = state_length;
            break;
        case state_length:
            packet->length = c;
            cksum_a += c;
            cksum_b += cksum_a;
            index = 0;
            if (length > 0 && length <= SYSLINK_MTU)
                state = state_data;
            else if (length > SYSLINK_MTU)
                state = state_first_start;
            else
                state = state_cksum1;
            break;
        case state_data:
            packet->data[index++] = c;
            cksum_a += c;
            cksum_b += cksum_a;
            if (index >= length)
                state = state_cksum1;
            break;
        case state_cksum1:
            if (c == cksum_a)
                state = state_cksum2;
            else
                state = state_first_start;
            break;
        case state_cksum2:
            if (c == cksum_b)
            {
                packet->length = length;
                state = state_done;
            }
            else
            {
                state = state_first_start;
                index = 0;
            }
        case state_done:
            break;
        }
    }

    return state == state_done;
}

bool syslinkSend(struct syslinkPacket *packet)
{
    uint8_t cksum_a = 0;
    uint8_t cksum_b = 0;
    int i;

    uartPutc(START_BYTE1);
    uartPutc(START_BYTE2);

    uartPutc((unsigned char)packet->type);
    cksum_a += packet->type;
    cksum_b += cksum_a;

    uartPutc((unsigned char)packet->length);
    cksum_a += packet->length;
    cksum_b += cksum_a;

    for (i = 0; i < packet->length; i++)
    {
        uartPutc(packet->data[i]);
        cksum_a += packet->data[i];
        cksum_b += cksum_a;
    }

    uartPutc(cksum_a);
    uartPutc(cksum_b);

    return true;
}

