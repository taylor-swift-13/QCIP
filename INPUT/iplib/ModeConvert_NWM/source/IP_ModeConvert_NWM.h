#if !defined(__MODECONVERT_NWM_H__)
#define __MODECONVERT_NWM_H__

#include "IP.h"

void ModeConvert_NWMFun(void *p);

/* 模式切换指令处理 */
typedef struct __ModeConvert_NWM
{

    Fun     fun;
    float64 csOrbitCtrlData_tpi_OC;  /* 轨控发动机开机时刻 */
    float64 csOrbitCtrlPara_LmtT_Ahead_OCM; /* 轨控发动机开机提前转模式时间 */


    /* 输入端口*/
    float64 m_starTime;                         /* 当前星时 t */
    float64 csMnvData_tm_xin;                   /* 机动起始时刻  绝对时刻  */
    unint32 csMnvData_F_MnvNextMode;            /* 姿态机动调姿标志 */


    /* 输出端口 */


    /* 输入输出端口 */
    unint32 m_WorkMode;                         /* 当前模式 */
    /* 状态变量 */

    /* 参数变量 */
    // float64 LmtT_Ahead_OCM;                     /* 轨控发动机开机提前转模式时间 */

} ModeConvert_NWM;

#endif // __MODECONVERT_NWM_H__