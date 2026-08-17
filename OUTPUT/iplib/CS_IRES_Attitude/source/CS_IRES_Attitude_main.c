/* Differential driver for CS_IRES_AttitudeFun's no-sensor branch and the
 * original IRES_DataProcess function. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_IRES_Attitude.h"

double LimitDouble(double x, double bound)
{ return x > bound ? bound : (x < -bound ? -bound : x); }
void MatrixTran(double *out, const double *in, unsigned int rows, unsigned int cols)
{
	unsigned int i, j;
	for (i = 0; i < rows; ++i)
		for (j = 0; j < cols; ++j) out[j * rows + i] = in[i * cols + j];
}
static uint64_t bits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }
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

typedef struct {
	unsigned int kind, fs[2], fv[2], fu[2];
	double phi_i[2], theta_i[2];
	double phi, theta, dphi, dtheta;
	double phi_lst, phi_lst2, theta_lst, theta_lst2;
	double dphi_comp, dtheta_comp, factor, lim_phi, lim_theta, ts;
} Vec;

static void print_input(const Vec *v)
{
	const double *p = v->phi_i;
	unsigned int i;
	printf("%u %u %u %u %u %u %u", v->kind, v->fs[0], v->fs[1],
		v->fv[0], v->fv[1], v->fu[0], v->fu[1]);
	for (i = 0; i < 4; ++i) printf(" %llu", (unsigned long long)bits(p[i]));
	printf(" %llu %llu %llu %llu",
		(unsigned long long)bits(v->phi), (unsigned long long)bits(v->theta),
		(unsigned long long)bits(v->dphi), (unsigned long long)bits(v->dtheta));
	printf(" %llu %llu %llu %llu",
		(unsigned long long)bits(v->phi_lst), (unsigned long long)bits(v->phi_lst2),
		(unsigned long long)bits(v->theta_lst), (unsigned long long)bits(v->theta_lst2));
	printf(" %llu %llu %llu %llu %llu %llu",
		(unsigned long long)bits(v->dphi_comp),
		(unsigned long long)bits(v->dtheta_comp),
		(unsigned long long)bits(v->factor),
		(unsigned long long)bits(v->lim_phi),
		(unsigned long long)bits(v->lim_theta),
		(unsigned long long)bits(v->ts));
}

static void run_one(const Vec *v)
{
	CS_IRES_Attitude ip;
	unsigned int i;
	memset(&ip, 0, sizeof ip);
	for (i = 0; i < 2; ++i) {
		ip.csIresPara_FS[i] = v->fs[i];
		ip.csIresDiagData_FV[i] = v->fv[i];
		ip.csIresDiagData_FU[i] = v->fu[i];
		ip.csIresDiagData_phi_i[i] = v->phi_i[i];
		ip.csIresDiagData_theta_i[i] = v->theta_i[i];
	}
	ip.csIresData_phi = v->phi; ip.csIresData_theta = v->theta;
	ip.csIresData_dPhi = v->dphi; ip.csIresData_dTheta = v->dtheta;
	ip.csIresData_phi_Lst = v->phi_lst; ip.csIresData_phi_Lst2 = v->phi_lst2;
	ip.csIresData_theta_Lst = v->theta_lst; ip.csIresData_theta_Lst2 = v->theta_lst2;
	ip.csIresPara_dphi_Comps = v->dphi_comp;
	ip.csIresPara_dtheta_Comps = v->dtheta_comp;
	ip.csIresCorrPara_Mdf_f_dphi = v->factor;
	ip.csIresCorrPara_Mlf_dphi = v->lim_phi;
	ip.csIresCorrPara_Mlf_dtheta = v->lim_theta;
	ip.csIresPara_Ts = v->ts;

	print_input(v);
	if (v->kind == 0) CS_IRES_AttitudeFun(&ip);
	else IRES_DataProcess(&ip);

	printf(" %u %u %u %u", ip.csIresDiagData_FV[0], ip.csIresDiagData_FV[1],
		ip.csIresDiagData_FU[0], ip.csIresDiagData_FU[1]);
	printf(" %llu %llu %llu %llu",
		(unsigned long long)bits(ip.csIresData_phi),
		(unsigned long long)bits(ip.csIresData_theta),
		(unsigned long long)bits(ip.csIresData_dPhi),
		(unsigned long long)bits(ip.csIresData_dTheta));
	for (i = 0; i < 3; ++i)
		printf(" %llu", (unsigned long long)bits(ip.csIresDiagData_Eb[i]));
	printf(" %llu %llu %llu %llu\n",
		(unsigned long long)bits(ip.csIresData_phi_Lst),
		(unsigned long long)bits(ip.csIresData_phi_Lst2),
		(unsigned long long)bits(ip.csIresData_theta_Lst),
		(unsigned long long)bits(ip.csIresData_theta_Lst2));
}

static void fill(Vec *v, unsigned int kind, unsigned int fv0, unsigned int fv1)
{
	memset(v, 0, sizeof *v);
	v->kind = kind; v->fv[0] = fv0; v->fv[1] = fv1;
	v->fu[0] = (unsigned int)(rng64() & 1); v->fu[1] = (unsigned int)(rng64() & 1);
	v->phi_i[0] = range(-1.2, 1.2); v->phi_i[1] = range(-1.2, 1.2);
	v->theta_i[0] = range(-1.2, 1.2); v->theta_i[1] = range(-1.2, 1.2);
	v->phi = range(-1.2, 1.2); v->theta = range(-1.2, 1.2);
	v->dphi = range(-0.5, 0.5); v->dtheta = range(-0.5, 0.5);
	v->phi_lst = range(-1.2, 1.2); v->phi_lst2 = range(-1.2, 1.2);
	v->theta_lst = range(-1.2, 1.2); v->theta_lst2 = range(-1.2, 1.2);
	v->dphi_comp = range(-0.2, 0.2); v->dtheta_comp = range(-0.2, 0.2);
	v->factor = range(0.0, 1.0);
	v->lim_phi = range(0.01, 0.5); v->lim_theta = range(0.01, 0.5);
	v->ts = range(0.05, 2.0);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0)
		: UINT64_C(0x082efa98ec4e6c89);
	Vec v;
	long t;
	rng_state = seed ? seed : 1;

	fill(&v, 0, 1, 1); v.fs[0] = v.fs[1] = 0; run_one(&v);
	fill(&v, 1, 0, 0); run_one(&v);
	fill(&v, 1, 1, 0); run_one(&v);
	fill(&v, 1, 0, 1); run_one(&v);
	fill(&v, 1, 1, 1); run_one(&v);
	fill(&v, 1, 1, 1); v.lim_phi = v.lim_theta = 0.01; run_one(&v);

	for (t = 0; t < n; ++t) {
		unsigned int kind = (rng64() % 10 == 0) ? 0u : 1u;
		fill(&v, kind, (unsigned int)(rng64() & 1), (unsigned int)(rng64() & 1));
		if (kind == 0) v.fs[0] = v.fs[1] = 0;
		run_one(&v);
	}
	return 0;
}
