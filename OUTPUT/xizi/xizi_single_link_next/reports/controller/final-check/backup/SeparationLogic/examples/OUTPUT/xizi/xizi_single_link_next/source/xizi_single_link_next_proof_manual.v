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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_next.source Require Import xizi_single_link_next_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_next.source Require Import xizi_single_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetNextNode_return_wit_1 : SingleLinkListGetNextNode_return_wit_1.
Proof.
  pre_process.
  prop_apply_p (xizi_sll_first_value_eq next suffix).
  Intros_p Hnext.
  split_pure_spatial.
  - fold xizi_struct_name xizi_next_field.
    sep_apply_l_atomic
      (xizi_sll_cons linklist_node_pre next suffix PreH1).
    sep_apply_l_atomic
      (xizi_sllseg_sll (xizi_sll_first_value l) linklist_node_pre
        prefix (linklist_node_pre :: suffix)).
    subst l.
    entailer!.
  - dump_pre_spatial.
    subst l.
    rewrite xizi_sll_next_value_app by exact PreH2.
    exact Hnext.
Qed.
