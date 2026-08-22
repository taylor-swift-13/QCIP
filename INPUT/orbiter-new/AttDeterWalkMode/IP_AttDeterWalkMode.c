#include "IP_AttDeterWalkMode.h"

// =======================================================
// 函数实现
// =======================================================

void AttDeterWalk(void)
{
    float64 tmpLmdc;
    float64 tmpLc;
    float64 tmprM;
    float64 tmpFloat;
    float64 alphaHn;
    float64 alphaHt;
    float64 tmpSinAlpHn;
    float64 tmpCosAlpHn;
    float64 tmpSinAlpHt;
    float64 tmpCosAlpHt;
    float64 tmpr[3];
    float64 tmpMat33[3][3];
    float64 tmpMat33T[3][3];

    /* （1）Tmpλc=λcAL，TmpLc=LcAL，TmprM=rM */
    tmpLmdc = sNaviData.lmdcal;
    tmpLc = sNaviData.lcal;
    tmprM = sNaviData.rM;

    /* （3） */
    tmpFloat = tmprM * Cosx(tmpLc);
    tmpr[0] = tmpFloat * Cosx(tmpLmdc);
    tmpr[1] = tmpFloat * Sinx(tmpLmdc);
    tmpr[2] = tmprM * Sinx(tmpLc);

    /* （4）极区导航坐标系相对月固系的转换矩阵CNM */
    alphaHn = Atan2x(tmpr[0], tmpr[2]);
    alphaHt = Asinx(tmpr[1] / tmprM);

    tmpSinAlpHn = Sinx(alphaHn);
    tmpCosAlpHn = Cosx(alphaHn);
    tmpSinAlpHt = Sinx(alphaHt);
    tmpCosAlpHt = Cosx(alphaHt);

    sNaviData.cnm[0][0] = -tmpSinAlpHt*tmpSinAlpHn;
    sNaviData.cnm[0][1] = tmpCosAlpHt;
    sNaviData.cnm[0][2] = -tmpSinAlpHt*tmpCosAlpHn;
    sNaviData.cnm[1][0] = tmpCosAlpHn;
    sNaviData.cnm[1][1] = 0.0;
    sNaviData.cnm[1][2] = -tmpSinAlpHn;
    sNaviData.cnm[2][0] = -tmpCosAlpHt*tmpSinAlpHn;
    sNaviData.cnm[2][1] = -tmpSinAlpHt;
    sNaviData.cnm[2][2] = -tmpCosAlpHt*tmpCosAlpHn;

    /* （5）导航本体坐标系相对极区导航坐标系的转换矩阵CFBN */

    /* CFBN= CFBF•CBF^T•CBI•CMIT•CNMT */

    /* CMIT•CNMT */
    MatrixTran33(&tmpMat33T[0][0], &sNaviData.cnm[0][0]);
    MatrixTran33(&tmpMat33[0][0], &sNaviData.cmi[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33[0][0], &tmpMat33T[0][0]);

    /* CBI•CMIT•CNMT */
    MatrixMulti333(&tmpMat33[0][0], &sAttiData.cbi[0][0], &tmpMat33[0][0]);

    /* CBFT•CBI•CMIT•CNMT */
    MatrixTran33(&tmpMat33T[0][0], &sAttiModifyParam.cBF[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33T[0][0], &tmpMat33[0][0]);

    /* CFBN=CFBF•CBF^T•CBI•CMIT•CNMT */
    MatrixMulti333(&sNaviData.cfbn[0][0], &sAttiModifyParam.cFBF[0][0], &tmpMat33[0][0]);

    return;
}

void AttProcWalk(void)
{
    float64 temp64[3];
    float64 tmpFlt1;
    float64 tmpFlt2;

    /* 转换矩阵至欧拉角 */
    C2Angle321(&temp64[0], &sNaviData.cfbn[0][0]);

    /* 顺序为 偏航 滚动 俯仰 */
    sWalkAttData.y_b = YawConvert(temp64[2], sWalkAttData.InitialYaw);
    sWalkAttData.r_b = temp64[0];
    sWalkAttData.p_b = temp64[1];

    /* AIT测试 */
    if (sWalkInstrDemandData.SocAITTestFlag == 1)
    {
        sWalkAttData.y_b = 0.0;
        sWalkAttData.r_b = 0.0;
        sWalkAttData.p_b = 0.0;
    }

    /* 姿态信息打包给 LCWOUTPUT */
    sWalkSendData.y_fyq = sWalkAttData.y_b;
    sWalkSendData.r_fyq = sWalkAttData.r_b;
    sWalkSendData.p_fyq = sWalkAttData.p_b;

    /* 姿态信息打包给 Tele_r_b，Tele_p_b和Tele_y_b */
    sWalkModeData.Teleyb = YawConvert(sWalkAttData.y_b, -sWalkAttData.InitialYaw);
    sWalkModeData.Telerb = sWalkAttData.r_b;
    sWalkModeData.Telepb = sWalkAttData.p_b;

    /* 本体倾斜角AttBaseBoard */
    tmpFlt1 = Tanx(temp64[0]);
    tmpFlt2 = Tanx(temp64[1]);
    tmpFlt1 = Sqrtx(tmpFlt1 * tmpFlt1 + tmpFlt2 * tmpFlt2);
    sWalkModeData.AttBaseBoard = Atanx(tmpFlt1);

    return;
}

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

void ThruTimerClear285N(void)
{
    unint32 indx285N;

    /* 285N推力器定时器清零 */
    for (indx285N=0; indx285N<THRU_285N_GROUP_NUM; indx285N++)
    {
        /* 定时器清零 */
        *sThruInsTimerParam[indx285N].timer = 0.0;

        /* 定时器清零 */
        sThruWorkStatus.bModulOn285[indx285N] = TRUE32;        /* 默认为开调制 */
        sThruWorkStatus.timer285[indx285N] = 0.0;
        sThruWorkStatus.timer285Off[indx285N] = 0.0;
    }

    return;
}

void ThruTimerClear40N(void)
{
    unint32 indx40N;

    /* 40N推力器定时器清零 */
    for (indx40N=0; indx40N<THRU_40N_GROUP_NUM; indx40N++)
    {
        /* 定时器清零 */
        *sThruInsTimerParam[THRU_285N_GROUP_NUM+indx40N].timer = 0.0;

        /* 定时器清零 */
        sThruWorkStatus.bModulOn40[indx40N] = TRUE32;        /* 默认为开调制 */
        sThruWorkStatus.timer40[indx40N] = 0.0;
        sThruWorkStatus.timer40Off[indx40N] = 0.0;
    }

    return;
}

void ThruStatusClear(void)
{
    unint32 indx285N;

    /* 轨控推力器定时器清零操作 */
    ThruTimerClear285N();

    /* 姿控推力器定时器清零操作 */
    ThruTimerClear40N();

    /* ⑥ 285N发动机冲量清零操作 */
    if (sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE)
    {
        for (indx285N=0; indx285N<THRU_285N_GROUP_NUM; indx285N++)
        {
            sThruCtrl.Impulse285[indx285N] = 0.0;
        }
    }

    /* ⑦ 若ZT5指定第i（0~5）个285N不工作，则：Fault285k=i */
    if (sGncCtrlFlag.ZT5 != 0x3F)
    {
        for (indx285N=0; indx285N<THRU_285N_GROUP_NUM; indx285N++)
        {
            if (UI32_BIT_GET1(sGncCtrlFlag.ZT5, indx285N) == 0)
            {
                sThruCtrl.Fault285k = indx285N;
            }
        }
    }

    /* ⑧ 腰部40N水平机动脉宽PwLY=0，PwLZ=0 */
    sAttiCtrl.PwLY = 0.0;
    sAttiCtrl.PwLZ = 0.0;

    /* ⑨ 三轴姿控脉宽TJX=0，TJY=0，TJZ=0 */
    sAttiCtrl.TJAxis[0] = 0.0;
    sAttiCtrl.TJAxis[1] = 0.0;
    sAttiCtrl.TJAxis[2] = 0.0;

    /* ⑩ 若HoverFlg==0（进坑飞跃）且Fault285k==9（285N发动机无故障） */
    if ((sGuideData.bHoverFlg == FALSE32) && (sThruCtrl.Fault285k == 9))
    {
        /* AF1超温 */
        if (sThruCtrl.Flg_285TempErr == 0x91)
        {
            sThruCtrl.Fault285k = 3;
        }
        /* AF2超温 */
        else if (sThruCtrl.Flg_285TempErr == 0x92)
        {
            sThruCtrl.Fault285k = 5;
        }
        /* AF3超温 */
        else if (sThruCtrl.Flg_285TempErr == 0x93)
        {
            sThruCtrl.Fault285k = 1;
        }
        /* BF1超温 */
        else if (sThruCtrl.Flg_285TempErr == 0x94)
        {
            sThruCtrl.Fault285k = 2;
        }
        /* BF2超温 */
        else if (sThruCtrl.Flg_285TempErr == 0x95)
        {
            sThruCtrl.Fault285k = 4;
        }
        /* BF3超温 */
        else if (sThruCtrl.Flg_285TempErr == 0x96)
        {
            sThruCtrl.Fault285k = 0;
        }
        /* 无超温不做处理 */
        else
        {
            NULL_STATEMENT();
        }
    }

    return;
}

void GyroFaultDataProc(void)
{
    float64 tmpw[3];
    float64 tmpVec3[3];
    float64 tmpMat33[3][3];
    unint32 iCycle;

    /* （1） */
    /* 若2≤BZ1≤8 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
    {
        /* Jb^-1 */
        MatrixInv33(&tmpMat33[0][0], &sBodyData.Jb[0][0]);

        /* cross(ω,Jb•ω)•Δt */
        MatrixMulti331(&tmpVec3[0], &sBodyData.Jb[0][0], &sGyroData.w[0]);
        VectorCross3(&tmpVec3[0], &sGyroData.w[0], &tmpVec3[0]);
        VectorScalar3(&tmpVec3[0], &tmpVec3[0], T_128MS);

        /* Htotal-cross(ω,Jb•ω)•Δt */
        VectorSub3(&tmpVec3[0], &sBodyData.Htotal[0], &tmpVec3[0]);

        /* Jb^-1•(Htotal-cross(ω,Jb•ω)•Δt) */
        MatrixMulti331(&tmpVec3[0], &tmpMat33[0][0], &tmpVec3[0]);

        /* ω+Jb^-1•(Htotal-cross(ω,Jb•ω)•Δt) */
        VectorAdd3(&tmpw[0], &sGyroData.w[0], &tmpVec3[0]);
    }
    /* （2） */
    else
    {
        /* Tmpω=ω */
        VectorEval3(&tmpw[0], &sGyroData.w[0]);
    }

    /* （3） */
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        /* Δgtm=Tmpω•Δt/8 */
        VectorScalar3(&sGyroData.dgt[iCycle][0], &tmpw[0], T_128MS/8.0);
    }

    return;
}

void GyroVGComplement(void)
{
    unint32 iAxis;

    /* 6个安装向量/3轴 */
    for (iAxis=0; iAxis<3; iAxis++)
    {
        sGyroData.vecVG[0][iAxis] = sImuParam.vecVG0[0][iAxis] + sImuParam.dGxy1*sImuParam.vecVG0[2][iAxis] + sImuParam.dGxz1*sImuParam.vecVG0[4][iAxis];
        sGyroData.vecVG[2][iAxis] = sImuParam.vecVG0[2][iAxis] + sImuParam.dGyx1*sImuParam.vecVG0[0][iAxis] + sImuParam.dGyz1*sImuParam.vecVG0[4][iAxis];
        sGyroData.vecVG[4][iAxis] = sImuParam.vecVG0[4][iAxis] + sImuParam.dGzx1*sImuParam.vecVG0[0][iAxis] + sImuParam.dGzy1*sImuParam.vecVG0[2][iAxis];
        sGyroData.vecVG[1][iAxis] = sImuParam.vecVG0[1][iAxis] + sImuParam.dGxy2*sImuParam.vecVG0[3][iAxis] + sImuParam.dGxz2*sImuParam.vecVG0[5][iAxis];
        sGyroData.vecVG[3][iAxis] = sImuParam.vecVG0[3][iAxis] + sImuParam.dGyx2*sImuParam.vecVG0[1][iAxis] + sImuParam.dGyz2*sImuParam.vecVG0[5][iAxis];
        sGyroData.vecVG[5][iAxis] = sImuParam.vecVG0[5][iAxis] + sImuParam.dGzx2*sImuParam.vecVG0[1][iAxis] + sImuParam.dGzy2*sImuParam.vecVG0[3][iAxis];
    }

    /* 矢量归一化 */
    VectorUnit3(&sGyroData.vecVG[0][0]);
    VectorUnit3(&sGyroData.vecVG[1][0]);
    VectorUnit3(&sGyroData.vecVG[2][0]);
    VectorUnit3(&sGyroData.vecVG[3][0]);
    VectorUnit3(&sGyroData.vecVG[4][0]);
    VectorUnit3(&sGyroData.vecVG[5][0]);

    return;
}

