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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeAfter_entail_wit_1 : DoubleLinkListInsertNodeAfter_entail_wit_1.
Proof.
  assert (Hseg_member_not_stop :
    forall node prev stop last nodes member,
      In member nodes ->
      xizi_dllseg node prev stop last nodes |-- “ member <> stop ”).
  {
    intros node prev stop last nodes.
    revert node prev last.
    induction nodes as [|expected rest IH]; intros node prev last member Hin.
    - contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      destruct Hin as [Heq | Hin].
      + subst member; subst expected; entailer!.
      + sep_apply (IH next node last member Hin).
        entailer!.
  }
  assert (Hmember_not_head :
    forall head nodes member,
      In member nodes ->
      xizi_dll head nodes |-- “ member <> head ”).
  {
    intros head nodes member Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply (Hseg_member_not_stop first head head last nodes member Hin).
    entailer!.
  }
  assert (Hnode_nonnull :
    forall node, xizi_dll_node node |-- “ node <> 0 ”).
  {
    intros node.
    unfold xizi_dll_node, NULL.
    entailer!.
  }
  assert (Hsplit :
    forall first prev stop last prefix anchor suffix,
      ~ In anchor prefix ->
      xizi_dllseg first prev stop last (prefix ++ anchor :: suffix) |--
      EX anchor_prev anchor_next,
        “ anchor <> 0 ” &&
        xizi_dllseg first prev anchor anchor_prev prefix **
        xizi_dll_links anchor anchor_next anchor_prev **
        xizi_dllseg anchor_next anchor stop last suffix).
  {
    intros first prev stop last prefix.
    revert first prev.
    induction prefix as [|current prefix IH];
      intros first prev anchor suffix Hnotin.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros anchor_next.
      Intros.
      subst first.
      Exists prev anchor_next.
      entailer!.
    - simpl in *.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      sep_apply (IH next current anchor suffix
                   ltac:(intros Hin; apply Hnotin; auto)).
      Intros anchor_prev anchor_next.
      Exists anchor_prev anchor_next.
      Exists next.
      entailer!.
  }
  pre_process.
  prop_apply_p (Hnode_nonnull linklist_node_pre).
  Intros_p Hnode_nonnull_fact.
  unfold xizi_double_link_insert_after_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - prop_apply_p
      (Hmember_not_head head_dispatch_case nodes_dispatch_case
         linklist_pre Hin).
    Intros_p Hmember_head.
    destruct (xizi_in_first_split_after__implementation_shape
                nodes_dispatch_case linklist_pre Hin)
      as (nodes_before & nodes_after & Hnodes & Hnotin).
    rewrite Hnodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply
      (Hsplit first head_dispatch_case head_dispatch_case last
         nodes_before linklist_pre nodes_after Hnotin).
    Intros old_prev anchor_next.
    destruct nodes_after as [|old_next rest].
    + Left. Left. Right.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros_p Hempty.
      destruct Hempty as [Hnext Hlast].
      subst anchor_next; subst last.
      assert (Hdispatch :
        xizi_double_link_insert_after_dispatch_nodes head_dispatch_case
          ((nodes_before ++ linklist_pre :: nil)%list)
          linklist_pre linklist_node_pre =
        (nodes_before ++ linklist_pre :: linklist_node_pre :: nil)%list).
      {
        unfold xizi_double_link_insert_after_dispatch_nodes.
        destruct (Z.eq_dec linklist_pre head_dispatch_case);
          [contradiction|].
        apply xizi_insert_after_first_occurrence__implementation_shape.
        exact Hnotin.
      }
      Exists old_prev first nodes_before (@nil Z).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + Left. Left. Left.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next_next.
      Intros.
      subst anchor_next.
      assert (Hdispatch :
        xizi_double_link_insert_after_dispatch_nodes head_dispatch_case
          ((nodes_before ++ linklist_pre :: old_next :: rest)%list)
          linklist_pre linklist_node_pre =
        (nodes_before ++ linklist_pre :: linklist_node_pre ::
           old_next :: rest)%list).
      {
        unfold xizi_double_link_insert_after_dispatch_nodes.
        destruct (Z.eq_dec linklist_pre head_dispatch_case);
          [contradiction|].
        apply xizi_insert_after_first_occurrence__implementation_shape.
        exact Hnotin.
      }
      Exists next_next old_prev last first old_next rest nodes_before
        (old_next :: rest).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  - subst linklist_pre.
    destruct nodes_dispatch_case as [|old_next rest].
    + Right.
      unfold xizi_dll, XiziDLL.dll.
      Intros first last.
      simpl.
      Intros_p Hempty.
      destruct Hempty as [Hfirst Hlast].
      subst first; subst last.
      Exists head_dispatch_case head_dispatch_case head_dispatch_case.
      unfold xizi_double_link_insert_after_dispatch_nodes.
      destruct (Z.eq_dec head_dispatch_case head_dispatch_case);
        [|congruence].
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + Left. Right.
      unfold xizi_dll, XiziDLL.dll.
      Intros first last.
      simpl.
      Intros next_next.
      Intros.
      subst first.
      Exists next_next last old_next rest.
      unfold xizi_double_link_insert_after_dispatch_nodes.
      destruct (Z.eq_dec head_dispatch_case head_dispatch_case);
        [|congruence].
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_1 : DoubleLinkListInsertNodeAfter_return_wit_1.
Proof.
  assert (Hlinksneq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros a an ap b bn bp.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity (
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn)) **
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> ap) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> bp))).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
             (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an bn).
        entailer!.
    - entailer!.
  }
  left.
  pre_process.
  subst linklist_pre.
  rewrite PreH5, PreH6.
  transitivity
    (xizi_dll_links linklist_node_pre head_dispatch_case head_dispatch_case **
     xizi_dll_links head_dispatch_case linklist_node_pre linklist_node_pre).
  - unfold xizi_dll_links, XiziDLL.links; entailer!.
  - prop_apply_p
      (Hlinksneq linklist_node_pre head_dispatch_case head_dispatch_case
         head_dispatch_case linklist_node_pre linklist_node_pre).
    Intros_p Hneq.
    unfold xizi_dll, XiziDLL.dll.
    Exists linklist_node_pre linklist_node_pre.
    simpl.
    Exists head_dispatch_case.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_2 : DoubleLinkListInsertNodeAfter_return_wit_2.
