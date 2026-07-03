#include "IP_WheelFriction.h"

// =======================================================
// 函数实现
// =======================================================

void WheelFriction( void )
{
    MW_PARAM * para;
    unint32 i;

    para = sMWCtrl.para;

    for ( i = 0; i < 4; i++ )
    {
        if ( sMWData.F_Valid_MW[i] == TRUE32 )
        {
            sMWData.vf[i] = para->kf[i] * sMWData.h[i] / para->cut[i] + para->vf0[i] * Sgn2( sMWData.h[i] );
        }
        else
        {
            sMWData.vf[i] = 0.0;
        }
    }

    return;
}