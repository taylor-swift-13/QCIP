#include "IP_CMICalculate.h"

// =======================================================
// 函数实现
// =======================================================

void CMICalculate(void)
{
    float64 tmpa;
    float64 tmpq[4];
    float64 tmpqr[4];

    /* 导航重置标志 */
    /* 双机冷模式时才通过导航重置标志重置tME, 更改防止三机热时错误 */
    if (sNaviFlag.WalkReNaviFlg == 1)
    {
        sNaviParam.tME = sTime.sstime;

        sNaviFlag.WalkReNaviFlg = 0;
    }

    tmpa = sNaviParam.wM * (sTime.sstime - sNaviParam.tME) / 2.0;
    tmpqr[0] = 0.0;
    tmpqr[1] = 0.0;
    tmpqr[2] = Sinx(tmpa);
    tmpqr[3] = Cosx(tmpa);

    QMulti(&tmpq[0], &sNaviParam.qME[0], &tmpqr[0]);
    Q2C(&sNaviData.cmi[0][0], &tmpq[0]);
    MatrixTran33(&sNaviData.cim[0][0], &sNaviData.cmi[0][0]);
    MatrixEval(&sNaviData.wmi[0], &sNaviData.cmi[2][0], 1, 3);

    return;
}