#include "IP_STSUseFlag.h"

// =======================================================
// 函数实现
// =======================================================

void STSUseFlag( void )
{
    if ( sSTSAtt.dataSrc == 1 )
    { /* 选用着陆器星敏数据 */
        if ( sBusSTSObj.update == TRUE32 )
        { /* 总线有新数据更新 */
            if ( sSTSAtt.stsFlg == 1 )
            {  /* 对应着陆器星敏A */
                sSTSAtt.stsFlg = 6;
            }
            else if ( sSTSAtt.stsFlg == 2 )
            {  /* 对应着陆器星敏B */
                sSTSAtt.stsFlg = 7;
            }
            else if ( sSTSAtt.stsFlg == 4 )
            {  /* 对应着陆器星敏C */
                sSTSAtt.stsFlg = 8;
            }
            else
            {
                /* 特殊设计 */
            }

            sSTSAtt.useOld = sSTSAtt.stsFlg;

        }
        else
        { /* 总线无新数据 */
            if ( sSTSAtt.stsFlg != 3 )
            { /* 星敏C不可用 维持最近一次的使用状态 */
                sSTSAtt.stsFlg = sSTSAtt.useOld;
            }
            /* else 星敏C可用 正常更新标志 */
        }
    }
    else
    { /* 轨道器星敏不专门处理 */
        sBusSTSObj.update = FALSE32;
    }

    return;
}