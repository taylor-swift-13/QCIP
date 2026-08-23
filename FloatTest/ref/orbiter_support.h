/* Deterministic compatibility/runtime support for INPUT/orbiter-new FloatTest
 * drivers.  The input snapshot omits the original project's scalar typedefs
 * and many utility implementations.  Case READMEs identify which helpers are
 * used as reconstructed shared implementations and which callees are replaced
 * by case-local observable stubs. */
#ifndef FLOATTEST_ORBITER_SUPPORT_H
#define FLOATTEST_ORBITER_SUPPORT_H

#include <assert.h>
#include <inttypes.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint8_t unint08;
typedef int8_t siint08;
typedef uint16_t unint16;
typedef int16_t siint16;
typedef uint32_t unint32;
typedef int32_t siint32;
typedef uint64_t ulong64;
typedef int64_t llong64;
typedef float float32;
typedef double float64;
typedef uint32_t boolu32;
typedef uint32_t polymor;

#ifndef TRUE32
#define TRUE32 UINT32_C(1)
#endif
#ifndef FALSE32
#define FALSE32 UINT32_C(0)
#endif
#ifndef FLT64_ZERO
#define FLT64_ZERO 0.0
#endif
#ifndef FLT32_ZERO
#define FLT32_ZERO 0.0f
#endif
#ifndef MASK_ALL8F
#define MASK_ALL8F UINT32_C(0xffffffff)
#endif
#ifndef MASK_HI24
#define MASK_HI24 UINT32_C(0xffffff00)
#endif

#define ASSERT(c) assert(c)
#define NULL_STATEMENT() ((void)0)

#define UI32_BIT_GET1(v, p) (((uint32_t)(v) >> (p)) & UINT32_C(1))
#define UI32_BIT_GET2(v, p) (((uint32_t)(v) >> (p)) & UINT32_C(3))
#define UI32_BIT_SET1(v, p, b) \
    ((v) = ((uint32_t)(v) & ~(UINT32_C(1) << (p))) | \
           (((uint32_t)(b) & UINT32_C(1)) << (p)))
#define UI32_BIT_SET2(v, p, b) \
    ((v) = ((uint32_t)(v) & ~(UINT32_C(3) << (p))) | \
           (((uint32_t)(b) & UINT32_C(3)) << (p)))
#define UI32_BIT_SET4(v, p, b) \
    ((v) = ((uint32_t)(v) & ~(UINT32_C(15) << (p))) | \
           (((uint32_t)(b) & UINT32_C(15)) << (p)))
#define UI32_BIT_SET8(v, p, b) \
    ((v) = ((uint32_t)(v) & ~(UINT32_C(255) << (p))) | \
           (((uint32_t)(b) & UINT32_C(255)) << (p)))
#define UI08_BIT_CLR(v, p) ((v) = (uint8_t)((v) & (uint8_t)~(uint8_t)(1u << (p))))
#define UI08_BIT_SET(v, p) ((v) = (uint8_t)((v) | (uint8_t)(1u << (p))))
#define UI08_BIT_SET1(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(1u << (p))) | \
                     (uint8_t)(((b) & 1u) << (p))))
#define UI08_BIT_SET2(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(3u << (p))) | \
                     (uint8_t)(((b) & 3u) << (p))))
#define UI08_BIT_SET3(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(7u << (p))) | \
                     (uint8_t)(((b) & 7u) << (p))))
#define UI08_BIT_SET4(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(15u << (p))) | \
                     (uint8_t)(((b) & 15u) << (p))))
#define UI08_BIT_SET5(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(31u << (p))) | \
                     (uint8_t)(((b) & 31u) << (p))))
#define UI08_BIT_SET6(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(63u << (p))) | \
                     (uint8_t)(((b) & 63u) << (p))))
#define UI08_BIT_SET7(v, p, b) \
    ((v) = (uint8_t)(((v) & (uint8_t)~(uint8_t)(127u << (p))) | \
                     (uint8_t)(((b) & 127u) << (p))))

