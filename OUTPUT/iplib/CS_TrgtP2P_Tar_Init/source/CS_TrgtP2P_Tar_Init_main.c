/* Differential-test driver for the original IP_CS_TrgtP2P_Tar_Init.c. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_TrgtP2P_Tar_Init.h"

unsigned int m_WorkMode;
static unsigned int sub_calls;
static unsigned int null_calls;

void CS_TrgtP2P_Ini_Sub(void) { ++sub_calls; }
void f_Fun_Null(void) { ++null_calls; }

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

static void run_one(uint32_t mode, uint32_t wm, const uint32_t seq[14],
                    const double angles[3], const double cso[9],
                    const double cro_initial[9])
{
	CS_TrgtP2P_Tar_Init ip;
	int i;
	memset(&ip, 0, sizeof ip);
	ip.csMnvData_F_MnvNextMode = mode;
	ip.m_WorkMode = wm;
	m_WorkMode = wm;
	for (i = 0; i < 14; ++i) ip.csAttPara_Seq_AttD[i] = seq[i];
	memcpy(ip.csMnvData_A_Trgt, angles, 3 * sizeof(double));
	memcpy(&ip.csMnvData_Cso[0][0], cso, 9 * sizeof(double));
	memcpy(&ip.csAttCoreData_Cro[0][0], cro_initial, 9 * sizeof(double));
	sub_calls = 0;
	null_calls = 0;
	CS_TrgtP2P_Tar_InitFun(&ip);

	printf("%u %u", mode, wm);
	for (i = 0; i < 14; ++i) printf(" %u", seq[i]);
	for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)dbits(angles[i]));
	for (i = 0; i < 9; ++i) printf(" %llu", (unsigned long long)dbits(cso[i]));
	for (i = 0; i < 9; ++i) printf(" %llu", (unsigned long long)dbits(cro_initial[i]));
	for (i = 0; i < 9; ++i)
		printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_Cro[0][i]));
	printf(" %u %u\n", sub_calls, null_calls);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : UINT64_C(0x8f3b21d49a765c01);
	uint32_t seq[14];
	double angles[3], cso[9], cro0[9];
	long i;
	int j;
	rng_state = seed ? seed : 1;

	for (j = 0; j < 14; ++j) seq[j] = 321;
	for (j = 0; j < 3; ++j) angles[j] = (double)(j + 1) * 0.125;
	for (j = 0; j < 9; ++j) {
		cso[j] = (double)(j - 4) * 0.25;
		cro0[j] = (double)(9 - j) * -0.125;
	}

	/* Four top-level branches. */
	run_one(1, 0, seq, angles, cso, cro0);
	run_one(3, 0, seq, angles, cso, cro0);
	run_one(0, 0, seq, angles, cso, cro0);
	run_one(99, 0, seq, angles, cso, cro0);

	/* All six Angle2C branches plus its default->321 branch. */
	for (j = 0; j < 6; ++j) {
		seq[j] = seq_pool[j];
		angles[0] = 0.2 + 0.03 * j;
		angles[1] = -0.4 + 0.02 * j;
		angles[2] = 0.6 - 0.01 * j;
		run_one(2, (uint32_t)j, seq, angles, cso, cro0);
	}
	seq[0] = 999;
	run_one(2, 0, seq, angles, cso, cro0);

	for (i = 0; i < n; ++i) {
		uint32_t mode_pool[4] = {1, 2, 3, 7};
		uint32_t mode = mode_pool[rng64() % 4];
		uint32_t wm = (uint32_t)(rng64() % 14);
		for (j = 0; j < 14; ++j)
			seq[j] = (rng64() % 25 == 0) ? 999u : seq_pool[rng64() % 6];
		for (j = 0; j < 3; ++j) angles[j] = range(-3.141592653589793, 3.141592653589793);
		for (j = 0; j < 9; ++j) {
			cso[j] = range(-2.0, 2.0);
			cro0[j] = range(-2.0, 2.0);
		}
		run_one(mode, wm, seq, angles, cso, cro0);
	}
	return 0;
}
