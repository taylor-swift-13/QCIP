#if !defined(__CS_TRGTATT_AMM_2NOSAR_H__)
#define __CS_TRGTATT_AMM_2NOSAR_H__

#include "IP.h"


void CS_TrgtAtt_EIMFun(void *p);

// IP 结构体定义
typedef struct __CS_TrgtAtt_AMM_2NoSAR
{
    /* 接口函数 */
    Fun     fun ;

    /* 输入端口 */
    float64 csAttCoreData_csMnvData_qrb0[4];               /* 机动起始时刻姿态四元数(扣除偏流角) */
    float64 csMnvData_qbo0[4];               /* 机动起始时刻姿态四元数(扣除偏流角)  */
    float64 csDriftAngData_Psi_DA;                     /* 平滑后的实际偏流角 rad */

    float64 csAttCoreData_Cbiasp[3][3];               /* 姿态偏置矩阵 */

    float64 csAttCoreData_Cro_si[3][3];			     /* CRO_Si */
    float64 csAttCoreData_Cro[3][3];
    float64 csAttCoreData_wri[3];                     /* 三轴实时目标惯性角速度  */ 
    float64 csMnvData_wrb0[3];               /* wrb0 */

    float64 csLoadAxisData_Csib_DARot[3][3];     // 视轴坐标系转换矩阵sib





    float64 csMnvData_dA_Ref[3];             /* 三轴实时目标姿态角速度 */

    float64 csMnvData_dA_Ref_Lst[3];         /* */

    float64 csMnvData_A_Ref[3];              /* 三轴实时目标姿态 */

    unint32 csAttPara_Seq_AttD[14];                 /* 定姿转序（目前支持六种情况，132，123，231，213，312，321） */

    unint32 csMnvPara_FS_MnvTraceStyle;              /* 姿态机动方式选择标志 */

    float64 csCtrlerOtherPara_Mlf_TorqRef;                    /* 前馈力矩模的限幅，超过则力矩清零 */

    float64 csMnvData_qrb0[4];               /* 机动起始时刻姿态四元数(扣除偏流角) */

    float64 csMnvData_ddA_Ref[3];            /* 三轴实时目标姿态角加速度 */

    float64 csLoadAxisData_Csib_DARot[3][3];

    float64  csOrbData_coi[3][3];                 /* 从惯性系到轨道系的姿态转移矩阵 */
    float64  csOrbData_w0i[3];                    /* 考虑轨道进动的轨道系相对于惯性系J2000.0的角速度 */

    /* 输出端口 */

    float64 csAttCoreData_qri[4];                     /* 参考系相对惯性系的目标姿态四元数                           */
    float64 csAttCoreData_qro[4];
    float64 csAttCoreData_wro[3];                     /* */


    float64 csMnvData_A_Ref_si[3];           /* */



    unint32 csMnvData_F_MnvNextMode;          /* 姿态机动调姿标志 */

    /* 输入输出端口 */
	float64	csAttCoreData_wri_si[3];




    float64 xxAttCoreData_wri2[3];
    float64 xxAttCoreData_wri2_Lst[3];
    float64 csMnvData_TorqRef[3];            /* 前馈力矩补偿 */
    /* 状态变量 */

    /* 参数变量 */


} CS_TrgtAtt_AMM_2NoSAR;

#endif // __CS_TRGTATT_AMM_2NOSAR_H__