void GyroDataProc128(void)
{
    unint32 i;
    siint32 j;
    unint32 iGyro;
    unint32 iCycle;
    unint32 tmpBit;
    unint32 tmpZT2;
    unint32 cntBit;
    unint32 cntGyro;
    unint32 tmpOutFlg;
    unint32 tmpCnstFlg;
    unint32 gyroNum[3];     /* 参与定姿的三个陀螺编号i,j,k */
    boolu32 bConst;
    boolu32 bModeOk1;
    boolu32 bModeOk2;
    siint32 tmpIndex;
    siint32 tmpGyroPulse[IMU_OCTO_NUM];
    siint32 tmpGyroPulseOld[IMU_OCTO_NUM];
    unint32 tmpHeadVldFlg;
    float64 tmpFltdGCycle;
    float64 tmpFltLast;
    float64 tmpFltAbs;
    float64 tmpFltTime;
    float64 tmpVG[3][3];
    float64 tmpMat43[4][3];
    float64 tmpVec[3];
    float64 tmpVec4[4];
    float64 tmpg12[3];
    float64 tmpg23[3];
    float64 tmpg34[3];
    float64 tmpg13[3];
    float64 tmpg24[3];
    float64 tmpg14[3];
    float64 Tmp64;
    SQuater tmpQ;

    /* (1)陀螺安装矢量补偿计算 */
    GyroVGComplement();

    /* (2)陀螺剔野及饱和处理 */

    /* ① TmpZT2=ZT2，UseZT2=ZT2 */
    tmpZT2 = sGncCtrlFlag.ZT2;
    sGncCtrlFlag.UseZT2 = sGncCtrlFlag.ZT2;

    /* ② 更新UseZT2 */
    cntBit = 0;
    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* 获取及回写陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            tmpBit = tmpBit * sImuQuadRaw.headVldFlg[iCycle][iGyro];
        }
        UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

        /* 统计可用陀螺个数 */
        cntBit = cntBit + tmpBit;
    }

    /* ③ 若UseZT2有效个数≥3 */
    if (cntBit >= 3)
    {
        sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
    }

    /* ④ ZT8(D0)=1，陀螺数据剔野及饱和处理 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 0u) == 1)
    {
        cntBit = 0;
        for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
        {
            tmpOutFlg = 1;

            for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
            {
                /* 第1个子样 */
                if (iCycle == 0)
                {
                    tmpFltLast = sGyroData.dgLastCycle[iGyro];
                    tmpHeadVldFlg = sImuQuadRaw.headVldFlgOld[7][iGyro];
                }
                /* 其他子样 */
                else
                {
                    tmpFltLast = sImuQuadRaw.gyro[iCycle-1][iGyro];
                    tmpHeadVldFlg = sImuQuadRaw.headVldFlg[iCycle-1][iGyro];
                }

                /* 剔野操作 */
                {
                    /* 计算前后两个子样的角速度增量, 单位rad/s */
                    tmpFltdGCycle = Fabsx(sImuQuadRaw.gyro[iCycle][iGyro] - tmpFltLast) / T_16MS;

                    if ((sImuQuadRaw.headVldFlg[iCycle][iGyro] == 1) &&
                        ((tmpHeadVldFlg == 1) && (tmpFltdGCycle > sImuParam.wOutGyro)))
                    {
                        if (sGyroData.cntGyroOut[iGyro] < sImuParam.lmtNumOutGyro)
                        {
                            /* 认为为剔野, 当拍数据被旧值覆盖 */
                            sImuQuadRaw.gyro[iCycle][iGyro] = tmpFltLast;

                            /* 剔野计数累加 */
                            sGyroData.cntGyroOut[iGyro]++;
                        }
                        else
                        {
                            /* 剔野计数清零 */
                            sGyroData.cntGyroOut[iGyro] = 0;
                        }
                    }
                    else
                    {
                        /* 剔野计数清零 */
                        sGyroData.cntGyroOut[iGyro] = 0;
                    }
                }

                /* 饱和操作 */
                {
                    tmpFltAbs = Fabsx(sImuQuadRaw.gyro[iCycle][iGyro]);
                    if (tmpFltAbs > sImuParam.dgMaxGyro)
                    {
                        /* 当拍数据限幅处理 */
                        sImuQuadRaw.gyro[iCycle][iGyro] = LimitDouble(sImuQuadRaw.gyro[iCycle][iGyro], sImuParam.dgMaxGyro);

                        /* 该陀螺数据不可用 */
                        tmpOutFlg = 0;
                    }
                }
            }

            /* 获取及回写陀螺指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
            tmpBit = tmpBit * tmpOutFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

            /* 统计可用陀螺个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT2有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
        }
    }

    /* (3)陀螺常值 */

    /* 模式判断 */
    /* 2≤BZ1≤8 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
    {
        bModeOk1 = TRUE32;
    }
    else
    {
        bModeOk1 = FALSE32;
    }

    /* BZ1≠5或者ZT8(D17)==1 */
    /* ZT8(D17)=1，滑行诊断IMU常值故障 */
    if ((sGncCtrlFlag.BZ1 != WORK_MODE_GLIDE) ||
        (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 17u) == 1))
    {
        bModeOk2 = TRUE32;
    }
    else
    {
        bModeOk2 = FALSE32;
    }

    /* ZT8(D1)=1，陀螺数据常值判断和处理 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT8, 1u) == 1) &&
        (bModeOk1 == TRUE32) &&
        (bModeOk2 == TRUE32))
    {
        cntBit = 0;
        for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
        {
            /* 数组缓存 */
            for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
            {
                tmpGyroPulse[iCycle] = sImuQuadRaw.gyroPulse[iCycle][iGyro];
                tmpGyroPulseOld[iCycle] = sGyroData.gyroPulseOld[iCycle][iGyro];
            }

            /* 常值判断公共函数 */
            bConst = ConstDiagSignInt(&sGyroData.cntConst[iGyro], &tmpGyroPulse[0],
                                      &tmpGyroPulseOld[0], 8, sImuParam.lmtNumConstGyro);

            /* 常值判定 */
            if (bConst == TRUE32)
            {
                tmpCnstFlg = 0;
            }
            else
            {
                tmpCnstFlg = 1;
            }

            /* 获取及回写陀螺指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
            tmpBit = tmpBit * tmpCnstFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

            /* 统计可用陀螺个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT2有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
        }
    }

    /* (4)选择参与定姿的陀螺 */
    tmpFltTime = T_128MS / 3600.0;

    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* ① */
        sGyroData.dg[iGyro] = 0.0;

        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            sGyroData.dg[iGyro] = sGyroData.dg[iGyro] + sImuQuadRaw.gyro[iCycle][iGyro];
        }

        /* ②ZT9(D4)=1，星敏标定陀螺安装 */
        if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 4u) == 1)
        {
            sGyroData.dgo[iGyro] = sGyroData.dg[iGyro];
        }

        /* ③ */
        sGyroData.dgg[iGyro] = sGyroData.dg[iGyro] - sImuParam.constDriftEstiGyro[iGyro] * tmpFltTime;

        /* ④ */
        sGyroData.dg[iGyro] = sGyroData.dg[iGyro] - sImuParam.constDriftGyro[iGyro] * tmpFltTime;
    }

    /* ⑤ Olddgn[6][10]，全局变量，浮点，为6个陀螺10拍历史数据 */
    /*  NImuDiag，全局变量，整型，初值5 ，可注入修改；=1表示保持原有算法 */
    if ((sImuParam.NImuDiag > 1) && (sImuParam.NImuDiag < 12))
    {
        for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
        {
            Tmp64 = sGyroData.dg[iGyro];

            /* for(j=NImuDiag-2:0) */
            if ((sImuParam.NImuDiag - 2) >= 0)
            {
                for (j=sImuParam.NImuDiag - 2; j >= 0; j--)
                {
                    sGyroData.dg[iGyro] = sGyroData.dg[iGyro] + sGyroData.Olddg[iGyro][j];

                    if (j == 0)
                    {
                        sGyroData.Olddg[iGyro][j] = Tmp64;
                    }
                    else
                    {
                        sGyroData.Olddg[iGyro][j] = sGyroData.Olddg[iGyro][j-1];
                    }
                }
            }

            /* NImuDiag拍平均 */
            sGyroData.dg[iGyro] = sGyroData.dg[iGyro] / sImuParam.NImuDiag;
        }
    }

    /* ⑥调用4.8.1（陀螺故障检测及选择） */
    ImuDiagSelect(TRUE32);

    /* ⑦恢复ZT2 */
    sGncCtrlFlag.ZT2 = tmpZT2;

    /* (5)计算Δt1周期三轴角度增量Δgtm */

    /* Δgt0=Δgt8 */
    sGyroData.dgt0[0] = sGyroData.dgt[7][0];
    sGyroData.dgt0[1] = sGyroData.dgt[7][1];
    sGyroData.dgt0[2] = sGyroData.dgt[7][2];

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
    MatrixInv33(&tmpVG[0][0], &tmpVG[0][0]);

    /* 计算Δgtm */
    tmpFltTime = T_16MS / 3600.0;

    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        tmpVec[0] = sImuQuadRaw.gyro[iCycle][gyroNum[0]] - sImuParam.constDriftGyro[gyroNum[0]] * tmpFltTime;
        tmpVec[1] = sImuQuadRaw.gyro[iCycle][gyroNum[1]] - sImuParam.constDriftGyro[gyroNum[1]] * tmpFltTime;
        tmpVec[2] = sImuQuadRaw.gyro[iCycle][gyroNum[2]] - sImuParam.constDriftGyro[gyroNum[2]] * tmpFltTime;

        /* 矩阵乘向量 */
        MatrixMulti331(&sGyroData.dgt[iCycle][0], &tmpVG[0][0], &tmpVec[0]);
    }

    /* (6)陀螺通讯故障处理 */
    /* 统计可用陀螺个数 */
    cntBit = 0;
    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* 获取陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
        cntBit = cntBit + tmpBit;
    }

    /* “ZT8(D4)=1且UseZT2有效个数<3” */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT8, 4u) == 1) && (cntBit < 3))
    {
        /* 调用4.8.4（陀螺通讯故障处理） */
        GyroFaultDataProc();
    }

    /* (7)三轴绝对角速度 */

    /* ① */
    tmpVec[0] = 0.0;
    tmpVec[1] = 0.0;
    tmpVec[2] = 0.0;
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        tmpVec[0] = tmpVec[0] + sGyroData.dgt[iCycle][0];
        tmpVec[1] = tmpVec[1] + sGyroData.dgt[iCycle][1];
        tmpVec[2] = tmpVec[2] + sGyroData.dgt[iCycle][2];
    }

    sGyroData.w[0] = tmpVec[0] / T_128MS;
    sGyroData.w[1] = tmpVec[1] / T_128MS;
    sGyroData.w[2] = tmpVec[2] / T_128MS;

    /* ② */
    /* [Δggi Δggj Δggk]T */
    tmpVec[0] = sGyroData.dgg[gyroNum[0]];
    tmpVec[1] = sGyroData.dgg[gyroNum[1]];
    tmpVec[2] = sGyroData.dgg[gyroNum[2]];

    /* 矩阵乘向量 */
    MatrixMulti331(&sGyroData.dggt[0], &tmpVG[0][0], &tmpVec[0]);

    /* ③ */
    /* 模式判断 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
    {
        sGyroData.wg[0] = sGyroData.w[0];
        sGyroData.wg[1] = sGyroData.w[1];
        sGyroData.wg[2] = sGyroData.w[2];
    }
    else
    {
        sGyroData.wg[0] = sGyroData.dggt[0] / T_128MS;
        sGyroData.wg[1] = sGyroData.dggt[1] / T_128MS;
        sGyroData.wg[2] = sGyroData.dggt[2] / T_128MS;
    }

    /* ④ */
    sGyroData.oldw8[0] = sGyroData.w8[0];
    sGyroData.oldw8[1] = sGyroData.w8[1];
    sGyroData.oldw8[2] = sGyroData.w8[2];
    sGyroData.w8[0] = sGyroData.dgt[7][0] / T_16MS;
    sGyroData.w8[1] = sGyroData.dgt[7][1] / T_16MS;
    sGyroData.w8[2] = sGyroData.dgt[7][2] / T_16MS;

    /* (8)保存历史姿态数据 */

    /* 记录10拍历史数据 */
    {
        /* 更新游标 */
        sAttiHistoryData.indexIns = (sAttiHistoryData.indexIns + 1) % ATT_HISTORY_BUFF_NUM;

        /* 获取游标 */
        tmpIndex = sAttiHistoryData.indexIns;

        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            if (iCycle == 0)
            {
                tmpQ = sAttiData.q;
            }
            else
            {
                tmpQ = sAttiHistoryData.qIns[tmpIndex][iCycle-1];
            }

            sGyroData.PHI[0] = sGyroData.dgt[iCycle][0];
            sGyroData.PHI[1] = sGyroData.dgt[iCycle][1];
            sGyroData.PHI[2] = sGyroData.dgt[iCycle][2];

            /* 四元数积分，内部已归一化 */
            QInteg(&tmpQ.q4[0], &tmpQ.q4[0], &sGyroData.PHI[0]);

            sAttiHistoryData.qIns[tmpIndex][iCycle] = tmpQ;
        }
    }

    /* (10)四元数预估 */

    /* 前后两个四子样 */
    for (j=0; j<2; j++)
    {
        iCycle = (unint32)j * 4;

        /* ①/③ */
        /* 三维向量叉乘 */
        VectorCross3(&tmpg12[0], &sGyroData.dgt[iCycle+0][0], &sGyroData.dgt[iCycle+1][0]);
        VectorCross3(&tmpg23[0], &sGyroData.dgt[iCycle+1][0], &sGyroData.dgt[iCycle+2][0]);
        VectorCross3(&tmpg34[0], &sGyroData.dgt[iCycle+2][0], &sGyroData.dgt[iCycle+3][0]);
        VectorCross3(&tmpg13[0], &sGyroData.dgt[iCycle+0][0], &sGyroData.dgt[iCycle+2][0]);
        VectorCross3(&tmpg24[0], &sGyroData.dgt[iCycle+1][0], &sGyroData.dgt[iCycle+3][0]);
        VectorCross3(&tmpg14[0], &sGyroData.dgt[iCycle+0][0], &sGyroData.dgt[iCycle+3][0]);

        for (i=0; i<3; i++)
        {
            sGyroData.PHI[i] = sGyroData.dgt[iCycle+0][i] + sGyroData.dgt[iCycle+1][i] + sGyroData.dgt[iCycle+2][i] + sGyroData.dgt[iCycle+3][i] +
                    tmpg12[i] * sAttiModifyParam.a12 +
                    tmpg23[i] * sAttiModifyParam.a23 +
                    tmpg34[i] * sAttiModifyParam.a34 +
                    tmpg13[i] * sAttiModifyParam.a13 +
                    tmpg24[i] * sAttiModifyParam.a24 +
                    tmpg14[i] * sAttiModifyParam.a14;
        }

        /* ②/④ */
        if (j == 0)
        {
            sAttiData.Q0 = sAttiData.q;
        }
        else
        {
            sAttiData.Q1 = sAttiData.q;
        }

        /* 四元数积分，内部已归一化 */
        QInteg(&sAttiData.q.q4[0], &sAttiData.q.q4[0], &sGyroData.PHI[0]);
    }

    /* ⑤ */
    Q2C(&sAttiData.cbi[0][0], &sAttiData.q.q4[0]);
    MatrixTran33(&sAttiData.cib[0][0], &sAttiData.cbi[0][0]);

    /* ⑥ */
    Q2Ksi(&tmpMat43[0][0], &sAttiData.qg.q4[0]);
    MatrixMulti(&tmpVec4[0], &tmpMat43[0][0], &sGyroData.dggt[0], 4, 3, 1);
    VectorAddCoef(&sAttiData.qg.q4[0], &sAttiData.qg.q4[0], &tmpVec4[0], 0.5, 4);
    QUnit(&sAttiData.qg.q4[0]);

    return;
}

void AcceVAComplement(void)
{
    unint32 iAxis;

    /* 6个安装向量/3轴 */
    for (iAxis=0; iAxis<3; iAxis++)
    {
        sAcceData.vecVA[0][iAxis] = sImuParam.vecVA0[0][iAxis] + sImuParam.dAxy1*sImuParam.vecVA0[2][iAxis] + sImuParam.dAxz1*sImuParam.vecVA0[4][iAxis];
        sAcceData.vecVA[2][iAxis] = sImuParam.vecVA0[2][iAxis] + sImuParam.dAyx1*sImuParam.vecVA0[0][iAxis] + sImuParam.dAyz1*sImuParam.vecVA0[4][iAxis];
        sAcceData.vecVA[4][iAxis] = sImuParam.vecVA0[4][iAxis] + sImuParam.dAzx1*sImuParam.vecVA0[0][iAxis] + sImuParam.dAzy1*sImuParam.vecVA0[2][iAxis];
        sAcceData.vecVA[1][iAxis] = sImuParam.vecVA0[1][iAxis] + sImuParam.dAxy2*sImuParam.vecVA0[3][iAxis] + sImuParam.dAxz2*sImuParam.vecVA0[5][iAxis];
        sAcceData.vecVA[3][iAxis] = sImuParam.vecVA0[3][iAxis] + sImuParam.dAyx2*sImuParam.vecVA0[1][iAxis] + sImuParam.dAyz2*sImuParam.vecVA0[5][iAxis];
        sAcceData.vecVA[5][iAxis] = sImuParam.vecVA0[5][iAxis] + sImuParam.dAzx2*sImuParam.vecVA0[1][iAxis] + sImuParam.dAzy2*sImuParam.vecVA0[3][iAxis];
    }

    /* 矢量归一化 */
    VectorUnit3(&sAcceData.vecVA[0][0]);
    VectorUnit3(&sAcceData.vecVA[1][0]);
    VectorUnit3(&sAcceData.vecVA[2][0]);
    VectorUnit3(&sAcceData.vecVA[3][0]);
    VectorUnit3(&sAcceData.vecVA[4][0]);
    VectorUnit3(&sAcceData.vecVA[5][0]);

    return;
}

void AcceFaultDataProc(void)
{
    unint32 iCycle;

    /* （1） */
    /* 若2≤BZ1≤8 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
    {
        /* a_B=Itotal/mass/Δt */
        VectorScalar3(&sAcceData.aB[0], &sBodyData.Itotal[0], 1.0/(sBodyData.mass * T_128MS));
    }

    /* （2） */
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        /* Δv_Bm=a_B•Δt/8 */
        VectorScalar3(&sAcceData.dvBm[iCycle][0], &sAcceData.aB[0], T_128MS/8.0);
    }

    return;
}

