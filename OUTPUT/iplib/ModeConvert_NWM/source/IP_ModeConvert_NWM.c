#include "IP_ModeConvert_NWM.h"

void ModeConvert_NWMFun(void *p)
{
    ModeConvert_NWM *pIp = (ModeConvert_NWM*)p;

    /* a.轨控不调姿 */
    if ((pIp->m_starTime > pIp->csOrbitCtrlData_tpi_OC) && 
    (pIp->m_starTime<(pIp->csOrbitCtrlData_tpi_OC+pIp->csOrbitCtrlPara_LmtT_Ahead_OCM)))
    {
        pIp->m_WorkMode = WKMD_OCM;
    }

    /* c.姿态机动 */
    if ((pIp->m_starTime > pIp->csMnvData_tm_xin) &&
        (pIp->csMnvData_F_MnvNextMode == 2))
    {
        pIp->m_WorkMode = WKMD_AMM;
    }

    return;
}


























// #include "IP_ModeConvert_NWM.h"

// void ModeConvert_NWMFun(void *p)
// {
//     ModeConvert_NWM *pIp = (ModeConvert_NWM*)p;
//     float64 maxA;
//     float64 maxR;
//     maxA = TripleFabsMax( pIp->csAttCoreData_A_c[0], pIp->csAttCoreData_A_c[1], pIp->csAttCoreData_A_c[2] );
//     maxR = TripleFabsMax( pIp->csAttCoreData_Rate_c[0], pIp->csAttCoreData_Rate_c[1], pIp->csAttCoreData_Rate_c[2] );


//     /* a.轨控不调姿 */
//     if ((pIp->csOrbitCtrlData_FS_MnvStyle_OC == 0) &&
// 		(m_starTime > (pIp->csOrbitCtrlData_tpi_OC - pIp->csOrbitCtrlPara_LmtT_Ahead_OCM)) &&
//         (m_starTime < (pIp->csOrbitCtrlData_tpi_OC - pIp->csOrbitCtrlPara_LmtT_Ahead_OCM + 10.0)) )
//     {
//         csOtherHook.ModeJudgeOM_hook((unint32)WKMD_OCM, maxA, maxR);
//     }

//     /* b.轨控调姿 */
//     if ((pIp->csOrbitCtrlData_FS_MnvStyle_OC > 0) &&
//         (m_starTime > pIp->csOrbitCtrlData_tMi_OC) &&
//         (m_starTime < (pIp->csOrbitCtrlData_tMi_OC + 10.0)))
//     {
//         csOtherHook.ModeJudgeOM_hook((unint32)WKMD_OAM, maxA, maxR);
//     }

//     /* c.姿态机动 */
//     if ((m_starTime > pIp->csMnvData_tm_xin) &&
//         (csMnvData.F_MnvNextMode == 2)  &&
//         (Fabsx( pIp->csMnvData_A_Trgt_ZR[0]) < pIp->csMnvPara_LmtPhi_TrgtMax) &&  /* 限制注入角度 */
//         (Fabsx( pIp->csMnvData_A_Trgt_ZR[1]) < pIp->csMnvPara_LmtTheta_TrgtMax) &&
//         (Fabsx( pIp->csMnvData_A_Trgt_ZR[2]) < pIp->csMnvPara_LmtPsi_TrgtMax) &&
//         ((pIp->csMnvData_tm_xin + csImmePara.LmtT_MnvOCProc) < pIp->csOrbitCtrlData_tMi_OC) &&
//         ((pIp->csMnvData_tm_xin + csImmePara.LmtT_MnvOCProc) < pIp->csOrbitCtrlData_tpi_OC) )
//     {
//         m_WorkMode = WKMD_AMM;

//         Memcpyx( (unint08*)&pIp->csMnvData_A_Trgt[0], (unint08 *)&pIp->csMnvData_A_Trgt_ZR[0], sizeof(pIp->csMnvData_A_Trgt));

//         /* 转姿态机动模式标志量初始化 */
//         CS_FlagInitBeforeAttMnv();

//         /* 调用5.3.3.3（含二维导引和偏流角机动的初始化前处理 ） */
//         CS_CalSARorDA_Init();

//         /* F_P2PType = F_P2PTypeZR */
//         pIp->csMnvData_F_P2PType = pIp->csMnvData_F_P2PTypeZR;

