/* Differential driver for CS_TrgtAtt_AMM_2NoSAR.
 * The core quaternion/DCM/trig path is real.  The no-argument application
 * hook, final Track_Atti hook, and inverse-trig C2Angle123 are observed stubs. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "CS_TrgtAtt_AMM_2NoSAR_clean.h"

FloatTestDriftAngleData csDriftAngData;
static unsigned int exp_calls, track_calls, c2angle_calls;
static double injected_a_ref[3];

void CS_TrgtAtt_AMM_Exp(void) { ++exp_calls; }
void XX_Track_Atti(void *p) { (void)p; ++track_calls; }
void C2Angle123(double *out, const double *m)
{
	(void)m; ++c2angle_calls;
	memcpy(out, injected_a_ref, sizeof injected_a_ref);
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
static uint64_t bits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }

typedef struct {
	double qbo[4], qrb[4], psi, dpsi, cb[9], csib[9], coi[9], w0i[3], wrb0[3], a_ref[3];
} Vec;

static void quat_axis(double *q, unsigned axis, double angle)
{
	double h = 0.5 * angle;
	q[0] = q[1] = q[2] = 0.0;
	if (axis < 3) q[axis] = sin(h);
	q[3] = cos(h);
}

static void dcm(double *m, double a, double b, double c)
{
	Angle2C321(m, a, b, c);
}

static void printn(const double *x, unsigned n)
{
	unsigned i;
	for (i = 0; i < n; ++i) printf(" %llu", (unsigned long long)bits(x[i]));
}

static void run_one(const Vec *v)
{
	CS_TrgtAtt_AMM_2NoSAR ip;
	memset(&ip, 0, sizeof ip);
	memcpy(ip.csMnvData_qbo0, v->qbo, sizeof v->qbo);
	memcpy(ip.csMnvData_qrb0, v->qrb, sizeof v->qrb);
	ip.csDriftAngData_Psi_DA = v->psi;
	csDriftAngData.dPsi_DA = v->dpsi;
	memcpy(ip.csAttCoreData_Cbiasp, v->cb, sizeof v->cb);
	memcpy(ip.csLoadAxisData_Csib_DARot, v->csib, sizeof v->csib);
	memcpy(ip.csOrbData_coi, v->coi, sizeof v->coi);
	memcpy(ip.csOrbData_w0i, v->w0i, sizeof v->w0i);
	memcpy(ip.csMnvData_wrb0, v->wrb0, sizeof v->wrb0);
	memcpy(injected_a_ref, v->a_ref, sizeof v->a_ref);
	exp_calls = track_calls = c2angle_calls = 0;

	printn(v->qbo, 4); printn(v->qrb, 4);
	printf(" %llu %llu", (unsigned long long)bits(v->psi), (unsigned long long)bits(v->dpsi));
	printn(v->cb, 9); printn(v->csib, 9); printn(v->coi, 9);
	printn(v->w0i, 3); printn(v->wrb0, 3); printn(v->a_ref, 3);

	CS_TrgtAtt_AMM_2NoSARFun(&ip);
	printn(&ip.csAttCoreData_Cro_si[0][0], 9);
	printn(ip.csAttCoreData_wri_si, 3);
	printn(&ip.csAttCoreData_Cro[0][0], 9);
	printn(ip.csAttCoreData_wri, 3);
	printn(ip.csAttCoreData_qro, 4); printn(ip.csAttCoreData_qri, 4);
	printn(ip.csAttCoreData_wro, 3); printn(ip.csMnvData_A_Ref_si, 3);
	printf(" %u %u %u\n", exp_calls, track_calls, c2angle_calls);
}

static void base(Vec *v)
{
	unsigned i;
	memset(v, 0, sizeof *v);
	v->qbo[3] = v->qrb[3] = 1.0;
	for (i = 0; i < 9; ++i)
		v->cb[i] = v->csib[i] = v->coi[i] = (i % 4 == 0) ? 1.0 : 0.0;
	v->a_ref[0] = 0.1; v->a_ref[1] = -0.2; v->a_ref[2] = 0.3;
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : UINT64_C(0xbb67ae8584caa73b);
	Vec v;
	long t;
	unsigned i;
	rng_state = seed ? seed : 1;

	/* Exact I/Rx(pi)/Ry(pi)/Rz(pi) anchors exercise all C2Q branches. */
	for (i = 0; i < 4; ++i) {
		base(&v);
		if (i) quat_axis(v.qrb, i - 1, 0x1.921fb54442d18p+1);
		run_one(&v);
	}

	/* Nontrivial drift/load-axis/orbit composition. */
	base(&v); quat_axis(v.qbo, 1, 0.4); quat_axis(v.qrb, 2, -0.7);
	v.psi = 0.35; v.dpsi = -0.0125;
	dcm(v.cb, 0.2, -0.3, 0.1); dcm(v.csib, -0.1, 0.25, 0.4); dcm(v.coi, 0.3, 0.1, -0.2);
	v.w0i[0] = 0.01; v.w0i[1] = -0.02; v.w0i[2] = 0.03;
	v.wrb0[0] = -0.04; v.wrb0[1] = 0.05; v.wrb0[2] = -0.06;
	run_one(&v);

	for (t = 0; t < n; ++t) {
		base(&v);
		quat_axis(v.qbo, (unsigned)(rng64() % 3), range(-2.5, 2.5));
		quat_axis(v.qrb, (unsigned)(rng64() % 3), range(-2.5, 2.5));
		v.psi = range(-2.5, 2.5); v.dpsi = range(-0.1, 0.1);
		dcm(v.cb, range(-1.5,1.5), range(-1.5,1.5), range(-1.5,1.5));
		dcm(v.csib, range(-1.5,1.5), range(-1.5,1.5), range(-1.5,1.5));
		dcm(v.coi, range(-1.5,1.5), range(-1.5,1.5), range(-1.5,1.5));
		for (i = 0; i < 3; ++i) {
			v.w0i[i] = range(-0.1, 0.1); v.wrb0[i] = range(-0.2, 0.2);
			v.a_ref[i] = range(-1.0, 1.0);
		}
		run_one(&v);
	}
	return 0;
}
