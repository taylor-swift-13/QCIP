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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node Require Import xizi_double_link_remove_node_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node Require Import xizi_double_link_remove_node_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node Require Import xizi_double_link_remove_node_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_remove_node_entail_wit_1 : xizi_double_link_remove_node_entail_wit_1.
Proof.
  assert (Hseg_to_rev :
    forall node prev stop last nodes,
      xizi_dllseg node prev stop last nodes **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last
      |--
      &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
      xizi_dllseg_shift_rev node stop nodes).
  {
    intros node prev stop last nodes.
    revert node prev last.
    induction nodes as [| expected rest IH]; intros node prev last.
    - simpl. Intros. destruct H as [Hnode Hprev].
      subst node; subst prev; entailer!.
    - simpl. Intros next. Intros. subst expected.
      sep_apply (IH next node last).
      Exists next. entailer!.
  }
  assert (Hfocus :
    forall start first stop last prefix node suffix,
      &(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
      xizi_dllseg first start stop last (prefix ++ node :: suffix) **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last
      |--
      EX next prev,
        “ node <> NULL ” &&
        xizi_dllseg_shift start prev prefix **
        &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node **
        &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
        &(next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node **
        xizi_dllseg_shift_rev next stop suffix).
  {
    intros start first stop last prefix.
    revert start first.
    induction prefix as [| expected rest IH]; intros start first node suffix.
    - simpl. Intros next. Intros. subst first.
      sep_apply (Hseg_to_rev next node stop last suffix).
      Exists next start. simpl. entailer!.
    - simpl. Intros next0. Intros. subst first.
      unfold xizi_dll_links, XiziDLL.links.
      eapply derivable1_trans with
        (y :=
          (&(expected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next0 **
           xizi_dllseg next0 expected stop last (rest ++ node :: suffix) **
           &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
          (&(expected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> start **
           &(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> expected)).
      + entailer!.
      + sep_apply (IH expected next0 node suffix).
        Intros next prev. Exists next prev. simpl. entailer!.
  }
  pre_process.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  unfold XiziDLL.links.
  eapply derivable1_trans with
    (y :=
      &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
      xizi_dllseg first head head last (prefix ++ linklist_node_pre :: suffix) **
      &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  - entailer!.
  - apply (Hfocus head first head last prefix linklist_node_pre suffix).
Qed.

Lemma proof_of_xizi_double_link_remove_node_return_wit_1 : xizi_double_link_remove_node_return_wit_1.
Proof.
  assert (Hrev_to_seg :
    forall node prev stop nodes,
      &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
      xizi_dllseg_shift_rev node stop nodes
      |--
      EX last,
        xizi_dllseg node prev stop last nodes **
        &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  {
    intros node prev stop nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev.
    - simpl. Intros. subst node. Exists prev. simpl. entailer!.
    - simpl. Intros next. Intros. subst node.
      sep_apply (IH next expected). Intros last.
      Exists last. simpl. Exists next. entailer!.
  }
  assert (Hprev_neq : forall p q v1 v2,
    &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> v1 **
    &(q # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> v2
    |-- “ p <> q ”).
  {
    intros p q v1 v2.
    destruct (Z.eq_dec p q) as [Heq | Hne].
    - subst q.
      sep_apply (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev")) v1 v2).
      entailer!.
    - entailer!.
  }
  assert (Hshift_to_seg :
    forall start prev prefix next stop last suffix,
      xizi_dllseg_shift start prev prefix **
      &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
      xizi_dllseg next prev stop last suffix **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last
      |--
      EX first,
        &(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
        xizi_dllseg first start stop last (prefix ++ suffix) **
        &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  {
    intros start prev prefix.
    revert start prev.
    induction prefix as [| expected rest IH]; intros start prev next stop last suffix.
    - simpl. Intros. subst prev. Exists next. entailer!.
    - simpl.
      eapply derivable1_trans with
        (y :=
          (xizi_dllseg_shift expected prev rest **
           &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
           xizi_dllseg next prev stop last suffix **
           &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
          (“ expected <> NULL ” &&
           &(expected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> start **
           &(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> expected)).
      + entailer!.
      + sep_apply (IH expected prev next stop last suffix).
        Intros first.
        prop_apply (Hprev_neq expected stop start last). Intros.
        Exists expected. simpl. Exists first.
        unfold xizi_dll_links, XiziDLL.links. entailer!.
  }
  assert (Hreclose : forall head prefix suffix prev next,
    xizi_dllseg_shift head prev prefix **
    &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
    &(next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
    xizi_dllseg_shift_rev next head suffix
    |-- xizi_dll head (prefix ++ suffix)).
  {
    intros head prefix suffix prev next.
    sep_apply (Hrev_to_seg next prev head suffix). Intros last.
    sep_apply (Hshift_to_seg head prev prefix next head last suffix). Intros first.
    unfold xizi_dll, XiziDLL.dll. Exists first last.
    unfold XiziDLL.links. entailer!.
  }
  pre_process.
  eapply derivable1_trans with
    (y :=
      (xizi_dllseg_shift head node_prev prefix **
       &(node_prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next **
       &(node_next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev **
       xizi_dllseg_shift_rev node_next head suffix) **
      (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_node_pre **
       &(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_node_pre)).
  - entailer!.
  - sep_apply (Hreclose head prefix suffix node_prev node_next).
    change
      (xizi_dll head (prefix ++ suffix) **
       xizi_dll_links linklist_node_pre linklist_node_pre linklist_node_pre
       |--
       xizi_dll head (prefix ++ suffix) ** xizi_dll linklist_node_pre nil).
    sep_apply (xizi_dll_empty_rev linklist_node_pre).
    entailer!.
Qed.
