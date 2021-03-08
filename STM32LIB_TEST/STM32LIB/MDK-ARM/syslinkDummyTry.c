
uint16_t timeout = 10;
uint16_t byteNum = 64;
uint16_t ret;
uint8_t cksum1 = 0;
uint8_t cksum2 = 0;
bool syslinkPacketReceived = false;

for (int i = 0; i < byteNum; i++)
    uartData[i] = 0;

ret = HAL_UART_Receive(&huart6, uartData, byteNum, 1);

int i = 0;
int j = 0;
while (uartData[i] != START_BYTE1 && i != byteNum - 5) i++; //break when start byte match, or reached near end of buffer.
i++;
if (i < byteNum - 4 && uartData[i] == START_BYTE2)
{
    i++;

    syslinkPacket.type = uartData[i++]; //n-3
    cksum1 = syslinkPacket.type;
    cksum2 = cksum1;

    syslinkPacket.length = uartData[i++]; //n-2
    cksum1 += syslinkPacket.length;
    cksum2 += cksum1;

    if (syslinkPacket.length + 2 < byteNum - i && syslinkPacket.length != 0) //if complete data in the buffer.
    {
        for (j = 0; j < syslinkPacket.length; j++)
        {
            syslinkPacket.data[j] = uartData[i++];
            cksum1 += syslinkPacket.data[j];
            cksum2 += cksum1;
        }
        if (cksum1 == uartData[i++])
        {
            if (cksum2 == uartData[i])
            {
                syslinkPacketReceived = true;
            }
            else
            {
                syslinkPacketReceived = false;
            }
        }
        else //data not complete in the buffer, abort.
        {
            syslinkPacketReceived = false;
        }
    }
    else //start byte2 not match, or data not complete in the buffer.
    {
        syslinkPacketReceived = false;
    }
}
else
{
    syslinkPacketReceived = false;
}

if (syslinkPacketReceived == false)
{
    for (int i = 0; i < byteNum; i++)
        uartData[i] = 0;
}

if (syslinkPacketReceived == true)
{
    for (int i = 0; i < syslinkPacket.length; i++)
        printf("%hu, ", syslinkPacket.data[i]);
    printf("\n");
}