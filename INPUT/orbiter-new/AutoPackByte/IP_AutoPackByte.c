#include "IP_AutoPackByte.h"

// =======================================================
// 函数实现
// =======================================================

void AutoPackByte(unint08 * pBuf, AUTOPACK * pData, boolu32 * firstTime, unint32 lengthofAddress)
{
    /* 暂存数据结构（这里的变量是用来做类型转化时暂存用） */
    STcmdDataConverte sTcmdDataConverte;
    unint08 * pDst;                 /* 目标地址 */
    unint32 tmpGlobalByteIndex;     /* 全局字节偏移量 */

    /* 变量初始化清零 */
    sTcmdDataConverte.ui16 = 0;
    sTcmdDataConverte.ui32 = 0;
    tmpGlobalByteIndex = 0;

    /* 根据是否为第一次打包计算偏移量 */
    if (*firstTime == TRUE32)
    {
        pDst = &pBuf[ sPackShift.byteIndex ];
        pData->byteID = sPackShift.byteIndex;
    }
    else
    {
        pDst = &pBuf[ pData->byteID ];
    }

    switch (pData->type)
    {
    case ORIGIN_NULL:               /* 以0占位，占满当前字节 */
        pDst[0] = 0x00;
        tmpGlobalByteIndex = 1;
        break;

    case ORIGIN_BYTE:               /* 原码1字节 */
        *pDst = *(unint08*)pData->pSrc;
        tmpGlobalByteIndex = 1;
        break;

    case ORIGIN_WORD:               /* 原码2字节 */
        pDst[0] = *((unint08*)pData->pSrc + 1);
        pDst[1] = *(unint08*)pData->pSrc;
        tmpGlobalByteIndex = 2;
        break;

    case ORIGIN_3BYTE:              /* 原码3字节 */
        pDst[0] = *((unint08*)pData->pSrc + 2);
        pDst[1] = *((unint08*)pData->pSrc + 1);
        pDst[2] = *(unint08*)pData->pSrc;
        tmpGlobalByteIndex = 3;
        break;

    case ORIGIN_DWORD:              /* 原码4字节 */
        pDst[0] = *((unint08*)pData->pSrc + 3);
        pDst[1] = *((unint08*)pData->pSrc + 2);
        pDst[2] = *((unint08*)pData->pSrc + 1);
        pDst[3] = *(unint08*)pData->pSrc;
        tmpGlobalByteIndex = 4;
        break;

    case ORIGIN_8BYTE:              /* 原码8字节 */
        pDst[0] = *((unint08*)pData->pSrc + 7);
        pDst[1] = *((unint08*)pData->pSrc + 6);
        pDst[2] = *((unint08*)pData->pSrc + 5);
        pDst[3] = *((unint08*)pData->pSrc + 4);
        pDst[4] = *((unint08*)pData->pSrc + 3);
        pDst[5] = *((unint08*)pData->pSrc + 2);
        pDst[6] = *((unint08*)pData->pSrc + 1);
        pDst[7] = *(unint08*)pData->pSrc;
        tmpGlobalByteIndex = 8;
        break;

    case DBL_TO_UN32_ID:            /* 双精度浮点转4字节正整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = Fabsx (sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO));   /* 确保是正数 */

        /*  */
        sTcmdDataConverte.ui32 = DBL_TO_UN32(sTcmdDataConverte.fl64);
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[3] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 4;
        break;

    case DBL_TO_UN24_ID:            /* 双精度浮点转3字节正整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = Fabsx (sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO));   /* 确保是正数 */

        /*  */
        sTcmdDataConverte.ui32 = DBL_TO_UN32(sTcmdDataConverte.fl64);
        pDst[0] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 3;
        break;

    case DBL_TO_UN16_ID:            /* 双精度浮点转2字节正整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = Fabsx (sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO));   /* 确保是正数 */

        /*  */
        sTcmdDataConverte.ui16 = DBL_TO_UN16(sTcmdDataConverte.fl64);
        pDst[0] = UI32_LOHI8(sTcmdDataConverte.ui16);
        pDst[1] = UI32_LOLO8(sTcmdDataConverte.ui16);
        tmpGlobalByteIndex = 2;
        break;

    case DBL_TO_UN08_ID:            /* 双精度浮点转1字节正整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = Fabsx (sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO));   /* 确保是正数 */

        /*  */
        *pDst = DBL_TO_UN08(sTcmdDataConverte.fl64);
        tmpGlobalByteIndex = 1;
        break;

    case DBL_TO_SI32_ID:            /* 双精度浮点转4字节整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        sTcmdDataConverte.ui32 = (unint32)DBL_TO_SI32(sTcmdDataConverte.fl64);
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[3] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 4;
        break;

    case DBL_TO_SI24_ID:            /* 双精度浮点转3字节整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        sTcmdDataConverte.ui32 = (unint32)DBL_TO_SI32(sTcmdDataConverte.fl64);
        pDst[0] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 3;
        break;

    case DBL_TO_SI16_ID:            /* 双精度浮点转2字节整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        sTcmdDataConverte.ui16 = (unint16)DBL_TO_SI16(sTcmdDataConverte.fl64);
        pDst[0] = UI32_LOHI8(sTcmdDataConverte.ui16);
        pDst[1] = UI32_LOLO8(sTcmdDataConverte.ui16);
        tmpGlobalByteIndex = 2;
        break;

    case DBL_TO_SI08_ID:            /* 双精度浮点转1字节整数 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        *pDst = (unint08)DBL_TO_SI08(sTcmdDataConverte.fl64);
        tmpGlobalByteIndex = 1;
        break;

    case DBL_TO_FLT_ID:             /* 双精度浮点转单精度浮点 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        sTcmdDataConverte.fl32 = (float32)(sTcmdDataConverte.fl64);
        sTcmdDataConverte.ui32 = FLT32_TO_MEM(&sTcmdDataConverte.fl32);
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[3] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 4;
        break;

    case DBL_TO_HAF_ID:             /* 双精度浮点转16位浮点 */
        sTcmdDataConverte.fl64 = *(float64*)pData->pSrc;
        sTcmdDataConverte.fl64 = sTcmdDataConverte.fl64 / NZ(pData->eq, FLT64_ZERO);

        /*  */
        sTcmdDataConverte.fl32 = (float32)(sTcmdDataConverte.fl64);
        sTcmdDataConverte.ui32 = FLT32_TO_MEM(&sTcmdDataConverte.fl32);
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 2;
        break;

    case UN32_TO_SI08_ID:           /* 32位无符号转8位有符号 */
        sTcmdDataConverte.ui32 = *(unint32*)pData->pSrc;

        /*  */
        *pDst = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 1;
        break;

    case UN32_TO_SI16_ID:           /* 32位无符号转16位有符号 */
        sTcmdDataConverte.ui32 = *(unint32*)pData->pSrc;
        sTcmdDataConverte.ui32 = DBL_TO_UN32((float64)(sTcmdDataConverte.ui32) / NZ(pData->eq, FLT64_ZERO));

        /*  */
        pDst[0] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 2;
        break;

    case UN32_TO_UN08_ID:           /* 32位无符号转8位无符号 */
        sTcmdDataConverte.ui32 = *(unint32*)pData->pSrc;
        sTcmdDataConverte.ui32 = DBL_TO_UN32((float64)(sTcmdDataConverte.ui32) / NZ(pData->eq, FLT64_ZERO));

        /*  */
        pDst[0] = UI32_LOLO8(sTcmdDataConverte.ui32);
        tmpGlobalByteIndex = 1;
        break;

    case MEMRY_COPY:                /* 直接进行源码打包 */
        Memcpyx(pDst, (unint08*)pData->pSrc, DBL_TO_UN32(pData->eq));
        tmpGlobalByteIndex = DBL_TO_UN32(pData->eq);
        break;

    default:
        break;
    }

    /* 如果是首次打包，在最后进行统一的偏移量计算赋值 */
    if (*firstTime == TRUE32)
    {
        sPackShift.byteIndex = sPackShift.byteIndex + tmpGlobalByteIndex;

        /* 增加打包长度判断保护 */
        ASSERT(sPackShift.byteIndex <= lengthofAddress);
    }

    return;
}