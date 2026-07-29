#include "IP_ModeConvert_OCM.h"

void ModeConvert_OCMFun(void *p)
{
    ModeConvert_OCM *pIp = (ModeConvert_OCM*)p;

    if (pIp->m_starTime > (pIp->csOrbitCtrlData_tpi_OC + pIp->csJPCData_dtp_OCAdj))
    {
        pIp->m_WorkMode = WKMD_NWM;
    }

    return;
}