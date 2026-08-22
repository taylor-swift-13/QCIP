#include "IP_AttDeterWalk.h"

// =======================================================
// 函数实现
// =======================================================

void AttDeterWalk(void)
{
    float64 tmpLmdc;
    float64 tmpLc;
    float64 tmprM;
    float64 tmpFloat;
    float64 alphaHn;
    float64 alphaHt;
    float64 tmpSinAlpHn;
    float64 tmpCosAlpHn;
    float64 tmpSinAlpHt;
    float64 tmpCosAlpHt;
    float64 tmpr[3];
    float64 tmpMat33[3][3];
    float64 tmpMat33T[3][3];

    /* （1）Tmpλc=λcAL，TmpLc=LcAL，TmprM=rM */
    tmpLmdc = sNaviData.lmdcal;
    tmpLc = sNaviData.lcal;
    tmprM = sNaviData.rM;

    /* （3） */
    tmpFloat = tmprM * Cosx(tmpLc);
    tmpr[0] = tmpFloat * Cosx(tmpLmdc);
    tmpr[1] = tmpFloat * Sinx(tmpLmdc);
    tmpr[2] = tmprM * Sinx(tmpLc);

    /* （4）极区导航坐标系相对月固系的转换矩阵CNM */
    alphaHn = Atan2x(tmpr[0], tmpr[2]);
    alphaHt = Asinx(tmpr[1] / tmprM);

    tmpSinAlpHn = Sinx(alphaHn);
    tmpCosAlpHn = Cosx(alphaHn);
    tmpSinAlpHt = Sinx(alphaHt);
    tmpCosAlpHt = Cosx(alphaHt);

    sNaviData.cnm[0][0] = -tmpSinAlpHt*tmpSinAlpHn;
    sNaviData.cnm[0][1] = tmpCosAlpHt;
    sNaviData.cnm[0][2] = -tmpSinAlpHt*tmpCosAlpHn;
    sNaviData.cnm[1][0] = tmpCosAlpHn;
    sNaviData.cnm[1][1] = 0.0;
    sNaviData.cnm[1][2] = -tmpSinAlpHn;
    sNaviData.cnm[2][0] = -tmpCosAlpHt*tmpSinAlpHn;
    sNaviData.cnm[2][1] = -tmpSinAlpHt;
    sNaviData.cnm[2][2] = -tmpCosAlpHt*tmpCosAlpHn;

    /* （5）导航本体坐标系相对极区导航坐标系的转换矩阵CFBN */

    /* CFBN= CFBF•CBF^T•CBI•CMIT•CNMT */

    /* CMIT•CNMT */
    MatrixTran33(&tmpMat33T[0][0], &sNaviData.cnm[0][0]);
    MatrixTran33(&tmpMat33[0][0], &sNaviData.cmi[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33[0][0], &tmpMat33T[0][0]);

    /* CBI•CMIT•CNMT */
    MatrixMulti333(&tmpMat33[0][0], &sAttiData.cbi[0][0], &tmpMat33[0][0]);

    /* CBFT•CBI•CMIT•CNMT */
    MatrixTran33(&tmpMat33T[0][0], &sAttiModifyParam.cBF[0][0]);
    MatrixMulti333(&tmpMat33[0][0], &tmpMat33T[0][0], &tmpMat33[0][0]);

    /* CFBN=CFBF•CBF^T•CBI•CMIT•CNMT */
    MatrixMulti333(&sNaviData.cfbn[0][0], &sAttiModifyParam.cFBF[0][0], &tmpMat33[0][0]);

    return;
}