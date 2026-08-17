/* Differential driver for the real CS_Track_PlanFun dispatch body.
 * The three unavailable trajectory algorithms and the application hook are
 * observable stubs: call kind, pointer identity, and forwarded fp64 arguments
 * are emitted as outputs. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "CS_Track_Plan_clean.h"

enum {
	CALL_NONE = 0,
	CALL_MIXED = 1,
	CALL_SIN = 2,
	CALL_ACC_SIN = 3,
	CALL_EXTENDED = 4
};

static SMnvrData *expected_track;
static unsigned int call_kind;
static unsigned int pointer_ok;
static double call_args[3];

static void reset_observation(SMnvrData *track)
{
	expected_track = track;
	call_kind = CALL_NONE;
	pointer_ok = 1;
	call_args[0] = call_args[1] = call_args[2] = 0.0;
}

static void observe_pointer(SMnvrData *past)
{
	if (past != expected_track) pointer_ok = 0;
}

void MixedTrack(SMnvrData *past, double t_sinacc_max,
		double dt_rate_ref, double dt_torq_ref)
{
	observe_pointer(past);
	call_kind = CALL_MIXED;
	call_args[0] = t_sinacc_max;
	call_args[1] = dt_rate_ref;
	call_args[2] = dt_torq_ref;
}

void SinTrackCalculate(SMnvrData *past, double dt_rate_ref,
		double dt_torq_ref)
{
	observe_pointer(past);
	call_kind = CALL_SIN;
	call_args[0] = dt_rate_ref;
	call_args[1] = dt_torq_ref;
}

void AccSinTrackCalculate(SMnvrData *past, double dt_rate_ref,
		double dt_torq_ref)
{
	observe_pointer(past);
	call_kind = CALL_ACC_SIN;
	call_args[0] = dt_rate_ref;
	call_args[1] = dt_torq_ref;
}

static void ExtendedTrack(void)
{
	call_kind = CALL_EXTENDED;
}

FloatTestMnvTargetHook csMnvTrgtHook = {ExtendedTrack};

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
	x ^= x >> 12;
	x ^= x << 25;
	x ^= x >> 27;
	rng_state = x;
	return x * UINT64_C(2685821657736338717);
}

static double random_finite(void)
{
	uint64_t sign = rng64() & (UINT64_C(1) << 63);
	uint64_t exponent = (rng64() % 2046 + 1) << 52;
	uint64_t fraction = rng64() & UINT64_C(0x000fffffffffffff);
	uint64_t b = sign | exponent | fraction;
	double x;
	memcpy(&x, &b, sizeof x);
	return x;
}

static void run_one(unsigned int style, double t_sinacc_max,
		double dt_rate_ref, double dt_torq_ref)
{
	CS_Track_Plan ip;
	memset(&ip, 0, sizeof ip);
	ip.csMnvPara_FS_MnvTraceStyle = style;
	ip.csMnvData_mTrack.sentinel[0] = UINT64_C(0x0123456789abcdef);
	ip.csMnvData_mTrack.sentinel[1] = UINT64_C(0xfedcba9876543210);
	ip.csMnvPara_t_sinaccMax = t_sinacc_max;
	ip.csMnvPara_dt_RateRef = dt_rate_ref;
	ip.csMnvPara_dt_TorqRef = dt_torq_ref;
	reset_observation(&ip.csMnvData_mTrack);

	CS_Track_PlanFun(&ip);

	printf("%u %llu %llu %llu %u %u %llu %llu %llu\n",
		style,
		(unsigned long long)bits(t_sinacc_max),
		(unsigned long long)bits(dt_rate_ref),
		(unsigned long long)bits(dt_torq_ref),
		call_kind, pointer_ok,
		(unsigned long long)bits(call_args[0]),
		(unsigned long long)bits(call_args[1]),
		(unsigned long long)bits(call_args[2]));
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0)
		: UINT64_C(0x243f6a8885a308d3);
	long i;
	unsigned int style_pool[8] = {0, 1, 2, 3, 4, 7, 42, UINT32_MAX};
	rng_state = seed ? seed : 1;

	/* One exact anchor for every branch, including the outer and inner else. */
	run_one(0, 1.25, -0.0, 0.125);
	run_one(1, -2.0, 3.0, -4.0);
	run_one(2, 0.0, -0.25, 0.5);
	run_one(3, 8.0, 16.0, 32.0);
	run_one(4, -8.0, -16.0, -32.0);

	for (i = 0; i < n; ++i) {
		unsigned int style = style_pool[rng64() % 8];
		run_one(style, random_finite(), random_finite(), random_finite());
	}
	return 0;
}
