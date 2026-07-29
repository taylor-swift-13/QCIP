#if !defined(__CS_TRGTATT_OCM_H__)
#define __CS_TRGTATT_OCM_H__
#include "app_decl.h"
#include "IP.h"

void CS_TrgtAtt_OCMFun(void *p);

/* 模式切换指令处理 */
typedef struct __CS_TrgtAtt_OCM
{
    /* 接口函数*/
    Fun     fun;

    /* 输入端口*/
    float64 csMnvData_A_Trgt[3];  /* 目标姿态 */
    unint32 csAttPara_Seq_AttD[14];  /* 定姿转序（目前支持六种情况，132，123，231，213，312，321） */
    float64 csOrbData_coi[3][3];    /* 从惯性系到轨道系的姿态转移矩阵 */
    float64 csOrbData_w0i[3];    /* 考虑轨道进动的轨道系相对于惯性系J2000.0的角速度 */
    /* 输出端口 */
    float64 csAttCoreData_wro[3];
    float64 csAttCoreData_Cro[3][3];
    float64 csAttCoreData_qri[4]; /* 参考系相对惯性系的目标姿态四元数  */
    float64 csAttCoreData_wri[3]; /* 三轴实时目标惯性角速度 */
    
    /* 输入输出端口 */
    unint32 m_WorkMode;
    /* 状态变量 */

    /* 参数变量 */
    float64 csAttCoreData_Cbiasp[3][3]; /* 姿态偏置矩阵 */
    

} CS_TrgtAtt_OCM;




#endif // __CS_TRGTATT_OCM_H__