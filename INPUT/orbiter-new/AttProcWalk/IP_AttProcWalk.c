#include "IP_AttProcWalk.h"

// =======================================================
// 函数实现
// =======================================================

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