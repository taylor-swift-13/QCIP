(* ============================================================
 * PseudoRate 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/PseudoRate/IP_PseudoRate.c：
 * 对每轴 i ∈ {0,1,2}：
 *   if (pu[i] - r[i] >  h1[i]) { Yp=0x0; Yn=0xF; r = 0.9231f*r + 0.07688f }
 *   elif (pu[i] - r[i] < -h1[i]) { Yp=0xF; Yn=0x0; r = 0.9231f*r - 0.07688f }
 *   else                        { Yp=0x0; Yn=0x0; r = 0.9231f*r }
 *
 * spec 是纯函数：(pu, r, h1) 三路 float32 输入 →
 *   (Yp[3], Yn[3], r'[3])，其中 r' 以 bits 输出便于位级比对。
 *
 * 常量为 C 字面量的 IEEE 单精度 bit pattern：
 *   0.9231f  = 0x3F6C5048
 *   0.07688f = 0x3D9D7343
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition c_09231  : fp32 := f32 (0x3F6C5048).
Definition c_007688 : fp32 := f32 (0x3D9D7343).

(* 单轴的一步：返回 (Yp, Yn, r') *)
Definition pseudoRate_step (pu r h1 : fp32) : Z * Z * fp32 :=
  let d := fp32_sub pu r in
  if c_gt d h1 then
    (0, 15, fp32_add (fp32_mul c_09231 r) c_007688)
  else if c_lt d (fp32_neg h1) then
    (15, 0, fp32_sub (fp32_mul c_09231 r) c_007688)
  else
    (0, 0, fp32_mul c_09231 r).

(* 三轴全函数：返回 (Yp[3], Yn[3], r' 的 bits[3]) *)
Definition pseudoRate_fun
    (pu0 pu1 pu2 r0 r1 r2 h10 h11 h12 : fp32)
  : list Z * list Z * list Z :=
  let '(yp0, yn0, r0') := pseudoRate_step pu0 r0 h10 in
  let '(yp1, yn1, r1') := pseudoRate_step pu1 r1 h11 in
  let '(yp2, yn2, r2') := pseudoRate_step pu2 r2 h12 in
  ([yp0; yp1; yp2], [yn0; yn1; yn2],
   [bits_of_b32 r0'; bits_of_b32 r1'; bits_of_b32 r2']).
