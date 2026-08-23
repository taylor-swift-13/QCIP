#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttDeterWalkMode/IP_AttDeterWalkMode.h"

static unint32 heavy_helper_calls;

void C2Q(float64 *out, const float64 *in)
{
    (void)in; ++heavy_helper_calls; VectorZero(out, 4);
}
void QMulti(float64 *out, const float64 *a, const float64 *b)
{
    (void)a; (void)b; ++heavy_helper_calls; VectorZero(out, 4);
}
void QUnit(float64 *q) { (void)q; ++heavy_helper_calls; }
void Q2C(float64 *out, const float64 *q)
{
    (void)q; ++heavy_helper_calls; MatrixZero(out, 3, 3);
}
void MatrixMultiScalar(float64 *out, const float64 *in, float64 scale,
                       unint32 rows, unint32 cols)
{
    ++heavy_helper_calls;
    for (unint32 i = 0; i < rows * cols; ++i) out[i] = in[i] * scale;
}
void MatrixMulti(float64 *out, const float64 *a, const float64 *b,
                 unint32 rows, unint32 inner, unint32 cols)
{
    (void)a; (void)b; (void)inner; ++heavy_helper_calls;
    MatrixZero(out, rows, cols);
}
void Q2Ksi(float64 *out, const float64 *q)
{
    (void)q; ++heavy_helper_calls; MatrixZero(out, 4, 3);
}
void DivNorm(float64 *out, const float64 *in, unint32 n)
{
    ++heavy_helper_calls; VectorEval(out, in, n);
}
void MatrixExtractRow(float64 *out, const float64 *in,
                      unint32 rows, unint32 cols, unint32 row)
{
    (void)rows; ++heavy_helper_calls;
    for (unint32 i = 0; i < cols; ++i) out[i] = in[row * cols + i];
}
void MatrixExtractColumn(float64 *out, const float64 *in,
                         unint32 rows, unint32 cols, unint32 col)
{
    (void)cols; ++heavy_helper_calls;
    for (unint32 i = 0; i < rows; ++i) out[i] = in[i * cols + col];
}
void MatrixInv33(float64 *out, const float64 *in)
{
    (void)in; ++heavy_helper_calls; MatrixZero(out, 3, 3);
}

#define IP_ATTDETERSTSGYRO_H
#include "../../../../INPUT/orbiter-new/AttDeterStsGyro/IP_AttDeterStsGyro.c"

static void configure_residuals(uint64_t *state, unint32 bz4,
                                unint32 iner, unint32 residual_case)
{
    if (iner == 0) {
        for (unint32 i = 0; i < 3; ++i) {
            sStsDataCom.deltaZrOld[i] = ft_prng_finite(state, 4.0);
            sStsDataCom.deltaZr[i] = ft_prng_finite(state, 4.0);
        }
    } else if (bz4 == 0) {
        sStsDataCom.deltaZrOld[0] = residual_case == 0 ? 0.0 : 1.0;
        sStsDataCom.deltaZrOld[1] = 0.0;
        sStsDataCom.deltaZrOld[2] = 0.0;
        for (unint32 i = 0; i < 3; ++i)
            sStsDataCom.deltaZr[i] = ft_prng_finite(state, 4.0);
    } else if (residual_case == 0) {
        for (unint32 i = 0; i < 3; ++i) {
            float64 value = ft_prng_finite(state, 4.0);
            sStsDataCom.deltaZrOld[i] = value;
            sStsDataCom.deltaZr[i] = value;
        }
    } else {
        sStsDataCom.deltaZrOld[0] = 2.0;
        sStsDataCom.deltaZrOld[1] = 0.0;
        sStsDataCom.deltaZrOld[2] = 0.0;
        sStsDataCom.deltaZr[0] = 0.0;
        sStsDataCom.deltaZr[1] = 0.0;
        sStsDataCom.deltaZr[2] = 0.0;
    }
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);

    for (unsigned long row = 0; row < count; ++row) {
        unint32 bz4 = (unint32)(ft_prng_next(&state) & UINT64_C(1));
        unint32 iner = (unint32)(ft_prng_next(&state) & UINT64_C(1));
        unint32 residual_case = (unint32)(ft_prng_next(&state) & UINT64_C(1));
        unint32 initial_count = iner ? 0u : (unint32)(ft_prng_next(&state) % UINT64_C(6));

        configure_residuals(&state, bz4, iner, residual_case);
        sGncCtrlFlag.BZ1 = UINT32_C(99);
        sGncCtrlFlag.BZ2 = 0;
        sGncCtrlFlag.BZ4 = bz4;
        sGncCtrlFlag.ZT9 = 0;
        sGncCtrlFlag.bInerAtt = iner;
        sWalkModeData.STWalkFlg = 0;
        sStsDataCom.cntDeltaZr = initial_count;
        sStsProcParam.deltaZrMax = 1.0;
        heavy_helper_calls = 0;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               bz4, iner, residual_case, initial_count);
        for (unint32 i = 0; i < 3; ++i)
            printf(" %" PRIu64, ft_bits64(sStsDataCom.deltaZrOld[i]));
        for (unint32 i = 0; i < 3; ++i)
            printf(" %" PRIu64, ft_bits64(sStsDataCom.deltaZr[i]));

        AttDeterStsGyro();

        for (unint32 i = 0; i < 3; ++i)
            printf(" %" PRIu64, ft_bits64(sStsDataCom.deltaZr[i]));
        for (unint32 i = 0; i < 3; ++i)
            printf(" %" PRIu64, ft_bits64(sStsDataCom.deltaZrOld[i]));
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               sGncCtrlFlag.bInerAtt, sStsDataCom.cntDeltaZr,
               heavy_helper_calls);
    }
    return 0;
}
