/* Differential-test driver for the complete active CS_Gyro_Att_Predict path.
 * Missing component-library helpers are reconstructed with the same formulas
 * already audited by CS_TrgtAtt_EIM and CS_Track_Atti.  sin/cos/sqrt are the
 * deterministic musl ports shared by FloatTest. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_Gyro_Att_Predict.h"

double LimitDouble(double value, double bound)
{
	return value > bound ? bound : (value < -bound ? -bound : value);
}

/* Exact repository std_utils.c implementation.  The float32 signature is
 * intentional: callers pass binary64 and therefore perform double->float. */
float ModPNHP(float x, float halfperiod)
{
	float period = 2.0f * halfperiod;
	return x - floorf((x + halfperiod) / period) * period;
}

void MatrixMulti(double *out, const double *a, const double *b,
                 unsigned int rows, unsigned int inner, unsigned int cols)
{
	double tmp[9] = {0};
	unsigned int i, j, k;
	for (i = 0; i < rows; ++i)
		for (j = 0; j < cols; ++j)
			for (k = 0; k < inner; ++k)
				tmp[i * cols + j] += a[i * inner + k] * b[k * cols + j];
	memcpy(out, tmp, rows * cols * sizeof(double));
}

static void w2d(double *r, const double *a, const double *w, unsigned int seq)
{
	double s1 = sin(a[0]), s2 = sin(a[1]), s3 = sin(a[2]);
	double c1 = cos(a[0]), c2 = cos(a[1]), c3 = cos(a[2]);
	switch (seq) {
	case 132:
		r[0] = (c2*w[0] + s2*w[2]) / c3;
		r[1] = w[1] + (c2*w[0] + s2*w[2]) * s3 / c3;
		r[2] = -s2*w[0] + c2*w[2];
		break;
	case 321:
		r[0] = w[0] + (s1*w[1] + c1*w[2]) * s2 / c2;
		r[1] = c1*w[1] - s1*w[2];
		r[2] = (s1*w[1] + c1*w[2]) / c2;
		break;
	case 312:
		r[0] = w[0]*c2 + w[2]*s2;
		r[1] = w[1] + (w[0]*s2 - w[2]*c2) * s1 / c1;
		r[2] = (-w[0]*s2 + w[2]*c2) / c1;
		break;
	case 213:
		r[0] = c3*w[0] - s3*w[1];
		r[1] = (s3*w[0] + c3*w[1]) / c1;
		r[2] = w[2] + (s3*w[0] + c3*w[1]) * s1 / c1;
		break;
	case 123:
		r[0] = (c3*w[0] - s3*w[1]) / c2;
		r[1] = c3*w[1] + s3*w[0];
		r[2] = w[2] - (c3*w[0] - s3*w[1]) * s2 / c2;
		break;
	case 231:
		r[0] = w[0] - (c1*w[1] - s1*w[2]) * s3 / c3;
		r[1] = (c1*w[1] - s1*w[2]) / c3;
		r[2] = c1*w[2] + s1*w[1];
		break;
	default:
		break;
	}
}

#define W2D(name, seq) \
	void name(double *r, const double *a, const double *w) { w2d(r, a, w, seq); }
W2D(w2dAngle123, 123)
W2D(w2dAngle132, 132)
W2D(w2dAngle213, 213)
W2D(w2dAngle231, 231)
W2D(w2dAngle312, 312)
W2D(w2dAngle321, 321)

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
static const uint32_t seqs[6] = {123, 132, 213, 231, 312, 321};

typedef struct {
	uint32_t wm, seq[14];
	double dg[3], d0[3], de[3], w0i[3], a[3], alim[3], dt, wlim;
} Vec;

static void print3(const double *x)
{
	printf(" %llu %llu %llu", (unsigned long long)bits(x[0]),
	       (unsigned long long)bits(x[1]), (unsigned long long)bits(x[2]));
}

