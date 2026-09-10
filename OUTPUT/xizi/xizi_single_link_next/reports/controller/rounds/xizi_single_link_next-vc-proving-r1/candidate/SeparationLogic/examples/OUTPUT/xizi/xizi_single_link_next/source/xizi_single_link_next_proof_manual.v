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
Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_next.source.xizi_single_link_next_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetNextNode_entail_wit_1 : SingleLinkListGetNextNode_entail_wit_1.
Proof.
  pre_process.
  apply (payload_member_split__payload_next storeA l
    (xizi_sll_first_value (xizi_sll_next_ptrs l)) linklist_node_pre PreH1).
Qed. 

Lemma proof_of_SingleLinkListGetNextNode_return_wit_1 : SingleLinkListGetNextNode_return_wit_1.
Proof.
  pre_process.
  prop_apply_p (payload_first__payload_next storeA next suffix).
  Intros_p Hfirst.
  split_pure_spatial.
  - change (&(linklist_node_pre # "SingleLinklistNode" ->ₛ "node_next") # Ptr |-> next)
      with (sll_link xizi_struct_name xizi_next_field linklist_node_pre next).
    sep_apply_l_atomic (xizi_sll_payload_cons storeA linklist_node_pre next a suffix PreH1).
    subst l.
    sep_apply_l_atomic (payload_append__payload_next storeA prefix
      (xizi_sll_first_value (xizi_sll_next_ptrs (prefix ++ Build_sll_payload_node a linklist_node_pre :: suffix)))
      linklist_node_pre (Build_sll_payload_node a linklist_node_pre :: suffix)).
    cancel (xizi_sll_payload storeA
      (xizi_sll_first_value (xizi_sll_next_ptrs (prefix ++ Build_sll_payload_node a linklist_node_pre :: suffix)))
      (prefix ++ Build_sll_payload_node a linklist_node_pre :: suffix)).
  - dump_pre_spatial.
    rewrite PreH2. unfold xizi_sll_next_ptrs. rewrite map_app. simpl.
    rewrite xizi_sll_next_value_app by exact PreH3.
    exact Hfirst.
Qed. 

