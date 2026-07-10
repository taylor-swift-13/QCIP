(* ============================================================
 * double_clamp_lib：直接返回 double 的 clamp
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Reals.Reals.
Require Import Coq.micromega.Lia.
Require Import Coq.micromega.Lra.
Require Import Flocq.Core.Raux.
Require Import Flocq.Core.Generic_fmt.
Require Import Flocq.IEEE754.Bits.
Require Import Flocq.IEEE754.Binary.
Require Import Flocq.IEEE754.BinarySingleNaN.
Require Import Flocq.Core.Zaux.

Local Open Scope Z_scope.
Local Open Scope R_scope.

Definition fp64 := Z.

Definition bits_to_fp (z: Z): binary64 := b64_of_bits z.
Definition fp_to_bits (f: binary64): Z := bits_of_b64 f.

Definition fp64_LT (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Lt => True | _ => False end.
Definition fp64_LE (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Gt => False | _ => True end.
Definition fp64_GT (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Gt => True | _ => False end.
Definition fp64_GE (x y: fp64): Prop :=
  match b64_compare (bits_to_fp x) (bits_to_fp y) with Some Lt => False | _ => True end.

Definition fp64_isFinite (x: fp64): Prop :=
  Is_true (@Flocq.IEEE754.Binary.is_finite 53 1024 (bits_to_fp x)).

(* b64_compare 直接版本的正确性引理 *)
Lemma b64_compare_correct:
  forall x y,
    Is_true (@Binary.is_finite _ _ x) ->
    Is_true (@Binary.is_finite _ _ y) ->
    b64_compare x y = Some (Rcompare (@Binary.B2R _ _ x) (@Binary.B2R _ _ y)).
Proof.
  intros x y Hx Hy.
  pose proof (Is_true_eq_true _ Hx) as Hx'.
  pose proof (Is_true_eq_true _ Hy) as Hy'.
  unfold b64_compare.
  exact (Binary.Bcompare_correct 53 1024 x y Hx' Hy').
Qed.

(* 比较关系的互斥与互补 *)
Lemma fp64_GE_not_LT: forall x y, fp64_GE x y -> ~ fp64_LT x y.
Proof.
  intros x y Hge Hlt.
  unfold fp64_GE, fp64_LT in *.
  destruct (b64_compare (bits_to_fp x) (bits_to_fp y)) as [[ | | ]|]; simpl in *; contradiction.
Qed.

Lemma fp64_LE_not_GT: forall x y, fp64_LE x y -> ~ fp64_GT x y.
Proof.
  intros x y Hle Hgt.
  unfold fp64_LE, fp64_GT in *.
  destruct (b64_compare (bits_to_fp x) (bits_to_fp y)) as [[ | | ]|]; simpl in *; contradiction.
Qed.

Lemma not_LT_implies_GE: forall x y, fp64_isFinite x -> fp64_isFinite y -> ~ fp64_LT x y -> fp64_GE x y.
Proof.
  intros x y Hfx Hfy Hnlt.
  unfold fp64_GE, fp64_LT in *.
  destruct (b64_compare (bits_to_fp x) (bits_to_fp y)) as [[ | | ]|]; simpl in *; auto; contradiction.
Qed.

Lemma not_GT_implies_LE: forall x y, fp64_isFinite x -> fp64_isFinite y -> ~ fp64_GT x y -> fp64_LE x y.
Proof.
  intros x y Hfx Hfy Hngt.
  unfold fp64_LE, fp64_GT in *.
  destruct (b64_compare (bits_to_fp x) (bits_to_fp y)) as [[ | | ]|]; simpl in *; auto; contradiction.
Qed.

(* 从 fp64_GE / fp64_LE 得到实数意义下的序 *)
Lemma fp64_GE_implies_B2R_ge:
  forall x y, fp64_isFinite x -> fp64_isFinite y -> fp64_GE x y -> @Binary.B2R _ _ (bits_to_fp x) >= @Binary.B2R _ _ (bits_to_fp y).
Proof.
  intros x y Hfx Hfy Hge.
  unfold fp64_GE in Hge.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp y) Hfx Hfy) in Hge.
  destruct (Rcompare (@Binary.B2R _ _ (bits_to_fp x)) (@Binary.B2R _ _ (bits_to_fp y))) eqn:Hr; simpl in Hge; try contradiction.
  - apply Rcompare_Eq_inv in Hr. rewrite Hr. lra.
  - apply Rcompare_Gt_inv in Hr. left. apply Hr.
Qed.

Lemma fp64_LE_implies_B2R_le:
  forall x y, fp64_isFinite x -> fp64_isFinite y -> fp64_LE x y -> @Binary.B2R _ _ (bits_to_fp x) <= @Binary.B2R _ _ (bits_to_fp y).
Proof.
  intros x y Hfx Hfy Hle.
  unfold fp64_LE in Hle.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp y) Hfx Hfy) in Hle.
  destruct (Rcompare (@Binary.B2R _ _ (bits_to_fp x)) (@Binary.B2R _ _ (bits_to_fp y))) eqn:Hr; simpl in Hle; try contradiction.
  - apply Rcompare_Eq_inv in Hr. rewrite Hr. lra.
  - apply Rcompare_Lt_inv in Hr. left. apply Hr.