Proof.
  assert (Hlinksneq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros a an ap b bn bp.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity (
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn)) **
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> ap) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> bp))).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
             (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an bn).
        entailer!.
    - entailer!.
  }
  left.
  pre_process.
  subst linklist_pre.
  rewrite PreH5, PreH6.
  transitivity
    (xizi_dll_links linklist_node_pre old_next head_dispatch_case **
     xizi_dll_links head_dispatch_case linklist_node_pre last **
     xizi_dll_links old_next next_next linklist_node_pre **
     xizi_dllseg next_next old_next head_dispatch_case last rest).
  - unfold xizi_dll_links, XiziDLL.links; entailer!.
  - prop_apply_p
      (Hlinksneq linklist_node_pre old_next head_dispatch_case
         head_dispatch_case linklist_node_pre last).
    Intros_p Hinserted_head.
    prop_apply_p
      (Hlinksneq old_next next_next linklist_node_pre
         head_dispatch_case linklist_node_pre last).
    Intros_p Hold_next_head.
    unfold xizi_dll, XiziDLL.dll.
    Exists linklist_node_pre last.
    simpl.
    Exists old_next.
    Exists next_next.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_3 : DoubleLinkListInsertNodeAfter_return_wit_3.
Proof.
  assert (Hlinksneq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros a an ap b bn bp.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity (
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn)) **
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> ap) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> bp))).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
             (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an bn).
        entailer!.
    - entailer!.
  }
  assert (Hjoin :
    forall stop stop_first stop_last first prev mid before_mid last prefix suffix,
      xizi_dll_links stop stop_first stop_last **
      xizi_dllseg first prev mid before_mid prefix **
      xizi_dllseg mid before_mid stop last suffix |--
      xizi_dll_links stop stop_first stop_last **
      xizi_dllseg first prev stop last (prefix ++ suffix)).
  {
    intros stop stop_first stop_last first prev mid before_mid last prefix.
    revert first prev.
    induction prefix as [|current prefix IH]; intros first prev suffix.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first; subst prev.
      entailer!.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      prop_apply_p (Hlinksneq stop stop_first stop_last current next prev).
      Intros_p Hneq.
      transitivity (
        xizi_dll_links current next prev **
        (xizi_dll_links stop stop_first stop_last **
         xizi_dllseg next current mid before_mid prefix **
         xizi_dllseg mid before_mid stop last suffix)).
      + entailer!.
      + sep_apply (IH next current suffix).
        transitivity (
          xizi_dll_links current next prev **
          (xizi_dll_links stop stop_first stop_last **
           xizi_dllseg next current stop last (prefix ++ suffix))).
        entailer!.
        Exists next.
        entailer!.
  }
  left.
  pre_process.
  rewrite PreH6, PreH8.
  transitivity
    (xizi_dll_links head_dispatch_case first linklist_node_pre **
     xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
     xizi_dll_links linklist_pre linklist_node_pre old_prev **
     xizi_dll_links linklist_node_pre head_dispatch_case linklist_pre).
  - unfold xizi_dll_links, XiziDLL.links; entailer!.
  - prop_apply_p
      (Hlinksneq linklist_pre linklist_node_pre old_prev
         head_dispatch_case first linklist_node_pre).
    Intros_p Hanchor_head.
    prop_apply_p
      (Hlinksneq linklist_node_pre head_dispatch_case linklist_pre
         head_dispatch_case first linklist_node_pre).
    Intros_p Hinserted_head.
    transitivity
      (xizi_dll_links head_dispatch_case first linklist_node_pre **
       xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
       xizi_dllseg linklist_pre old_prev head_dispatch_case
         linklist_node_pre (linklist_pre :: linklist_node_pre :: nil)).
    + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Exists linklist_node_pre.
      Exists head_dispatch_case.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + sep_apply
        (Hjoin head_dispatch_case first linklist_node_pre
           first head_dispatch_case linklist_pre old_prev linklist_node_pre
           nodes_before (linklist_pre :: linklist_node_pre :: nil)).
      apply xizi_dll_close.
      exact PreH2.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_4 : DoubleLinkListInsertNodeAfter_return_wit_4.
