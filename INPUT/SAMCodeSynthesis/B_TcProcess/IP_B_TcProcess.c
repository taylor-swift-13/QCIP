#include "IP_B_TcProcess.h"

void B_TcProcessFun(void *p)
{
	B_TcProcess *pIp = (B_TcProcess*)p;

	unint32 len = 4;
	unint08 chksum;
	unint08 i;
	unint08 obdhSendData[2];
	unint08 obdhRecvData[4];

	chksum = 0;
	pIp->bSucc = 0;

#ifdef __GCC_COMPILED__

	unint32 numerror;

	/* 发送取数指令 */
	obdhSendData[0] = 0xEB;
	obdhSendData[1] = 0x94;

	UartSend(pIp->uartno, &obdhSendData[0], 2);

	SYS_Delay(1000);

	/* 串口收数 */
	pIp->bSucc = UartRecv(pIp->uartno, &obdhRecvData[0], &len, &numerror);

	if (obdhRecvData[0] == 0xE1)
	{
		pIp->bSucc = 0x1;		/* 串口已收到数据 */
	}

#else
	/* 快仿环境下 */

#endif

	if (pIp->bSucc == 0x1)
	{
	    if ((obdhRecvData[0] == 0xE1) && (obdhRecvData[1] == 0x00))		/* 包头正确 */
		{
			for (i = 0; i < 3; i++)
			{
				chksum = chksum + obdhRecvData[i];
			}

			if(obdhRecvData[3] == chksum)					/* 校验和正确 */
			{
				if (obdhRecvData[2] == 0)
				{
					*pIp->workMode = SAM_DAMP;
				}
				else if (obdhRecvData[2] == 1)
				{
					*pIp->workMode = SAM_CRUISE;
				}
				else
				{
					*pIp->workMode = NOCTRL;
				}
			}
		}
	}
	

	return;
}