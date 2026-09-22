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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_remove_node_entail_wit_1 : xizi_single_link_remove_node_entail_wit_1.
Proof.
  pre_process.
  sep_apply (xizi_sll_to_target_not_same
    linklist_pre linklist_node_pre
    (linklist_pre :: l1_strong_spec) PreH3).
  Intros next ltail.
  Exists linklist_node_node_next next (@nil Z) ltail l1_strong_spec.
  unfold xizi_sllseg.
  unfold xizi_struct_name, xizi_next_field.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_entail_wit_2 : xizi_single_link_remove_node_entail_wit_2.
Proof.
  pre_process.
  unfold xizi_struct_name, xizi_next_field in *.
  sep_apply (xizi_sll_to_target_not_same
    next_2 linklist_node_pre l1b_2 PreH1).
  Intros next ltail.
  pose proof (xizi_sllseg_len1 node next_2 PreH4) as Hseg.
  unfold xizi_struct_name, xizi_next_field in Hseg.
  sep_apply_l_atomic Hseg.
  sep_apply (xizi_sllseg_sllseg
    linklist_pre node next_2 l1a_2 (node :: nil)).
  Exists linklist_node_node_next_3 next
    (l1a_2 ++ node :: nil) ltail l1_strong_spec.
  unfold xizi_struct_name, xizi_next_field.
  entailer!.
  rewrite <- app_assoc.
  simpl.
  rewrite H in PreH3.
  exact PreH3.
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_1 : xizi_single_link_remove_node_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply (xizi_sll_to_target_same linklist_node_pre l1b).
  Intros.
  subst l1b.
  subst linklist_node_node_next_2.
  pose proof (xizi_sllseg_len1 node
    (xizi_sll_first_value l2_strong_spec) PreH5) as Hseg.
  unfold xizi_struct_name, xizi_next_field in Hseg.
  L_sepcon_lift'
    (&(node # "SingleLinklistNode" ->ₛ "node_next") # Ptr |->
      xizi_sll_first_value l2_strong_spec).
  sep_apply_l_atomic Hseg.
  sep_apply (xizi_sllseg_sllseg linklist_pre node
    (xizi_sll_first_value l2_strong_spec) l1a (node :: nil)).
  Exists (xizi_sll_first_value l2_strong_spec).
  entailer!.
  sep_apply_r_atomic (xizi_sll_head_from_cons linklist_pre
    (l1_strong_spec ++ l2_strong_spec)).
  pose proof
    (f_equal (fun xs : list Z => xs ++ l2_strong_spec) PreH4)
    as Hext.
  cbn beta in Hext.
  change (
    xizi_sllseg linklist_pre (xizi_sll_first_value l2_strong_spec)
      (l1a +:: node) **
    xizi_sll (xizi_sll_first_value l2_strong_spec) l2_strong_spec
    |-- xizi_sll linklist_pre
      ((linklist_pre :: l1_strong_spec) ++ l2_strong_spec)).
  rewrite Hext.
  exact (xizi_sllseg_sll linklist_pre
    (xizi_sll_first_value l2_strong_spec)
    (l1a +:: node) l2_strong_spec).
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_2 : xizi_single_link_remove_node_return_wit_2.
Proof.
  pre_process.
  subst next.
  sep_apply (xizi_sll_to_target_zero_nonzero
    linklist_node_pre l1b PreH8).
  Intros.
  contradiction.
Qed.

Lemma proof_of_xizi_single_link_remove_node_which_implies_wit_1 : xizi_single_link_remove_node_which_implies_wit_1.
Proof.
  pre_process.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link.
  Intros first.
  Intros.
  fold xizi_sll.
  rewrite PreH1.
  L_sepcon_lift'
    (xizi_sll first
      (l1_strong_spec ++ linklist_node :: l2_strong_spec)).
  eapply derivable1_trans.
  - exact (xizi_sll_head_split_target linklist first
      l1_strong_spec linklist_node l2_strong_spec H).
  - Exists (xizi_sll_first_value l2_strong_spec).
    unfold xizi_struct_name, xizi_next_field.
    entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec.
Proof.
  pre_process.
  assert (Hmember_nonnull: forall head l node,
    In node l -> xizi_sll_head head l |-- “ node <> NULL ”).
  {
    intros head l node Hin.
    unfold xizi_sll_head, generic_sll_head.
    Intros first.
    sep_apply (xizi_sll_member_split first l node Hin).
    Intros prefix suffix next.
    entailer!.
  }
  assert (Hin: In linklist_node_pre
    (prefix_remove_tail_spec ++ linklist_node_pre :: nil)).
  {
    apply in_or_app.
    right.
    simpl.
    auto.
  }
  prop_apply_p
    (Hmember_nonnull linklist_pre
      (prefix_remove_tail_spec ++ linklist_node_pre :: nil)
      linklist_node_pre Hin).
  Intros.
  Exists (prefix_remove_tail_spec ++ linklist_node_pre :: nil)
    prefix_remove_tail_spec nil.
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  Intros linklist_node_callee_node_next retval.
  Intros.
  subst retval.
  subst linklist_node_callee_node_next.
  simpl.
  unfold xizi_sll_node.
  sep_apply_l_atomic
    (store_ptr_undef_store_ptr
      (&(linklist_node_pre # "SingleLinklistNode" ->ₛ "node_next"))
      (xizi_sll_first_value (@nil Z))).
  rewrite app_nil_r.
  unfold xizi_struct_name, xizi_next_field.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec.
Proof.
  pre_process.
  assert (Hmember_nonnull: forall head l node,
    In node l -> xizi_sll_head head l |-- “ node <> NULL ”).
  {
    intros head l node Hin.
    unfold xizi_sll_head, generic_sll_head.
    Intros first.
    sep_apply (xizi_sll_member_split first l node Hin).
    Intros prefix suffix next.
    entailer!.
  }
  assert (Hin: In linklist_node_pre
    (linklist_node_pre :: suffix_remove_front_spec)).
  {
    left.
    reflexivity.
  }
  prop_apply_p
    (Hmember_nonnull linklist_pre
      (linklist_node_pre :: suffix_remove_front_spec)
      linklist_node_pre Hin).
  Intros.
  Exists (linklist_node_pre :: suffix_remove_front_spec)
    nil suffix_remove_front_spec.
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  Intros linklist_node_callee_node_next retval.
  Intros.
  subst retval.
  subst linklist_node_callee_node_next.
  simpl.
  unfold xizi_sll_node.
  sep_apply_l_atomic
    (store_ptr_undef_store_ptr
      (&(linklist_node_pre # "SingleLinklistNode" ->ₛ "node_next"))
      (xizi_sll_first_value suffix_remove_front_spec)).
  unfold xizi_struct_name, xizi_next_field.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec.
Proof.
  pre_process.
  unfold xizi_sll_head at 1.
  unfold generic_sll_head.
  Intros first.
  sep_apply
    (xizi_sll_member_split first l_remove_member_spec linklist_node_pre H).
  Intros prefix suffix next.
  destruct H1 as [Hl [Hnotin Hnode]].
  subst l_remove_member_spec.
  sep_apply_l_atomic
    (xizi_sll_cons linklist_node_pre next suffix Hnode).
  sep_apply_l_atomic
    (xizi_sllseg_sll first linklist_node_pre prefix
      (linklist_node_pre :: suffix)).
  Exists (prefix ++ linklist_node_pre :: suffix) prefix suffix.
  entailer!.
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - unfold xizi_sll_head, generic_sll_head.
    Exists first.
    entailer!.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    Intros linklist_node_callee_node_next retval.
    Intros.
    subst retval.
    subst linklist_node_callee_node_next.
    pose proof
      (xizi_sll_remove_first_app_first_hit__spec_derivations
        linklist_node_pre prefix suffix Hnotin) as Hremove.
    unfold xizi_sll_node.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(linklist_node_pre # "SingleLinklistNode" ->ₛ "node_next"))
        (xizi_sll_first_value suffix)).
    unfold xizi_struct_name, xizi_next_field.
    entailer!.
    refine
      (@eq_ind_r
        (list Z)
        (prefix ++ suffix)
        (fun l =>
          xizi_sll_head linklist_pre (prefix ++ suffix) |--
          xizi_sll_head linklist_pre l)
        _
        (xizi_sll_remove_first linklist_node_pre
          (prefix ++ linklist_node_pre :: suffix))
        Hremove).
    entailer!.
Qed.
