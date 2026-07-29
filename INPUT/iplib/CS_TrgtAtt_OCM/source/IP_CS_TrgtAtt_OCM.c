#include "IP_CS_TrgtAtt_OCM.h"

void    CS_TrgtAtt_OCMFun(void *p)
{
    CS_TrgtAtt_OCM *pIp = (CS_TrgtAtt_OCM*)p;
    
    float64 tmpF33_1[3][3];
    float64 cri[3][3];
    float64 cw[3];

    /* Cro = Cbiasp * Angle2DCM (φ_Trgt, θ_Trgt, ψ_Trgt, Seq_AttD[WorkMode]); */
    CS_Angle2C(&tmpF33_1[0][0], &pIp->csMnvData_A_Trgt[0], pIp->csAttPara_Seq_AttD[m_WorkMode]);
    MatrixMulti333(&pIp->csAttCoreData_Cro[0][0], &pIp->csAttCoreData_Cbiasp[0][0], &tmpF33_1[0][0]);

    MatrixMulti333(&cri[0][0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_coi[0][0]);
    C2Q(&pIp->csAttCoreData_qri[0], &cri[0][0]);

    MatrixMulti331(&pIp->csAttCoreData_wri[0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_w0i[0]);

    MatrixMulti331(&cw[0], &pIp->csAttCoreData_Cro[0][0], &pIp->csOrbData_w0i[0]);
    pIp->csAttCoreData_wro[0] = pIp->csAttCoreData_wri[0] - cw[0];
    pIp->csAttCoreData_wro[1] = pIp->csAttCoreData_wri[1] - cw[1];
    pIp->csAttCoreData_wro[2] = pIp->csAttCoreData_wri[2] - cw[2];

    /* 调用5.3.1.5（计算规划欧拉角、欧拉角速度和角加速度） */
    CS_Track_Atti();
    return;
}