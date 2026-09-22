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
From QCIPCases.xizi.xizi_single_link_len Require Import xizi_single_link_len_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_len_safety_wit_1 : xizi_single_link_len_safety_wit_1.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_len_safety_wit_2 : xizi_single_link_len_safety_wit_2.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_len_entail_wit_1 : xizi_single_link_len_entail_wit_1.
Proof.
  left.
  intros.
  Exists q nil l.
  unfold xizi_sllseg.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_len_entail_wit_2 : xizi_single_link_len_entail_wit_2.
Proof.
  pre_process.
  subst l2_2 l length.
  fold xizi_struct_name.
  fold xizi_next_field.
  prop_apply
    (xizi_sll_loop_length_max
      linklist_pre first_2 tmp_list q l1_2 l0 PreH2).
  Exists first_2 (l1_2 ++ (tmp_list :: nil)) l0.
  entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sep_apply (xizi_sllseg_len1 tmp_list q); [ | exact PreH2 ].
    sep_apply
      (xizi_sllseg_sllseg
        first_2 tmp_list q l1_2 (tmp_list :: nil)).
    entailer!.
  - rewrite Zlength_app_cons.
    rewrite unsigned_last_nbits_eq.
    + reflexivity.
    + rewrite Zlength_app, Zlength_cons in H.
      pose proof (Zlength_nonneg l1_2).
      pose proof (Zlength_nonneg l0).
      change Int.max_unsigned with 4294967295 in H.
      simpl in H.
      change (2 ^ 32) with 4294967296.
      unfold Z.succ in H.
      split.
      * lia.
      * assert (Htail : 1 <= Zlength l0 + 1).
        {
          exact
            (proj1
              (Z.add_le_mono_r 0 (Zlength l0) 1)
              H1).
        }
        assert
          (Hprefix :
            Zlength l1_2 + 1 <=
            Zlength l1_2 + (Zlength l0 + 1)).
        {
          exact
            (proj1
              (Z.add_le_mono_l 1 (Zlength l0 + 1) (Zlength l1_2))
              Htail).
        }
        eapply Z.le_lt_trans.
        -- eapply Z.le_trans; [exact Hprefix | exact H].
        -- lia.
  - rewrite <- app_assoc.
    reflexivity.
Qed.

Lemma proof_of_xizi_single_link_len_return_wit_1 : xizi_single_link_len_return_wit_1.
Proof.
  pre_process.
  subst tmp_list l length.
  sep_apply_left (xizi_sll_zero 0 l2 eq_refl).
  Intros.
  subst l2.
  split_pure_spatial.
  - unfold xizi_sll_head, generic_sll_head, xizi_head_store,
      sll_head_store, sll_link.
    Exists first.
    sep_apply_left (xizi_sllseg_0_sll first l1).
    unfold xizi_sll, xizi_struct_name, xizi_next_field.
    rewrite app_nil_r.
    entailer!.
  - rewrite app_nil_r.
    entailer!.
Qed.

Lemma proof_of_xizi_single_link_len_partial_solve_wit_1 : xizi_single_link_len_partial_solve_wit_1.
Proof.
  pre_process.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link.
  Intros q.
  Exists q.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_len_partial_solve_wit_2 : xizi_single_link_len_partial_solve_wit_2.
Proof.
  pre_process.
  sep_apply xizi_sll_not_zero; [ | exact PreH1 ].
  Intros q l0.
  Exists l0 q.
  entailer!.
Qed.
