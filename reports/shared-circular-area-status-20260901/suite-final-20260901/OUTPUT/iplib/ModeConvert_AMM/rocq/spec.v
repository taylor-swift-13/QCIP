(* ============================================================
 * ModeConvert_AMM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_AMM/source/IP_ModeConvert_AMM.c：
 * 三个**顺序执行**的 if（非 else-if，后者覆盖前者）：
 *
 *   if ((m_starTime - csOrb19_Para_I_t0) >= csModePara_dt_OrbitInject)
 *       m_WorkMode = 0x01u;
 *   if ((m_starTime > tm3 + LmtT_ModeSwitch_AMM) &&
 *       (csMnvData_F_MnvNextMode == 2))
 *       m_WorkMode = 0x05u;
 *   if ((m_starTime > tm3 + LmtT_ModeSwitch_AMM) &&
 *       (csMnvData_F_MnvNextMode == 1))
 *       m_WorkMode = 0x02u;
 *
 * 后两个 if 时间条件相同、F_MnvNextMode 互斥（==2 与 ==1 不同时成立），
 * 故最终结果：F==2 且时间到 → 5；F==1 且时间到 → 2；否则保留第一个 if
 * 的结果（1 或原值）。
 *
 * 浮点均为 float64：fp64_sub / fp64_add 为 IEEE 双精度最近舍入，
 * ">=" 与 ">" 遇 NaN 为 false（c_ge64/c_gt64 与 C 一致）。
 * 目标模式是 C 字面量 0x01/0x05/0x02，无需宏替身。
 *
 * spec 是纯函数：
 *   starTime t0 dt tm3 lmt(fp64)  fNext workMode(Z) → workMode'(Z)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition modeConvert_AMM_fun
    (starTime t0 dt tm3 lmt : fp64) (fNext workMode : Z) : Z :=
  let wm1 := if c_ge64 (fp64_sub starTime t0) dt then 1 else workMode in
  let tcond := c_gt64 starTime (fp64_add tm3 lmt) in
  let wm2 := if tcond && (fNext =? 2) then 5 else wm1 in
  if tcond && (fNext =? 1) then 2 else wm2.
