#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CentroidAndInertiaEst/IP_CentroidAndInertiaEst.h"

struct { double w8[3], oldw8[3], w[3]; } sGyroData;
struct { double F285; } sThruCtrl;

#include "../../../../INPUT/orbiter-new/CentroidAndInertiaEst/IP_CentroidAndInertiaEst.c"

static void identity(double *m)
{
    for (uint32_t i = 0; i < 9u; ++i) m[i] = i == 0u || i == 4u || i == 8u ? 1.0 : 0.0;
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint64_t bits[12];
        for (uint32_t i = 0; i < 12u; ++i) bits[i] = ft_bits64(ft_prng_finite(&state, 5.0));
        sBodyData.mass = ft_from_bits64(bits[0]); sAttiModifyParam.mass0 = ft_from_bits64(bits[1]);
        for (uint32_t r = 0; r < 4u; ++r) {
            sAttiModifyParam.para[r][0] = ft_from_bits64(bits[2]);
            sAttiModifyParam.para[r][1] = ft_from_bits64(bits[3]);
            sAttiModifyParam.para[r][2] = ft_from_bits64(bits[4]);
        }
        sAttiModifyParam.Ixy = ft_from_bits64(bits[5]);
        sAttiModifyParam.Ixz = ft_from_bits64(bits[6]);
        sAttiModifyParam.Iyz = ft_from_bits64(bits[7]);
        sAttiModifyParam.ygo0 = ft_from_bits64(bits[8]);
        sAttiModifyParam.zgo0 = ft_from_bits64(bits[9]);
        sBodyData.ygo = ft_from_bits64(bits[10]); sBodyData.zgo = ft_from_bits64(bits[11]);
        memset(&sGyroData, 0, sizeof sGyroData); memset(sBodyData.HtotalP, 0, sizeof sBodyData.HtotalP);
        identity(&sAttiModifyParam.cBF[0][0]);
        sGncCtrlFlag.UseZT2 = sGncCtrlFlag.UseZT3 = sGncCtrlFlag.ZT10 = 0;
        sGncCtrlFlag.BZ1 = 0; sThruCtrl.F285 = 1.0;

        for (uint32_t i = 0; i < 12u; ++i) printf(i ? " %" PRIu64 : "%" PRIu64, bits[i]);
        CentroidAndInertiaEst();
        printf(" %" PRIu64, ft_bits64(sBodyData.hgo));
        for (uint32_t i = 0; i < 9u; ++i) printf(" %" PRIu64, ft_bits64((&sBodyData.Jb[0][0])[i]));
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu64, ft_bits64(sBodyData.pgoF[i]));
        printf(" %" PRIu64 " %" PRIu64 "\n", ft_bits64(sBodyData.ygo), ft_bits64(sBodyData.zgo));
    }
    return 0;
}
