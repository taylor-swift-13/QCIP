#include "IP_CS_TrgtAtt_AHM_USU.h"

void w2dEuler(float64 *pRate, float64 *pAngle, float64 *wbo, unint32 seq);
void XX_Track_Atti(void *p);
void XX_RateForeDiff(void *p);
float64 XX_RateForeHybridTrace(void* p);
/**********************************************************************
 * 功能描述:  5.3.2.5.1    常规偏置飞行模式目标姿态计算
功能:常规偏置飞行模式目标姿态计算
***********************************************************************/
void CS_TrgtAtt_AHM_USUFun(void *p)
{
    CS_TrgtAtt_AHM_USU *pIp = (CS_TrgtAtt_AHM_USU*)p;

    
    float64 tmpAtt[3];
    float64 tmpCp[3][3];
    float64 tmpF33_1[3][3];
    float64 tmpC_Trgtb[3][3];
    float64 Cri[3][3];
    float64 cw[3];

    tmpAtt[0] = 0.0;
    tmpAtt[1] = 0.0;
    tmpAtt[2] = pIp->csDriftAngData_Psi_DA;

    /* tmpCp = Angle2DCM(0.0, 0.0, ψ_DA, Seq_AttD[WorkMode]); */
    CS_Angle2C(&tmpCp[0][0], &tmpAtt[0], pIp->csAttPara_Seq_AttD[m_WorkMode]);

    /* tmpC_Trgtb = Cbiasp * Angle2DCM (φ_Trgt, θ_Trgt, ψ_Trgt, Seq_AttD[WorkMode]); */
    CS_Angle2C(&tmpF33_1[0][0], &pIp->csMnvData_A_Trgt[0], pIp->csAttPara_Seq_AttD[m_WorkMode]);
    MatrixMulti333(&tmpC_Trgtb[0][0], &pIp->csAttCoreData_Cbiasp[0][0], &tmpF33_1[0][0]);

    /* Cro_si = tmpCp *Csib* tmpC_Trgtb; */
    MatrixMulti333(&tmpF33_1[0][0], &tmpCp[0][0], &(pIp->csLoadAxisData_Csib_DARot[0][0]));
    MatrixMulti333(&pIp->csAttCoreData_Cro_si[0][0], &tmpF33_1[0][0], &tmpC_Trgtb[0][0]);

    /* ωri_si=Cro_si*ωoi +[0; 0; dψ_DA];  转序要求3必须在最后; */
    MatrixMulti331(&pIp->csAttCoreData_wri_si[0], &pIp->csAttCoreData_Cro_si[0][0], &pIp->csOrbData_w0i[0]);
    pIp->csAttCoreData_wri_si[2] += pIp->csDriftAngData_dPsi_DA;

    /* Cro = Cbsi * Cro_si;  */
    MatrixMulti333(&pIp->csAttCoreData_Cro[0][0], &pIp->csLoadAxisData_Cbsi_DARot[0][0], &pIp->csAttCoreData_Cro_si[0][0]);

    /* ωri = Cbsi *ωri_si; */
    MatrixMulti331(&pIp->csAttCoreData_wri[0], &pIp->csLoadAxisData_Cbsi_DARot[0][0], &pIp->csAttCoreData_wri_si[0]);

    /* [φ_Ref_si，θ_Ref_si，ψ_Ref_si]=DCM2Angle（Cro_si，123）； */
    C2Angle123(&pIp->csMnvData_A_Ref_si[0], &pIp->csAttCoreData_Cro_si[0][0]);

    /* Cri = Cro*OrbOut.Coi; */
    MatrixMulti333(&Cri[0][0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_coi[0][0]);

    /* qri=DCM2q(Cri); */
    C2Q(&pIp->csAttCoreData_qri[0], &Cri[0][0]);

    /* ωro = ωri- Cro * ωoi */
    MatrixMulti331(&cw[0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_w0i[0]);
    pIp->csAttCoreData_wro[0] = pIp->csAttCoreData_wri[0] - cw[0];
    pIp->csAttCoreData_wro[1] = pIp->csAttCoreData_wri[1] - cw[1];
    pIp->csAttCoreData_wro[2] = pIp->csAttCoreData_wri[2] - cw[2];

    /* 调用5.3.1.5（计算规划欧拉角、欧拉角速度和角加速度） */
    XX_Track_Atti(pIp);//xx7特殊处理, 替换CS_Track_Atti();

    return;
}



/***********************************************************************
 * 功能描述:  5.3.1.5 规划欧拉角、欧拉角速度和角加速度计算
功能:规划欧拉角、欧拉角速度和角加速度计算
***********************************************************************/
void XX_Track_Atti(void *p)
{
    CS_TrgtAtt_AHM_USU *pIp = (CS_TrgtAtt_AHM_USU*)p;
	float64 dwri[3];
	float64 tmp;

    /* [φ_Ref, θ_Ref, ψ_Ref]=DCM2Angle(Cro, Seq_AttD[WorkMode]); */
    CS_C2Angle(pIp->csMnvData_A_Ref, &pIp->csAttCoreData_Cro[0][0], pIp->csAttPara_Seq_AttD[m_WorkMode]);

    /* [dφ_Ref, dθ_Ref, dψ_Ref]=w2dAngle(φ_Ref, θ_Ref,ψ_Ref, ωro,
     * Seq_AttD[WorkMode]); */
    w2dEuler(pIp->csMnvData_dA_Ref, pIp->csMnvData_A_Ref, pIp->csAttCoreData_wro,
            pIp->csAttPara_Seq_AttD[m_WorkMode]);

    /* ddφ_Ref=(dφ_Ref-dφ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[0] = (pIp->csMnvData_dA_Ref[0] - pIp->csMnvData_dA_Ref_Lst[0]) / m_DeltaT;

    /* ddθ_Ref=(dθ_Ref-dθ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[1] = (pIp->csMnvData_dA_Ref[1] - pIp->csMnvData_dA_Ref_Lst[1]) / m_DeltaT;

    /* ddψ_Ref=(dψ_Ref-dψ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[2] = (pIp->csMnvData_dA_Ref[2] - pIp->csMnvData_dA_Ref_Lst[2]) / m_DeltaT;

    /* 计算补偿力矩 */
    /* IF1(WorkMode=AMM 且(F_MnvNextMode=1 或 F_MnvNextMode=2)) */
    if ((m_WorkMode == WKMD_AMM) &&
        ((pIp->csMnvData_F_MnvNextMode == 1u) || (pIp->csMnvData_F_MnvNextMode == 2u)))
    {
        /* 调用《新增预报角速度差分算法模块》，输出wri2 */
        XX_RateForeDiff(pIp);

        /* dωri=(ωri2-ωri2_Lst)/Tc; */
        dwri[0] = (pIp->xxAttCoreData_wri2[0] - pIp->xxAttCoreData_wri2_Lst[0]) / m_DeltaT;
        dwri[1] = (pIp->xxAttCoreData_wri2[1] - pIp->xxAttCoreData_wri2_Lst[1]) / m_DeltaT;
        dwri[2] = (pIp->xxAttCoreData_wri2[2] - pIp->xxAttCoreData_wri2_Lst[2]) / m_DeltaT;
    }
    else
    {
        pIp->xxAttCoreData_wri2[0] = pIp->csAttCoreData_wri[0];
        pIp->xxAttCoreData_wri2[1] = pIp->csAttCoreData_wri[1];
        pIp->xxAttCoreData_wri2[2] = pIp->csAttCoreData_wri[2];

        /* dωri=(ωri-ωri_Lst)/Tc; */
        dwri[0] = (pIp->csAttCoreData_wri[0] - pIp->csAttCoreData_wri_Lst[0]) / m_DeltaT;
        dwri[1] = (pIp->csAttCoreData_wri[1] - pIp->csAttCoreData_wri_Lst[1]) / m_DeltaT;
        dwri[2] = (pIp->csAttCoreData_wri[2] - pIp->csAttCoreData_wri_Lst[2]) / m_DeltaT;
    }

    /* TorqRef= Js*dωri*Mdf_TorqRef_RateTrace */
    MatrixMulti331(&pIp->csMnvData_TorqRef[0], &csCtrlerData.Js_Use[0][0], &dwri[0]);
    pIp->csMnvData_TorqRef[0] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[0];
    pIp->csMnvData_TorqRef[1] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[1];
    pIp->csMnvData_TorqRef[2] = pIp->csCtrlerOtherPara_Mdf_TorqRef * pIp->csMnvData_TorqRef[2];

    tmp = VectorNorm3(&pIp->csMnvData_TorqRef[0]);
    if (tmp > pIp->csCtrlerOtherPara_Mlf_TorqRef)
    {
        pIp->csMnvData_TorqRef[0] = 0.0;
        pIp->csMnvData_TorqRef[1] = 0.0;
        pIp->csMnvData_TorqRef[2] = 0.0;
    }

    pIp->xxAttCoreData_wri2_Lst[0] = pIp->xxAttCoreData_wri2[0];
    pIp->xxAttCoreData_wri2_Lst[1] = pIp->xxAttCoreData_wri2[1];
    pIp->xxAttCoreData_wri2_Lst[2] = pIp->xxAttCoreData_wri2[2];

    return;
}



/* 预报角速度差分算法模块，输出wri2 */
void XX_RateForeDiff(void *p)
{
    CS_TrgtAtt_AHM_USU *pIp = (CS_TrgtAtt_AHM_USU*)p;
    float64 tmpCp[3][3], tmpw[4];
    float64 tmpCpp[3][3];
    float64 wrb02[3];
    float64 tmp3_1[3], tmp3_2[3], wri_si2[3];

    /* IF1(FS_MnvTraceStyle=0)//该参数永远为0（可以把通用部分的其他轨迹算法清掉） */
    if (pIp->csMnvPara_FS_MnvTraceStyle == 0u)
    {
        /* 调用《混合轨迹仅角速度预报函数》（输入tsinacc, tconacc,tm2'，amax,dt_TorqRef2，输出dχ_Ref2）//型号如果确定不注入1，可以少轨迹 */
        pIp->xxAttCoreData_dChi_Ref2 = XX_RateForeHybridTrace(pIp);
    }

    /* IF1(F_MnvNextMode=1 或 F_MnvNextMode=2) */
	if ((pIp->csMnvData_F_MnvNextMode == 1u) || (pIp->csMnvData_F_MnvNextMode == 2u))
    {
        /* tmpCp= q2DCM([0; 0; sin(ψ_DA /2); cos(ψ_DA /2)]); 视轴偏流角补偿 */
        tmpw[0] = 0.0;
        tmpw[1] = 0.0;
        tmpw[2] = Sinx(pIp->csDriftAngData_Psi_DA / 2.0);
        tmpw[3] = Cosx(pIp->csDriftAngData_Psi_DA / 2.0);
        Q2C(&tmpCp[0][0], &tmpw[0]);

        /* tmpCpp = tmpCp* Csib_DARot; */
        MatrixMulti333(&tmpCpp[0][0], &tmpCp[0][0], &pIp->csLoadAxisData_Csib_DARot[0][0]);

        /* ωrb02=[ex*dχ_Ref2; ey*dχ_Ref2; ez*dχ_Ref2]； */
        wrb02[0] = csMnvData.e_xyz[0] * pIp->xxAttCoreData_dChi_Ref2;
        wrb02[1] = csMnvData.e_xyz[1] * pIp->xxAttCoreData_dChi_Ref2;
        wrb02[2] = csMnvData.e_xyz[2] * pIp->xxAttCoreData_dChi_Ref2;

        /* ωri_si2=Cro_si*ωoi + tmpCpp*ωrb02+[0; 0; dψ_DA]; 转序要求3必须在最后; */
        MatrixMulti331(&tmp3_1[0], &pIp->csAttCoreData_Cro_si[0][0], &pIp->csOrbData_w0i[0]);
        MatrixMulti331(&tmp3_2[0], &tmpCpp[0][0], &wrb02[0]);
        wri_si2[0] = tmp3_1[0] + tmp3_2[0] + 0.0;
        wri_si2[1] = tmp3_1[1] + tmp3_2[1] + 0.0;
        wri_si2[2] = tmp3_1[2] + tmp3_2[2] + pIp->csDriftAngData_dPsi_DA;

        /* ωri2 = Cbsi_DARot *ωri_si2; */
        MatrixMulti331(&pIp->xxAttCoreData_wri2[0], &pIp->csLoadAxisData_Cbsi_DARot[0][0], &wri_si2[0]);
        // MatrixMulti331(&csAttCoreData.wri[0], &pIp->csLoadAxisData_Cbsi_DARot[0][0], &wri_si2[0]);
    }

    return;
}


/* 混合轨迹仅角速度预报函数 */
float64 XX_RateForeHybridTrace(void * p)
{
    CS_TrgtAtt_AHM_USU *pIp = (CS_TrgtAtt_AHM_USU*)p;
    float64 w_ping;
    float64 tmsav;
    float64 dChir;
    float64 amax_w_ping;

    /* (2)计算规划轨迹 */
    if (pIp->csMnvData_mTrack_t_sinacc > 1.0e-3)
    {
        w_ping = PI / 2.0 / pIp->csMnvData_mTrack_t_sinacc;
    }
    else
    {
        w_ping = 0.5 * PI * 1000.0;
    }

    /* 机动角速度规划 */
    tmsav = pIp->csMnvData_mTrack_tmA;
    pIp->csMnvData_mTrack_tmA = tmsav + pIp->xxAttCoreData_dt_TorqRef2;

    amax_w_ping = pIp->csMnvData_mTrack_amax / w_ping;
    if (pIp->csMnvData_mTrack_tmA < 0.0)
    {
        dChir = 0.0;
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_t_m1a) /* 加速度的加速度段 */
    {
        dChir = amax_w_ping * (1.0 - Cosx(w_ping * pIp->csMnvData_mTrack_tmA));
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_t_m1b) /* 加速度的匀速度段 */
    {
        dChir = amax_w_ping + pIp->csMnvData_mTrack_amax * (pIp->csMnvData_mTrack_tmA - pIp->csMnvData_mTrack_t_m1a);
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_tm1p)  /* 加速度的减速度段 */
    {
        dChir = amax_w_ping + pIp->csMnvData_mTrack_amax * pIp->csMnvData_mTrack_t_conacc +
                amax_w_ping * Sinx(w_ping * (pIp->csMnvData_mTrack_tmA - pIp->csMnvData_mTrack_t_m1b));
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_tm2p)  /* 角速度的匀速度段 */
    {
        dChir = pIp->csMnvData_mTrack_amax * pIp->csMnvData_mTrack_t_conacc + 2.0 * amax_w_ping;
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_t_m3a) /* 角加速度的减速段 */
    {
        dChir = pIp->csMnvData_mTrack_amax * pIp->csMnvData_mTrack_t_conacc +
                amax_w_ping * (1.0 + Cosx(w_ping * (pIp->csMnvData_mTrack_tmA - pIp->csMnvData_mTrack_tm2p)));
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_t_m3b) /* 加速度的匀速度段 */
    {
        dChir = pIp->csMnvData_mTrack_amax * pIp->csMnvData_mTrack_t_conacc + amax_w_ping -
                pIp->csMnvData_mTrack_amax * (pIp->csMnvData_mTrack_tmA - pIp->csMnvData_mTrack_t_m3a);
    }
    else if (pIp->csMnvData_mTrack_tmA < pIp->csMnvData_mTrack_tm3p)  /* 角加速度的加速度段 */
    {
        dChir = amax_w_ping * (1.0 - Sinx(w_ping * (pIp->csMnvData_mTrack_tmA - pIp->csMnvData_mTrack_t_m3b)));
    }
    else
    {
        dChir = 0.0;
    }

    pIp->csMnvData_mTrack_tmA = tmsav;

    return dChir;
}



// 函数部分

/* 三轴欧拉姿态角速度预估算法 */
void w2dEuler(float64 *pRate, float64 *pAngle, float64 *wbo, unint32 seq)
{
    float64 s1;
    float64 s2;
    float64 s3;
    float64 c1;
    float64 c2;
    float64 c3;

    /* 角度正弦 */
    s1 = Sinx(pAngle[0]);
    s2 = Sinx(pAngle[1]);
    s3 = Sinx(pAngle[2]);

    /* 角度余弦 */
    c1 = Cosx(pAngle[0]);
    c2 = Cosx(pAngle[1]);
    c3 = Cosx(pAngle[2]);

    switch (seq)  /* 对转序进行判决 */
    {

    case 132:  /* 转序132 */

           pRate[0] = (c2 * wbo[0] + s2 * wbo[2]) / c3;

           pRate[1] = wbo[1] + (c2 * wbo[0] + s2 * wbo[2]) * s3 / c3;

           pRate[2] = - s2 * wbo[0] + c2 * wbo[2];

           break;

    case 321:  /* 转序321 */

           pRate[0] = wbo[0] + (s1 * wbo[1] + c1 * wbo[2]) * s2 / c2;

           pRate[1] = c1 * wbo[1] - s1 * wbo[2];

           pRate[2] = (s1 * wbo[1] + c1 * wbo[2]) / c2;

           break;

    case 312:  /* 转序312 */

           pRate[0] = wbo[0] * c2 + wbo[2] * s2;

           pRate[1] = wbo[1] + (wbo[0] * s2 - wbo[2] * c2) * s1 / c1;

           pRate[2] = (- wbo[0] * s2 + wbo[2] * c2) / c1;

           break;

    case 213:  /* 转序213 */

           pRate[0] = c3 * wbo[0] - s3 * wbo[1];

           pRate[1] = (s3 * wbo[0] + c3 * wbo[1]) / c1;

           pRate[2] = wbo[2] + (s3 * wbo[0] + c3 * wbo[1]) * s1 / c1;

           break;

    case 123:  /* 转序123 */

           pRate[0] = (c3 * wbo[0] - s3 * wbo[1]) / c2 ;

           pRate[1] = c3 * wbo[1] + s3 * wbo[0];

           pRate[2] = wbo[2]-(c3 * wbo[0] - s3 * wbo[1]) *s2/ c2;

           break;

    case 231:  /* 转序231 */

           pRate[0] =  wbo[0]-(c1 * wbo[1] - s1 * wbo[2]) *s3/ c3;

           pRate[1] = (c1 * wbo[1] - s1 * wbo[2]) / c3;

           pRate[2] = c1 * wbo[2] + s1 * wbo[1];

           break;

    default:  /* break */
        break;
    }

    return;
}