static void run_one(const Vec *v)
{
	CS_Gyro_Att_Predict ip;
	unsigned int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = v->wm;
	for (i = 0; i < 14; ++i) ip.csAttPara_Seq_AttD[i] = v->seq[i];
	memcpy(ip.csGyroData_deltag, v->dg, sizeof v->dg);
	memcpy(ip.csGyroData_D0_ESCorr, v->d0, sizeof v->d0);
	memcpy(ip.csGyroData_De_ESCorr, v->de, sizeof v->de);
	memcpy(ip.csOrbData_w0i, v->w0i, sizeof v->w0i);
	memcpy(ip.csAttCoreData_A_ESG, v->a, sizeof v->a);
	for (i = 0; i < 3; ++i) ip.csGyroPara_MlfA_ESG[i][v->wm] = v->alim[i];
	ip.m_DeltaT = v->dt;
	ip.csGyroPara_Mlfw = v->wlim;

	printf("%u", v->wm);
	for (i = 0; i < 14; ++i) printf(" %u", v->seq[i]);
	print3(v->dg); print3(v->d0); print3(v->de); print3(v->w0i);
	print3(v->a); print3(v->alim);
	printf(" %llu %llu", (unsigned long long)bits(v->dt),
	       (unsigned long long)bits(v->wlim));

	CS_Gyro_Att_PredictFun(&ip);
	print3(ip.csAttCoreData_w_ESG);
	print3(ip.csAttCoreData_wbo_ESG);
	print3(ip.csAttCoreData_Rate_ESG);
	print3(ip.csAttCoreData_A_ESG);
	for (i = 0; i < 9; ++i)
		printf(" %llu", (unsigned long long)bits(ip.csAttCoreData_Cbo_ESG[0][i]));
	putchar('\n');
}

static void base(Vec *v)
{
	unsigned int i;
	memset(v, 0, sizeof *v);
	v->wm = 0;
	for (i = 0; i < 14; ++i) v->seq[i] = 321;
	for (i = 0; i < 3; ++i) {
		v->a[i] = 0.1 * (double)(i + 1);
		v->alim[i] = 2.0;
	}
	v->dt = 0.03125;
	v->wlim = 1.0;
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : UINT64_C(0x6a09e667f3bcc909);
	Vec v;
	long t;
	unsigned int i, j;
	rng_state = seed ? seed : 1;

	/* Six legal sequences plus the source's invalid-sequence behavior. */
	for (j = 0; j < 7; ++j) {
		base(&v); v.wm = j % 7; v.seq[v.wm] = j < 6 ? seqs[j] : 999;
		for (i = 0; i < 3; ++i) {
			v.dg[i] = (0.01 + 0.003*i) * (j & 1 ? -1.0 : 1.0);
			v.d0[i] = 0.02 * (i + 1); v.de[i] = -0.01 * (i + 1);
			v.w0i[i] = 0.002 * (i + 1);
		}
		run_one(&v);
	}

	/* Trigger each near-singularity guard with zero angular velocity. */
	for (j = 0; j < 6; ++j) {
		unsigned int axis = (seqs[j] == 123 || seqs[j] == 321) ? 1 :
		                    (seqs[j] == 213 || seqs[j] == 312) ? 0 : 2;
		base(&v); v.wm = j; v.seq[j] = seqs[j]; v.a[axis] = 0x1.921fb54442d18p+0;
		run_one(&v);
	}

	for (t = 0; t < n; ++t) {
		base(&v); v.wm = (uint32_t)(rng64() % 14);
		for (i = 0; i < 14; ++i) v.seq[i] = seqs[rng64() % 6];
		if (rng64() % 29 == 0) v.seq[v.wm] = 999;
		for (i = 0; i < 3; ++i) {
			v.dg[i] = range(-0.03, 0.03);
			v.d0[i] = range(-0.2, 0.2);
			v.de[i] = range(-0.2, 0.2);
			v.w0i[i] = range(-0.02, 0.02);
			v.a[i] = range(-1.0, 1.0);
			v.alim[i] = range(0.25, 1.5);
		}
		v.dt = range(0.02, 0.08);
		v.wlim = range(0.15, 1.0);
		run_one(&v);
	}
	return 0;
}
