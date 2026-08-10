/* ============================================================
 * sqrt_main.c — ported_sqrt（musl 移植，shadow libm sqrt）自测向量发生器
 *
 * 输出每行两个十进制 uint64：输入 bits、sqrt 结果 bits。
 * 向量 = 定向集（覆盖特殊值、次正规、精确平方、已知误舍入实例）
 *       + 随机集（全指数范围正有限 bits）。
 * 用法: sqrt_selftest [n=2000] [seed]
 * ============================================================ */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

double sqrt(double);

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }
static double dbl(uint64_t b) { double x; memcpy(&x, &b, 8); return x; }

static void emit(double x)
{
	printf("%llu %llu\n",
	       (unsigned long long)dbits(x),
	       (unsigned long long)dbits(sqrt(x)));
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

static void emit_ulps(uint64_t b)
{
	emit(dbl(b));
	emit(dbl(b + 1));
	emit(dbl(b - 1));
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 2000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	int k;
	long i;

	rs_state = seed ? seed : 1;

	/* ---- 定向：已知误舍入实例（MSVCRT sqrt 在此 +1 ulp） ---- */
	emit_ulps(4611094754575247804ULL);

	/* ---- 定向：特殊值 ---- */
	emit(0.0); emit(-0.0);
	emit(dbl(0x7FF0000000000000ULL));          /* +inf */
	emit(dbl(0xFFF0000000000000ULL));          /* -inf  -> NaN */
	emit(dbl(0x7FF8000000000000ULL));          /* +NaN  -> NaN */
	emit(dbl(0xFFF8000000000000ULL));          /* -NaN  -> NaN */
	emit(-1.0);                                /* 负有限 -> NaN */
	emit(dbl(0x8000000000000001ULL));          /* 负最小次正规 -> NaN */
	emit(dbl(0xFFEFFFFFFFFFFFFFULL));          /* 负最大 -> NaN */

	/* ---- 定向：次正规与小数 ---- */
	emit_ulps(0x0000000000000001ULL);          /* 最小次正规 */
	emit_ulps(0x0000000000000004ULL);          /* 精确平方次正规 */
	emit_ulps(0x000FFFFFFFFFFFFFULL);          /* 最大次正规 */
	emit_ulps(0x0010000000000000ULL);          /* 最小正规数 */

	/* ---- 定向：2^k 与精确平方 ---- */
	for (k = -60; k <= 60; k += 4) {
		emit(dbl(dbits(1.0) + ((uint64_t)(k + 1023) << 52) - ((uint64_t)1023 << 52)));
	}
	emit_ulps(0x3FF0000000000000ULL);          /* 1.0 */
	emit_ulps(0x4000000000000000ULL);          /* 2.0 */
	emit_ulps(0x4010000000000000ULL);          /* 4.0 */
	emit_ulps(0x3FD0000000000000ULL);          /* 0.25 */
	emit_ulps(0x3FE0000000000000ULL);          /* 0.5 */
	emit_ulps(0x7FEFFFFFFFFFFFFFULL);          /* 最大 double */

	/* ---- 随机：全指数范围正有限 bits ---- */
	for (i = 0; i < n; i++) {
		uint64_t b = rs() & 0x7FEFFFFFFFFFFFFFULL;   /* 正有限，含次正规 */
		emit(dbl(b));
	}
	return 0;
}
