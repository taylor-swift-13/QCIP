/* ============================================================
 * ported_trig.c — musl libc sin/cos 的确定化移植（FloatTest 差分测试用）
 *
 * 来源（musl，逐行誊写，算法与运算顺序完全一致）：
 *   src/math/sin.c  src/math/cos.c  src/math/__sin.c
 *   src/math/__cos.c  src/math/__rem_pio2.c
 * 原始代码版权：Copyright (C) 1993 by Sun Microsystems, Inc.
 * "Permission to use, copy, modify, and distribute this software is
 *  freely granted, provided that this notice is preserved."
 * （musl 本体为 MIT。）
 *
 * 与 musl 的差异（均不影响“输入域内”的输出比特）：
 *   1) 去掉 FORCE_EVAL / predict_false：前者只触发 inexact/underflow
 *      标志位，后者只是分支预测提示，都不改变返回值；
 *   2) 砍掉 Payne-Hanek 超大参数路径：|x| >= 2^20*(pi/2) ≈ 1.645e6 的
 *      有限输入返回 canonical NaN（0x7FF8000000000000）、n=0。
 *      FloatTest 向量生成保证不越过该输入域，此分支仅作防御，
 *      并与 Coq 侧 FloatTest/lib/FloatTrig.v 的同分支逐比特一致；
 *      （Inf/NaN 在 ported_sin/ported_cos 前置分支已拦截，走不到这里。）
 *   3) 常量全部使用 musl 源码中的字面量（gcc 编译期正确舍入，
 *      注释给出对应的 64-bit word pair 备查）。
 *
 * 链接语义：本文件定义 sin/cos 两个符号，链接顺序先于 -lm，
 * shadow 掉 libm 的同名函数；全部 TU 需 -fno-builtin-sin
 * -fno-builtin-cos，防止 gcc 把调用折叠为内建或编译期常量传播。
 * 要求 FLT_EVAL_METHOD == 0（x86-64 恒成立）：所有中间量都是
 * IEEE binary64、最近舍入。
 * ============================================================ */

#include <stdint.h>

/* ---- src/math/__sin.c：[-pi/4, pi/4] 上的 kernel sin ---- */

static const double
S1 = -1.66666666666666324348e-01, /* 0xBFC55555, 0x55555549 */
S2 =  8.33333333332248946124e-03, /* 0x3F811111, 0x1110F8A6 */
S3 = -1.98412698298579493134e-04, /* 0xBF2A01A0, 0x19C161D5 */
S4 =  2.75573137070700676789e-06, /* 0x3EC71DE3, 0x57B1FE7D */
S5 = -2.50507602534068634195e-08, /* 0xBE5AE5E6, 0x8A2B9CEB */
S6 =  1.58969099521155010221e-10; /* 0x3DE5D93A, 0x5ACFD57C */

static double kernel_sin(double x, double y, int iy)
{
	double z, r, v, w;

	z = x * x;
	w = z * z;
	r = S2 + z * (S3 + z * S4) + z * w * (S5 + z * S6);
	v = z * x;
	if (iy == 0)
		return x + v * (S1 + z * r);
	else
		return x - ((z * (0.5 * y - v * r) - y) - v * S1);
}

/* ---- src/math/__cos.c：[-pi/4, pi/4] 上的 kernel cos ---- */

static const double
C1 =  4.16666666666666019037e-02, /* 0x3FA55555, 0x5555554C */
C2 = -1.38888888888741095749e-03, /* 0xBF56C16C, 0x16C15177 */
C3 =  2.48015872894767294178e-05, /* 0x3EFA01A0, 0x19CB1590 */
C4 = -2.75573143513906633035e-07, /* 0xBE927E4F, 0x809C52AD */
C5 =  2.08757232129817482790e-09, /* 0x3E21EE9E, 0xBDB4B1C4 */
C6 = -1.13596475577881948265e-11; /* 0xBDA8FAE9, 0xBE8838D4 */

static double kernel_cos(double x, double y)
{
	double hz, z, r, w;

	z = x * x;
	w = z * z;
	r = z * (C1 + z * (C2 + z * C3)) + w * w * (C4 + z * (C5 + z * C6));
	hz = 0.5 * z;
	w = 1.0 - hz;
	return w + (((1.0 - w) - hz) + (z * r - x * y));
}

