#include "IP_SendUartData.h"

void SendUartDataFun(void *p)
{
    SendUartData *pIp = (SendUartData*)p;

    UartSend(pIp->uartno, pIp->buf, pIp->sendsize);

    return;
}
