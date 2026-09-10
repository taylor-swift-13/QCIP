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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_remove_node_entail_wit_1 : xizi_double_link_remove_node_entail_wit_1.
Proof.
  unfold xizi_double_link_remove_node_entail_wit_1.
  left.
  intros linklist_node_pre suffix prefix nodes head PreH1.
  subst nodes.
  sep_apply
    (xizi_dll_split_at_node__dll_cut_split_reconnect
       head prefix linklist_node_pre suffix).
  unfold xizi_dll_next, xizi_dll_prev.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_remove_node_return_wit_1 : xizi_double_link_remove_node_return_wit_1.
Proof.
  unfold xizi_double_link_remove_node_return_wit_1.
  left.
  intros linklist_node_pre suffix prefix head node_next node_prev PreH1.
  fold xizi_dll_next.
  fold xizi_dll_prev.
  apply
    (xizi_dll_remove_result__dll_cut_split_reconnect
       head prefix suffix linklist_node_pre node_next node_prev PreH1).
Qed.
