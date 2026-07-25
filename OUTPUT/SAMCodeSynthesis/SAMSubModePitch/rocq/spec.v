(* ============================================================
 * SAMSubModePitch 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/SAMSubModePitch/IP_SAMSubModePitch.c：
 * 与 SAMSubModeRoll 同构，差别：
 *   - 太阳角判断是 Fabsx(piyaw) > 1.0f（取绝对值后比较）
 *   - 超时阈值 5625（720s），超时目标是 SAM_ROLL(0x22)
 *
 *   m_workMode = curMode（= *m_curMode）;
 *   m_countMode++;                              // unint32，模 2^32 回绕
 *   if (flgSP == TRUE(1)) {                     // flgSP 即 *pIp->flgSP
 *     if (Fabsx(piyaw) > 1.0f) {                // piyaw 即 *pIp->piyaw
 *       m_countPublic++;
 *       if (m_countPublic > 12) {               // 比较的是自增后的值
 *         m_workMode = SAM_CRUISE(0x33); m_countMode = 0; m_countPublic = 0;
 *         // outUp 不动
 *       } else {
 *         outUp[0..2] = 0.0f;
 *       }
 *     }                                         // Fabsx <= 1：什么都不做
 *   } else {
 *     m_countPublic = 0;
 *   }
 *   if (m_countMode > 5625) {                   // 用可能被重置后的 countMode
 *     m_workMode = SAM_ROLL(0x22); m_countMode = 0; m_countPublic = 0;
 *   }
 *
 * Fabsx 宏（std_basal.h）：fabs((float64)x)。对 float32 输入，double 转换
 * 与 double fabs 都是精确操作，结果就是"清符号位"（-0.0 -> +0.0、NaN 清
 * 符号）；随后与 (double)1.0f 的比较等价于 fp32 上的 c_gt（值完全相同）。
 * 因此 fabs32 直接按位清符号实现，与 C 逐位一致。
 *
 * 整数语义：所有计数器/模式字都是 unint32，自增模 2^32 回绕（u32_inc）。
 *
 * spec 是纯函数：
 *   输入  piyaw(fp32) curMode flgSP countMode countPublic(Z) outUp0..2(fp32)
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
Definition SAM_ROLL_Z   : Z := 34.    (* SAM_ROLL   = 0x22 *)
Definition SAM_CRUISE_Z : Z := 51.    (* SAM_CRUISE = 0x33 *)

Definition c_1p0 : fp32 := f32 (0x3F800000).   (* 1.0f *)

(* unint32 自增：模 2^32 回绕 *)
Definition u32_inc (x : Z) : Z := (x + 1) mod 4294967296.

(* Fabsx：float32 上即清符号位（0x7FFFFFFF 掩码） *)
Definition fabs32 (x : fp32) : fp32 :=
  b32_of_bits (Z.land (bits_of_b32 x) 2147483647).

Definition samSubModePitch_fun
    (piyaw : fp32) (curMode flgSP countMode countPublic : Z)
    (up0 up1 up2 : fp32) : Z * Z * Z * list Z :=
  let countMode1 := u32_inc countMode in
  let '(wm, cm, cp, outs) :=
    if flgSP =? TRUE_Z then
      if c_gt (fabs32 piyaw) c_1p0 then
        let cp1 := u32_inc countPublic in
        if cp1 >? 12
        then (SAM_CRUISE_Z, 0, 0, [up0; up1; up2])     (* 转巡航：outUp 不动 *)
        else (curMode, countMode1, cp1, [f32 0; f32 0; f32 0])
      else (curMode, countMode1, countPublic, [up0; up1; up2])
    else (curMode, countMode1, 0, [up0; up1; up2])
  in
  let '(wm2, cm2, cp2) :=
    if cm >? 5625 then (SAM_ROLL_Z, 0, 0) else (wm, cm, cp)
  in
  (wm2, cm2, cp2, map bits_of_b32 outs).
