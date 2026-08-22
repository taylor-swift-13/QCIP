#include "IP_CruDataReadFromTr32.h"

// =======================================================
// 函数实现
// =======================================================

void CruDataReadFromTr32(void)
{
    unint32 tr32Var;
    unint32 countOfbuffer;

    for(countOfbuffer=0; countOfbuffer<CRU_TOTAL_LENGTH; countOfbuffer=countOfbuffer+4)
    {
        tr32Var = Tr32Uint((volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_FIRST  + countOfbuffer),
                           (volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_SECOND + countOfbuffer),
                           (volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_THIRD  + countOfbuffer));

        sCrucialRest.tr32Buff[countOfbuffer + 0] = UI32_HIHI8(tr32Var);
        sCrucialRest.tr32Buff[countOfbuffer + 1] = UI32_HILO8(tr32Var);
        sCrucialRest.tr32Buff[countOfbuffer + 2] = UI32_LOHI8(tr32Var);
        sCrucialRest.tr32Buff[countOfbuffer + 3] = UI32_LOLO8(tr32Var);
    }

    return;
}