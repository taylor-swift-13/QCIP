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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_len_entail_wit_1 : xizi_double_link_len_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  Exists last first (@nil Z) nodes_general.
  unfold xizi_dll_links, XiziDLL.links.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (links_nodes_neq_local :
    forall x next_x prev_x y next_y prev_y,
      xizi_dll_links x next_x prev_x **
      xizi_dll_links y next_y prev_y |-- “ x <> y ”).
  { intros x next_x prev_x y next_y prev_y.
    destruct (Z.eq_dec x y) as [Heq | Hneq].
    - subst y.
      assert (Hreorder :
        xizi_dll_links x next_x prev_x **
        xizi_dll_links x next_y prev_y |--
        ((&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_x **
          &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_y) **
         (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_x **
          &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_y))).
      { unfold xizi_dll_links, XiziDLL.links.
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_x).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_y).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_x).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_y). }
      etransitivity.
      + exact Hreorder.
      + sep_apply (dup_store_ptr
          (&(x # "SysDoubleLinklistNode" ->ₛ "node_next")) next_x next_y).
        entailer!.
    - entailer!. }
  assert (links_align_local :
    forall node next previous,
      xizi_dll_links node next previous |-- store_align4_n 2).
  { intros node next previous.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply (store_ptr_align4
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
    sep_apply (store_ptr_align4
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) previous).
    sep_apply (store_align4_merge 1 1).
    replace (1 + 1) with 2 by reflexivity.
    cancel (store_align4_n 2). }
  assert (dllseg_align_local :
    forall node previous stop last xs,
      xizi_dllseg node previous stop last xs |--
      store_align4_n (Zlength xs + Zlength xs)).
  { intros node previous stop last xs.
    revert node previous.
    induction xs as [| expected rest IH]; intros node previous.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      unfold store_align4_n.
      Exists nil.
      simpl.
      entailer!.
      constructor.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      sep_apply (links_align_local expected next previous).
      sep_apply (IH next expected).
      sep_apply (store_align4_merge 2
        (Zlength rest + Zlength rest)).
      replace (Zlength (expected :: rest) + Zlength (expected :: rest)) with
        (2 + (Zlength rest + Zlength rest))
        by (rewrite !Zlength_cons, Z.add_succ_l, Z.add_succ_r; ring).
      cancel (store_align4_n (2 + (Zlength rest + Zlength rest))). }
  assert (dllseg_links_length_bound_local :
    forall node previous stop last xs next after,
      xizi_dllseg node previous stop last xs **
      xizi_dll_links stop next after |--
      “ 0 <= Zlength (xs ++ (stop :: nil)) < 2 ^ 32 ”).
  { intros node previous stop last xs next after.
    sep_apply (dllseg_align_local node previous stop last xs).
    sep_apply (links_align_local stop next after).
    sep_apply (store_align4_merge (Zlength xs + Zlength xs) 2).
    prop_apply store_align4_n_valid.
    Intros.
    dump_pre_spatial.
    rewrite Zlength_app, Zlength_cons, Zlength_nil.
    pose proof (Zlength_nonneg xs).
    change (Zlength xs + Zlength xs + 2 <= 1073741824) in H.
    change (0 <= Zlength xs + 1 < 4294967296).
    assert (Hk0 : 0 <= Zlength xs + 1).
    { apply Z.add_nonneg_nonneg.
      - exact H0.
      - exact Z.le_0_1. }
    replace (Zlength xs + Zlength xs + 2) with
      ((Zlength xs + 1) + (Zlength xs + 1)) in H by ring.
    pose proof (proj1 (Z.add_le_mono_l 0 (Zlength xs + 1)
      (Zlength xs + 1)) Hk0) as Hkle.
    rewrite Z.add_0_r in Hkle.
    split; [exact Hk0 |].
    eapply Z.le_lt_trans.
    - eapply Z.le_trans; [exact Hkle | exact H].
    - compute; reflexivity. }
  assert (dllseg_links_length_bound_frame_local :
    forall node previous stop last xs next after P,
      xizi_dllseg node previous stop last xs **
      (xizi_dll_links stop next after ** P) |--
      “ 0 <= Zlength (xs ++ (stop :: nil)) < 2 ^ 32 ”).
  { intros node previous stop last xs next after P.
    assert (Hreorder :
      xizi_dllseg node previous stop last xs **
      (xizi_dll_links stop next after ** P) |--
      (xizi_dllseg node previous stop last xs **
       xizi_dll_links stop next after) ** P).
    { cancel (xizi_dllseg node previous stop last xs).
      cancel (xizi_dll_links stop next after).
      cancel P. }
    etransitivity.
    - exact Hreorder.
    - prop_apply_p (dllseg_links_length_bound_local
        node previous stop last xs next after).
      Intros_p Hbound.
      entailer!. }
  assert (dllseg_links_length_bound_keep_local :
    forall node previous stop last xs next after P,
      xizi_dllseg node previous stop last xs **
      (xizi_dll_links stop next after ** P) |--
      “ 0 <= Zlength (xs ++ (stop :: nil)) < 2 ^ 32 ” &&
      xizi_dllseg node previous stop last xs **
      (xizi_dll_links stop next after ** P)).
  { intros node previous stop last xs next after P.
    split_pure_spatial.
    - cancel (xizi_dllseg node previous stop last xs).
      cancel (xizi_dll_links stop next after).
      cancel P.
    - exact (dllseg_links_length_bound_frame_local
        node previous stop last xs next after P). }
  assert (dllseg_snoc_local :
    forall start previous stop last next after xs,
      stop <> 0 -> stop <> next ->
      xizi_dllseg start previous stop last xs **
      xizi_dll_links stop next last **
      xizi_dll_links next after stop |--
      xizi_dllseg start previous next stop (xs ++ (stop :: nil)) **
      xizi_dll_links next after stop).
  { intros start previous stop last next after xs Hstop Hnext.
    revert start previous.
    induction xs as [| x xs IH]; intros start previous.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hstart Hprevious].
      subst start previous.
      Exists next.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next_x.
      Intros.
      subst start.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      destruct (Z.eq_dec x next) as [Heq | Hxnext].
      + subst next.
        assert (Hreorder :
          xizi_dll_links x next_x previous **
          (xizi_dllseg next_x x stop last xs **
           (xizi_dll_links stop x last ** xizi_dll_links x after stop)) |--
          (xizi_dll_links x next_x previous **
           xizi_dll_links x after stop) **
          (xizi_dllseg next_x x stop last xs **
           xizi_dll_links stop x last)).
        { cancel (xizi_dll_links x next_x previous).
          cancel (xizi_dll_links x after stop).
          cancel (xizi_dllseg next_x x stop last xs).
          cancel (xizi_dll_links stop x last). }
        etransitivity.
        * exact Hreorder.
        * prop_apply_p (links_nodes_neq_local
            x next_x previous x after stop).
          Intros_p Hfalse.
          contradiction.
      + sep_apply (IH next_x x).
        simpl.
        Exists next_x.
        entailer!. }
  left.
  intros.
  pre_process.
  destruct todo_2 as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    Intros.
    destruct H.
    contradiction.
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    Intros next_3.
    Intros.
    subst expected.
    fold XiziDLL.dllseg.
    fold xizi_dllseg.
    destruct (Z.eq_dec tmp_node next_2) as [Heq | Htmpnext].
    + subst next_2.
      assert (Hreorder :
        xizi_dll_links tmp_node next_3 tmp_node **
        (xizi_dllseg next_3 tmp_node linklist_pre last_2 rest **
         (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
          (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2 **
           (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
            (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> tmp_node **
             &(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2))))) |--
        (xizi_dll_links tmp_node next_3 tmp_node **
         xizi_dll_links tmp_node tmp_node prev_2) **
        (xizi_dllseg next_3 tmp_node linklist_pre last_2 rest **
         (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
          (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2 **
           xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2)))).
      { unfold xizi_dll_links, XiziDLL.links.
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_3).
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node).
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> tmp_node).
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2).
        cancel (xizi_dllseg next_3 tmp_node linklist_pre last_2 rest).
        cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2).
        cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2).
        cancel (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2). }
      etransitivity.
      * exact Hreorder.
      * prop_apply_p (links_nodes_neq_local
          tmp_node next_3 tmp_node tmp_node tmp_node prev_2).
        Intros_p Hfalse.
        contradiction.
    + assert (Hreorder :
        xizi_dll_links next_2 next_3 tmp_node **
        (xizi_dllseg next_3 next_2 linklist_pre last_2 rest **
         (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
          (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2 **
           (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
            (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_2 **
             &(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2))))) |--
        (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
         xizi_dll_links tmp_node next_2 prev_2 **
         xizi_dll_links next_2 next_3 tmp_node) **
        (xizi_dllseg next_3 next_2 linklist_pre last_2 rest **
         (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
          (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2)))).
      { unfold xizi_dll_links, XiziDLL.links.
        cancel (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2).
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_2).
        cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2).
        cancel (&(next_2 # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_3).
        cancel (&(next_2 # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node).
        cancel (xizi_dllseg next_3 next_2 linklist_pre last_2 rest).
        cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2).
        cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2). }
      etransitivity.
      * exact Hreorder.
      * sep_apply_l_atomic (dllseg_snoc_local first_2 linklist_pre tmp_node
          prev_2 next_2 next_3 before_2 PreH7 Htmpnext).
        etransitivity.
        { exact (dllseg_links_length_bound_keep_local
            first_2 linklist_pre next_2 tmp_node
            (before_2 +:: tmp_node) next_3 tmp_node
            (xizi_dllseg next_3 next_2 linklist_pre last_2 rest **
             (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
              &(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2))). }
        Intros_p Hbound.
        assert (Hbits : 0 <= linklist_length + 1 < 2 ^ 32).
        { rewrite PreH4, PreH6.
          replace (Zlength (before_2 +:: tmp_node) + 1) with
            (Zlength ((before_2 +:: tmp_node) +:: next_2)).
          - exact Hbound.
          - rewrite !Zlength_app, !Zlength_cons, !Zlength_nil.
            ring. }
        rewrite (unsigned_last_nbits_eq (linklist_length + 1) 32 Hbits).
        Exists next_3 tmp_node last_2 first_2
          (before_2 +:: tmp_node)
          ((before_2 +:: tmp_node) +:: next_2) rest.
        entailer!.
        { rewrite PreH2, PreH6, !Zlength_app, !Zlength_cons, !Zlength_nil.
          ring. }
        { rewrite PreH4, PreH6, !Zlength_app, !Zlength_cons, !Zlength_nil.
          ring. }
        { rewrite PreH2, PreH6.
          repeat rewrite <- app_assoc.
          reflexivity. }
Qed. 

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  left.
  intros.
  pre_process.
  destruct todo_2 as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H.
    contradiction.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next_2.
    Intros.
    subst expected.
    fold XiziDLL.dllseg.
    fold xizi_dllseg.
    subst tmp_node done_2 linklist_length nodes_general.
    Exists next_2 linklist_pre last_2 first_2 nil (first_2 :: nil) rest.
    entailer!.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    unfold XiziDLL.links.
    entailer!.
    rewrite !Zlength_app, !Zlength_cons, !Zlength_nil.
    ring.
Qed. 

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (xizi_dll_links_nodes_neq_local :
    forall x next_x prev_x y next_y prev_y,
      xizi_dll_links x next_x prev_x **
      xizi_dll_links y next_y prev_y |-- “ x <> y ”).
  { intros x next_x prev_x y next_y prev_y.
    destruct (Z.eq_dec x y) as [Heq | Hneq].
    - subst y.
      assert (Hreorder :
        xizi_dll_links x next_x prev_x **
        xizi_dll_links x next_y prev_y |--
        ((&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_x **
          &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_y) **
         (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_x **
          &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_y))).
      { unfold xizi_dll_links, XiziDLL.links.
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_x).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_y).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_x).
        cancel (&(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_y). }
      etransitivity.
      + exact Hreorder.
      + sep_apply (dup_store_ptr
          (&(x # "SysDoubleLinklistNode" ->ₛ "node_next")) next_x next_y).
        entailer!.
    - entailer!. }
  assert (dllseg_snoc_local :
    forall start previous stop last next after xs,
      stop <> 0 -> stop <> next ->
      xizi_dllseg start previous stop last xs **
      xizi_dll_links stop next last **
      xizi_dll_links next after stop |--
      xizi_dllseg start previous next stop (xs ++ (stop :: nil)) **
      xizi_dll_links next after stop).
  { intros start previous stop last next after xs Hstop Hnext.
    revert start previous.
    induction xs as [| x xs IH]; intros start previous.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hstart Hprevious].
      subst start previous.
      Exists next.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next_x.
      Intros.
      subst start.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      destruct (Z.eq_dec x next) as [Heq | Hxnext].
      + subst next.
        assert (Hreorder :
          xizi_dll_links x next_x previous **
          (xizi_dllseg next_x x stop last xs **
           (xizi_dll_links stop x last ** xizi_dll_links x after stop)) |--
          (xizi_dll_links x next_x previous **
           xizi_dll_links x after stop) **
          (xizi_dllseg next_x x stop last xs **
           xizi_dll_links stop x last)).
        { cancel (xizi_dll_links x next_x previous).
          cancel (xizi_dll_links x after stop).
          cancel (xizi_dllseg next_x x stop last xs).
          cancel (xizi_dll_links stop x last). }
        etransitivity.
        * exact Hreorder.
        * prop_apply_p (xizi_dll_links_nodes_neq_local
            x next_x previous x after stop).
          Intros_p Hfalse.
          contradiction.
      + sep_apply (IH next_x x).
        simpl.
        Exists next_x.
        entailer!. }
  left.
  intros.
  pre_process.
  subst next.
  destruct todo as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    Intros.
    destruct H as [Hhead Hprev].
    subst last.
    assert (Hreorder :
      (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
       (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node **
        (XiziDLL.dllseg first linklist_pre tmp_node prev before **
         (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre **
          &(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev)))) |--
      xizi_dllseg first linklist_pre tmp_node prev before **
      xizi_dll_links tmp_node linklist_pre prev **
      xizi_dll_links linklist_pre first tmp_node).
    { unfold xizi_dllseg, xizi_dll_links, XiziDLL.links.
      cancel (XiziDLL.dllseg first linklist_pre tmp_node prev before).
      cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre).
      cancel (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev).
      cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
      cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node). }
    etransitivity.
    + exact Hreorder.
    + sep_apply_l_atomic (dllseg_snoc_local first linklist_pre tmp_node
        prev linklist_pre first before PreH7 PreH8).
      assert (Hclose :
        xizi_dllseg first linklist_pre linklist_pre tmp_node
          (before +:: tmp_node) **
        xizi_dll_links linklist_pre first tmp_node |--
        xizi_dll_links linklist_pre first tmp_node **
        xizi_dllseg first linklist_pre linklist_pre tmp_node
          (before +:: tmp_node)).
      { cancel (xizi_dll_links linklist_pre first tmp_node).
        cancel (xizi_dllseg first linklist_pre linklist_pre tmp_node
          (before +:: tmp_node)). }
      etransitivity.
      * exact Hclose.
      * sep_apply_l_atomic (xizi_dll_close linklist_pre first tmp_node
          (before +:: tmp_node) PreH3).
        entailer!.
        { rewrite PreH2, PreH6, app_nil_r.
          cancel (xizi_dll linklist_pre (before +:: tmp_node)). }
        { rewrite PreH4, PreH2, PreH6, app_nil_r.
          reflexivity. }
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    Intros next_node.
    Intros.
    contradiction.
Qed. 

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  left.
  intros.
  pre_process.
  subst first tmp_node done linklist_length nodes_general.
  destruct todo as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hhead Hlast].
    subst last.
    sep_apply_l_atomic (xizi_dll_empty_rev linklist_pre PreH3).
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next_node.
    Intros.
    contradiction.
Qed. 

Lemma proof_of_xizi_double_link_len_derive_nil_case_by_general : xizi_double_link_len_derive_nil_case_by_general.
Proof.
  unfold xizi_double_link_len_derive_nil_case_by_general.
  intros linklist_pre.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  cancel (xizi_dll linklist_pre nil).
  apply_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