/* ---- src/math/__rem_pio2.c：small + medium 约减（large 已删） ---- */

static const double
toint   = 0x1.8p+52,                     /* 1.5/DBL_EPSILON = 1.5*2^52：0x43380000, 0x00000000 */
pio4    = 0x1.921fb54442d18p-1,          /* 0x3FE921FB, 0x54442D18 */
invpio2 = 6.36619772367581382433e-01,    /* 2/pi：0x3FE45F30, 0x6DC9C883 */
pio2_1  = 1.57079632673412561417e+00,    /* pi/2 头 33 位：0x3FF921FB, 0x54400000 */
pio2_1t = 6.07710050650619224932e-11,    /* pi/2 - pio2_1：0x3DD0B461, 0x1A626331 */
pio2_2  = 6.07710050630396597660e-11,    /* 第二段 33 位：0x3DD0B461, 0x1A600000 */
pio2_2t = 2.02226624879595063154e-21,    /* pi/2 - (pio2_1+pio2_2)：0x3BA3198A, 0x2E037073 */
pio2_3  = 2.02226624871116645580e-21,    /* 第三段 33 位：0x3BA3198A, 0x2E000000 */
pio2_3t = 8.47842766036889956997e-32;    /* pi/2 - (pio2_1+pio2_2+pio2_3)：0x397B839A, 0x252049C1 */

/* medium 路径：|x| < 2^20*(pi/2)，fn = rint(x*invpio2) 经 toint 技巧 */
static int rem_pio2_medium(double x, uint32_t ix, double *y)
{
	union { double f; uint64_t i; } u;
	double fn, r, w, t;
	int32_t n;
	uint32_t ey;
	int ex;

	fn = x * invpio2 + toint - toint;
	n = (int32_t)fn;
	r = x - fn * pio2_1;
	w = fn * pio2_1t;                      /* 第一轮，精确到 85 位 */
	if (r - w < -pio4) {
		n--;
		fn--;
		r = x - fn * pio2_1;
		w = fn * pio2_1t;
	} else if (r - w > pio4) {
		n++;
		fn++;
		r = x - fn * pio2_1;
		w = fn * pio2_1t;
	}
	y[0] = r - w;
	u.f = y[0];
	ey = (uint32_t)(u.i >> 52) & 0x7ff;
	ex = (int)(ix >> 20);
	if (ex - ey > 16) {                    /* 第二轮，精确到 118 位 */
		t = r;
		w = fn * pio2_2;
		r = t - w;
		w = fn * pio2_2t - ((t - r) - w);
		y[0] = r - w;
		u.f = y[0];
		ey = (uint32_t)(u.i >> 52) & 0x7ff;
		if (ex - ey > 49) {                /* 第三轮，精确到 151 位 */
			t = r;
			w = fn * pio2_3;
			r = t - w;
			w = fn * pio2_3t - ((t - r) - w);
			y[0] = r - w;
		}
	}
	y[1] = (r - y[0]) - w;
	return n;
}

