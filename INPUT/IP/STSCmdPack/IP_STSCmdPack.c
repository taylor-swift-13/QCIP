#include "IP_STSCmdPack.h"

// =======================================================
// 函数实现
// =======================================================

unint32 STSCmdPack( unint32 devNO, unint32 cmdID )
{
    unint32 pkLen = 0;
    unint32 chkSum = 0;
    unint32 cmdLen = 0;
    unint32 valid = TRUE32;
    unint08 * pBuf;

    pBuf = &sSTSObj[devNO].testBuf[0];
    Memsetx( pBuf, 0, 64 );

    pBuf[0] = 0xA4;    /* 前缀 */
    pBuf[1] = 0x2B;
    pBuf[2] = 0xB1;
    pBuf[3] = 0xF2;
    
    switch ( cmdID )
    {
        case 1:    /* 停止通信 TC_SET_MHK_RATES */
            pBuf[8] = 0x0D;    /* 指令标识 */
            cmdLen = 40;       /* 指令长度 */
            break;
        
        case 2:    /* 恢复通信 TC_SET_MHK_RATES */
            pBuf[8] = 0x0D;    /* 指令标识 */
            /* ADB包 */                    
//            pBuf[15] = 3;      /* 13~16 mhk控制 CAP = 3 */
            pBuf[17] = 1;      /* 17~18 = 1  同RTS频率  */
            pBuf[18] = 0xFF;   /* 19~20 = 0xFFFF */
            pBuf[19] = 0xFF;   /* 不停止 */
            /* HK1包 */                    
            pBuf[25] = 1;      /* 25~26 = 1  同RTS频率  */
            pBuf[26] = 0xFF;   /* 27~28 = 0xFFFF */
            pBuf[27] = 0xFF;   /* 不停止 */

            cmdLen = 40;       /* 指令长度 */
            break;

        case 3:    /* 进入待机模式 TC_STANDBY */
            pBuf[8] = 0x02;    /* 指令标识 */
            pBuf[13] = 0x20;   /* 13~14 mcFlag = 0x20 b5＝1：禁止STANDBY模式→模式A */
            pBuf[14] = 0x00;   /* 15~16 */
            pBuf[15] = 0x20;   /* b5＝0 */
            cmdLen = 4;        /* 指令长度 */
            break;

        case 4:    /* 退出待机模式 TC_STANDBY */
            pBuf[8] = 0x02;    /* 指令标识 */
            /* 13~14 mcFlag = 0x00  */
            pBuf[14] = 0x00;   /* 15~16 */
            pBuf[15] = 0x20;   /* FFFF */

            cmdLen = 4;        /* 指令长度 */
            break;

        case 5:    /* 复位 TC_RESET */
            pBuf[8] = 0x1;     /* 指令标识 */
            cmdLen = 0;        /* 指令长度 */
            break;

        case 6:    /* 看门狗复位  TC_WDG_RESTART */
            pBuf[8] = 0xFE;    /* 指令标识 */
            cmdLen = 0;        /* 指令长度 */
            break;

        default:
            valid = FALSE32;
            break;
    }

    if ( valid == TRUE32 )
    { /* 指令有效 */
        pBuf[9]  = UI32_HILO8(cmdLen);
        pBuf[10] = UI32_LOHI8(cmdLen);
        pBuf[11] = UI32_LOLO8(cmdLen);
        pkLen = cmdLen + 12;

        chkSum = CheckSumAdd08to32( &pBuf[8], (siint32)( cmdLen + 4 ) );    /* 校验和 */
        pBuf[4] = UI32_HIHI8(chkSum);
        pBuf[5] = UI32_HILO8(chkSum);
        pBuf[6] = UI32_LOHI8(chkSum);
        pBuf[7] = UI32_LOLO8(chkSum);
    }

    return pkLen;
}