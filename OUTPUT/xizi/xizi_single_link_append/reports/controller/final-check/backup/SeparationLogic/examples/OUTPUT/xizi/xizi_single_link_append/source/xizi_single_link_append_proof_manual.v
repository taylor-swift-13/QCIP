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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_AppendSingleLinkList_entail_wit_1 : AppendSingleLinkList_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists l.
  entailer!.
Qed.

Lemma proof_of_AppendSingleLinkList_entail_wit_2 : AppendSingleLinkList_entail_wit_2.
Proof.
  aggressive_pre_process.
  Exists (l1a_2 ++ node :: nil) l0.
  sep_apply_l_atomic (xizi_sllseg_len1 node next_2 PreH3).
  sep_apply_l_atomic
    (xizi_sllseg_sllseg linklist_pre node next_2
      l1a_2 (node :: nil)).
  entailer!.
  rewrite <- PreH1.
  rewrite <- app_assoc.
  simpl.
  exact PreH2.
Qed.

Lemma proof_of_AppendSingleLinkList_return_wit_1 : AppendSingleLinkList_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply_l_atomic (xizi_sll_zero 0 l1b eq_refl).
  Intros_p Hnil.
  subst l1b.
  sep_apply_l_atomic
    (xizi_sll_len1 linklist_node_pre 0 PreH3 eq_refl).
  sep_apply_L
    ((&(node # "SingleLinklistNode" ->ₛ "node_next") # Ptr |->
        linklist_node_pre) ::
      (xizi_sll linklist_node_pre (linklist_node_pre :: nil)) :: nil)
    (xizi_sll_cons node linklist_node_pre
      (linklist_node_pre :: nil) PreH2).
  sep_apply_L
    ((xizi_sllseg linklist_pre node l1a) ::
      (xizi_sll node (node :: linklist_node_pre :: nil)) :: nil)
    (xizi_sllseg_sll linklist_pre node l1a
      (node :: linklist_node_pre :: nil)).
  sep_apply_r_atomic
    (xizi_sll_head_from_cons linklist_pre
      (l ++ linklist_node_pre :: nil)).
  match goal with
  | |- context [xizi_sll linklist_pre ?ls] =>
      assert (Hfinal:
        ls = linklist_pre :: (l ++ linklist_node_pre :: nil))
      by (
        change
          (l1a ++ node :: linklist_node_pre :: nil =
           (linklist_pre :: l) ++ linklist_node_pre :: nil);
        rewrite PreH1;
        rewrite <- app_assoc;
        simpl;
        reflexivity);
      rewrite Hfinal
  end.
  entailer!.
Qed.
