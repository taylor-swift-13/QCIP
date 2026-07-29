#if !defined(__CS_TRGTP2P_Ini_H__)
#define __CS_TRGTP2P_Ini_H__
#include "app_decl.h"
#include "IP.h"

void CS_TrgtP2P_IniFun(void *p);

/* 模式切换指令处理 */
typedef struct __CS_TrgtP2P_Ini
{
    /* 接口函数*/
    Fun     fun;

    /* 输入端口*/
    float64 csMnvPara_dChimax_RWorCMGCtrlZR[3][6];    /* RWorCMG 控制时三轴姿态机动最大角速度 */

    siint32 csMnvData_F_P2PType;              /* 点对点机动时选取规划角速度和角加速度的标志；
                                       =0表示轨控调姿的点对点机动；
                                       =1表示日地转换的点对点；
                                       =2超时回摆的点对点；
                                       =3惯性定向或扫描的点对点；
                                       =4机动规划1的点对点；
                                       =5机动规划2的点对点； */

    float64 csAttCoreData_Cro[3][3];

    float64 csAttCoreData_qro[4];

    float64 csMnvPara_amax_RWorCMGCtrlZR[3][6];     /* RWorCMG 控制时三轴姿态机动最大角加速度 */

    /* 输出端口 */

    float64 csMnvData_dChimax_RWorCMGCtrl[3]; /* RWorCMG 控制时三轴姿态机动最大角速度 */

    float64 csAttCoreData_qro0[4];                    /* */

    float64 csMnvData_amax_RWorCMGCtrl[3];   /* RWorCMG 控制时三轴姿态机动最大角加速度 */

    /* 输入输出端口 */

    /* 状态变量 */

    /* 参数变量 */
    

} CS_TrgtP2P_Ini;




#endif // __CS_TRGTP2P_Ini_H__