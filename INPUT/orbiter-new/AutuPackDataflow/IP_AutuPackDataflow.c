#include "IP_AutuPackDataflow.h"

// =======================================================
// 函数实现
// =======================================================

void AutuPackDataflow(unint08 * pBuf, AUTOPACK * pData, boolu32 * firstTime, unint32 lengthOfArray, unint32 lengthofAddress)
{
    unint32 index;

    /* 初始化 */
    index = 0;

    /* 如果是首次打包，则重置偏移量，重新计算 */
    if (*firstTime == TRUE32)
    {
        sPackShift.byteIndex = 0;
        sPackShift.bitIndex = 0;
    }

    /* 字节流打包 */
    while ((pData[index].Stop != 1) && (index < lengthOfArray))
    {
        if ((pData[index].type & MASK_HI24) != 0)
        {
            /* 按比特位打包 */
            AutoPackBit(pBuf, &pData[index], firstTime, lengthofAddress);
        }
        else
        {
            /* 按字节打包 */
            AutoPackByte(pBuf, &pData[index], firstTime, lengthofAddress);
        }

        index++;
    }

    /* 完成打包过程，将首次打包标识置False */
    if (*firstTime == TRUE32)
    {
        *firstTime = FALSE32;
    }

    return;
}