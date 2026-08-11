/* CS_TrgtP2P_Ini_decl.h — 由 -include 注入（*_cflags.txt）。
 *
 * 仓库源码无定义：裸全局 m_WorkMode、WKMD_OAM/WKMD_AMM 模式常量、
 * C2Q、Memcpyx（std_utils.h 只有声明无实现）、CS_TrgtP2P_OrbCtl_Ini、
 * CS_TrgtP2P_Tar_Init（兄弟 case，其逻辑在该题目内单独测试）、
 * f_Fun_Null。替身值与打桩约定见 README"组件库重建与打桩声明"。 */
#ifndef CS_TRGTP2P_INI_DECLS_H
#define CS_TRGTP2P_INI_DECLS_H

extern unsigned int m_WorkMode;   /* 代码用裸全局（仓库源码无定义） */
#define WKMD_OAM 0x55             /* 替身值（仓库无定义） */
#define WKMD_AMM 0x44             /* 替身值（沿用 ModeConvert_NWM） */

void CS_TrgtP2P_OrbCtl_Ini(void);
void CS_TrgtP2P_Tar_Init(void);
void f_Fun_Null(void);
void C2Q(double *out, const double *m);

#endif