void AcceDataProc128(void)
{
    unint32 iAcce;
    unint32 iCycle;
    unint32 tmpBit;
    unint32 tmpZT3;
    unint32 cntBit;
    unint32 cntAcce;
    unint32 tmpOutFlg;
    unint32 tmpCnstFlg;
    unint32 acceNum[3];     /* 参与导航的三个加计编号i,j,k */
    boolu32 bConst;
    boolu32 bModeOk1;
    boolu32 bModeOk2;
    boolu32 bCondOk;
    siint32 tmpAccePulse[IMU_OCTO_NUM];
    siint32 tmpAccePulseOld[IMU_OCTO_NUM];
    unint32 tmpHeadVldFlg;
    siint32 j;
    float64 tmpFltdVCycle;
    float64 tmpFltLast;
    float64 tmpFltAbs;
    float64 tmpFltSum;
    float64 Tmp64;
    float64 tmpVA[3][3];
    float64 tmpP1[3];
    float64 tmpP2[3];
    float64 tmpdw[3];
    float64 tmpVec[3];
    float64 tmpVec3Sec[3];
    float64 tmpdV1[3];
    float64 tmpdV2[3];
    float64 tmpdgLast[3];
    float64 tmpvr[IMU_OCTO_NUM][IMU_HEAD_NUM];

    /* (1)安装矢量补偿计算 */
    AcceVAComplement();

    /* (2)加计剔野及饱和处理 */

    /* ① TmpZT3=ZT3，UseZT3=ZT3 */
    tmpZT3 = sGncCtrlFlag.ZT3;
    sGncCtrlFlag.UseZT3 = sGncCtrlFlag.ZT3;

    /* ② 更新UseZT3 */
    cntBit = 0;
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        /* 获取及回写加计指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            tmpBit = tmpBit * sImuQuadRaw.headVldFlg[iCycle][iAcce];
        }
        UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

        /* 统计可用加计个数 */
        cntBit = cntBit + tmpBit;
    }

    /* ③ 若UseZT3有效个数≥3 */
    if (cntBit >= 3)
    {
        sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
    }

    /* ④ ZT8(D2)=1，加计数据剔野及饱和处理 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 2u) == 1)
    {
        cntBit = 0;
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            tmpOutFlg = 1;

            for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
            {
                /* 第1个子样 */
                if (iCycle == 0)
                {
                    tmpFltLast = sAcceData.dvLastCycle[iAcce];
                    tmpHeadVldFlg = sImuQuadRaw.headVldFlgOld[7][iAcce];
                }
                /* 其他子样 */
                else
                {
                    tmpFltLast = sImuQuadRaw.acce[iCycle-1][iAcce];
                    tmpHeadVldFlg = sImuQuadRaw.headVldFlg[iCycle-1][iAcce];
                }

                /* 剔野操作 */
                {
                    /* 计算前后两个子样的速度增量, 单位m/s2 */
                    tmpFltdVCycle = Fabsx(sImuQuadRaw.acce[iCycle][iAcce] - tmpFltLast) / T_16MS;

                    if ((sImuQuadRaw.headVldFlg[iCycle][iAcce] == 1) &&
                        ((tmpHeadVldFlg == 1) && (tmpFltdVCycle > sImuParam.aOutAcce)))
                    {
                        if (sAcceData.cntAcceOut[iAcce] < sImuParam.lmtNumOutAcce)
                        {
                            /* 认为为剔野, 当拍数据被旧值覆盖 */
                            sImuQuadRaw.acce[iCycle][iAcce] = tmpFltLast;

                            /* 剔野计数累加 */
                            sAcceData.cntAcceOut[iAcce]++;
                        }
                        else
                        {
                            /* 剔野计数清零 */
                            sAcceData.cntAcceOut[iAcce] = 0;
                        }
                    }
                    else
                    {
                        /* 剔野计数清零 */
                        sAcceData.cntAcceOut[iAcce] = 0;
                    }
                }

                /* 饱和操作 */
                {
                    tmpFltAbs = Fabsx(sImuQuadRaw.acce[iCycle][iAcce]);
                    if (tmpFltAbs > sImuParam.dvMaxAcce)
                    {
                        /* 当拍数据限幅处理 */
                        sImuQuadRaw.acce[iCycle][iAcce] = LimitDouble(sImuQuadRaw.acce[iCycle][iAcce], sImuParam.dvMaxAcce);

                        /* 该加计数据不可用 */
                        tmpOutFlg = 0;
                    }
                }
            }

            /* 获取及回写加计指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
            tmpBit = tmpBit * tmpOutFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

            /* 统计可用加计个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT3有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
        }
    }

    /* (3)加计常值 */

    /* 模式判断 */
    /* 2≤BZ1≤8 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
    {
        bModeOk1 = TRUE32;
    }
    else
    {
        bModeOk1 = FALSE32;
    }

    /* BZ1≠5或者ZT8(D17)==1 */
    /* ZT8(D17)=1，滑行诊断IMU常值故障 */
    if ((sGncCtrlFlag.BZ1 != WORK_MODE_GLIDE) ||
        (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 17u) == 1))
    {
        bModeOk2 = TRUE32;
    }
    else
    {
        bModeOk2 = FALSE32;
    }

    /* ZT8(D3)=1，加计数据常值判断和处理 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT8, 3u) == 1) &&
        (bModeOk1 == TRUE32) &&
        (bModeOk2 == TRUE32))
    {
        cntBit = 0;
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            /* 数组缓存 */
            for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
            {
                tmpAccePulse[iCycle] = sImuQuadRaw.accePulse[iCycle][iAcce];
                tmpAccePulseOld[iCycle] = sAcceData.accePulseOld[iCycle][iAcce];
            }

            /* 常值判断公共函数 */
            bConst = ConstDiagSignInt(&sAcceData.cntConst[iAcce], &tmpAccePulse[0],
                                      &tmpAccePulseOld[0], 8, sImuParam.lmtNumConstAcce);

            /* 常值判定 */
            if (bConst == TRUE32)
            {
                tmpCnstFlg = 0;
            }
            else
            {
                tmpCnstFlg = 1;
            }

            /* 获取及回写加计指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
            tmpBit = tmpBit * tmpCnstFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

            /* 统计可用加计个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT3有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
        }
    }

    /* (4)杆臂效应补偿 */
    VectorSub3(&tmpP1[0], &sImuParam.pacc1[0], &sBodyData.pgoF[0]);
    VectorSub3(&tmpP2[0], &sImuParam.pacc2[0], &sBodyData.pgoF[0]);
    MatrixMulti331(&tmpP1[0], &sAttiModifyParam.cBF[0][0], &tmpP1[0]);
    MatrixMulti331(&tmpP2[0], &sAttiModifyParam.cBF[0][0], &tmpP2[0]);

    /* 循环i=1~8 */
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        if (iCycle == 0)
        {
            tmpdgLast[0] = sGyroData.dgt0[0];
            tmpdgLast[1] = sGyroData.dgt0[1];
            tmpdgLast[2] = sGyroData.dgt0[2];
        }
        else
        {
            tmpdgLast[0] = sGyroData.dgt[iCycle-1][0];
            tmpdgLast[1] = sGyroData.dgt[iCycle-1][1];
            tmpdgLast[2] = sGyroData.dgt[iCycle-1][2];
        }

        /* 计算dω */
        VectorSub3(&tmpdw[0], &sGyroData.dgt[iCycle][0], &tmpdgLast[0]);
        VectorScalar3(&tmpdw[0], &tmpdw[0], 1.0/T_16MS);

        /* 计算TmpΔv1 */
        VectorCross3(&tmpVec[0], &sGyroData.dgt[iCycle][0], &tmpP1[0]);
        VectorCross3(&tmpVec[0], &sGyroData.dgt[iCycle][0], &tmpVec[0]);
        VectorScalar3(&tmpVec[0], &tmpVec[0], 1.0/T_16MS);
        VectorCross3(&tmpVec3Sec[0], &tmpdw[0], &tmpP1[0]);
        VectorAdd3(&tmpdV1[0], &tmpVec[0], &tmpVec3Sec[0]);

        /* 计算TmpΔv2 */
        VectorCross3(&tmpVec[0], &sGyroData.dgt[iCycle][0], &tmpP2[0]);
        VectorCross3(&tmpVec[0], &sGyroData.dgt[iCycle][0], &tmpVec[0]);
        VectorScalar3(&tmpVec[0], &tmpVec[0], 1.0/T_16MS);
        VectorCross3(&tmpVec3Sec[0], &tmpdw[0], &tmpP2[0]);
        VectorAdd3(&tmpdV2[0], &tmpVec[0], &tmpVec3Sec[0]);

        /* 计算Δvr(n,i) */
        tmpvr[iCycle][0] = VectorDot3(&sAcceData.vecVA[0][0], &tmpdV1[0]);
        tmpvr[iCycle][2] = VectorDot3(&sAcceData.vecVA[2][0], &tmpdV1[0]);
        tmpvr[iCycle][4] = VectorDot3(&sAcceData.vecVA[4][0], &tmpdV1[0]);
        tmpvr[iCycle][1] = VectorDot3(&sAcceData.vecVA[1][0], &tmpdV2[0]);
        tmpvr[iCycle][3] = VectorDot3(&sAcceData.vecVA[3][0], &tmpdV2[0]);
        tmpvr[iCycle][5] = VectorDot3(&sAcceData.vecVA[5][0], &tmpdV2[0]);

        /* 计算Δvni */
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sImuQuadRaw.acce[iCycle][iAcce] = sImuQuadRaw.acce[iCycle][iAcce] - tmpvr[iCycle][iAcce];
        }
    }

    /* (5)六个加计数据处理 */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        tmpFltSum = 0.0;

        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            tmpFltSum = tmpFltSum + sImuQuadRaw.acce[iCycle][iAcce];
        }

        sAcceData.as[iAcce] = tmpFltSum / T_128MS;
    }

    /* (6)六个加计零位处理 */
    bCondOk = FALSE32;

    /* 条件1: BZ1==0且(不与着陆器通信或者(与着陆器通信且通信成功且Z_tNJSum>kNJ1·Δt)) */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_WAIT) &&
        ((sZlqCcuStatus.bCommValid == FALSE32) || (sZlqCcuRecvData.ZtNJSum > (sImuParam.kNJ1 * T_128MS))))
    {
        bCondOk = TRUE32;
    }

    /* 条件2: BZ1==5且|ω|<ωAZ且tNJSum>kNJ2·Δt */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE) &&
        (sThruCtrl.tNJSum > (sImuParam.kNJ2 * T_128MS)) &&
        (VectorNorm3(&sGyroData.w[0]) < sImuParam.wAZ))
    {
        bCondOk = TRUE32;
    }

    /* 若AZFlg==1 且 (条件1 或 条件2) */
    if ((sImuParam.flgZeroAcce == IMU_ACCE_ZERO_ESTI_EXE) && (bCondOk == TRUE32))
    {
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sAcceData.as0[iAcce] = sAcceData.as0[iAcce] + sImuParam.coefZeroAcce * (sAcceData.as[iAcce] - sAcceData.as0[iAcce]);
            sAcceData.as0[iAcce] = LimitDouble(sAcceData.as0[iAcce], sImuParam.lmtZeroAcce);
        }
    }
    else if (sImuParam.flgZeroAcce == IMU_ACCE_ZERO_INJECT)
    {
        /* 使用地面注入asn0 */
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sAcceData.as0[iAcce] = sImuParam.zeroAcceAsn0Inj[iAcce];
        }
    }
    else if (sImuParam.flgZeroAcce == IMU_ACCE_ZERO_INITIAL)
    {
        /* 使用初始装订值 */
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sAcceData.as0[iAcce] = sImuParam.zeroAcceAsn0Init[iAcce];
        }
    }
    else
    {
        /* 无操作 */
        NULL_STATEMENT();
    }

    /* (7)选择参与导航的加计 */
    /* ① */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        sAcceData.as[iAcce] = sAcceData.as[iAcce] - sAcceData.as0[iAcce];
    }

    /* ② Oldasn[6][10]，全局变量，浮点，为6个加计10拍历史数据 */
    if ((sImuParam.NImuDiag > 1) && (sImuParam.NImuDiag < 12))
    {
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            Tmp64 = sAcceData.as[iAcce];

            /* for(j=NImuDiag-2:0) */
            if ((sImuParam.NImuDiag - 2) >= 0)
            {
                for (j=sImuParam.NImuDiag - 2; j >= 0; j--)
                {
                    sAcceData.as[iAcce] = sAcceData.as[iAcce] + sAcceData.Oldas[iAcce][j];

                    if (j == 0)
                    {
                        sAcceData.Oldas[iAcce][j] = Tmp64;
                    }
                    else
                    {
                        sAcceData.Oldas[iAcce][j] = sAcceData.Oldas[iAcce][j-1];
                    }
                }
            }

            /* NImuDiag拍平均 */
            sAcceData.as[iAcce] = sAcceData.as[iAcce] / sImuParam.NImuDiag;
        }
    }

    /* ② 调用4.8.2（加计故障检测及选择） */
    ImuDiagSelect(FALSE32);

    /* ③ 恢复ZT3 */
    sGncCtrlFlag.ZT3 = tmpZT3;

    /* (8)三轴加速度 */

    /* 由BZ3确定的加计（编号i、j、k） */
    acceNum[0] = 0;
    acceNum[1] = 0;
    acceNum[2] = 0;

    cntAcce = 0;
    iAcce = 0;
    while ((cntAcce < 3) && (iAcce < IMU_HEAD_NUM))
    {
        if (UI32_BIT_GET1(sGncCtrlFlag.BZ3, iAcce) == 1)
        {
            acceNum[cntAcce] = iAcce;
            cntAcce++;
        }

        iAcce++;
    }

    /* 增加断言判断 */
    ASSERT(cntAcce == 3);

    /* 三个行向量拼为一个3×3矩阵 */
    VectorEval3(&tmpVA[0][0], &sAcceData.vecVA[acceNum[0]][0]);
    VectorEval3(&tmpVA[1][0], &sAcceData.vecVA[acceNum[1]][0]);
    VectorEval3(&tmpVA[2][0], &sAcceData.vecVA[acceNum[2]][0]);

    /* 矩阵求逆 */
    MatrixInv33(&tmpVA[0][0], &tmpVA[0][0]);

    /* ①计算计算对应子样本体三轴速度增量矢量Δv_Bm */
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        tmpVec[0] = sImuQuadRaw.acce[iCycle][acceNum[0]] - sAcceData.as0[acceNum[0]] * T_16MS;
        tmpVec[1] = sImuQuadRaw.acce[iCycle][acceNum[1]] - sAcceData.as0[acceNum[1]] * T_16MS;
        tmpVec[2] = sImuQuadRaw.acce[iCycle][acceNum[2]] - sAcceData.as0[acceNum[2]] * T_16MS;

        /* 矩阵乘向量 */
        MatrixMulti331(&sAcceData.dvBm[iCycle][0], &tmpVA[0][0], &tmpVec[0]);
    }

    /* ②加计通讯故障处理 */
    /* 统计可用加计个数 */
    cntBit = 0;
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        /* 获取加计指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
        cntBit = cntBit + tmpBit;
    }

    /* “ZT8(D5)=1且UseZT3有效个数<3” */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT8, 5u) == 1) && (cntBit < 3))
    {
        /* 调用4.8.5（加计通讯故障处理） */
        AcceFaultDataProc();
    }

    /* ③计算本体三轴加速度矢量a_B */
    tmpVec[0] = 0.0;
    tmpVec[1] = 0.0;
    tmpVec[2] = 0.0;
    for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
    {
        tmpVec[0] = tmpVec[0] + sAcceData.dvBm[iCycle][0];
        tmpVec[1] = tmpVec[1] + sAcceData.dvBm[iCycle][1];
        tmpVec[2] = tmpVec[2] + sAcceData.dvBm[iCycle][2];
    }

    sAcceData.aB[0] = tmpVec[0] / T_128MS;
    sAcceData.aB[1] = tmpVec[1] / T_128MS;
    sAcceData.aB[2] = tmpVec[2] / T_128MS;

    return;
}

