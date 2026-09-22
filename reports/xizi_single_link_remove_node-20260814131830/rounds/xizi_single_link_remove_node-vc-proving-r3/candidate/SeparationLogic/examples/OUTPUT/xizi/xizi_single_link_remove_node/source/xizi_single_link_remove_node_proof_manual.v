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
  aggressive_pre_process.
  Exists l0_2 l0_2.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_entail_wit_2 : xizi_single_link_remove_node_entail_wit_2.
Proof.
  aggressive_pre_process.
  Exists (l1a_2 ++ node :: nil) l0_3 l0_2.
  sep_apply_l_atomic (xizi_sllseg_len1 node next_2 PreH5).
  sep_apply_l_atomic
    (xizi_sllseg_sllseg linklist_pre node next_2 l1a_2 (node :: nil)).
  entailer!.
  rewrite <- PreH1.
  rewrite <- app_assoc.
  simpl.
  exact PreH4.
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_1 : xizi_single_link_remove_node_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply_l_atomic
    (xizi_sll_to_target_same linklist_node_pre l1b).
  Intros_p Hnil.
  subst l1b.
  subst linklist_node_node_next_2.
  Exists (xizi_sll_first_value l2_strong_spec).
  sep_apply_L
    ((&(node # "SingleLinklistNode" ->ₛ "node_next") # Ptr |->
        xizi_sll_first_value l2_strong_spec) :: nil)
    (xizi_sllseg_len1 node (xizi_sll_first_value l2_strong_spec) PreH5).
  sep_apply_L
    ((xizi_sllseg linklist_pre node l1a) ::
      (xizi_sllseg node (xizi_sll_first_value l2_strong_spec)
        (node :: nil)) :: nil)
    (xizi_sllseg_sllseg linklist_pre node
      (xizi_sll_first_value l2_strong_spec) l1a (node :: nil)).
  match goal with
  | |- context [xizi_sllseg linklist_pre _ ?ls] =>
      assert (Hseglist : ls = linklist_pre :: l1_strong_spec)
        by exact (eq_sym PreH4);
      rewrite Hseglist
  end.
  L_sepcon_lift'
    (xizi_sll (xizi_sll_first_value l2_strong_spec) l2_strong_spec).
  match goal with
  | |- context [xizi_sllseg linklist_pre ?tail ?prefix] =>
      L_sepcon_lift' (xizi_sllseg linklist_pre tail prefix)
  end.
  L_sepcon_lift'
    (&(linklist_node_pre # "SingleLinklistNode" ->ₛ "node_next") # Ptr |->
      xizi_sll_first_value l2_strong_spec).
  match goal with
  | |- context [xizi_sllseg linklist_pre ?tail ?prefix] =>
      sep_apply (xizi_sllseg_sll linklist_pre tail prefix l2_strong_spec)
  end.
  sep_apply_L
    ((xizi_sll linklist_pre
       (linklist_pre :: (l1_strong_spec ++ l2_strong_spec))) :: nil)
    (xizi_sll_head_from_cons linklist_pre
      (l1_strong_spec ++ l2_strong_spec)).
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_2 : xizi_single_link_remove_node_return_wit_2.
Proof.
  pre_process.
  subst next.
  sep_apply_l_atomic
    (xizi_sll_to_target_zero_nonzero linklist_node_pre l1b PreH8).
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_which_implies_wit_1 : xizi_single_link_remove_node_which_implies_wit_1.
Proof.
  aggressive_pre_process.
  all: subst l_strong_spec.
  all: sep_apply_l_atomic
    (xizi_sll_head_split_target linklist q l1_strong_spec
      linklist_node l2_strong_spec PreH1).
  all: entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_tail_spec_by_strong_spec.
Proof.
  pre_process.
  assert (HIn:
    In linklist_node_pre
      (prefix_remove_tail_spec ++ linklist_node_pre :: nil)).
  { apply in_or_app. right. simpl. auto. }
  assert (Hmember_nonnull:
    xizi_sll_head linklist_pre
      (prefix_remove_tail_spec ++ linklist_node_pre :: nil)
    |-- “ linklist_node_pre <> NULL ”).
  {
    unfold xizi_sll_head, generic_sll_head.
    Intros first.
    sep_apply
      (xizi_sll_member_split first
        (prefix_remove_tail_spec ++ linklist_node_pre :: nil)
        linklist_node_pre HIn).
    Intros prefix suffix next.
    entailer!.
  }
  prop_apply_p Hmember_nonnull.
  Intros.
  Exists (prefix_remove_tail_spec ++ linklist_node_pre :: nil).
  Exists prefix_remove_tail_spec.
  Exists nil.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros next retval.
  subst retval next.
  simpl.
  unfold xizi_sll_node, xizi_struct_name, xizi_next_field.
  sep_apply store_ptr_undef_store_ptr.
  entailer!.
  rewrite app_nil_r.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_front_spec_by_strong_spec.
Proof.
  pre_process.
  assert (HIn:
    In linklist_node_pre (linklist_node_pre :: suffix_remove_front_spec)).
  { simpl. auto. }
  assert (Hmember_nonnull:
    xizi_sll_head linklist_pre
      (linklist_node_pre :: suffix_remove_front_spec)
    |-- “ linklist_node_pre <> NULL ”).
  {
    unfold xizi_sll_head, generic_sll_head.
    Intros first.
    sep_apply
      (xizi_sll_member_split first
        (linklist_node_pre :: suffix_remove_front_spec)
        linklist_node_pre HIn).
    Intros prefix suffix next.
    entailer!.
  }
  prop_apply_p Hmember_nonnull.
  Intros.
  Exists (linklist_node_pre :: suffix_remove_front_spec).
  Exists nil.
  Exists suffix_remove_front_spec.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros next retval.
  subst retval next.
  simpl.
  unfold xizi_sll_node, xizi_struct_name, xizi_next_field.
  sep_apply store_ptr_undef_store_ptr.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec : xizi_single_link_remove_node_derive_remove_member_spec_by_strong_spec.
Proof.
  pre_process.
  destruct
    (xizi_sll_remove_first_split__spec_derivations_direct
      linklist_node_pre l_remove_member_spec H)
    as (prefix & suffix & Hl & Hnotin & Hremove).
  assert (Hmember_nonnull:
    xizi_sll_head linklist_pre l_remove_member_spec
    |-- “ linklist_node_pre <> NULL ”).
  {
    unfold xizi_sll_head, generic_sll_head.
    Intros first.
    sep_apply
      (xizi_sll_member_split first l_remove_member_spec
        linklist_node_pre H).
    Intros prefix0 suffix0 next0.
    entailer!.
  }
  prop_apply_p Hmember_nonnull.
  Intros.
  Exists l_remove_member_spec.
  Exists prefix.
  Exists suffix.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros next retval.
  subst retval next.
  unfold xizi_sll_node, xizi_struct_name, xizi_next_field.
  sep_apply store_ptr_undef_store_ptr.
  entailer!.
  rewrite Hremove.
  entailer!.
Qed.
