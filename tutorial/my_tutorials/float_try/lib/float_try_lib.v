(* ============================================================
 * float_try_lib：基于 Flocq 定义 QCP 生成的 fp64 相关符号
 * 这是探索性定义，用于验证 QCP 浮点 VC 是否能被 Rocq 接受。
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Flocq.IEEE754.Bits.
Require Import Flocq.IEEE754.Binary.
Require Import Flocq.IEEE754.BinarySingleNaN.
Require Import Flocq.Core.Zaux.

Local Open Scope Z_scope.

(* QCP 内部使用的 fp64：为了兼容 QCP 的内存模型（store 的值类型为 Z），
 * 这里把 fp64 实现为 IEEE 754 binary64 的位模式（Z）。
 * 真正的浮点语义通过 Flocq 在 binary64 上运算后再转回位模式。 *)
Definition fp64 := Z.

(* 辅助：把位模式转成 binary64，运算后再转回位模式 *)
Definition bits_to_fp (z: Z): binary64 := b64_of_bits z.
Definition fp_to_bits (f: binary64): Z := bits_of_b64 f.

(* 浮点四则运算，固定为向最近偶数舍入 *)
Definition fp64_add (x y: fp64): fp64 :=
  fp_to_bits (b64_plus mode_NE (bits_to_fp x) (bits_to_fp y)).
Definition fp64_sub (x y: fp64): fp64 :=
  fp_to_bits (b64_minus mode_NE (bits_to_fp x) (bits_to_fp y)).
Definition fp64_mul (x y: fp64): fp64 :=
  fp_to_bits (b64_mult mode_NE (bits_to_fp x) (bits_to_fp y)).
Definition fp64_div (x y: fp64): fp64 :=
  fp_to_bits (b64_div mode_NE (bits_to_fp x) (bits_to_fp y)).

(* 浮点比较。QCP 生成的前置条件/后置条件中把它们当作 Prop 使用，
 * 因此这里返回 Prop 而不是 bool。 *)
Definition fp64_LT (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Lt => True | _ => False end.
Definition fp64_LE (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Gt => False | _ => True end.
Definition fp64_GT (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Gt => True | _ => False end.
Definition fp64_GE (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Lt => False | _ => True end.
Definition fp64_EQ (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Eq => True | _ => False end.
Definition fp64_NE (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Eq => False | _ => True end.

(* 有限性检查 *)
Definition fp64_isFinite (x: fp64): Prop :=
  @Flocq.IEEE754.Binary.is_finite 53 1024 (bits_to_fp x) = true.

(* 浮点常量构造函数。
 * QCP 生成的是 fp64(0.0)。这里接受 Z，0.0 的位模式就是 0。 *)
Definition fp64_from_Z (z: Z): fp64 := z.

(* 比较关系的互斥性：x > y 与 x <= y 不能同时成立。 *)
Lemma fp64_GT_not_LE: forall x y, fp64_GT x y -> ~ fp64_LE x y.
Proof.
  intros x y Hgt Hle.
  unfold fp64_GT, fp64_LE in *.
  destruct (b64_compare (bits_to_fp x) (bits_to_fp y)) as [c|].
  - destruct c; simpl in Hgt, Hle; contradiction.
  - simpl in Hgt; contradiction.
Qed.

(* 规格：lerp_positive 的后置条件 *)
Definition lerpPositivePost (a b t: fp64) (ret: Z): Prop :=
  (fp64_LE (fp64_add a (fp64_mul t (fp64_sub b a))) (fp64_from_Z 0) -> ret = 0) /\
  (fp64_GT (fp64_add a (fp64_mul t (fp64_sub b a))) (fp64_from_Z 0) -> ret = 1).