void SunCalendarCalc(void)
{
    float64 ws;
    float64 Ms;
    float64 tmpTc;
    float64 tmpf;
    float64 tmpMat33T[3][3];
    float64 tmpMat33[3][3];

    /* (1)太阳在地心惯性坐标系的纬度幅角 */
    tmpTc = (sTime.sstime + sNaviParam.tEPH0) / 3155760000.0;
    ws = 4.93819 + 0.0056298 * tmpTc;
    Ms = 6.2400466 + 628.301955 * tmpTc;
    sNaviData.is = 0.40909 - 0.000227 * tmpTc;

    tmpf = ws + Ms + 0.033416 * Sinx(Ms) + 0.00034897 * Sinx(2.0 * Ms) + 0.000005 * Sinx(3.0 * Ms);
    sNaviData.us = ModPNHP(tmpf, PI);

    /* (2)太阳矢量在地心惯性坐标系的方位 */
    sNaviData.SI[0] = Cosx(sNaviData.us);
    sNaviData.SI[1] = Cosx(sNaviData.is) * Sinx(sNaviData.us);
    sNaviData.SI[2] = Sinx(sNaviData.is) * Sinx(sNaviData.us);

    /* (3)SunVec = CBFT·CBI·SI */
    MatrixTran33(&tmpMat33T[0][0], &sAttiModifyParam.cBF[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33T[0][0], &sAttiData.cbi[0][0]);
    MatrixMulti331(&sWalkPointToData.SunVec[0], &tmpMat33[0][0], &sNaviData.SI[0]);

    return;
}

void ImpulseMomentCalc(void)
{
    float64 tmpdP[3];
    float64 tmpFltDt;
    float64 tmpF285;
    float64 tmpFlt;
    float64 tmpFlt2;
    float64 tmpI[3];
    float64 tmpPos[3];
    float64 tmpVec[3];
    float64 tmpdelay[THRU_THRU_GROUP_NUM];
    unint32 iThru;
    unint32 j;
    unint32 indx40N;
    unint32 TmpN;
    float64 *TmpA;

    /* (1) */
    VectorZero3(&sBodyData.Itotal[0]);
    VectorZero3(&sBodyData.Htotal[0]);
    VectorZero3(&sBodyData.HtotalP[0]);

    /* (2) */
    tmpdP[0] = 0.0;
    tmpdP[1] = sBodyData.ygo;
    tmpdP[2] = sBodyData.zgo;

    /* (3)发动机错峰时间 */
    for (iThru=0; iThru<THRU_THRU_GROUP_NUM; iThru++)
    {
        tmpdelay[iThru] = sThruWorkStatus.tDelay;
    }

    /* AF2/BF2 */
    tmpdelay[4] = sThruWorkStatus.tDelay + Dtimer2;
    tmpdelay[5] = tmpdelay[4];

    /* AF3/BF3 */
    tmpdelay[0] = sThruWorkStatus.tDelay + Dtimer3;
    tmpdelay[1] = tmpdelay[0];

    /* CF1/2/3/4 */
    tmpdelay[7] = sThruWorkStatus.tDelay + Dtimer4;
    tmpdelay[9] = tmpdelay[7];
    tmpdelay[11]= tmpdelay[7];
    tmpdelay[13]= tmpdelay[7];

    /* DF1/2/3/4 */
    tmpdelay[6] = sThruWorkStatus.tDelay + Dtimer5;
    tmpdelay[8] = tmpdelay[6];
    tmpdelay[10]= tmpdelay[6];
    tmpdelay[12]= tmpdelay[6];

    /* (4)选择比冲推力矩阵 */
    TmpN = 0;
    for (iThru=0; iThru<THRU_285N_GROUP_NUM; iThru++)
    {
        if (sThruWorkStatus.timer285[iThru] > 0.005)
        {
            TmpN++;
        }
    }

    /* 若TmpN≥5，则：TmpA=PulseIspForce */
    if (TmpN >= 5)
    {
        TmpA = &pulseIspForce[0][0];
    }
    /* 否则若TmpN≥3，则：TmpA=PulseIspForce_4 */
    else if (TmpN >= 3)
    {
        TmpA = &pulseIspForce_4[0][0];
    }
    /* 否则：TmpA=PulseIspForce_2 */
    else
    {
        TmpA = &pulseIspForce_2[0][0];
    }

    /* (5)循环i从0到21 */
    for (iThru=0; iThru<THRU_THRU_GROUP_NUM; iThru++)
    {
        /* 时间差 */
        tmpFltDt = T_128MS - tmpdelay[iThru];

        /* ① 285N推力器 */
        if (iThru < THRU_285N_GROUP_NUM)
        {
            /* tmpF285 */
            tmpF285 = sThruCtrl.F285;

            if ((sThruWorkStatus.timer285[iThru] >= TmpA[0 * 3 + 0]) &&
                (sThruWorkStatus.timer285[iThru] <= TmpA[4 * 3 + 0]))
            {
                for (j=0; j<4; j++)
                {
                    if ((sThruWorkStatus.timer285[iThru] >= TmpA[(j    ) * 3 + 0]) &&
                        (sThruWorkStatus.timer285[iThru] <  TmpA[(j + 1) * 3 + 0]))
                    {
                        tmpFlt = (TmpA[(j + 1) * 3 + 2] - TmpA[j * 3 + 2]) *
                                 (sThruWorkStatus.timer285[iThru] - TmpA[j * 3 + 0]);
                        tmpFlt = tmpFlt / (TmpA[(j + 1) * 3 + 0] - TmpA[j * 3 + 0]);

                        tmpF285 = TmpA[j * 3 + 2] + tmpFlt;
                    }
                }
            }

            /* OldT285[i]=min(min(Timer285[i],Δt-Tmpdelay[i])+tsv285[i],Δt) */
            tmpFlt = Minx(sThruWorkStatus.timer285[iThru], tmpFltDt);
            sThruCtrl.oldT285[iThru] = Minx(tmpFlt + sThruWorkStatus.tsv285[iThru], T_128MS);

            /* Tmp=min(Timer285[i],Δt-Tmpdelay[i])∙TmpF285+tsv285I[i] */
            tmpFlt2 = tmpFlt * tmpF285 + sThruWorkStatus.tsv285I[iThru];

            /* tsv285[i]=max(min(Tmpdelay[i]+Timer285[i]-Δt,Tmpdelay[i]),0) */
            tmpFlt = tmpdelay[iThru] + sThruWorkStatus.timer285[iThru] - T_128MS;
            tmpFlt = Minx(tmpFlt, tmpdelay[iThru]);
            sThruWorkStatus.tsv285[iThru] = Maxx(tmpFlt, 0.0);

            /* tsv285I[i]=tsv285[i]∙TmpF285 */
            sThruWorkStatus.tsv285I[iThru] = sThruWorkStatus.tsv285[iThru] * tmpF285;

            /* TmpI */
            VectorScalar3(&tmpI[0], &sThruInsTimerParam[iThru].Vec[0], tmpFlt2);

            /* I285[i] */
            VectorEval3(&sThruCtrl.I285[iThru][0], &tmpI[0]);
        }
        /* ② 40N推力器 */
        else
        {
            indx40N = iThru - THRU_285N_GROUP_NUM;

            /* 若ZT9(D0)==1且BZ1==2且序号i-6的40N关调制 */
            /* ZT9(D0)=1，垂直上升关调制 */
            if ((UI32_BIT_GET1(sGncCtrlFlag.ZT9, 0u) == 1) &&
                (sGncCtrlFlag.BZ1 == WORK_MODE_VERTRISE) &&
                (sThruWorkStatus.bModulOn40[indx40N] == FALSE32))
            {
                tmpFlt = sThruWorkStatus.timer40[indx40N] - tmpdelay[iThru];
                tmpFlt = Minx(tmpFlt, tmpFltDt);
                tmpFlt = Maxx(tmpFlt, 0.0);
                sThruCtrl.oldT40[indx40N] = tmpFlt + sThruWorkStatus.tsv40[indx40N];
                sThruWorkStatus.tsv40[indx40N] = Minx(sThruWorkStatus.timer40[indx40N], tmpdelay[iThru]);
            }
            else
            {
                tmpFlt = Minx(sThruWorkStatus.timer40[indx40N], tmpFltDt);
                sThruCtrl.oldT40[indx40N] = tmpFlt + sThruWorkStatus.tsv40[indx40N];

                tmpFlt = tmpdelay[iThru] + sThruWorkStatus.timer40[indx40N] - T_128MS;
                tmpFlt = Minx(tmpFlt, tmpdelay[iThru]);
                sThruWorkStatus.tsv40[indx40N] = Maxx(tmpFlt, 0.0);
            }

            tmpFlt = sThruCtrl.oldT40[indx40N] * sThruParam.F40;
            VectorScalar3(&tmpI[0], &sThruInsTimerParam[iThru].Vec[0], tmpFlt);
        }

        /* ③ 用于4.8.3节285N故障诊断 */
        VectorAdd3(&sBodyData.Itotal[0], &sBodyData.Itotal[0], &tmpI[0]);

        /* ④ 用于4.8.3节285N故障诊断 */
        VectorSub3(&tmpPos[0], &sThruInsTimerParam[iThru].Pos[0], &sBodyData.pgoF[0]);
        VectorSub3(&tmpPos[0], &tmpPos[0], &tmpdP[0]);
        VectorCross3(&tmpVec[0], &tmpPos[0], &tmpI[0]);
        MatrixMulti331(&tmpVec[0], &sAttiModifyParam.cBF[0][0], &tmpVec[0]);
        VectorAdd3(&sBodyData.Htotal[0], &sBodyData.Htotal[0], &tmpVec[0]);

        /* ⑤ 用于4.3.5质心实时估计 */
        VectorSub3(&tmpVec[0], &sThruInsTimerParam[iThru].Pos[0], &sBodyData.pgoF[0]);
        VectorCross3(&tmpVec[0], &tmpVec[0], &tmpI[0]);
        MatrixMulti331(&tmpVec[0], &sAttiModifyParam.cBF[0][0], &tmpVec[0]);
        VectorAdd3(&sBodyData.HtotalP[0], &sBodyData.HtotalP[0], &tmpVec[0]);
    }

    return;
}

void MrvsDataProc(void)
{
    siint32 iMrvs;
    boolu32 bCosnt;
    boolu32 bTmpVldFlg;
    boolu32 bCommValidTemp[4];
    float64 TmpRmout;
    float64 TmpVmout;
    float64 tmpFabs;
    float64 tmpNorm;

    /* (0)预置标志 */
    for (iMrvs=0; iMrvs<DEV_NUM_MRVS; iMrvs++)
    {
    #ifdef __GCC_COMPILED__
        bCommValidTemp[iMrvs] = sMrvsComm[iMrvs].bCommValid;
    #else
        /* 快仿环境此量bCommValid不能判断 */
        bCommValidTemp[iMrvs] = TRUE32;
    #endif
    }

    /* (1)测距数据常值检验和剔野 */
    for (iMrvs=0; iMrvs<DEV_NUM_MRVS; iMrvs++)
    {
        /* ① */

        /* 数据有效性确定 */
        if ((bCommValidTemp[iMrvs] == TRUE32) && (sMrvsData.bRVldFlg[iMrvs] == TRUE32))
        {
            bTmpVldFlg = TRUE32;
        }
        else
        {
            bTmpVldFlg = FALSE32;
        }

        /* 置可用标志 */
        sMrvsData.bRUseFlg[iMrvs] = bTmpVldFlg;

        /* ② ZT8(D6)=1 */
        if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 6) == 1)
        {
            bCosnt = ConstDiagSignInt(&sMrvsData.RCnstNum[iMrvs], &sMrvsData.RmF[iMrvs], &sMrvsData.OldRmF[iMrvs], 1, sMrvsProcParam.RCnstNumMax);

            if ((bCosnt == TRUE32) && (bTmpVldFlg == TRUE32))
            {
                sMrvsData.bRUseFlg[iMrvs] = FALSE32;
            }
        }

        /* ③ ZT8(D7)=1 */
        if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 7) == 1)
        {
            tmpFabs = Fabsx(sMrvsData.Rm[iMrvs] - sMrvsData.OldRm[iMrvs]);
            TmpRmout = sMrvsProcParam.Rmout1 + sMrvsProcParam.Rmout2 * Fabsx(sMrvsData.Rm[iMrvs]);

            if ((bTmpVldFlg == TRUE32) && (UI32_BIT_GET1(sGncCtrlFlag.OldBZ7, iMrvs) == 1) && (tmpFabs > TmpRmout))
            {
                if (sMrvsData.RmOutNum[iMrvs] < sMrvsProcParam.RmOutNumMax)
                {
                    /* 使用上一拍记录数据 */
                    sMrvsData.Rm[iMrvs] = sMrvsData.OldRm[iMrvs];

                    /* 计数累加 */
                    sMrvsData.RmOutNum[iMrvs]++;
                }
                else
                {
                    /* 计数清零 */
                    sMrvsData.RmOutNum[iMrvs] = 0;
                }
            }
            else
            {
                /* 计数清零 */
                sMrvsData.RmOutNum[iMrvs] = 0;
            }
        }

        /* ④ 系统误差处理 */
        sMrvsData.Rm[iMrvs] = sMrvsData.Rm[iMrvs] - sMrvsProcParam.Rm0[iMrvs];
    }

    /* (2)测速数据常值检验和剔野 */
    /* ① */
    tmpNorm = VectorNorm3(&sNaviData.vmbi[0]);
    TmpVmout = sMrvsProcParam.Vmout1 + sMrvsProcParam.Vmout2 * tmpNorm;

    for (iMrvs=0; iMrvs<DEV_NUM_MRVS; iMrvs++)
    {
        /* 数据有效性确定 */
        if ((bCommValidTemp[iMrvs] == TRUE32) && (sMrvsData.bVVldFlg[iMrvs] == TRUE32))
        {
            bTmpVldFlg = TRUE32;
        }
        else
        {
            bTmpVldFlg = FALSE32;
        }

        /* 置可用标志 */
        sMrvsData.bVUseFlg[iMrvs] = bTmpVldFlg;

        /* ② ZT8(D8)=1 */
        if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 8) == 1)
        {
            bCosnt = ConstDiagSignInt(&sMrvsData.VCnstNum[iMrvs], &sMrvsData.VmF[iMrvs], &sMrvsData.OldVmF[iMrvs], 1, sMrvsProcParam.VCnstNumMax);

            if ((bCosnt == TRUE32) && (bTmpVldFlg == TRUE32))
            {
                sMrvsData.bVUseFlg[iMrvs] = FALSE32;
            }
        }

        /* ③ ZT8(D9)=1 */
        if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 9) == 1)
        {
            tmpFabs = Fabsx(sMrvsData.Vm[iMrvs] - sMrvsData.OldVm[iMrvs]);
            if ((bTmpVldFlg == TRUE32) && (UI32_BIT_GET1(sGncCtrlFlag.OldBZ7, (iMrvs+4)) == 1) && (tmpFabs > TmpVmout))
            {
                if (sMrvsData.VmOutNum[iMrvs] < sMrvsProcParam.VmOutNumMax)
                {
                    /* 使用上一拍记录数据 */
                    sMrvsData.Vm[iMrvs] = sMrvsData.OldVm[iMrvs];

                    /* 计数累加 */
                    sMrvsData.VmOutNum[iMrvs]++;
                }
                else
                {
                    /* 计数清零 */
                    sMrvsData.VmOutNum[iMrvs] = 0;
                }
            }
            else
            {
                /* 计数清零 */
                sMrvsData.VmOutNum[iMrvs] = 0;
            }
        }

        /* ④ Vm1=Vmd[0]，Vm2=Vmd[1]，Vm3=Vmd[2]，Vm4=Vmd[3] 软件不用做赋值 */
    }

    return;
}

