#if !defined(__CS_TRGTATT_AMM_EXP_H__)
#define __CS_TRGTATT_AMM_EXP_H__

#include "IP.h"


void CS_TrgtAtt_EIMFun(void *p);

// IP 结构体定义
typedef struct __CS_TrgtAtt_AMM_Exp
{
    /* 接口函数 */
    Fun     fun ;

    /* 输入端口 */
    unint32 csMnvData_F_Init_tm3;             /* 初始将轨迹规划计算的相对时间转换为绝对时间的标志 */
    float64 csMnvData_e_xyz[3];              /* 姿态机动的期望欧拉转轴 */

    float64 csMnvData_mTrack_Chi_Ref;                    /* 规划的机动角度          χ_Ref     */
    float64 csMnvData_mTrack_dChi_Ref;                   /* 规划的机动角速度        dχ_Ref    */

    /* 输出端口 */
    float64 csMnvData_tm1;                   /* 轨迹规划加速段转折点时刻（绝对星时） */
    float64 csMnvData_tm2;                   /* 轨迹规划匀速段转折点时刻（绝对星时） */
    float64 csMnvData_tm3;                   /* 轨迹规划结束点时刻（绝对星时） */
    float64 csMnvData_qrb0[4];               /* 机动起始时刻姿态四元数(扣除偏流角) */
    float64 csMnvData_wrb0[3];               /* wrb0 */

    float64 csMnvData_tMnv;                  /* tmnv */
    float64 csMnvData_tm_xin;                /* 机动起始时刻  绝对时刻  */


    /* 输入输出端口 */

    /* 输入输出数据 浮点 */
    float64 csMnvData_mTrack_tm1p;                       /* 加速段转折点时刻（以tm_xin为基准的相对时刻） */
    float64 csMnvData_mTrack_tm2p;                       /* 匀速段转折点时刻（以tm_xin为基准的相对时刻） */
    float64 csMnvData_mTrack_tm3p;                       /* 结束点时刻      （以tm_xin为基准的相对时刻） */
    /* 状态变量 */

    /* 参数变量 */


} CS_TrgtAtt_AMM_Exp;

#endif // __CS_TRGTATT_AMM_EXP_H__