#include "IP_CS_TrgtAtt_AMM_2NoSAR.h"
/***********************************************************************
 * 功能描述:  5.3.2.4.2 点对点机动到对地/偏置/轨控目标姿态(不引入SAR载荷)
***********************************************************************/

void XX_Track_Atti(void *p);

void CS_TrgtAtt_AMM_2NoSARFun(void *p)
{
    CS_TrgtAtt_AMM_2NoSAR *pIp = (CS_TrgtAtt_AMM_2NoSAR*)p;
    float64 qro_ping[4];
    float64 tmpCp[3][3];
    float64 tmpCpp[3][3];
    float64 tmpQ[4];
    float64 tmpC[3][3];
    float64 tmpF33[3][3];
    float64 tmpF31_1[3];
    float64 tmpF31_2[3];

    /* (1)计算期望轨迹
     * 调用5.3.2.4.3（点对点机动期望轨迹）*/
    CS_TrgtAtt_AMM_Exp();

    /* (2)计算规划的惯性系目标姿态四元数qri、轨道系目标四元数qro、目标角速度ωri */
    QMulti(&qro_ping[0], &pIp->csMnvData_qbo0[0], &pIp->csMnvData_qrb0[0]);

    /* tmpCp= q2DCM([0; 0; sin(ψ_DA /2); cos(ψ_DA /2)]);  视轴偏流角补偿 */
    tmpQ[0] = 0.0;
    tmpQ[1] = 0.0;
    tmpQ[2] = Sinx(0.5 * pIp->csDriftAngData_Psi_DA);
    tmpQ[3] = Cosx(0.5 * pIp->csDriftAngData_Psi_DA);
    Q2C(&tmpCp[0][0], &tmpQ[0]);

    /* tmpCpp = tmpCp * Csib */
    MatrixMulti333(&tmpCpp[0][0], &tmpCp[0][0], &pIp->csLoadAxisData_Csib_DARot[0][0]);

    /* Cro_si = tmpCpp * Cbiasp * q2DCM(qro_ping);  视轴系补上偏流角 */
    Q2C(&tmpC[0][0], &qro_ping[0]);
    MatrixMulti333(&tmpF33[0][0], &pIp->csAttCoreData_Cbiasp[0][0], &tmpC[0][0]);
    MatrixMulti333(&pIp->csAttCoreData_Cro_si[0][0], &tmpCpp[0][0], &tmpF33[0][0]);

    /* Cro_si * ωoi */
    MatrixMulti331(&tmpF31_1[0], &pIp->csAttCoreData_Cro_si[0][0], &pIp->csOrbData_w0i[0]);

    /* tmpCpp * ωrb0 */
    MatrixMulti331(&tmpF31_2[0], &tmpCpp[0][0], &pIp->csMnvData_wrb0[0]);

    pIp->csAttCoreData_wri_si[0] = tmpF31_1[0] + tmpF31_2[0];
    pIp->csAttCoreData_wri_si[1] = tmpF31_1[1] + tmpF31_2[1];
    pIp->csAttCoreData_wri_si[2] = tmpF31_1[2] + tmpF31_2[2] + csDriftAngData.dPsi_DA;

    /* Cp = Cbsi * tmpCpp * Cbiasp
    MatrixMulti333(&tmpF33[0][0], &tmpCpp[0][0], &pIp->csAttCoreData_Cbiasp[0][0]);
    MatrixMulti333(&Cp[0][0], &pIp->csLoadAxisData_Csib_DARot[0][0], &tmpF33[0][0]); */

    /* Cro= Cbsi * Cro_si; */
    MatrixMulti333(&pIp->csAttCoreData_Cro[0][0], &pIp->csLoadAxisData_Csib_DARot[0][0], &pIp->csAttCoreData_Cro_si[0][0]);

    /* ωri = Cbsi * ωri_si;  */
    MatrixMulti331(&pIp->csAttCoreData_wri[0], &pIp->csLoadAxisData_Csib_DARot[0][0], &pIp->csAttCoreData_wri_si[0]);

    /* qro = DCM2q(Cro); */
    C2Q(&pIp->csAttCoreData_qro[0], &pIp->csAttCoreData_Cro[0][0]);

    /* qri = DCM2q(Cro * OrbOut.Coi); */
    MatrixMulti333(&tmpC[0][0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_coi[0][0]);
    C2Q(&pIp->csAttCoreData_qri[0], &tmpC[0][0]);

    /* [φ_Ref_si，θ_Ref_si，ψ_Ref_si]=DCM2Angle(Cro_si,123)； */
    C2Angle123(&pIp->csMnvData_A_Ref_si[0], &pIp->csAttCoreData_Cro_si[0][0]);

    /* (3)计算补偿力矩 */
    /* 调用5.3.2.4.4（点对点机动补偿力矩计算）
    CS_TrgtAtt_AMM_Torq(&Cp[0][0]); */

    /* (4) 姿态机动模式下计算规划欧拉角 */
    MatrixMulti331(&tmpF31_1[0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_w0i[0]);
    pIp->csAttCoreData_wro[0] = pIp->csAttCoreData_wri[0] - tmpF31_1[0];
    pIp->csAttCoreData_wro[1] = pIp->csAttCoreData_wri[1] - tmpF31_1[1];
    pIp->csAttCoreData_wro[2] = pIp->csAttCoreData_wri[2] - tmpF31_1[2];

    /* 调用5.3.1.5（计算规划欧拉角、欧拉角速度和角加速度） */
    XX_Track_Atti(pIp);//xx7特殊处理, 替换CS_Track_Atti();

    return;
}

/***********************************************************************
 * 功能描述:  5.3.1.5 规划欧拉角、欧拉角速度和角加速度计算
功能:规划欧拉角、欧拉角速度和角加速度计算
***********************************************************************/
// void XX_Track_Atti(void *p)
// {
//     CS_TrgtAtt_AMM_2NoSAR *pIp = (CS_TrgtAtt_AMM_2NoSAR*)p;
// 	float64 dwri[3];
// 	float64 tmp;

//     /* [φ_Ref, θ_Ref, ψ_Ref]=DCM2Angle(Cro, Seq_AttD[WorkMode]); */
//     CS_C2Angle(pIp->csMnvData_A_Ref, &pIp->csAttCoreData_Cro[0][0], pIp->csAttPara_Seq_AttD[m_WorkMode]);

//     /* [dφ_Ref, dθ_Ref, dψ_Ref]=w2dAngle(φ_Ref, θ_Ref,ψ_Ref, ωro,
//      * Seq_AttD[WorkMode]); */
//     w2dEuler(pIp->csMnvData_dA_Ref, pIp->csMnvData_A_Ref, pIp->csAttCoreData_wro,
//             pIp->csAttPara_Seq_AttD[m_WorkMode]);

//     /* ddφ_Ref=(dφ_Ref-dφ_Ref_Lst)/Tc; */
//     pIp->csMnvData_ddA_Ref[0] = (pIp->csMnvData_dA_Ref[0] - pIp->csMnvData_dA_Ref_Lst[0]) / m_DeltaT;

//     /* ddθ_Ref=(dθ_Ref-dθ_Ref_Lst)/Tc; */
//     pIp->csMnvData_ddA_Ref[1] = (pIp->csMnvData_dA_Ref[1] - pIp->csMnvData_dA_Ref_Lst[1]) / m_DeltaT;

//     /* ddψ_Ref=(dψ_Ref-dψ_Ref_Lst)/Tc; */
//     pIp->csMnvData_ddA_Ref[2] = (pIp->csMnvData_dA_Ref[2] - pIp->csMnvData_dA_Ref_Lst[2]) / m_DeltaT;

//     /* 计算补偿力矩 */
//     /* IF1(WorkMode=AMM 且(F_MnvNextMode=1 或 F_MnvNextMode=2)) */
//     if ((m_WorkMode == WKMD_AMM) &&
//         ((pIp->csMnvData_F_MnvNextMode == 1u) || (pIp->csMnvData_F_MnvNextMode == 2u)))
//     {
//         /* 调用《新增预报角速度差分算法模块》，输出wri2 */
//         XX_RateForeDiff(pIp);

//         /* dωri=(ωri2-ωri2_Lst)/Tc; */
//         dwri[0] = (pIp->xxAttCoreData_wri2[0] - pIp->xxAttCoreData_wri2_Lst[0]) / m_DeltaT;
//         dwri[1] = (pIp->xxAttCoreData_wri2[1] - pIp->xxAttCoreData_wri2_Lst[1]) / m_DeltaT;
//         dwri[2] = (pIp->xxAttCoreData_wri2[2] - pIp->xxAttCoreData_wri2_Lst[2]) / m_DeltaT;
//     }
//     else
//     {
//         pIp->xxAttCoreData_wri2[0] = pIp->csAttCoreData_wri[0];
//         pIp->xxAttCoreData_wri2[1] = pIp->csAttCoreData_wri[1];
//         pIp->xxAttCoreData_wri2[2] = pIp->csAttCoreData_wri[2];

//         /* dωri=(ωri-ωri_Lst)/Tc; */
//         dwri[0] = (pIp->csAttCoreData_wri[0] - pIp->csAttCoreData_wri_Lst[0]) / m_DeltaT;
//         dwri[1] = (pIp->csAttCoreData_wri[1] - pIp->csAttCoreData_wri_Lst[1]) / m_DeltaT;
//         dwri[2] = (pIp->csAttCoreData_wri[2] - pIp->csAttCoreData_wri_Lst[2]) / m_DeltaT;
//     }

//     /* TorqRef= Js*dωri*Mdf_TorqRef_RateTrace */
//     MatrixMulti331(&pIp->csMnvData_TorqRef[0], &csCtrlerData.Js_Use[0][0], &dwri[0]);
//     pIp->csMnvData_TorqRef[0] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[0];
//     pIp->csMnvData_TorqRef[1] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[1];
//     pIp->csMnvData_TorqRef[2] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[2];

//     tmp = VectorNorm3(&pIp->csMnvData_TorqRef[0]);
//     if (tmp > pIp->csCtrlerOtherPara_Mlf_TorqRef)
//     {
//         pIp->csMnvData_TorqRef[0] = 0.0;
//         pIp->csMnvData_TorqRef[1] = 0.0;
//         pIp->csMnvData_TorqRef[2] = 0.0;
//     }

//     pIp->xxAttCoreData_wri2_Lst[0] = pIp->xxAttCoreData_wri2[0];
//     pIp->xxAttCoreData_wri2_Lst[1] = pIp->xxAttCoreData_wri2[1];
//     pIp->xxAttCoreData_wri2_Lst[2] = pIp->xxAttCoreData_wri2[2];

//     return;
// }
