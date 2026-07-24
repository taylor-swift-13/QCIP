(* ============================================================
 * SAMSubModeRoll 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/SAMSubModeRoll/IP_SAMSubModeRoll.c：
 *
 *   m_workMode = curMode（= *m_curMode）;
 *   m_countMode++;                              // unint32，模 2^32 回绕
 *   if (flgSP == TRUE(1)) {                     // flgSP 即 *pIp->flgSP
 *     if (royaw > 1.0f) {                       // royaw 即 *pIp->royaw；NaN 时为 false（c_gt 一致）
 *       m_countPublic++;
 *       if (m_countPublic > 12) {               // 注意比较的是自增后的值
 *         m_workMode = SAM_CRUISE(0x33); m_countMode = 0; m_countPublic = 0;
 *         // outUp 不动
 *       } else {
 *         outUp[0..2] = 0.0f;
 *       }
 *     }                                         // royaw <= 1：什么都不做
 *   } else {
 *     m_countPublic = 0;
 *   }
 *   if (m_countMode > 6250) {                   // 用可能被重置后的 countMode
 *     m_workMode = SAM_PITCH(0x11); m_countMode = 0; m_countPublic = 0;
 *   }
 *
 * 整数语义：所有计数器/模式字都是 unint32。自增按 C 无符号语义模 2^32
 * 回绕建模（u32_inc），比较对非负 Z 与无符号比较一致；
 * 因此 0xFFFFFFFF 之类的回绕边界也可以直接进测试向量。
 *
 * spec 是纯函数：
 *   输入  royaw(fp32) curMode flgSP countMode countPublic(Z) outUp0..2(fp32)
 *   输出  (workMode, countMode', countPublic', [outUp0'..2' 的 bits])
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
Definition TRUE_Z       : Z := 1.     (* TRUE = 0x01 *)
Definition SAM_PITCH_Z  : Z := 17.    (* SAM_PITCH  = 0x11 *)
Definition SAM_CRUISE_Z : Z := 51.    (* SAM_CRUISE = 0x33 *)

Definition c_1p0 : fp32 := f32 (0x3F800000).   (* 1.0f *)

(* unint32 自增：模 2^32 回绕 *)
Definition u32_inc (x : Z) : Z := (x + 1) mod 4294967296.

Definition samSubModeRoll_fun
    (royaw : fp32) (curMode flgSP countMode countPublic : Z)
    (up0 up1 up2 : fp32) : Z * Z * Z * list Z :=
  let countMode1 := u32_inc countMode in
  let '(wm, cm, cp, outs) :=
    if flgSP =? TRUE_Z then
      if c_gt royaw c_1p0 then
        let cp1 := u32_inc countPublic in
        if cp1 >? 12
        then (SAM_CRUISE_Z, 0, 0, [up0; up1; up2])     (* 转巡航：outUp 不动 *)
        else (curMode, countMode1, cp1, [f32 0; f32 0; f32 0])
      else (curMode, countMode1, countPublic, [up0; up1; up2])
    else (curMode, countMode1, 0, [up0; up1; up2])
  in
  let '(wm2, cm2, cp2) :=
    if cm >? 6250 then (SAM_PITCH_Z, 0, 0) else (wm, cm, cp)
  in
  (wm2, cm2, cp2, map bits_of_b32 outs).
