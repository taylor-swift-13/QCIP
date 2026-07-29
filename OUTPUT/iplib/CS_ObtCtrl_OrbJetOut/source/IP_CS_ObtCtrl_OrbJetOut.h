#if !defined(__CS_OBTCTRL_ORBJETOUT_H__)
#define __CS_OBTCTRL_ORBJETOUT_H__

#include "IP.h"

void CS_ObtCtrl_OrbJetOutFun(void *p);

/*  */
typedef struct __CS_ObtCtrl_OrbJetOut
{
    /* 接口函数*/
    Fun     fun;

    /* 输入端口*/
    float64 m_starTime;                          /* 当前星时 t */
    float64 csOrbitCtrlData_tpi_OC;             /* 轨控发动机开机时刻 */
    float64 csOrbitCtrlData_dremain_OC;         /* 本次轨控轨控发动机仍需工作时长 */
    float64 csOrbitCtrlData_sumDtp;             /* 轨控发动机工作时长  累计量 退模式不清零 */
    float64 csOrbitCtrlData_dto_OC;             /* 轨控发动机每周期发送脉宽量 */

    /* 输出端口 */
    unint32 m_WorkMode;                          /* 当前模式 */

    /* 输入输出端口 */

    /* 状态变量 */

    /* 参数变量 */
    float64  m_DeltaT;                      /* 控制周期 */
    float64 csOrbitCtrlData_dGap_OC;        /* 轨控发动机满喷系数 */
    float64 CS_Jet_ObtOut_t_OC[4];                  /* ThrOC[i].t 各轨控喷管输出喷气脉宽 */
    float64 CS_Jet_ObtOut_FS_OC[4];                          /* 轨控发动机选择标志ThrGr.FS_OC */
    // unint32 FS_OC[NUM_THRGR_OC];           /* 推力器变轨，轨控发动机选择标志=0,不允许变轨; =1, 允许 */

} CS_ObtCtrl_OrbJetOut;

#endif // __CS_OBTCTRL_ORBJETOUT_H__