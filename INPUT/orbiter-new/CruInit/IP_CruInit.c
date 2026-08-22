#include "IP_CruInit.h"

// =======================================================
// 函数实现
// =======================================================

void CruInit(boolu32 bCruRestore)
{
    /* 重要数据保存周期计数清零 */
    sCrucialSave.cycleSave = 0x00;

    /* 重要数据逻辑打包首次调用标志默认为TRUE32 */
    sCrucialSave.firstTime = TRUE32;
    sCrucialSave.firstTime3To2 = TRUE32;

    /* 重要数据恢复周期计数清零 */
    sCrucialRest.cycleRestore = 0x00;

    /* 重要数据分包发送/接收状态标志清零 */
    sCrucialRest.rcvedFlg = 0x00;

    /* 置重要数据恢复阶段标志 */
    if (bCruRestore == TRUE32)
    {
        sCrucialRest.flgCruStage = CRU_RESTORE_STAGE_SERV_REQ;
    }
    else
    {
        sCrucialRest.flgCruStage = CRU_RESTORE_STAGE_NULL;
    }

    /* 置重要数据恢复结果标志: 未恢复 */
    sCrucialRest.flgCruResult = CRU_RESTORE_RESULT_NULL;

    /* 清除重要数据恢复星时接收标志 */
    sCrucialRest.bRecvedTime = FALSE32;

    /* 上电置重要数据恢复服务请求则间隔累计计数器置为100, 首次服务请求直接有效 */
    sSmuServReq.cntSerSetGap = 100;

    return;
}