Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From QCIPCases.IP.StructFilter Require Import IP_StructFilter_goal.
From QCIPCases.IP.StructFilter Require Import IP_StructFilter_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.IP.StructFilter.IP_StructFilter_lib.
Local Open Scope sac.

(* Safety witness 统一证明模式：
   1. 用 pre_process 整理分离逻辑目标；
   2. 对聚合 witness 用 split_pures 拆分上下界；
   3. 用 derivable1s_coq_prop_r 把纯命题拿到 Coq 里；
   4. 展开 StructFilterInputsBounded 及其中的 int64_bounded；
   5. 把定义中的辅助函数（X0..X7、NewX0..NewX7、U2/Y2/Y3/Y4、filter_coeffs_to_rep）化开；
   6. 直接匹配目标表达式，应用已经存在的上下界假设。 *)
Ltac solve_safety :=
  intros;
  pre_process;
  try split_pures;
  apply derivable1s_coq_prop_r;
  unfold StructFilterInputsBounded in *;
  repeat match goal with H: _ /\ _ |- _ => destruct H end;
  repeat match goal with H : int64_bounded _ |- _ => unfold int64_bounded in H end;
  unfold X0, X1, X2, X3, X4, X5, X6, X7,
         StructFilterNewX0, StructFilterNewX1, StructFilterNewX2, StructFilterNewX3,
         StructFilterNewX4, StructFilterNewX5, StructFilterNewX6, StructFilterNewX7,
         StructFilter_U2, StructFilter_Y2, StructFilter_Y3, StructFilterY4,
         filter_coeffs_to_rep in *;
  simpl in *;
  repeat match goal with
    | H : _ <= ?e <= _ |- ?e <= _ => apply H
    | H : _ <= ?e <= _ |- _ <= ?e => apply H
  end;
  auto.

