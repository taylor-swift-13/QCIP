#include "IP_CduToSmuFrameDataPack.h"

// =======================================================
// 函数实现
// =======================================================

void CduToSmuFrameDataPack(unint08 *data, unint08 *dataValid01, unint08 *dataValid02)
{
   unint32 validLen;
   unint32 fillLen;
   unint32 tmpEven;
   unint32 tmpUn32;
   siint16 tmpSi16;
   unint16 tmpUn16;
   unint08 tmpUn08;

    /* 数据有效标志01、02 */
    *dataValid01 = 0x00;
    *dataValid02 = 0x00;

    tmpUn32 = 0x00;

    /* 0001~0001:D3~D0, 表1中第1项内容, GNC状态标识 */
    {
        /* 数据有效标志01-B0:表1中第1项数据 */      /* 正常运行后：每16ms有效标示均有效 */
        UI08_BIT_SET(*dataValid01, 7u);

        UI32_BIT_SET4(tmpUn32, 0, sWalkSendData.tiltAlarm);
    }

    /* 0001~0001:D5~D4, 表1中第2项内容, WIFI相机释放标识 */
    {
        /*
           1) 只有01 10 才能置有效（通讯协议要求，之前未实现）
           2) 发送数据有效标志过后，必须要确认收到数管AA标志（确认收到wifi信息）后才能退模式
           3) 数据有效标志只能发送到AA回复的当拍，当回复AA后，下一拍起，数据有效标志应被置为0
        */
        /* 数据有效标志01-B1:表1中第2项数据 */      /* 根据条件更新有效标示 */
        if ((sWalkRecData.WIFIHshakeSig != 0xAA) &&
            ((UI32_BIT_GET2(sAlignToSmu.SMUWIFIreleaseFlag, 0) == 0x02) || (UI32_BIT_GET2(sAlignToSmu.SMUWIFIreleaseFlag, 0) == 0x01)) &&
            (sSmuLvdsCtrl.bRecvWifiShakeSig != TRUE32))
        {
            UI08_BIT_SET(*dataValid01, 6u);
        }

        /* 该变量在收到数管反馈的“收到WIFI相机释放标识（AAH）”后，置为TRUE */
        if(sWalkRecData.WIFIHshakeSig == 0xAA)
        {
            /* 置WIFI相机释放标识反馈标志 */
            sSmuLvdsCtrl.bRecvWifiShakeSig = TRUE32;
        }

        UI32_BIT_SET2(tmpUn32, 4, sAlignToSmu.SMUWIFIreleaseFlag);
    }

    /* 0001~0001:D7~D6, 表1中第3项内容, 前方地形是否安全 */
    {
        /* 数据有效标志01-B2:表1中第3项数据 */
        if (sFrameCduSend.cntDataItem3 > 0)
        {
            UI08_BIT_SET(*dataValid01, 5u);
            sFrameCduSend.cntDataItem3--;
        }

        UI32_BIT_SET2(tmpUn32, 6, sAlignToSmu.SMUFWSafeIF);
    }

    data[0] = (unint08)tmpUn32;

    /* 0002~0002, 1字节, 表1中第4项内容, 路径规划标识 */
    {
        /* 数据有效标志01-B3:表1中第4项数据 */
        if (sFrameCduSend.cntDataItem4 > 0)
        {
            UI08_BIT_SET(*dataValid01, 4u);
            sFrameCduSend.cntDataItem4--;
        }

        data[1] = (unint08)sAlignToSmu.SMUPathPlanFlag;
    }

    /* 0003~0003, 1字节, 表1中第5项内容, 运动计次 */
    {
        /* 数据有效标志01-B4:表1中第5项数据 */
        if (sFrameCduSend.cntDataItem5 > 0)
        {
            UI08_BIT_SET(*dataValid01, 3u);
            sFrameCduSend.cntDataItem5--;
        }

        data[2] = (unint08)sAlignToSmu.SMUMoveNum;

    #if 0 && DEBUG
        print2("\r\n MN: %d, %d.", sWalkSendData.MoveNum, sFrameCduSend.cntDataItem5);
    #endif
    }

    /* 0004~0009, 6字节, 表1中第6项内容, 飞跃器本体在行走定位参考坐标系下的滚转角（γ）、俯仰角（β）和偏航角（α） */
    {
        /* 数据有效标志01-B5:表1中第6项数据 */      /* 正常运行后：每16ms有效标示均有效 */
        UI08_BIT_SET(*dataValid01, 2u);

        /* 当量30角秒 */
        tmpSi16 = DBL_TO_SI16(sWalkSendData.r_fyq * RAD2DEG / SMU_LVDS_SEC_ARC_30);
        data[3] = UI16_HI8(tmpSi16);
        data[4] = UI16_LO8(tmpSi16);

        tmpSi16 = DBL_TO_SI16(sWalkSendData.p_fyq * RAD2DEG / SMU_LVDS_SEC_ARC_30);
        data[5] = UI16_HI8(tmpSi16);
        data[6] = UI16_LO8(tmpSi16);

        tmpSi16 = DBL_TO_SI16(sWalkSendData.y_fyq * RAD2DEG / SMU_LVDS_SEC_ARC_30);
        data[7] = UI16_HI8(tmpSi16);
        data[8] = UI16_LO8(tmpSi16);
    }

    /* 0010~0015, 6字节, 表1中第7项内容, 飞跃器导航本体坐标系原点在行走定位参考坐标系下的位置（X,Y,Z） */
    {
        /* 数据有效标志01-B6:表1中第7项数据, 确保与任务书中，只有任务编号为偶数是数据才置为有效对应 */
        if (sWalkModeData.TaskNumber % 2 == 0)
        {
            UI08_BIT_SET(*dataValid01, 1u);
        }

        /* 当量为0.005m */
        tmpSi16 = DBL_TO_SI16(sWalkSendData.xn * 200.0);
        data[9 ] = UI16_HI8(tmpSi16);
        data[10] = UI16_LO8(tmpSi16);

        tmpSi16 = DBL_TO_SI16(sWalkSendData.yn * 200.0);
        data[11] = UI16_HI8(tmpSi16);
        data[12] = UI16_LO8(tmpSi16);

        tmpSi16 = DBL_TO_SI16(sWalkSendData.zn * 200.0);
        data[13] = UI16_HI8(tmpSi16);
        data[14] = UI16_LO8(tmpSi16);
    }

    /* 0016~0017, 2字节, 表1中第8项内容, 坡面角1 */
    {
        /* 数据有效标志01-B7:表1中第8项数据 */
        if (sFrameCduSend.cntDataItem8 > 0)
        {
            UI08_BIT_SET(*dataValid01, 0u);
            sFrameCduSend.cntDataItem8--;
        }

        /* 当量30角秒 */
        tmpUn16 = DBL_TO_UN16(sAlignToSmu.SMUSlopeAgl1 * RAD2DEG / SMU_LVDS_SEC_ARC_30);
        data[15] = UI16_HI8(tmpUn16);
        data[16] = UI16_LO8(tmpUn16);
    }

    /* 0018~0019, 2字节, 表1中第9项内容, 坡面角2 */
    {
        /* 数据有效标志02-B0:表1中第9项数据 */
        if (sFrameCduSend.cntDataItem9 > 0)
        {
            UI08_BIT_SET(*dataValid02, 7u);
            sFrameCduSend.cntDataItem9--;
        }

        /* 当量30角秒 */
        tmpUn16 = DBL_TO_UN16(sAlignToSmu.SMUSlopeAgl2 * RAD2DEG / SMU_LVDS_SEC_ARC_30);
        data[17] = UI16_HI8(tmpUn16);
        data[18] = UI16_LO8(tmpUn16);
    }

    /* 0020~0023, 4字节, 表1中第10项内容, 前进距离d和前进方向θ */
    {
        /* 数据有效标志02-B1:表1中第10项数据 */
        if (sFrameCduSend.cntDataItem10 > 0)
        {
            UI08_BIT_SET(*dataValid02, 6u);
            sFrameCduSend.cntDataItem10--;
        }

        /* 当量1mm */
        tmpUn16 = DBL_TO_UN16(sAlignToSmu.SMUd * 1000.0);
        data[19] = UI16_HI8(tmpUn16);
        data[20] = UI16_LO8(tmpUn16);

        /* 当量30角秒 */
        tmpSi16 = DBL_TO_SI16(sAlignToSmu.SMUTurnAgl * RAD2DEG / SMU_LVDS_SEC_ARC_30);

        /* 模飞状态 */
    #if DEBUG_SIMULATE_FLY
        tmpSi16 = 0;
    #endif

        data[21] = UI16_HI8(tmpSi16);
        data[22] = UI16_LO8(tmpSi16);
    }

    /* 0024~0024, 1字节, 表1中第11项内容, 运动故障标识 */
    {
        /* 数据有效标志02-B2:表1中第11项数据 */      /* 正常运行后：每16ms有效标示均有效 */
        UI08_BIT_SET(*dataValid02, 5u);

        data[23] = (unint08)sWalkSendData.MFaultFlag;
    }

    /* 0025~0025, 1字节, 表1中第12项内容, 最后导航点到达标识（含转向） */
    {
        /* 数据有效标志02-B3:表1中第12项数据 */      /* 正常运行后：每16ms有效标示均有效 */
        UI08_BIT_SET(*dataValid02, 4u);

        data[24] = (unint08)sWalkSendData.MstopFlag;
    }

    /* 0026~0033, 8字节, 表1中第13项内容, 填充00H */
    /* 数据有效标志02-B4:表1中第13项数据 */
    Memsetx(&data[25], 0x00, 8);

    /* 0034~0034, 1字节, 表1中第14项内容传输帧计数 */
    tmpEven = sFrameCduSend.cntDataItem14;
    if ((tmpEven & 0x01) == 0x00)
    {
        /* 第1帧计数取0x01 */
        tmpUn08 = 0x01;
    }
    else
    {
        /* 第2帧计数取0x02 */
        tmpUn08 = 0x02;
    }
    data[33] = tmpUn08;

    /* 0035~1013, 979字节, 障碍物信息 */
    {
        /* 数据有效标志02-B5:表1中第14项数据 */
        if (sFrameCduSend.cntDataItem14 > 0)
        {
            UI08_BIT_SET(*dataValid02, 2u);
            sFrameCduSend.cntDataItem14--;
        }

        /* 第一帧数据, 1801字节前979字节 */
        if ((tmpEven & 0x01) == 0x00)
        {
            /* 前979字节 */
            /* 第34个字节, 障碍数量 */
            data[34] = (unint08)sWalkSendData.Haznum;
            Memcpyx(&data[35], &sWalkSendData.HazIfin[0], SMU_LVDS_OBSTACLE_FIRST_PK-1);
        }
        /* 第二帧数据, 1801字节后822数据+157字节填充 */
        else
        {
            validLen = SMU_LVDS_OBSTACLE_TOTAL_LEN - SMU_LVDS_OBSTACLE_FIRST_PK;
            fillLen  = SMU_LVDS_OBSTACLE_FIRST_PK - validLen;

            Memcpyx(&data[34], &sWalkSendData.HazIfin[SMU_LVDS_OBSTACLE_FIRST_PK-1], validLen);
            Memsetx(&data[34 + validLen], 0xAA, fillLen);
        }
    }

    return;
}