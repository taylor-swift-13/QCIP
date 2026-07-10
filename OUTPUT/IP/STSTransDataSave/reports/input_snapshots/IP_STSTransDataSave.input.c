#include "IP_STSTransDataSave.h"

// =======================================================
// 函数实现
// =======================================================

void STSTransDataSave( void )
{
    unint32 pDst;

    if ( sSTSTran.ptr < 776 )
    { /* 1K - 248B */
        pDst = SRAM_BASE + STS_PK_UP + sSTSTran.ptr;
        Memcpyx( (unint08*)pDst, sSTSTran.dataBuf, 248 );
        sSTSTran.ptr = sSTSTran.ptr + 248;
    }

    return;
}