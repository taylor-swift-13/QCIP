#ifndef FLOATTEST_CS_TRACK_PLAN_CLEAN_H
#define FLOATTEST_CS_TRACK_PLAN_CLEAN_H

#include <stdint.h>
#include "IP.h"

/* The upstream case omits the component-library definition of SMnvrData.
 * The active IP body only takes this field's address, so an opaque payload is
 * sufficient for compiling and checking the real dispatch code. */
typedef struct {
	uint64_t sentinel[2];
} SMnvrData;

typedef struct {
	void (*ExtendedTrack_hook)(void);
} FloatTestMnvTargetHook;

extern FloatTestMnvTargetHook csMnvTrgtHook;

typedef struct __CS_Track_Plan {
	Fun fun;
	unsigned int csMnvPara_FS_MnvTraceStyle;
	SMnvrData csMnvData_mTrack;
	double csMnvPara_t_sinaccMax;
	double csMnvPara_dt_RateRef;
	double csMnvPara_dt_TorqRef;
} CS_Track_Plan;

void MixedTrack(SMnvrData *past, double t_sinacc_max,
		double dt_rate_ref, double dt_torq_ref);
void SinTrackCalculate(SMnvrData *past, double dt_rate_ref,
		double dt_torq_ref);
void AccSinTrackCalculate(SMnvrData *past, double dt_rate_ref,
		double dt_torq_ref);
void CS_Track_PlanFun(void *p);

#endif
