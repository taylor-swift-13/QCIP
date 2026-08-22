#include "IP_CcuUartComm.h"

// =======================================================
// 函数实现
// =======================================================

void CcuUartComm(void)
{
    unint32 lenFifo;
    unint32 recvSize;
    unint32 tmpFlgErr;
    boolu32 bReadData;
    boolu32 bFaultProc;
    boolu32 bDataValid;
    unint08 sendByte;

    /* 主要用于在轨接收着陆器数据进行星敏IMU标定，并正确回复 */

    /* 预置通讯数据无效 */
    bDataValid = FALSE32;

    /* 接口通信使能 */
    if (DEV_GET_COMM(sDevManage.devStatus[DEV_ID_ZLQCCU]) == DEV_STATUS_GOOD)
    {
        /* 回复响应数据0xBB */
        sendByte = 0xBB;

        /* 清读取数据标志 */
        bReadData = FALSE32;

        /* 清故障处理标志 */
        bFaultProc = FALSE32;

        /* 读FIFO内字节长度 */
        lenFifo = Drv_Uart_Get_FIFO_Num(UART_NO_ZLQ_CCU);

        /* 长度有效性判定 */
        if (lenFifo == ZLQ_CCU_RECV_DATA_LEN)
        {
            /* 置读取数据标志 */
            bReadData = TRUE32;
        }
        else
        {
            /* 已接收部分数据 */
            if (sZlqCcuStatus.lenRecved > 0)
            {
                /* 置故障处理标志 */
                bFaultProc = TRUE32;
            }
            /* 未接收 */
            else
            {
                /* 接收数据长度记录 */
                sZlqCcuStatus.lenRecved = lenFifo;
            }
        }

        /* 无通讯判断 */
        if (lenFifo == 0)
        {
            /* 累计串口无通讯计数累加 */
            sZlqCcuStatus.cntUnComm++;

            /* 连续两次 */
            if (sZlqCcuStatus.cntUnComm > 2)
            {
                /* 累计串口无通讯计数清零 */
                sZlqCcuStatus.cntUnComm = 0;

                /* 置故障处理标志 */
                bFaultProc = TRUE32;
            }
        }
        else
        {
            /* 累计串口无通讯计数清零 */
            sZlqCcuStatus.cntUnComm = 0;
        }

        /* 读取数据 */
        if (bReadData == TRUE32)
        {
            /* 接收数据累计长度清零 */
            sZlqCcuStatus.lenRecved = 0;

            /* 反馈数据长度 */
            recvSize = ZLQ_CCU_RECV_DATA_LEN;

            /* 接收数据 */
            sZlqCcuStatus.flgCommValidRecv = UartRecv(UART_NO_ZLQ_CCU, &sZlqCcuStatus.buf[0], &recvSize, &sZlqCcuStatus.numerror);

            /* 数据解析 */
            bDataValid = CcuUartDataProc(&sZlqCcuStatus.buf[0]);

            /* 存在故障 */
            if ((sZlqCcuStatus.flgCommValidRecv != 0) || (bDataValid != TRUE32))
            {
                /* 置故障处理标志 */
                bFaultProc = TRUE32;
            }
            else
            {
                /* 累计串口通讯成功计数 */
                sZlqCcuStatus.cntCommSucc++;

                /* 串口通讯错误连续计数清零 */
                sZlqCcuStatus.cntCommErrorCnt = 0;

                /* 返回0xBB表明接收正常 */
                sZlqCcuStatus.flgCommValidSend = UartSend(UART_NO_ZLQ_CCU, &sendByte, 1);
            }
        }

        /* 故障处理标志 */
        if (bFaultProc == TRUE32)
        {
            /* 串口通讯错误累计计数 */
            sZlqCcuStatus.cntCommError++;

            /* 串口通讯错误连续计数累加 */
            sZlqCcuStatus.cntCommErrorCnt++;

            /* 异常数据存储 */
            tmpFlgErr = UI32_MAKE16((unint32)sZlqCcuStatus.flgCommValidRecv, (unint32)sZlqCcuRecvData.flgAbnormal);
            AbnormalSaveOp(ABNORMAL_DATA_ZLCCCU, tmpFlgErr, ZLQ_CCU_RECV_DATA_LEN, &sZlqCcuStatus.buf[0]);

            /* 故障处理操作 */

            /* 接收数据累计长度清零 */
            sZlqCcuStatus.lenRecved = 0;

            /* 异步串口13, 着陆器CCU串口, 重新初始化 */
            Drv_Uart_Init(UART_NO_ZLQ_CCU, UART_BAUD_115200, UART_EVEN, UART_STOP_1);
        }

        if ((bReadData == TRUE32) || (bFaultProc == TRUE32))
        {
            /* 着陆器星敏通讯有效性更新 */
            sZlqCcuStatus.bCommValid = bDataValid;
        }
    }
    else
    {
        /* 着陆器星敏通讯有效性置为无效 */
        sZlqCcuStatus.bCommValid = bDataValid;
    }

#ifdef DEBUG
    /* test 20230131 */
    // print2("ZCCU1: %x, %x, CDU: %x, %x", sZlqCcuStatus.buf[0], sZlqCcuStatus.flgCommValid, sendByte, sZlqCcuStatus.flgCommValid);
#endif

    return;
}