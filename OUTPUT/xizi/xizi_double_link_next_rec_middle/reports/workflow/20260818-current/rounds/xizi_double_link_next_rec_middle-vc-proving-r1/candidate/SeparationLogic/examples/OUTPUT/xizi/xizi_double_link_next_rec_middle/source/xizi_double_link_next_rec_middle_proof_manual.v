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

Lemma proof_of_xizi_double_link_next_rec_middle_entail_wit_1 : xizi_double_link_next_rec_middle_entail_wit_1.
Proof.
  pre_process.
  assert (Hdllseg_first_nonnull :
    forall node prev stop last nodes,
      stop <> 0 ->
      xizi_dllseg node prev stop last nodes |-- “ node <> 0 ”).
  {
    intros node prev stop last nodes Hstop.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hnode _].
      subst node; entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next; Intros; entailer!.
  }
  assert (Hdllseg_split :
    forall before first prev node stop last after,
      stop <> 0 ->
      ~ In node before ->
      xizi_dllseg first prev stop last (before ++ node :: after) |--
      EX node_prev next,
        “ node <> 0 ” &&
        “ node <> stop ” &&
        “ next <> 0 ” &&
        xizi_dllseg first prev node node_prev before **
        xizi_dll_links node next node_prev **
        xizi_dllseg next node stop last after).
  {
    intros before.
    induction before as [| current rest IH].
    - intros first prev node stop last after Hstop Hfresh.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next; Intros.
      subst first.
      prop_apply_p (Hdllseg_first_nonnull next node stop last after Hstop).
      Intros_p Hnext.
      Exists prev next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - intros first prev node stop last after Hstop Hfresh.
      simpl in Hfresh.
      unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
      Intros next; Intros.
      sep_apply (IH next first node stop last after Hstop ltac:(tauto)).
      Intros node_prev node_next.
      Exists node_prev node_next.
      unfold xizi_dllseg, XiziDLL.dllseg at 2; simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - destruct (xizi_double_link_in_first_occurrence__dll_dispatch_decompose_reclose
                nodes_dispatch_case linklist_node_pre Hin)
      as [nodes_before [nodes_after [Hnodes Hfresh]]].
    subst nodes_dispatch_case.
    Right.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply_p
      (Hdllseg_first_nonnull first linklist_pre linklist_pre last
         (nodes_before ++ linklist_node_pre :: nodes_after) H).
    Intros_p Hfirst.
    sep_apply
      (Hdllseg_split nodes_before first linklist_pre linklist_node_pre
         linklist_pre last nodes_after H Hfresh).
    Intros node_prev node_next.
    assert (Hdispatch :
      xizi_double_link_next_dispatch_value linklist_pre
        (nodes_before ++ linklist_node_pre :: nodes_after) linklist_node_pre =
      xizi_double_link_first_value nodes_after).
    {
      eapply xizi_double_link_next_value_at_first_occurrence__dll_dispatch_decompose_reclose;
        eauto.
    }
    Exists node_prev last node_next nodes_before nodes_after first.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - subst linklist_node_pre.
    Left.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply_p (Hdllseg_first_nonnull first linklist_pre linklist_pre last nodes_dispatch_case H).
    Intros_p Hfirst.
    Exists last first.
    unfold XiziDLL.links.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [entailer! | contradiction].
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_1 : xizi_double_link_next_rec_middle_return_wit_1.
Proof.
  pre_process.
  subst linklist_node_pre.
  subst first.
  destruct nodes_dispatch_case as [| current rest].
  - simpl in PreH5.
    unfold xizi_dll, XiziDLL.dll.
    Exists linklist_pre last.
    unfold XiziDLL.links.
    simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
    Intros next; Intros.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_2 : xizi_double_link_next_rec_middle_return_wit_2.
Proof.
  pre_process.
  assert (Hlinks_distinct :
    forall a a_next a_prev b b_next b_prev,
      xizi_dll_links a a_next a_prev **
      xizi_dll_links b b_next b_prev |-- “ a <> b ”).
  {
    intros a a_next a_prev b b_next b_prev.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      sepcon_lift
        (&( a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> b_next).
      sepcon_lift
        (&( a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> a_next).
      sepcon_assoc_change.
      sep_apply
        (dup_store_ptr (&( a # "SysDoubleLinklistNode" ->ₛ "node_next"))
           a_next b_next).
      entailer!.
    - entailer!.
  }
  assert (Hdllseg_stop_cons_false :
    forall stop prev last current rest,
      xizi_dllseg stop prev stop last (current :: rest) |-- “ False ”).
  {
    intros st prv lst0 cur rst.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl.
    Intros next; Intros; contradiction.
  }
  assert (Hdllseg_rejoin_with_head :
    forall before head sentinel_first first prev last node node_prev next after,
      node <> 0 ->
      node <> head ->
      xizi_dllseg first prev node node_prev before **
      (xizi_dll_links head sentinel_first last **
       (xizi_dll_links node next node_prev **
        xizi_dllseg next node head last after)) |--
      xizi_dllseg first prev head last (before ++ node :: after) **
      xizi_dll_links head sentinel_first last).
  {
    intros before.
    induction before as [| current rest IH].
    - intros h sentinel_f f prev lst n nprev nxt aft Hnode0 Hnodehead.
      unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst f; subst prev.
      unfold xizi_dllseg, XiziDLL.dllseg at 2; simpl.
      Exists nxt.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - intros h sentinel_f f prev lst n nprev nxt aft Hnode0 Hnodehead.
      unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
      Intros middle; Intros.
      fold XiziDLL.links.
      fold xizi_dll_links.
      prop_apply_p (Hlinks_distinct f middle prev h sentinel_f lst).
      Intros_p Hfhead.
      repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      sepcon_lift (XiziDLL.dllseg middle f n nprev rest).
      sepcon_lift (xizi_dll_links f middle prev).
      repeat rewrite <- logic_equiv_sepcon_assoc.
      rewrite (logic_equiv_sepcon_swap
        (xizi_dll_links h sentinel_f lst)
        (XiziDLL.dllseg middle f n nprev rest)
        (xizi_dll_links n nxt nprev ** xizi_dllseg nxt n h lst aft)).
      rewrite
        (IH h sentinel_f middle f lst n nprev nxt aft Hnode0 Hnodehead).
      unfold xizi_dllseg, XiziDLL.dllseg at 2; simpl.
      Exists middle.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  subst node_next.
  destruct nodes_after as [| suffix_first suffix_rest].
  - subst nodes_dispatch_case.
    simpl in PreH6.
    sepcon_assoc_change.
    sepcon_lift
      (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
    repeat rewrite <- logic_equiv_sepcon_assoc.
    rewrite (logic_equiv_sepcon_assoc
      (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
      (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)
      ((&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre) **
       ((&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) **
        xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil))).
    rewrite (logic_equiv_sepcon_assoc
      (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre)
      (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev)
      (xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil)).
    fold XiziDLL.links.
    fold xizi_dll_links.
    rewrite (Hdllseg_rejoin_with_head nodes_before linklist_pre first first
      linklist_pre last linklist_node_pre node_prev linklist_pre nil
      PreH7 PreH8).
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - sep_apply_l_atomic
      (Hdllseg_stop_cons_false linklist_pre linklist_node_pre last
         suffix_first suffix_rest).
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_3 : xizi_double_link_next_rec_middle_return_wit_3.
Proof.
  pre_process.
  assert (Hlinks_distinct :
    forall a a_next a_prev b b_next b_prev,
      xizi_dll_links a a_next a_prev **
      xizi_dll_links b b_next b_prev |-- “ a <> b ”).
  {
    intros a a_next a_prev b b_next b_prev.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      sepcon_lift
        (&( a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> b_next).
      sepcon_lift
        (&( a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> a_next).
      sepcon_assoc_change.
      sep_apply
        (dup_store_ptr (&( a # "SysDoubleLinklistNode" ->ₛ "node_next"))
           a_next b_next).
      entailer!.
    - entailer!.
  }
  assert (Hdllseg_first_value :
    forall n prv st lst0 ns,
      n <> st ->
      xizi_dllseg n prv st lst0 ns |--
      “ xizi_double_link_first_value ns = n ”).
  {
    intros n prv st lst0 ns Hnst.
    destruct ns as [| current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros; destruct H as [Heq _]; contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros middle; Intros; subst current; entailer!.
  }
  assert (Hdllseg_rejoin_with_head :
    forall before head sentinel_first start prev last node node_prev next after,
      node <> 0 ->
      node <> head ->
      xizi_dllseg start prev node node_prev before **
      (xizi_dll_links head sentinel_first last **
       (xizi_dll_links node next node_prev **
        xizi_dllseg next node head last after)) |--
      xizi_dllseg start prev head last (before ++ node :: after) **
      xizi_dll_links head sentinel_first last).
  {
    intros before.
    induction before as [| current rest IH].
    - intros h sentinel_f f prev lst n nprev nxt aft Hnode0 Hnodehead.
      unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst f; subst prev.
      unfold xizi_dllseg, XiziDLL.dllseg at 2; simpl.
      Exists nxt.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - intros h sentinel_f f prev lst n nprev nxt aft Hnode0 Hnodehead.
      unfold xizi_dllseg, XiziDLL.dllseg at 1; simpl.
      Intros middle; Intros.
      fold XiziDLL.links.
      fold xizi_dll_links.
      prop_apply_p (Hlinks_distinct f middle prev h sentinel_f lst).
      Intros_p Hfhead.
      repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      sepcon_lift (XiziDLL.dllseg middle f n nprev rest).
      sepcon_lift (xizi_dll_links f middle prev).
      repeat rewrite <- logic_equiv_sepcon_assoc.
      rewrite (logic_equiv_sepcon_swap
        (xizi_dll_links h sentinel_f lst)
        (XiziDLL.dllseg middle f n nprev rest)
        (xizi_dll_links n nxt nprev ** xizi_dllseg nxt n h lst aft)).
      rewrite
        (IH h sentinel_f middle f lst n nprev nxt aft Hnode0 Hnodehead).
      unfold xizi_dllseg, XiziDLL.dllseg at 2; simpl.
      Exists middle.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  prop_apply_p
    (Hdllseg_first_value node_next linklist_node_pre linklist_pre last
       nodes_after PreH1).
  Intros_p Hfirst_value.
  sepcon_assoc_change.
  sepcon_lift
    (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after).
  sepcon_lift
    (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev).
  sepcon_lift
    (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
  sepcon_lift
    (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  sepcon_lift
    (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
  sepcon_lift
    (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
  repeat rewrite <- logic_equiv_sepcon_assoc.
  rewrite (logic_equiv_sepcon_assoc
    (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
    (&( linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)
    ((&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
     ((&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) **
      xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after))).
  rewrite (logic_equiv_sepcon_assoc
    (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next)
    (&( linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev)
    (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after)).
  fold XiziDLL.links.
  fold xizi_dll_links.
  rewrite (Hdllseg_rejoin_with_head nodes_before linklist_pre first first
    linklist_pre last linklist_node_pre node_prev node_next nodes_after
    PreH7 PreH8).
  subst nodes_dispatch_case.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_4 : xizi_double_link_next_rec_middle_return_wit_4.
Proof.
  pre_process.
  assert (Hdllseg_first_value :
    forall n prv st lst0 ns,
      n <> st ->
      xizi_dllseg n prv st lst0 ns |--
      “ xizi_double_link_first_value ns = n ”).
  {
    intros n prv st lst0 ns Hnst.
    destruct ns as [| current rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros; destruct H as [Heq _]; contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros middle; Intros; subst current; entailer!.
  }
  prop_apply_p
    (Hdllseg_first_value first linklist_pre linklist_pre last
       nodes_dispatch_case PreH1).
  Intros_p Hfirst_value.
  subst linklist_node_pre.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_derive_sentinel_case_by_dispatch_case : xizi_double_link_next_rec_middle_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists retval_2.
    entailer!.
    subst linklist_node_pre.
    unfold xizi_double_link_next_dispatch_value in H0.
    destruct (Z.eq_dec linklist_pre linklist_pre); [exact H0 | contradiction].
  - unfold xizi_double_link_next_anchor.
    right; exact H.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_derive_member_case_by_dispatch_case : xizi_double_link_next_rec_middle_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  assert (Hseg : forall current prev stop last nodes node,
      In node nodes ->
      xizi_dllseg current prev stop last nodes |-- “ node <> stop ”).
  {
    intros current prev stop last nodes.
    revert current prev.
    induction nodes as [| expected rest IH]; intros current prev node Hin.
    - contradiction.
    - simpl in Hin.
      destruct Hin as [Heq | Hin].
      + subst expected.
        unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros next.
        entailer!.
      + unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros next.
        Intros.
        prop_apply_p (IH next current node Hin).
        entailer!.
  }
  assert (Hdll : forall head nodes node,
      In node nodes ->
      xizi_dll head nodes |-- “ node <> head ”).
  {
    intros head nodes node Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply_p (Hseg first head head last nodes node Hin).
    entailer!.
  }
  Exists nodes_member_case.
  entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    prop_apply_p (Hdll linklist_pre nodes_member_case linklist_node_pre H).
    Exists retval_2.
    entailer!.
    unfold xizi_double_link_next_dispatch_value in H0.
    destruct (Z.eq_dec linklist_node_pre linklist_pre);
      [contradiction | exact H0].
  - unfold xizi_double_link_next_anchor.
    left; exact H.
Qed.
