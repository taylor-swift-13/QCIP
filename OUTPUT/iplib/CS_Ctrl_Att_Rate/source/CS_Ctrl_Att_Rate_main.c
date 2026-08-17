/* Differential driver for the active selection/error paths of the original
 * IP_CS_Ctrl_Att_Rate.c.  FP_Qctrl is fixed to zero because asin is not in the
 * deterministic FloatTest math layer. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_Ctrl_Att_Rate.h"

/* Qdiv only feeds the excluded FP_Qctrl=1 path.  Keep it observable through
 * the real caller while avoiding an assumption about the missing component. */
static unsigned int qdiv_calls;
void Qdiv(double *out, const double *left, const double *right)
{
	(void)out; (void)left; (void)right;
	++qdiv_calls;
}

/* All generated differences are in (-pi,pi), where the real ModPNHP formula
 * returns its float input unchanged.  The C signature still performs the
 * required binary64 -> binary32 -> binary64 conversions. */
float ModPNHP(float value, float halfperiod)
{
	(void)halfperiod;
	return value;
}

static uint64_t bits(double x)
{
	uint64_t b;
	memcpy(&b, &x, sizeof b);
	return b;
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

static void printn(const double *x, unsigned int n)
{
	unsigned int i;
	for (i = 0; i < n; ++i)
		printf(" %llu", (unsigned long long)bits(x[i]));
}

typedef struct {
	unsigned int mode_proc, fs_attd, bmc, seq;
	double a[3], rate[3], wbo[3], w[3], cbo[9];
	double phi, theta, dphi, dtheta;
	double w0i[3], aref[3], daref[3];
} Vec;

static void run_one(const Vec *v)
{
	CS_Ctrl_Att_Rate ip;
	unsigned int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = 0;
	ip.csCtrlerOtherPara_FS_ModeProc[0] = v->mode_proc;
	ip.csCtrlerOtherPara_FP_BMC = v->bmc;
	ip.csCtrlerOtherPara_FP_Qctrl[0] = 0;
	ip.csAttPara_FS_AttD = v->fs_attd;
	ip.csAttPara_Seq_AttD[0] = v->seq;
	ip.csAntPara_LmtH_Num_dw = 0;
	ip.csIresData_phi = v->phi;
	ip.csIresData_theta = v->theta;
	ip.csIresData_dPhi = v->dphi;
	ip.csIresData_dTheta = v->dtheta;
	memcpy(ip.csOrbData_w0i, v->w0i, sizeof v->w0i);
	memcpy(ip.csMnvData_A_Ref, v->aref, sizeof v->aref);
	memcpy(ip.csMnvData_dA_Ref, v->daref, sizeof v->daref);

	memcpy(ip.csSGAttAcqData_A, v->a, sizeof v->a);
	memcpy(ip.csSGAttAcqData_dA, v->rate, sizeof v->rate);
	memcpy(ip.csSGAttAcqData_w, v->wbo, sizeof v->wbo);
	memcpy(ip.csAttCoreData_A_ESG, v->a, sizeof v->a);
	memcpy(ip.csAttCoreData_Rate_ESG, v->rate, sizeof v->rate);
	memcpy(ip.csAttCoreData_wbo_ESG, v->wbo, sizeof v->wbo);
	memcpy(ip.csAttCoreData_w_ESG, v->w, sizeof v->w);
	memcpy(ip.csAttCoreData_Cbo_ESG, v->cbo, sizeof v->cbo);
	memcpy(ip.csAttCoreData_A_STG, v->a, sizeof v->a);
	memcpy(ip.csAttCoreData_Rate_STG, v->rate, sizeof v->rate);
	memcpy(ip.csAttCoreData_wbo_STG, v->wbo, sizeof v->wbo);
	memcpy(ip.csAttCoreData_w_STG, v->w, sizeof v->w);
	memcpy(ip.csAttCoreData_Cbo_STG, v->cbo, sizeof v->cbo);
	memcpy(ip.csAttCoreData_A_STDyn, v->a, sizeof v->a);
	memcpy(ip.csAttCoreData_Rate_STDyn, v->rate, sizeof v->rate);
	memcpy(ip.csAttCoreData_wbo_STDyn, v->wbo, sizeof v->wbo);
	memcpy(ip.csAttCoreData_w_STDyn, v->w, sizeof v->w);
	memcpy(ip.csAttCoreData_Cbo_STDyn, v->cbo, sizeof v->cbo);
	for (i = 0; i < 4; ++i) {
		ip.csAttCoreData_q_STDyn[i] = (i == 3) ? 1.0 : 0.0;
		ip.csAttCoreData_qri[i] = (i == 3) ? 1.0 : 0.0;
		ip.csAttCoreData_qbt[i] = (i == 3) ? 1.0 : 0.0;
	}
	qdiv_calls = 0;

	printf("%u %u %u %u", v->mode_proc, v->fs_attd, v->bmc, v->seq);
	printn(v->a, 3); printn(v->rate, 3); printn(v->wbo, 3); printn(v->w, 3);
	printn(v->cbo, 9);
	printf(" %llu %llu %llu %llu",
		(unsigned long long)bits(v->phi), (unsigned long long)bits(v->theta),
		(unsigned long long)bits(v->dphi), (unsigned long long)bits(v->dtheta));
	printn(v->w0i, 3); printn(v->aref, 3); printn(v->daref, 3);

	CS_Ctrl_Att_RateFun(&ip);
	printn(ip.csAttCoreData_A_Clp, 3);
	printn(ip.csAttCoreData_Rate_Clp, 3);
	printn(ip.csAttCoreData_wbo_Clp, 3);
	printn(ip.csAttCoreData_w_Clp, 3);
	printn(&ip.csAttCoreData_Cbo_Clp[0][0], 9);
	printn(ip.csAttCoreData_A_c, 3);
	printn(ip.csAttCoreData_Rate_c, 3);
	printf("\n");
}

static void fill(Vec *v, unsigned int mode_proc, unsigned int fs,
		unsigned int bmc, unsigned int seq)
{
	unsigned int i;
	memset(v, 0, sizeof *v);
	v->mode_proc = mode_proc; v->fs_attd = fs; v->bmc = bmc; v->seq = seq;
	for (i = 0; i < 3; ++i) {
		v->a[i] = range(-1.2, 1.2);
		v->rate[i] = range(-0.3, 0.3);
		v->wbo[i] = range(-0.2, 0.2);
		v->w[i] = range(-0.15, 0.15);
		v->w0i[i] = range(-0.05, 0.05);
		v->aref[i] = v->a[i] + range(-0.75, 0.75);
		v->daref[i] = range(-0.2, 0.2);
	}
	v->phi = range(-1.2, 1.2); v->theta = range(-1.2, 1.2);
	v->dphi = range(-0.3, 0.3); v->dtheta = range(-0.3, 0.3);
	if (fs == 4) {
		v->aref[0] = v->phi + range(-0.75, 0.75);
		v->aref[1] = v->theta + range(-0.75, 0.75);
		v->aref[2] = range(-0.75, 0.75);
	}
	for (i = 0; i < 9; ++i) v->cbo[i] = range(-1.0, 1.0);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0)
		: UINT64_C(0x13198a2e03707344);
	static const unsigned int seqs[7] = {123,132,213,231,312,321,999};
	Vec v;
	long t;
	unsigned int fs, i;
	rng_state = seed ? seed : 1;

	fill(&v, 2, 0, 0, 321); run_one(&v);
	for (fs = 0; fs < 5; ++fs) {
		fill(&v, 0, fs, 0, 321); run_one(&v);
		fill(&v, 0, fs, 1, 321); run_one(&v);
	}
	for (i = 0; i < 7; ++i) {
		fill(&v, 0, 4, i & 1u, seqs[i]); run_one(&v);
	}

	for (t = 0; t < n; ++t) {
		unsigned int mode_proc = (rng64() % 8 == 0) ? 2u : 0u;
		fill(&v, mode_proc, (unsigned int)(rng64() % 5),
			(unsigned int)(rng64() & 1), seqs[rng64() % 7]);
		run_one(&v);
	}
	return 0;
}
