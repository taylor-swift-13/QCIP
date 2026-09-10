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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_insert_before.source Require Import xizi_double_link_init_then_insert_before_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_init_then_insert_before_return_wit_1 : xizi_double_link_init_then_insert_before_return_wit_1.
Proof.
  left.
  intros linklist_node_pre linklist_head_pre nodes PreH1 PreH2 PreH3.
  subst nodes.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_derive_sentinel_case_by_dispatch_case : xizi_double_link_insert_before_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  assert (Hseg : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev stop last.
    induction nodes as [| expected rest IH]; intros node prev stop last.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next.
      Intros.
      prop_apply (IH next node stop last).
      Intros.
      entailer!.
      intros [Heq | Hin].
      + subst expected. contradiction.
      + contradiction.
  }
  assert (Hhead :
    xizi_dll linklist_pre nodes_sentinel_case |--
      “ ~ In linklist_pre nodes_sentinel_case ”).
  {
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply (Hseg first linklist_pre linklist_pre last nodes_sentinel_case).
    Intros.
    entailer!.
  }
  prop_apply_p Hhead.
  Intros_p Hnotin.
  Exists linklist_pre nodes_sentinel_case.
  unfold xizi_double_link_insert_before_anchor.
  rewrite
    (xizi_insert_before_absent_append__dispatch_case_derivations
       nodes_sentinel_case linklist_pre linklist_node_pre Hnotin).
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_derive_member_case_by_dispatch_case : xizi_double_link_insert_before_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  Exists head_member_case nodes_member_case.
  unfold xizi_double_link_insert_before_anchor.
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.
