(* ============================================================
 * ModeConvert_AHM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_AHM/source/IP_ModeConvert_AHM.c（活跃部分；
 * 文件头部的旧实现整段被注释，不在被测范围）：
 *
 *   if (ModeObject_Timer_Mode[m_WorkMode] > LmtT_AHM)
 *       m_WorkMode = 0x04u;   // 转入机动模式（字面量，非宏）
 *   // 否则 m_WorkMode 不变
 *
 * ModeObject_Timer_Mode 是 float64[14]，以下标 m_WorkMode（unint32）读取；
 * 越界为 UB，驱动保证界内，spec 对越界输入按"保持不变"定义。
 *
 * 比较为 fp64 ">"（遇 NaN 为 false，c_gt64 与 C 一致）。
 *
 * spec 是纯函数：arr(14 路 fp64 列表) lmt(fp64) workMode(Z) → workMode'(Z)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition modeConvert_AHM_fun
    (arr : list fp64) (lmt : fp64) (workMode : Z) : Z :=
  if (0 <=? workMode) && (workMode <? 14) then
    if c_gt64 (nth (Z.to_nat workMode) arr (f64 0)) lmt
    then 4 else workMode
  else workMode.
