#if !defined(__MODECONVERT_OCM_H__)
#define __MODECONVERT_OCM_H__

#include "IP.h"

void ModeConvert_OCMFun(void *p);

/* 模式切换指令处理 */
typedef struct __ModeConvert_OCM
{
    /* 接口函数*/
    Fun     fun;

    /* 输入端口*/
    float64 m_starTime;                          /* 当前星时 t */
    float64 csOrbitCtrlData_tpi_OC;

    /* 输出端口 */
    unint32 m_WorkMode;                          /* 当前模式 */

    /* 输入输出端口 */

    /* 状态变量 */

    /* 参数变量 */
    float64 csJPCData_dtp_OCAdj;

} ModeConvert_OCM;

#endif // __MODECONVERT_OCM_H__