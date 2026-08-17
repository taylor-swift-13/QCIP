#include "IP_CS_OrbitComputation.h"

void CS_OrbitComputationFun(void *p)
{
    CS_OrbitComputation *pIp = (CS_OrbitComputation*)p;
    float64 tmpF;
        unint32 i;

        /* (1) �������ѡȡ */
        if ((pIp->csOrbOtherPara_FP_OrbUpdate[pIp->m_WorkMode] == 1) &&
            (pIp->csOrbDataOther_F_DTOrbitEUpdate == 1))
        { /* �������¹������ �� ��̬������ģʽʹ��GPS���� */
            if ( (pIp->pGpsPara_FS_UseType == 1) || (pIp->pGpsPara_FS_UseType == 2) )       /* ����GPS����У�飨������ͨ���壩 */
            {
                // pIp->pOrbPara.t0 = pIp->pOrbG.t0;
                // pIp->pOrbPara.deltaa0 = pIp->pOrbG.deltaa0;
                // pIp->pOrbPara.adelta = pIp->pOrbG.adelta;
                // pIp->pOrbPara.i0 = pIp->pOrbG.i0;
                // pIp->pOrbPara.omg0 = pIp->pOrbG.omg0;
                // pIp->pOrbPara.omg1 = pIp->pOrbG.omg1;
                // pIp->pOrbPara.kesid = pIp->pOrbG.kesid;
                // pIp->pOrbPara.etad = pIp->pOrbG.etad;
                // pIp->pOrbPara.w1 = pIp->pOrbG.w1;
                // pIp->pOrbPara.etam = pIp->pOrbG.etam;
                // pIp->pOrbPara.a = pIp->pOrbG.a;
                // pIp->pOrbPara.beta = pIp->pOrbG.beta;
                // pIp->pOrbPara.lmd0 = pIp->pOrbG.lmd0;
                // pIp->pOrbPara.lmd1 = pIp->pOrbG.lmd1;
                // pIp->pOrbPara.lmd2 = pIp->pOrbG.lmd2;
                // pIp->pOrbPara.lmdg = pIp->pOrbG.lmdg;
                Memcpyx((unint08 *)&pIp->pOrbPara.t0, (unint08 *)&pIp->pOrbG.t0, sizeof(SOrbitParameterX));
            }
            else
            {
                // pIp->pOrbPara.t0 = pIp->pOrbI.t0;
                // pIp->pOrbPara.deltaa0 = pIp->pOrbI.deltaa0;
                // pIp->pOrbPara.adelta = pIp->pOrbI.adelta;
                // pIp->pOrbPara.i0 = pIp->pOrbI.i0;
                // pIp->pOrbPara.omg0 = pIp->pOrbI.omg0;
                // pIp->pOrbPara.omg1 = pIp->pOrbI.omg1;
                // pIp->pOrbPara.kesid = pIp->pOrbI.kesid;
                // pIp->pOrbPara.etad = pIp->pOrbI.etad;
                // pIp->pOrbPara.w1 = pIp->pOrbI.w1;
                // pIp->pOrbPara.etam = pIp->pOrbI.etam;
                // pIp->pOrbPara.a = pIp->pOrbI.a;
                // pIp->pOrbPara.beta = pIp->pOrbI.beta;
                // pIp->pOrbPara.lmd0 = pIp->pOrbI.lmd0;
                // pIp->pOrbPara.lmd1 = pIp->pOrbI.lmd1;
                // pIp->pOrbPara.lmd2 = pIp->pOrbI.lmd2;
                // pIp->pOrbPara.lmdg = pIp->pOrbI.lmdg;
                Memcpyx((unint08 *)&pIp->pOrbPara, (unint08 *)&pIp->pOrbI, sizeof(SOrbitParameterX));
            }

            if (pIp->csOrbOtherPara_FP_UseOtherOrb == 1)
            {
                /* Orb������������������������������������չ�� */
                f_Fun_Null();
            }
        }

        pIp->pObtOut_FV = 1;    /* ���������Ч */

        /* (2) ���á���Բ�е͹����ǹ�����������㷨���������ǹ�� */
        OrbitCalculate(pIp);
        SunEphemerisCalculate(pIp);

        /* (3) ����qoi */
        C2Q(pIp->pOrbData.qoi, pIp->pOrbData.coi[0]);

        /* (4) �����Ч���ж� */
        if (Fabsx(pIp->m_starTime_Next - pIp->pOrbPara.t0) >= pIp->csOrbInjChkPara_Lmt_dT)
        {
            pIp->pObtOut_FV = 0;    /* ���������Ч */
        }

        pIp->pObtOut_FV_NoInsert = 0;    /* �������ע�� */
        if (Fabsx(pIp->m_starTime_Next - pIp->pOrbPara.t0) >= (pIp->csOrbInjChkPara_Lmt_dT * 0.7))
        {
            pIp->pObtOut_FV_NoInsert = 1;    /* �������δע�� */
        }

        if (pIp->pOrbData.F_OrbAbnorm == 0)     /* �淶���㷨�����쳣w0 */
        {
            pIp->pObtOut_FV = 0;    /* ���������Ч */
        }

        if ((pIp->m_WorkMode != 0x09u) && (pIp->m_WorkMode != 0x08u) && (pIp->pObtOut_FV == 0))     /* ��������쳣 */
        {
            pIp->csOrbitErrJData_Cnt_NoOrb ++;
        }
        else
        {
            pIp->csOrbitErrJData_Cnt_NoOrb = 0;
        }

        if (pIp->csOrbitErrJData_Cnt_NoOrb >= pIp->csOrbitErrJPara_Num_NoOrb)
        {
            if (pIp->csOrbitErrJPara_FS_NoOrbPro == 0x0)
            {
                for (i=0; i<3; i++)
                {
                    pIp->pObtOut_F_SunlightZone[i] = 1;         /* ������ */
                }
                pIp->pOrbData.so[2] = -0.5;         /* ����Soֵ��ģΪ1 */
                pIp->pOrbData.so[1] =  0.5;
                pIp->pOrbData.so[0] =  0.707106781186548;
                pIp->pOrbData.w0     = pIp->csOrbInjChkPara_calc_w0_norm;
                pIp->pOrbData.cosrou = pIp->csOrbInjChkPara_calc_cosp_norm;
            }
            else
            {
                pIp->csOrbitErrJData_F_TurnAAM = 0x1;
            }
        }

        /* (5) ���� ���ǹ�������Ĺ��ϵ����ڹ���J2000.0�Ľ��ٶ� */
        if (pIp->csOrbOtherPara_FP_WoPrecession == 0)        /* �����ǹ������ */
        {
            pIp->pOrbData.w0i[0] = 0.0;
            pIp->pOrbData.w0i[1] = -pIp->pOrbData.w0;
            pIp->pOrbData.w0i[2] = 0.0;
        }
        else
        {
            pIp->pOrbData.w0i[0] = 0.0;
            pIp->pOrbData.w0i[1] = -pIp->pOrbData.w0;
            pIp->pOrbData.w0i[2] = -2.0 * pIp->pOrbPara.omg1 * Sinx(pIp->pOrbData.u) * Sinx(pIp->pOrbData.i);
        }

        /* (6)OrbOut.Cz_��G=Rz(Orb.��G + Earth.��*(t_next - Orb.t0)); */
        tmpF = pIp->pOrbPara.lmdg + pIp->pOCP_We * (pIp->m_starTime_Next - pIp->pOrbPara.t0);
        Rz(&pIp->pOrbData.Cz_lmdG[0][0], tmpF);

        pIp->pOrbData.lmdG = pIp->pOrbPara.lmdg + pIp->pOCP_We * (pIp->m_starTime_Next - pIp->pOrbPara.t0);


        return;
}
