#if !defined(__CS_TRGTATT_AHM_USU_H__)
#define __CS_TRGTATT_AHM_USU_H__

#include "IP.h"

void CS_TrgtAtt_AHM_USUFun(void *p);


/**********************************************************************
 * 功能描述:  5.3.2.5.1    常规偏置飞行模式目标姿态计算
功能:常规偏置飞行模式目标姿态计算
***********************************************************************/

typedef struct __CS_TrgtAtt_AHM_USU
{
    /* 接口函数 */
    Fun     fun;

    /* 输入端口 */
    unint32 m_WorkMode;                             /* 当前模式 */
    float64 csDriftAngData_Psi_DA;                  /* 平滑后的实际偏流角 rad */
    float64 csOrbData_w0i[3];                       /* 考虑轨道进动的轨道系相对于惯性系J2000.0的角速度 */ 
    float64 csDriftAngData_dPsi_DA;                 /* 平滑后的实际偏流角速度 rad/s */ 
    float64 csOrbData_coi[3][3];                    /* 从惯性系到轨道系的姿态转移矩阵 */ 

    float64 csCtrlerOtherPara_Mdf_TorqRef;                    /* 姿态机动前馈力矩的修正系数 */

    float64 csAttCoreData_wri_Lst[3];                 /* */

    float64 csMnvData_dA_Ref[3];             /* 三轴实时目标姿态角速度 */
    float64 csMnvData_A_Ref[3];              /* 三轴实时目标姿态 */
    float64 csMnvData_dA_Ref_Lst[3];         /* */
    float64 csCtrlerOtherPara_Mlf_TorqRef;                    /* 前馈力矩模的限幅，超过则力矩清零 */

    float64 Cbsi_DARot[3][3];
    unint32 csAttPara_Seq_AttD[14];                 /* 定姿转序（目前支持六种情况，132，123，231，213，312，321） */

    unint32 csMnvPara_FS_MnvTraceStyle;              /* 姿态机动方式选择标志 */


    float64 xxAttCoreData_dChi_Ref2;     /* 规划的机动角速度        dχ_Ref    */
    float64 xxAttCoreData_dt_TorqRef2;

    float64 csMnvData_mTrack_t_sinacc;                   /* t_sinacc */

    float64 csMnvData_mTrack_amax;                       /* 期望的最大机动角加速度            */

    float64 csMnvData_mTrack_t_m1b;                      /* 匀速段时刻 */
    float64 csMnvData_mTrack_t_m1a;                     /* 加速段时刻 */
    float64 csMnvData_mTrack_t_m3a;                      /* 减速段时刻 */
    float64 csMnvData_mTrack_t_m3b;                      /* 匀速段时刻 */

    /* 输出端口 */
    float64 csAttCoreData_wro[3];                   /* */
    float64 csMnvData_A_Ref_si[3];                  /* */

    float64 csMnvData_A_Trgt[3];                     /* 目标姿态 */
    

    float64 csAttCoreData_Cro[3][3];
    float64 csAttCoreData_Cro_si[3][3];			    /* CRO_Si */
    float64 csAttCoreData_wri[3];                   /* 三轴实时目标惯性角速度                                     */
    float64	csAttCoreData_wri_si[3];        
    float64 csAttCoreData_qri[4];                   /* 参考系相对惯性系的目标姿态四元数                           */ 

    unint32 csMnvData_F_MnvNextMode;          /* 姿态机动调姿标志 */



    /* 输入输出端口 */
    float64 xxAttCoreData_wri2[3];
    float64 xxAttCoreData_wri2_Lst[3];
    float64 csMnvData_TorqRef[3];            /* 前馈力矩补偿 */

    float64 csMnvData_mTrack_tmA;                        /* 机动起始时刻 tmA       相对时刻   */

    /* 输入输出数据 浮点 */
    float64 csMnvData_mTrack_tm1p;                       /* 加速段转折点时刻（以tm_xin为基准的相对时刻） */
    float64 csMnvData_mTrack_tm2p;                       /* 匀速段转折点时刻（以tm_xin为基准的相对时刻） */
    float64 csMnvData_mTrack_tm3p;                       /* 结束点时刻      （以tm_xin为基准的相对时刻） */
    float64 csMnvData_mTrack_t_conacc;                   /* t_conacc */

    /* 状态变量 */

    /* 参数变量 */
    float64 csAttCoreData_Cbiasp[3][3];             /* 姿态偏置矩阵 */ 
    float64 csLoadAxisData_Cbsi_DARot[3][3];        /* 视轴坐标系转换矩阵bsit */ 
    float64 csLoadAxisData_Csib_DARot[3][3];        
    float64 csMnvData_ddA_Ref[3];            /* 三轴实时目标姿态角加速度 */

} CS_TrgtAtt_AHM_USU;

#endif // __CS_TRGTATT_AHM_USU_H__