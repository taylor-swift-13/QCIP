#include "IP_AttiCtrlCmd.h"

// =======================================================
// 函数实现
// =======================================================

void AttiCtrlCmd(void)
{
    SQuater oldqGI;             /*  */
    float64 tmpXB[3];           /*  */
    float64 tmpYF[3];           /*  */
    float64 tmpVec3[3];         /*  */
    float64 tmpVec3Sec[3];      /*  */
    float64 Tmp1[3];            /*  */
    float64 Tmp2[3];            /*  */
    float64 Tmp3[3];            /*  */
    float64 TmpLQC[3];          /*  */
    float64 Tmpe[3];            /*  */
    float64 tmpQBT[4];          /*  */
    float64 tmpMat33[3][3];     /*  */
    float64 TmpC[3][3];         /*  */
    float64 tmpdLmdc[3];        /*  */
    float64 tmpEulerBT;         /*  */
    float64 tmpTheta;           /*  */
    float64 tmpFlt;             /*  */
    float64 Tmpdot;             /*  */
    boolu32 bCond1Ok;           /*  */
    boolu32 bCond2Ok;           /*  */

    /* （2） */
    VectorEval4(&oldqGI.q4[0], &sAttiData.qGI.q4[0]);
    tmpXB[0] = 1.0;
    tmpXB[1] = 0.0;
    tmpXB[2] = 0.0;
    tmpYF[0] = 0.0;
    tmpYF[1] = 1.0;
    tmpYF[2] = 0.0;

    /* 目标姿态保护 */
    /* 天向 */
    DivNorm(&Tmp1[0], &sNaviData.ri[0], 3);
    DivNorm(&Tmp2[0], &sGuideData.aIC[0], 3);
    Tmpdot = VectorDot3(&Tmp1[0], &Tmp2[0]);

    /* 制导推力指向水平面以下 */
    if (Tmpdot < 0.0)
    {
        /* 与月心方向夹角小于1度，保护 */
        if (Tmpdot < sAttiModifyParam.dot_rI_aIc)
        {
            Q2C(&TmpC[0][0], &oldqGI.q4[0]);

            Tmp3[0] = TmpC[0][0];
            Tmp3[1] = TmpC[0][1];
            Tmp3[2] = TmpC[0][2];

            VectorCross3(&TmpLQC[0], &Tmp1[0], &Tmp3[0]);
            DivNorm(&Tmpe[0], &TmpLQC[0], 3);
        }
        else
        {
            VectorCross3(&TmpLQC[0], &Tmp1[0], &Tmp2[0]);
            DivNorm(&Tmpe[0], &TmpLQC[0], 3);
        }

        VectorRotation(&TmpLQC[0], &Tmp1[0], &Tmpe[0], PI/2.0);
        tmpFlt = VectorNorm3(&sGuideData.aIC[0]);
        VectorScalar3(&sGuideData.aIC[0], &TmpLQC[0], tmpFlt);
    }

    /* （3） */
    /* 滑行模式 */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE) &&
        (sGuideData.bCovFlg == FALSE32))
    {
        bCond1Ok = TRUE32;
    }
    else
    {
        bCond1Ok = FALSE32;
    }

    if (IN_RANGE_SET3(sGncCtrlFlag.BZ1, WORK_MODE_SPEEDDECEL, WORK_MODE_APPROACH, WORK_MODE_SLOWDOWN) &&
        (sGuideData.bHoverFlg == TRUE32))
    {
        bCond2Ok = TRUE32;
    }
    else
    {
        bCond2Ok = FALSE32;
    }

    if (sGncCtrlFlag.BZ1 == WORK_MODE_VERTRISE)
    {
        VectorEval4(&sAttiData.qGI.q4[0], &sAttiData.q0.q4[0]);
    }
    else if ((IN_RANGE_SET2(sGncCtrlFlag.BZ1, WORK_MODE_TRANSLATION, WORK_MODE_RISEATTI)) || (bCond1Ok == TRUE32) || (bCond2Ok == TRUE32))
    {
        DivNorm(&tmpVec3[0], &sGuideData.aIC[0], 3);
        Avv(&tmpMat33[0][0], &tmpVec3[0], &sNaviData.wOrbit[0], &tmpXB[0], &sNaviData.wOrbitB[0]);
        C2Q(&sAttiData.qGI.q4[0], &tmpMat33[0][0]);
    }
    else
    {
        DivNorm(&tmpVec3[0], &sGuideData.aIC[0], 3);
        MatrixMulti331(&tmpVec3Sec[0], &sAttiModifyParam.cBF[0][0], &tmpYF[0]);
        Avv(&tmpMat33[0][0], &tmpVec3[0], &sNaviData.wOrbit[0], &tmpXB[0], &tmpVec3Sec[0]);
        C2Q(&sAttiData.qGI.q4[0], &tmpMat33[0][0]);
    }

    /* （4） */
    /* 内部已归一化 */
    Qdiv(&tmpQBT[0], &oldqGI.q4[0], &sAttiData.qGI.q4[0]);

    tmpEulerBT = 2.0 * Acosx(LimitDouble(tmpQBT[3], 1.0));
    tmpTheta = Fabsx(sAttiCtrlParam.dThetar) * T_128MS;

    /* （5） */
    if ((sGncCtrlFlag.BZ1 != WORK_MODE_TRANSLATION) && (tmpEulerBT > tmpTheta))
    {
        /* ① */
        /* 取tmpQBT前三个元素 */
        VectorEval3(&tmpVec3[0], &tmpQBT[0]);
        VectorUnit3(&tmpVec3[0]);

        /* ② */
        tmpTheta = tmpTheta / 2.0;
        tmpFlt = Sinx(tmpTheta);
        tmpQBT[0] = tmpVec3[0] * tmpFlt;
        tmpQBT[1] = tmpVec3[1] * tmpFlt;
        tmpQBT[2] = tmpVec3[2] * tmpFlt;
        tmpQBT[3] = Cosx(tmpTheta);

        /* ③ */
        QMulti(&sAttiData.qGI.q4[0], &oldqGI.q4[0], &tmpQBT[0]);
    }

    /* （6） */
    VectorZero3(&tmpdLmdc[0]);

    /* （7） */
    if (sGncCtrlFlag.BZ1 == WORK_MODE_RISEATTI)
    {
        tmpFlt = VectorNorm3(&sGuideData.dlamd1[0]);
        tmpFlt = Minx(tmpFlt, 0.05236);

        VectorCross3(&tmpVec3[0], &sGuideData.lamdv1[0], &sGuideData.dlamd1[0]);
        VectorUnit3(&tmpVec3[0]);
        VectorScalar3(&tmpdLmdc[0], &tmpVec3[0], tmpFlt);
    }

    /* （8） */
    Q2C(&tmpMat33[0][0], &sAttiData.qGI.q4[0]);
    MatrixMulti331(&sAttiData.wGI[0], &tmpMat33[0][0], &tmpdLmdc[0]);

    return;
}