#define UI16_MAKE(a, b) ((uint16_t)(((uint16_t)(a) << 8) | (uint16_t)(b)))
#define UI32_MAKE(a, b, c, d) \
    ((uint32_t)(((uint32_t)(a) << 24) | ((uint32_t)(b) << 16) | \
                ((uint32_t)(c) << 8) | (uint32_t)(d)))
#define UI32_MAKE16(a, b) ((uint32_t)(((uint32_t)(a) << 16) | (uint32_t)(b)))
#define UI64_MAKE32(a, b) ((uint64_t)(((uint64_t)(a) << 32) | (uint64_t)(b)))
#define UI32_HI16(v) ((uint16_t)((uint32_t)(v) >> 16))
#define UI32_LO16(v) ((uint16_t)(uint32_t)(v))
#define UI16_HI8(v) ((uint8_t)((uint16_t)(v) >> 8))
#define UI16_LO8(v) ((uint8_t)(uint16_t)(v))
#define UI32_HIHI8(v) ((uint8_t)((uint32_t)(v) >> 24))
#define UI32_HILO8(v) ((uint8_t)((uint32_t)(v) >> 16))
#define UI32_LOHI8(v) ((uint8_t)((uint32_t)(v) >> 8))
#define UI32_LOLO8(v) ((uint8_t)(uint32_t)(v))

#define IN_RANGE_CLOSE(v, lo, hi) (((v) >= (lo)) && ((v) <= (hi)))

static inline uint64_t ft_bits64(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof bits);
    return bits;
}

static inline double ft_from_bits64(uint64_t bits)
{
    double value;
    memcpy(&value, &bits, sizeof value);
    return value;
}

static inline uint32_t ft_bits32(float value)
{
    uint32_t bits;
    memcpy(&bits, &value, sizeof bits);
    return bits;
}

/* The orbiter-new extraction refers to these project conversion helpers but
 * does not carry their declarations/definitions.  They provide the ordinary
 * in-range C conversion and bit-copy behavior needed to compile the original
 * switch bodies; individual case READMEs state whether those branches run. */
static inline uint32_t DBL_TO_UN32(double value) { return (uint32_t)(uint64_t)value; }
static inline uint16_t DBL_TO_UN16(double value) { return (uint16_t)(uint64_t)value; }
static inline uint8_t DBL_TO_UN08(double value) { return (uint8_t)(uint64_t)value; }
static inline int32_t DBL_TO_SI32(double value) { return (int32_t)(int64_t)value; }
static inline int16_t DBL_TO_SI16(double value) { return (int16_t)(int64_t)value; }
static inline uint32_t FLT32_TO_MEM(const float *value)
{
    uint32_t bits;
    memcpy(&bits, value, sizeof bits);
    return bits;
}

static inline float ft_from_bits32(uint32_t bits)
{
    float value;
    memcpy(&value, &bits, sizeof value);
    return value;
}

static inline uint64_t ft_prng_next(uint64_t *state)
{
    uint64_t x = *state;
    x ^= x >> 12;
    x ^= x << 25;
    x ^= x >> 27;
    *state = x;
    return x * UINT64_C(2685821657736338717);
}

static inline double ft_prng_finite(uint64_t *state, double scale)
{
    int64_t centered = (int64_t)(ft_prng_next(state) % UINT64_C(2000001)) - INT64_C(1000000);
    return ((double)centered / 1000000.0) * scale;
}

static inline unsigned long ft_count_arg(int argc, char **argv)
{
    return argc > 1 ? strtoul(argv[1], NULL, 0) : 1000ul;
}

static inline uint64_t ft_seed_arg(int argc, char **argv)
{
    uint64_t seed = argc > 2 ? (uint64_t)strtoull(argv[2], NULL, 0)
                             : UINT64_C(0x9e3779b97f4a7c15);
    return seed == 0 ? UINT64_C(0x9e3779b97f4a7c15) : seed;
}

static inline double Fabsx(double x) { return fabs(x); }
static inline double Maxx(double x, double y) { return x > y ? x : y; }
static inline double Minx(double x, double y) { return x < y ? x : y; }
static inline double NZ(double x, double fallback) { return x == 0.0 ? fallback : x; }
static inline double LimitDouble(double x, double limit)
{
    if (x > limit) return limit;
    if (x < -limit) return -limit;
    return x;
}

