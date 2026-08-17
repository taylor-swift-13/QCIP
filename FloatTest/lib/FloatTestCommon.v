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

Definition c64_lt (x y : fp64) : bool :=
  cmp_of_c (Bcompare 53 1024 x y) Datatypes.Lt.
Definition c64_gt (x y : fp64) : bool :=
  cmp_of_c (Bcompare 53 1024 x y) Datatypes.Gt.
Definition c64_eq (x y : fp64) : bool :=
  cmp_of_c (Bcompare 53 1024 x y) Datatypes.Eq.
Definition c64_le (x y : fp64) : bool := c64_lt x y || c64_eq x y.
Definition c64_ge (x y : fp64) : bool := c64_gt x y || c64_eq x y.

(* ---- NaN / 有限性 ---- *)

Definition is_nan_b (x : fp32) : bool := Binary.is_nan 24 128 x.
Definition is_finite_b (x : fp32) : bool := Binary.is_finite 24 128 x.

(* ---- 输出比较：NaN==NaN，其余按位 ---- *)

Definition out_eq (x y : fp32) : bool :=
  (is_nan_b x && is_nan_b y) || (bits_of_b32 x =? bits_of_b32 y).

(* ---- 常用构造 ---- *)

(* 由 C 的 bit pattern 构造 fp32 常量（测试向量与字面量统一用 bits） *)
Definition f32 (bits : Z) : fp32 := b32_of_bits bits.

(* ---- fp64（binary64）对应物 ---- *)

Definition c_lt64 (x y : fp64) : bool := cmp_of_c (Bcompare 53 1024 x y) Datatypes.Lt.
Definition c_gt64 (x y : fp64) : bool := cmp_of_c (Bcompare 53 1024 x y) Datatypes.Gt.
Definition c_eq64 (x y : fp64) : bool := cmp_of_c (Bcompare 53 1024 x y) Datatypes.Eq.
Definition c_le64 (x y : fp64) : bool := c_lt64 x y || c_eq64 x y.
Definition c_ge64 (x y : fp64) : bool := c_gt64 x y || c_eq64 x y.

Definition is_nan64_b (x : fp64) : bool := Binary.is_nan 53 1024 x.

Definition out_eq64 (x y : fp64) : bool :=
  (is_nan64_b x && is_nan64_b y) || (bits_of_b64 x =? bits_of_b64 y).

(* 由 C 的 bit pattern 构造 fp64 常量 *)
Definition f64 (bits : Z) : fp64 := b64_of_bits bits.

(* C 的 double -> float 与 float -> double 转换。有限值按最近偶数舍入；
 * widening 对 binary32 是精确的。NaN 统一使用本仓库 canonical NaN，
 * 与 out_eq/out_eq64 的 NaN 比较口径一致。 *)
Definition fp64_to_fp32_ne (x : fp64) : fp32 :=
  match x with
  | @Binary.B754_zero _ _ s => @Binary.B754_zero 24 128 s
  | @Binary.B754_infinity _ _ s => @Binary.B754_infinity 24 128 s
  | @Binary.B754_nan _ _ _ _ _ => fp32_nan
  | @Binary.B754_finite _ _ s m e _ =>
      Binary.binary_normalize 24 128 eq_refl eq_refl mode_NE
        (if s then Zneg m else Zpos m) e s
  end.

Definition fp32_to_fp64_exact (x : fp32) : fp64 :=
  match x with
  | @Binary.B754_zero _ _ s => @Binary.B754_zero 53 1024 s
  | @Binary.B754_infinity _ _ s => @Binary.B754_infinity 53 1024 s
  | @Binary.B754_nan _ _ _ _ _ => fp64_nan
  | @Binary.B754_finite _ _ s m e _ =>
      Binary.binary_normalize 53 1024 eq_refl eq_refl mode_NE
        (if s then Zneg m else Zpos m) e s
  end.

Definition fp64_via_fp32 (x : fp64) : fp64 :=
  fp32_to_fp64_exact (fp64_to_fp32_ne x).

(* fp64 平方根：Bsqrt 53 1024 mode_NE。IEEE-754 强制 sqrt 正确舍入，
 * 与硬件 sqrtsd / 正确实现的 libm sqrt 逐比特一致。 *)
Definition fp64_sqrt : fp64 -> fp64 :=
  Bsqrt 53 1024 eq_refl eq_refl fp64_unary_nan mode_NE.

(* 三组列表的逐元素布尔合取 *)
Fixpoint all3 (f : fp32 -> fp32 -> fp32 -> bool)
              (xs ys zs : list fp32) : bool :=
  match xs, ys, zs with
  | x :: xs', y :: ys', z :: zs' => f x y z && all3 f xs' ys' zs'
  | _, _, _ => true
  end.
