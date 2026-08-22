#include "IP_CruDataFlyUnpackQ.h"

// =======================================================
// 函数实现
// =======================================================

void CruDataFlyUnpackQ(void)
{
    float64 tmpQS;

    /* 分别恢复4组重要数据中的四元数 */
    tmpQS = sAttiData.q.q4[0]*sAttiData.q.q4[0] + sAttiData.q.q4[1]*sAttiData.q.q4[1] + sAttiData.q.q4[2]*sAttiData.q.q4[2];
    if (tmpQS > 0.99999)
    {
        tmpQS = 0.99999;
    }
    sAttiData.q.q4[3] = Sqrtx((1.0 - tmpQS));

    tmpQS = sAttiData.q0.q4[0]*sAttiData.q0.q4[0] + sAttiData.q0.q4[1]*sAttiData.q0.q4[1] + sAttiData.q0.q4[2]*sAttiData.q0.q4[2];
    if (tmpQS > 0.99999)
    {
        tmpQS = 0.99999;
    }
    sAttiData.q0.q4[3] = Sqrtx((1.0 - tmpQS));

    tmpQS = sAttiData.qGI.q4[0]*sAttiData.qGI.q4[0] + sAttiData.qGI.q4[1]*sAttiData.qGI.q4[1] + sAttiData.qGI.q4[2]*sAttiData.qGI.q4[2];
    if (tmpQS > 0.99999)
    {
        tmpQS = 0.99999;
    }
    sAttiData.qGI.q4[3] = Sqrtx((1.0 - tmpQS));

    tmpQS = sNaviParam.qME[0]*sNaviParam.qME[0] + sNaviParam.qME[1]*sNaviParam.qME[1] + sNaviParam.qME[2]*sNaviParam.qME[2];
    if (tmpQS > 0.99999)
    {
        tmpQS = 0.99999;
    }
    sNaviParam.qME[3] = Sqrtx((1.0 - tmpQS));

    return;
}