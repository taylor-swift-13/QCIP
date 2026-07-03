#include "IP_AttMnvrMain.h"

// =======================================================
// 函数实现
// =======================================================

void targetTrack( void )
{
    float64 tm;
    float64 dt = 0.0;
    float64 sign;

    tm = sTime.tDbl - sAttMnvr.tmstar;

    sign = Sgn2(sAttMnvr.phaim);

    if ( tm < 0.0)
    {  /*  */
        sAttMnvr.ar = 0.0;
        sAttMnvr.dphair = 0.0;
        sAttMnvr.phair = 0.0;
    }
    else if ( tm < sAttMnvr.tm1 )
    {  /*  */
        sAttMnvr.ar = sign * sAttMnvr.amax;
        sAttMnvr.dphair = sAttMnvr.ar * tm;
        sAttMnvr.phair = 0.5 * sAttMnvr.ar * SQUARE(tm);
    }
    else if ( tm < sAttMnvr.tm2 )
    {  /*  */
        sAttMnvr.ar = 0.0;
        sAttMnvr.dphair = sign * sAttMnvr.amax * sAttMnvr.tm1;
        sAttMnvr.phair = sAttMnvr.phaim0 + 0.5 * sign * sAttMnvr.amax * SQUARE( sAttMnvr.tm1 ) + sAttMnvr.dphair * (tm - sAttMnvr.tm1);
    }
    else if ( tm < sAttMnvr.tm3 )
    {  /*  */
        dt = tm - sAttMnvr.tm3;

        sAttMnvr.ar = -sign * sAttMnvr.amax;
        sAttMnvr.dphair = sAttMnvr.ar * dt;
        sAttMnvr.phair = sAttMnvr.phaim + 0.5 *sAttMnvr.ar * SQUARE(dt);
    }
    else  /* tm >= past->tm3 */
    {
        sAttMnvr.ar = 0.0;
        sAttMnvr.dphair = 0.0;
        sAttMnvr.phair = sAttMnvr.phaim;
    }

    sAttMnvr.dEuler = sAttMnvr.phaim - sAttMnvr.phair;
    sAttMnvr.dEuler = ModZ2P( sAttMnvr.dEuler, DBL_PI );

    return;
}

void AttMnvrMain( void )
{
    float64 qtm[4];
    float64 Cw[3];
    float64 sX, cX;
    unint32 workmode;

    workmode = UI8_LO4( WorkMode );

    /* （1）	实时计算 */
    targetTrack();                /* 5.2.9.3（姿态机动过程目标计算 */

	sX = Sinx( sAttMnvr.phair / 2.0 );  /*  */
    cX = Cosx( sAttMnvr.phair / 2.0 );  /*  */

    /* （2）	计算规划机动四元数 */
    qtm[0] = sX * sAttMnvr.e[0];  /* ex */
    qtm[1] = sX * sAttMnvr.e[1];  /* ey */
    qtm[2] = sX * sAttMnvr.e[2];  /* ez */
    qtm[3] = cX;

    /* （3）	计算规划的目标姿态四元数，目标惯性角速度 */
    if ( ( IN_RANGE_CLOSE( workmode, 7, 11 ) ) && ( sAttMnvr.F_AttManeuInVVLH == 1 ) )
    { /* 轨道系机动 */
        QMulti( sAttMnvr.qtm0, sAttMnvr.qb0, qtm );
        QMulti( sAttPub.qti, sAttPub.qoitemp, sAttMnvr.qtm0 );
        Q2C( sAttMnvr.Ctm0[0], sAttMnvr.qtm0 );

        VectorScalar3( sAttPub.wti, sAttMnvr.e, sAttMnvr.dphair );
        MatrixMulti331( Cw, sAttMnvr.Ctm0[0], sAttPub.woitemp );
        VectorAdd3( sAttPub.wti, sAttPub.wti, Cw );
    }
    else
    { /* 惯性系机动 */
        QMulti( sAttPub.qti, sAttMnvr.qb0, qtm );
        VectorScalar3( sAttPub.wti, sAttMnvr.e, sAttMnvr.dphair );
    }

    return;
}