void GyroDataProc16(void)
{
    unint32 iGyro;
    unint32 tmpBit;
    unint32 tmpZT2;
    unint32 cntBit;
    unint32 cntGyro;
    unint32 tmpOutFlg;
    unint32 tmpCnstFlg;
    unint32 gyroNum[3];     /* 参与定姿的三个陀螺编号i,j,k */
    boolu32 bConst;
    float64 tmpFltdGCycle;
    float64 tmpFltAbs;
    float64 tmpFltTime;
    float64 tmpVG[3][3];
    float64 tmpMat43[4][3];
    float64 tmpVec[3];
    float64 tmpVec4[4];
    float64 PHI[3];

    /* (1)陀螺安装矢量补偿计算 */
    GyroVGComplement();

    /* (2)陀螺剔野及饱和处理 */

    /* ① TmpZT2=ZT2，UseZT2=ZT2 */
    tmpZT2 = sGncCtrlFlag.ZT2;
    sGncCtrlFlag.UseZT2 = sGncCtrlFlag.ZT2;

    /* ② 更新UseZT2 */
    cntBit = 0;
    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* 获取及回写陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
        tmpBit = tmpBit * sImuSoloRaw.headVldFlg16[iGyro];
        UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

        /* 统计可用陀螺个数 */
        cntBit = cntBit + tmpBit;
    }

    /* ③ 若UseZT2有效个数≥3 */
    if (cntBit >= 3)
    {
        sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
    }

    /* ④ ZT8(D0)=1，陀螺数据剔野及饱和处理 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 0u) == 1)
    {
        cntBit = 0;
        for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
        {
            tmpOutFlg = 1;

            /* 剔野操作 */
            {
                /* 计算前后两次采样的角速度增量, 单位rad/s */
                tmpFltdGCycle = Fabsx(sImuSoloRaw.gyro[iGyro] - sGyroData.dgLastCycle16ms[iGyro]) / T_16MS;

                if ((sImuSoloRaw.headVldFlg16[iGyro] == 1) &&
                    (sImuSoloRaw.headVldFlg16Old[iGyro] == 1) &&
                    (tmpFltdGCycle > sImuParam.wOutGyroM))
                {
                    if (sGyroData.cntGyroOut[iGyro] < sImuParam.lmtNumOutGyro)
                    {
                        /* 认为为剔野, 当拍数据被旧值覆盖 */
                        sImuSoloRaw.gyro[iGyro] = sGyroData.dgLastCycle16ms[iGyro];

                        /* 剔野计数累加 */
                        sGyroData.cntGyroOut[iGyro]++;
                    }
                    else
                    {
                        /* 剔野计数清零 */
                        sGyroData.cntGyroOut[iGyro] = 0;
                    }
                }
                else
                {
                    /* 剔野计数清零 */
                    sGyroData.cntGyroOut[iGyro] = 0;
                }
            }

            /* 饱和操作 */
            {
                tmpFltAbs = Fabsx(sImuSoloRaw.gyro[iGyro]);
                if (tmpFltAbs > sImuParam.dgMaxGyro)
                {
                    /* 当拍数据饱和则取限幅值 */
                    sImuSoloRaw.gyro[iGyro] = LimitDouble(sImuSoloRaw.gyro[iGyro], sImuParam.dgMaxGyro);

                    /* 该陀螺数据不可用 */
                    tmpOutFlg = 0;
                }
            }

            /* 获取及回写陀螺指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
            tmpBit = tmpBit * tmpOutFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

            /* 统计可用陀螺个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT2有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
        }
    }

    /* (3)陀螺常值 */

    /* （LCWINPUT.WalkStatus == 55H 或 LCWINPUT.WalkStatus == AAH）且BZ1≠10且ZT8(D1)==1 */
    /* ZT8(D1)=1，陀螺数据常值判断和处理 */

    if ((IN_RANGE_SET2(sWalkRecData.WalkStatus, 0x55, 0xAA)) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_STATIC) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 1u) == 1))
    {
        cntBit = 0;
        for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
        {
            /* 常值判断公共函数 */
            bConst = ConstDiagSignInt(&sGyroData.cntConst[iGyro], &sImuSoloRaw.gyroPulse[iGyro],
                                      &sGyroData.gyroPulseOld16ms[iGyro], 1, sImuParam.lmtNumConstGyroM);

            /* 常值判定 */
            if (bConst == TRUE32)
            {
                tmpCnstFlg = 0;
            }
            else
            {
                tmpCnstFlg = 1;
            }

            /* 获取及回写陀螺指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);
            tmpBit = tmpBit * tmpCnstFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT2, iGyro, tmpBit);

            /* 统计可用陀螺个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT2有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT2 = sGncCtrlFlag.UseZT2;
        }
    }

    /* (4)选择参与定姿的陀螺 */
    tmpFltTime = T_16MS / 3600.0;

    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* ① */
        sGyroData.dg[iGyro] = sImuSoloRaw.gyro[iGyro];

        /* ② */
        sGyroData.dgg[iGyro] = sGyroData.dg[iGyro] - sImuParam.constDriftEstiGyro[iGyro] * tmpFltTime;

        /* ③ */
        sGyroData.dg[iGyro] = sGyroData.dg[iGyro] - sImuParam.constDriftGyro[iGyro] * tmpFltTime;
    }

    /* ④ 调用4.8.1（陀螺故障检测及选择） */
    ImuDiagSelect(TRUE32);

    /* ⑤ 恢复ZT2 */
    sGncCtrlFlag.ZT2 = tmpZT2;

    /* ⑥ GyrInvNum更新 */
    cntBit = 0;
    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* 获取陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iGyro);

        /* 统计可用陀螺个数 */
        cntBit = cntBit + tmpBit;
    }

    /* 若UseZT2有效个数<3，则GyrInvNum = GyrInvNum+1 */
    if (cntBit < 3)
    {
        sGncCtrlFlag.GyrInvNum++;
    }
    /* 若UseZT2有效个数≥3，则GyrInvNum=0 */
    else
    {
        sGncCtrlFlag.GyrInvNum = 0;
    }

    /* (5)计算三轴角度增量Δgtm */

    /* ① Δgt0=Δgt */
    sGyroData.dgt0[0] = sGyroData.dgt16ms[0];
    sGyroData.dgt0[1] = sGyroData.dgt16ms[1];
    sGyroData.dgt0[2] = sGyroData.dgt16ms[2];

    /* ② 由BZ2确定的陀螺（编号i、j、k） */
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
    MatrixInv33(&tmpVG[0][0], &tmpVG[0][0]);

    /* 计算Δgtm */
    tmpFltTime = T_16MS / 3600.0;

    tmpVec[0] = sImuSoloRaw.gyro[gyroNum[0]] - sImuParam.constDriftGyro[gyroNum[0]] * tmpFltTime;
    tmpVec[1] = sImuSoloRaw.gyro[gyroNum[1]] - sImuParam.constDriftGyro[gyroNum[1]] * tmpFltTime;
    tmpVec[2] = sImuSoloRaw.gyro[gyroNum[2]] - sImuParam.constDriftGyro[gyroNum[2]] * tmpFltTime;

    /* 矩阵乘向量 */
    MatrixMulti331(&sGyroData.dgt16ms[0], &tmpVG[0][0], &tmpVec[0]);

    /* (6)三轴绝对角速度 */

    /* ① */
    sGyroData.w[0] = sGyroData.dgt16ms[0] / T_16MS;
    sGyroData.w[1] = sGyroData.dgt16ms[1] / T_16MS;
    sGyroData.w[2] = sGyroData.dgt16ms[2] / T_16MS;

    /* ② */
    /* [Δggi Δggj Δggk]T */
    tmpVec[0] = sGyroData.dgg[gyroNum[0]];
    tmpVec[1] = sGyroData.dgg[gyroNum[1]];
    tmpVec[2] = sGyroData.dgg[gyroNum[2]];

    /* 矩阵乘向量 */
    MatrixMulti331(&sGyroData.dggt[0], &tmpVG[0][0], &tmpVec[0]);

    /* ③ */
    sGyroData.wg[0] = sGyroData.dggt[0] / T_16MS;
    sGyroData.wg[1] = sGyroData.dggt[1] / T_16MS;
    sGyroData.wg[2] = sGyroData.dggt[2] / T_16MS;

    /* (7)四元数预估 */
    /* ① */
    VectorEval3(&PHI[0], &sGyroData.dgt16ms[0]);

    /* ② 内部已归一化 */
    QInteg(&sAttiData.q.q4[0], &sAttiData.q.q4[0], &PHI[0]);

    /* ③ */
    Q2C(&sAttiData.cbi[0][0], &sAttiData.q.q4[0]);
    MatrixTran33(&sAttiData.cib[0][0], &sAttiData.cbi[0][0]);

    /* ④ */
    Q2Ksi(&tmpMat43[0][0], &sAttiData.qg.q4[0]);
    MatrixMulti(&tmpVec4[0], &tmpMat43[0][0], &sGyroData.dggt[0], 4, 3, 1);
    VectorAddCoef(&sAttiData.qg.q4[0], &sAttiData.qg.q4[0], &tmpVec4[0], 0.5, 4);
    QUnit(&sAttiData.qg.q4[0]);

    /* (8)保存历史姿态数据 */

    /* 更新游标 */
    sAttiHistoryData.indexInsCycle++;
    if (sAttiHistoryData.indexInsCycle == IMU_OCTO_NUM)
    {
        sAttiHistoryData.indexInsCycle = 0;
        sAttiHistoryData.indexIns = (sAttiHistoryData.indexIns + 1) % ATT_HISTORY_BUFF_NUM;
    }

    /* 四元数保存 */
    sAttiHistoryData.qIns[sAttiHistoryData.indexIns][sAttiHistoryData.indexInsCycle] = sAttiData.q;

    return;
}

void AcceDataProc16(void)
{
    unint32 iAcce;
    unint32 tmpBit;
    unint32 tmpZT3;
    unint32 cntBit;
    unint32 cntAcce;
    unint32 tmpOutFlg;
    unint32 tmpCnstFlg;
    unint32 acceNum[3];     /* 参与导航的三个加计编号i,j,k */
    boolu32 bConst;
    float64 tmpFltdVCycle;
    float64 tmpFltAbs;
    float64 tmpVA[3][3];
    float64 tmpP1[3];
    float64 tmpP2[3];
    float64 tmpdw[3];
    float64 tmpVec[3];
    float64 tmpVec3Sec[3];
    float64 tmpdV1[3];
    float64 tmpdV2[3];
    float64 tmpvr[IMU_HEAD_NUM];

    /* (1)安装矢量补偿计算 */
    AcceVAComplement();

    /* (2)加计剔野及饱和处理 */

    /* ① TmpZT3=ZT3，UseZT3=ZT3 */
    tmpZT3 = sGncCtrlFlag.ZT3;
    sGncCtrlFlag.UseZT3 = sGncCtrlFlag.ZT3;

    /* ② 更新UseZT3 */
    cntBit = 0;
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        /* 获取及回写加计指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
        tmpBit = tmpBit * sImuSoloRaw.headVldFlg16[iAcce];
        UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

        /* 统计可用加计个数 */
        cntBit = cntBit + tmpBit;
    }

    /* ③ 若UseZT3有效个数≥3 */
    if (cntBit >= 3)
    {
        sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
    }

    /* ④ ZT8(D2)=1，加计数据剔野及饱和处理 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 2u) == 1)
    {
        cntBit = 0;
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            tmpOutFlg = 1;

            /* 剔野操作 */
            {
                /* 计算前后两个子样的速度增量, 单位m/s2 */
                tmpFltdVCycle = Fabsx(sImuSoloRaw.acce[iAcce] - sAcceData.dvLastCycle16ms[iAcce]) / T_16MS;

                if ((sImuSoloRaw.headVldFlg16[iAcce] == 1) &&
                    (sImuSoloRaw.headVldFlg16Old[iAcce] == 1) &&
                    (tmpFltdVCycle > sImuParam.aOutAcceM))
                {
                    if (sAcceData.cntAcceOut[iAcce] < sImuParam.lmtNumOutAcce)
                    {
                        /* 认为为剔野, 当拍数据被旧值覆盖 */
                        sImuSoloRaw.acce[iAcce] = sAcceData.dvLastCycle16ms[iAcce];

                        /* 剔野计数累加 */
                        sAcceData.cntAcceOut[iAcce]++;
                    }
                    else
                    {
                        /* 剔野计数清零 */
                        sAcceData.cntAcceOut[iAcce] = 0;
                    }
                }
                else
                {
                    /* 剔野计数清零 */
                    sAcceData.cntAcceOut[iAcce] = 0;
                }
            }

            /* 饱和操作 */
            {
                tmpFltAbs = Fabsx(sImuSoloRaw.acce[iAcce]);
                if (tmpFltAbs > sImuParam.dvMaxAcce)
                {
                    /* 当拍数据饱和则取限幅值 */
                    sImuSoloRaw.acce[iAcce] = LimitDouble(sImuSoloRaw.acce[iAcce], sImuParam.dvMaxAcce);

                    /* 该加计数据不可用 */
                    tmpOutFlg = 0;
                }
            }

            /* 获取及回写加计指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
            tmpBit = tmpBit * tmpOutFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

            /* 统计可用加计个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT3有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
        }
    }

    /* (3)加计常值 */

    /* （LCWINPUT.WalkStatus == 55H 或 LCWINPUT.WalkStatus == AAH）且BZ1≠10且ZT8(D3)==1 */
    /* ZT8(D3)=1，加计数据常值判断和处理 */

    if ((IN_RANGE_SET2(sWalkRecData.WalkStatus, 0x55, 0xAA)) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_STATIC) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT8, 3u) == 1))
    {
        cntBit = 0;
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            /* 常值判断公共函数 */
            bConst = ConstDiagSignInt(&sAcceData.cntConst[iAcce], &sImuSoloRaw.accePulse[iAcce],
                                      &sAcceData.accePulseOld16ms[iAcce], 1, sImuParam.lmtNumConstAcceM);

            /* 常值判定 */
            if (bConst == TRUE32)
            {
                tmpCnstFlg = 0;
            }
            else
            {
                tmpCnstFlg = 1;
            }

            /* 获取及回写加计指定位 */
            tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);
            tmpBit = tmpBit * tmpCnstFlg;
            UI32_BIT_SET1(sGncCtrlFlag.UseZT3, iAcce, tmpBit);

            /* 统计可用加计个数 */
            cntBit = cntBit + tmpBit;
        }

        /* 若UseZT3有效个数≥3 */
        if (cntBit >= 3)
        {
            sGncCtrlFlag.ZT3 = sGncCtrlFlag.UseZT3;
        }
    }

    /* (4)杆臂效应补偿 */
    /* ① ② */
    VectorSub3(&tmpP1[0], &sImuParam.pacc1[0], &sBodyData.pgoF[0]);
    VectorSub3(&tmpP2[0], &sImuParam.pacc2[0], &sBodyData.pgoF[0]);
    MatrixMulti331(&tmpP1[0], &sAttiModifyParam.cBF[0][0], &tmpP1[0]);
    MatrixMulti331(&tmpP2[0], &sAttiModifyParam.cBF[0][0], &tmpP2[0]);

    /* ③ 计算dω */
    VectorSub3(&tmpdw[0], &sGyroData.dgt16ms[0], &sGyroData.dgt0[0]);
    VectorScalar3(&tmpdw[0], &tmpdw[0], 1.0/T_16MS);

    /* ④ 计算TmpΔv1 */
    VectorCross3(&tmpVec[0], &sGyroData.dgt16ms[0], &tmpP1[0]);
    VectorCross3(&tmpVec[0], &sGyroData.dgt16ms[0], &tmpVec[0]);
    VectorScalar3(&tmpVec[0], &tmpVec[0], 1.0/T_16MS);
    VectorCross3(&tmpVec3Sec[0], &tmpdw[0], &tmpP1[0]);
    VectorAdd3(&tmpdV1[0], &tmpVec[0], &tmpVec3Sec[0]);

    /* 计算TmpΔv2 */
    VectorCross3(&tmpVec[0], &sGyroData.dgt16ms[0], &tmpP2[0]);
    VectorCross3(&tmpVec[0], &sGyroData.dgt16ms[0], &tmpVec[0]);
    VectorScalar3(&tmpVec[0], &tmpVec[0], 1.0/T_16MS);
    VectorCross3(&tmpVec3Sec[0], &tmpdw[0], &tmpP2[0]);
    VectorAdd3(&tmpdV2[0], &tmpVec[0], &tmpVec3Sec[0]);

    /* ⑤ 计算Δvrn(n) */
    tmpvr[0] = VectorDot3(&sAcceData.vecVA[0][0], &tmpdV1[0]);
    tmpvr[2] = VectorDot3(&sAcceData.vecVA[2][0], &tmpdV1[0]);
    tmpvr[4] = VectorDot3(&sAcceData.vecVA[4][0], &tmpdV1[0]);
    tmpvr[1] = VectorDot3(&sAcceData.vecVA[1][0], &tmpdV2[0]);
    tmpvr[3] = VectorDot3(&sAcceData.vecVA[3][0], &tmpdV2[0]);
    tmpvr[5] = VectorDot3(&sAcceData.vecVA[5][0], &tmpdV2[0]);

    /* ⑥ 计算Δvn16 */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        sImuSoloRaw.acce[iAcce] = sImuSoloRaw.acce[iAcce] - tmpvr[iAcce];
    }

    /* (5)六个加计数据处理 */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        sAcceData.as[iAcce] = sImuSoloRaw.acce[iAcce] / T_16MS;
    }

    /* (6)选择参与导航的加计 */
    /* ①/② 六个加计零位处理 */
    if (sImuParam.flgZeroAcce == IMU_ACCE_ZERO_INJECT)
    {
        /* 使用地面注入asn0 */
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sAcceData.as0[iAcce] = sImuParam.zeroAcceAsn0Inj[iAcce];
        }
    }
    else if (sImuParam.flgZeroAcce == IMU_ACCE_ZERO_INITIAL)
    {
        /* 使用初始装订值 */
        for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
        {
            sAcceData.as0[iAcce] = sImuParam.zeroAcceAsn0Init[iAcce];
        }
    }
    else
    {
        /* 无操作 */
        NULL_STATEMENT();
    }

    /* ③ */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        sAcceData.as[iAcce] = sAcceData.as[iAcce] - sAcceData.as0[iAcce];
    }

    /* ④ 调用4.8.2（加计故障检测及选择） */
    ImuDiagSelect(FALSE32);

    /* ⑤ 恢复ZT3 */
    sGncCtrlFlag.ZT3 = tmpZT3;

    /* ⑥ AccInvNum更新 */
    cntBit = 0;
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        /* 获取陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iAcce);

        /* 统计可用陀螺个数 */
        cntBit = cntBit + tmpBit;
    }

    /* 若UseZT3有效个数<3，则AccInvNum = AccInvNum+1 */
    if (cntBit < 3)
    {
        sGncCtrlFlag.AccInvNum++;
    }
    /* 若UseZT3有效个数≥3，则AccInvNum=0 */
    else
    {
        sGncCtrlFlag.AccInvNum = 0;
    }

    /* (7)三轴加速度 */

    /* 由BZ3确定的加计（编号i、j、k） */
    acceNum[0] = 0;
    acceNum[1] = 0;
    acceNum[2] = 0;

    cntAcce = 0;
    iAcce = 0;
    while ((cntAcce < 3) && (iAcce < IMU_HEAD_NUM))
    {
        if (UI32_BIT_GET1(sGncCtrlFlag.BZ3, iAcce) == 1)
        {
            acceNum[cntAcce] = iAcce;
            cntAcce++;
        }

        iAcce++;
    }

    /* 增加断言判断 */
    ASSERT(cntAcce == 3);

    /* 三个行向量拼为一个3×3矩阵 */
    VectorEval3(&tmpVA[0][0], &sAcceData.vecVA[acceNum[0]][0]);
    VectorEval3(&tmpVA[1][0], &sAcceData.vecVA[acceNum[1]][0]);
    VectorEval3(&tmpVA[2][0], &sAcceData.vecVA[acceNum[2]][0]);

    /* 矩阵求逆 */
    MatrixInv33(&tmpVA[0][0], &tmpVA[0][0]);

    /* 计算计算对应子样本体三轴速度增量矢量Δv_Bm */
    tmpVec[0] = sImuSoloRaw.acce[acceNum[0]] - sAcceData.as0[acceNum[0]] * T_16MS;
    tmpVec[1] = sImuSoloRaw.acce[acceNum[1]] - sAcceData.as0[acceNum[1]] * T_16MS;
    tmpVec[2] = sImuSoloRaw.acce[acceNum[2]] - sAcceData.as0[acceNum[2]] * T_16MS;

    /* 矩阵乘向量 */
    MatrixMulti331(&sAcceData.dvBm16ms[0], &tmpVA[0][0], &tmpVec[0]);

    /* 计算本体三轴加速度矢量a_B */
    sAcceData.aB[0] = sAcceData.dvBm16ms[0] / T_16MS;
    sAcceData.aB[1] = sAcceData.dvBm16ms[1] / T_16MS;
    sAcceData.aB[2] = sAcceData.dvBm16ms[2] / T_16MS;

    return;
}

