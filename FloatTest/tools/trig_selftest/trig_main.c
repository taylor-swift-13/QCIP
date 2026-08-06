/* ============================================================
 * trig_main.c — ported_sin/ported_cos 自测向量发生器
 *
 * 输出每行三个十进制 uint64：输入 bits、sin 结果 bits、cos 结果 bits。
 * 向量 = 定向集（约 260 条，覆盖全部分支边界与相消路径）+ 随机集。
 * 用法: trig_selftest [n=3000] [seed]
 * ============================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

double sin(double); double cos(double);

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }
static double dbl(uint64_t b) { double x; memcpy(&x, &b, 8); return x; }

static void emit(double x)
{
	printf("%llu %llu %llu\n",
	       (unsigned long long)dbits(x),
	       (unsigned long long)dbits(sin(x)),
	       (unsigned long long)dbits(cos(x)));
}

/* xorshift64* */
static uint64_t rs_state;
static uint64_t rs(void)
{
	uint64_t x = rs_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rs_state = x;
	return x * 2685821657736338717ULL;
}
static double urand(void) { return (double)(rs() >> 11) * 0x1.0p-53; } /* [0,1) */

#define PIO2 0x1.921fb54442d18p-1
#define PI   0x1.921fb54442d18p+1

static void emit_ulps(uint64_t b)
{
	emit(dbl(b));
	emit(dbl(b + 1));
	emit(dbl(b - 1));
	emit(dbl(b ^ 0x8000000000000000ULL));       /* 镜像负值 */
	emit(dbl((b + 1) ^ 0x8000000000000000ULL));
	emit(dbl((b - 1) ^ 0x8000000000000000ULL));
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 3000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	static const long k_med[] = { 10, 100, 1000, 10000, 100000, 500000, 1000000 };
	long i;
	int k;
	size_t j;

	rs_state = seed ? seed : 1;

	/* ---- 定向：tiny / 次正规 / kernel 区边界 ---- */
	emit(0.0); emit(-0.0);
	emit(dbl(0x0000000000000001ULL));          /* 最小次正规 */
	emit(dbl(0x000FFFFFFFFFFFFFULL));          /* 最大次正规 */
	emit_ulps(0x3E50000000000000ULL);          /* sin tiny 边界 2^-26 */
	emit_ulps(0x3E46A09E00000000ULL);          /* cos tiny 边界 2^-27*sqrt(2) */
	emit_ulps(0x3FE921FB54442D18ULL);          /* pi/4（kernel 区） */
	emit(dbl(0x3FE921FBFFFFFFFFULL));          /* kernel 区上界（ix=0x3fe921fb） */
	emit_ulps(0x3FE921FC00000000ULL);          /* 跨入 small-rem */

	/* ---- 定向：pi/2 小倍数与相消 goto-medium 路径 ---- */
	for (k = 1; k <= 8; k++)
		emit_ulps(dbits(k * PIO2));
	emit_ulps(0x3FF921FB00000000ULL);          /* (ix&0xfffff)==0x921fb → medium */
	emit_ulps(0x400921FB00000000ULL);          /* 同上，|x|≈pi */
	emit_ulps(0x4012D97C7F3321D2ULL);          /* 3pi/2 最近 double → medium */
	emit_ulps(0x401921FB54442D18ULL);          /* 2pi 最近 double → medium */

	/* ---- 定向：small-rem 内部边界 ---- */
	emit_ulps(0x4002D97C00000000ULL);          /* 3pi/4 边界 */
	emit_ulps(0x400F6A7A00000000ULL);          /* 5pi/4 边界 */
	emit_ulps(0x4015FDBC00000000ULL);          /* 7pi/4 边界 */
	emit_ulps(0x401C463B00000000ULL);          /* 9pi/4 边界 */

	/* ---- 定向：medium 区 k*pi/2（触发第 2/3 轮相消） ---- */
	for (j = 0; j < sizeof(k_med) / sizeof(k_med[0]); j++)
		emit_ulps(dbits((double)k_med[j] * PIO2));

	/* ---- 定向：输入域边界与越域防御分支 ---- */
	emit(dbl(0x413921FAFFFFFFFFULL));          /* 域内上界（ix<=0x413921fa） */
	emit_ulps(0x413921FB00000000ULL);          /* 越域 → canonical NaN */
	emit(dbl(0x7E37E43C8800759CULL));          /* 1e300 → NaN */
	emit(dbl(0xFE37E43C8800759CULL));          /* -1e300 → NaN */

	/* ---- 随机：70% 均匀 [-8pi, 8pi]，30% 对数均匀至域边界 ---- */
	for (i = 0; i < n; i++) {
		double x;
		if (rs() % 10 < 7) {
			x = (urand() * 2.0 - 1.0) * (8.0 * PI);
		} else {
			int e;
			double m;
			do {
				e = -26 + (int)(urand() * 48.0);   /* 2^-26 .. 2^22 */
				m = 0.5 + urand();                 /* [0.5, 1.5) */
				x = ldexp(m, e);
				if (rs() & 1) x = -x;
			} while (x > 1.6e6 || x < -1.6e6);
		}
		emit(x);
	}
	return 0;
}
