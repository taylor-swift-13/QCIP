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

Lemma proof_of_xizi_double_link_next_entail_wit_1 : xizi_double_link_next_entail_wit_1.
Proof.
  assert (Hsplit : forall first prev stop last before node after,
      stop <> NULL ->
      ~ In node before ->
      xizi_dllseg first prev stop last (app before (cons node after)) |--
      EX node_prev node_next,
        “ first <> NULL ” &&
        “ node <> NULL ” &&
        “ node <> stop ” &&
        “ node_next <> NULL ” &&
        xizi_dllseg first prev node node_prev before **
        xizi_dll_links node node_next node_prev **
        xizi_dllseg node_next node stop last after).
  {
    intros first prev stop last before.
    revert first prev.
    induction before as [| current rest IH];
      intros first prev node after Hstopnonnull Hnotin.
    - simpl. Intros node_next. Intros. subst first.
      destruct after as [| after_first after_rest].
      + simpl. Intros. Exists prev node_next. simpl. entailer!.
      + simpl. Intros after_next. Intros.
        Exists prev node_next. simpl. Exists after_next. entailer!.
    - simpl. Intros next. Intros. subst first.
      assert (Hcurrent : current <> node) by
        (intro Heq; apply Hnotin; left; exact Heq).
      assert (Hrest : ~ In node rest) by
        (intro Hin; apply Hnotin; right; exact Hin).
      sep_apply (IH next current node after Hstopnonnull Hrest).
      Intros node_prev node_next.
      Exists node_prev node_next. simpl. Exists next. entailer!.
  }
  pre_process.
  destruct PreH1 as [Hin | Heq].
  - destruct (xizi_double_link_in_first_occurrence__dll_dispatch_forbidden_free
      nodes_dispatch_case linklist_node_pre Hin)
      as [nodes_before [nodes_after [Hnodes Hnotin]]].
    subst nodes_dispatch_case.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply (Hsplit first linklist_pre linklist_pre last nodes_before
      linklist_node_pre nodes_after H Hnotin).
    Intros node_prev node_next.
    Right.
    Exists node_prev last node_next nodes_before nodes_after first.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    apply xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free
      with (before := nodes_before).
    + exact H2.
    + reflexivity.
    + exact Hnotin.
  - subst linklist_node_pre.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    destruct nodes_dispatch_case as [| first_node rest].
    + simpl. Intros. destruct H0 as [Hfirst Hlast].
      subst first; subst last.
      Left. Exists linklist_pre linklist_pre.
      unfold XiziDLL.links. entailer!.
      unfold xizi_double_link_next_dispatch_value.
      destruct (Z.eq_dec linklist_pre linklist_pre); [reflexivity | contradiction].
    + simpl. Intros next. Intros. subst first.
      Left. Exists last first_node.
      unfold XiziDLL.links. entailer!.
      unfold xizi_double_link_next_dispatch_value.
      destruct (Z.eq_dec linklist_pre linklist_pre).
      * Exists next. entailer!.
      * contradiction.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Proof.
  left.
  pre_process.
  subst first. subst linklist_node_pre.
  destruct nodes_dispatch_case as [| node rest].
  - simpl. Intros. destruct H as [_ Hlast]. subst last.
    unfold xizi_double_link_next_dispatch_value,
      xizi_double_link_first_value.
    unfold xizi_dll, XiziDLL.dll.
    Exists linklist_pre linklist_pre. simpl. entailer!.
  - simpl. Intros next. Intros. contradiction.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.
