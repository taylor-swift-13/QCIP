#include "IP_CruPackFlyToWalk.h"

// =======================================================
// 函数实现
// =======================================================

void CruPackFlyToWalk(void)
{
    /* 先进行刷0的操作，保证校验和计算的正确 */
    Memsetx(&sCrucialSave.saveBuff[CRU_FLYTOWALK_START], 0x00, CRU_TOTAL_LENGTH_FLYTOWALK);

    /* 获取当前星时 */
    sCrucialRest.tim = sTime.sstime;

    /* 参照任务书，三机转两机的包头为0x55 */
    sCrucialSave.saveBuff[CRU_FLYTOWALK_START] = 0x55;

    /* 进行三机转两级的重要数据打包，总长度需要去掉包头和校验和 */
    AutuPackDataflow(&sCrucialSave.saveBuff[CRU_FLYTOWALK_START + 1], &CRUPK_FLYTOWALK[0], &sCrucialSave.firstTime3To2, CRU_FLYTOWALK_MAPTABLE_LENGTH, (CRU_TOTAL_LENGTH_FLYTOWALK - 2));

    /* 计算累加和 */
    sCrucialSave.saveBuff[CRU_FLYTOWALK_START + CRU_TOTAL_LENGTH_FLYTOWALK - 1] = CheckSumAdd08(&sCrucialSave.saveBuff[CRU_FLYTOWALK_START], (CRU_TOTAL_LENGTH_FLYTOWALK-1));

    return;
}