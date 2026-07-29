#if !defined(__CS_TRGTP2P_TAR_Init_H__)
#define __CS_TRGTP2P_TAR_Init_H__
#include "app_decl.h"
#include "IP.h"

void CS_TrgtP2P_Tar_InitFun(void *p);

/* 模式切换指令处理 */
typedef struct __CS_TrgtP2P_Tar_Init
{
    /* 接口函数*/
    Fun     fun;

    /* 输入端口*/
    unint32 csMnvData_F_MnvNextMode;          /* 姿态机动调姿标志 */
    float64 csMnvData_Cso[3][3];             /* 对日坐标系 */

    float64 csMnvData_A_Trgt[3];  /* 目标姿态 */

    unint32 csAttPara_Seq_AttD[14];             /* 定姿转序（目前支持六种情况，132，123，231，213，312，321） */
    /* 输出端口 */

    float64 csAttCoreData_Cro[3][3];

    
    /* 输入输出端口 */
    unint32 m_WorkMode;
    /* 状态变量 */

    /* 参数变量 */
    

} CS_TrgtP2P_Tar_Init;




#endif // __CS_TRGTP2P_TAR_Init_H__