/* CS_TrgtAtt_AMM_Exp_decls.h — 原项目应用层隐式声明的最小补齐
 *
 * IP_CS_TrgtAtt_AMM_Exp.c 调用 csMnvTrgtHook.Track_Plan_hook()，但该全局
 * 变量的类型不在本 case 任何头文件内（属应用层装配代码，全仓库无定义）。
 * 参考驱动只触发这一个成员函数指针，这里给出最小桩类型。真实系统里
 * 该钩子执行 5.3.1.4 轨迹规划算法并产出 Chi_Ref/dChi_Ref——差分测试把
 * 它们作为直接输入，故钩子体为空操作（见 *_main.c 与 README 备注）。
 */
#ifndef CS_TRGTATT_AMM_EXP_DECLS_H
#define CS_TRGTATT_AMM_EXP_DECLS_H

typedef struct { void (*Track_Plan_hook)(void); } SMnvTrgtHook_Stub;
extern SMnvTrgtHook_Stub csMnvTrgtHook;

#endif