Qed.

(* 序关系的传递性 *)
Lemma fp64_LE_trans: forall x y z, fp64_isFinite x -> fp64_isFinite y -> fp64_isFinite z ->
  fp64_LE x y -> fp64_LE y z -> fp64_LE x z.
Proof.
  intros x y z Hfx Hfy Hfz Hxy Hyz.
  apply fp64_LE_implies_B2R_le in Hxy; auto.
  apply fp64_LE_implies_B2R_le in Hyz; auto.
  unfold fp64_LE.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp z) Hfx Hfz).
  assert (Hxz: @Binary.B2R _ _ (bits_to_fp x) <= @Binary.B2R _ _ (bits_to_fp z)) by lra.
  destruct (Rcompare (@Binary.B2R _ _ (bits_to_fp x)) (@Binary.B2R _ _ (bits_to_fp z))) eqn:Hr; try (apply Rcompare_Gt_inv in Hr; lra); auto.
Qed.

Lemma fp64_GE_trans: forall x y z, fp64_isFinite x -> fp64_isFinite y -> fp64_isFinite z ->
  fp64_GE x y -> fp64_GE y z -> fp64_GE x z.
Proof.
  intros x y z Hfx Hfy Hfz Hxy Hyz.
  apply fp64_GE_implies_B2R_ge in Hxy; auto.
  apply fp64_GE_implies_B2R_ge in Hyz; auto.
  unfold fp64_GE.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp z) Hfx Hfz).
  assert (Hxz: @Binary.B2R _ _ (bits_to_fp x) >= @Binary.B2R _ _ (bits_to_fp z)) by lra.
  destruct (Rcompare (@Binary.B2R _ _ (bits_to_fp x)) (@Binary.B2R _ _ (bits_to_fp z))) eqn:Hr; try (apply Rcompare_Lt_inv in Hr; lra); auto.
Qed.

Lemma fp64_LE_refl: forall x, fp64_isFinite x -> fp64_LE x x.
Proof.
  intros x Hfx.
  unfold fp64_LE.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp x) Hfx Hfx).
  rewrite Rcompare_Eq; simpl; auto.
Qed.

Lemma fp64_GE_implies_LE: forall x y, fp64_isFinite x -> fp64_isFinite y -> fp64_GE x y -> fp64_LE y x.
Proof.
  intros x y Hfx Hfy Hge.
  unfold fp64_GE in Hge.
  rewrite (b64_compare_correct (bits_to_fp x) (bits_to_fp y) Hfx Hfy) in Hge.
  unfold fp64_LE.
  rewrite (b64_compare_correct (bits_to_fp y) (bits_to_fp x) Hfy Hfx).
  destruct (Rcompare (@Binary.B2R 53 1024 (bits_to_fp x)) (@Binary.B2R 53 1024 (bits_to_fp y))) eqn:Hr; simpl in Hge; try contradiction.
  - rewrite Rcompare_sym. rewrite Hr. auto.
  - rewrite Rcompare_sym. rewrite Hr. auto.
Qed.



(* ============================================================
 * fp32 定义（单精度浮点）
 * ============================================================ *)

Definition fp32 := Z.

Definition fp32_mw := 23%Z.
Definition fp32_ew := 8%Z.

Definition bits_to_fp32 (z: Z) := binary_float_of_bits fp32_mw fp32_ew ltac:(unfold fp32_mw; lia) ltac:(unfold fp32_ew; lia) ltac:(unfold fp32_mw, fp32_ew; lia) z.
Definition fp32_to_bits (f: Binary.binary_float (fp32_mw + 1) (2 ^ (fp32_ew - 1))) : Z :=
  bits_of_binary_float fp32_mw fp32_ew f.

