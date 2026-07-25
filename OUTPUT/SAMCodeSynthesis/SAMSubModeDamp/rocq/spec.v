(* ============================================================
 * SAMSubModeDamp 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/SAMSubModeDamp/IP_SAMSubModeDamp.c：
 *
 *   m_workMode = curMode（= *m_curMode）;
 *   m_countMode++;                              // unint32，模 2^32 回绕
 *   fabsmax = TripleFabsMaxF(pRate[0], pRate[1], pRate[2]);
 *   if (fabsmax < 0.15f) m_countPublic++;       // NaN 时 false，不自增
 *   if ((m_countPublic > time_D2P) || (m_countMode > time_D2P_overtime)) {
 *     m_workMode = SAM_PITCH(0x11); m_countMode = 0; m_countPublic = 0;
 *   }
 *
 * TripleFabsMaxF（std_utils.c）是手工 abs + 两次 max 比较：
 *   ax = (x < 0) ? -x : x;  ...同 y、z
 *   t = (ax > ay) ? ax : ay;
 *   t = (az > t) ? az : t;
 * 注意其 NaN 行为：含 NaN 的比较全为 false，NaN 会被 else 支"丢弃"
 * （除非三个输入全是 NaN，结果才是 NaN）。spec 用同一比较结构
 * （c_lt/c_gt）逐项复刻。
 *
 * 整数语义：所有计数器/模式字/时间阈值都是 unint32，自增模 2^32
 * 回绕（u32_inc）；time_D2P / time_D2P_overtime 是结构体输入参数。
 *
 * spec 是纯函数：
 *   输入  pRate0..2(fp32) curMode countMode countPublic timeD2P timeD2Pover(Z)
 *   输出  (workMode, countMode', countPublic')
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

(* IP.h 常量 *)
Definition SAM_PITCH_Z : Z := 17.    (* SAM_PITCH = 0x11 *)

Definition c_0p15 : fp32 := f32 (0x3E19999A).   (* 0.15f *)

(* unint32 自增：模 2^32 回绕 *)
Definition u32_inc (x : Z) : Z := (x + 1) mod 4294967296.

(* std_utils.c 的 TripleFabsMaxF（手工 abs，NaN 随 else 支丢弃） *)
Definition tripleFabsMaxF (x y z : fp32) : fp32 :=
  let ax := if c_lt x (f32 0) then fp32_neg x else x in
  let ay := if c_lt y (f32 0) then fp32_neg y else y in
  let az := if c_lt z (f32 0) then fp32_neg z else z in
  let tmax := if c_gt ax ay then ax else ay in
  if c_gt az tmax then az else tmax.

Definition samSubModeDamp_fun
    (pr0 pr1 pr2 : fp32)
    (curMode countMode countPublic timeD2P timeD2Pover : Z)
  : Z * Z * Z :=
  let countMode1 := u32_inc countMode in
  let fabsmax := tripleFabsMaxF pr0 pr1 pr2 in
  let cp1 :=
    if c_lt fabsmax c_0p15 then u32_inc countPublic else countPublic in
  if (cp1 >? timeD2P) || (countMode1 >? timeD2Pover) then
    (SAM_PITCH_Z, 0, 0)
  else
    (curMode, countMode1, cp1).
