/* Clean compilation wrapper for the active IP body.  The delivered upstream
 * header contains csLoadAxisData_Csib_DARot twice; this wrapper supplies the
 * single logical field used by the C function without rewriting that input. */
#define __CS_TRGTATT_AMM_2NOSAR_H__
#include "CS_TrgtAtt_AMM_2NoSAR_clean.h"

#include "../../../../INPUT/iplib/CS_TrgtAtt_AMM_2NoSAR/source/IP_CS_TrgtAtt_AMM_2NoSAR.c"