Lemma proof_of_StructFilter_safety_wit_8_split_goal_1 : StructFilter_safety_wit_8_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_8_split_goal_2 : StructFilter_safety_wit_8_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_8 : StructFilter_safety_wit_8.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_9_split_goal_1 : StructFilter_safety_wit_9_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_9_split_goal_2 : StructFilter_safety_wit_9_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_9 : StructFilter_safety_wit_9.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_10_split_goal_1 : StructFilter_safety_wit_10_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_10_split_goal_2 : StructFilter_safety_wit_10_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_10 : StructFilter_safety_wit_10.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_11_split_goal_1 : StructFilter_safety_wit_11_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_11_split_goal_2 : StructFilter_safety_wit_11_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_11 : StructFilter_safety_wit_11.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_13_split_goal_1 : StructFilter_safety_wit_13_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_13_split_goal_2 : StructFilter_safety_wit_13_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_13 : StructFilter_safety_wit_13.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_14_split_goal_1 : StructFilter_safety_wit_14_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_14_split_goal_2 : StructFilter_safety_wit_14_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_14 : StructFilter_safety_wit_14.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_15_split_goal_1 : StructFilter_safety_wit_15_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_15_split_goal_2 : StructFilter_safety_wit_15_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_15 : StructFilter_safety_wit_15.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_17_split_goal_1 : StructFilter_safety_wit_17_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_17_split_goal_2 : StructFilter_safety_wit_17_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_17 : StructFilter_safety_wit_17.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_18_split_goal_1 : StructFilter_safety_wit_18_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_18_split_goal_2 : StructFilter_safety_wit_18_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_18 : StructFilter_safety_wit_18.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_19_split_goal_1 : StructFilter_safety_wit_19_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_19_split_goal_2 : StructFilter_safety_wit_19_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_19 : StructFilter_safety_wit_19.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_20_split_goal_1 : StructFilter_safety_wit_20_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_20_split_goal_2 : StructFilter_safety_wit_20_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_20 : StructFilter_safety_wit_20.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_23_split_goal_1 : StructFilter_safety_wit_23_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_23_split_goal_2 : StructFilter_safety_wit_23_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_23 : StructFilter_safety_wit_23.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_24_split_goal_1 : StructFilter_safety_wit_24_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_24_split_goal_2 : StructFilter_safety_wit_24_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_24 : StructFilter_safety_wit_24.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_27_split_goal_1 : StructFilter_safety_wit_27_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_27_split_goal_2 : StructFilter_safety_wit_27_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_27 : StructFilter_safety_wit_27.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_28_split_goal_1 : StructFilter_safety_wit_28_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_28_split_goal_2 : StructFilter_safety_wit_28_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_28 : StructFilter_safety_wit_28.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_29_split_goal_1 : StructFilter_safety_wit_29_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_29_split_goal_2 : StructFilter_safety_wit_29_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_29 : StructFilter_safety_wit_29.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_30_split_goal_1 : StructFilter_safety_wit_30_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_30_split_goal_2 : StructFilter_safety_wit_30_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_30 : StructFilter_safety_wit_30.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_31_split_goal_1 : StructFilter_safety_wit_31_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_31_split_goal_2 : StructFilter_safety_wit_31_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_31 : StructFilter_safety_wit_31.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_33_split_goal_1 : StructFilter_safety_wit_33_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_33_split_goal_2 : StructFilter_safety_wit_33_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_33 : StructFilter_safety_wit_33.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_34_split_goal_1 : StructFilter_safety_wit_34_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_34_split_goal_2 : StructFilter_safety_wit_34_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_34 : StructFilter_safety_wit_34.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_37_split_goal_1 : StructFilter_safety_wit_37_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_37_split_goal_2 : StructFilter_safety_wit_37_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_37 : StructFilter_safety_wit_37.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_38_split_goal_1 : StructFilter_safety_wit_38_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_38_split_goal_2 : StructFilter_safety_wit_38_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_38 : StructFilter_safety_wit_38.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_41_split_goal_1 : StructFilter_safety_wit_41_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_41_split_goal_2 : StructFilter_safety_wit_41_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_41 : StructFilter_safety_wit_41.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_42_split_goal_1 : StructFilter_safety_wit_42_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_42_split_goal_2 : StructFilter_safety_wit_42_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_42 : StructFilter_safety_wit_42.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_43_split_goal_1 : StructFilter_safety_wit_43_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_43_split_goal_2 : StructFilter_safety_wit_43_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_43 : StructFilter_safety_wit_43.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_44_split_goal_1 : StructFilter_safety_wit_44_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_44_split_goal_2 : StructFilter_safety_wit_44_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_44 : StructFilter_safety_wit_44.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_45_split_goal_1 : StructFilter_safety_wit_45_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_45_split_goal_2 : StructFilter_safety_wit_45_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_45 : StructFilter_safety_wit_45.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_47_split_goal_1 : StructFilter_safety_wit_47_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_47_split_goal_2 : StructFilter_safety_wit_47_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_47 : StructFilter_safety_wit_47.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_48_split_goal_1 : StructFilter_safety_wit_48_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_48_split_goal_2 : StructFilter_safety_wit_48_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_48 : StructFilter_safety_wit_48.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_51_split_goal_1 : StructFilter_safety_wit_51_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_51_split_goal_2 : StructFilter_safety_wit_51_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_51 : StructFilter_safety_wit_51.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_52_split_goal_1 : StructFilter_safety_wit_52_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_52_split_goal_2 : StructFilter_safety_wit_52_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_52 : StructFilter_safety_wit_52.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_55_split_goal_1 : StructFilter_safety_wit_55_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_55_split_goal_2 : StructFilter_safety_wit_55_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_55 : StructFilter_safety_wit_55.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_56_split_goal_1 : StructFilter_safety_wit_56_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_56_split_goal_2 : StructFilter_safety_wit_56_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_56 : StructFilter_safety_wit_56.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_57_split_goal_1 : StructFilter_safety_wit_57_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_57_split_goal_2 : StructFilter_safety_wit_57_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_57 : StructFilter_safety_wit_57.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_58_split_goal_1 : StructFilter_safety_wit_58_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_58_split_goal_2 : StructFilter_safety_wit_58_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_58 : StructFilter_safety_wit_58.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_59_split_goal_1 : StructFilter_safety_wit_59_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_59_split_goal_2 : StructFilter_safety_wit_59_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_59 : StructFilter_safety_wit_59.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_62_split_goal_1 : StructFilter_safety_wit_62_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_62_split_goal_2 : StructFilter_safety_wit_62_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_62 : StructFilter_safety_wit_62.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_63_split_goal_1 : StructFilter_safety_wit_63_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_63_split_goal_2 : StructFilter_safety_wit_63_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_63 : StructFilter_safety_wit_63.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_safety_wit_64_split_goal_1 : StructFilter_safety_wit_64_split_goal_1.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_64_split_goal_2 : StructFilter_safety_wit_64_split_goal_2.
Proof. solve_safety. Qed.

Lemma proof_of_StructFilter_safety_wit_64 : StructFilter_safety_wit_64.
Proof. solve_safety. Qed. 

Lemma proof_of_StructFilter_return_wit_1 : StructFilter_return_wit_1.
Proof.
  (* 选择 return_wit 的第二个分支：从 TT && emp 出发，
     直接构造 new_X 和 ret 使得 StructFilterPost 成立。 *)
  right.
  pre_process.
  intros.
  pose (f := filter_coeffs_to_rep filter_coeffs).
  pose (kp := Znth 0 old_PIDPara 0).
  pose (kd := Znth 2 old_PIDPara 0).
  pose (ki := Znth 1 old_PIDPara 0).
  pose (newX :=
    (StructFilterNewX0 old_X f kp Ang_pre)
    :: (StructFilterNewX1 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX2 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX3 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX4 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX5 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX6 old_X f kp kd Ang_pre dAng_pre)
    :: (StructFilterNewX7 old_X prd ki Ang_pre)
    :: nil).
  Exists newX.
  entailer!.
  unfold StructFilterPost.
  repeat split; simpl; auto; try reflexivity.
Qed. 

