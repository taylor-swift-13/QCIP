(* ============================================================
 * FloatTestCommon — FloatTest 测试框架的公共定义
 *
 * 基于 SimpleC.SL.FloatLib（fp32 = Flocq binary32）：
 *   - b32_of_bits / bits_of_b32：与 C 的 IEEE 单精度 bit pattern 互转；
 *   - fp32_add/sub/mul/div/neg：IEEE 单精度运算（最近舍入，与 C 一致）；
 *   - c_lt / c_gt / c_le / c_ge：与 C 的比较语义一致的布尔比较
 *     （NaN 时一律为 false）；
 *   - is_nan_b / is_finite_b：NaN / 有限性布尔判定；
 *   - out_eq：输出比较（NaN 对 NaN 视为相等，其余按位比较）。
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.

Import ListNotations.
Local Open Scope Z_scope.

(* ---- C 语义比较：NaN 一律 false ---- *)

Definition cmp_of_c (o : option comparison) (want : comparison) : bool :=
  match o, want with
  | Some Datatypes.Lt, Datatypes.Lt => true
  | Some Datatypes.Eq, Datatypes.Eq => true
  | Some Datatypes.Gt, Datatypes.Gt => true
  | _, _ => false
  end.

Definition c_lt (x y : fp32) : bool := cmp_of_c (Bcompare 24 128 x y) Datatypes.Lt.
Definition c_gt (x y : fp32) : bool := cmp_of_c (Bcompare 24 128 x y) Datatypes.Gt.
Definition c_eq (x y : fp32) : bool := cmp_of_c (Bcompare 24 128 x y) Datatypes.Eq.
Definition c_le (x y : fp32) : bool := c_lt x y || c_eq x y.
Definition c_ge (x y : fp32) : bool := c_gt x y || c_eq x y.

(* ---- NaN / 有限性 ---- *)

Definition is_nan_b (x : fp32) : bool := Binary.is_nan 24 128 x.
Definition is_finite_b (x : fp32) : bool := Binary.is_finite 24 128 x.

(* ---- 输出比较：NaN==NaN，其余按位 ---- *)

Definition out_eq (x y : fp32) : bool :=
  (is_nan_b x && is_nan_b y) || (bits_of_b32 x =? bits_of_b32 y).

(* ---- 常用构造 ---- *)

(* 由 C 的 bit pattern 构造 fp32 常量（测试向量与字面量统一用 bits） *)
Definition f32 (bits : Z) : fp32 := b32_of_bits bits.

(* 三组列表的逐元素布尔合取 *)
Fixpoint all3 (f : fp32 -> fp32 -> fp32 -> bool)
              (xs ys zs : list fp32) : bool :=
  match xs, ys, zs with
  | x :: xs', y :: ys', z :: zs' => f x y z && all3 f xs' ys' zs'
  | _, _, _ => true
  end.
