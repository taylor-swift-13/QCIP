#include "IP_CS_TrgtP2P_Tar_Init.h"
/***********************************************************************
 * 功能描述:  5.3.3.1.3 姿态机动模式的目标初始化
***********************************************************************/
void    CS_TrgtP2P_Tar_InitFun(void *p)
{
    CS_TrgtP2P_Tar_Init *pIp = (CS_TrgtP2P_Tar_Init*)p;
    
    /* IF1(F_MnvNextMode =1)调姿转对地定向 */
    if (pIp->csMnvData_F_MnvNextMode == 1)
    {
        /* Cro= [1,0,0;0,1,0;0,0,1]; */
        MatrixIdentity33(&pIp->csAttCoreData_Cro[0][0]);

        /* 调用5.3.3.1.1（点对点机动的目标初始化） */
        CS_TrgtP2P_Ini_Sub();
    }
    /* else if(pIp->csMnvData_F_MnvNextMode ==2) */
    else if (pIp->csMnvData_F_MnvNextMode == 2)
    {
        /* Cro= Angle2DCM(φ_Trgt,θ_Trgt, ψ_Trgt , Seq_AttD[WorkMode])； */
        CS_Angle2C(&pIp->csAttCoreData_Cro[0][0], pIp->csMnvData_A_Trgt, pIp->csAttPara_Seq_AttD[m_WorkMode]);

        /* 调用5.3.3.1.1（点对点机动的目标初始化） */
        CS_TrgtP2P_Ini_Sub();
    }
    /* else if(pIp->csMnvData_F_MnvNextMode ==3) */
    else if (pIp->csMnvData_F_MnvNextMode == 3)
    {
        /* Cro =Cso; */
        Memcpyx((unint08 *)&pIp->csAttCoreData_Cro[0][0],
                (unint08 *)&pIp->csMnvData_Cso[0][0],
                sizeof(pIp->csAttCoreData_Cro));
        /* 调用5.3.3.1.1（点对点机动的目标初始化） */
        CS_TrgtP2P_Ini_Sub();
    }
    else
    {
        /* 预留 */
        f_Fun_Null();
    }

    return;
}