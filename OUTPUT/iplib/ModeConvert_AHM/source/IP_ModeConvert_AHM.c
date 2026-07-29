#include "IP_ModeConvert_AHM.h"

void ModeConvert_AHMFun(void *p)
{
    ModeConvert_AHM *pIp = (ModeConvert_AHM*)p;

    // if((pIp->m_starTime - pIp->csOrb19_Para_I_t0) >= pIp->csModePara_dt_OrbitInject)
    // /* if (m_starTime >= csModePara.dt_OrbitInject) */
    // {
    //     pIp->m_WorkMode = 0x01u;
    // }

    //转入机动模式
    if ( pIp->ModeObject_Timer_Mode[pIp->m_WorkMode] > pIp->LmtT_AHM )
    {
        pIp->m_WorkMode = 0x04u; //转入机动模式
    }
    return;
}