/* Differential driver for the extracted original CS_OrbitComputationFun.
 * OrbitCalculate and SunEphemerisCalculate are unavailable-component
 * boundaries in this test and are observed as calls. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_OrbitComputation.h"

static unsigned int orbit_calls, sun_calls, c2q_calls, rz_calls;
void OrbitCalculate(void *p) { (void)p; ++orbit_calls; }
void SunEphemerisCalculate(void *p) { (void)p; ++sun_calls; }
void C2Q(double *q, const double *m) { (void)q; (void)m; ++c2q_calls; }
void Rz(double *m, double angle) { (void)m; (void)angle; ++rz_calls; }
void f_Fun_Null(void) {}
void Memcpyx(unsigned char *d, const unsigned char *s, unsigned int n)
{ memcpy(d, s, n); }

static uint64_t bits(double x)
{
	uint64_t b; memcpy(&b, &x, sizeof b); return b;
}
static uint64_t rng_state;
static uint64_t rng64(void)
{
	uint64_t x = rng_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rng_state = x;
	return x * UINT64_C(2685821657736338717);
}
static double unit(void) { return (double)(rng64() >> 11) * 0x1.0p-53; }
static double range(double lo, double hi) { return lo + unit() * (hi - lo); }

static void run_one(double star, double t0, double limit, double w0,
		double lmdg, double earth_rate, unsigned int wm,
		unsigned int abnormal, unsigned int old_count)
{
	CS_OrbitComputation ip;
	unsigned int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = wm;
	ip.m_starTime_Next = star;
	ip.pOrbPara.t0 = t0;
	ip.csOrbInjChkPara_Lmt_dT = limit;
	ip.pOrbData.w0 = w0;
	ip.pOrbPara.lmdg = lmdg;
	ip.pOCP_We = earth_rate;
	ip.pOrbData.F_OrbAbnorm = abnormal;
	ip.csOrbitErrJData_Cnt_NoOrb = old_count;
	ip.csOrbitErrJPara_Num_NoOrb = UINT32_MAX;
	ip.csOrbOtherPara_FP_WoPrecession = 0;
	ip.csOrbOtherPara_FP_OrbUpdate[wm] = 0;
	ip.csOrbDataOther_F_DTOrbitEUpdate = 0;
	orbit_calls = sun_calls = c2q_calls = rz_calls = 0;

	printf("%llu %llu %llu %llu %llu %llu %u %u %u",
		(unsigned long long)bits(star), (unsigned long long)bits(t0),
		(unsigned long long)bits(limit), (unsigned long long)bits(w0),
		(unsigned long long)bits(lmdg), (unsigned long long)bits(earth_rate),
		wm, abnormal, old_count);
	CS_OrbitComputationFun(&ip);
	printf(" %u %u %u", ip.pObtOut_FV, ip.pObtOut_FV_NoInsert,
		ip.csOrbitErrJData_Cnt_NoOrb);
	for (i = 0; i < 3; ++i)
		printf(" %llu", (unsigned long long)bits(ip.pOrbData.w0i[i]));
	printf(" %llu %u %u %u %u\n", (unsigned long long)bits(ip.pOrbData.lmdG),
		orbit_calls, sun_calls, c2q_calls, rz_calls);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0)
		: UINT64_C(0xa4093822299f31d0);
	long i;
	rng_state = seed ? seed : 1;

	/* Valid, exact 0.7 threshold, exact full threshold, abnormal and modes 8/9. */
	run_one(0.0, 0.0, 1.0, 0.001, 0.1, 0.00007292115, 0, 1, 4);
	run_one(0.7, 0.0, 1.0, 0.002, -0.2, 0.00007292115, 1, 1, 5);
	run_one(1.0, 0.0, 1.0, 0.003, 0.3, 0.00007292115, 2, 1, 6);
	run_one(-1.0, 0.0, 1.0, 0.004, -0.4, 0.00007292115, 3, 1, 7);
	run_one(0.0, 0.0, 1.0, 0.005, 0.5, 0.00007292115, 4, 0, 8);
	run_one(2.0, 0.0, 1.0, 0.006, -0.6, 0.00007292115, 8, 1, 9);
	run_one(2.0, 0.0, 1.0, 0.007, 0.7, 0.00007292115, 9, 1, 10);

	for (i = 0; i < n; ++i) {
		double t0 = range(-100.0, 100.0);
		double limit = range(0.05, 10.0);
		double delta = range(-1.5 * limit, 1.5 * limit);
		run_one(t0 + delta, t0, limit, range(0.0001, 0.02),
			range(-3.0, 3.0), range(0.00005, 0.00009),
			(unsigned int)(rng64() % 14), (unsigned int)(rng64() & 1),
			(unsigned int)(rng64() % 100));
	}
	return 0;
}
