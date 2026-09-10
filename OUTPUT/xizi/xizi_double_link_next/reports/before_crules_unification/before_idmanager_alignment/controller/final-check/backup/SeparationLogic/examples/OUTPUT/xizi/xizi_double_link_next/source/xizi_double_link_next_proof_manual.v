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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
  assert (Hstart_nonzero :
    forall node prev stop last nodes,
      stop <> 0 ->
      xizi_dllseg node prev stop last nodes |-- “ node <> 0 ”).
  {
    intros node prev stop last nodes Hstop.
    destruct nodes as [|current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hnode _].
      subst node.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      entailer!.
  }
  assert (Hdecompose :
    forall (nodes : list Z) node first prev stop last,
      In node nodes ->
      xizi_dllseg first prev stop last nodes |--
      EX node_prev node_next before after,
        “ nodes = before ++ node :: after /\ ~ In node before /\
          node <> 0 /\ node <> stop ” &&
        xizi_dllseg first prev node node_prev before **
        xizi_dll_links node node_next node_prev **
        xizi_dllseg node_next node stop last after).
  {
    induction nodes as [|current rest IH]; intros node first prev stop last Hin.
    - contradiction.
    - simpl in Hin.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      destruct (Z.eq_dec current node) as [Heq | Hneq].
      + subst current.
        Exists prev next (@nil Z) rest.
        simpl.
        unfold xizi_dll_links.
        entailer!.
      + destruct Hin as [Heq | Hin]; [contradiction |].
        sep_apply (IH node next current stop last Hin).
        Intros node_prev node_next before after.
        Intros.
        destruct H as [Hnodes [Hnotin [Hnode0 Hnodestop]]].
        Exists node_prev node_next (current :: before) after.
        simpl.
        Exists next.
        unfold xizi_dll_links.
        entailer!.
        * f_equal. exact Hnodes.
        * intros [Heq | Hmem]; [contradiction | apply Hnotin; exact Hmem].
  }
  pre_process.
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - Right.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    Intros.
    prop_apply
      (Hstart_nonzero
        first linklist_pre linklist_pre last nodes_dispatch_case H).
    Intros.
    sep_apply (Hdecompose
      nodes_dispatch_case linklist_node_pre first linklist_pre
      linklist_pre last Hin).
    Intros node_prev node_next before after.
    Intros.
    destruct H1 as [Hnodes [Hnotin [Hnode0 Hnodehead]]].
    prop_apply
      (Hstart_nonzero
        node_next linklist_node_pre linklist_pre last after H).
    Intros.
    Exists node_prev last node_next before after first.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    apply (xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free
      linklist_pre linklist_node_pre nodes_dispatch_case before after);
      assumption.
  - subst linklist_node_pre.
    Left.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    Intros.
    prop_apply
      (Hstart_nonzero
        first linklist_pre linklist_pre last nodes_dispatch_case H).
    Intros.
    Exists last first.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [|congruence].
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  left.
  pre_process.
  subst first linklist_node_pre.
  destruct nodes_dispatch_case as [|current rest].
  - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
    Intros.
    destruct H as [_ Hlast].
    subst last.
    unfold xizi_double_link_next_dispatch_value,
      xizi_double_link_first_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [|congruence].
    unfold xizi_dll, XiziDLL.dll.
    Exists linklist_pre linklist_pre.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
    Intros next.
    Intros.
    contradiction.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  assert (Hequal_end_empty :
    forall node prev last nodes,
      xizi_dllseg node prev node last nodes |--
      “ nodes = nil /\ prev = last ”).
  {
    intros node prev last nodes.
    destruct nodes as [|current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      contradiction.
  }
  assert (Hrecompose :
    forall (before after : list Z) head head_first first last
      seg_prev node node_prev node_next,
      node <> 0 -> node <> head ->
      xizi_dllseg first seg_prev node node_prev before **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head_first **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev **
      xizi_dllseg node_next node head last after)))) |--
      xizi_dllseg first seg_prev head last (before ++ node :: after) **
      xizi_dll_links head head_first last).
  {
    induction before as [|current rest IH];
      intros after head head_first first last seg_prev node node_prev node_next
        Hnode0 Hnodehead.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first node_prev.
      Exists node_next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      destruct (Z.eq_dec current head) as [Heq | Hcurrenthead].
      + subst current.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_assoc_change.
        lazymatch goal with
        | |- store_ptr ?addr next ** _ |-- _ =>
            L_sepcon_lift' (store_ptr addr head_first);
            sep_apply (dup_store_ptr addr next head_first)
        end.
        entailer!.
      + rewrite (IH after head head_first next last current node node_prev node_next
          Hnode0 Hnodehead).
        Exists next.
        entailer!.
  }
  left.
  pre_process.
  subst node_next.
  prop_apply
    (Hequal_end_empty
      linklist_pre linklist_node_pre last nodes_after).
  Intros.
  destruct H as [Hafter Hlast].
  subst nodes_after last.
  subst nodes_dispatch_case.
  sepcon_assoc_change.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev).
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre).
  L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_node_pre).
  L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
  L_sepcon_lift'
    (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
  rewrite
    (Hrecompose
      nodes_before (@nil Z) linklist_pre first first linklist_node_pre
      linklist_pre linklist_node_pre node_prev linklist_pre PreH7 PreH8).
  unfold xizi_dll, XiziDLL.dll.
  Exists first linklist_node_pre.
  unfold xizi_dll_links, XiziDLL.links.
  unfold xizi_double_link_first_value in PreH6.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  assert (Hfirst_value :
    forall node prev stop last nodes,
      node <> stop ->
      xizi_dllseg node prev stop last nodes |--
      “ xizi_double_link_first_value nodes = node ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [|current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Heq _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst node.
      unfold xizi_double_link_first_value.
      entailer!.
  }
  assert (Hrecompose :
    forall (before after : list Z) head head_first first last
      seg_prev node node_prev node_next,
      node <> 0 -> node <> head ->
      xizi_dllseg first seg_prev node node_prev before **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head_first **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev **
      xizi_dllseg node_next node head last after)))) |--
      xizi_dllseg first seg_prev head last (before ++ node :: after) **
      xizi_dll_links head head_first last).
  {
    induction before as [|current rest IH];
      intros after head head_first first last seg_prev node node_prev node_next
        Hnode0 Hnodehead.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first node_prev.
      Exists node_next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      destruct (Z.eq_dec current head) as [Heq | Hcurrenthead].
      + subst current.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_assoc_change.
        lazymatch goal with
        | |- store_ptr ?addr next ** _ |-- _ =>
            L_sepcon_lift' (store_ptr addr head_first);
            sep_apply (dup_store_ptr addr next head_first)
        end.
        entailer!.
      + rewrite (IH after head head_first next last current node node_prev node_next
          Hnode0 Hnodehead).
        Exists next.
        entailer!.
  }
  left.
  pre_process.
  prop_apply
    (Hfirst_value
      node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros.
  subst nodes_dispatch_case.
  sepcon_assoc_change.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev).
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
  L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
  L_sepcon_lift'
    (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
  rewrite
    (Hrecompose
      nodes_before nodes_after linklist_pre first first last
      linklist_pre linklist_node_pre node_prev node_next PreH7 PreH8).
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  assert (Hfirst_value :
    forall node prev stop last nodes,
      node <> stop ->
      xizi_dllseg node prev stop last nodes |--
      “ xizi_double_link_first_value nodes = node ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [|current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Heq _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst node.
      unfold xizi_double_link_first_value.
      entailer!.
  }
  left.
  pre_process.
  subst linklist_node_pre.
  prop_apply
    (Hfirst_value
      first linklist_pre linklist_pre last nodes_dispatch_case PreH1).
  Intros.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists retval_2.
  entailer!.
  - subst linklist_node_pre.
    rewrite H0.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); congruence.
  - unfold xizi_double_link_next_anchor.
    right.
    exact H.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  assert (Hdllseg_member_not_stop__contract_derivation_obligations :
    forall (current previous stop last target : Z) (nodes : list Z),
      In target nodes ->
      xizi_dllseg current previous stop last nodes |-- “ target <> stop ”).
  {
    intros current previous stop last target nodes.
    revert current previous.
    induction nodes as [| expected rest IH]; intros current previous Hin.
    - contradiction.
    - simpl in Hin.
      destruct Hin as [Heq | Hin].
      + subst target.
        unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros next.
        Intros.
        entailer!.
      + unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros next.
        Intros.
        prop_apply_p (IH next current Hin).
        entailer!.
  }
  assert (Hdll_member_not_head__contract_derivation_obligations :
    xizi_dll linklist_pre nodes_member_case |--
      “ linklist_node_pre <> linklist_pre ”).
  {
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply_p
      (Hdllseg_member_not_stop__contract_derivation_obligations
         first linklist_pre linklist_pre last linklist_node_pre
         nodes_member_case H).
    entailer!.
  }
  prop_apply_p
    Hdll_member_not_head__contract_derivation_obligations.
  Intros_p Hneq.
  Exists nodes_member_case.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists retval_2.
  entailer!.
  - rewrite H0.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
  - unfold xizi_double_link_next_anchor.
    left.
    exact H.
Qed.