void CMICalculate(void)
{
    float64 tmpa;
    float64 tmpq[4];
    float64 tmpqr[4];

    /* 导航重置标志 */
    /* 双机冷模式时才通过导航重置标志重置tME, 更改防止三机热时错误 */
    if (sNaviFlag.WalkReNaviFlg == 1)
    {
        sNaviParam.tME = sTime.sstime;

        sNaviFlag.WalkReNaviFlg = 0;
    }

    tmpa = sNaviParam.wM * (sTime.sstime - sNaviParam.tME) / 2.0;
    tmpqr[0] = 0.0;
    tmpqr[1] = 0.0;
    tmpqr[2] = Sinx(tmpa);
    tmpqr[3] = Cosx(tmpa);

    QMulti(&tmpq[0], &sNaviParam.qME[0], &tmpqr[0]);
    Q2C(&sNaviData.cmi[0][0], &tmpq[0]);
    MatrixTran33(&sNaviData.cim[0][0], &sNaviData.cmi[0][0]);
    MatrixEval(&sNaviData.wmi[0], &sNaviData.cmi[2][0], 1, 3);

    return;
}

void SavaLastCycleData(void)
{
    unint32 iHead;
    unint32 iGyro;
    unint32 iAcce;
    unint32 iMrvs;
    unint32 iCycle;

    /* 陀螺 */
    for (iGyro=0; iGyro<IMU_HEAD_NUM; iGyro++)
    {
        /* 四子样: 使用第8个子样数据更新上一个子样测量数据 */
        sGyroData.dgLastCycle[iGyro] = sImuQuadRaw.gyro[7][iGyro];

        /* 四子样: 使用当前控制周期8个子样数据源码更新上一控制周期8个子样测量数据源码 */
        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            sGyroData.gyroPulseOld[iCycle][iGyro] = sImuQuadRaw.gyroPulse[iCycle][iGyro];
        }

        /* 单子样: 使用当拍数据更新上一拍测量数据 */
        sGyroData.dgLastCycle16ms[iGyro] = sImuSoloRaw.gyro[iGyro];

        /* 单子样: 使用当拍数据源码更新上一拍测量数据源码 */
        sGyroData.gyroPulseOld16ms[iGyro] = sImuSoloRaw.gyroPulse[iGyro];
    }

    /* 加计 */
    for (iAcce=0; iAcce<IMU_HEAD_NUM; iAcce++)
    {
        /* 四子样: 使用第8个子样数据更新上一个子样测量数据 */
        sAcceData.dvLastCycle[iAcce] = sImuQuadRaw.acce[7][iAcce];

        /* 四子样: 使用当前控制周期8个子样数据源码更新上一控制周期8个子样测量数据源码 */
        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            sAcceData.accePulseOld[iCycle][iAcce] = sImuQuadRaw.accePulse[iCycle][iAcce];
        }

        /* 单子样: 更新上一个子样测量数据 */
        sAcceData.dvLastCycle16ms[iAcce] = sImuSoloRaw.acce[iAcce];

        /* 单子样: 使用当拍数据更新上一拍测量数据 */
        sAcceData.accePulseOld16ms[iAcce] = sImuSoloRaw.accePulse[iAcce];
    }

    /* 陀螺/加计, 缓存数据有效标志 */
    for (iHead=0; iHead<IMU_HEAD_NUM; iHead++)
    {
        /* 四子样 */
        for (iCycle=0; iCycle<IMU_OCTO_NUM; iCycle++)
        {
            sImuQuadRaw.headVldFlgOld[iCycle][iHead] = sImuQuadRaw.headVldFlg[iCycle][iHead];
        }

        /* 单子样 */
        sImuSoloRaw.headVldFlg16Old[iHead] = sImuSoloRaw.headVldFlg16[iHead];
    }

    /* 星敏：更新上一控制周期四元数源码 */
    VectorEval4Int(&sStsData[0].attQuatOld[0], &sStsRaw[0].attQuat[0]);
    VectorEval4Int(&sStsData[1].attQuatOld[0], &sStsRaw[1].attQuat[0]);
    VectorEval4Int(&sStsData[2].attQuatOld[0], &sStsRaw[2].attQuat[0]);
    VectorEval4Int(&sStsData[3].attQuatOld[0], &sStsRaw[3].attQuat[0]);
    VectorEval4Int(&sStsData[4].attQuatOld[0], &sStsRaw[4].attQuat[0]);

    /* 微波数据 */
    for (iMrvs=0; iMrvs<DEV_NUM_MRVS; iMrvs++)
    {
        /* 更新上一拍测量数据 */
        sMrvsData.OldRm[iMrvs] = sMrvsData.Rm[iMrvs];
        sMrvsData.OldVm[iMrvs] = sMrvsData.Vm[iMrvs];

        /* 更新上一拍测量数据源码 */
        sMrvsData.OldRmF[iMrvs] = sMrvsData.RmF[iMrvs];
        sMrvsData.OldVmF[iMrvs] = sMrvsData.VmF[iMrvs];
    }

    /* OldBZ7 = BZ7 */
    sGncCtrlFlag.OldBZ7 = sGncCtrlFlag.BZ7;

    return;
}

void RelaySatOrbitCalc(void)
{
    unint32 i;                  /*  */
    unint32 TmpFlg;             /*  */
    unint32 TmpFlg0;            /*  */
    boolu32 bDataValidJudge;    /*  */
    boolu32 bCondOk;            /*  */
    float64 deltaT;             /*  */
    float64 deltaT0;            /*  */
    float64 tmpFloat;           /*  */
    float64 tmpM;               /*  */
    float64 tmpR[3];            /*  */
    float64 tmpVec3[3];         /*  */
    float64 tmpRMF[3];          /*  */
    float64 tmpMat33T[3][3];    /*  */
    float64 tmpMat33[3][3];     /*  */

    float64 TmpTao;             /*  */
    float64 cosLat;             /*  */
    float64 sinLat;             /*  */
    float64 cosLon;             /*  */
    float64 sinLon;             /*  */
    float64 cosLc;             /*  */
    float64 sinLc;             /*  */
    float64 cosLmd;             /*  */
    float64 sinLmd;             /*  */

    /* ZT9(D7)=1，判断注入中继轨道数据有效性 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 7u) == 1)
    {
        bDataValidJudge = TRUE32;
    }
    else
    {
        bDataValidJudge = FALSE32;
    }

    /* （0）TmpFlg0=0 */
    TmpFlg0 = 0;

    /* （1）确定中继卫星轨道初值 */
    for (i=0; i<RELAY_SAT_ORBIT_NUM; i++)
    {
        /* ① */
        TmpFlg = 0;

        /* ② */
        /* ZT9(D7)=0，不判断注入中继轨道数据有效性 */
        if (bDataValidJudge == FALSE32)
        {
            TmpFlg = 1;
        }

        /* ③ */
        deltaT0 = sTime.sstime - sOrbitCalc.relaySatData[i].t0;
        deltaT = deltaT0 + sOrbitCalc.dtOrb / 2.0;

        if ((bDataValidJudge == TRUE32) && IN_RANGE_LCUO(deltaT, 0.0, 2.0))
        {
            tmpFloat = sOrbitCalc.relaySatData[i].aP * sOrbitCalc.relaySatData[i].aP * sOrbitCalc.relaySatData[i].aP;
            tmpFloat = NZ(tmpFloat, FLT64_ZERO);
            tmpFloat = sNaviParam.Gm / tmpFloat;
            tmpFloat = Maxx(tmpFloat, 0.0);
            tmpFloat = Sqrtx(tmpFloat);
            tmpFloat = sOrbitCalc.relaySatData[i].MP + deltaT0 * tmpFloat;
            tmpM = ModPNHP(tmpFloat, PI);

            Orbit(&tmpR[0], sOrbitCalc.relaySatData[i].aP, sOrbitCalc.relaySatData[i].eP, sOrbitCalc.relaySatData[i].iP,
                            sOrbitCalc.relaySatData[i].OmgP, sOrbitCalc.relaySatData[i].wP, tmpM);

            Chebyshev(&tmpFloat, -1.0, &sOrbitCalc.relaySatData[i].RMPX[0], sOrbitCalc.nOrb);
            tmpR[0] = tmpR[0] + tmpFloat;
            Chebyshev(&tmpFloat, -1.0, &sOrbitCalc.relaySatData[i].RMPY[0], sOrbitCalc.nOrb);
            tmpR[1] = tmpR[1] + tmpFloat;
            Chebyshev(&tmpFloat, -1.0, &sOrbitCalc.relaySatData[i].RMPZ[0], sOrbitCalc.nOrb);
            tmpR[2] = tmpR[2] + tmpFloat;

            VectorSub3(&tmpVec3[0], &sOrbitCalc.RMR[0], &tmpR[0]);
            tmpFloat = VectorNorm3(&tmpVec3[0]);

            if (tmpFloat < sOrbitCalc.dRMax)
            {
                TmpFlg = 1;
            }
        }

        /* ④ */
        tmpFloat = Fabsx(deltaT0);
        if (tmpFloat < (sOrbitCalc.dtOrb / 2.0))
        {
            bCondOk = TRUE32;
        }
        else
        {
            bCondOk = FALSE32;
        }

        if ((IN_RANGE_LCUO(deltaT, 0.0, 2.0) && (TmpFlg == 1)) ||
            ((bDataValidJudge == FALSE32) && (bCondOk == TRUE32)))
        {
            TmpFlg0 = 1;

            sOrbitCalc.t0Q = sOrbitCalc.relaySatData[i].t0;
            sOrbitCalc.aMP = sOrbitCalc.relaySatData[i].aP;
            sOrbitCalc.eMP = sOrbitCalc.relaySatData[i].eP;
            sOrbitCalc.iMP = sOrbitCalc.relaySatData[i].iP;
            sOrbitCalc.OmgMP = sOrbitCalc.relaySatData[i].OmgP;
            sOrbitCalc.wMP = sOrbitCalc.relaySatData[i].wP;
            sOrbitCalc.MMP = sOrbitCalc.relaySatData[i].MP;
            VectorEval4(&sOrbitCalc.RMPXQ[0], &sOrbitCalc.relaySatData[i].RMPX[0]);
            VectorEval4(&sOrbitCalc.RMPYQ[0], &sOrbitCalc.relaySatData[i].RMPY[0]);
            VectorEval4(&sOrbitCalc.RMPZQ[0], &sOrbitCalc.relaySatData[i].RMPZ[0]);
        }

        /* ⑤ */
        sOrbitCalc.dt0Q = sTime.sstime - sOrbitCalc.t0Q + sOrbitCalc.dtOrb / 2.0;
    }

    /* （2）中继卫星轨道计算 */

    /* ① 二体轨道外推 */
    tmpFloat = sOrbitCalc.aMP * sOrbitCalc.aMP * sOrbitCalc.aMP;
    tmpFloat = NZ(tmpFloat, FLT64_ZERO);
    tmpFloat = sNaviParam.Gm / tmpFloat;
    tmpFloat = Maxx(tmpFloat, 0.0);
    tmpFloat = Sqrtx(tmpFloat);
    tmpFloat = sOrbitCalc.MMP + (sTime.sstime - sOrbitCalc.t0Q) * tmpFloat;
    tmpM = ModPNHP(tmpFloat, PI);

    Orbit(&sOrbitCalc.RMR[0], sOrbitCalc.aMP, sOrbitCalc.eMP, sOrbitCalc.iMP, sOrbitCalc.OmgMP, sOrbitCalc.wMP, tmpM);

    /* ② 切比雪夫拟合 */
    TmpTao = 2.0 * (sTime.sstime - sOrbitCalc.t0Q + sOrbitCalc.dtOrb / 2.0) / sOrbitCalc.dtOrb - 1.0;

    Chebyshev(&tmpR[0], TmpTao, &sOrbitCalc.RMPXQ[0], sOrbitCalc.nOrb);
    Chebyshev(&tmpR[1], TmpTao, &sOrbitCalc.RMPYQ[0], sOrbitCalc.nOrb);
    Chebyshev(&tmpR[2], TmpTao, &sOrbitCalc.RMPZQ[0], sOrbitCalc.nOrb);

    tmpFloat = Fabsx(sTime.sstime - sOrbitCalc.t0Q);
    if (tmpFloat > (sOrbitCalc.dtOrb / 2.0))
    {
        VectorZero3(&tmpR[0]);
    }

    /* ③ */
    VectorAdd3(&sOrbitCalc.RMR[0], &sOrbitCalc.RMR[0], &tmpR[0]);

    /* （3） */
    cosLc = Cosx(sNaviData.lcal);
    sinLc = Sinx(sNaviData.lcal);
    cosLmd = Cosx(sNaviData.lmdcal);
    sinLmd = Sinx(sNaviData.lmdcal);

    cosLat = Cosx(sNaviData.lat);
    sinLat = Sinx(sNaviData.lat);
    cosLon = Cosx(sNaviData.lon);
    sinLon = Sinx(sNaviData.lon);

    /* 飞跃模式 */
    if (sGncCtrlFlag.BZ1 < WORK_MODE_STATIC)
    {
        tmpR[0] = sNaviData.rM * cosLat * cosLon;
        tmpR[1] = sNaviData.rM * cosLat * sinLon;
        tmpR[2] = sNaviData.rM * sinLat;
    }
    /* 行走模式 */
    else
    {
        tmpR[0] = sNaviData.rM * cosLc * cosLmd;
        tmpR[1] = sNaviData.rM * cosLc * sinLmd;
        tmpR[2] = sNaviData.rM * sinLc;
    }

    MatrixMulti331(&tmpRMF[0], &sNaviData.cim[0][0], &tmpR[0]);

    /* （4） */
    VectorSub3(&sNaviData.RFR[0], &sOrbitCalc.RMR[0], &tmpRMF[0]);

    /* （5）RstarVec = DivNorm(CBFT·CBI·RFR) */
    MatrixTran33(&tmpMat33T[0][0], &sAttiModifyParam.cBF[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33T[0][0], &sAttiData.cbi[0][0]);
    MatrixMulti331(&sWalkPointToData.RstarVec[0], &tmpMat33[0][0], &sNaviData.RFR[0]);
    VectorUnit3(&sWalkPointToData.RstarVec[0]);

    /* （6）若TmpFlg0==0，则：RstarVec=[0 0 0]T */
    if (TmpFlg0 == 0)
    {
        VectorZero3(&sWalkPointToData.RstarVec[0]);
    }

    return;
}

void StsDataProc(void)
{
    polymor flgCalibrate;
    boolu32 bValidTemp[DEV_NUM_STS_ALL];      /* 包括着陆器三个星敏 */
    boolu32 bCommValidTemp[DEV_NUM_STS_ALL];  /* 包括着陆器三个星敏 */
    boolu32 bValidData[DEV_NUM_STS_ALL];      /* 对应用户需求数据有效标志STSAFlg/STSBFlg/Z_STSAFlg/Z_STSBFlg/Z_STSCFlg */
    unint32 iSts0;
    unint32 iSts;
    unint32 iStsOne;
    unint32 iStsTwo;
    unint32 ZT4Bit;
    unint32 tmpFlgZAB;
    unint32 tmpFlgXAB;
    unint32 tmpFlgZBC;
    unint32 tmpFlgXBC;
    unint32 tmpFlgZCA;
    unint32 tmpFlgXCA;
    unint32 TmpBZ1;
    float64 tmpVec[3];
    float64 tmpVec4[4];
    float64 tmpdq[4];
    float64 tmpMat[3][3];
    float64 tmpX[3];
    float64 tmpX2[3];
    float64 tmpY[3];
    float64 tmpZ[3];
    float64 tmpZ2[3];
    float64 tmpFlt;

    float64 sinUs;
    float64 cosUs;
    float64 sinIs;
    float64 cosIs;

    /* （2）飞跃动力过程判断 */

    /* ① 若2≤BZ1≤13且BZ1≠5且BZ1≠9且BZ1≠10 */
    if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_MOVEPLAN) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_GLIDE) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_NOCTRL) &&
        (sGncCtrlFlag.BZ1 != WORK_MODE_STATIC))
    {
        TmpBZ1 = 1;
    }
    /* ② 否则 */
    else
    {
        TmpBZ1 = 0;
    }

#ifdef __GCC_COMPILED__
    /* 星敏通讯有效性 */
    bCommValidTemp[0] = sStsComm[0].bCommValid;
    bCommValidTemp[1] = sStsComm[1].bCommValid;
    bCommValidTemp[2] = sZlqCcuStatus.bCommValid;
    bCommValidTemp[3] = sZlqCcuStatus.bCommValid;
    bCommValidTemp[4] = sZlqCcuStatus.bCommValid;
#else
    /* 快仿环境此量bCommValid不能判断 */
    bCommValidTemp[0] = TRUE32;
    bCommValidTemp[1] = TRUE32;
    bCommValidTemp[2] = TRUE32;
    bCommValidTemp[3] = TRUE32;
    bCommValidTemp[4] = TRUE32;
