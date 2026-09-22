(* ============================================================
 * ModeConvert_EIM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_EIM/source/IP_ModeConvert_EIM.c：
 *
 *   if (ModeObject_Timer_Mode[m_WorkMode] > csModePara_dt_END_EIM)
 *       m_WorkMode = WKMD_NWM;
 *   // 否则 m_WorkMode 不变
 *
 * ModeObject_Timer_Mode 是 float64[14]，以下标 m_WorkMode（unint32）读取。
 * m_WorkMode 超出 [0,13] 时 C 为越界读（UB），不在被测行为范围内：
 * 驱动保证其在界内，spec 对越界输入按"保持不变"定义（不建模 UB）。
 *
 * 比较为 fp64 ">"（遇 NaN 为 false，c_gt64 与 C 一致）。
 *
 * WKMD_NWM：原项目全局模式常量，仓库源中无定义，驱动 -DWKMD_NWM=0x22
 * 注入，spec 取同一替身值 34。
 *
 * spec 是纯函数：arr(14 路 fp64 列表) dt(fp64) workMode(Z) → workMode'(Z)
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

Definition modeConvert_EIM_fun
    (arr : list fp64) (dt : fp64) (workMode : Z) : Z :=
  if (0 <=? workMode) && (workMode <? 14) then
    if c_gt64 (nth (Z.to_nat workMode) arr (f64 0)) dt
    then WKMD_NWM_Z else workMode
  else workMode.
