#include "IP_CS_Track_Plan.h"
// void AccSinTrackCalculate(SMnvrData* past, float64 dtv, float64 dtTr);


void CS_Track_PlanFun(void *p)
{
    CS_Track_Plan *pIp = (CS_Track_Plan*) p;

    if (pIp->csMnvPara_FS_MnvTraceStyle == 0)
    {
        /* 调用规范化算法：混合轨迹规划 */
        MixedTrack(&pIp->csMnvData_mTrack, pIp->csMnvPara_t_sinaccMax,
                   pIp->csMnvPara_dt_RateRef, pIp->csMnvPara_dt_TorqRef);
    }
    else if (pIp->csMnvPara_FS_MnvTraceStyle == 1)
    {
        /* 调用规范化算法：正弦轨迹规划 */
        SinTrackCalculate(&pIp->csMnvData_mTrack, 0.0, 0.0);
    }
    else if (pIp->csMnvPara_FS_MnvTraceStyle == 2)
    {
        /* 调用规范化算法：基于加速度求导的轨迹规划 */
        AccSinTrackCalculate(&pIp->csMnvData_mTrack, pIp->csMnvPara_dt_RateRef, pIp->csMnvPara_dt_TorqRef);
    }
    else
    {
        if (pIp->csMnvPara_FS_MnvTraceStyle == 3)
        {
            /* 型号扩展轨迹规划算法 */
            csMnvTrgtHook.ExtendedTrack_hook();
            /* 是否需要改 */
        }
    }

    return;
}