double ported_sin(double x);
double ported_cos(double x);
#define Sinx(x) ported_sin((x))
#define Cosx(x) ported_cos((x))
#define Sqrtx(x) sqrt((x))

static inline void Memcpyx(void *dst, const void *src, uint32_t n)
{
    memcpy(dst, src, n);
}

static inline void Memsetx(void *dst, int value, uint32_t n)
{
    memset(dst, value, n);
}

static inline void VectorZero(double *dst, uint32_t n)
{
    for (uint32_t i = 0; i < n; ++i) dst[i] = 0.0;
}

static inline void VectorZero3(double *dst) { VectorZero(dst, 3); }

static inline void VectorZeroSint32(int32_t *dst, uint32_t n)
{
    for (uint32_t i = 0; i < n; ++i) dst[i] = 0;
}

static inline void VectorEval(double *dst, const double *src, uint32_t n)
{
    memmove(dst, src, n * sizeof *dst);
}

static inline void VectorEval3(double *dst, const double *src) { VectorEval(dst, src, 3); }
static inline void VectorEval4(double *dst, const double *src) { VectorEval(dst, src, 4); }

static inline void VectorAdd(double *dst, const double *a, const double *b, uint32_t n)
{
    for (uint32_t i = 0; i < n; ++i) dst[i] = a[i] + b[i];
}

static inline void VectorAdd3(double *dst, const double *a, const double *b)
{
    VectorAdd(dst, a, b, 3);
}

static inline void VectorSub3(double *dst, const double *a, const double *b)
{
    for (uint32_t i = 0; i < 3; ++i) dst[i] = a[i] - b[i];
}

static inline void VectorScalar(double *dst, const double *src, double k, uint32_t n)
{
    for (uint32_t i = 0; i < n; ++i) dst[i] = src[i] * k;
}

static inline void VectorScalar3(double *dst, const double *src, double k)
{
    VectorScalar(dst, src, k, 3);
}

static inline void VectorAddCoef(double *dst, const double *a, const double *b,
                                 double k, uint32_t n)
{
    for (uint32_t i = 0; i < n; ++i) dst[i] = a[i] + k * b[i];
}

static inline double VectorDot3(const double *a, const double *b)
{
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
}

static inline void VectorCross3(double *dst, const double *a, const double *b)
{
    double out[3] = {
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0]
    };
    VectorEval3(dst, out);
}

static inline double VectorNorm3(const double *a)
{
    return sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
}

static inline void VectorUnit3(double *a)
{
    double norm = VectorNorm3(a);
    if (norm != 0.0) {
        a[0] /= norm;
        a[1] /= norm;
        a[2] /= norm;
    }
}

static inline void MatrixTran33(double *dst, const double *src)
{
    double out[9];
    for (uint32_t i = 0; i < 3; ++i)
        for (uint32_t j = 0; j < 3; ++j)
            out[i * 3 + j] = src[j * 3 + i];
    VectorEval(dst, out, 9);
}

static inline void MatrixMulti333(double *dst, const double *a, const double *b)
{
    double out[9];
    for (uint32_t i = 0; i < 3; ++i)
        for (uint32_t j = 0; j < 3; ++j) {
            out[i * 3 + j] = 0.0;
            for (uint32_t k = 0; k < 3; ++k)
                out[i * 3 + j] += a[i * 3 + k] * b[k * 3 + j];
        }
    VectorEval(dst, out, 9);
}

static inline void MatrixMulti331(double *dst, const double *a, const double *b)
{
    double out[3];
    for (uint32_t i = 0; i < 3; ++i)
        out[i] = a[i * 3] * b[0] + a[i * 3 + 1] * b[1] + a[i * 3 + 2] * b[2];
    VectorEval3(dst, out);
}

static inline void MatrixEval(double *dst, const double *src, uint32_t rows, uint32_t cols)
{
    VectorEval(dst, src, rows * cols);
}

static inline void MatrixZero(double *dst, uint32_t rows, uint32_t cols)
{
    VectorZero(dst, rows * cols);
}

#endif