static int rem_pio2_ported(double x, double *y)
{
	union { double f; uint64_t i; } u = { x };
	union { double f; uint64_t i; } nan_u;
	double z;
	uint32_t ix;
	int sign;

	sign = (int)(u.i >> 63);
	ix = (uint32_t)(u.i >> 32) & 0x7fffffff;
	if (ix <= 0x400f6a7a) {                /* |x| ~<= 5pi/4 */
		if ((ix & 0xfffff) == 0x921fb)     /* |x| ~= pi/2 或 2pi/2，相消严重 */
			return rem_pio2_medium(x, ix, y);
		if (ix <= 0x4002d97c) {            /* |x| ~<= 3pi/4 */
			if (!sign) {
				z = x - pio2_1;        /* 一轮，精确到 85 位 */
				y[0] = z - pio2_1t;
				y[1] = (z - y[0]) - pio2_1t;
				return 1;
			} else {
				z = x + pio2_1;
				y[0] = z + pio2_1t;
				y[1] = (z - y[0]) + pio2_1t;
				return -1;
			}
		} else {
			if (!sign) {
				z = x - 2 * pio2_1;
				y[0] = z - 2 * pio2_1t;
				y[1] = (z - y[0]) - 2 * pio2_1t;
				return 2;
			} else {
				z = x + 2 * pio2_1;
				y[0] = z + 2 * pio2_1t;
				y[1] = (z - y[0]) + 2 * pio2_1t;
				return -2;
			}
		}
	}
	if (ix <= 0x401c463b) {                /* |x| ~<= 9pi/4 */
		if (ix <= 0x4015fdbc) {            /* |x| ~<= 7pi/4 */
			if (ix == 0x4012d97c)      /* |x| ~= 3pi/2 */
				return rem_pio2_medium(x, ix, y);
			if (!sign) {
				z = x - 3 * pio2_1;
				y[0] = z - 3 * pio2_1t;
				y[1] = (z - y[0]) - 3 * pio2_1t;
				return 3;
			} else {
				z = x + 3 * pio2_1;
				y[0] = z + 3 * pio2_1t;
				y[1] = (z - y[0]) + 3 * pio2_1t;
				return -3;
			}
		} else {
			if (ix == 0x401921fb)      /* |x| ~= 4pi/2 */
				return rem_pio2_medium(x, ix, y);
			if (!sign) {
				z = x - 4 * pio2_1;
				y[0] = z - 4 * pio2_1t;
				y[1] = (z - y[0]) - 4 * pio2_1t;
				return 4;
			} else {
				z = x + 4 * pio2_1;
				y[0] = z + 4 * pio2_1t;
				y[1] = (z - y[0]) + 4 * pio2_1t;
				return -4;
			}
		}
	}
	if (ix < 0x413921fb)                   /* |x| ~< 2^20*(pi/2)，medium */
		return rem_pio2_medium(x, ix, y);

	/* 防御分支：超大有限参数（Inf/NaN 已被 ported_sin/ported_cos 前置拦截）。
	 * 与 Coq 侧 FloatTrig.v 同分支一致：canonical NaN，n=0。 */
	nan_u.i = 0x7FF8000000000000ULL;
	y[0] = y[1] = nan_u.f;
	return 0;
}

/* ---- src/math/sin.c ---- */

double ported_sin(double x)
{
	union { double f; uint64_t i; } u = { x };
	double y[2];
	uint32_t ix;
	unsigned n;

	ix = (uint32_t)(u.i >> 32) & 0x7fffffff;

	if (ix <= 0x3fe921fb) {                /* |x| ~< pi/4 */
		if (ix < 0x3e500000)           /* |x| < 2**-26（musl 此处
		                                * FORCE_EVAL 仅提标志位，结果不变） */
			return x;
		return kernel_sin(x, 0.0, 0);
	}

	if (ix >= 0x7ff00000)                  /* sin(Inf/NaN) = NaN */
		return x - x;

	n = (unsigned)rem_pio2_ported(x, y);
	switch (n & 3) {
	case 0:  return  kernel_sin(y[0], y[1], 1);
	case 1:  return  kernel_cos(y[0], y[1]);
	case 2:  return -kernel_sin(y[0], y[1], 1);
	default: return -kernel_cos(y[0], y[1]);
	}
}

/* ---- src/math/cos.c ---- */

double ported_cos(double x)
{
	union { double f; uint64_t i; } u = { x };
	double y[2];
	uint32_t ix;
	unsigned n;

	ix = (uint32_t)(u.i >> 32) & 0x7fffffff;

	if (ix <= 0x3fe921fb) {                /* |x| ~< pi/4 */
		if (ix < 0x3e46a09e)           /* |x| < 2**-27 * sqrt(2) */
			return 1.0;
		return kernel_cos(x, 0.0);
	}

	if (ix >= 0x7ff00000)                  /* cos(Inf/NaN) = NaN */
		return x - x;

	n = (unsigned)rem_pio2_ported(x, y);
	switch (n & 3) {
	case 0:  return  kernel_cos(y[0], y[1]);
	case 1:  return -kernel_sin(y[0], y[1], 1);
	case 2:  return -kernel_cos(y[0], y[1]);
	default: return  kernel_sin(y[0], y[1], 1);
	}
}

/* 链接时 shadow libm 的同名符号（需 -fno-builtin-sin -fno-builtin-cos） */
double sin(double x) { return ported_sin(x); }
double cos(double x) { return ported_cos(x); }
