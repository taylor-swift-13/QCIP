#include "IP_UartInit.h"

void UartInitFun(void *p)
{
    UartInit *pIp = (UartInit*)p;
 Drv_Uart_Init(pIp->uartno, pIp->baud, pIp->even, pIp->stop);
 return;
}
