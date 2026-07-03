#include "IP_AntennaDistTorq.h"

// =======================================================
// 函数实现
// =======================================================

void AntennaDistTorq( void )
{
	float64 Aafj;
	float64 Bafj;
	float64 wDTaj;
	float64 wDTbj;
	float64 HsigmaDTpatj[3];
	float64 HsigmaDT[3];

	float64 CGa1j[3][3];
	float64 CGa2j[3][3];
	float64 CGa1a2j[3][3];
	float64 sAaf;
	float64 cAaf;
	float64 sBaf;
	float64 cBaf;

	float64 CBa1j[3][3];	
	float64 CBa2j[3][3];	
	float64 C_T[3][3];
	float64 roc1[3];
	float64 roo2[3];
	float64 roc2[3];
	float64 Bwa1[3];
	float64 Bwa2[3];

	float64 JC[3][3];
	float64 CJC[3][3];
	float64 rorT[3][3];
	float64 rTor;

	float64 Ja11[3][3];
	float64 Ja12[3][3];
	float64 Ja21[3][3];
	float64 Ja22[3][3];
	float64 Ja23[3][3];
	float64 Ha1[3];
	float64 Ha2[3];

	float64 Cr[3];
	float64 wDT[3] = { 0.0, 0.0, 0.0 };


	/* (1)	赋值 */
	Aafj  = sAntennaCtrl.Aaf;    /* αaf,j=αaf */
    Bafj  = sAntennaCtrl.Baf;    /* βaf,j=βaf */
    wDTaj = sAntennaCtrl.wDTa;   /* ωDTα,j=ωDTα */
    wDTbj = sAntennaCtrl.wDTb;   /* ωDTβ,j=ωDTβ */
    V3Copy( HsigmaDTpatj, sAntennaCtrl.HsigmaDtpat );

	/* 矩阵设置 */
	sAaf = Sinx( Aafj );   /*  */
    cAaf = Cosx( Aafj );   /*  */
    sBaf = Sinx( Bafj );   /*  */
    cBaf = Cosx( Bafj );   /*  */

    CGa1j[0][0] = 1.0; CGa1j[0][1] = 0.0;  CGa1j[0][2] =  0.0;     /*  */
    CGa1j[1][0] = 0.0; CGa1j[1][1] = cAaf; CGa1j[1][2] = -sAaf;    /*  */   
    CGa1j[2][0] = 0.0; CGa1j[2][1] = sAaf; CGa1j[2][2] =  cAaf;    /*  */ 

    CGa1a2j[0][0] =  cBaf; CGa1a2j[0][1] = 0.0; CGa1a2j[0][2] = sBaf;   /*  */
    CGa1a2j[1][0] =  0.0;  CGa1a2j[1][1] = 1.0; CGa1a2j[1][2] = 0.0;    /*  */  
    CGa1a2j[2][0] = -sBaf; CGa1a2j[2][1] = 0.0; CGa1a2j[2][2] = cBaf;   /*  */ 

    CGa2j[0][0] =  cBaf;      CGa2j[0][1] = 0.0;   CGa2j[0][2] =  sBaf;        /*  */
    CGa2j[1][0] =  sAaf*sBaf; CGa2j[1][1] = cAaf;  CGa2j[1][2] = -sAaf*cBaf;   /*  */   
    CGa2j[2][0] = -cAaf*sBaf; CGa2j[2][1] = sAaf;  CGa2j[2][2] =  cAaf*cBaf;   /*  */ 

	/* (2)	天线X轴运动角动量计算(略去星体速度影响)： */
    MatrixTran33( C_T[0], sAntennaCtrl.CAntenna[0] );
    MatrixMulti333( CBa1j[0], C_T[0], CGa1j[0] );

	MatrixMulti331( Cr, CBa1j[0], sAntennaPara.ro1c1 );
	VectorAdd3( roc1, sAntennaPara.ro1, Cr );
	
    wDT[0] = wDTaj;
    wDT[1] = 0.0;
    wDT[2] = 0.0;
	MatrixMulti331( Bwa1, CBa1j[0], wDT );

    MatrixTran33( C_T[0], CBa1j[0] );
	MatrixMulti333( JC[0], sAntennaPara.Ja1[0], C_T[0] );
	MatrixMulti333( CJC[0], CBa1j[0], JC[0]); 
	
    rTor = VectorDot3( roc1, roc1 );
	MatrixMulti313( rorT[0], roc1, roc1 );
	MatrixIdentity33( Ja11[0] );
    MatrixMultiScalar33( Ja11[0], Ja11[0], rTor );
	MatrixSub33( Ja11[0], Ja11[0], rorT[0] );
	MatrixMultiScalar33( Ja11[0], Ja11[0], sAntennaPara.ma1 );
	MatrixAdd33( Ja11[0], Ja11[0], CJC[0] );

    rTor = VectorDot3( roc1, sAntennaPara.ro1 );
	MatrixMulti313( rorT[0], sAntennaPara.ro1, roc1 );
	MatrixIdentity33( Ja12[0] );
    MatrixMultiScalar33( Ja12[0], Ja12[0], rTor );
	MatrixSub33( Ja12[0], Ja12[0], rorT[0] );
	MatrixMultiScalar33( Ja12[0], Ja12[0], sAntennaPara.ma1 );

	MatrixSub33( JC[0], Ja11[0], Ja12[0] );
	MatrixMulti331( Ha1, JC[0], Bwa1 );

    /* (3)	天线Y轴运动角动量计算(略去星体速度影响)： */
    MatrixTran33( C_T[0], sAntennaCtrl.CAntenna[0] );
    MatrixMulti333( CBa2j[0], C_T[0], CGa2j[0] );

    wDT[0] = 0.0;
    wDT[1] = wDTbj;
    wDT[2] = 0.0;
	MatrixMulti331( Bwa2, CBa2j[0], wDT );

	MatrixMulti331( Cr, CBa1j[0], sAntennaPara.ro1o2 );
	VectorAdd3( roo2, sAntennaPara.ro1, Cr );
	
	MatrixMulti331( Cr, CBa2j[0], sAntennaPara.ro2c2 );
	VectorAdd3( roc2, roo2, Cr );

    MatrixTran33( C_T[0], CBa2j[0] );
	MatrixMulti333( JC[0], sAntennaPara.Ja2[0], C_T[0] );
	MatrixMulti333( CJC[0], CBa2j[0], JC[0]); 

    rTor = VectorDot3( roc2, roc2 );
    MatrixMulti313( rorT[0], roc2, roc2 );
	MatrixIdentity33( Ja21[0] );
	MatrixMultiScalar33( Ja21[0], Ja21[0], rTor );
	MatrixSub33( Ja21[0], Ja21[0], rorT[0] );
	MatrixMultiScalar33( Ja21[0], Ja21[0], sAntennaPara.ma2 );
	MatrixAdd33( Ja21[0], Ja21[0], CJC[0] );

    rTor = VectorDot3( roc2, sAntennaPara.ro1 );
	MatrixMulti313( rorT[0], sAntennaPara.ro1, roc2 );
	MatrixIdentity33( Ja22[0] );
    MatrixMultiScalar33( Ja22[0], Ja22[0], rTor );
	MatrixSub33( Ja22[0], Ja22[0], rorT[0] );
	MatrixMultiScalar33( Ja22[0], Ja22[0], sAntennaPara.ma2 );

    rTor = VectorDot3( roc2, roo2 );
	MatrixMulti313( rorT[0], roo2, roc2 );
	MatrixIdentity33( Ja23[0] );
    MatrixMultiScalar33( Ja23[0], Ja23[0], rTor );
	MatrixSub33( Ja23[0], Ja23[0], rorT[0] );
	MatrixMultiScalar33( Ja23[0], Ja23[0], sAntennaPara.ma2 );

	MatrixSub33( JC[0], Ja21[0], Ja22[0] );
	MatrixMulti331( Ha2, JC[0], Bwa1 );
	MatrixSub33( JC[0], Ja21[0], Ja23[0] );
	MatrixMulti331( Cr, JC[0], Bwa2 );
	VectorAdd3( Ha2, Ha2, Cr );

	/* (4)	计算天线运动扰动力矩(略去星体运动产生的陀螺力矩)： */
    VectorAdd3( HsigmaDT, Ha1, Ha2 );
	VectorSub3( sAntennaCtrl.TDT, HsigmaDT, HsigmaDTpatj );
	VectorScalar3( sAntennaCtrl.TDT, sAntennaCtrl.TDT, 1.0 / sTime.prd );

    V3Copy( sAntennaCtrl.HsigmaDtpat, HsigmaDT );

 	return;
}