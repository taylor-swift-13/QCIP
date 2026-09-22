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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_insert_after.source Require Import xizi_single_link_insert_after_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_insert_after.source Require Import xizi_single_link_insert_after_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_insert_after.source.xizi_single_link_insert_after_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListNodeInsert_entail_wit_1 : SingleLinkListNodeInsert_entail_wit_1.
Proof.
 pre_process.
 unfold xizi_sll_head_payload, generic_sll_head_payload, generic_sll_head,
   sll_head_store, sll_link, xizi_sll_node.
 Intros first.
 Intros.
 Exists first.
 unfold xizi_struct_name, xizi_next_field.
 split_pure_spatial.
 - unfold xizi_sll_payload, generic_sll_payload, xizi_struct_name, xizi_next_field. cancel.
   cancel ((&((linklist_pre) # "SingleLinklistNode" ->ₛ "node_next")) # Ptr |-> first).
 - split_pures; dump_pre_spatial; auto.
Qed. 

Lemma proof_of_SingleLinkListNodeInsert_return_wit_1 : SingleLinkListNodeInsert_return_wit_1.
Proof.
 pre_process.
 unfold xizi_sll_head_payload, generic_sll_head_payload, generic_sll_head,
   sll_head_store, sll_link.
 Exists linklist_node_pre.
 split_pure_spatial.
 - unfold xizi_struct_name, xizi_next_field.
   cancel ((&((linklist_pre) # "SingleLinklistNode" ->ₛ "node_next")) # Ptr |-> linklist_node_pre).
   match goal with |- ?P |-- _ =>
     change (P |-- xizi_sll_payload storeA linklist_node_pre (Build_sll_payload_node a linklist_node_pre :: l)) end.
   sep_apply_r_atomic (xizi_sll_payload_cons storeA linklist_node_pre first a l PreH2).
   unfold sll_link, xizi_struct_name, xizi_next_field.
   cancel (storeA linklist_node_pre a).
   cancel (xizi_sll_payload storeA first l).
   cancel ((&((linklist_node_pre) # "SingleLinklistNode" ->ₛ "node_next")) # Ptr |-> first).
 - split_pures; dump_pre_spatial; auto.
Qed. 

