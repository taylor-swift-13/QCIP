/* CS_GyroData_Disposal 参考链补充声明
 *
 * IP_CS_GyroData_Disposal.c 调用的 MatrixTran / MatrixMulti / MatrixInv33 /
 * LimitDouble 在仓库任何头文件中均无声明（iplib 组件库未随源码提供，
 * std_utils.h 只有 fp32 的 *F 同名函数与 extern float64 m_DeltaT）。
 * 原始 TU 若无原型直接调用会得到隐式 int 声明，float64 返回值语义错误。
 * 本头文件由 gcc -include 注入（见 CS_GyroData_Disposal_cflags.txt），
 * 给出正确原型；实现见 CS_GyroData_Disposal_main.c——按 SAM 批次
 * std_utils.c 的 fp32 同名函数（MatrixTranF / MatrixMultiF /
 * MatrixInv33F / LimitFloat）的算法逐式重建为 fp64，详见 README 备注。
 */
#ifndef CS_GYRODATA_DISPOSAL_DECLS_H
#define CS_GYRODATA_DISPOSAL_DECLS_H

#include "std_basal.h"

void    MatrixTran(float64* tran, const float64* mat, unint08 nrow, unint08 ncol);
void    MatrixMulti(float64* product, const float64* faciend, const float64* multiplier,
                    unint08 nrow, unint08 nrc, unint08 ncol);
unint32 MatrixInv33(float64* inv, const float64* src);
float64 LimitDouble(float64 fin, float64 fbound);

#endif
