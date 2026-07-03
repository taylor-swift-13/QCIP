#include "IP_STSDataUnpack.h"

// =======================================================
// 函数实现
// =======================================================

void STSDataUnpack( unint32 devNO, unint08 * pSrc )
{
	UTYPECONVER32 uc32;
    llong64 tsm;
    unint32 SyncTemp;
    siint32 offsetTemp; 
    unint32 modeErr = FALSE32;
    unint32 attErr = FALSE32;
    unint32 i;
	unint32 nStarsIden;                 /* 识别星数 */

    uc32.ui32 = 0;
    uc32.si32 = 0;

    sSTSObj[devNO].ADBValid = FALSE32;

    if ( sSTSObj[devNO].dev.comFlag == TRUE32 )
    {
        uc32.ui08[3] = pSrc[34];             /* 通讯计数 */
        uc32.ui08[2] = pSrc[35];
        uc32.ui08[1] = pSrc[36];
        uc32.ui08[0] = pSrc[37];
        SyncTemp = uc32.ui32;

        uc32.ui08[3] = pSrc[38];            /* 积分中心偏移 */
        uc32.ui08[2] = pSrc[39];
        uc32.ui08[1] = pSrc[40];
        uc32.ui08[0] = pSrc[41];
        offsetTemp = uc32.si32;

        nStarsIden = pSrc[43];              /* numStarsIdentified	识别星数 */

        sSTSObj[devNO].mode = UI32_BIT_GET4( pSrc[44], 1);

        if ( sSTSObj[devNO].mode != 0x4 )
        { /* 非C模式 */
        	modeErr = TRUE32;
        }
        if ( UI32_BIT_GET3( pSrc[48], 0) != 0x7 )
        { /* 姿态质量 */
        	attErr = TRUE32;
        }

        if ( ( modeErr == TRUE32 )  /* 非C模式 */
          || ( attErr == TRUE32 )   /* 姿态无效 */
          || ( nStarsIden < 6 )     /* 识别星数不够 */
          || ( ( SyncTemp == sSTSObj[devNO].SYNCCnt ) && ( offsetTemp == sSTSObj[devNO].OffSet ) ) )
        { /*  */
            sSTSObj[devNO].ADBValid = FALSE32;
        }
        else
        { /*  */
            sSTSObj[devNO].ADBValid = TRUE32;
            sSTSObj[devNO].SYNCCnt = SyncTemp;
            sSTSObj[devNO].OffSet = offsetTemp;

            for ( i = 0; i < 4; i++ )
            {
                uc32.ui08[3] = pSrc[12+4*i];   /* 四元数解包 */
                uc32.ui08[2] = pSrc[13+4*i];   /*  */
                uc32.ui08[1] = pSrc[14+4*i];   /*  */
                uc32.ui08[0] = pSrc[15+4*i];   /*  */
        
                sSTSObj[devNO].qINT[i] = uc32.si32;
            }

            tsm = sSyncTime.tLong + sSTSObj[devNO].OffSet;
            if ( tsm > TIME_D2L( sTime.tDbl ) )
            {
                tsm = tsm - 1024000;
            }
            sSTSObj[devNO].attTimeL = tsm;
            sSTSObj[devNO].attTimeMS = sSTSObj[devNO].attTimeL / ONE_MILSEC;

        }

    }

    return;
}