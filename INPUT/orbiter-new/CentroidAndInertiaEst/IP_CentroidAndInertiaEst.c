#include "IP_CentroidAndInertiaEst.h"

// =======================================================
// 函数实现
// =======================================================

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