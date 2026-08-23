#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruInit/IP_CruInit.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t restore = row < 3u ? (uint32_t)row : (uint32_t)(ft_prng_next(&state) % 4u);
        sCrucialSave.cycleSave = (uint32_t)ft_prng_next(&state);
        sCrucialSave.cycleSave3To2 = (uint32_t)ft_prng_next(&state);
        sCrucialSave.firstTime = (uint32_t)ft_prng_next(&state);
        sCrucialSave.firstTime3To2 = (uint32_t)ft_prng_next(&state);
        sCrucialRest.cycleRestore = (uint32_t)ft_prng_next(&state);
        sCrucialRest.rcvedFlg = (uint32_t)ft_prng_next(&state);
        sCrucialRest.flgCruStage = (uint32_t)ft_prng_next(&state);
        sCrucialRest.flgCruResult = (uint32_t)ft_prng_next(&state);
        sCrucialRest.bRecvedTime = (uint32_t)ft_prng_next(&state);
        sSmuServReq.cntSerSetGap = (uint32_t)ft_prng_next(&state);

        uint64_t inputs[11] = {
            restore, sCrucialSave.cycleSave, sCrucialSave.cycleSave3To2,
            sCrucialSave.firstTime, sCrucialSave.firstTime3To2,
            sCrucialRest.cycleRestore, sCrucialRest.rcvedFlg,
            sCrucialRest.flgCruStage, sCrucialRest.flgCruResult,
            sCrucialRest.bRecvedTime, sSmuServReq.cntSerSetGap
        };
        CruInit(restore);

        printf("%" PRIu64, inputs[0]);
        for (int i = 1; i < 11; ++i) printf(" %" PRIu64, inputs[i]);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 "\n",
               sCrucialSave.cycleSave, sCrucialSave.cycleSave3To2,
               sCrucialSave.firstTime, sCrucialSave.firstTime3To2,
               sCrucialRest.cycleRestore, sCrucialRest.rcvedFlg,
               sCrucialRest.flgCruStage, sCrucialRest.flgCruResult,
               sCrucialRest.bRecvedTime, sSmuServReq.cntSerSetGap);
    }
    return 0;
}
