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
From SimpleC.EE.INPUT.xizi.xizi_avl_balance Require Import xizi_avl_balance_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_balance Require Import xizi_avl_balance_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_balance_entail_wit_1 : xizi_avl_balance_entail_wit_1.
Proof.
  pre_process.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH2) as [Hv [Hf Hr]].
  destruct (Hr PreH1) as [Hroot Hvalid].
  unfold avl_tree_store.
  sep_apply_l_atomic (avl_graph_nodes_store_extract__root_and_factor_setup
    before_high_level_spec avl_node_pre (proj1 Hv) Hroot).
  unfold avl_graph_node_store. Intros. entailer!.
Qed.


Lemma proof_of_xizi_avl_balance_entail_wit_2 : xizi_avl_balance_entail_wit_2.
Proof.
  pre_process.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH9) as [Hv [Hf Hr]].
  destruct (Hr PreH4) as [Hroot Hvalid].
  pose proof (avl_balance_factor_value__single_rotation_and_accessors
    before_high_level_spec avl_node_pre retval_2 PreH4 PreH6) as Heq.
  subst retval_2.
  pose proof (avl_balance_right_input__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH9 PreH4 PreH5) as Hinput.
  rewrite avl_cache_self__lr_graph_composition.
  prop_apply_p (store_int_range
    (&(avl_node_pre # "AvlNode" ->ₛ "data"))
    (avl_key_of before_high_level_spec avl_node_pre)).
  Intros_p Hkey.
  pose proof (proj1 (proj2 Hv) avl_node_pre Hvalid) as [Hheight _].
  split_pure_spatial.
  - sep_apply_r_atomic (avl_root_store_reassemble__null_unmatched_balanced_results
      before_high_level_spec avl_node_pre (proj1 Hv) Hroot).
    unfold avl_graph_node_store. entailer!.
    all: lia.
  - entailer!.
Qed.
Lemma proof_of_xizi_avl_balance_entail_wit_3 : xizi_avl_balance_entail_wit_3.
Proof.
 aggressive_pre_process.
 - rewrite avl_cache_self__lr_graph_composition.
   pose proof PreH13 as [[Hb [Hh [Hn [Hbal [Hs [Hr0 Hr]]]]]] Ha].
   sep_apply_r_atomic (avl_root_store_reassemble__null_unmatched_balanced_results before_high_level_spec avl_node_pre Hb (Hr PreH16)).
   unfold avl_graph_node_store. split_pure_spatial.
   + repeat progress cancel.
   + split_pures; dump_pre_spatial; auto; lia.
 - dump_pre_spatial. eapply avl_balance_lr_input__double_rotation_restoration; eauto.
 - dump_pre_spatial. destruct PreH10 as [[Hz Hf]|[Hnz [Hv [Ef Hb]]]]; lia.
 - dump_pre_spatial. destruct PreH10 as [[Hz Hf]|[Hnz [Hv [Ef Hb]]]]; lia.
Qed. 

Lemma proof_of_xizi_avl_balance_entail_wit_4 : xizi_avl_balance_entail_wit_4.
Proof.
  pre_process.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH10) as [Hv [Hf Hr]].
  destruct (Hr PreH4) as [Hroot Hvalid].
  pose proof (avl_balance_factor_value__single_rotation_and_accessors
    before_high_level_spec avl_node_pre retval_2 PreH4 PreH7) as Heq.
  subst retval_2.
  pose proof (avl_balance_left_input__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH10 PreH4 PreH5) as Hinput.
  rewrite avl_cache_self__lr_graph_composition.
  prop_apply_p (store_int_range
    (&(avl_node_pre # "AvlNode" ->ₛ "data"))
    (avl_key_of before_high_level_spec avl_node_pre)).
  Intros_p Hkey.
  pose proof (proj1 (proj2 Hv) avl_node_pre Hvalid) as [Hheight _].
  split_pure_spatial.
  - sep_apply_r_atomic (avl_root_store_reassemble__null_unmatched_balanced_results
      before_high_level_spec avl_node_pre (proj1 Hv) Hroot).
    unfold avl_graph_node_store. entailer!.
    all: lia.
  - entailer!.
Qed.

Lemma proof_of_xizi_avl_balance_entail_wit_5 : xizi_avl_balance_entail_wit_5.
Proof.
 aggressive_pre_process.
 - rewrite avl_cache_self__lr_graph_composition.
   pose proof PreH14 as [[Hb [Hh [Hn [Hbal [Hs [Hr0 Hr]]]]]] Ha].
   sep_apply_r_atomic (avl_root_store_reassemble__null_unmatched_balanced_results before_high_level_spec avl_node_pre Hb (Hr PreH17)).
   unfold avl_graph_node_store. split_pure_spatial.
   + repeat progress cancel.
   + split_pures; dump_pre_spatial; auto; lia.
 - dump_pre_spatial. eapply avl_balance_rl_input__double_rotation_restoration; eauto.
 - dump_pre_spatial. destruct PreH11 as [[Hz Hf]|[Hnz [Hv [Ef Hb]]]]; lia.
 - dump_pre_spatial. destruct PreH11 as [[Hz Hf]|[Hnz [Hv [Ef Hb]]]]; lia.
Qed. 

Lemma proof_of_xizi_avl_balance_return_wit_1 : xizi_avl_balance_return_wit_1.
Proof.
  pre_process.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH6) as [Hv [Hf Hr]].
  destruct (Hr PreH5) as [Hroot Hvalid].
  pose proof (avl_balance_factor_value__single_rotation_and_accessors
    before_high_level_spec avl_node_pre retval PreH5 PreH3) as Heq.
  assert (Hresult : avl_balance_graph_result before_high_level_spec
    before_high_level_spec avl_node_pre).
  { apply avl_balance_unchanged__single_rotation_and_accessors; [exact PreH6|].
    right; lia. }
  prop_apply_p (store_int_range
    (&(avl_node_pre # "AvlNode" ->ₛ "data"))
    (avl_key_of before_high_level_spec avl_node_pre)).
  Intros_p Hkey.
  pose proof (proj1 (proj2 Hv) avl_node_pre Hvalid) as [Hheight _].
  Exists before_high_level_spec.
  split_pure_spatial.
  - sep_apply_r_atomic (avl_root_store_reassemble__null_unmatched_balanced_results
      before_high_level_spec avl_node_pre (proj1 Hv) Hroot).
    unfold avl_graph_node_store. entailer!; lia.
  - entailer!.
Qed.

Lemma proof_of_xizi_avl_balance_return_wit_2 : xizi_avl_balance_return_wit_2.
Proof.
 pre_process.
 unfold avl_rl_rotation_post.
 Intros after.
 Exists after. split_pure_spatial.
 - cancel (avl_tree_store after).
 - dump_pre_spatial. eapply avl_balance_rl_result__double_rotation_restoration; eauto.
Qed. 

Lemma proof_of_xizi_avl_balance_return_wit_3 : xizi_avl_balance_return_wit_3.
Proof.
  pre_process.
  unfold avl_left_rotation_post. Intros after.
  match goal with H : avl_left_rotation_result _ _ _ _ |- _ => rename H into Hrotation end.
  Exists after.
  split_pure_spatial.
  - cancel (avl_tree_store after).
  - dump_pre_spatial.
    exact (avl_balance_left_result__single_rotation_and_accessors
      before_high_level_spec after avl_node_pre retval child_factor
      PreH1 PreH2 PreH3 PreH4 Hrotation).
Qed.

Lemma proof_of_xizi_avl_balance_return_wit_4 : xizi_avl_balance_return_wit_4.
Proof.
 pre_process.
 unfold avl_lr_rotation_post.
 Intros after.
 Exists after. split_pure_spatial.
 - cancel (avl_tree_store after).
 - dump_pre_spatial. eapply avl_balance_lr_result__double_rotation_restoration; eauto.
Qed. 

Lemma proof_of_xizi_avl_balance_return_wit_5 : xizi_avl_balance_return_wit_5.
Proof.
  pre_process.
  unfold avl_right_rotation_post. Intros after.
  match goal with H : avl_right_rotation_result _ _ _ _ |- _ => rename H into Hrotation end.
  Exists after.
  split_pure_spatial.
  - cancel (avl_tree_store after).
  - dump_pre_spatial.
    exact (avl_balance_right_result__single_rotation_and_accessors
      before_high_level_spec after avl_node_pre retval child_factor
      PreH1 PreH2 PreH3 PreH4 Hrotation).
Qed.

Lemma proof_of_xizi_avl_balance_return_wit_6 : xizi_avl_balance_return_wit_6.
Proof.
  pre_process.
  subst avl_node_pre.
  Exists before_high_level_spec.
  split_pure_spatial.
  - cancel (avl_tree_store before_high_level_spec).
  - dump_pre_spatial.
    apply avl_balance_unchanged__single_rotation_and_accessors;
      [exact PreH2|left; reflexivity].
Qed.

Lemma proof_of_xizi_avl_balance_partial_solve_wit_2_pure : xizi_avl_balance_partial_solve_wit_2_pure.
Proof.
  pre_process.
  pose proof (avl_balance_factor_value__single_rotation_and_accessors
    before_high_level_spec avl_node_pre retval PreH4 PreH2) as Heq.
  pose proof (proj1 (proj2 (proj2 (proj2 PreH3))) avl_node_pre PreH7) as [Hleft _].
  destruct (Hleft ltac:(lia)) as [y [Hxy Hy]].
  rewrite Hxy. simpl avl_ptr_of. entailer!.
Qed.

Lemma proof_of_xizi_avl_balance_partial_solve_wit_5_pure : xizi_avl_balance_partial_solve_wit_5_pure.
Proof.
  pre_process.
  pose proof (avl_balance_factor_value__single_rotation_and_accessors
    before_high_level_spec avl_node_pre retval PreH5 PreH3) as Heq.
  pose proof (proj1 (proj2 (proj2 (proj2 PreH4))) avl_node_pre PreH8) as [_ Hright].
  destruct (Hright ltac:(lia)) as [y [Hxy Hy]].
  rewrite Hxy. simpl avl_ptr_of. entailer!.
Qed.
