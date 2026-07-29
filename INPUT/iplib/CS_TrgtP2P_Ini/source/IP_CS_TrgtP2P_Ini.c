#include "IP_CS_TrgtP2P_Ini.h"
/***********************************************************************
 * 功能描述:  5.3.3.1  点对点机动初始化
***********************************************************************/
void    CS_TrgtP2P_IniFun(void *p)
{
    CS_TrgtP2P_Ini *pIp = (CS_TrgtP2P_Ini*)p;

    /* dχmax_x_RWorCMGCtrl=dχmax_x_RWorCMGCtrlZR[F_P2PType]； */
    pIp->csMnvData_dChimax_RWorCMGCtrl[0] = pIp->csMnvPara_dChimax_RWorCMGCtrlZR[0][pIp->csMnvData_F_P2PType];

    /* dχmax_y_RWorCMGCtrl=dχmax_y_RWorCMGCtrlZR[F_P2PType]； */
    pIp->csMnvData_dChimax_RWorCMGCtrl[1] = pIp->csMnvPara_dChimax_RWorCMGCtrlZR[1][pIp->csMnvData_F_P2PType];

    /* dχmax_z_RWorCMGCtrl=dχmax_z_RWorCMGCtrlZR[F_P2PType]； */
    pIp->csMnvData_dChimax_RWorCMGCtrl[2] = pIp->csMnvPara_dChimax_RWorCMGCtrlZR[2][pIp->csMnvData_F_P2PType];

    /* amax_x_RWorCMGCtrl= amax_x_RWorCMGCtrlZR[F_P2PType]; */
    pIp->csMnvData_amax_RWorCMGCtrl[0] = pIp->csMnvPara_amax_RWorCMGCtrlZR[0][pIp->csMnvData_F_P2PType];

    /* amax_y_RWorCMGCtrl= amax_y_RWorCMGCtrlZR[F_P2PType]; */
    pIp->csMnvData_amax_RWorCMGCtrl[1] = pIp->csMnvPara_amax_RWorCMGCtrlZR[1][pIp->csMnvData_F_P2PType];

    /* amax_z_RWorCMGCtrl= amax_z_RWorCMGCtrlZR[F_P2PType]; */
    pIp->csMnvData_amax_RWorCMGCtrl[2] = pIp->csMnvPara_amax_RWorCMGCtrlZR[2][pIp->csMnvData_F_P2PType];

    /* IF1(WorkMode=OAM) 轨控调姿 */
    if (m_WorkMode == WKMD_OAM)
    {
        /* 调用5.3.3.1.2（轨控调姿模式的目标初始化） */
        CS_TrgtP2P_OrbCtl_Ini();
    }
    /* else if(m_WorkMode==WKMD_AMM) */
    else if (m_WorkMode == WKMD_AMM)
    {
        /* 调用5.3.3.1.3（姿态机动模式的目标初始化） */
        CS_TrgtP2P_Tar_Init();
    }
    else
    {
        /* 预留 */
        f_Fun_Null();
    }

    /* 初始化目标四元数
     * qro=DCM2q(Cro);  qro0=qro; */
    C2Q(pIp->csAttCoreData_qro, &pIp->csAttCoreData_Cro[0][0]);
    Memcpyx((unint08 *)pIp->csAttCoreData_qro0,(unint08 *)pIp->csAttCoreData_qro, sizeof(pIp->csAttCoreData_qro0));

    return;
}