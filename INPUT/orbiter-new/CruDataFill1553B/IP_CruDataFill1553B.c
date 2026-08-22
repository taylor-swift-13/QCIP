#include "IP_CruDataFill1553B.h"

// =======================================================
// 函数实现
// =======================================================

void CruDataFill1553B(void)
{
    unint32 iCru;
    unint32 subAddr;
    unint16 cruBuffer16[40];

    /* 六个子地址 */
    for (iCru=0; iCru<8; iCru++)
    {
        subAddr = RT_SA10 + iCru;

        /* 单字节数组向2字节数组转换后, 再发送重要数据填充至发送区 */
        BufferCopy08to16(&cruBuffer16[0], &sCrucialSave.saveBuff[iCru * 64], (SA_CRU_LEN*2));
        B1553RtSaWrite(subAddr, B1553_RT_TRAN, &cruBuffer16[0], SA_CRU_LEN, RT_INSTANCE_01);
    }

    return;
}