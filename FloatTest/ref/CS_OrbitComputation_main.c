#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_OrbitComputation.h"

void OrbitCalculate(void *p) { (void)p; }
void SunEphemerisCalculate(void *p) { (void)p; }
void C2Q(double *q, const double *matrix) { (void)q; (void)matrix; }
void f_Fun_Null(void) {}
void Memcpyx(unsigned char *destination, const unsigned char *source,
             unsigned count)
{ memcpy(destination, source, count); }
void Rz(double *matrix, double angle)
{
    (void)angle;
    for (unsigned i = 0; i < 9u; ++i)
        matrix[i] = i % 4u == 0 ? 1.0 : 0.0;
}

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 30u;
    for (unsigned n = 0; n < count; ++n) {
        CS_OrbitComputation x = {0};
        x.m_WorkMode = n % 12u;
        x.m_starTime_Next = -4.0 + (double)n * 0.25;
        x.pOrbPara.t0 = -2.0 + (double)(n % 7u) * 0.125;
        x.csOrbInjChkPara_Lmt_dT =
            0.5 + (double)(n % 5u) * 0.125;
        x.pOrbData.w0 =
            0.001 + (double)(n % 9u) * 0.000125;
        x.pOrbPara.lmdg =
            -0.25 + (double)(n % 11u) * 0.03125;
        x.pOCP_We = 0.00007292115;
        x.pOrbData.F_OrbAbnorm = n % 6u == 0 ? 0u : 1u;
        x.csOrbitErrJData_Cnt_NoOrb = n % 4u;
        x.csOrbitErrJPara_Num_NoOrb = 1000u;
        x.csOrbOtherPara_FP_WoPrecession = 0u;
        x.csOrbOtherPara_FP_OrbUpdate[x.m_WorkMode] = 0u;
        x.csOrbDataOther_F_DTOrbitEUpdate = 0u;
        printf("%llu %llu %llu %llu %llu %llu %u %u %u ",
               (unsigned long long)bits_of_double(x.m_starTime_Next),
               (unsigned long long)bits_of_double(x.pOrbPara.t0),
               (unsigned long long)bits_of_double(x.csOrbInjChkPara_Lmt_dT),
               (unsigned long long)bits_of_double(x.pOrbData.w0),
               (unsigned long long)bits_of_double(x.pOrbPara.lmdg),
               (unsigned long long)bits_of_double(x.pOCP_We),
               x.m_WorkMode, x.pOrbData.F_OrbAbnorm,
               x.csOrbitErrJData_Cnt_NoOrb);
        CS_OrbitComputationFun(&x);
        printf("%u %u %u ", x.pObtOut_FV, x.pObtOut_FV_NoInsert,
               x.csOrbitErrJData_Cnt_NoOrb);
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.pOrbData.w0i[i]));
        printf("%llu\n", (unsigned long long)bits_of_double(x.pOrbData.lmdG));
    }
    return 0;
}
