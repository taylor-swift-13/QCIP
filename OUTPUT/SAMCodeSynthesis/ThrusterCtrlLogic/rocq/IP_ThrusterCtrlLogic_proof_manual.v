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
Require Import IP_ThrusterCtrlLogic_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.ThrusterCtrlLogic.IP_ThrusterCtrlLogic_lib.
Local Open Scope sac.
Import ListNotations.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_1 : ThrusterCtrlLogicFun_return_wit_1.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_1. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_2 : ThrusterCtrlLogicFun_return_wit_2.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_2. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_3 : ThrusterCtrlLogicFun_return_wit_3.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_3. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_4 : ThrusterCtrlLogicFun_return_wit_4.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_4. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_5 : ThrusterCtrlLogicFun_return_wit_5.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_5. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_6 : ThrusterCtrlLogicFun_return_wit_6.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_6. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_7 : ThrusterCtrlLogicFun_return_wit_7.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_7. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_8 : ThrusterCtrlLogicFun_return_wit_8.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_8. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_9 : ThrusterCtrlLogicFun_return_wit_9.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_9. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_10 : ThrusterCtrlLogicFun_return_wit_10.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_10. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_11 : ThrusterCtrlLogicFun_return_wit_11.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_11. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_12 : ThrusterCtrlLogicFun_return_wit_12.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_12. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_13 : ThrusterCtrlLogicFun_return_wit_13.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_13. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_14 : ThrusterCtrlLogicFun_return_wit_14.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_14. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_15 : ThrusterCtrlLogicFun_return_wit_15.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_15. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_16 : ThrusterCtrlLogicFun_return_wit_16.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_16. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_17 : ThrusterCtrlLogicFun_return_wit_17.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_17. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_18 : ThrusterCtrlLogicFun_return_wit_18.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_18. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_19 : ThrusterCtrlLogicFun_return_wit_19.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_19. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_20 : ThrusterCtrlLogicFun_return_wit_20.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_20. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_21 : ThrusterCtrlLogicFun_return_wit_21.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_21. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_22 : ThrusterCtrlLogicFun_return_wit_22.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_22. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_23 : ThrusterCtrlLogicFun_return_wit_23.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_23. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_24 : ThrusterCtrlLogicFun_return_wit_24.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_24. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_25 : ThrusterCtrlLogicFun_return_wit_25.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_25. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_26 : ThrusterCtrlLogicFun_return_wit_26.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_26. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_27 : ThrusterCtrlLogicFun_return_wit_27.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_27. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_28 : ThrusterCtrlLogicFun_return_wit_28.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_28. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_29 : ThrusterCtrlLogicFun_return_wit_29.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_29. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_30 : ThrusterCtrlLogicFun_return_wit_30.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_30. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_31 : ThrusterCtrlLogicFun_return_wit_31.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_31. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_32 : ThrusterCtrlLogicFun_return_wit_32.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_32. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 1; 1])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_33 : ThrusterCtrlLogicFun_return_wit_33.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_33. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_34 : ThrusterCtrlLogicFun_return_wit_34.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_34. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_35 : ThrusterCtrlLogicFun_return_wit_35.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_35. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_36 : ThrusterCtrlLogicFun_return_wit_36.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_36. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_37 : ThrusterCtrlLogicFun_return_wit_37.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_37. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_38 : ThrusterCtrlLogicFun_return_wit_38.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_38. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_39 : ThrusterCtrlLogicFun_return_wit_39.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_39. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_40 : ThrusterCtrlLogicFun_return_wit_40.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_40. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 1; 1; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_41 : ThrusterCtrlLogicFun_return_wit_41.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_41. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_42 : ThrusterCtrlLogicFun_return_wit_42.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_42. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_43 : ThrusterCtrlLogicFun_return_wit_43.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_43. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_44 : ThrusterCtrlLogicFun_return_wit_44.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_44. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_45 : ThrusterCtrlLogicFun_return_wit_45.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_45. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_46 : ThrusterCtrlLogicFun_return_wit_46.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_46. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_47 : ThrusterCtrlLogicFun_return_wit_47.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_47. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_48 : ThrusterCtrlLogicFun_return_wit_48.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_48. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 0; 0; 0; 0; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_49 : ThrusterCtrlLogicFun_return_wit_49.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_49. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_50 : ThrusterCtrlLogicFun_return_wit_50.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_50. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_51 : ThrusterCtrlLogicFun_return_wit_51.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_51. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_52 : ThrusterCtrlLogicFun_return_wit_52.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_52. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_53 : ThrusterCtrlLogicFun_return_wit_53.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_53. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_54 : ThrusterCtrlLogicFun_return_wit_54.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_54. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_55 : ThrusterCtrlLogicFun_return_wit_55.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_55. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_56 : ThrusterCtrlLogicFun_return_wit_56.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_56. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 1; 1; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_57 : ThrusterCtrlLogicFun_return_wit_57.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_57. left. intros.
  Exists [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_58 : ThrusterCtrlLogicFun_return_wit_58.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_58. left. intros.
  Exists [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 0; 0; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_59 : ThrusterCtrlLogicFun_return_wit_59.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_59. left. intros.
  Exists [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_60 : ThrusterCtrlLogicFun_return_wit_60.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_60. left. intros.
  Exists [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_61 : ThrusterCtrlLogicFun_return_wit_61.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_61. left. intros.
  Exists [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_62 : ThrusterCtrlLogicFun_return_wit_62.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_62. left. intros.
  Exists [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 1; 1; 1; 1; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_63 : ThrusterCtrlLogicFun_return_wit_63.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_63. left. intros.
  Exists [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [0; 0; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_return_wit_64 : ThrusterCtrlLogicFun_return_wit_64.
Proof.
  unfold ThrusterCtrlLogicFun_return_wit_64. left. intros.
  Exists [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0].
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply (derivable1s_coq_prop_r (Zlength [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0] = 12)). reflexivity.
    + apply (derivable1s_coq_prop_r (ThrusterCtrlLogicPost yp_list yn_list [1; 1; 0; 0; 1; 1; 0; 0; 1; 1; 0; 0])).
      unfold ThrusterCtrlLogicPost, thruster_wPulse, bit_of_flag. simpl.
      split; [auto | ].
      split; [auto | ].
      repeat (try (rewrite Z.eqb_refl);
              try (match goal with
                   | H: ?x = 0 |- context [(?x =? 0)%Z] => rewrite H; rewrite Z.eqb_refl
                   | H: ?x <> 0 |- context [(?x =? 0)%Z] => rewrite (proj2 (Z.eqb_neq x 0) H)
                   end));
      reflexivity.
  - entailer!.
Qed.

