#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CDUToSMUAlign/IP_CDUToSMUAlign.c"

static void print_u64(uint64_t value) { printf(" %" PRIu64, value); }

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);

    for (unsigned long row = 0; row < count; ++row) {
        memset(&sWalkSendData, 0, sizeof sWalkSendData);
        memset(&sFrameCduSend, 0, sizeof sFrameCduSend);
        memset(&sAlignToSmu, 0, sizeof sAlignToSmu);

        sWalkSendData.WIFIreleaseFlag = (uint32_t)ft_prng_next(&state);
        sWalkSendData.FWSafeIF = (uint32_t)ft_prng_next(&state);
        sWalkSendData.PathPlanFlag = (uint32_t)ft_prng_next(&state);
        sWalkSendData.MoveNum = (uint32_t)ft_prng_next(&state);
        sWalkSendData.SlopeAgl1 = ft_prng_finite(&state, 4.0);
        sWalkSendData.SlopeAgl2 = ft_prng_finite(&state, 4.0);
        sWalkSendData.d = ft_prng_finite(&state, 100.0);
        sWalkSendData.TurnAgl = ft_prng_finite(&state, 4.0);

        uint32_t flags[6];
        for (int i = 0; i < 6; ++i) flags[i] = (uint32_t)((row >> i) & 1u);
        if (row >= 64u)
            for (int i = 0; i < 6; ++i) flags[i] = (uint32_t)(ft_prng_next(&state) & 1u);
        sAlignToSmu.bFWSafeIF = flags[0];
        sAlignToSmu.bPathPlanFlag = flags[1];
        sAlignToSmu.bMoveNum = flags[2];
        sAlignToSmu.bSlopeAgl1 = flags[3];
        sAlignToSmu.bSlopeAgl2 = flags[4];
        sAlignToSmu.bDAndTheta = flags[5];

        sAlignToSmu.SMUWIFIreleaseFlag = (uint32_t)ft_prng_next(&state);
        sAlignToSmu.SMUFWSafeIF = (uint32_t)ft_prng_next(&state);
        sAlignToSmu.SMUPathPlanFlag = (uint32_t)ft_prng_next(&state);
        sAlignToSmu.SMUMoveNum = (uint32_t)ft_prng_next(&state);
        sAlignToSmu.SMUSlopeAgl1 = ft_prng_finite(&state, 8.0);
        sAlignToSmu.SMUSlopeAgl2 = ft_prng_finite(&state, 8.0);
        sAlignToSmu.SMUd = ft_prng_finite(&state, 200.0);
        sAlignToSmu.SMUTurnAgl = ft_prng_finite(&state, 8.0);

        sFrameCduSend.cntDataItem3 = (uint8_t)ft_prng_next(&state);
        sFrameCduSend.cntDataItem4 = (uint8_t)ft_prng_next(&state);
        sFrameCduSend.cntDataItem5 = (uint8_t)ft_prng_next(&state);
        sFrameCduSend.cntDataItem8 = (uint8_t)ft_prng_next(&state);
        sFrameCduSend.cntDataItem9 = (uint8_t)ft_prng_next(&state);
        sFrameCduSend.cntDataItem10 = (uint8_t)ft_prng_next(&state);

        uint64_t inputs[28] = {
            sWalkSendData.WIFIreleaseFlag, sWalkSendData.FWSafeIF,
            sWalkSendData.PathPlanFlag, sWalkSendData.MoveNum,
            ft_bits64(sWalkSendData.SlopeAgl1), ft_bits64(sWalkSendData.SlopeAgl2),
            ft_bits64(sWalkSendData.d), ft_bits64(sWalkSendData.TurnAgl),
            flags[0], flags[1], flags[2], flags[3], flags[4], flags[5],
            sAlignToSmu.SMUWIFIreleaseFlag, sAlignToSmu.SMUFWSafeIF,
            sAlignToSmu.SMUPathPlanFlag, sAlignToSmu.SMUMoveNum,
            ft_bits64(sAlignToSmu.SMUSlopeAgl1), ft_bits64(sAlignToSmu.SMUSlopeAgl2),
            ft_bits64(sAlignToSmu.SMUd), ft_bits64(sAlignToSmu.SMUTurnAgl),
            sFrameCduSend.cntDataItem3, sFrameCduSend.cntDataItem4,
            sFrameCduSend.cntDataItem5, sFrameCduSend.cntDataItem8,
            sFrameCduSend.cntDataItem9, sFrameCduSend.cntDataItem10
        };

        CDUToSMUAlign();

        printf("%" PRIu64, inputs[0]);
        for (int i = 1; i < 28; ++i) print_u64(inputs[i]);
        print_u64(sAlignToSmu.SMUWIFIreleaseFlag);
        print_u64(sAlignToSmu.SMUFWSafeIF);
        print_u64(sAlignToSmu.SMUPathPlanFlag);
        print_u64(sAlignToSmu.SMUMoveNum);
        print_u64(ft_bits64(sAlignToSmu.SMUSlopeAgl1));
        print_u64(ft_bits64(sAlignToSmu.SMUSlopeAgl2));
        print_u64(ft_bits64(sAlignToSmu.SMUd));
        print_u64(ft_bits64(sAlignToSmu.SMUTurnAgl));
        print_u64(sAlignToSmu.bFWSafeIF);
        print_u64(sAlignToSmu.bPathPlanFlag);
        print_u64(sAlignToSmu.bMoveNum);
        print_u64(sAlignToSmu.bSlopeAgl1);
        print_u64(sAlignToSmu.bSlopeAgl2);
        print_u64(sAlignToSmu.bDAndTheta);
        print_u64(sFrameCduSend.cntDataItem3);
        print_u64(sFrameCduSend.cntDataItem4);
        print_u64(sFrameCduSend.cntDataItem5);
        print_u64(sFrameCduSend.cntDataItem8);
        print_u64(sFrameCduSend.cntDataItem9);
        print_u64(sFrameCduSend.cntDataItem10);
        putchar('\n');
    }
    return 0;
}
