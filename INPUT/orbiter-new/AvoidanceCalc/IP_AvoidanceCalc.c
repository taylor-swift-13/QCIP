#include "IP_AvoidanceCalc.h"

// =======================================================
// 函数实现
// =======================================================

void AvoidanceCalc(void)
{
    float64 vecNorm;
    float64 TmpdR;
    float64 Tmpp[3];
    float64 TmpCIB[3][3];
    float64 tmpMat33[3][3]; /*  */
    float64 rIt;            /*  */
    float64 ht;             /*  */
    float64 p1[3];          /*  */
    float64 p1Neg[3];       /*  */
    float64 tmpVec3[3];     /*  */
    float64 tmpVec3Sec[3];  /*  */
    float64 Tmpa;           /*  */
    float64 Tmpr_LI0[3];    /*  */
    float64 Tmpr_LI1[3];    /*  */
    float64 Tmpr_LI2[3];    /*  */
    unint32 TmpFlg;         /*  */

    float64 TmpFabs1;       /*  */
    float64 TmpFabs2;       /*  */
    float64 TmpFabs3;       /*  */
    float64 TmpMax1;        /*  */
    float64 TmpMax2;        /*  */
    float64 TmpMax3;        /*  */
    float64 TmpMax4;        /*  */
    float64 Tmph;           /*  */
    float64 TmpVec3[3];     /*  */
    float64 TmpVec3Sec[3];  /*  */
    unint32 TmpTDIFlg;      /*  */

    boolu32 bCondOk;
    boolu32 bCondOk2;

    /* ① TmpTDIFlg=0（三维不可成像） */
    TmpTDIFlg = 0;

    /* (1) 若HoverFlg==0且（ZT9(D30)==0或ZT9(D31)==0），则：//进坑平移到位成像条件 */
    if ((sGuideData.bHoverFlg == FALSE32) && (UI32_BIT_GET2(sGncCtrlFlag.ZT9, 30u) != 0x03))
    {
        /* ② 若Sub7Flg<3，则：Tmph=hFTDI1 */
        if (sModeProcess.Sub7Flg < 3)
        {
            Tmph = sAvoidParam.hFTDI1;
        }
        /* 否则：Tmph=hFTDI2 */
        else
        {
            Tmph = sAvoidParam.hFTDI2;
        }

        /* ③ 若max(|h-Tmph|,|Lcy|,|Lcz|)<LcTDI且max(|dh|,|dLcy|,|dLcz|)<dLcTDI且
               max(|φc|,|θc|,|ψc|)<φcTDI且max(|ω[0]|,|ω[1]|,|ω[2]|)<ωTDI，则：TmpTDIFlg=1
        */
        TmpFabs1 = Fabsx(sNaviData.height - Tmph);
        TmpFabs2 = Fabsx(sNaviData.lcy);
        TmpFabs3 = Fabsx(sNaviData.lcz);
        TmpMax1 = Maxx(TmpFabs1, TmpFabs2);
        TmpMax1 = Maxx(TmpMax1, TmpFabs3);

        TmpFabs1 = Fabsx(sNaviData.dh);
        TmpFabs2 = Fabsx(sNaviData.dlcy);
        TmpFabs3 = Fabsx(sNaviData.dlcz);
        TmpMax2 = Maxx(TmpFabs1, TmpFabs2);
        TmpMax2 = Maxx(TmpMax2, TmpFabs3);

        TmpFabs1 = Fabsx(sAttiCtrl.angleErr[0]);
        TmpFabs2 = Fabsx(sAttiCtrl.angleErr[1]);
        TmpFabs3 = Fabsx(sAttiCtrl.angleErr[2]);
        TmpMax3 = Maxx(TmpFabs1, TmpFabs2);
        TmpMax3 = Maxx(TmpMax3, TmpFabs3);

        TmpFabs1 = Fabsx(sGyroData.w[0]);
        TmpFabs2 = Fabsx(sGyroData.w[1]);
        TmpFabs3 = Fabsx(sGyroData.w[2]);
        TmpMax4 = Maxx(TmpFabs1, TmpFabs2);
        TmpMax4 = Maxx(TmpMax4, TmpFabs3);

        if ((TmpMax1 < sAvoidParam.LcTDI) &&
            (TmpMax2 < sAvoidParam.dLcTDI) &&
            (TmpMax3 < sAvoidParam.phicTDI) &&
            (TmpMax4 < sAvoidParam.wTDI))
        {
            TmpTDIFlg = 1;
        }
    }

    /* （2）若HoverFlg==0且（ZT9(D30)==0或ZT9(D31)==0），则：//进坑增加悬停平移功能 */
    if ((sGuideData.bHoverFlg == FALSE32) && (UI32_BIT_GET2(sGncCtrlFlag.ZT9, 30u) != 0x03))
    {
        /* t-tFTDI>dtFTDI */
        if ((sTime.sstime - sFtdiSafeLandData.tFTDI) > sAvoidParam.dtFTDI)
        {
            bCondOk = TRUE32;
        }
        else
        {
            bCondOk = FALSE32;
        }

        /* ① 若Sub7Flg==0，则： */
        if (sModeProcess.Sub7Flg == 0)
        {
            sGuideData.r_tG[0] = sAvoidParam.hFTDI2;
            sGuideData.v_tG[0] = 0.0;
            sGuideData.a_tG[0] = sModeParam.a_tGx22;
        }

        /* ② 若Sub7Flg==0且t-tFTDI>dtFTDI且FTDIFailFlg==0且ZT9(D30)==0且mass>=mass100 ,则： */
        if ((sModeProcess.Sub7Flg == 0) &&
            (bCondOk == TRUE32) &&
            (sFtdiSafeLandData.FTDIFailFlg == 0) &&
            (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 30u) == 0x0) &&
            (sBodyData.mass >= sAvoidParam.mass100))
        {
            sModeProcess.Sub7Flg = 1;
            sNaviData.h100Flg = 1;      /* 100m平移 */
            sModeProcess.t7_1 = sTime.sstime;
            DivNorm(&TmpVec3[0], &sNaviData.r_LI0[0], 3);
            VectorRotation(&TmpVec3Sec[0], &sNaviData.wOrbit[0], &TmpVec3[0], sAvoidParam.alfa100);
            VectorAddCoef(&sNaviData.r_LI0[0], &sNaviData.r_LI0[0], &TmpVec3Sec[0], sAvoidParam.distace100, 3);
        }
        /* ③ 否则若Sub7Flg==0且（FTDIUseFlg==1或者（t-tFTDI>dtFTDI且FTDIFailFlg==1）或者ZT9(D30)==1或者mass<mass100），则： */
        else if ((sModeProcess.Sub7Flg == 0) &&
                 ((sFtdiSafeLandData.FTDIUseFlg == 1) ||
                  ((bCondOk == TRUE32) && (sFtdiSafeLandData.FTDIFailFlg == 1)) ||
                  (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 30u) == 0x1) ||
                  (sBodyData.mass < sAvoidParam.mass100)))
        {
            sModeProcess.Sub7Flg = 3;
            sGuideData.tgo = 50.0;
            sGuideData.nQPGNum = 0;
            sModeProcess.bQPGFirstFlg = TRUE32;
        }
        /* ④ 否则若Sub7Flg==1且（TmpTDIFlg==1或t-t7_1>t7_1to2），则： */
        else if ((sModeProcess.Sub7Flg == 1) && ((TmpTDIFlg == 1) || ((sTime.sstime - sModeProcess.t7_1) > sModeParam.t7_1to2)))
        {
            sModeProcess.Sub7Flg = 2;
        }
        /* ⑤ 否则若Sub7Flg==2且（FTDIUseFlg==1或者t-tFTDI>dtFTDI），则： */
        else if ((sModeProcess.Sub7Flg == 2) && ((sFtdiSafeLandData.FTDIUseFlg == 1) || (bCondOk == TRUE32)))
        {
            sModeProcess.Sub7Flg = 3;
            sGuideData.tgo = 50.0;
            sGuideData.nQPGNum = 0;
            sModeProcess.bQPGFirstFlg = TRUE32;
        }
        /* ⑥ 否则若Sub7Flg==3且（tgo<0或TModemax<0），则： */
        else if ((sModeProcess.Sub7Flg == 3) && ((sGuideData.tgo < 0.0) || (sModeProcess.TModemax < 0.0)))
        {
            sModeProcess.Sub7Flg = 4;
            sGuideData.r_tG[0] = sModeParam.hslw;
            sGuideData.v_tG[0] = sModeParam.vslw3;
            sGuideData.a_tG[0] = sModeParam.a_tGx23;

            sFtdiSafeLandData.tFTDI = 1.0e9;
            sModeProcess.t7_4 = sTime.sstime;
            sNaviData.tLI0 = sTime.sstime - T_128MS;

            VectorEval3(&Tmpr_LI0[0], &sNaviData.ri[0]);
            VectorUnit3(&Tmpr_LI0[0]);
            VectorScalar3(&sNaviData.r_LI0[0], &Tmpr_LI0[0], sNaviData.rM);
        }
        /* ⑦ 否则若Sub7Flg==4且t-tFTDI>dtFTDI且h100Flg==0且ZT9(D31)==0且mass>=mass50 则： */
        else if ((sModeProcess.Sub7Flg == 4) &&
                 (bCondOk == TRUE32) &&
                 (sNaviData.h100Flg == 0) &&
                 (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 31u) == 0x0) &&
                 (sBodyData.mass >= sAvoidParam.mass50))
        {
            sModeProcess.Sub7Flg = 5;
            sModeProcess.t7_5 = sTime.sstime;

            DivNorm(&TmpVec3[0], &sNaviData.r_LI0[0], 3);
            VectorRotation(&TmpVec3Sec[0], &sNaviData.wOrbit[0], &TmpVec3[0], sAvoidParam.alfa100);
            VectorAddCoef(&sNaviData.r_LI0[0], &sNaviData.r_LI0[0], &TmpVec3Sec[0], sAvoidParam.distace50, 3);
        }
        /* ⑧ 否则若Sub7Flg==4且（FTDIUseFlg==1或者（t-tFTDI>dtFTDI且h100Flg==1）或者ZT9(D31)==1 或者mass<mass50），则： */
        else if ((sModeProcess.Sub7Flg == 4) &&
                 ((sFtdiSafeLandData.FTDIUseFlg == 1) ||
                 ((bCondOk == TRUE32) && (sNaviData.h100Flg == 1)) ||
                 (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 31u) == 0x1) ||
                 (sBodyData.mass < sAvoidParam.mass50)))
        {
            sModeProcess.Sub7Flg = 7;
            sGuideData.tgo = 50.0;
            sGuideData.nQPGNum = 0;
            sModeProcess.bQPGFirstFlg = TRUE32;
        }
        /* ⑨ 否则若Sub7Flg==5且（TmpTDIFlg==1或t-t7_5>t7_5to6），则： */
        else if ((sModeProcess.Sub7Flg == 5) && ((TmpTDIFlg == 1) || ((sTime.sstime - sModeProcess.t7_5) > sModeParam.t7_5to6)))
        {
            sModeProcess.Sub7Flg = 6;
        }
        /* ⑩ 否则若Sub7Flg==6且（FTDIUseFlg==1或者t-tFTDI>dtFTDI），则： */
        else if ((sModeProcess.Sub7Flg == 6) &&
                 ((sFtdiSafeLandData.FTDIUseFlg == 1) || (bCondOk == TRUE32)))
        {
            sModeProcess.Sub7Flg = 7;
            sGuideData.tgo = 50.0;
            sGuideData.nQPGNum = 0;
            sModeProcess.bQPGFirstFlg = TRUE32;
        }
        else
        {
            /* 无操作 */
            NULL_STATEMENT();
        }
    }

    /* （3） */
    /* ZT6(D0)=1，高动态三维坑外飞跃避障 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT6, 0) == 1) &&
        (sGuideData.bHoverFlg == TRUE32) &&
        (sNaviData.height < sGuideTransData.hHover))
    {
        sAvoidData.flgFTDI = 1;
    }

    /* ZT6(D1)=1，高动态三维弹道飞跃第一次避障 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT6, 1) == 1) &&
        (sGuideData.bHoverFlg == FALSE32) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 30u) == 0x1) &&
        IN_RANGE_LCUO(sNaviData.height, sAvoidParam.hFTDI2, sAvoidParam.hFTDI1))
    {
        sAvoidData.flgFTDI = 1;
    }

    /* ZT6(D2)=1，高动态三维弹道飞跃第二次避障 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT6, 2) == 1) &&
        (sGuideData.bHoverFlg == FALSE32) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 31u) == 0x1) &&
        (sNaviData.height < sAvoidParam.hFTDI2))
    {
        sAvoidData.flgFTDI = 2;
    }

    /* ZT6(D1)==1且HoverFlg==0且ZT9(D30)==0 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT6, 1) == 1) &&
        (sGuideData.bHoverFlg == FALSE32) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 30u) == 0x0))
    {
        bCondOk = TRUE32;
    }
    else
    {
        bCondOk = FALSE32;
    }

    /* ZT6(D2)==1且HoverFlg==0且ZT9(D31)==0 */
    if ((UI32_BIT_GET1(sGncCtrlFlag.ZT6, 2) == 1) &&
        (sGuideData.bHoverFlg == FALSE32) &&
        (UI32_BIT_GET1(sGncCtrlFlag.ZT9, 31u) == 0x0))
    {
        bCondOk2 = TRUE32;
    }
    else
    {
        bCondOk2 = FALSE32;
    }

    /* "条件1"且Sub7Flg=0 且（TmpTDIFlg==1或t-t70>t7_TDI） */
    if ((bCondOk == TRUE32) && (sModeProcess.Sub7Flg == 0) &&
        ((TmpTDIFlg == 1) || ((sTime.sstime - sModeProcess.t70) > sModeParam.t7_TDI)))
    {
        /* 进坑100m平移前成像 */
        sAvoidData.flgFTDI = 1;
    }

    /* "条件1"且Sub7Flg=2 */
    if ((bCondOk == TRUE32) && (sModeProcess.Sub7Flg == 2))
    {
        /* 进坑100m平移后成像 */
        sAvoidData.flgFTDI = 2;
    }

    /* "条件2"且Sub7Flg=4 且（TmpTDIFlg==1或t-t7_4>t7_TDI） */
    if ((bCondOk2 == TRUE32) && (sModeProcess.Sub7Flg == 4) &&
        ((TmpTDIFlg == 1) || ((sTime.sstime - sModeProcess.t7_4) > sModeParam.t7_TDI)))
    {
        /* 进坑50m平移前成像 */
        sAvoidData.flgFTDI = 3;
    }

    /* "条件2"且Sub7Flg=6 */
    if ((bCondOk2 == TRUE32) && (sModeProcess.Sub7Flg == 6))
    {
        /* 进坑50m平移后成像 */
        sAvoidData.flgFTDI = 4;
    }

    /* （4）若h>(hFTDI1+hFTDI2)/2 */
    if (sNaviData.height > (sAvoidParam.hFTDI2 + sAvoidParam.hFTDI1) / 2.0)
    {
        TmpdR = sAvoidParam.dRFTDI1;
    }
    else
    {
        TmpdR = sAvoidParam.dRFTDI2;
    }

    /* (5) */
    /* 三维成像敏感器成像标志发生变化判定 */
    if ((sAvoidData.flgFTDI != 0) && (sAvoidData.flgFTDI != sAvoidData.flgFTDIOld))
    {
        /* 启动激光三维成像敏感器成像指令序列 */
        /* 设置“安全点获取序列标志” （全局变量）为0xFF */
        sFtdiCtrl.flgSafePointSeq = 0xFF;

        /* 安全点获取序列节拍计数设置为0 */
        sFtdiCtrl.cycleSafePtSeq = 0;
    }

    /* (6) */
    if ((sFtdiSafeLandData.FTDIUseFlg == 1) && (sAvoidData.flgFTDI != 0))
    {
        /* ① 高动态三维安全着陆点有效标志清除(目的是保证收到相机反馈后仅计算一次安全点) */
        sFtdiSafeLandData.FTDIVldFlg = 0;

        /* ② */
        MatrixMulti331(&Tmpp[0], &sAvoidParam.CBC[0][0], &sFtdiSafePointRecv.pFTDI[0]);
        VectorUnit3(&Tmpp[0]);

        /* ③ */
        Q2C(&TmpCIB[0][0], &sFtdiSafeLandData.qFTDI[0]);
        MatrixTran33(&TmpCIB[0][0], &TmpCIB[0][0]);

        /* ④ */
        if ((Tmpp[0] < sAvoidParam.pxMax) &&
            (Fabsx(Tmpp[1]) < sAvoidParam.pyMax) &&
            (Fabsx(Tmpp[2]) < sAvoidParam.pyMax))
        {
            MatrixMulti333(&tmpMat33[0][0], &TmpCIB[0][0], &sAttiModifyParam.cBF[0][0]);
            VectorSub3(&tmpVec3[0], &sAvoidParam.drFTDI[0], &sBodyData.pgoF[0]);
            MatrixMulti331(&tmpVec3[0], &tmpMat33[0][0], &tmpVec3[0]);
            VectorAdd3(&tmpVec3[0], &sFtdiSafeLandData.r_IFTDI[0], &tmpVec3[0]);

            rIt = VectorNorm3(&tmpVec3[0]);
            ht = rIt - sNaviData.rM;

            MatrixMulti331(&p1[0], &TmpCIB[0][0], &Tmpp[0]);

            VectorScalar3(&p1Neg[0], &p1[0], -1.0);
            DivNorm(&tmpVec3Sec[0], &tmpVec3[0], 3);
            Tmpa = VectorDot3(&p1Neg[0], &tmpVec3Sec[0]);

            TmpFlg = 1;

            /* Tmpa<FLT64_ZERO */
            if (Tmpa < FLT64_ZERO)
            {
                TmpFlg = 0;
            }

            if (TmpFlg == 1)
            {
                VectorAddCoef(&Tmpr_LI0[0], &tmpVec3[0], &p1[0], ht/Tmpa, 3);
                VectorRotation(&Tmpr_LI1[0], &Tmpr_LI0[0], &sNaviData.wmi[0], sNaviParam.wM * (sTime.sstime - sFtdiSafeLandData.tFTDI));

                VectorEval3(&Tmpr_LI2[0], &sNaviData.r_LI[0]);

                VectorSub3(&tmpVec3Sec[0], &Tmpr_LI1[0], &Tmpr_LI2[0]);
                vecNorm = VectorNorm3(&tmpVec3Sec[0]);

                if (vecNorm < TmpdR)
                {
                    /* 记录安全着陆点标志 */
                    sAvoidData.flgSLP = sAvoidData.flgFTDI;

                    /* 记录初始惯性系下目标着陆点位置矢量 */
                    VectorEval3(&sNaviData.r_LI0[0], &Tmpr_LI0[0]);

                    /* 记录初始目标着陆点对应时间 */
                    sNaviData.tLI0 = sFtdiSafeLandData.tFTDI;
                }
            }
        }
    }

    /* (7) */
    sAvoidData.flgFTDIOld = sAvoidData.flgFTDI;

    return;
}