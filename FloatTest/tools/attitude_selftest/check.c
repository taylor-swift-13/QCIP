/* Independent mathematical oracle for reconstructed attitude helpers.
 * It deliberately does not reuse their expanded Angle2C formulas. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Angle2C123(double *, double, double, double);
void Angle2C132(double *, double, double, double);
void Angle2C213(double *, double, double, double);
void Angle2C231(double *, double, double, double);
void Angle2C312(double *, double, double, double);
void Angle2C321(double *, double, double, double);
void C2Q(double *, const double *);

typedef void (*angle_fun)(double *, double, double, double);

static uint64_t rng_state = UINT64_C(0x62e2ac94d41f370b);
static uint64_t rng64(void)
{
	uint64_t x = rng_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rng_state = x;
	return x * UINT64_C(2685821657736338717);
}
static double uniform01(void) { return (double)(rng64() >> 11) * 0x1.0p-53; }
static double random_angle(void) { return (2.0 * uniform01() - 1.0) * 3.141592653589793; }

static void identity(double m[9])
{
	unsigned i;
	for (i = 0; i < 9; ++i) m[i] = 0.0;
	m[0] = m[4] = m[8] = 1.0;
}

static void elementary(unsigned axis, double a, double m[9])
{
	double s = sin(a), c = cos(a);
	identity(m);
	if (axis == 1) {
		m[4] = c; m[5] = -s; m[7] = s; m[8] = c;
	} else if (axis == 2) {
		m[0] = c; m[2] = s; m[6] = -s; m[8] = c;
	} else {
		m[0] = c; m[1] = -s; m[3] = s; m[4] = c;
	}
}

static void reference_mul(const double a[9], const double b[9], double out[9])
{
	double t[9] = {0};
	unsigned i, j, k;
	for (i = 0; i < 3; ++i)
		for (j = 0; j < 3; ++j)
			for (k = 0; k < 3; ++k)
				t[3 * i + j] += a[3 * i + k] * b[3 * k + j];
	memcpy(out, t, sizeof t);
}

static void reference_angle(const unsigned seq[3], const double a[3], double out[9])
{
	double acc[9], r[9], t[9];
	unsigned i;
	identity(acc);
	for (i = 0; i < 3; ++i) {
		elementary(seq[i], a[seq[i] - 1], r);
		reference_mul(acc, r, t);
		memcpy(acc, t, sizeof acc);
	}
	memcpy(out, acc, sizeof acc);
}

static int check_angles(unsigned random_count)
{
	static const unsigned seqs[6][3] = {
		{1,2,3}, {1,3,2}, {2,1,3}, {2,3,1}, {3,1,2}, {3,2,1}
	};
	static const char *names[6] = {"123","132","213","231","312","321"};
	static const angle_fun funcs[6] = {
		Angle2C123, Angle2C132, Angle2C213, Angle2C231, Angle2C312, Angle2C321
	};
	unsigned q, n, i;
	for (q = 0; q < 6; ++q) {
		for (n = 0; n < random_count; ++n) {
			double a[3] = {random_angle(), random_angle(), random_angle()};
			double got[9], want[9];
			funcs[q](got, a[0], a[1], a[2]);
			reference_angle(seqs[q], a, want);
			for (i = 0; i < 9; ++i) {
				if (!isfinite(got[i]) || fabs(got[i] - want[i]) > 4.0e-15) {
					fprintf(stderr, "Angle2C%s mismatch sample=%u element=%u got=%.17g want=%.17g\n",
					        names[q], n, i, got[i], want[i]);
					return 1;
				}
			}
		}
	}
	return 0;
}

static int check_c2q(void)
{
	static const double matrices[4][9] = {
		{ 1,0,0, 0, 1,0, 0,0, 1},
		{ 1,0,0, 0,-1,0, 0,0,-1},
		{-1,0,0, 0, 1,0, 0,0,-1},
		{-1,0,0, 0,-1,0, 0,0, 1}
	};
	static const double expected[4][4] = {
		{0,0,0,1}, {1,0,0,0}, {0,1,0,0}, {0,0,1,0}
	};
	unsigned n, i;
	for (n = 0; n < 4; ++n) {
		double got[4];
		C2Q(got, matrices[n]);
		for (i = 0; i < 4; ++i) {
			if (got[i] != expected[n][i]) {
				fprintf(stderr, "C2Q anchor mismatch matrix=%u element=%u got=%.17g want=%.17g\n",
				        n, i, got[i], expected[n][i]);
				return 1;
			}
		}
	}
	return 0;
}

int main(int argc, char **argv)
{
	unsigned n = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 10000;
	if (check_angles(n) || check_c2q()) return 1;
	printf("PASS: attitude helper oracle (6 x %u Angle2C samples + 4 C2Q anchors)\n", n);
	return 0;
}