//         /* 5.2.4 姿态机动初始化 */
//         CS_TrgtP2P_Ini();
//         pIp->csMnvData_t_Turn = BIG_STAR_TIME;
//     }

// #if  _INCLUDE_SCM_  /* 若有对日巡航模式 */
//     /* d.对日巡航 */
//     if ( ( csModeData.FP_NWM2SCM_inj == 1 ) || ( csModeData.F_AttModeAutoChange == 1 ) )
//     {
//         csModeData.FP_NWM2SCM_inj = 0;       /* 清指令 */

//         m_WorkMode = WKMD_AMM;      /* 先转入姿态机动模式 */

//         csMnvData.F_MnvNextMode = 3;

//         /* 转姿态机动模式标志量初始化 */
//         CS_FlagInitBeforeAttMnv();

//         Memcpyx((unint08 *)&csMnvData.Cbo0[0][0], (unint08 *)&csAttCoreData.Cbo_Clp[0][0], sizeof(csMnvData.Cbo0));

//         pIp->csMnvData_F_P2PType = 1;

//         /* 5.2.4 姿态机动初始化 */
//         CS_TrgtP2P_Ini();
//     }
// #endif

//     /* e.系统故障 */
//     if ( csSysFDdata.FF_Sys == 1 )
//     {
//         if ( csJPCPara.FS_AC != 0 )
//         {
//             m_WorkMode = WKMD_AAM;
//         }
//         else
//         {
//             m_WorkMode = WKMD_NCM;
//         }

// #if _INCLUDE_CMG_

//         if ((csCtrlerOtherPara.FP_RWorCMGC[WKMD_AAM] == 0x1)
//             && (csCmgData.F_Start == 0x1) )
//         {
//             m_WorkMode = WKMD_AAM;
//         }
// #endif

// #if _INCLUDE_IOM_
//         /* FS_IOStyle = 0;  t_Turn = BigStarTime; */
//         csIomScanPara.FS_IOStyle = 0;
//         csIomScanData.t_Turn = BIG_STAR_TIME;
// #endif
//     }

//     /* f */
// #if _INCLUDE_APM_

//     /* IF1(NextMode= APM且t+Tc/2.0 >t_Turn) */
//     if ((csMnvData.NextMode == WKMD_APM) && (csMnvData.TargetMode == WKMD_STM) &&
//         ((m_starTime + m_DeltaT/2.0) > pIp->csMnvData_t_Turn))
//     {
//     	/* WorkMode=NextMode ; */
//         m_WorkMode = csMnvData.NextMode;

//         /* t_Turn=BigStarTime; */
//         pIp->csMnvData_t_Turn = BIG_STAR_TIME;

//     	/* tm5=t5_PreT;  tm4=t4_PreT;  tm_Start=tTr_Start;
//      	* 在预处理最后赋值了 */

//     } /* END1 */

//     //被动到被动成像任务可通过条件c的tm_xin和F_MnvNextMode=2转入偏置飞行模式

//     /* #endif */
// #endif

// #if _INCLUDE_IOM_

//     /* g */
//     if (((csIomScanPara.FS_IOStyle == 1) || (csIomScanPara.FS_IOStyle == 2)) &&
//         ((m_starTime + m_DeltaT/2.0) > csIomScanData.t_Turn) &&
//         ((csIomScanData.t_Turn + csImmePara.LmtT_IOMOCProc) < pIp->csOrbitCtrlData_tMi_OC) &&
//         ((csIomScanData.t_Turn + csImmePara.LmtT_IOMOCProc) < pIp->csOrbitCtrlData_tpi_OC) )
//     {
//         csIomScanPara.FS_IOStyle = 0;
//         pIp->csMnvData_F_P2PType      = 3;

//         if ((m_starTime < (csIomScanData.t_Turn+10.0)) &&
//             (csAttPara.FS_AttD == 1) &&
//             (csCtrlerOtherPara.FP_RWorCMGC[m_WorkMode] == 0x1))
//         {
//             m_WorkMode = WKMD_IOM;

//             csMnvData.FS_MnvTraceStyleZR = csMnvPara.FS_MnvTraceStyle;

//             csMnvPara.FS_MnvTraceStyle = 0;  /* 强制采用混合轨迹规划 */
//         }
//         else
//         {
//             csIomScanData.t_Turn = BIG_STAR_TIME;
//         }
//     }

// #endif


//     return;
// }




