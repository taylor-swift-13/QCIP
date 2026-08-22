#include "IP_CruPack.h"

// =======================================================
// 函数实现
// =======================================================

void CruPack(void)
{
    /* 先进行刷FF的操作，保证校验和计算的正确同时满足文档中关于重要数据填充FF的要求，这里需要注意刷零仅刷重要数据部分，不能影响三机转两机的部分 */
    Memsetx(&sCrucialSave.saveBuff[0], 0xFF, CRU_TOTAL_LENGTH_CRUDATA);

    /* 获取当前星时 */
    sCrucialRest.tim = sTime.sstime;

    /* 根据当前所处模式，分别对行走和飞跃进行重要数据包构造 */
    if (bFlyNotWalk == TRUE32)
    {
        /* 模式初始时刻打包缓存, s */
        if (sGncCtrlFlag.BZ1 == WORK_MODE_TRANSLATION)
        {
            sCrucialSave.tmpTime = sModeProcess.t30;
        }
        else if (sGncCtrlFlag.BZ1 == WORK_MODE_RISEATTI)
        {
            sCrucialSave.tmpTime = sModeProcess.t40;
        }
        else if (sGncCtrlFlag.BZ1 == WORK_MODE_GLIDE)
        {
            sCrucialSave.tmpTime = sModeProcess.t50;
        }
        else if (sGncCtrlFlag.BZ1 == WORK_MODE_SPEEDDECEL)
        {
            sCrucialSave.tmpTime = sModeProcess.t60;
        }
        else if (sGncCtrlFlag.BZ1 == WORK_MODE_APPROACH)
        {
            sCrucialSave.tmpTime = sModeProcess.t70;
        }
        else if (sGncCtrlFlag.BZ1 == WORK_MODE_SLOWDOWN)
        {
            sCrucialSave.tmpTime = sModeProcess.t8;
        }
        else
        {
            sCrucialSave.tmpTime = 0.0;
        }

        /* 飞跃模式的重要数据包头定位0xAA */
        sCrucialSave.saveBuff[0] = 0xAA;

        /* 当前是飞跃模式，使用装定表逻辑打包重要数据,长度需要去除包头及校验和 */
        AutuPackDataflow(&sCrucialSave.saveBuff[1], &CRUPK_FLY[0], &sCrucialSave.firstTime, CRU_FLY_MAPTABLE_LENGTH, (CRU_TOTAL_LENGTH_CRUDATA - 2));
    }
    else
    {
        /* 行走模式的重要数据包头定义为0xBB */
        sCrucialSave.saveBuff[0] = 0xBB;

        /* 当前是行走模式，使用装定表逻辑打包重要数据 */
        AutuPackDataflow(&sCrucialSave.saveBuff[1], &CRUPK_WALK[0], &sCrucialSave.firstTime, CRU_WALK_MAPTABLE_LENGTH, (CRU_TOTAL_LENGTH_CRUDATA - 2));
    }

    /* 计算累加和 */
    sCrucialSave.saveBuff[CRU_TOTAL_LENGTH_CRUDATA - 1] = CheckSumAdd08(&sCrucialSave.saveBuff[0], (CRU_TOTAL_LENGTH_CRUDATA-1));

    return;
}