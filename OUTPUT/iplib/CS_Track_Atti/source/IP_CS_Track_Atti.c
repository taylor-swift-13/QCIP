#include "IP_CS_Track_Atti.h"

void CS_C2AngleX_temp1(void *p);
void w2dEuler_temp1(void *p);

void CS_Track_AttiFun(void *p)
{
    CS_Track_Atti *pIp = (CS_Track_Atti*)p;

    float64 tmpa[3];
    float64 tmp;

    /* [φ_Ref, θ_Ref, ψ_Ref]=DCM2Angle(Cro, Seq_AttD[WorkMode]); */
    CS_C2AngleX_temp1(pIp);
    w2dEuler_temp1(pIp);
    /* [dφ_Ref, dθ_Ref, dψ_Ref]=w2dAngle(φ_Ref, θ_Ref,ψ_Ref, ωro,
      * Seq_AttD[WorkMode]); */

    /* ddφ_Ref=(dφ_Ref-dφ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[0] = (pIp->csMnvData_dA_Ref[0] - pIp->csMnvData_dA_Ref_Lst[0]) / pIp->m_DeltaT;

    /* ddθ_Ref=(dθ_Ref-dθ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[1] = (pIp->csMnvData_dA_Ref[1] - pIp->csMnvData_dA_Ref_Lst[1]) / pIp->m_DeltaT;

    /* ddψ_Ref=(dψ_Ref-dψ_Ref_Lst)/Tc; */
    pIp->csMnvData_ddA_Ref[2] = (pIp->csMnvData_dA_Ref[2] - pIp->csMnvData_dA_Ref_Lst[2]) / pIp->m_DeltaT;

    /* 计算补偿力矩 */
    tmpa[0] = (pIp->csAttCoreData_wri[0] - pIp->csAttCoreData_wri_Lst[0]) / pIp->m_DeltaT;
    tmpa[1] = (pIp->csAttCoreData_wri[1] - pIp->csAttCoreData_wri_Lst[1]) / pIp->m_DeltaT;
    tmpa[2] = (pIp->csAttCoreData_wri[2] - pIp->csAttCoreData_wri_Lst[2]) / pIp->m_DeltaT;

    /* TorqRef= Js*tmpa*Mdf_TorqRef_RateTrace */
    MatrixMulti331(&pIp->csMnvData_TorqRef[0], &pIp->csCtrlerData_Js_Use[0][0], &tmpa[0]);
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

    Memcpyx((unint08 *)pIp->csMnvData_dA_Ref_Lst,
            (unint08 *)pIp->csMnvData_dA_Ref,
            sizeof(pIp->csMnvData_dA_Ref_Lst));
    Memcpyx((unint08 *)pIp->csAttCoreData_wri_Lst,
            (unint08 *)pIp->csAttCoreData_wri,
            sizeof(pIp->csAttCoreData_wri_Lst));

    return;
}