Proof.
  assert (Hdll_next_fields_neq : forall p q p_next q_next,
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
      (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
      “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr. Intros. Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros. dump_pre_spatial.
    intro Heq. subst q. psatz Z.
  }
  assert (Hjoin : forall stop_first stop_last first prev stop last before node after node_prev node_next,
      node <> NULL -> node <> stop ->
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first) **
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last) **
      xizi_dllseg first prev node node_prev before **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) **
      xizi_dllseg node_next node stop last after |--
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first) **
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last) **
      xizi_dllseg first prev stop last (before ++ node :: after)).
  {
    intros stop_first stop_last first prev stop last before.
    revert first prev.
    induction before as [| current rest IH];
      intros first prev node after node_prev node_next Hnonnull Hstop.
    - simpl. Intros. destruct H as [Hfirst Hprev].
      subst first; subst node_prev. Exists node_next.
      unfold XiziDLL.links. entailer!.
    - simpl. Intros next. Intros. subst first.
      sep_apply_left (IH next current node after node_prev node_next Hnonnull Hstop).
      unfold XiziDLL.links.
      L_sepcon_lift'
        (&(current # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
      prop_apply_p (Hdll_next_fields_neq current stop next stop_first).
      Intros. Exists next. entailer!.
  }
  assert (Hstopnil : forall node prev stop last nodes,
      node = stop ->
      xizi_dllseg node prev stop last nodes |--
      “ nodes = nil ” && xizi_dllseg node prev stop last nodes).
  {
    intros node prev stop last nodes Heq. subst node.
    destruct nodes as [| expected rest].
    - simpl. entailer!.
    - simpl. Intros next. Intros. contradiction.
  }
  left.
  pre_process.
  subst node_next. subst nodes_dispatch_case.
  sep_apply_left (Hstopnil linklist_pre linklist_node_pre linklist_pre last
    nodes_after eq_refl).
  Intros. subst nodes_after.
  sep_apply_left (Hjoin first last first linklist_pre linklist_pre last
    nodes_before linklist_node_pre nil node_prev linklist_pre PreH7 PreH8).
  unfold xizi_double_link_next_dispatch_value in *.
  unfold xizi_double_link_first_value in *.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last. unfold XiziDLL.links. entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_3 : xizi_double_link_next_return_wit_3.
Proof.
  assert (Hdll_next_fields_neq : forall p q p_next q_next,
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
      (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
      “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr. Intros. Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros. dump_pre_spatial.
    intro Heq. subst q. psatz Z.
  }
  assert (Hjoin : forall stop_first stop_last first prev stop last before node after node_prev node_next,
      node <> NULL -> node <> stop ->
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first) **
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last) **
      xizi_dllseg first prev node node_prev before **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) **
      xizi_dllseg node_next node stop last after |--
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first) **
      (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last) **
      xizi_dllseg first prev stop last (before ++ node :: after)).
  {
    intros stop_first stop_last first prev stop last before.
    revert first prev.
    induction before as [| current rest IH];
      intros first prev node after node_prev node_next Hnonnull Hstop.
    - simpl. Intros. destruct H as [Hfirst Hprev].
      subst first; subst node_prev. Exists node_next.
      unfold XiziDLL.links. entailer!.
    - simpl. Intros next. Intros. subst first.
      sep_apply_left (IH next current node after node_prev node_next Hnonnull Hstop).
      unfold XiziDLL.links.
      L_sepcon_lift'
        (&(current # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
      prop_apply_p (Hdll_next_fields_neq current stop next stop_first).
      Intros. Exists next. entailer!.
  }
  assert (Hstartcons : forall node prev stop last nodes,
      node <> stop ->
      xizi_dllseg node prev stop last nodes |--
      EX rest, “ nodes = node :: rest ” &&
        xizi_dllseg node prev stop last nodes).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - simpl. Intros. destruct H as [Heq _]. contradiction.
    - simpl. Intros next. Intros. subst expected.
      Exists rest. simpl. Exists next. entailer!.
  }
  left.
  pre_process.
  subst nodes_dispatch_case.
  sep_apply_left (Hstartcons node_next linklist_node_pre linklist_pre last
    nodes_after PreH1).
  Intros rest. subst nodes_after.
  sep_apply_left (Hjoin first last first linklist_pre linklist_pre last
    nodes_before linklist_node_pre (node_next :: rest) node_prev node_next
    PreH7 PreH8).
  unfold xizi_double_link_next_dispatch_value,
    xizi_double_link_first_value in *.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last. unfold XiziDLL.links. entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_4 : xizi_double_link_next_return_wit_4.
Proof.
  assert (Hstartcons : forall node prev stop last nodes,
      node <> stop ->
      xizi_dllseg node prev stop last nodes |--
      EX rest, “ nodes = node :: rest ” &&
        xizi_dllseg node prev stop last nodes).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - simpl. Intros. destruct H as [Heq _]. contradiction.
    - simpl. Intros next. Intros. subst expected.
      Exists rest. simpl. Exists next. entailer!.
  }
  left.
  pre_process.
  subst linklist_node_pre.
  sep_apply_left (Hstartcons first linklist_pre linklist_pre last
    nodes_dispatch_case PreH1).
  Intros rest. subst nodes_dispatch_case.
  unfold xizi_double_link_next_dispatch_value,
    xizi_double_link_first_value in *.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last. unfold XiziDLL.links. entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_derive_sentinel_case_by_dispatch_case : xizi_double_link_next_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  subst linklist_node_pre.
  Exists nodes_sentinel_case.
  split_pure_spatial.
  - cancel (xizi_dll linklist_pre nodes_sentinel_case).
    rewrite <- derivable1_wand_sepcon_adjoint.
    Intros retval_2. Intros.
    Exists retval_2.
    unfold xizi_double_link_next_dispatch_value in H.
    destruct (Z.eq_dec linklist_pre linklist_pre) in H;
      [entailer! | contradiction].
  - unfold xizi_double_link_next_anchor. entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_derive_member_case_by_dispatch_case : xizi_double_link_next_derive_member_case_by_dispatch_case.
Proof.
  assert (Hdll_next_fields_neq : forall p q p_next q_next,
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
      (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
      “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr. Intros. Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros. dump_pre_spatial.
    intro Heq. subst q. psatz Z.
  }
  assert (Hseg_member_neq : forall head head_first head_last first prev last nodes node,
      In node nodes ->
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head_first) **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head_last) **
      xizi_dllseg first prev head last nodes |--
      “ node <> head ” &&
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head_first) **
      (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head_last) **
      xizi_dllseg first prev head last nodes).
  {
    intros head head_first head_last first prev last nodes.
    revert first prev.
    induction nodes as [| current rest IH]; intros first prev node Hin.
    - contradiction.
    - simpl. Intros next. Intros. subst first.
      destruct Hin as [Heq | Hin].
      + subst node. unfold XiziDLL.links.
        Exists next. entailer!.
      + sep_apply_left (IH next current node Hin).
        Intros. Exists next. entailer!.
  }
  assert (Hmember_neq : forall head nodes node,
      In node nodes ->
      xizi_dll head nodes |-- “ node <> head ” && xizi_dll head nodes).
  {
    intros head nodes node Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    unfold XiziDLL.links.
    sep_apply_left (Hseg_member_neq head first last first head last nodes node Hin).
    Intros. Exists first last. unfold XiziDLL.links. entailer!.
  }
  pre_process.
  sep_apply_left (Hmember_neq linklist_pre nodes_member_case
    linklist_node_pre H).
  Intros.
  Exists nodes_member_case.
  split_pure_spatial.
  - cancel (xizi_dll linklist_pre nodes_member_case).
    rewrite <- derivable1_wand_sepcon_adjoint.
    Intros retval_2. Intros.
    Exists retval_2.
    unfold xizi_double_link_next_dispatch_value in H1.
    destruct (Z.eq_dec linklist_node_pre linklist_pre) in H1;
      [contradiction | entailer!].
  - unfold xizi_double_link_next_anchor. entailer!.
Qed.
