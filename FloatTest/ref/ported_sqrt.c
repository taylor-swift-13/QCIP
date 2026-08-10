/* ============================================================
 * ported_sqrt.c — musl libc sqrt(double) 的确定化移植（FloatTest 差分测试用）
 *
 * 背景：本机 MinGW gcc 链接老 MSVCRT，其 sqrt 存在罕见的 1-ulp 误舍入
 * （x87 FSQRT 双舍入残留），实例：
 *   x = 0x1.de63fa81fe9bcp+0 (bits 4611094754575247804)
 *   MSVCRT sqrt(x) = bits 4608835279482202034
 *   正确舍入       = bits 4608835279482202033
 * 与 Coq 侧 fp64_sqrt（Flocq Bsqrt，正确舍入）差 1 ulp，导致
 * CS_TrgtAtt_NWM_USU t_0861 的 qri[0..3] 各错 ±1 ulp。
 * musl sqrt 是纯整数 Goldschmidt 迭代 + 精确收尾判定，结果可证为
 * 正确舍入，故与 Bsqrt 逐比特一致；引入本移植替换系统 sqrt。
 *
 * 来源（musl，逐行誊写，算法与运算顺序完全一致）：
 *   src/math/sqrt.c  src/math/sqrt_data.c（__rsqrt_tab 表）
 *   辅助定义来自 src/internal/libm.h（asuint64/asdouble/predict_false）。
 * musl 本体为 MIT。
 *
 * 与 musl 的差异（均不影响“输入域内”的输出比特）：
 *   1) 去掉 predict_false / eval_as_double：前者只是分支预测提示，
 *      后者是类型求值屏障，都不改变返回值；
 *   2) 去掉 FENV_SUPPORT 收尾的 tiny 加法：tiny 最大为最小次正规数
 *      （2^-1074），对正常结果 y 做最近舍入时 y+t 恒等于 y，
 *      该步仅用于触发 inexact 异常标志位；
 *   3) __math_invalid（负有限输入 / NaN 输入）不再用 (x-x)/(x-x)
 *      制造 NaN，而是直接返回 canonical NaN 0x7FF8000000000000，
 *      与 Coq 侧 fp64_sqrt 的 fp64_unary_nan 输出逐比特一致。
 *      FloatTest 实际向量只在有限非负输入上调用 sqrt，此分支仅作防御。
 *
 * 链接语义：本文件定义 sqrt 符号，链接顺序先于 -lm，shadow 掉
 * libm 的同名函数；全部 TU 需 -fno-builtin-sqrt，防止 gcc 把调用
 * 折叠为内建（x86-64 下 gcc 会把 sqrt 内联为 sqrtsd+修正序列，
 * 语义其实正确，但为保证“调用的就是本移植”仍强制关闭）。
 * ============================================================ */

#include <stdint.h>

#define asuint64(f) ((union{double _f; uint64_t _i;}){f})._i
#define asdouble(i) ((union{uint64_t _i; double _f;}){i})._f

/* __rsqrt_tab：src/math/sqrt_data.c 逐行誊写。
 * if x in [1,2): i = (int)(64*x);
 * if x in [2,4): i = (int)(32*x-64);
 * __rsqrt_tab[i]*2^-16 以 |tab*0x1p-16*sqrt(x) - 1| < 2^-8 估计 1/sqrt(x)。 */
static const uint16_t __rsqrt_tab[128] = {
0xb451,0xb2f0,0xb196,0xb044,0xaef9,0xadb6,0xac79,0xab43,
0xaa14,0xa8eb,0xa7c8,0xa6aa,0xa592,0xa480,0xa373,0xa26b,
0xa168,0xa06a,0x9f70,0x9e7b,0x9d8a,0x9c9d,0x9bb5,0x9ad1,
0x99f0,0x9913,0x983a,0x9765,0x9693,0x95c4,0x94f8,0x9430,
0x936b,0x92a9,0x91ea,0x912e,0x9075,0x8fbe,0x8f0a,0x8e59,
0x8daa,0x8cfe,0x8c54,0x8bac,0x8b07,0x8a64,0x89c4,0x8925,
0x8889,0x87ee,0x8756,0x86c0,0x862b,0x8599,0x8508,0x8479,
0x83ec,0x8361,0x82d8,0x8250,0x81c9,0x8145,0x80c2,0x8040,
0xff02,0xfd0e,0xfb25,0xf947,0xf773,0xf5aa,0xf3ea,0xf234,
0xf087,0xeee3,0xed47,0xebb3,0xea27,0xe8a3,0xe727,0xe5b2,
0xe443,0xe2dc,0xe17a,0xe020,0xdecb,0xdd7d,0xdc34,0xdaf1,
0xd9b3,0xd87b,0xd748,0xd61a,0xd4f1,0xd3cd,0xd2ad,0xd192,
0xd07b,0xcf69,0xce5b,0xcd51,0xcc4a,0xcb48,0xca4a,0xc94f,
0xc858,0xc764,0xc674,0xc587,0xc49d,0xc3b7,0xc2d4,0xc1f4,
0xc116,0xc03c,0xbf65,0xbe90,0xbdbe,0xbcef,0xbc23,0xbb59,
0xba91,0xb9cc,0xb90a,0xb84a,0xb78c,0xb6d0,0xb617,0xb560,
};

