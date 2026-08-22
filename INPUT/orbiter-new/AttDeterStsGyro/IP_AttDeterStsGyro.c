#include "IP_AttDeterStsGyro.h"

// =======================================================
// 函数实现
// =======================================================

void AttDeterStsGyro(void)
{
    float64 tmpQ[4];            /*  */
    float64 tmpVec[3];          /*  */
    float64 tmpVec4[4];         /*  */
    float64 tmpVec6[6];         /*  */
    float64 *ptrCS;             /*  */
    float64 *pTmpdq;            /*  */
    float64 *pTmpDb;            /*  */
    float64 tmpKSA[6][3];       /*  */
    float64 tmpKSB[6][3];       /*  */
    float64 tmpMat43[4][3];     /*  */
    float64 tmpMat63[6][3];     /*  */
    float64 tmpMat66[6][6];     /*  */
    float64 tmpVG[3][3];        /*  */
    float64 tmpMat[3][3];       /*  */
    float64 tmpXI[5][3];        /*  */
    float64 tmpYI[5][3];        /*  */
    float64 tmpZI[5][3];        /*  */
    float64 tmpX[3];            /*  */
    float64 tmpY[3];            /*  */
    float64 tmpZ[3];            /*  */
    float64 tmpXI1[3];          /*  */
    float64 tmpZI1[3];          /*  */
    float64 tmpBt[3];           /*  */
    float64 tmpDeltaX[3];       /*  */
    float64 tmpDeltaY[3];       /*  */
    float64 tmpDeltaZ[3];       /*  */
    float64 tmpEq[4][3];        /*  */
    float64 tmpFabs;            /*  */
    float64 tmpFlt;             /*  */
    float64 *ptmpKS;            /*  */
    unint32 iSts;               /*  */
    unint32 iGyro;              /*  */
    unint32 cntGyro;            /*  */
    unint32 gyroNum[3];         /* 参与定姿的三个陀螺编号i,j,k */
    boolu32 bModeOk;            /*  */
    boolu32 bModeOk2;           /*  */
    boolu32 bCondOk;            /*  */
    boolu32 bQuit;              /*  */

    /* 拆分向量 */
    VectorZero(&tmpVec6[0], 6);
    pTmpdq = &tmpVec6[0];
    pTmpDb = &tmpVec6[3];

    /* (2)星敏捕获四元数 */
    /* ① */
    if (sGncCtrlFlag.BZ4 == 0)
    {
        VectorScalar3(&sStsDataCom.deltaZr[0], &sStsDataCom.deltaZrOld[0], -1.0);
    }

    /* ②若IAFlg==1 */
    /* 重新确定惯性基准标志 */
    if (sGncCtrlFlag.bInerAtt == TRUE32)
    {
        VectorSub3(&tmpVec[0], &sStsDataCom.deltaZrOld[0], &sStsDataCom.deltaZr[0]);
        tmpFabs = VectorNorm3(&tmpVec[0]);

        if (tmpFabs < sStsProcParam.deltaZrMax)
        {
            sStsDataCom.cntDeltaZr++;
        }
        else
        {
            sStsDataCom.cntDeltaZr = 0;
        }

        if ((sGncCtrlFlag.BZ4 != 0) && (sStsDataCom.cntDeltaZr >= 2))
        {
            /* 飞跃器星敏优先 */
            iSts = 0;
            bQuit = FALSE32;

            while ((bQuit == FALSE32) && (iSts < DEV_NUM_STS_ALL))
            {
                /* 标志预置为有效 */
                bCondOk = TRUE32;

                /* 着陆器星敏 */
                if (iSts >= 2)
                {
                    /* 若ZT9(D13)==0, 不利用着陆器数据进行标定 */
                    if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 0u)
                    {
                        bCondOk = FALSE32;
                    }
                }

                /* 星敏 */
                if ((bCondOk == TRUE32) && (UI32_BIT_GET1(sGncCtrlFlag.BZ4, iSts) == 1u))
                {
                    C2Q(&tmpQ[0], &sStsProcParam.CBS[iSts][0][0]);
                    QMulti(&sAttiData.q.q4[0], &sStsRaw[iSts].qv[0], &tmpQ[0]);

                    /* 置退出标志有效 */
                    bQuit = TRUE32;
                }

                iSts++;
            }

            QUnit(&sAttiData.q.q4[0]);
            Q2C(&sAttiData.cbi[0][0], &sAttiData.q.q4[0]);
            MatrixTran33(&sAttiData.cib[0][0], &sAttiData.cbi[0][0]);
            sAttiData.qg = sAttiData.q;
            sAttiData.Q0 = sAttiData.q;
            sAttiData.Q1 = sAttiData.q;

            sGncCtrlFlag.bInerAtt = FALSE32;
            sStsDataCom.cntDeltaZr = 0;
        }
    }

    /* (3)姿态四元数修正 */
    MatrixZero(&tmpKSA[0][0], 6, 3);
    MatrixZero(&tmpKSB[0][0], 6, 3);

    /* 预置模式标志为无效 */
    bModeOk = FALSE32;
    bModeOk2 = FALSE32;

    /* BZ1==0或1或9或10 */
    if (IN_RANGE_SET4(sGncCtrlFlag.BZ1, WORK_MODE_WAIT, WORK_MODE_LAUNCHRDY, WORK_MODE_NOCTRL, WORK_MODE_STATIC))
    {
        bModeOk = TRUE32;
    }

    /* BZ1==5且ZT9(D8)==1 */
    /* ZT9(D8)=1，滑行段星敏修正 */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE) && (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 8u) == 1u))
    {
        bModeOk = TRUE32;
    }

    /* 2≤BZ1≤13且BZ1≠5且BZ1≠9且BZ1≠10 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_MOVEPLAN) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_GLIDE) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_NOCTRL) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_STATIC))
    {
        bModeOk2 = TRUE32;
    }

    /* 2≤BZ1≤13且BZ1≠5且BZ1≠9且BZ1≠10且（ZT9(D29)==1或STWalkFlg==1） */
    /* ZT9(D29)=1，飞跃动力过程星敏修正 */
    if ((bModeOk2 == TRUE32) &&
        ((UI32_BIT_GET1(sGncCtrlFlag.ZT9, 29u) == 1u) || (sWalkModeData.STWalkFlg == 1)))
    {
        bModeOk = TRUE32;
    }

    if ((bModeOk == TRUE32) &&
        (sGncCtrlFlag.bInerAtt == FALSE32) &&
        (sGncCtrlFlag.BZ4 != 0))
    {
        /* ① */

        /* 矩阵赋值操作 */
        MatrixEval(&tmpKSA[0][0], &sAttiModifyParam.KS[0][0][0], 6, 3);
        MatrixEval(&tmpKSB[0][0], &sAttiModifyParam.KS[1][0][0], 6, 3);

        /* 滑行模式 */
        if (sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE)
        {
            /* 矩阵赋值操作 */
            MatrixMultiScalar(&tmpKSA[0][0], &sAttiModifyParam.KS[0][0][0], sAttiModifyParam.mKS5, 6, 3);
            MatrixMultiScalar(&tmpKSB[0][0], &sAttiModifyParam.KS[1][0][0], sAttiModifyParam.mKS5, 6, 3);
        }

        /* 飞跃动力过程 */
        if (bModeOk2 == TRUE32)
        {
            /* 矩阵赋值操作 */
            MatrixMultiScalar(&tmpKSA[0][0], &sAttiModifyParam.KS[0][0][0], sAttiModifyParam.mKS2, 6, 3);
            MatrixMultiScalar(&tmpKSB[0][0], &sAttiModifyParam.KS[1][0][0], sAttiModifyParam.mKS2, 6, 3);
        }

        /* ② 五个星敏循环处理 */
        for (iSts=0; iSts<DEV_NUM_STS_ALL; iSts++)
        {
            tmpFlt = Maxx(Fabsx(sStsData[iSts].deltaZ[0]), Fabsx(sStsData[iSts].deltaZ[1]));
            tmpFlt = Maxx(Fabsx(sStsData[iSts].deltaZ[2]), tmpFlt);

            if (tmpFlt > sStsProcParam.deltaZMax)
            {
                tmpFlt = sStsProcParam.deltaZMax / tmpFlt;
                VectorScalar3(&sStsData[iSts].deltaZ[0], &sStsData[iSts].deltaZ[0], tmpFlt);
            }
        }

        /* ③ */
        iSts = 0;
        bQuit = FALSE32;

        while ((bQuit == FALSE32) && (iSts < DEV_NUM_STS_ALL))
        {
            /* 标志预置为有效 */
            bCondOk = TRUE32;

            /* 着陆器星敏 */
            if (iSts >= 2)
            {
                /* 若ZT9(D13)==0, 不利用着陆器数据进行标定 */
                if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 0u)
                {
                    bCondOk = FALSE32;
                }
            }

            /* 星敏 */
            if ((bCondOk == TRUE32) && (UI32_BIT_GET1(sGncCtrlFlag.BZ4, iSts) == 1u))
            {
                if (iSts == 0)
                {
                    ptmpKS = &tmpKSA[0][0];
                }
                else if (iSts == 1)
                {
                    ptmpKS = &tmpKSB[0][0];
                }
                else
                {
                    ptmpKS = &sAttiModifyParam.KS[iSts][0][0];
                }

                /* 求 [mKSAq·I3×3 03×3;03×3 mKSAb·I3×3] */
                MatrixZero(&tmpMat66[0][0], 6, 6);
                tmpMat66[0][0] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[1][1] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[2][2] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[3][3] = sAttiModifyParam.mKSb[iSts];
                tmpMat66[4][4] = sAttiModifyParam.mKSb[iSts];
                tmpMat66[5][5] = sAttiModifyParam.mKSb[iSts];

                MatrixMulti(&tmpMat63[0][0], &tmpMat66[0][0], ptmpKS, 6, 6, 3);
                MatrixMulti(&tmpVec6[0], &tmpMat63[0][0], &sStsData[iSts].deltaZ[0], 6, 3, 1);

                /* 置退出标志有效 */
                bQuit = TRUE32;
            }

            iSts++;
        }

        /* ④ */
        Q2Ksi(&tmpMat43[0][0], &sAttiData.q.q4[0]);
        MatrixMulti(&tmpQ[0], &tmpMat43[0][0], &pTmpdq[0], 4, 3, 1);
        VectorAdd(&sAttiData.q.q4[0], &sAttiData.q.q4[0], &tmpQ[0], 4);
        QUnit(&sAttiData.q.q4[0]);
        Q2C(&sAttiData.cbi[0][0], &sAttiData.q.q4[0]);
        MatrixTran33(&sAttiData.cib[0][0], &sAttiData.cbi[0][0]);
    }

    /* (4)估计陀螺常值漂移 */
    /* 若（BZ1==0或1或10）且IAFlg==0且BZ4≠0 */
    if (IN_RANGE_SET3(sGncCtrlFlag.BZ1, WORK_MODE_WAIT, WORK_MODE_LAUNCHRDY, WORK_MODE_STATIC) &&
        (sGncCtrlFlag.bInerAtt == FALSE32) &&
        (sGncCtrlFlag.BZ4 != 0))
    {
        for (iSts=0; iSts<DEV_NUM_STS_ALL; iSts++)
        {
            /* ① */
            /* 计算Eq(qA)•Tmpω */
            MatrixTran33(&tmpMat[0][0], &sStsProcParam.CBS[iSts][0][0]);
            MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &sGyroData.wg[0]);
            Q2Ksi(&tmpEq[0][0], &sStsRaw[iSts].qv[0]);
            MatrixMulti(&tmpVec4[0], &tmpEq[0][0], &tmpVec[0], 4, 3, 1);
            VectorAddCoef(&tmpQ[0], &sStsRaw[iSts].qv[0], &tmpVec4[0], (0.5 * sStsData[iSts].dtS), 4);
            QUnit(&tmpQ[0]);

            /* 标志预置为有效 */
            bCondOk = TRUE32;

            /* 着陆器星敏 */
            if (iSts >= 2)
            {
                /* 若ZT9(D13)==0, 不利用着陆器数据进行标定 */
                if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 0u)
                {
                    bCondOk = FALSE32;
                }
            }

            /* 允许处理 */
            if (bCondOk == TRUE32)
            {
                /* ②/③/④ */
                Q2C(&tmpMat[0][0], &tmpQ[0]);

                /* 分别获取矩阵第0/1/2行 */
                MatrixExtractRow(&tmpXI[iSts][0], &tmpMat[0][0], 3, 3, 0);
                MatrixExtractRow(&tmpYI[iSts][0], &tmpMat[0][0], 3, 3, 1);
                MatrixExtractRow(&tmpZI[iSts][0], &tmpMat[0][0], 3, 3, 2);

                /* 求TmpZAI1 */
                tmpFlt = VectorDot3(&tmpZI[iSts][0], &sStsDataCom.gamma[0]);
                VectorScalar3(&tmpVec[0], &tmpZI[iSts][0], tmpFlt);
                VectorSub3(&tmpZI1[0], &tmpZI[iSts][0], &tmpVec[0]);
                VectorAdd3(&tmpZI1[0], &tmpZI1[0], &sStsDataCom.gamma[0]);

                /* 求TmpXAI1 */
                tmpFlt = VectorDot3(&tmpXI[iSts][0], &sStsDataCom.gamma[0]);
                VectorScalar3(&tmpVec[0], &tmpZI[iSts][0], tmpFlt);
                VectorSub3(&tmpXI1[0], &tmpXI[iSts][0], &tmpVec[0]);

                /* 求TmpXAI/TmpYAI/TmpZAI */
                DivNorm(&tmpZI[iSts][0], &tmpZI1[0], 3);
                VectorCross3(&tmpVec[0], &tmpZI1[0], &tmpXI1[0]);
                DivNorm(&tmpYI[iSts][0], &tmpVec[0], 3);
                VectorCross3(&tmpVec[0], &tmpYI[iSts][0], &tmpZI[iSts][0]);
                DivNorm(&tmpXI[iSts][0], &tmpVec[0], 3);

                /* 求TmpδX/TmpδY/TmpδZ */
                Q2C(&tmpMat[0][0], &sAttiData.qg.q4[0]);

                /* 求TmpδX/TmpδY/TmpδZ */
                if (iSts == 0)
                {
                    /* 星敏A使用XAB/YAB/ZAB */
                    ptrCS = &sStsProcParam.CBS[0][0][0];
                }
                else
                {
                    /* 星敏B、着陆器星敏A/B/C，使用XBR/YBR/ZBR */
                    ptrCS = &sStsProcParam.CBSR[iSts][0][0];
                }

                /* 提取安装矩阵列向量 */
                MatrixExtractColumn(&tmpX[0], ptrCS, 3, 3, 0);
                MatrixExtractColumn(&tmpY[0], ptrCS, 3, 3, 1);
                MatrixExtractColumn(&tmpZ[0], ptrCS, 3, 3, 2);

                /* TmpδX */
                MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpXI[iSts][0]);
                VectorCross3(&tmpDeltaX[0], &tmpX[0], &tmpVec[0]);

                /* TmpδY */
                MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpYI[iSts][0]);
                VectorCross3(&tmpDeltaY[0], &tmpY[0], &tmpVec[0]);

                /* TmpδZ */
                MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpZI[iSts][0]);
                VectorCross3(&tmpDeltaZ[0], &tmpZ[0], &tmpVec[0]);

                sStsData[iSts].deltaZ[0] = 0.5 * (tmpDeltaX[0] + tmpDeltaY[0] + tmpDeltaZ[0]);
                sStsData[iSts].deltaZ[1] = 0.5 * (tmpDeltaX[1] + tmpDeltaY[1] + tmpDeltaZ[1]);
                sStsData[iSts].deltaZ[2] = 0.5 * (tmpDeltaX[2] + tmpDeltaY[2] + tmpDeltaZ[2]);

                tmpFlt = Maxx(Fabsx(sStsData[iSts].deltaZ[0]), Fabsx(sStsData[iSts].deltaZ[1]));
                tmpFlt = Maxx(Fabsx(sStsData[iSts].deltaZ[2]), tmpFlt);

                if (tmpFlt > sStsProcParam.deltaZMax)
                {
                    tmpFlt = sStsProcParam.deltaZMax / tmpFlt;
                    VectorScalar3(&sStsData[iSts].deltaZ[0], &sStsData[iSts].deltaZ[0], tmpFlt);
                }
            }
        }

        /* ⑤ 飞跃器星敏优先 */
        iSts = 0;
        bQuit = FALSE32;

        while ((bQuit == FALSE32) && (iSts < DEV_NUM_STS_ALL))
        {
            /* 标志预置为有效 */
            bCondOk = TRUE32;

            /* 着陆器星敏 */
            if (iSts >= 2)
            {
                /* 若ZT9(D13)==0, 不利用着陆器数据进行标定 */
                if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 0u)
                {
                    bCondOk = FALSE32;
                }
            }

            /* 星敏 */
            if ((bCondOk == TRUE32) &&
                (sGncCtrlFlag.bInerAtt == FALSE32) &&
                (UI32_BIT_GET1(sGncCtrlFlag.BZ4, iSts) == 1u))
            {
                if (iSts == 0)
                {
                    ptmpKS = &tmpKSA[0][0];
                }
                else if (iSts == 1)
                {
                    ptmpKS = &tmpKSB[0][0];
                }
                else
                {
                    ptmpKS = &sAttiModifyParam.KS[iSts][0][0];
                }

                /* 求 [mKSAq·I3×3 03×3;03×3 mKSAb·I3×3] */
                MatrixZero(&tmpMat66[0][0], 6, 6);
                tmpMat66[0][0] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[1][1] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[2][2] = sAttiModifyParam.mKSq[iSts];
                tmpMat66[3][3] = sAttiModifyParam.mKSb[iSts];
                tmpMat66[4][4] = sAttiModifyParam.mKSb[iSts];
                tmpMat66[5][5] = sAttiModifyParam.mKSb[iSts];

                MatrixMulti(&tmpMat63[0][0], &tmpMat66[0][0], ptmpKS, 6, 6, 3);
                MatrixMulti(&tmpVec6[0], &tmpMat63[0][0], &sStsData[iSts].deltaZ[0], 6, 3, 1);

                /* 置退出标志有效 */
                bQuit = TRUE32;
            }

            iSts++;
        }

        /* ⑥ */
        Q2Ksi(&tmpMat43[0][0], &sAttiData.qg.q4[0]);
        MatrixMulti(&tmpQ[0], &tmpMat43[0][0], &pTmpdq[0], 4, 3, 1);
        VectorAdd(&sAttiData.qg.q4[0], &sAttiData.qg.q4[0], &tmpQ[0], 4);
        QUnit(&sAttiData.qg.q4[0]);

        /* ⑦ */
        tmpFabs = VectorNorm3(&sGyroData.w[0]);
        if (tmpFabs > sAttiModifyParam.wsDb)
        {
            VectorZero3(&pTmpDb[0]);
        }

        /* ⑧ 根据BZ2确定的工作陀螺（编号i、j、k），计算体轴陀螺常值漂移 */

        /* 由BZ2确定的陀螺（编号i、j、k） */
        gyroNum[0] = 0;
        gyroNum[1] = 0;
        gyroNum[2] = 0;

        cntGyro = 0;
        iGyro = 0;
        while ((cntGyro < 3) && (iGyro < IMU_HEAD_NUM))
        {
            if (UI32_BIT_GET1(sGncCtrlFlag.BZ2, iGyro) == 1)
            {
                gyroNum[cntGyro] = iGyro;
                cntGyro++;
            }

            iGyro++;
        }

        /* 增加断言判断 */
        ASSERT(cntGyro == 3);

        /* 三个行向量拼为一个3×3矩阵 */
        VectorEval3(&tmpVG[0][0], &sGyroData.vecVG[gyroNum[0]][0]);
        VectorEval3(&tmpVG[1][0], &sGyroData.vecVG[gyroNum[1]][0]);
        VectorEval3(&tmpVG[2][0], &sGyroData.vecVG[gyroNum[2]][0]);

        /* 矩阵求逆 */
        MatrixInv33(&tmpMat[0][0], &tmpVG[0][0]);
        tmpBt[0] = sImuParam.constDriftEstiGyro[gyroNum[0]];
        tmpBt[1] = sImuParam.constDriftEstiGyro[gyroNum[1]];
        tmpBt[2] = sImuParam.constDriftEstiGyro[gyroNum[2]];
        MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpBt[0]);

        /* ⑨ */
        VectorAdd3(&tmpVec[0], &tmpVec[0], &pTmpDb[0]);
        tmpVec[0] = LimitDouble(tmpVec[0], sAttiModifyParam.bMax);
        tmpVec[1] = LimitDouble(tmpVec[1], sAttiModifyParam.bMax);
        tmpVec[2] = LimitDouble(tmpVec[2], sAttiModifyParam.bMax);

        /* ⑩ 根据BZ2确定的工作陀螺（编号i、j、k），计算工作陀螺常值漂移 */
        MatrixMulti331(&tmpBt[0], &tmpVG[0][0], &tmpVec[0]);
        sImuParam.constDriftEstiGyro[gyroNum[0]] = tmpBt[0];
        sImuParam.constDriftEstiGyro[gyroNum[1]] = tmpBt[1];
        sImuParam.constDriftEstiGyro[gyroNum[2]] = tmpBt[2];
    }

    /* (5) */
    if (sGncCtrlFlag.BZ4 != 0)
    {
        VectorEval3(&sStsDataCom.deltaZrOld[0], &sStsDataCom.deltaZr[0]);
    }

    return;
}