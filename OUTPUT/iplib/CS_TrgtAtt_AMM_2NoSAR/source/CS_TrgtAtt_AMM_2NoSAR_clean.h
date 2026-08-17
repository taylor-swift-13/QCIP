#ifndef FLOATTEST_CS_TRGTATT_AMM_2NOSAR_CLEAN_H
#define FLOATTEST_CS_TRGTATT_AMM_2NOSAR_CLEAN_H
#include "IP.h"

typedef struct __CS_TrgtAtt_AMM_2NoSAR {
	Fun fun;
	double csMnvData_qbo0[4];
	double csDriftAngData_Psi_DA;
	double csAttCoreData_Cbiasp[3][3];
	double csAttCoreData_Cro_si[3][3];
	double csAttCoreData_Cro[3][3];
	double csAttCoreData_wri[3];
	double csMnvData_wrb0[3];
	double csLoadAxisData_Csib_DARot[3][3];
	double csMnvData_qrb0[4];
	double csOrbData_coi[3][3];
	double csOrbData_w0i[3];
	double csAttCoreData_qri[4];
	double csAttCoreData_qro[4];
	double csAttCoreData_wro[3];
	double csMnvData_A_Ref_si[3];
	double csAttCoreData_wri_si[3];
} CS_TrgtAtt_AMM_2NoSAR;

void CS_TrgtAtt_AMM_2NoSARFun(void *p);
#endif