Proof.
  assert (Hlinksneq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros a an ap b bn bp.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity (
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn)) **
        (((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> ap) **
         ((&(a # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> bp))).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
             (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an bn).
        entailer!.
    - entailer!.
  }
  assert (Hjoin :
    forall stop stop_first stop_last first prev mid before_mid last prefix suffix,
      xizi_dll_links stop stop_first stop_last **
      xizi_dllseg first prev mid before_mid prefix **
      xizi_dllseg mid before_mid stop last suffix |--
      xizi_dll_links stop stop_first stop_last **
      xizi_dllseg first prev stop last (prefix ++ suffix)).
  {
    intros stop stop_first stop_last first prev mid before_mid last prefix.
    revert first prev.
    induction prefix as [|current prefix IH]; intros first prev suffix.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first; subst prev.
      entailer!.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst first.
      prop_apply_p (Hlinksneq stop stop_first stop_last current next prev).
      Intros_p Hneq.
      transitivity (
        xizi_dll_links current next prev **
        (xizi_dll_links stop stop_first stop_last **
         xizi_dllseg next current mid before_mid prefix **
         xizi_dllseg mid before_mid stop last suffix)).
      + entailer!.
      + sep_apply (IH next current suffix).
        transitivity (
          xizi_dll_links current next prev **
          (xizi_dll_links stop stop_first stop_last **
           xizi_dllseg next current stop last (prefix ++ suffix))).
        entailer!.
        Exists next.
        entailer!.
  }
  left.
  pre_process.
  rewrite PreH6, PreH8.
  transitivity
    (xizi_dll_links head_dispatch_case first last **
     xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
     xizi_dll_links linklist_pre linklist_node_pre old_prev **
     xizi_dll_links linklist_node_pre old_next linklist_pre **
     xizi_dll_links old_next next_next linklist_node_pre **
     xizi_dllseg next_next old_next head_dispatch_case last rest).
  - unfold xizi_dll_links, XiziDLL.links; entailer!.
  - prop_apply_p
      (Hlinksneq linklist_pre linklist_node_pre old_prev
         head_dispatch_case first last).
    Intros_p Hanchor_head.
    prop_apply_p
      (Hlinksneq linklist_node_pre old_next linklist_pre
         head_dispatch_case first last).
    Intros_p Hinserted_head.
    prop_apply_p
      (Hlinksneq old_next next_next linklist_node_pre
         head_dispatch_case first last).
    Intros_p Hold_next_head.
    transitivity
      (xizi_dll_links head_dispatch_case first last **
       xizi_dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
       xizi_dllseg linklist_pre old_prev head_dispatch_case last
         (linklist_pre :: linklist_node_pre :: old_next :: rest)).
    + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Exists linklist_node_pre.
      Exists old_next.
      Exists next_next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + sep_apply
        (Hjoin head_dispatch_case first last
           first head_dispatch_case linklist_pre old_prev last
           nodes_before (linklist_pre :: linklist_node_pre :: old_next :: rest)).
      apply xizi_dll_close.
      exact PreH2.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists linklist_pre nodes_sentinel_case.
  unfold xizi_double_link_insert_after_anchor,
    xizi_double_link_insert_after_dispatch_nodes.
  destruct (Z.eq_dec linklist_pre linklist_pre); [|congruence].
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case.
Proof.
  assert (Hseg_member_not_stop :
    forall node prev stop last nodes member,
      In member nodes ->
      xizi_dllseg node prev stop last nodes |-- “ member <> stop ”).
  {
    intros node prev stop last nodes.
    revert node prev last.
    induction nodes as [|expected rest IH]; intros node prev last member Hin.
    - contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      destruct Hin as [Heq | Hin].
      + subst member; subst expected; entailer!.
      + sep_apply (IH next node last member Hin).
        entailer!.
  }
  assert (Hmember_not_head :
    forall head nodes member,
      In member nodes ->
      xizi_dll head nodes |-- “ member <> head ”).
  {
    intros head nodes member Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply (Hseg_member_not_stop first head head last nodes member Hin).
    entailer!.
  }
  pre_process.
  prop_apply_p
    (Hmember_not_head head_member_case nodes_member_case linklist_pre H).
  Intros_p Hneq.
  Exists head_member_case nodes_member_case.
  unfold xizi_double_link_insert_after_anchor,
    xizi_double_link_insert_after_dispatch_nodes.
  destruct (Z.eq_dec linklist_pre head_member_case); [contradiction|].
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.
