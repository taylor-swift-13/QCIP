#include "IP_CcuUartDataProc.h"

// =======================================================
// 函数实现
// =======================================================

boolu32 CcuUartDataProc(unint08 *buffer08)
{
    /* 数据包状态 */
    polymor tmpAbnormal;
    boolu32 bDataValid;

    unint08 chksum;
    unint16 tmpUn16;
    volatile unint32 tmpUn32;
    volatile unint32 tmpUn32more;
    volatile ulong64 tmpUn64;

    /* 数据包默认状态为有效 */
    tmpAbnormal = 0x00;

    /* 01~02, 帧头: EB90H */
    tmpUn16 = UI16_MAKE(buffer08[0], buffer08[1]);
    if (tmpUn16 != 0xEB90)
    {
        /* 收到非法指令时，不回复，此处设置状态即可，无需做更多处理 */
        tmpAbnormal = 0x11;
    }

    if (sZlqCcuStatus.flgCommValidRecv != 0x00)
    {
        /* 此时串口通讯出现异常 */
        tmpAbnormal = 0xFF;
    }

    /* 92~92, 校验和 */
    chksum = CheckSumAdd08(&buffer08[0], (ZLQ_CCU_RECV_DATA_LEN-1));

    if (buffer08[ZLQ_CCU_RECV_DATA_LEN-1] != chksum)
    {
        /* 此时校验和错误 */
        tmpAbnormal = 0x33;
    }

    /* 预置数据无效 */
    bDataValid = FALSE32;

    if (tmpAbnormal == 0x00)
    {
        /* 设置数据有效 */
        bDataValid = TRUE32;

        /* 03~10, 当拍绝对星时 */
        tmpUn32 = UI32_MAKE(buffer08[2], buffer08[3], buffer08[4], buffer08[5]);
        tmpUn32more = UI32_MAKE(buffer08[6], buffer08[7], buffer08[8], buffer08[9]);
        tmpUn64 = UI64_MAKE32(tmpUn32, tmpUn32more);
        sZlqCcuRecvData.Zt = MEM_TO_FLT64(&tmpUn64);

        /* 11~14 不喷气累积时间 */
        tmpUn32 = UI32_MAKE(buffer08[10], buffer08[11], buffer08[12], buffer08[13]);
        sZlqCcuRecvData.ZtNJSum = (float64)MEM_TO_FLT32(&tmpUn32);

        /* 15~19 */
        sZlqCcuRecvData.ZZT4 = (unint32)buffer08[14];
        sZlqCcuRecvData.ZBZ4 = (unint32)buffer08[15];

        /* 着陆器星敏数据有效为0x05, 无效为0x00 */
        if (buffer08[16] == 0x05)
        {
            sStsRaw[2].bDataValid = TRUE32;
        }
        else
        {
            sStsRaw[2].bDataValid = FALSE32;
        }

        if (buffer08[17] == 0x05)
        {
            sStsRaw[3].bDataValid = TRUE32;
        }
        else
        {
            sStsRaw[3].bDataValid = FALSE32;
        }

        if (buffer08[18] == 0x05)
        {
            sStsRaw[4].bDataValid = TRUE32;
        }
        else
        {
            sStsRaw[4].bDataValid = FALSE32;
        }

        /* 20~43, 着陆器星敏A数据+测量时间 */
        tmpUn32 = UI32_MAKE(buffer08[19], buffer08[20], buffer08[21], buffer08[22]);
        sStsRaw[2].attQuat[0] = (siint32)tmpUn32;
        sStsRaw[2].qv[0] = (float64)sStsRaw[2].attQuat[0] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[23], buffer08[24], buffer08[25], buffer08[26]);
        sStsRaw[2].attQuat[1] = (siint32)tmpUn32;
        sStsRaw[2].qv[1] = (float64)sStsRaw[2].attQuat[1] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[27], buffer08[28], buffer08[29], buffer08[30]);
        sStsRaw[2].attQuat[2] = (siint32)tmpUn32;
        sStsRaw[2].qv[2] = (float64)sStsRaw[2].attQuat[2] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[31], buffer08[32], buffer08[33], buffer08[34]);
        sStsRaw[2].attQuat[3] = (siint32)tmpUn32;
        sStsRaw[2].qv[3] = (float64)sStsRaw[2].attQuat[3] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[35], buffer08[36], buffer08[37], buffer08[38]);
        tmpUn32more = UI32_MAKE(buffer08[39], buffer08[40], buffer08[41], buffer08[42]);
        tmpUn64 = UI64_MAKE32(tmpUn32, tmpUn32more);
        sZlqCcuRecvData.ZtSA = MEM_TO_FLT64(&tmpUn64);
        sStsRaw[2].tSTM = sTime.sstime - sZlqCcuRecvData.ZtSA;
        sStsRaw[2].tS = sZlqCcuRecvData.ZtSA;

        /* 44~67, 着陆器星敏B数据+测量时间 */
        tmpUn32 = UI32_MAKE(buffer08[43], buffer08[44], buffer08[45], buffer08[46]);
        sStsRaw[3].attQuat[0] = (siint32)tmpUn32;
        sStsRaw[3].qv[0] = (float64)sStsRaw[3].attQuat[0] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[47], buffer08[48], buffer08[49], buffer08[50]);
        sStsRaw[3].attQuat[1] = (siint32)tmpUn32;
        sStsRaw[3].qv[1] = (float64)sStsRaw[3].attQuat[1] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[51], buffer08[52], buffer08[53], buffer08[54]);
        sStsRaw[3].attQuat[2] = (siint32)tmpUn32;
        sStsRaw[3].qv[2] = (float64)sStsRaw[3].attQuat[2] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[55], buffer08[56], buffer08[57], buffer08[58]);
        sStsRaw[3].attQuat[3] = (siint32)tmpUn32;
        sStsRaw[3].qv[3] = (float64)sStsRaw[3].attQuat[3] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[59], buffer08[60], buffer08[61], buffer08[62]);
        tmpUn32more = UI32_MAKE(buffer08[63], buffer08[64], buffer08[65], buffer08[66]);
        tmpUn64 = UI64_MAKE32(tmpUn32, tmpUn32more);
        sZlqCcuRecvData.ZtSB = MEM_TO_FLT64(&tmpUn64);
        sStsRaw[3].tSTM = sTime.sstime - sZlqCcuRecvData.ZtSB;
        sStsRaw[3].tS = sZlqCcuRecvData.ZtSB;

        /* 68~91, 着陆器星敏C数据+测量时间 */
        tmpUn32 = UI32_MAKE(buffer08[67], buffer08[68], buffer08[69], buffer08[70]);
        sStsRaw[4].attQuat[0] = (siint32)tmpUn32;
        sStsRaw[4].qv[0] = (float64)sStsRaw[4].attQuat[0] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[71], buffer08[72], buffer08[73], buffer08[74]);
        sStsRaw[4].attQuat[1] = (siint32)tmpUn32;
        sStsRaw[4].qv[1] = (float64)sStsRaw[4].attQuat[1] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[75], buffer08[76], buffer08[77], buffer08[78]);
        sStsRaw[4].attQuat[2] = (siint32)tmpUn32;
        sStsRaw[4].qv[2] = (float64)sStsRaw[4].attQuat[2] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[79], buffer08[80], buffer08[81], buffer08[82]);
        sStsRaw[4].attQuat[3] = (siint32)tmpUn32;
        sStsRaw[4].qv[3] = (float64)sStsRaw[4].attQuat[3] * POW_2E_N30;

        tmpUn32 = UI32_MAKE(buffer08[83], buffer08[84], buffer08[85], buffer08[86]);
        tmpUn32more = UI32_MAKE(buffer08[87], buffer08[88], buffer08[89], buffer08[90]);
        tmpUn64 = UI64_MAKE32(tmpUn32, tmpUn32more);
        sZlqCcuRecvData.ZtSC = MEM_TO_FLT64(&tmpUn64);
        sStsRaw[4].tSTM = sTime.sstime - sZlqCcuRecvData.ZtSC;
        sStsRaw[4].tS = sZlqCcuRecvData.ZtSC;

        /* 计算着陆器当拍相对时刻 */
        sZlqCcuRecvData.tmTimezql  = sTime.sstime - sZlqCcuRecvData.Zt;
    }

    /* 设置数据有效标志 */
    sZlqCcuRecvData.bDataValid = bDataValid;

    /* 设置数据包解析错误码 */
    sZlqCcuRecvData.flgAbnormal = tmpAbnormal;

    return bDataValid;
}