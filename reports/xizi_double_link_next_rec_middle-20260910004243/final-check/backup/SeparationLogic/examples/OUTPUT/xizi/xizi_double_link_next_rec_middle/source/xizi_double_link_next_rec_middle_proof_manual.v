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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
  assert (Hstart_nonzero : forall node prev stop last nodes,
    stop <> 0 ->
    xizi_dllseg node prev stop last nodes |-- “ node <> 0 ”).
  { intros node prev stop last nodes Hstop.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next. Intros. entailer!. }
  assert (Hsplit_segment :
    forall first prev stop last selected before after,
      stop <> 0 ->
      ~ In selected before ->
      xizi_dllseg first prev stop last (before ++ selected :: after) |--
      EX selected_prev next,
        “ first <> 0 ” && “ selected <> 0 ” &&
        “ selected <> stop ” && “ next <> 0 ” &&
        xizi_dllseg first prev selected selected_prev before **
        xizi_dll_links selected next selected_prev **
        xizi_dllseg next selected stop last after).
  { intros first prev stop last selected before.
    revert first prev.
    induction before as [| current before IH];
      intros first prev after Hstop Hnotin.
    - simpl. Intros next. Intros. subst first.
      prop_apply_p (Hstart_nonzero next selected stop last after Hstop).
      Exists prev next. entailer!.
    - simpl in Hnotin |- *.
      Intros next0. Intros.
      assert (Hcurrent : current <> selected).
      { intro Heq. apply Hnotin. left. exact Heq. }
      assert (Hrest : ~ In selected before).
      { intro Hin. apply Hnotin. right. exact Hin. }
      sep_apply_l_atomic (IH next0 first after Hstop Hrest).
      Intros selected_prev next.
      Exists selected_prev next. Exists next0. entailer!. }
  assert (Hsplit_full :
    forall head nodes selected before after,
      nodes = before ++ selected :: after ->
      ~ In selected before ->
      xizi_dll head nodes |--
      EX first last selected_prev next,
        “ head <> 0 ” && “ first <> 0 ” &&
        “ selected <> 0 ” && “ selected <> head ” &&
        “ next <> 0 ” &&
        xizi_dll_links head first last **
        xizi_dllseg first head selected selected_prev before **
        xizi_dll_links selected next selected_prev **
        xizi_dllseg next selected head last after).
  { intros head nodes selected before after Hnodes Hnotin.
    subst nodes. unfold xizi_dll, XiziDLL.dll.
    Intros first last. Intros. rename H into Hhead.
    sep_apply_l_atomic
      (Hsplit_segment first head head last selected before after Hhead Hnotin).
    Intros selected_prev next.
    Exists first last selected_prev next. entailer!. }
  assert (Hsplit_full_fields :
    forall head nodes selected before after,
      nodes = before ++ selected :: after ->
      ~ In selected before ->
      xizi_dll head nodes |--
      EX first last selected_prev next,
        “ head <> 0 ” && “ first <> 0 ” &&
        “ selected <> 0 ” && “ selected <> head ” &&
        “ next <> 0 ” &&
        (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) **
        (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
        xizi_dllseg first head selected selected_prev before **
        (&(selected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) **
        (&(selected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> selected_prev) **
        xizi_dllseg next selected head last after).
  { intros head nodes selected before after Hnodes Hnotin.
    sep_apply_l_atomic (Hsplit_full head nodes selected before after Hnodes Hnotin).
    Intros first last selected_prev next.
    Exists first last selected_prev next.
    unfold xizi_dll_links, XiziDLL.links. entailer!. }
  assert (Hopen_fields : forall head nodes,
    xizi_dll head nodes |--
    EX first last,
      “ head <> 0 ” && “ first <> 0 ” &&
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
      xizi_dllseg first head head last nodes).
  { intros head nodes. unfold xizi_dll, XiziDLL.dll.
    Intros first last. Intros. rename H into Hhead.
    destruct nodes as [| expected rest].
    - simpl. Intros. destruct H as [Hfirst Hlast].
      subst first. subst last. Exists head head. entailer!.
    - simpl. Intros next. Intros. Exists first last. Exists next. entailer!. }
  pre_process.
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - destruct
      (xizi_double_link_in_first_occurrence__dll_dispatch_and_reclose
         nodes_dispatch_case linklist_node_pre Hin)
      as [before [after [Hnodes Hnotin]]].
    sep_apply_l_atomic
      (Hsplit_full_fields linklist_pre nodes_dispatch_case linklist_node_pre
         before after Hnodes Hnotin).
    Intros first last node_prev node_next.
    rename H into Hhead. rename H0 into Hfirst. rename H1 into Hnode.
    rename H2 into Hnode_head. rename H3 into Hnext.
    assert (Hdispatch :
      xizi_double_link_next_dispatch_value linklist_pre nodes_dispatch_case
        linklist_node_pre = xizi_double_link_first_value after).
    { apply
        (xizi_double_link_next_value_at_first_occurrence__dll_dispatch_and_reclose
           linklist_pre linklist_node_pre nodes_dispatch_case before after
           Hnode_head Hnodes Hnotin). }
    Right. Exists node_prev last node_next before after first. entailer!.
  - subst linklist_node_pre.
    sep_apply_l_atomic (Hopen_fields linklist_pre nodes_dispatch_case).
    Intros first last. rename H into Hhead. rename H0 into Hfirst.
    Left. Exists last first.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [entailer! | contradiction].
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  assert (Hfirst_at_stop : forall node prev stop last nodes,
    node = stop ->
    xizi_dllseg node prev stop last nodes |--
    “ xizi_double_link_first_value nodes = 0 ” &&
    xizi_dllseg node prev stop last nodes).
  { intros node prev stop last nodes Heq.
    destruct nodes as [| expected rest].
    - simpl. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next. Intros. entailer!. }
  right. pre_process.
  subst first. subst linklist_node_pre.
  sep_apply_l_atomic
    (Hfirst_at_stop linklist_pre linklist_pre linklist_pre last
       nodes_dispatch_case eq_refl).
  Intros_p Hfirst_value.
  Exists linklist_pre. entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  assert (Hfirst_at_stop : forall node prev stop last nodes,
    node = stop ->
    xizi_dllseg node prev stop last nodes |--
    “ xizi_double_link_first_value nodes = 0 ” &&
    xizi_dllseg node prev stop last nodes).
  { intros node prev stop last nodes Heq.
    destruct nodes as [| expected rest].
    - simpl. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next. Intros. entailer!. }
  assert (Hlinks_distinct : forall node1 next1 prev1 node2 next2 prev2,
    xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2 |--
    “ node1 <> node2 ” &&
    xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2).
  { intros node1 next1 prev1 node2 next2 prev2.
    assert (Hnext_neq : forall p pnext q qnext,
      (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext) |--
      “ p <> q ”).
    { intros p pnext q qnext.
      destruct (Z.eq_dec p q) as [Heq | Hneq].
      - subst q.
        sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) qnext pnext).
        entailer!.
      - entailer!. }
    assert (Hpure :
      xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2 |--
      “ node1 <> node2 ”).
    { unfold xizi_dll_links, XiziDLL.links.
      prop_apply_p (Hnext_neq node1 next1 node2 next2).
      Intros_p Hneq. entailer!. }
    prop_apply_p Hpure. Intros_p Hneq. entailer!. }
  assert (Hreclose :
    forall head sentinel_first last first prev selected selected_prev next before after,
      head <> 0 -> selected <> 0 -> selected <> head ->
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev selected selected_prev before **
      xizi_dll_links selected next selected_prev **
      xizi_dllseg next selected head last after |--
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev head last (before ++ selected :: after)).
  { intros head sentinel_first last first prev selected selected_prev next before.
    revert first prev.
    induction before as [| current before IH];
      intros first prev after Hhead Hselected Hselected_head.
    - simpl. Intros. destruct H as [Hfirst Hprev].
      subst first. subst prev. Exists next. entailer!.
    - simpl. Intros next0. Intros.
      sep_apply_l_atomic
        (Hlinks_distinct head sentinel_first last first next0 prev).
      Intros_p Hfirst_head.
      sep_apply_l_atomic (IH next0 first after Hhead Hselected Hselected_head).
      Exists next0. entailer!. }
  assert (Hreclose_fields :
    forall head sentinel_first last first prev selected selected_prev next before after,
      head <> 0 -> selected <> 0 -> selected <> head ->
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> sentinel_first) **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
      xizi_dllseg first prev selected selected_prev before **
      (&(selected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) **
      (&(selected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> selected_prev) **
      xizi_dllseg next selected head last after |--
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev head last (before ++ selected :: after)).
  { intros head sentinel_first last first prev selected selected_prev next before after
      Hhead Hselected Hselected_head.
    etransitivity.
    2: apply (Hreclose head sentinel_first last first prev selected selected_prev
                next before after Hhead Hselected Hselected_head).
    unfold xizi_dll_links, XiziDLL.links.
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> sentinel_first).
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
    cancel (xizi_dllseg first prev selected selected_prev before).
    cancel (&(selected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    cancel (&(selected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> selected_prev).
    cancel (xizi_dllseg next selected head last after). }
  left. pre_process.
  subst node_next. subst nodes_dispatch_case.
  sep_apply_l_atomic
    (Hfirst_at_stop linklist_pre linklist_node_pre linklist_pre last
       nodes_after eq_refl).
  Intros_p Hafter_value.
  sep_apply_l_atomic
    (Hreclose_fields linklist_pre first last first linklist_pre
       linklist_node_pre node_prev linklist_pre nodes_before nodes_after
       PreH2 PreH7 PreH8).
  split_pure_spatial.
  - sep_apply_l_atomic
      (xizi_dll_close linklist_pre first last
         (nodes_before ++ linklist_node_pre :: nodes_after) PreH2).
    cancel.
  - dump_pre_spatial. congruence.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  assert (Hfirst_at_nonstop : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ xizi_double_link_first_value nodes = node ” &&
    xizi_dllseg node prev stop last nodes).
  { intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next. Intros. Exists next. entailer!. }
  assert (Hlinks_distinct : forall node1 next1 prev1 node2 next2 prev2,
    xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2 |--
    “ node1 <> node2 ” &&
    xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2).
  { intros node1 next1 prev1 node2 next2 prev2.
    assert (Hnext_neq : forall p pnext q qnext,
      (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext) |--
      “ p <> q ”).
    { intros p pnext q qnext.
      destruct (Z.eq_dec p q) as [Heq | Hneq].
      - subst q.
        sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) qnext pnext).
        entailer!.
      - entailer!. }
    assert (Hpure :
      xizi_dll_links node1 next1 prev1 ** xizi_dll_links node2 next2 prev2 |--
      “ node1 <> node2 ”).
    { unfold xizi_dll_links, XiziDLL.links.
      prop_apply_p (Hnext_neq node1 next1 node2 next2).
      Intros_p Hneq. entailer!. }
    prop_apply_p Hpure. Intros_p Hneq. entailer!. }
  assert (Hreclose :
    forall head sentinel_first last first prev selected selected_prev next before after,
      head <> 0 -> selected <> 0 -> selected <> head ->
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev selected selected_prev before **
      xizi_dll_links selected next selected_prev **
      xizi_dllseg next selected head last after |--
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev head last (before ++ selected :: after)).
  { intros head sentinel_first last first prev selected selected_prev next before.
    revert first prev.
    induction before as [| current before IH];
      intros first prev after Hhead Hselected Hselected_head.
    - simpl. Intros. destruct H as [Hfirst Hprev].
      subst first. subst prev. Exists next. entailer!.
    - simpl. Intros next0. Intros.
      sep_apply_l_atomic
        (Hlinks_distinct head sentinel_first last first next0 prev).
      Intros_p Hfirst_head.
      sep_apply_l_atomic (IH next0 first after Hhead Hselected Hselected_head).
      Exists next0. entailer!. }
  assert (Hreclose_fields :
    forall head sentinel_first last first prev selected selected_prev next before after,
      head <> 0 -> selected <> 0 -> selected <> head ->
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> sentinel_first) **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
      xizi_dllseg first prev selected selected_prev before **
      (&(selected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) **
      (&(selected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> selected_prev) **
      xizi_dllseg next selected head last after |--
      xizi_dll_links head sentinel_first last **
      xizi_dllseg first prev head last (before ++ selected :: after)).
  { intros head sentinel_first last first prev selected selected_prev next before after
      Hhead Hselected Hselected_head.
    etransitivity.
    2: apply (Hreclose head sentinel_first last first prev selected selected_prev
                next before after Hhead Hselected Hselected_head).
    unfold xizi_dll_links, XiziDLL.links.
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> sentinel_first).
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
    cancel (xizi_dllseg first prev selected selected_prev before).
    cancel (&(selected # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    cancel (&(selected # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> selected_prev).
    cancel (xizi_dllseg next selected head last after). }
  left. pre_process.
  subst nodes_dispatch_case.
  sep_apply_l_atomic
    (Hfirst_at_nonstop node_next linklist_node_pre linklist_pre last
       nodes_after PreH1).
  Intros_p Hafter_value.
  sep_apply_l_atomic
    (Hreclose_fields linklist_pre first last first linklist_pre
       linklist_node_pre node_prev node_next nodes_before nodes_after
       PreH2 PreH7 PreH8).
  split_pure_spatial.
  - sep_apply_l_atomic
      (xizi_dll_close linklist_pre first last
         (nodes_before ++ linklist_node_pre :: nodes_after) PreH2).
    cancel.
  - dump_pre_spatial. congruence.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  assert (Hfirst_at_nonstop : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ xizi_double_link_first_value nodes = node ” &&
    xizi_dllseg node prev stop last nodes).
  { intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg. simpl.
      Intros next. Intros. Exists next. entailer!. }
  assert (Hclose_fields : forall head first last nodes,
    head <> 0 ->
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first head head last nodes |-- xizi_dll head nodes).
  { intros head first last nodes Hhead.
    etransitivity.
    2: apply (xizi_dll_close head first last nodes Hhead).
    unfold xizi_dll_links, XiziDLL.links.
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
    cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
    cancel (xizi_dllseg first head head last nodes). }
  left. pre_process.
  subst linklist_node_pre.
  sep_apply_l_atomic
    (Hfirst_at_nonstop first linklist_pre linklist_pre last
       nodes_dispatch_case PreH1).
  Intros_p Hfirst_value.
  split_pure_spatial.
  - sep_apply_l_atomic
      (Hclose_fields linklist_pre first last nodes_dispatch_case PreH2).
    cancel.
  - dump_pre_spatial. congruence.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  split_pure_spatial.
  - cancel (xizi_dll linklist_pre nodes_sentinel_case).
    apply derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists retval_2.
    split_pure_spatial.
    + cancel (xizi_dll linklist_pre nodes_sentinel_case).
    + dump_pre_spatial.
      unfold xizi_double_link_next_dispatch_value in H0.
      destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
  - unfold xizi_double_link_next_anchor. entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  assert (Hsegment_member_keep : forall node prev stop last nodes selected,
    In selected nodes ->
    xizi_dllseg node prev stop last nodes |--
    “ selected <> stop ” && xizi_dllseg node prev stop last nodes).
  { intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev selected Hin.
    - contradiction.
    - simpl in Hin. destruct Hin as [Heq | Hin].
      + subst selected.
        unfold xizi_dllseg, XiziDLL.dllseg. simpl.
        Intros next. Intros. Exists next. entailer!.
      + unfold xizi_dllseg, XiziDLL.dllseg. simpl.
        Intros next. Intros.
        sep_apply_l_atomic (IH next node selected Hin).
        Intros_p Hselected_stop. Exists next. entailer!. }
  assert (Hdll_member_keep : forall head nodes selected,
    In selected nodes ->
    xizi_dll head nodes |-- “ selected <> head ” && xizi_dll head nodes).
  { intros head nodes selected Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last. Intros. rename H into Hhead.
    sep_apply_l_atomic
      (Hsegment_member_keep first head head last nodes selected Hin).
    Intros_p Hselected_head. Exists first last. entailer!. }
  pre_process.
  sep_apply_l_atomic
    (Hdll_member_keep linklist_pre nodes_member_case linklist_node_pre H).
  Intros_p Hnode_head.
  Exists nodes_member_case.
  split_pure_spatial.
  - cancel (xizi_dll linklist_pre nodes_member_case).
    apply derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists retval_2.
    split_pure_spatial.
    + cancel (xizi_dll linklist_pre nodes_member_case).
    + dump_pre_spatial.
      unfold xizi_double_link_next_dispatch_value in H0.
      destruct (Z.eq_dec linklist_node_pre linklist_pre); congruence.
  - unfold xizi_double_link_next_anchor. entailer!.
Qed.
