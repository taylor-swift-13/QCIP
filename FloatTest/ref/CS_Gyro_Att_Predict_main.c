#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "CS_Gyro_Att_Predict_stubs.h"
#include "IP_CS_Gyro_Att_Predict.h"

double LimitDouble(double value, double bound)
{ return value > bound ? bound : (value < -bound ? -bound : value); }
float ModPNHP(float value, float halfperiod)
{ (void)halfperiod; return value; }
static void identity(double *out)
{
    for (unsigned i = 0; i < 9u; ++i)
        out[i] = i % 4u == 0 ? 1.0 : 0.0;
}
#define ANGLE_STUB(name) \
    void name(double *out, double a, double b, double c) \
    { (void)a; (void)b; (void)c; identity(out); }
ANGLE_STUB(Angle2C123)
ANGLE_STUB(Angle2C132)
ANGLE_STUB(Angle2C213)
ANGLE_STUB(Angle2C231)
ANGLE_STUB(Angle2C312)
ANGLE_STUB(Angle2C321)
#define RATE_STUB(name) \
    void name(double *out, const double *a, const double *w) \
    { (void)a; (void)w; out[0] = out[1] = out[2] = 0.0; }
RATE_STUB(w2dAngle123)
RATE_STUB(w2dAngle132)
RATE_STUB(w2dAngle213)
RATE_STUB(w2dAngle231)
RATE_STUB(w2dAngle312)
RATE_STUB(w2dAngle321)
void MatrixMulti(double *out, const double *a, const double *b,
                 uint32_t rows, uint32_t inner, uint32_t cols)
{
    (void)cols;
    for (uint32_t i = 0; i < rows; ++i) {
        out[i] = 0.0;
        for (uint32_t k = 0; k < inner; ++k)
            out[i] += a[i * inner + k] * b[k];
    }
}

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 36u;
    for (unsigned n = 0; n < count; ++n) {
        CS_Gyro_Att_Predict x = {0};
        x.m_WorkMode = n % 14u;
        x.csAttPara_Seq_AttD[x.m_WorkMode] = 999u; /* invalid sequence */
        x.m_DeltaT = 0.125 + (double)(n % 5u) * 0.0625;
        x.csGyroPara_Mlfw = 0.25 + (double)(n % 4u) * 0.125;
        for (unsigned i = 0; i < 3u; ++i) {
            x.csGyroData_deltag[i] =
                ((double)(int)(n * 7u + i * 5u) - 80.0) * 0.00390625;
            x.csGyroData_D0_ESCorr[i] =
                ((double)(int)(n * 3u + i * 11u) - 50.0) * 0.015625;
            x.csGyroData_De_ESCorr[i] =
                ((double)(int)(n * 13u + i * 2u) - 60.0) * 0.0078125;
            x.csOrbData_w0i[i] =
                ((double)(int)(n * 5u + i * 17u) - 70.0) * 0.001953125;
            x.csGyroPara_MlfA_ESG[i][x.m_WorkMode] = 10.0;
        }
        for (unsigned group = 0; group < 4u; ++group) {
            double *values = group == 0 ? x.csGyroData_deltag :
                             group == 1 ? x.csGyroData_D0_ESCorr :
                             group == 2 ? x.csGyroData_De_ESCorr :
                                          x.csOrbData_w0i;
            for (unsigned i = 0; i < 3u; ++i)
                printf("%llu ", (unsigned long long)bits_of_double(values[i]));
        }
        printf("%llu %llu ",
               (unsigned long long)bits_of_double(x.m_DeltaT),
               (unsigned long long)bits_of_double(x.csGyroPara_Mlfw));
        CS_Gyro_Att_PredictFun(&x);
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_w_ESG[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_wbo_ESG[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_A_ESG[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_Rate_ESG[i]));
        for (unsigned i = 0; i < 9u; ++i)
            printf("%llu%c", (unsigned long long)bits_of_double(x.csAttCoreData_Cbo_ESG[0][i]),
                   i == 8u ? '\n' : ' ');
    }
    return 0;
}
