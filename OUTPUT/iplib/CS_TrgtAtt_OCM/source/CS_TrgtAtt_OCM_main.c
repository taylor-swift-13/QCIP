/* Differential-test driver for the original IP_CS_TrgtAtt_OCM.c. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_TrgtAtt_OCM.h"

unsigned int m_WorkMode;
static unsigned int track_calls;
void CS_Track_Atti(void) { ++track_calls; }

void Angle2C321(double *, double, double, double);

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }
static uint64_t rng_state;
static uint64_t rng64(void)
{
	uint64_t x = rng_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rng_state = x;
	return x * UINT64_C(2685821657736338717);
}
static double uniform01(void) { return (double)(rng64() >> 11) * 0x1.0p-53; }
static double range(double lo, double hi) { return lo + uniform01() * (hi - lo); }
static const uint32_t seq_pool[6] = {123, 132, 213, 231, 312, 321};

static void run_one(uint32_t wm, const uint32_t seq[14], const double atr[3],
                    const double cb[9], const double coi[9], const double w0i[3])
{
	CS_TrgtAtt_OCM ip;
	int i;
	memset(&ip, 0, sizeof ip);
	m_WorkMode = wm;
	ip.m_WorkMode = wm;
	for (i = 0; i < 14; ++i) ip.csAttPara_Seq_AttD[i] = seq[i];
	memcpy(ip.csMnvData_A_Trgt, atr, 3 * sizeof(double));
	memcpy(&ip.csAttCoreData_Cbiasp[0][0], cb, 9 * sizeof(double));
	memcpy(&ip.csOrbData_coi[0][0], coi, 9 * sizeof(double));
	memcpy(ip.csOrbData_w0i, w0i, 3 * sizeof(double));
	track_calls = 0;
	CS_TrgtAtt_OCMFun(&ip);

	printf("%u", wm);
	for (i = 0; i < 14; ++i) printf(" %u", seq[i]);
	for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)dbits(atr[i]));
	for (i = 0; i < 9; ++i) printf(" %llu", (unsigned long long)dbits(cb[i]));
	for (i = 0; i < 9; ++i) printf(" %llu", (unsigned long long)dbits(coi[i]));
	for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)dbits(w0i[i]));
	for (i = 0; i < 9; ++i) printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_Cro[0][i]));
	for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_wri[i]));
	for (i = 0; i < 4; ++i) printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_qri[i]));
	for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_wro[i]));
	printf(" %u\n", track_calls);
}

static void build_dcm(double a1, double a2, double a3, double out[9])
{
	Angle2C321(out, a1, a2, a3);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : UINT64_C(0x6d50b9713af42ce5);
	uint32_t seq[14];
	double atr[3], cb[9], coi[9], w0i[3];
	double ident[9] = {1, 0, 0, 0, 1, 0, 0, 0, 1};
	long i;
	int j;
	rng_state = seed ? seed : 1;

	for (j = 0; j < 14; ++j) seq[j] = 321;
	for (j = 0; j < 6; ++j) {
		seq[j] = seq_pool[j];
		atr[0] = 0.15 + 0.03 * j; atr[1] = -0.25 + 0.02 * j; atr[2] = 0.35 - 0.01 * j;
		w0i[0] = 0.001; w0i[1] = -0.002; w0i[2] = 0.003;
		run_one((uint32_t)j, seq, atr, ident, ident, w0i);
	}
	/* Four C2Q branches, using physical DCMs. */
	atr[0] = 0.0; atr[1] = 0.0; atr[2] = 0.0;
	w0i[0] = 0.01; w0i[1] = 0.02; w0i[2] = -0.03;
	build_dcm(0.0, 0.0, 0.0, cb);
	run_one(0, seq, atr, cb, ident, w0i);
	build_dcm(3.141592653589793, 0.0, 0.0, coi); run_one(0, seq, atr, cb, coi, w0i);
	build_dcm(0.0, 3.141592653589793, 0.0, coi); run_one(0, seq, atr, cb, coi, w0i);
	build_dcm(0.0, 0.0, 3.141592653589793, coi); run_one(0, seq, atr, cb, coi, w0i);
	seq[0] = 999; run_one(0, seq, atr, ident, ident, w0i);

	for (i = 0; i < n; ++i) {
		uint32_t wm = (uint32_t)(rng64() % 14);
		for (j = 0; j < 14; ++j) seq[j] = seq_pool[rng64() % 6];
		if (rng64() % 40 == 0) seq[wm] = 999;
		for (j = 0; j < 3; ++j) atr[j] = range(-3.141592653589793, 3.141592653589793);
		build_dcm(range(-3.141592653589793, 3.141592653589793),
		          range(-3.141592653589793, 3.141592653589793),
		          range(-3.141592653589793, 3.141592653589793), cb);
		build_dcm(range(-3.141592653589793, 3.141592653589793),
		          range(-3.141592653589793, 3.141592653589793),
		          range(-3.141592653589793, 3.141592653589793), coi);
		for (j = 0; j < 3; ++j) w0i[j] = range(-0.1, 0.1);
		run_one(wm, seq, atr, cb, coi, w0i);
	}
	return 0;
}