Definition b32_compare (x y: Binary.binary_float (fp32_mw + 1) (2 ^ (fp32_ew - 1))): option comparison :=
  Binary.Bcompare (fp32_mw + 1) (2 ^ (fp32_ew - 1)) x y.

Definition fp32_LT (x y: fp32): Prop :=
  match b32_compare (bits_to_fp32 x) (bits_to_fp32 y) with Some Lt => True | _ => False end.
Definition fp32_LE (x y: fp32): Prop :=
  match b32_compare (bits_to_fp32 x) (bits_to_fp32 y) with Some Gt => False | _ => True end.
Definition fp32_GT (x y: fp32): Prop :=
  match b32_compare (bits_to_fp32 x) (bits_to_fp32 y) with Some Gt => True | _ => False end.
Definition fp32_GE (x y: fp32): Prop :=
  match b32_compare (bits_to_fp32 x) (bits_to_fp32 y) with Some Lt => False | _ => True end.

Definition fp32_isFinite (x: fp32): Prop :=
  Is_true (@Binary.is_finite (fp32_mw + 1) (2 ^ (fp32_ew - 1)) (bits_to_fp32 x)).

Lemma b32_compare_correct:
  forall x y,
    Is_true (@Binary.is_finite (fp32_mw + 1) (2 ^ (fp32_ew - 1)) x) ->
    Is_true (@Binary.is_finite (fp32_mw + 1) (2 ^ (fp32_ew - 1)) y) ->
    b32_compare x y = Some (Rcompare (@Binary.B2R (fp32_mw + 1) (2 ^ (fp32_ew - 1)) x) (@Binary.B2R (fp32_mw + 1) (2 ^ (fp32_ew - 1)) y)).
Proof.
  intros x y Hx Hy.
  pose proof (Is_true_eq_true _ Hx) as Hx'.
  pose proof (Is_true_eq_true _ Hy) as Hy'.
  unfold b32_compare.
  exact (Binary.Bcompare_correct (fp32_mw + 1) (2 ^ (fp32_ew - 1)) x y Hx' Hy').
Qed.

Lemma fp32_LE_refl: forall x, fp32_isFinite x -> fp32_LE x x.
Proof.
  intros x Hfx.
  unfold fp32_LE.
  rewrite (b32_compare_correct (bits_to_fp32 x) (bits_to_fp32 x) Hfx Hfx).
  rewrite Rcompare_Eq; simpl; auto.
Qed.

Lemma fp32_GE_implies_LE: forall x y, fp32_isFinite x -> fp32_isFinite y -> fp32_GE x y -> fp32_LE y x.
Proof.
  intros x y Hfx Hfy Hge.
  unfold fp32_GE in Hge.
  rewrite (b32_compare_correct (bits_to_fp32 x) (bits_to_fp32 y) Hfx Hfy) in Hge.
  unfold fp32_LE.
  rewrite (b32_compare_correct (bits_to_fp32 y) (bits_to_fp32 x) Hfy Hfx).
  destruct (Rcompare (@Binary.B2R (fp32_mw + 1) (2 ^ (fp32_ew - 1)) (bits_to_fp32 x)) (@Binary.B2R (fp32_mw + 1) (2 ^ (fp32_ew - 1)) (bits_to_fp32 y))) eqn:Hr; simpl in Hge; try contradiction.
  - rewrite Rcompare_sym. rewrite Hr. auto.
  - rewrite Rcompare_sym. rewrite Hr. auto.
Qed.

(* 安全前置与后置 *)
Definition clampSafe (x lo hi: fp64): Prop :=
  fp64_isFinite x /\ fp64_isFinite lo /\ fp64_isFinite hi /\ fp64_LE lo hi.

Definition clampPost (x lo hi ret: fp64): Prop :=
  fp64_LE lo ret /\ fp64_LE ret hi.

Definition clampFloatSafe (x lo hi: fp32): Prop :=
  fp32_isFinite x /\ fp32_isFinite lo /\ fp32_isFinite hi /\ fp32_LE lo hi.

Definition clampFloatPost (x lo hi ret: fp32): Prop :=
  fp32_LE lo ret /\ fp32_LE ret hi.
