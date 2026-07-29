#if !defined(__CS_TRACK_PLAN_H__)
#define __CS_TRACK_PLAN_H__

#include "IP.h"

void CS_Track_PlanFun(void *p);


typedef struct __CS_Track_Plan
{
    /* 接口函数 */
    Fun     fun;

    /* 输入端口 */
    unint32 csMnvPara_FS_MnvTraceStyle;                   /* 姿态机动方式选择标志 */

    /* 输出端口 */

    SMnvrData csMnvData_mTrack;              /* gfh 轨迹规划数据结构定义 */

    float64 csMnvPara_t_sinaccMax;                        /* 混合轨迹的加速时间  s */
    float64 csMnvPara_dt_RateRef;                         /* 角速度规划滞后时间补偿 */
    float64 csMnvPara_dt_TorqRef;                         /* 角加速度规划超前时间补偿 */

    /* 输入输出端口 */

    /* 状态变量 */


    /* 参数变量 */

} CS_Track_Plan;

#endif // __CS_TRACK_PLAN_H__