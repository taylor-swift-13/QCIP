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
From QCIPCases.xizi.xizi_single_link_next Require Import xizi_single_link_next_goal.
From QCIPCases.xizi.xizi_single_link_next Require Import xizi_single_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_next_return_wit_1 : xizi_single_link_next_return_wit_1.
Proof.
  left.
  intros linklist_node_pre l prefix suffix next
    PreH1 PreH2 PreH3.
  apply _derivable1_andp_intros.
  - rewrite PreH3.
    rewrite xizi_sll_next_value_app by exact PreH2.
    prop_apply (xizi_sll_first_value_eq next suffix).
    entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sep_apply
      (xizi_sll_cons linklist_node_pre next suffix);
      [ | exact PreH1 ].
    sep_apply
      (xizi_sllseg_sll
        (xizi_sll_first_value l)
        linklist_node_pre
        prefix
        (linklist_node_pre :: suffix)).
    entailer!.
    rewrite PreH3.
    entailer!.
Qed.
