#include "IP_BinarySearch_New.h"

// =======================================================
// 函数实现
// =======================================================

siint32 BinarySearch_New(unint32 id, siint32 iniIndx, siint32 endIndx, const STcmdParamModify *paraTab)
{
    /* 应用限定条件:
                   1）待查找序列必须为升序；
                   2）iniIndx:序列起始下标, 通常为0,
                   3）endIndx:序列起始下标, 通常为paraTab.Len-1；
    */

    siint32 mid;        /*  */
    siint32 resultIndx; /*  */
    boolu32 bFindId;    /*  */

    /* 增加断言：序列首尾下标的有效判定 */
    ASSERT(iniIndx <= endIndx);

    bFindId = FALSE32;
    mid = 0;

    /* 二分法查找id(id按从小到大顺序排列) */
    while ((iniIndx <= endIndx) && (bFindId == FALSE32))
    {
        /* 取中间位置 */
        mid = (iniIndx + endIndx) / 2;

        /* 比较 */
        if (paraTab[mid].paraID < id)
        {
            iniIndx = mid + 1;
        }
        /* 比较 */
        else if (paraTab[mid].paraID > id)
        {
            endIndx = mid - 1;
        }
        else
        {
            bFindId = TRUE32;
        }
    }

    /* 找到判定 */
    if (bFindId == TRUE32)
    {
        /* 返回下标 */
        resultIndx = mid;
    }
    else
    {
        /* 返回无效值 */
        resultIndx = -1;
    }

    return resultIndx;
}