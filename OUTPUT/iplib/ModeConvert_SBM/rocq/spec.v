(* ============================================================
 * ModeConvert_SBM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_SBM/source/IP_ModeConvert_SBM.c：
 *
 *   if ((m_starTime - csOrb19_Para_I_t0) >= csModePara_dt_OrbitInject)
 *       m_WorkMode = WKMD_EIM;
 *   // 否则 m_WorkMode 不变
 *
 * 三个输入都是 float64（double）：减法为 IEEE 双精度最近舍入
 * （fp64_sub = Bminus 53 1024 mode_NE，与 gcc -std=c11 一致）；
 * ">=" 遇 NaN 为 false（c_ge64 与 C 一致）。
 *
 * WKMD_EIM：原项目全局模式常量，本仓库源中无定义（iplib 头文件未包含），
 * 参考驱动以 -DWKMD_EIM=0x11 注入，spec 取同一替身值 17；
 * 该常量的具体取值不影响被测关系（cond 为真则置该常量）。
 *
 * spec 是纯函数：
 *   输入  starTime t0 dt(fp64)  workMode(Z)
 *   输出  workMode'(Z)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

(* WKMD_EIM 替身值（0x11），与驱动的 -D 注入一致 *)
Definition WKMD_EIM_Z : Z := 17.

Definition modeConvert_SBM_fun
    (starTime t0 dt : fp64) (workMode : Z) : Z :=
  if c_ge64 (fp64_sub starTime t0) dt then WKMD_EIM_Z else workMode.
