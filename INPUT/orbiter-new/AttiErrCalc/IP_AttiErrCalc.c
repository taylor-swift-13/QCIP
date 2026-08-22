#include "IP_AttiErrCalc.h"

// =======================================================
// 函数实现
// =======================================================

void AttiErrCalc(void)
{
    float64 tmpFlt;
    float64 deltTheta;
    float64 tmpq[4];
    float64 tmpQBT[4];
    float64 tmpWBT[3];
    float64 tmpVec[3];
    float64 tmpeMat31[3];
    float64 Sd[3];
    float64 Sv[3];
    float64 tmpC[3][3];
    float64 Cx[3][3];
    float64 tmpMat33[3][3];
    float64 tmpMat33T[3][3];
    float64 tmpCBIT[3][3];
    float64 tmpCBI[3][3];

    /* (2)误差四元数和角速度 */
    /* 内部已做归一化 */
    Qdiv(&tmpQBT[0], &sAttiData.qGI.q4[0], &sAttiData.q.q4[0]);
    tmpFlt = LimitDouble(tmpQBT[3], 1.0);
    sAttiData.eulerBT = 2.0 * Acosx(tmpFlt);

    Q2C(&tmpMat33[0][0], &tmpQBT[0]);
    MatrixMulti331(&tmpVec[0], &tmpMat33[0][0], &sAttiData.wGI[0]);
    VectorSub3(&tmpWBT[0], &sGyroData.w[0], &tmpVec[0]);

    /* ZT9(D1)=1，使用最后一个子样计算角速度 */
    if (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 1u) == 1)
    {
        VectorSub3(&tmpWBT[0], &sGyroData.w8[0], &tmpVec[0]);
    }

    /* 坑外滚动调姿 */
    if (Fabsx(tmpQBT[0] * 2.0) < sAttiModifyParam.LmtPhi)
    {
        sGncCtrlFlag.FlgPhi = 0;
    }
    else
    {
        sGncCtrlFlag.FlgPhi = 1;
    }

    /* (3)姿态角轨迹规划 */
    /* ① */
    sAttiCtrl.bAVCtrl = FALSE32;
    sGncCtrlFlag.AVCFlgX = FALSE32;
    sGncCtrlFlag.AVCFlgY = FALSE32;
    sGncCtrlFlag.AVCFlgZ = FALSE32;

    /* ② */
    if (sAttiData.eulerBT >= sAttiCtrlParam.thetaM)
    {
        if ((UI32_BIT_GET1(sGncCtrlFlag.ZT10, 5u) == 0) || (sGncCtrlFlag.FlgPhi == 0))
        {
            /* 置角速度区控制标志 */
            sAttiCtrl.bAVCtrl = TRUE32;

            /* 取tmpQBT前三个元素 */
            DivNorm(&tmpeMat31[0], &tmpQBT[0], 3);

            VectorAddCoef(&tmpWBT[0], &tmpWBT[0], &tmpeMat31[0], -sAttiCtrlParam.dThetar, 3);
        }
        else
        {
            /* tmpCBIT=Aq(qGI) */
            Q2C(&tmpCBIT[0][0], &sAttiData.qGI.q4[0]);
            Q2C(&tmpCBI[0][0], &sAttiData.q.q4[0]);

            /* 目标推力方向表示在当前本体系 */
            /* Sd=tmpCBI∙tmpCBIT(1,1:3)T 提取矩阵的第一行 */
            MatrixExtractRow(&tmpeMat31[0], &tmpCBIT[0][0], 3, 3, 0);
            MatrixMulti331(&Sd[0], &tmpCBI[0][0], &tmpeMat31[0]);

            Sv[0] = 0.0;
            Sv[1] = -Sd[2];
            Sv[2] = Sd[1];

            /* 向目标推力方向旋转的轴（本体系内） */
            DivNorm(&Sv[0], &Sv[0], 3);

            /* 旋转角 */
            tmpFlt = LimitDouble(Sd[0], 1.0);
            deltTheta = Acosx(tmpFlt);

            /* 推力方向的旋转矢量 */
            tmpFlt = Sinx(deltTheta/2.0);
            VectorScalar(&tmpq[0], &Sv[0], tmpFlt, 3);
            tmpq[3] = Cosx(deltTheta/2.0);

            /* DivNormQ(tmpq) */
            QUnit(&tmpq[0]);

            /* 从当前本体系到目标本体系 */
            Q2C(&tmpC[0][0], &tmpq[0]);

            /* 进行推力方向调整后的误差矩阵 */
            MatrixMulti333(&tmpMat33[0][0], &tmpC[0][0], &tmpCBI[0][0]);
            MatrixTran33(&tmpMat33T[0][0], &tmpMat33[0][0]);
            MatrixMulti333(&Cx[0][0], &tmpCBIT[0][0], &tmpMat33T[0][0]);

            /* 滚动轴姿态误差 */
            sAttiCtrl.angleErr[0] = -Atan2x(Cx[1][2], Cx[1][1]);
            /* 俯仰轴姿态误差 */
            sAttiCtrl.angleErr[1] = -2.0 * tmpq[1];
            /* 偏航轴姿态误差 */
            sAttiCtrl.angleErr[2] = -2.0 * tmpq[2];

            tmpQBT[0] = sAttiCtrl.angleErr[0]/2.0;
            tmpQBT[1] = sAttiCtrl.angleErr[1]/2.0;
            tmpQBT[2] = sAttiCtrl.angleErr[2]/2.0;

            /* 滚动轴姿态规划 */
            if (Fabsx(sAttiCtrl.angleErr[0]) > sAttiCtrlParam.thetaM)
            {
                sGncCtrlFlag.AVCFlgX = TRUE32;
                tmpWBT[0] = tmpWBT[0] - sAttiCtrlParam.dThetar * Sgn3(sAttiCtrl.angleErr[0]);
            }

            /* 俯仰和偏航轴姿态规划 */
            if (deltTheta > sAttiCtrlParam.thetaM)
            {
                sGncCtrlFlag.AVCFlgY = TRUE32;
                sGncCtrlFlag.AVCFlgZ = TRUE32;
                tmpWBT[1] = tmpWBT[1] + sAttiCtrlParam.dThetar * Sv[1];
                tmpWBT[2] = tmpWBT[2] + sAttiCtrlParam.dThetar * Sv[2];
            }
        }
    }

    /* (4)三轴姿态角偏差和角速度偏差 */
    VectorScalar3(&sAttiCtrl.angleErr[0], &tmpQBT[0], 2.0);
    VectorEval3(&sAttiCtrl.rateErr[0], &tmpWBT[0]);

    return;
}