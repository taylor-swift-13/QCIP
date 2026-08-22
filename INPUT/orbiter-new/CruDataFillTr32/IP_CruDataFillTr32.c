#include "IP_CruDataFillTr32.h"

// =======================================================
// 函数实现
// =======================================================

void CruDataFillTr32(void)
{
    unint32 tr32Var;
    unint32 countOfbuffer;

    for(countOfbuffer=0; countOfbuffer<CRU_TOTAL_LENGTH; countOfbuffer=countOfbuffer+4)
    {
        tr32Var = UI32_MAKE(sCrucialSave.saveBuffLast[countOfbuffer + 0],
                            sCrucialSave.saveBuffLast[countOfbuffer + 1],
                            sCrucialSave.saveBuffLast[countOfbuffer + 2],
                            sCrucialSave.saveBuffLast[countOfbuffer + 3]);

        Tr32UintValue((volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_FIRST  + countOfbuffer),
                      (volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_SECOND + countOfbuffer),
                      (volatile unint32 *)(SOC_SRAM_TR32_CRUDATA_THIRD  + countOfbuffer),
                      tr32Var);
    }

    return;
}