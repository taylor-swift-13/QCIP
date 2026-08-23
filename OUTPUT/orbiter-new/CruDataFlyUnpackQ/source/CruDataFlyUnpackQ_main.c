#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttDeterWalkMode/IP_AttDeterWalkMode.h"
#include "../../../../INPUT/orbiter-new/CruDataFlyUnpackQ/IP_CruDataFlyUnpackQ.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double inputs[12];
        for (int i = 0; i < 12; ++i) inputs[i] = ft_prng_finite(&state, 0.8);
        if (row == 0u) for (int i = 0; i < 12; ++i) inputs[i] = 0.0;
        if (row == 1u) { inputs[0] = 1.0; inputs[1] = inputs[2] = 0.0; }
        if (row == 2u) { inputs[3] = 0.5; inputs[4] = -0.5; inputs[5] = 0.5; }

        memcpy(&sAttiData.q.q4[0], &inputs[0], 3 * sizeof(double));
        memcpy(&sAttiData.q0.q4[0], &inputs[3], 3 * sizeof(double));
        memcpy(&sAttiData.qGI.q4[0], &inputs[6], 3 * sizeof(double));
        memcpy(&sNaviParam.qME[0], &inputs[9], 3 * sizeof(double));
        sAttiData.q.q4[3] = sAttiData.q0.q4[3] = -99.0;
        sAttiData.qGI.q4[3] = sNaviParam.qME[3] = -99.0;

        CruDataFlyUnpackQ();

        printf("%" PRIu64, ft_bits64(inputs[0]));
        for (int i = 1; i < 12; ++i) printf(" %" PRIu64, ft_bits64(inputs[i]));
        printf(" %" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64 "\n",
               ft_bits64(sAttiData.q.q4[3]), ft_bits64(sAttiData.q0.q4[3]),
               ft_bits64(sAttiData.qGI.q4[3]), ft_bits64(sNaviParam.qME[3]));
    }
    return 0;
}
