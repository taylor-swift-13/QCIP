#include "IP_ModeConvert_EIM.h"

void ModeConvert_EIMFun(void *p)
{
    ModeConvert_EIM *pIp = (ModeConvert_EIM*)p;

    if ( pIp->ModeObject_Timer_Mode[pIp->m_WorkMode] > pIp->csModePara_dt_END_EIM )    /* 时间到 */
    {
        pIp->m_WorkMode = 0x02u;      /* 转入正常模式 */
    }

    return;
}