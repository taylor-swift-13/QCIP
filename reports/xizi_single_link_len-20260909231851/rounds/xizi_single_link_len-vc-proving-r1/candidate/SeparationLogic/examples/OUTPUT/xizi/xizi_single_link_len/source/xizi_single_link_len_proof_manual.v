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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_len.source Require Import xizi_single_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_len.source Require Import xizi_single_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetLen_entail_wit_1 : SingleLinkListGetLen_entail_wit_1.
Proof.
  pre_process.
  apply (payload_head_factor__remove_payloads A storeA l linklist_pre).
Qed. 

Lemma proof_of_SingleLinkListGetLen_entail_wit_2 : SingleLinkListGetLen_entail_wit_2.
Proof.
  pre_process.
  Exists q (@nil Z) (xizi_sll_payload_addresses l).
  unfold xizi_sllseg. simpl.
  entailer!.
Qed. 

Lemma proof_of_SingleLinkListGetLen_entail_wit_3 : SingleLinkListGetLen_entail_wit_3.
Proof.
  pre_process.
  fold xizi_struct_name xizi_next_field.
  prop_apply_p (xizi_sll_loop_length_max linklist_pre first_2 tmp_list q l1_2 l0 ltac:(assumption)).
  Intros_p Hbound.
  Exists first_2 (l1_2 ++ tmp_list :: nil) l0.
  sep_apply (xizi_sllseg_len1 tmp_list q); [ | assumption ].
  sep_apply (xizi_sllseg_sllseg first_2 tmp_list q l1_2 (tmp_list :: nil)).
  split_pure_spatial.
  - cancel. entailer!.
  - split_pures; dump_pre_spatial.
    + subst. rewrite <- app_assoc. simpl. assumption.
    + subst. rewrite Zlength_app, Zlength_cons, Zlength_nil.
      rewrite unsigned_last_nbits_eq.
      * lia.
      * rewrite Zlength_app, Zlength_cons in Hbound.
        pose proof (Zlength_nonneg l1_2).
        pose proof (Zlength_nonneg l0).
        change (Int.max_unsigned / 4 + 1) with 1073741824 in Hbound.
        change (2 ^ 32) with 4294967296.
        rewrite <- Z.add_1_r in Hbound.
        unfold addr in Hbound. lia.
    + assumption.
Qed. 

Lemma proof_of_SingleLinkListGetLen_return_wit_1 : SingleLinkListGetLen_return_wit_1.
Proof.
  pre_process.
  subst tmp_list.
  sep_apply (xizi_sll_zero 0 l2); [ | reflexivity ].
  Intros_p Hnil. subst l2.
  rewrite app_nil_r in *.
  sep_apply (xizi_sllseg_0_sll first l1).
  split_pure_spatial.
  - sep_apply_r_atomic (payload_head_unfactor__remove_payloads A storeA l linklist_pre).
    unfold xizi_sll_head, generic_sll_head.
    Exists first.
    unfold xizi_head_store, sll_head_store, sll_link, xizi_struct_name, xizi_next_field.
    fold xizi_sll.
    subst. entailer!.
  - dump_pre_spatial. subst.
    unfold xizi_sll_payload_addresses.
    rewrite !Zlength_correct, map_length. reflexivity.
Qed. 