#endif

    /* 星敏数据有效性确定 */
    for (iSts=0; iSts<DEV_NUM_STS_ALL; iSts++)
    {
        /* 通讯正常且数据有效 */
        if ((bCommValidTemp[iSts] == TRUE32) &&
            (sStsRaw[iSts].bDataValid == TRUE32))
        {
            /* 置星敏数据有效 */
            bValidData[iSts] = TRUE32;
        }
        else
        {
            /* 置星敏数据无效 */
            bValidData[iSts] = FALSE32;
        }
    }

    /* (10)① ZT9(D10)=1，引入光行差补偿 (此段代码提前) */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 10) == 1)
    {
        sinUs = Sinx(sNaviData.us);
        cosUs = Cosx(sNaviData.us);
        sinIs = Sinx(sNaviData.is);
        cosIs = Cosx(sNaviData.is);
        tmpFlt = 29.8 / 299792.458;
        sStsDataCom.gamma[0] = tmpFlt * sinUs;
        sStsDataCom.gamma[1] =-tmpFlt * cosUs * cosIs;
        sStsDataCom.gamma[2] =-tmpFlt * cosUs * sinIs;
    }
    else
    {
        sStsDataCom.gamma[0] = 0.0;
        sStsDataCom.gamma[1] = 0.0;
        sStsDataCom.gamma[2] = 0.0;
    }

    /* 算法步骤(3)~(10) */

    /* 星敏A数据公共处理 */
    ZT4Bit = UI32_BIT_GET1(sGncCtrlFlag.ZT4, 0);
    StsDataProcSingle(&bValidTemp[0], &sStsData[0], &sStsRaw[0], bValidData[0], &sStsProcParam.CBS[0][0][0], &sStsProcParam.CBS[0][0][0], sThruCtrl.tNJSum, ZT4Bit, TmpBZ1);

    /* 星敏B数据公共处理 */
    ZT4Bit = UI32_BIT_GET1(sGncCtrlFlag.ZT4, 1);
    StsDataProcSingle(&bValidTemp[1], &sStsData[1], &sStsRaw[1], bValidData[1], &sStsProcParam.CBS[1][0][0], &sStsProcParam.CBSR[1][0][0], sThruCtrl.tNJSum, ZT4Bit, TmpBZ1);

    /* (11)着陆器星敏感器数据处理 Z_ZT4 */
    /* ① */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_WAIT) && (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 1u))
    {
        /* 着陆器星敏A数据公共处理 */
        ZT4Bit = UI32_BIT_GET1(sZlqCcuRecvData.ZZT4, 0);
        StsDataProcSingle(&bValidTemp[2], &sStsData[2], &sStsRaw[2], bValidData[2], &sStsProcParam.CBS[2][0][0], &sStsProcParam.CBSR[2][0][0], sZlqCcuRecvData.ZtNJSum, ZT4Bit, TmpBZ1);

        /* 着陆器星敏B数据公共处理 */
        ZT4Bit = UI32_BIT_GET1(sZlqCcuRecvData.ZZT4, 1);
        StsDataProcSingle(&bValidTemp[3], &sStsData[3], &sStsRaw[3], bValidData[3], &sStsProcParam.CBS[3][0][0], &sStsProcParam.CBSR[3][0][0], sZlqCcuRecvData.ZtNJSum, ZT4Bit, TmpBZ1);

        /* 着陆器星敏C数据公共处理 */
        ZT4Bit = UI32_BIT_GET1(sZlqCcuRecvData.ZZT4, 2);
        StsDataProcSingle(&bValidTemp[4], &sStsData[4], &sStsRaw[4], bValidData[4], &sStsProcParam.CBS[4][0][0], &sStsProcParam.CBSR[4][0][0], sZlqCcuRecvData.ZtNJSum, ZT4Bit, TmpBZ1);
    }
    /* ② */
    else
    {
        bValidTemp[2] = FALSE32;
        bValidTemp[3] = FALSE32;
        bValidTemp[4] = FALSE32;
    }

    /* (12)星敏夹角计算和判断 */

    /* 飞跃器的星敏A、星敏B */
    iStsOne = 0;
    iStsTwo = 1;

    /* ①TmpFlgZAB */
    /* 提取安装矩阵列向量ZAB、ZBB */
    MatrixExtractColumn(&tmpZ[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 2);
    MatrixExtractColumn(&tmpZ2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 2);
    tmpFlgZAB = StsZXAngleFlag(&sStsData[iStsOne].tmpZI[0], &sStsData[iStsTwo].tmpZI[0], &tmpZ[0], &tmpZ2[0]);

    /* ②TmpFlgXAB */
    /* 提取安装矩阵列向量XAB、XBB */
    MatrixExtractColumn(&tmpX[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 0);
    MatrixExtractColumn(&tmpX2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 0);
    tmpFlgXAB = StsZXAngleFlag(&sStsData[iStsOne].tmpXI[0], &sStsData[iStsTwo].tmpXI[0], &tmpX[0], &tmpX2[0]);

    /* ③ */
    if ((bValidTemp[iStsOne] == TRUE32) &&
        (bValidTemp[iStsTwo] == TRUE32) &&
        ((tmpFlgZAB == 1) || (tmpFlgXAB == 1)))
    {
        if (sStsData[iStsTwo].deltaZm < sStsData[iStsOne].deltaZm)
        {
            bValidTemp[iStsOne] = FALSE32;
        }

        if (sStsData[iStsOne].deltaZm < sStsData[iStsTwo].deltaZm)
        {
            bValidTemp[iStsTwo] = FALSE32;
        }
    }

    /* (13)着陆器星敏夹角计算和判断 */
    if ((sGncCtrlFlag.BZ1 == WORK_MODE_WAIT) && (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 13u) == 1u))
    {
        /* 着陆器的星敏A、星敏B */
        {
            iStsOne = 2;
            iStsTwo = 3;

            /* ①TmpFlgZAB */
            /* 提取安装矩阵列向量ZAB、ZBB */
            MatrixExtractColumn(&tmpZ[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 2);
            MatrixExtractColumn(&tmpZ2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 2);
            tmpFlgZAB = StsZXAngleFlag(&sStsData[iStsOne].tmpZI[0], &sStsData[iStsTwo].tmpZI[0], &tmpZ[0], &tmpZ2[0]);

            /* ②tmpFlgXAB */
            /* 提取安装矩阵列向量XAB、XBB */
            MatrixExtractColumn(&tmpX[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 0);
            MatrixExtractColumn(&tmpX2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 0);
            tmpFlgXAB = StsZXAngleFlag(&sStsData[iStsOne].tmpXI[0], &sStsData[iStsTwo].tmpXI[0], &tmpX[0], &tmpX2[0]);
        }

        /* 着陆器的星敏B、星敏C */
        {
            iStsOne = 3;
            iStsTwo = 4;

            /* ③TmpFlgZBC */
            /* 提取安装矩阵列向量ZBB、ZCB */
            MatrixExtractColumn(&tmpZ[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 2);
            MatrixExtractColumn(&tmpZ2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 2);
            tmpFlgZBC = StsZXAngleFlag(&sStsData[iStsOne].tmpZI[0], &sStsData[iStsTwo].tmpZI[0], &tmpZ[0], &tmpZ2[0]);

            /* ④tmpFlgXBC */
            /* 提取安装矩阵列向量XBB、XCB */
            MatrixExtractColumn(&tmpX[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 0);
            MatrixExtractColumn(&tmpX2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 0);
            tmpFlgXBC = StsZXAngleFlag(&sStsData[iStsOne].tmpXI[0], &sStsData[iStsTwo].tmpXI[0], &tmpX[0], &tmpX2[0]);
        }

        /* 着陆器的星敏C、星敏A */
        {
            iStsOne = 4;
            iStsTwo = 2;

            /* ⑤TmpFlgZCA */
            /* 提取安装矩阵列向量ZCB、ZAB */
            MatrixExtractColumn(&tmpZ[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 2);
            MatrixExtractColumn(&tmpZ2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 2);
            tmpFlgZCA = StsZXAngleFlag(&sStsData[iStsOne].tmpZI[0], &sStsData[iStsTwo].tmpZI[0], &tmpZ[0], &tmpZ2[0]);

            /* ⑥tmpFlgXCA */
            /* 提取安装矩阵列向量XCB、XAB */
            MatrixExtractColumn(&tmpX[0],  &sStsProcParam.CBS[iStsOne][0][0], 3, 3, 0);
            MatrixExtractColumn(&tmpX2[0], &sStsProcParam.CBS[iStsTwo][0][0], 3, 3, 0);
            tmpFlgXCA = StsZXAngleFlag(&sStsData[iStsOne].tmpXI[0], &sStsData[iStsTwo].tmpXI[0], &tmpX[0], &tmpX2[0]);
        }

        /* ⑦ TmpAZFlg==1且TmpBZFlg==1且TmpCZFlg==1 */
        if ((bValidTemp[2] == TRUE32) && (bValidTemp[3] == TRUE32) && (bValidTemp[4] == TRUE32))
        {
            if (((tmpFlgZAB == 1) || (tmpFlgXAB == 1) || (tmpFlgZCA == 1) || (tmpFlgXCA == 1)) && (tmpFlgZBC == 0) && (tmpFlgXBC == 0))
            {
                bValidTemp[2] = FALSE32;
            }

            if (((tmpFlgZAB == 1) || (tmpFlgXAB == 1) || (tmpFlgZBC == 1) || (tmpFlgXBC == 1)) && (tmpFlgZCA == 0) && (tmpFlgXCA == 0))
            {
                bValidTemp[3] = FALSE32;
            }

            if (((tmpFlgZBC == 1) || (tmpFlgXBC == 1) || (tmpFlgZCA == 1) || (tmpFlgXCA == 1)) && (tmpFlgZAB == 0) && (tmpFlgXAB == 0))
            {
                bValidTemp[4] = FALSE32;
            }

            if (((tmpFlgZAB == 1) || (tmpFlgXAB == 1)) && ((tmpFlgZBC == 1) || (tmpFlgXBC == 1)) && ((tmpFlgZCA == 1) || (tmpFlgXCA == 1)))
            {
                if ((sStsData[2].deltaZm < sStsData[3].deltaZm) &&
                    (sStsData[2].deltaZm < sStsData[4].deltaZm))
                {
                    bValidTemp[3] = FALSE32;
                    bValidTemp[4] = FALSE32;
                }

                if ((sStsData[3].deltaZm < sStsData[2].deltaZm) &&
                    (sStsData[3].deltaZm < sStsData[4].deltaZm))
                {
                    bValidTemp[2] = FALSE32;
                    bValidTemp[4] = FALSE32;
                }

                if ((sStsData[4].deltaZm < sStsData[2].deltaZm) &&
                    (sStsData[4].deltaZm < sStsData[3].deltaZm))
                {
                    bValidTemp[2] = FALSE32;
                    bValidTemp[3] = FALSE32;
                }
            }
        }

        /* ⑧ TmpAZFlg==1且TmpBZFlg==1且（TmpFlgZAB==1或TmpFlgXAB==1） */
        if ((bValidTemp[2] == TRUE32) && (bValidTemp[3] == TRUE32) &&
            ((tmpFlgZAB == 1) || (tmpFlgXAB == 1)))
        {
            if (sStsData[3].deltaZm < sStsData[2].deltaZm)
            {
                bValidTemp[2] = FALSE32;
            }

            if (sStsData[2].deltaZm < sStsData[3].deltaZm)
            {
                bValidTemp[3] = FALSE32;
            }
        }

        /* ⑨ TmpBZFlg==1且TmpCZFlg==1且（TmpFlgZBC==1或TmpFlgXBC==1） */
        if ((bValidTemp[3] == TRUE32) && (bValidTemp[4] == TRUE32) &&
            ((tmpFlgZBC == 1) || (tmpFlgXBC == 1)))
        {
            if (sStsData[4].deltaZm < sStsData[3].deltaZm)
            {
                bValidTemp[3] = FALSE32;
            }

            if (sStsData[3].deltaZm < sStsData[4].deltaZm)
            {
                bValidTemp[4] = FALSE32;
            }
        }

        /* ⑩ TmpCZFlg==1且TmpAZFlg==1且（TmpFlgZCA==1或TmpFlgXCA==1） */
        if ((bValidTemp[4] == TRUE32) && (bValidTemp[2] == TRUE32) &&
            ((tmpFlgZCA == 1) || (tmpFlgXCA == 1)))
        {
            if (sStsData[4].deltaZm < sStsData[2].deltaZm)
            {
                bValidTemp[2] = FALSE32;
            }

            if (sStsData[2].deltaZm < sStsData[4].deltaZm)
            {
                bValidTemp[4] = FALSE32;
            }
        }
    }

    /* (14)星敏感器可用性判断，确定BZ4 */

    /* ① 预置为用陀螺数据定姿 */
    sGncCtrlFlag.BZ4 = 0;

    /* ②~⑥, 星敏A/B、着陆器星敏A/B/C有效性判定 */
    for (iSts=0; iSts<DEV_NUM_STS_ALL; iSts++)
    {
        if (bValidTemp[iSts] == TRUE32)
        {
            /* 设置BZ4 */
            UI32_BIT_SET1(sGncCtrlFlag.BZ4, iSts, 1u);

            /* 残差赋值 */
            sStsDataCom.deltaZr[0] = sStsData[iSts].deltaZ[0];
            sStsDataCom.deltaZr[1] = sStsData[iSts].deltaZ[1];
            sStsDataCom.deltaZr[2] = sStsData[iSts].deltaZ[2];
        }
    }

    /* (15)星敏感器在轨标定 */

    /* 默认星敏标定不做任何操作 */
    flgCalibrate = 0;
    iSts  = 0;
    iSts0 = 0;

    /* 星敏A使用标志判定 */
    if (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 0u) == 0x01)
    {
        /* 星敏A标定星敏B */
        if ((sStsDataCom.flgCalibrate == 1) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 1u) == 0x01))
        {
            /* 采用星敏A标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 0;
            iSts  = 1;
        }

        /* 采用星敏A标定着陆器星敏感器A */
        if ((sStsDataCom.flgCalibrate == 3) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 2u) == 0x01))
        {
            /* 采用星敏A标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 0;
            iSts  = 2;
        }

        /* 采用星敏A标定着陆器星敏感器B */
        if ((sStsDataCom.flgCalibrate == 4) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 3u) == 0x01))
        {
            /* 采用星敏A标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 0;
            iSts  = 3;
        }

        /* 采用星敏A标定着陆器星敏感器C */
        if ((sStsDataCom.flgCalibrate == 5) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 4u) == 0x01))
        {
            /* 采用星敏A标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 0;
            iSts  = 4;
        }
    }

    /* 星敏B使用标志判定 */
    if (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 1u) == 0x01)
    {
        /* 采用星敏B标定着陆器星敏感器A */
        if ((sStsDataCom.flgCalibrate == 9) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 2u) == 0x01))
        {
            /* 采用星敏B标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 1;
            iSts  = 2;
        }

        /* 采用星敏B标定着陆器星敏感器B */
        if ((sStsDataCom.flgCalibrate == 10) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 3u) == 0x01))
        {
            /* 采用星敏B标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 1;
            iSts  = 3;
        }

        /* 采用星敏B标定着陆器星敏感器C */
        if ((sStsDataCom.flgCalibrate == 11) &&
            (UI32_BIT_GET1(sGncCtrlFlag.BZ4, 4u) == 0x01))
        {
            /* 采用星敏B标定其他星敏 */
            flgCalibrate = 1;

            /* 星敏编号 */
            iSts0 = 1;
            iSts  = 4;
        }
    }

    /* 地面注入星敏感器B的标定数据 */
    if (sStsDataCom.flgCalibrate == 2)
    {
        /* 注入标定 */
        flgCalibrate = 2;

        /* 星敏编号 */
        iSts = 1;
    }

    /* 地面注入着陆器星敏感器A的标定数据 */
    if (sStsDataCom.flgCalibrate == 6)
    {
        /* 注入标定 */
        flgCalibrate = 2;

        /* 星敏编号 */
        iSts = 2;
    }

    /* 地面注入着陆器星敏感器B的标定数据 */
    if (sStsDataCom.flgCalibrate == 7)
    {
        /* 注入标定 */
        flgCalibrate = 2;

        /* 星敏编号 */
        iSts = 3;
    }

    /* 地面注入着陆器星敏感器C的标定数据 */
    if (sStsDataCom.flgCalibrate == 8)
    {
        /* 注入标定 */
        flgCalibrate = 2;

        /* 星敏编号 */
        iSts = 4;
    }

    /* 采用星敏A/星敏B标定其他星敏 */
    if (flgCalibrate == 1)
    {
        /* 计算Qm(TmpqA,Qa(CBSA)) */
        C2Q(&tmpVec4[0], &sStsProcParam.CBS[iSts0][0][0]);
        QMulti(&tmpVec4[0], &sStsData[iSts0].tmpQ[0], &tmpVec4[0]);

        /* 计算Qim(TmpqB,Qm(TmpqA,Qa(CBSA))) */
        Qdiv(&tmpVec4[0], &sStsData[iSts].tmpQ[0], &tmpVec4[0]);

        /* 计算Tmpdq=Qim(Qa(CBSB),Qim(TmpqB,Qm(TmpqA,Qa(CBSA)))) */
        C2Q(&tmpdq[0], &sStsProcParam.CBS[iSts][0][0]);
        Qdiv(&tmpdq[0], &tmpdq[0], &tmpVec4[0]);

        /* 计算φSB、θSB、ψSB */
        sStsProcParam.calibErr[0] = sStsProcParam.calibErr[0] + sStsProcParam.calibK * (2.0 * tmpdq[0] - sStsProcParam.calibErr[0]);
        sStsProcParam.calibErr[1] = sStsProcParam.calibErr[1] + sStsProcParam.calibK * (2.0 * tmpdq[1] - sStsProcParam.calibErr[1]);
        sStsProcParam.calibErr[2] = sStsProcParam.calibErr[2] + sStsProcParam.calibK * (2.0 * tmpdq[2] - sStsProcParam.calibErr[2]);
        LimitDouble(sStsProcParam.calibErr[0], sStsProcParam.thetaSMax);
        LimitDouble(sStsProcParam.calibErr[1], sStsProcParam.thetaSMax);
        LimitDouble(sStsProcParam.calibErr[2], sStsProcParam.thetaSMax);
    }

    /* 采用星敏A标定其他星敏, 或者, 由地面注入星敏感器的标定数据 */
    if (flgCalibrate != 0)
    {
        tmpFlt = sStsProcParam.calibErr[0] * sStsProcParam.calibErr[0] +
                 sStsProcParam.calibErr[1] * sStsProcParam.calibErr[1] +
                 sStsProcParam.calibErr[2] * sStsProcParam.calibErr[2];
        tmpVec4[0] = sStsProcParam.calibErr[0] / 2.0;
        tmpVec4[1] = sStsProcParam.calibErr[1] / 2.0;
        tmpVec4[2] = sStsProcParam.calibErr[2] / 2.0;
        tmpFlt = Maxx((1.0 - tmpFlt / 4.0), 0.0);
        tmpVec4[3] = Sqrtx(tmpFlt);

        Q2C(&tmpMat[0][0], &tmpVec4[0]);

        /* 提取星敏的XBB/YBB/ZBB */
        MatrixExtractColumn(&tmpX[0], &sStsProcParam.CBS[iSts][0][0], 3, 3, 0);
        MatrixExtractColumn(&tmpY[0], &sStsProcParam.CBS[iSts][0][0], 3, 3, 1);
        MatrixExtractColumn(&tmpZ[0], &sStsProcParam.CBS[iSts][0][0], 3, 3, 2);

        /* 计算XBR/YBR/ZBR, 并按列赋值 */
        MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpX[0]);
        MatrixEvalColumn(&sStsProcParam.CBSR[iSts][0][0], &tmpVec[0], 3, 3, 0);

        MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpY[0]);
        MatrixEvalColumn(&sStsProcParam.CBSR[iSts][0][0], &tmpVec[0], 3, 3, 1);

        MatrixMulti331(&tmpVec[0], &tmpMat[0][0], &tmpZ[0]);
        MatrixEvalColumn(&sStsProcParam.CBSR[iSts][0][0], &tmpVec[0], 3, 3, 2);
    }

    /* (16) */
    /* 若TmpBZ1==1且（BZ4(D0)=1或BZ4(D1)=1） */
    if ((TmpBZ1 == 1) && ((sGncCtrlFlag.BZ4 & 0x3u) != 0))
    {
        sStsProcParam.tsUP = sTime.sstime;
    }

    return;
}