/* returns a*b*2^-32 - e, with error 0 <= e < 1.  */
static inline uint32_t mul32(uint32_t a, uint32_t b)
{
	return (uint64_t)a*b >> 32;
}

/* returns a*b*2^-64 - e, with error 0 <= e < 3.  */
static inline uint64_t mul64(uint64_t a, uint64_t b)
{
	uint64_t ahi = a>>32;
	uint64_t alo = a&0xffffffff;
	uint64_t bhi = b>>32;
	uint64_t blo = b&0xffffffff;
	return ahi*bhi + (ahi*blo >> 32) + (alo*bhi >> 32);
}

double sqrt(double x)
{
	uint64_t ix, top, m;

	/* special case handling.  */
	ix = asuint64(x);
	top = ix >> 52;
	if (top - 0x001 >= 0x7ff - 0x001) {
		/* x < 0x1p-1022 or inf or nan.  */
		if (ix * 2 == 0)
			return x;
		if (ix == 0x7ff0000000000000)
			return x;
		if (ix > 0x7ff0000000000000)
			/* musl 为 __math_invalid(x)；见文件头差异说明 3)。 */
			return asdouble(0x7ff8000000000000);
		/* x is subnormal, normalize it.  */
		ix = asuint64(x * 0x1p52);
		top = ix >> 52;
		top -= 52;
	}

	/* argument reduction:
	   x = 4^e m; with integer e, and m in [1, 4)
	   m: fixed point representation [2.62]
	   2^e is the exponent part of the result.  */
	int even = top & 1;
	m = (ix << 11) | 0x8000000000000000;
	if (even) m >>= 1;
	top = (top + 0x3ff) >> 1;

	/* approximate r ~ 1/sqrt(m) and s ~ sqrt(m) when m in [1,4)

	   initial estimate:
	   7bit table lookup (1bit exponent and 6bit significand).

	   iterative approximation:
	   using 2 goldschmidt iterations with 32bit int arithmetics
	   and a final iteration with 64bit int arithmetics.

	   （musl 原注 68 行算法说明此处从略，见上游 src/math/sqrt.c。）

	   the fixed point representations are
	     m: 2.30 r: 0.32, s: 2.30, d: 2.30, u: 2.30, three: 2.30
	   and after switching to 64 bit
	     m: 2.62 r: 0.64, s: 2.62, d: 2.62, u: 2.62, three: 2.62  */

	static const uint64_t three = 0xc0000000;
	uint64_t r, s, d, u, i;

	i = (ix >> 46) % 128;
	r = (uint32_t)__rsqrt_tab[i] << 16;
	/* |r sqrt(m) - 1| < 0x1.fdp-9 */
	s = mul32(m>>32, r);
	/* |s/sqrt(m) - 1| < 0x1.fdp-9 */
	d = mul32(s, r);
	u = three - d;
	r = mul32(r, u) << 1;
	/* |r sqrt(m) - 1| < 0x1.7bp-16 */
	s = mul32(s, u) << 1;
	/* |s/sqrt(m) - 1| < 0x1.7bp-16 */
	d = mul32(s, r);
	u = three - d;
	r = mul32(r, u) << 1;
	/* |r sqrt(m) - 1| < 0x1.3704p-29 (measured worst-case) */
	r = r << 32;
	s = mul64(m, r);
	d = mul64(s, r);
	u = (three<<32) - d;
	s = mul64(s, u);  /* repr: 3.61 */
	/* -0x1p-57 < s - sqrt(m) < 0x1.8001p-61 */
	s = (s - 2) >> 9; /* repr: 12.52 */
	/* -0x1.09p-52 < s - sqrt(m) < -0x1.fffcp-63 */

	/* s < sqrt(m) < s + 0x1.09p-52,
	   compute nearest rounded result:
	   the nearest result to 52 bits is either s or s+0x1p-52,
	   we can decide by comparing (2^52 s + 0.5)^2 to 2^104 m.  */
	uint64_t d0, d1, d2;
	double y;
	d0 = (m << 42) - s*s;
	d1 = s - d0;
	d2 = d1 + s + 1;
	s += d1 >> 63;
	s &= 0x000fffffffffffff;
	s |= top << 52;
	y = asdouble(s);
	(void)d2;
	/* musl 此处还有 FENV_SUPPORT 的 tiny 加法（用到 d2），
	 * 见文件头差异说明 2)。 */
	return y;
}
