#include "IP_ConstDiagSignInt.h"

// =======================================================
// 函数实现
// =======================================================

boolu32 ConstDiagSignInt(siint32 *cntConst, const siint32 *var, const siint32 *oldVar, siint32 sizeVar, siint32 numConstMax)
{
    boolu32 bConst;
    siint32 iCnt;
    siint32 cntAll;

    bConst = FALSE32;
    cntAll = 0;

    for (iCnt=0; iCnt<sizeVar; iCnt++)
    {
        if (var[iCnt] == oldVar[iCnt])
        {
            cntAll++;
        }
    }

    if (cntAll == sizeVar)
    {
        /* 常值计数累加 */
        (*cntConst)++;
    }
    else
    {
        /* 常值计数清零 */
        *cntConst = 0;
    }

    if (*cntConst > numConstMax)
    {
        /* 置常值标志 */
        bConst = TRUE32;
    }

    return bConst;
}