void CentroidAndInertiaEst(void)
{
    float64 tmpFlt;
    float64 tmpmfuel;
    float64 tmpmfuelSqr;
    float64 tmpcFB[3][3];
    float64 tmpVec[3];
    float64 tmpVec3Sec[3];
    boolu32 bImuCommOk;
    boolu32 bModeOk;
    unint32 tmpBit;
    unint32 cntGyro;
    unint32 cntAcce;
    unint32 iHead;

    /* 统计可用陀螺/加计个数 */
    cntGyro = 0;
    cntAcce = 0;
    for (iHead=0; iHead<IMU_HEAD_NUM; iHead++)
    {
        /* 获取陀螺指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT2, iHead);
        cntGyro = cntGyro + tmpBit;

        /* 获取加计指定位 */
        tmpBit = UI32_BIT_GET1(sGncCtrlFlag.UseZT3, iHead);
        cntAcce = cntAcce + tmpBit;
    }

    /* (1) */
    tmpmfuel = sBodyData.mass - sAttiModifyParam.mass0;
    tmpmfuelSqr = tmpmfuel * tmpmfuel;

    /* (2) */
    sBodyData.hgo = sAttiModifyParam.para[0][0] * tmpmfuelSqr + sAttiModifyParam.para[0][1] * tmpmfuel + sAttiModifyParam.para[0][2];

    /* (3) */
    sBodyData.Jb[0][0] = sAttiModifyParam.para[1][0] * tmpmfuelSqr + sAttiModifyParam.para[1][1] * tmpmfuel + sAttiModifyParam.para[1][2];
    sBodyData.Jb[1][1] = sAttiModifyParam.para[2][0] * tmpmfuelSqr + sAttiModifyParam.para[2][1] * tmpmfuel + sAttiModifyParam.para[2][2];
    sBodyData.Jb[2][2] = sAttiModifyParam.para[3][0] * tmpmfuelSqr + sAttiModifyParam.para[3][1] * tmpmfuel + sAttiModifyParam.para[3][2];

    sBodyData.Jb[0][1] = sAttiModifyParam.Ixy;
    sBodyData.Jb[1][0] = sAttiModifyParam.Ixy;
    sBodyData.Jb[0][2] = sAttiModifyParam.Ixz;
    sBodyData.Jb[2][0] = sAttiModifyParam.Ixz;
    sBodyData.Jb[1][2] = sAttiModifyParam.Iyz;
    sBodyData.Jb[2][1] = sAttiModifyParam.Iyz;

    /* (4) */
    sBodyData.pgoF[0] = sBodyData.hgo;
    sBodyData.pgoF[1] = sAttiModifyParam.ygo0;
    sBodyData.pgoF[2] = sAttiModifyParam.zgo0;

    /* (5)估计机械系横向质心偏差(用于285N故障诊断) */

    /* ① */
    MatrixTran33(&tmpcFB[0][0], &sAttiModifyParam.cBF[0][0]);

    /* 计算(Jb•(ω8-Oldω8)+cross(ω,Jb•ω)•Δt-HtotalP) */
    VectorSub3(&tmpVec[0], &sGyroData.w8[0], &sGyroData.oldw8[0]);
    MatrixMulti331(&tmpVec[0], &sBodyData.Jb[0][0], &tmpVec[0]);

    MatrixMulti331(&tmpVec3Sec[0], &sBodyData.Jb[0][0], &sGyroData.w[0]);
    VectorCross3(&tmpVec3Sec[0], &sGyroData.w[0], &tmpVec3Sec[0]);
    VectorScalar3(&tmpVec3Sec[0], &tmpVec3Sec[0], T_128MS);

    VectorAdd3(&tmpVec[0], &tmpVec[0], &tmpVec3Sec[0]);
    VectorSub3(&tmpVec[0], &tmpVec[0], &sBodyData.HtotalP[0]);

    /* 计算Tmp */
    MatrixMulti331(&tmpVec[0], &tmpcFB[0][0], &tmpVec[0]);

    /* ② */

    /* 若(UseZT2有效个数>=3且UseZT3有效个数>=3) */
    if ((cntGyro >= 3) && (cntAcce >= 3))
    {
        bImuCommOk = TRUE32;
    }
    else
    {
        bImuCommOk = FALSE32;
    }

    /* 3≤BZ1≤7且BZ1≠5 */
    if ((IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_TRANSLATION, WORK_MODE_APPROACH)) && (sGncCtrlFlag.BZ1 != WORK_MODE_GLIDE))
    {
        bModeOk = TRUE32;
    }
    else
    {
        bModeOk = FALSE32;
    }

    /* ZT10(D0)==1 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT10, 0u) == 0x01) && (bImuCommOk == TRUE32) && (bModeOk == TRUE32) && (sBodyData.Itotal[0] > (sThruCtrl.F285 * T_128MS)))
    {
        tmpFlt = NZ(sBodyData.Itotal[0], FLT64_ZERO);
        sBodyData.ygo = sBodyData.ygo + sAttiModifyParam.kgo * ( tmpVec[2] / tmpFlt - sBodyData.ygo);
        sBodyData.ygo = LimitDouble(sBodyData.ygo, sAttiModifyParam.gomax);

        sBodyData.zgo = sBodyData.zgo + sAttiModifyParam.kgo * (-tmpVec[1] / tmpFlt - sBodyData.zgo);
        sBodyData.zgo = LimitDouble(sBodyData.zgo, sAttiModifyParam.gomax);
    }

    return;
}

void DeviceDataProc(void)
{
    float64 delt;
    boolu32 bCommValidTemp;

    /* （2）月固系计算 */
    CMICalculate();

    /* （3）太阳矢量计算 */
    /* 三机工作或者（两机工作且bSIFlg==0） */
    if ((bFlyNotWalk == TRUE32) || (sNaviFlag.bSIFlg != TRUE32))
    {
        /* 调用4.4.7（太阳矢量计算） */
        SunCalendarCalc();
    }

    /* （4）中继卫星矢量计算 */
    /* 若三机工作且ZT9(D19)==1 */
    if ((bFlyNotWalk == TRUE32) && (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 19) == 1))
    {
        /* 调用4.4.8 (中继卫星轨道计算) */
        RelaySatOrbitCalc();
    }

    /* （5）调用4.3.5（质心和惯量估计） */
    CentroidAndInertiaEst();

    /* （6）冲量和冲量矩计算 */
    /* 三机工作 */
    if (bFlyNotWalk == TRUE32)
    {
        /* 调用4.3.6（冲量和冲量矩计算） */
        ImpulseMomentCalc();
    }

    /* （7）陀螺 */

    /* 三机工作 */
    if (bFlyNotWalk == TRUE32)
    {
        /* 调用4.2.2（陀螺数据处理128ms） */
        GyroDataProc128();
    }
    /* 双机工作 */
    else
    {
        /* 调用4.2.6（陀螺数据处理16ms） */
        GyroDataProc16();
    }

    /* （8）加速度计 */

    /* 三机工作 */
    if (bFlyNotWalk == TRUE32)
    {
        /* 调用4.2.3（加计数据处理128ms） */
        AcceDataProc128();
    }
    /* 双机工作 */
    else
    {
        /* 调用4.2.7（加计数据处理16ms） */
        AcceDataProc16();
    }

    /* （9）星敏感器 */
    /* 三机工作或者（两机工作且任务1周期） */
    if ((bFlyNotWalk == TRUE32) || (sWalkModeData.TaskNumber == 1))
    {
        /* 调用4.2.4（星敏数据处理） */
        StsDataProc();
    }

    /* （10）微波测距测速敏感器 */
    /* 若三机工作且BZ1==2~8 */
    if (bFlyNotWalk == TRUE32)
    {
        if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
        {
            /* 调用4.2.5（微波测距测速数据处理） */
            MrvsDataProc();
        }
    }

    /* （11）高动态三维 */
    if (bFlyNotWalk == TRUE32)
    {
        /* 若三机工作且BZ1==7（接近） */
        if (sGncCtrlFlag.BZ1 == WORK_MODE_APPROACH)
        {
            #ifdef __GCC_COMPILED__
                bCommValidTemp = sFtdiComm.bCommValid;
            #else
                /* 快仿环境此量bCommValid不能判断 */
                bCommValidTemp = TRUE32;
            #endif

            /* 若三维安全点获取序列计数标志为0xFF */
            if (sFtdiCtrl.flgSafePointSeqEndFlg == 0xFF)
            {
                /* 着陆点信息计算结果，安全着陆点单位矢量pFTDI（三维安全点获取序列标志为0xFF，意味着数据已经完成接收） */

                /* 三维图像质量差标志为0 */
                sFtdiSafeLandData.FTDIFailFlg = 0;

                /* ② 三维图像质量差标志 */
                /* 若HoverFlg==0且FTDIFlg==1且着陆点信息计算结果为C1H或者55H */
                if ((sGuideData.bHoverFlg == FALSE32) &&
                    (sAvoidData.flgFTDI == 1) &&
                    ((bCommValidTemp == TRUE32) && IN_RANGE_SET2(sFtdiSafePointRecv.flgResult, 0xC1, 0x55)))
                {
                    sFtdiSafeLandData.FTDIFailFlg = 1;
                }

                /* ③ 若着陆点信息计算结果为30H */
                if ((bCommValidTemp == TRUE32) && (sFtdiSafePointRecv.flgResult == 0x30))
                {
                    /* 置FTDI有效 */
                    sFtdiSafeLandData.FTDIVldFlg = 1;
                }

                /* 若HoverFlg==0且（FTDIFlg==2或者FTDIFlg==4或者（FTDIFlg==3且h100Flg==1））且着陆点信息计算结果为31H~3FH */
                if ((sGuideData.bHoverFlg == FALSE32) &&
                    (IN_RANGE_SET2(sAvoidData.flgFTDI, 2, 4) || ((sAvoidData.flgFTDI == 3) && (sNaviData.h100Flg == 1))) &&
                    ((bCommValidTemp == TRUE32) && IN_RANGE_CLOSE(sFtdiSafePointRecv.flgResult, 0x31, 0x3F)))
                {
                    /* 置FTDI有效 */
                    sFtdiSafeLandData.FTDIVldFlg = 1;
                }

                /* 三维安全点获取序列结束标志清零 */
                sFtdiCtrl.flgSafePointSeqEndFlg = 0x00;
            }

            /* ④ 高动态三维数据可用标志FTDIUseFlg=1 */
            sFtdiSafeLandData.FTDIUseFlg = 1;

            /* ⑤ 若FTDIVldFlg==0或者t<tFTDI或者t-tFTDI>dtFTDI，则：FTDIUseFlg=0 */
            delt = sTime.sstime - sFtdiSafeLandData.tFTDI;

            if ((sFtdiSafeLandData.FTDIVldFlg == 0) ||
                (sTime.sstime < sFtdiSafeLandData.tFTDI) ||
                (delt > sAvoidParam.dtFTDI))
            {
                sFtdiSafeLandData.FTDIUseFlg = 0;
            }
        }
    }

    /* （12）推进系统 */
    ThruStatusClear();

    /* （13）若三机工作且2≤BZ1≤8，则：tH=tH+Δt */
    if (bFlyNotWalk == TRUE32)
    {
        if (IN_RANGE_CLOSE(sGncCtrlFlag.BZ1, WORK_MODE_VERTRISE, WORK_MODE_SLOWDOWN))
        {
            /* 单次飞跃过程累积时间累加 */
            sGuideData.tH = sGuideData.tH + T_128MS;
        }
    }

    /* （14）若三机工作，则：将λcAL、LcAL、rM、姿态四元数q、月球自转轴ωm_I以及星时tlast存入重要数据（用于两机工作初始化） */

    /* （15）保存上周期数据 */
    SavaLastCycleData();

    return;
}

void AttDeterWalkMode(void)
{
    float64 tmpFabs;

    /* 任务1~任务8周期调用 */
    if (IN_RANGE_CLOSE(sWalkModeData.TaskNumber, 1, 8))
    {
        /* (1)调用4.2.1(部件数据处理) */
        DeviceDataProc();

        /* (2)调用4.3.7(行走过程中姿态确定(行走)) */
        AttDeterWalk();

        /* (3)调用4.3.8(行走姿态处理(行走)) */
        AttProcWalk();

        tmpFabs = Fabsx(sWalkModeData.AttBaseBoard);

        /* 静态模式处理 */
        if (sGncCtrlFlag.BZ1 == WORK_MODE_STATIC)
        {
            if ((sWalkAttData.AttValidIF == 1) &&
                (tmpFabs > sWalkModeParam.theta_safe))
            {
                /* 姿态报警 */
                sWalkCtrlFlag.Task = 62;
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 1u);
            }
            else
            {
                /* 姿态正常 */
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 0u);
            }
        }
        /* 地面规划行走、全局规划、移动规划模式处理 */
        else
        {
            if (tmpFabs > sWalkModeParam.theta_safe)
            {
                /* 姿态报警 */
                sWalkCtrlFlag.Task = 62;
                UI32_BIT_SET1(sWalkSendData.tiltAlarm, 0u, 1u);
            }

            /* 陀螺/加计小于3个 */
            if ((sGncCtrlFlag.GyrInvNum > sAttiModifyParam.GyrInvMaxN) ||
                (sGncCtrlFlag.AccInvNum > sAttiModifyParam.AccInvMaxN))
            {
                sWalkCtrlFlag.Task = 35;
            }
        }
    }

    /* （3）调用4.3.1（星敏感器陀螺确定惯性姿态）, 任务1周期调用 */
    if (sWalkModeData.TaskNumber == 1)
    {
        AttDeterStsGyro();
    }

    return;
}