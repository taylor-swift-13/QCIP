#include "IP_AutoPackBit.h"

// =======================================================
// 函数实现
// =======================================================

void AutoPackBit(unint08 * pBuf, AUTOPACK * pData, boolu32 * firstTime, unint32 lengthofAddress)
{
    STcmdDataConverte sTcmdDataConverte;    /* 暂存数据结构（这里的变量是用来做类型转化时暂存用） */

    /* 需打包变量的暂存 */
    unint08 srcDataU08;             /*  */
    unint32 srcDataU32;             /*  */
    float64 srcDataF64;             /*  */

    unint32 bitPos;                 /* 当前打包位置偏移量（进行位操作时的偏移量） */
    unint32 bitType;                /* 当前打包的类型 */

    unint08 * pDst;                 /* 目前存放地址 */

    unint32 tmpGlobalBitIndex;      /* 全局bit偏移量 */
    unint32 tmpGlobalByteIndex;     /* 全局byte偏移量 */

    /* 初始化: 变量/全局偏移量 清零 */
    sTcmdDataConverte.ui32 = 0;
    tmpGlobalByteIndex = 0;
    tmpGlobalBitIndex = 0;

    /* 根据是否为第一次打包，做位偏移量赋值 */
    if (*firstTime == TRUE32)
    {
        pDst = &pBuf[ sPackShift.byteIndex ];
        pData->byteID = sPackShift.byteIndex;
        bitPos = 0;
    }
    else
    {
        pDst = &pBuf[ pData->byteID ];
        bitPos = UI32_LO16(pData->type);
    }

    /* 获取当前打包的类型 */
    bitType = UI32_HI16(pData->type);

    switch (bitType)
    {
    case ORIGIN_1BIT_NULL:               /* 打包1比特空位 */
        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_1BIT_NULL, bitPos);
            tmpGlobalBitIndex = 1;
        }
        UI08_BIT_CLR(pDst[0], bitPos);
        break;

    case ORIGIN_1BIT:                   /* 打包1比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_1BIT, bitPos);
            tmpGlobalBitIndex = 1;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET1(pDst[0], bitPos, (srcDataU08 & 0x01u));
        break;

    case ORIGIN_2BIT:                   /* 打包2比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 6 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_2BIT, bitPos);
            tmpGlobalBitIndex = 2;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET2(pDst[0], bitPos, (srcDataU08 & 0x03u));
        break;

    case ORIGIN_3BIT:                   /* 打包3比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 5 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_3BIT, bitPos);
            tmpGlobalBitIndex = 3;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET3(pDst[0], bitPos, (srcDataU08 & 0x07u));
        break;

    case ORIGIN_4BIT:                   /* 打包4比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 4 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_4BIT, bitPos);
            tmpGlobalBitIndex = 4;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET4(pDst[0], bitPos, (srcDataU08 & 0x0Fu));
        break;

    case ORIGIN_5BIT:                   /* 打包5比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 3 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_5BIT, bitPos);
            tmpGlobalBitIndex = 5;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET5(pDst[0], bitPos, (srcDataU08 & 0x1Fu));
        break;

    case ORIGIN_6BIT:                   /* 打包6比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 2 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_6BIT, bitPos);
            tmpGlobalBitIndex = 6;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET6(pDst[0], bitPos, (srcDataU08 & 0x3Fu));
        break;

    case ORIGIN_7BIT:                   /* 打包7比特原码 */
        if (*firstTime == TRUE32)
        {
            bitPos = 1 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(ORIGIN_7BIT, bitPos);
            tmpGlobalBitIndex = 7;
        }

        srcDataU08 = *(unint08*)pData->pSrc;
        UI08_BIT_SET7(pDst[0], bitPos, (srcDataU08 & 0x7Fu));
        break;

    case CONVERTE_FLOAT_20BIT:          /* float转20bit整数 */
        /* 先将数据进行当量相关计算，并转化为有符号32位整数 */
        srcDataF64 = *(float64*)pData->pSrc;
        srcDataF64 = srcDataF64 / NZ(pData->eq, FLT64_ZERO);
        srcDataU32 = DBL_TO_UN32(srcDataF64);

        if (*firstTime == TRUE32)
        {
            bitPos = 12 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(CONVERTE_FLOAT_20BIT, bitPos);

            /* 20个bit的情况下，位移为2个字节外加4个bit */
            tmpGlobalByteIndex = 2;
            tmpGlobalBitIndex = 4;
        }

        /* 先将当前写入地址中本来存在的部分赋值到无符号32位整数中，之后再顺序写入20bit的内容 */
        UI32_BIT_SET8 (sTcmdDataConverte.ui32, 24, (unint32)pDst[0]);
        UI32_BIT_SET20(sTcmdDataConverte.ui32, bitPos,  (srcDataU32 & 0xFFFFFu));

        /* 此处先赋值4个字节，型号中仅需要赋值3个字节，但是如果在20bit写入前，已经写入超过4个bit，则需要赋值4个字节 */
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[3] = UI32_LOLO8(sTcmdDataConverte.ui32);
        break;

    case CONVERTE_FLOAT_23BIT:               /* float转23bit整数 */
        /* 先将数据进行当量相关计算，并转化为有符号32位整数 */
        srcDataF64 = *(float64*)pData->pSrc;
        srcDataF64 = srcDataF64 / NZ(pData->eq, FLT64_ZERO);
        srcDataU32 = DBL_TO_UN32(srcDataF64);

        if (*firstTime == TRUE32)
        {
            bitPos = 9 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(CONVERTE_FLOAT_23BIT, bitPos);

            /* 23个bit的情况下，位移为2个字节外加7个bit */
            tmpGlobalByteIndex = 2;
            tmpGlobalBitIndex = 7;
        }

        /* 先将当前写入地址中本来存在的部分赋值到无符号32位整数中，之后再顺序写入23bit的内容 */
        UI32_BIT_SET8 (sTcmdDataConverte.ui32, 24, (unint32)pDst[0]);
        UI32_BIT_SET23(sTcmdDataConverte.ui32, bitPos, (srcDataU32 & 0x7FFFFFu));

        /* 此处先赋值4个字节，型号中仅需要赋值3个字节，但是如果在20bit写入前，已经写入超过4个bit，则需要赋值4个字节 */
        pDst[0] = UI32_HIHI8(sTcmdDataConverte.ui32);
        pDst[1] = UI32_HILO8(sTcmdDataConverte.ui32);
        pDst[2] = UI32_LOHI8(sTcmdDataConverte.ui32);
        pDst[3] = UI32_LOLO8(sTcmdDataConverte.ui32);
        break;

    case LOG_UI32_TF:                       /* 32位标志量TRUE/FALSE的判断 */
        srcDataU32 = *(unint32*)pData->pSrc;
        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(LOG_UI32_TF, bitPos);
            tmpGlobalBitIndex = 1;
        }

        /* 通过对比与装定表中最后一个入参的比较(必须保证条件TRUE对应比特1)，如果一致则置1，如果不一致则置0 */
        if (srcDataU32 == pData->bitPara)
        {
            UI08_BIT_SET(pDst[0], bitPos);
        }
        else
        {
            UI08_BIT_CLR(pDst[0], bitPos);
        }
        break;

    case LOG_UI08_TF:                       /* 8位标志量判断 */
        srcDataU08 = *(unint08*)pData->pSrc;

        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(LOG_UI08_TF, bitPos);
            tmpGlobalBitIndex = 1;
        }

        /* 检查是否与装定表入参一致，如果一致则置1，如果不一致则置0 */
        if (srcDataU08 == pData->bitPara)
        {
            UI08_BIT_SET(pDst[0], bitPos);
        }
        else
        {
            UI08_BIT_CLR(pDst[0], bitPos);
        }
        break;

    case POWER_TF:                      /* 获取加电状态（为配合型号通讯协议添加，不一定有通用性） */
        srcDataU32 = ADDR_READ(pData->pSrc);
        srcDataU08 = DEV_GET_POWER(srcDataU32);

        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(POWER_TF, bitPos);
            tmpGlobalBitIndex = 1;
        }

        /* 检查是否与装定表入参一致，如果一致则置1，如果不一致则置0 */
        if (srcDataU08 == pData->bitPara)
        {
            UI08_BIT_SET(pDst[0], bitPos);
        }
        else
        {
            UI08_BIT_CLR(pDst[0], bitPos);
        }
        break;

    case COM_ENA_TF:                    /* 获取通讯使能状态（为配合型号通讯协议添加，不一定有通用性） */
        srcDataU32 = ADDR_READ(pData->pSrc);
        srcDataU08 = DEV_GET_COMM(srcDataU32);

        if (*firstTime == TRUE32)
        {
            bitPos = 7 - sPackShift.bitIndex;
            pData->type = UI32_MAKE16(COM_ENA_TF, bitPos);
            tmpGlobalBitIndex = 1;
        }

        /* 检查是否与装定表入参一致，如果一致则置1，如果不一致则置0 */
        if (srcDataU08 == pData->bitPara)
        {
            UI08_BIT_SET(pDst[0], bitPos);
        }
        else
        {
            UI08_BIT_CLR(pDst[0], bitPos);
        }
        break;

    default:
        break;
    }

    /* 当本次为第一次包遍历时，根据不同种的情况，在最后统一进行一次bit位移的过程 */
    if (*firstTime == TRUE32)
    {
        sPackShift.bitIndex = sPackShift.bitIndex + tmpGlobalBitIndex;
        sPackShift.byteIndex = sPackShift.byteIndex + tmpGlobalByteIndex;

        /* 如果bit偏移量超过7，则转为偏移至下一个字节 */
        if (sPackShift.bitIndex > 7)
        {
            sPackShift.bitIndex = sPackShift.bitIndex - 8;
            sPackShift.byteIndex = sPackShift.byteIndex + 1;
        }

        /* 确认打包长度是否超过设置值 */
        ASSERT(sPackShift.byteIndex <= lengthofAddress);
    }

    return;
}