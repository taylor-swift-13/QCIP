#include "IP_CS_ObtCtrl_OrbJetOut.h"

void    CS_Jet_ObtOut( void *p );

void CS_ObtCtrl_OrbJetOutFun(void *p)
{
    CS_ObtCtrl_OrbJetOut *pIp = (CS_ObtCtrl_OrbJetOut*)p;

    /* 总轨控工作时长累计 每周期轨控工作时长分配 */
    /* 占空比不纳入工作时长累计 */
    if ( pIp->m_starTime >= pIp->csOrbitCtrlData_tpi_OC )
    {
        /* 轨控脉宽分配 */
        // CtrlHook.OrbJetOut_hook();
        CS_Jet_ObtOut(pIp);
    }
    else
    {
        pIp->csOrbitCtrlData_dto_OC = 0.0;
    }

    return;
}

void    CS_Jet_ObtOut( void *p)
{
	CS_ObtCtrl_OrbJetOut *pIp = (CS_ObtCtrl_OrbJetOut*)p;
    unint32 i;
    /* 轨控方式可配置 轨控喷管可选 该函数可挂接 轨控占空比可配置 结束的一个周期的喷气量小量输出 */
    /* 每周期送出轨控脉宽 csOrbitCtrlData.dto_OC 单位:s */

    /* FOR1 (i = 0; i < NUM_THRGR_OC; i++ ) */
    for (i=0; i<NUM_THRGR_OC; i++)
    {
        pIp->CS_Jet_ObtOut_t_OC[i] = pIp->CS_Jet_ObtOut_FS_OC[i] * pIp->m_DeltaT;
    }
    return;
}




// #include "IP_CS_ObtCtrl_OrbJetOut.h"

// void    CS_Jet_ObtOut( void *p );

// void CS_ObtCtrl_OrbJetOutFun(void *p)
// {
//     CS_ObtCtrl_OrbJetOut *pIp = (CS_ObtCtrl_OrbJetOut*)p;

//     /* 总轨控工作时长累计 每周期轨控工作时长分配 */
//     /* 占空比不纳入工作时长累计 */
//     if ( pIp->m_starTime >= pIp->csOrbitCtrlData_tpi_OC )
//     {
//         if ( pIp->csOrbitCtrlData_dremain_OC > pIp->m_DeltaT )
//         {/* 每周期满喷 */

//             /* 累计轨控工作时长 */
//             pIp->csOrbitCtrlData_sumDtp += pIp->m_DeltaT;
//             /* 每周期喷气量 */
//             pIp->csOrbitCtrlData_dto_OC  = pIp->m_DeltaT + pIp->csOrbitCtrlData_dGap_OC;
//             /* 总工作时长-- */
//             pIp->csOrbitCtrlData_dremain_OC -= pIp->m_DeltaT;
//         }
//         else
//         {/* 尾周期小量 */

//             // /* 累计轨控工作时长 */
//             pIp->csOrbitCtrlData_sumDtp += pIp->csOrbitCtrlData_dremain_OC;
//             // /* 每周期喷气量 */
//             pIp->csOrbitCtrlData_dto_OC  = pIp->csOrbitCtrlData_dremain_OC;
//             // /* 总工作时长-- */
//             pIp->csOrbitCtrlData_dremain_OC  = 0.0;
//         }
//     }
//     else
//     {
//         pIp->csOrbitCtrlData_dto_OC = 0.0;
//     }

//     /* 轨控脉宽分配 */
//     // CtrlHook.OrbJetOut_hook();
//     CS_Jet_ObtOut(pIp);

//     return;
// }

// void    CS_Jet_ObtOut( void *p)
// {
// 	CS_ObtCtrl_OrbJetOut *pIp = (CS_ObtCtrl_OrbJetOut*)p;
//     unint32 i;
//     /* 轨控方式可配置 轨控喷管可选 该函数可挂接 轨控占空比可配置 结束的一个周期的喷气量小量输出 */
//     /* 每周期送出轨控脉宽 csOrbitCtrlData.dto_OC 单位:s */

//     /* FOR1 (i = 0; i < NUM_THRGR_OC; i++ ) */
//     for (i=0; i<NUM_THRGR_OC; i++)
//     {
//         pIp->t_OC[i] = pIp->FS_OC[i] * pIp->csOrbitCtrlData_dto_OC;
//     }
//     return;
// }