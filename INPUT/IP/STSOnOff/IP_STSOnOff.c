#include "IP_STSOnOff.h"

// =======================================================
// 函数实现
// =======================================================

void STSOnOff( unint32 devNO, unint32 act )
{
	unint32 partID = 0;
    unint32 bit = 0;
	unint08 para = 0;
    unint32 stsbit[8] = { 0, 1, 4, 5, 6, 7, 2, 3 };

	/* 遍历部件序号 */
    partID = devNO - DEV_STSA;    /* 部件编号顺序匹配 */

	if ( act == OPEN )
	{ /* 加电  */
        bit = stsbit[partID*2] ;
    }
	else if ( act == CLOSE )
	{ /* 断电  */
        bit = stsbit[partID*2 + 1] ;
    }
	else
	{
		/* 特殊设计 */
	}

	UI08_BIT_SET( para, bit );

    sICUObj[0].cmdBuf[15] = para;
    sICUObj[1].cmdBuf[15] = para;

    return;	
}