void CS_C2AngleX_temp1(void *p)
{
    CS_Track_Atti *pIp = (CS_Track_Atti*)p;

    switch(pIp->csAttPara_Seq_AttD[pIp->m_WorkMode])
    {
    case 123:
        C2Angle123(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    case 132:
        C2Angle132(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    case 213:
        C2Angle213(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    case 231:
        C2Angle231(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    case 312:
        C2Angle312(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    case 321:
        C2Angle321(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    default:
        C2Angle321(&pIp->csMnvData_A_Ref[0], &pIp->csAttCoreData_Cro[0][0]);
        break;
    }

    return;
}


void w2dEuler_temp1(void *p)
{
    CS_Track_Atti *pIp = (CS_Track_Atti*)p;
    float64 s1;
    float64 s2;
    float64 s3;
    float64 c1;
    float64 c2;
    float64 c3;

    /* 角度正弦 */
    s1 = Sinx(pIp->csMnvData_A_Ref[0]);
    s2 = Sinx(pIp->csMnvData_A_Ref[1]);
    s3 = Sinx(pIp->csMnvData_A_Ref[2]);

    /* 角度余弦 */
    c1 = Cosx(pIp->csMnvData_A_Ref[0]);
    c2 = Cosx(pIp->csMnvData_A_Ref[1]);
    c3 = Cosx(pIp->csMnvData_A_Ref[2]);

    switch (pIp->csAttPara_Seq_AttD[pIp->m_WorkMode])  /* 对转序进行判决 */
    {

    case 132:  /* 转序132 */

        pIp->csMnvData_dA_Ref[0] = (c2 * pIp->csAttCoreData_wro[0] + s2 * pIp->csAttCoreData_wro[2]) / c3;

        pIp->csMnvData_dA_Ref[1] = pIp->csAttCoreData_wro[1] + (c2 * pIp->csAttCoreData_wro[0] + s2 * pIp->csAttCoreData_wro[2]) * s3 / c3;

        pIp->csMnvData_dA_Ref[2] = - s2 * pIp->csAttCoreData_wro[0] + c2 * pIp->csAttCoreData_wro[2];

        break;

    case 321:  /* 转序321 */

        pIp->csMnvData_dA_Ref[0] = pIp->csAttCoreData_wro[0] + (s1 * pIp->csAttCoreData_wro[1] + c1 * pIp->csAttCoreData_wro[2]) * s2 / c2;

        pIp->csMnvData_dA_Ref[1] = c1 * pIp->csAttCoreData_wro[1] - s1 * pIp->csAttCoreData_wro[2];

        pIp->csMnvData_dA_Ref[2] = (s1 * pIp->csAttCoreData_wro[1] + c1 * pIp->csAttCoreData_wro[2]) / c2;

        break;

    case 312:  /* 转序312 */

        pIp->csMnvData_dA_Ref[0] = pIp->csAttCoreData_wro[0] * c2 + pIp->csAttCoreData_wro[2] * s2;

        pIp->csMnvData_dA_Ref[1] = pIp->csAttCoreData_wro[1] + (pIp->csAttCoreData_wro[0] * s2 - pIp->csAttCoreData_wro[2] * c2) * s1 / c1;

        pIp->csMnvData_dA_Ref[2] = (- pIp->csAttCoreData_wro[0] * s2 + pIp->csAttCoreData_wro[2] * c2) / c1;

        break;

    case 213:  /* 转序213 */

        pIp->csMnvData_dA_Ref[0] = c3 * pIp->csAttCoreData_wro[0] - s3 * pIp->csAttCoreData_wro[1];

        pIp->csMnvData_dA_Ref[1] = (s3 * pIp->csAttCoreData_wro[0] + c3 * pIp->csAttCoreData_wro[1]) / c1;

        pIp->csMnvData_dA_Ref[2] = pIp->csAttCoreData_wro[2] + (s3 * pIp->csAttCoreData_wro[0] + c3 * pIp->csAttCoreData_wro[1]) * s1 / c1;

        break;

    case 123:  /* 转序123 */

        pIp->csMnvData_dA_Ref[0] = (c3 * pIp->csAttCoreData_wro[0] - s3 * pIp->csAttCoreData_wro[1]) / c2 ;

        pIp->csMnvData_dA_Ref[1] = c3 * pIp->csAttCoreData_wro[1] + s3 * pIp->csAttCoreData_wro[0];

        pIp->csMnvData_dA_Ref[2] = pIp->csAttCoreData_wro[2]-(c3 * pIp->csAttCoreData_wro[0] - s3 * pIp->csAttCoreData_wro[1]) *s2/ c2;

        break;

    case 231:  /* 转序231 */

        pIp->csMnvData_dA_Ref[0] =  pIp->csAttCoreData_wro[0]-(c1 * pIp->csAttCoreData_wro[1] - s1 * pIp->csAttCoreData_wro[2]) *s3/ c3;

        pIp->csMnvData_dA_Ref[1] = (c1 * pIp->csAttCoreData_wro[1] - s1 * pIp->csAttCoreData_wro[2]) / c3;

        pIp->csMnvData_dA_Ref[2] = c1 * pIp->csAttCoreData_wro[2] + s1 * pIp->csAttCoreData_wro[1];

        break;

    default:  /* break */
        break;
    }

    return;
}