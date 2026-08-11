/* Differential-test driver for the original IP_CS_Track_Atti.c.
 * The repository has no C2Angle* implementation.  Those six functions are
 * explicit observed stubs: each copies the injected angle triple and records
 * which dispatch branch was called.  All downstream w2dEuler/trig, derivative,
 * matrix torque, norm-limit, and state-copy code is the unmodified IP source. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_Track_Atti.h"

static double injected_angles[3];
static unsigned int c2angle_tag;

static void c2angle_stub(double *out, unsigned int tag)
{
	memcpy(out, injected_angles, sizeof injected_angles);
	c2angle_tag = tag;
}
void C2Angle123(double *out, const double *m) { (void)m; c2angle_stub(out, 123); }
void C2Angle132(double *out, const double *m) { (void)m; c2angle_stub(out, 132); }
void C2Angle213(double *out, const double *m) { (void)m; c2angle_stub(out, 213); }
void C2Angle231(double *out, const double *m) { (void)m; c2angle_stub(out, 231); }
void C2Angle312(double *out, const double *m) { (void)m; c2angle_stub(out, 312); }
void C2Angle321(double *out, const double *m) { (void)m; c2angle_stub(out, 321); }

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

static void print_bits(const double *xs, int n)
{
	int i;
	for (i = 0; i < n; ++i) printf(" %llu", (unsigned long long)dbits(xs[i]));
}

static void run_one(uint32_t wm, const uint32_t seq[14], const double angles[3],
                    const double wro[3], const double wri[3], const double da0[3],
                    const double da_prev[3], const double wri_prev[3], double dt,
                    const double inertia[9], double mdf, double mlf)
{
	CS_Track_Atti ip;
	int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = wm;
	for (i = 0; i < 14; ++i) ip.csAttPara_Seq_AttD[i] = seq[i];
	memcpy(injected_angles, angles, sizeof injected_angles);
	memcpy(ip.csAttCoreData_wro, wro, 3 * sizeof(double));
	memcpy(ip.csAttCoreData_wri, wri, 3 * sizeof(double));
	memcpy(ip.csMnvData_dA_Ref, da0, 3 * sizeof(double));
	memcpy(ip.csMnvData_dA_Ref_Lst, da_prev, 3 * sizeof(double));
	memcpy(ip.csAttCoreData_wri_Lst, wri_prev, 3 * sizeof(double));
	ip.m_DeltaT = dt;
	memcpy(&ip.csCtrlerData_Js_Use[0][0], inertia, 9 * sizeof(double));
	ip.csCtrlerOtherPara_Mdf_TorqRef = mdf;
	ip.csCtrlerOtherPara_Mlf_TorqRef = mlf;
	c2angle_tag = 0;
	CS_Track_AttiFun(&ip);

	printf("%u", wm);
	for (i = 0; i < 14; ++i) printf(" %u", seq[i]);
	print_bits(angles, 3); print_bits(wro, 3); print_bits(wri, 3);
	print_bits(da0, 3); print_bits(da_prev, 3); print_bits(wri_prev, 3);
	printf(" %llu", (unsigned long long)dbits(dt));
	print_bits(inertia, 9);
	printf(" %llu %llu", (unsigned long long)dbits(mdf), (unsigned long long)dbits(mlf));
	print_bits(ip.csMnvData_A_Ref, 3);
	print_bits(ip.csMnvData_dA_Ref, 3);
	print_bits(ip.csMnvData_ddA_Ref, 3);
	print_bits(ip.csMnvData_TorqRef, 3);
	print_bits(ip.csMnvData_dA_Ref_Lst, 3);
	print_bits(ip.csAttCoreData_wri_Lst, 3);
	printf(" %u\n", c2angle_tag);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : UINT64_C(0x3976a4c82d1be50f);
	uint32_t seq[14];
	double angles[3], wro[3], wri[3], da0[3], da_prev[3], wri_prev[3], inertia[9];
	long i;
	int j;
	rng_state = seed ? seed : 1;
	for (j = 0; j < 14; ++j) seq[j] = 321;
	for (j = 0; j < 3; ++j) {
		angles[j] = 0.2 * (j + 1);
		wro[j] = 0.03 * (j - 1);
		wri[j] = 0.02 * (j + 1);
		da0[j] = -0.1 * (j + 1);
		da_prev[j] = 0.01 * j;
		wri_prev[j] = -0.015 * j;
	}
	for (j = 0; j < 9; ++j) inertia[j] = (j % 4 == 0) ? 2.0 + 0.1 * j : 0.05 * (j - 4);

	/* Six dispatch/formula branches and default; alternate torque retain/clear. */
	for (j = 0; j < 6; ++j) {
		seq[j] = seq_pool[j];
		angles[0] = 0.15 + 0.02 * j;
		angles[1] = -0.25 + 0.015 * j;
		angles[2] = 0.35 - 0.01 * j;
		run_one((uint32_t)j, seq, angles, wro, wri, da0, da_prev, wri_prev,
		        0.125, inertia, 0.75, (j & 1) ? 0.0 : 1000.0);
	}
	seq[0] = 999;
	run_one(0, seq, angles, wro, wri, da0, da_prev, wri_prev,
	        0.125, inertia, 0.75, 1000.0);

	/* Near each formula's denominator singularity, but still finite/nonzero. */
	for (j = 0; j < 6; ++j) {
		int denom_axis = (seq_pool[j] == 321 || seq_pool[j] == 123) ? 1 :
		                 (seq_pool[j] == 312 || seq_pool[j] == 213) ? 0 : 2;
		int k;
		for (k = 0; k < 3; ++k) angles[k] = 0.2 * (k + 1);
		angles[denom_axis] = 1.5707963267948966 - 0.001;
		for (k = 0; k < 14; ++k) seq[k] = 321;
		seq[j] = seq_pool[j];
		run_one((uint32_t)j, seq, angles, wro, wri, da0, da_prev, wri_prev,
		        0.01, inertia, -0.5, 1000000.0);
	}

	for (i = 0; i < n; ++i) {
		uint32_t wm = (uint32_t)(rng64() % 14);
		for (j = 0; j < 14; ++j) seq[j] = seq_pool[rng64() % 6];
		if (rng64() % 25 == 0) seq[wm] = 999;
		for (j = 0; j < 3; ++j) {
			angles[j] = range(-1.2, 1.2);
			wro[j] = range(-1.0, 1.0);
			wri[j] = range(-1.0, 1.0);
			da0[j] = range(-1.0, 1.0);
			da_prev[j] = range(-1.0, 1.0);
			wri_prev[j] = range(-1.0, 1.0);
		}
		for (j = 0; j < 9; ++j) inertia[j] = range(-2.0, 2.0);
		run_one(wm, seq, angles, wro, wri, da0, da_prev, wri_prev,
		        range(0.01, 1.0), inertia, range(-2.0, 2.0),
		        (rng64() & 1) ? range(0.0, 0.5) : range(10.0, 100.0));
	}
	return 0;
}
