#include "IP_CS_TrgtAtt_AMM_Exp.h"
/***********************************************************************
 * 功能描述:  5.3.2.4.3 点对点机动期望轨迹
***********************************************************************/
void CS_TrgtAtt_AMM_ExpFun(void *p)
{
    CS_TrgtAtt_AMM_Exp *pIp = (CS_TrgtAtt_AMM_Exp*)p;

    float64 tmpF;
    float64 tmpSin;

    /* (1)计算期望轨迹
     * 调用5.3.1.4 (轨迹规划算法), 输出a_Ref Chi_Ref dChi_Ref */
    csMnvTrgtHook.Track_Plan_hook();

    if (pIp->csMnvData_F_Init_tm3 == 1)
    {
        pIp->csMnvData_F_Init_tm3 = 0;

        pIp->csMnvData_tm1 = pIp->csMnvData_mTrack_tm1p + pIp->csMnvData_tm_xin;  /* 输出 机动时刻 */
        pIp->csMnvData_tm2 = pIp->csMnvData_mTrack_tm2p + pIp->csMnvData_tm_xin;
        pIp->csMnvData_tm3 = pIp->csMnvData_mTrack_tm3p + pIp->csMnvData_tm_xin;

        pIp->csMnvData_tMnv = pIp->csMnvData_tm3;
    }

    tmpF   = pIp->csMnvData_mTrack_Chi_Ref / 2.0;
    tmpSin = Sinx(tmpF);

    pIp->csMnvData_qrb0[0] = pIp->csMnvData_e_xyz[0] * tmpSin;
    pIp->csMnvData_qrb0[1] = pIp->csMnvData_e_xyz[1] * tmpSin;
    pIp->csMnvData_qrb0[2] = pIp->csMnvData_e_xyz[2] * tmpSin;
    pIp->csMnvData_qrb0[3] = Cosx(tmpF);

    pIp->csMnvData_wrb0[0] = pIp->csMnvData_e_xyz[0] * pIp->csMnvData_mTrack_dChi_Ref;
    pIp->csMnvData_wrb0[1] = pIp->csMnvData_e_xyz[1] * pIp->csMnvData_mTrack_dChi_Ref;
    pIp->csMnvData_wrb0[2] = pIp->csMnvData_e_xyz[2] * pIp->csMnvData_mTrack_dChi_Ref;

    return;
}