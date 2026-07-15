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
From SimpleC.EE.Verification.xizi.xizi_avl_left_rotate Require Import xizi_avl_left_rotate_goal.
From SimpleC.EE.Verification.xizi.xizi_avl_left_rotate Require Import xizi_avl_left_rotate_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_left_rotate_entail_wit_1 : xizi_avl_left_rotate_entail_wit_1.
Proof.
  unfold xizi_avl_left_rotate_entail_wit_1.
  left.
  intros avl_node_pre before c b a right_height right_data
    root_height root_data right_addr data height left_tree right_tree
    PreH1 PreH2 PreH3 PreH4.
  assert (Heq :
    avl_node_model avl_node_pre data height left_tree right_tree =
    avl_node_model avl_node_pre root_data root_height a
      (avl_node_model right_addr right_data right_height b c)) by congruence.
  inversion Heq; subst; clear Heq.
  simpl.
  sep_apply_l_atomic
    (avl_node_fields_fold avl_node_pre root_data root_height
      (avl_root_addr a) right_addr).
  entailer!.
Qed.

Lemma proof_of_xizi_avl_left_rotate_return_wit_1 : xizi_avl_left_rotate_return_wit_1.
Proof.
  unfold xizi_avl_left_rotate_return_wit_1.
  left.
  intros avl_node_pre before c b a right_height right_data
    root_height root_data right_addr data height left_tree right_tree
    PreH1 PreH2 PreH3 PreH4.
  inversion PreH1.
  subst data; subst height; subst left_tree; subst right_tree.
  clear PreH1.
  simpl.
  assert (Hrot :
    avl_left_rotation before
      (avl_node_model right_addr right_data right_height
        (avl_node_model avl_node_pre root_data root_height a b) c)).
  {
    unfold avl_left_rotation.
    exists avl_node_pre, right_addr, root_data, root_height,
      right_data, right_height, a, b, c.
    split; [exact PreH4 | reflexivity].
  }
  sep_apply_l_atomic
    (avl_node_fields_fold avl_node_pre root_data root_height
      (avl_root_addr a) (avl_root_addr b)).
  sep_apply_l_atomic
    (store_addr_avl_node_rev avl_node_pre root_data root_height a b PreH2).
  sep_apply_l_atomic
    (avl_node_fields_fold right_addr right_data right_height avl_node_pre
      (avl_root_addr c)).
  pose proof
    (store_addr_avl_node_rev right_addr right_data right_height
      (avl_node_model avl_node_pre root_data root_height a b) c PreH3)
    as Hpromoted.
  simpl in Hpromoted.
  sep_apply_l_atomic Hpromoted.
  Exists (avl_node_model right_addr right_data right_height
    (avl_node_model avl_node_pre root_data root_height a b) c).
  entailer!.
Qed.
