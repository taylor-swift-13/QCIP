#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttProcWalk/IP_AttProcWalk.h"

struct { double cfbn[3][3]; } sNaviData;

static double stub_angles[3];
static uint32_t c2_calls, yaw_calls, tan_calls, sqrt_calls, atan_calls, pointer_ok;

void C2Angle321(double *out, const double *matrix)
{
    ++c2_calls; pointer_ok &= out != NULL && matrix == &sNaviData.cfbn[0][0];
    VectorEval3(out, stub_angles);
}
double YawConvert(double value, double origin) { ++yaw_calls; return value + origin; }
static double ft_tan_identity(double value) { ++tan_calls; return value; }
static double ft_sqrt_identity(double value) { ++sqrt_calls; return value; }
static double ft_atan_identity(double value) { ++atan_calls; return value; }
#define Tanx(x) ft_tan_identity((x))
#undef Sqrtx
#define Sqrtx(x) ft_sqrt_identity((x))
#define Atanx(x) ft_atan_identity((x))

#include "../../../../INPUT/orbiter-new/AttProcWalk/IP_AttProcWalk.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint64_t bits[4];
        for (uint32_t i = 0; i < 4u; ++i) {
            double v = ft_prng_finite(&state, 2.0);
            bits[i] = ft_bits64(v);
        }
        uint32_t ait = (uint32_t)(row & 1u);
        for (uint32_t i = 0; i < 3u; ++i) stub_angles[i] = ft_from_bits64(bits[i]);
        sWalkAttData.InitialYaw = ft_from_bits64(bits[3]);
        sWalkInstrDemandData.SocAITTestFlag = ait;
        c2_calls = yaw_calls = tan_calls = sqrt_calls = atan_calls = 0; pointer_ok = 1;

        printf("%" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu32,
               bits[0], bits[1], bits[2], bits[3], ait);
        AttProcWalk();
        printf(" %" PRIu64 " %" PRIu64 " %" PRIu64,
               ft_bits64(sWalkAttData.y_b), ft_bits64(sWalkAttData.r_b), ft_bits64(sWalkAttData.p_b));
        printf(" %" PRIu64 " %" PRIu64 " %" PRIu64,
               ft_bits64(sWalkSendData.y_fyq), ft_bits64(sWalkSendData.r_fyq), ft_bits64(sWalkSendData.p_fyq));
        printf(" %" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64,
               ft_bits64(sWalkModeData.Teleyb), ft_bits64(sWalkModeData.Telerb),
               ft_bits64(sWalkModeData.Telepb), ft_bits64(sWalkModeData.AttBaseBoard));
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 "\n",
               c2_calls, yaw_calls, tan_calls, sqrt_calls, atan_calls, pointer_ok);
    }
    return 0;
}
