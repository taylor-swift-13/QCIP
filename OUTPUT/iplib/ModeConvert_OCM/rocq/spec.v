(* ============================================================
 * ModeConvert_OCM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_OCM/source/IP_ModeConvert_OCM.c：
 *
 *   if (m_starTime > (csOrbitCtrlData_tpi_OC + csJPCData_dtp_OCAdj))
 *       m_WorkMode = WKMD_NWM;
 *   // 否则 m_WorkMode 不变
 *
 * 三个输入都是 float64：加法为 IEEE 双精度最近舍入（fp64_add），
 * ">" 遇 NaN 为 false（c_gt64 与 C 一致）。
 *
 * WKMD_NWM：原项目全局模式常量，仓库源中无定义，驱动 -DWKMD_NWM=0x22
 * 注入，spec 取同一替身值 34。
 *
 * spec 是纯函数：starTime tpi dtp(fp64) workMode(Z) → workMode'(Z)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition WKMD_NWM_Z : Z := 34.   (* 0x22 替身值 *)

Definition modeConvert_OCM_fun
    (starTime tpi dtp : fp64) (workMode : Z) : Z :=
  if c_gt64 starTime (fp64_add tpi dtp) then WKMD_NWM_Z else workMode.
