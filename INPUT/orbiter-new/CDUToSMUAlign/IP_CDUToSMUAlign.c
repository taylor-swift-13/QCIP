#include "IP_CDUToSMUAlign.h"

// =======================================================
// 函数实现
// =======================================================

void CDUToSMUAlign(void)
{
    /* 更新wifi释放标志 */
    sAlignToSmu.SMUWIFIreleaseFlag = sWalkSendData.WIFIreleaseFlag;

    /* 更新 前方地形是否安全 */
    if(sAlignToSmu.bFWSafeIF == TRUE32)
    {
        sAlignToSmu.SMUFWSafeIF = sWalkSendData.FWSafeIF;
        sFrameCduSend.cntDataItem3 = 8;
        sAlignToSmu.bFWSafeIF = FALSE32;
    }

    /* 更新 路径规划标识 */
    if(sAlignToSmu.bPathPlanFlag == TRUE32)
    {
        sAlignToSmu.SMUPathPlanFlag = sWalkSendData.PathPlanFlag;
        sFrameCduSend.cntDataItem4 = 8;
        sAlignToSmu.bPathPlanFlag = FALSE32;
    }

    /* 更新 运动次数 */
    if(sAlignToSmu.bMoveNum == TRUE32)
    {
        sAlignToSmu.SMUMoveNum = sWalkSendData.MoveNum;
        sFrameCduSend.cntDataItem5 = 8;
        sAlignToSmu.bMoveNum = FALSE32;
    }

    /* 更新 坡面角1 */
    if(sAlignToSmu.bSlopeAgl1 == TRUE32)
    {
        sAlignToSmu.SMUSlopeAgl1 = sWalkSendData.SlopeAgl1;
        sFrameCduSend.cntDataItem8 = 8;
        sAlignToSmu.bSlopeAgl1 = FALSE32;
    }

    /* 更新 坡面角2 */
    if(sAlignToSmu.bSlopeAgl2 == TRUE32)
    {
        sAlignToSmu.SMUSlopeAgl2 = sWalkSendData.SlopeAgl2;
        sFrameCduSend.cntDataItem9 = 8;
        sAlignToSmu.bSlopeAgl2 = FALSE32;
    }

    /* 更新 前进距离d和前进方向θ */
    if(sAlignToSmu.bDAndTheta == TRUE32)
    {
        sAlignToSmu.SMUd = sWalkSendData.d;
        sAlignToSmu.SMUTurnAgl = sWalkSendData.TurnAgl;
        sFrameCduSend.cntDataItem10 = 8;
        sAlignToSmu.bDAndTheta = FALSE32;
    }

    return;
}