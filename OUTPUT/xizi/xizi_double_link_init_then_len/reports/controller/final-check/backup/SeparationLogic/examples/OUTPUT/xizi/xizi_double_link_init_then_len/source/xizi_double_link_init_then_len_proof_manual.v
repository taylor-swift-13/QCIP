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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists nodes_general.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_1 : DoubleLinkListLenGet_entail_wit_2_1.
Proof.
  assert (Hlinks_distinct : forall x xn xp y yn yp,
    xizi_dll_links x xn xp ** xizi_dll_links y yn yp |-- “ x <> y ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec x y).
    - subst y.
      sepcon_lift
        (&(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> yn).
      sep_apply (dup_store_ptr
        (&(x # "SysDoubleLinklistNode" ->ₛ "node_next")) yn xn).
      entailer!.
    - entailer!.
  }
  assert (Hsnoc : forall node prev stop last nodes next after,
    stop <> 0 ->
    xizi_dllseg node prev stop last nodes **
    xizi_dll_links stop next last **
    xizi_dll_links next after stop |--
    xizi_dllseg node prev next stop (nodes ++ stop :: nil) **
    xizi_dll_links next after stop).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev next after Hstop0.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Hends.
      destruct Hends as [Hnode Hprev].
      subst node; subst prev.
      destruct (Z.eq_dec stop next) as [Heq | Hstopnext].
      + subst next.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_lift
          (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> after).
        sep_apply (dup_store_ptr
          (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) after stop).
        entailer!.
      + Exists next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1 2.
      simpl.
      Intros next_node.
      Exists next_node.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      sep_apply (IH next_node node next after Hstop0).
      destruct (Z.eq_dec node next) as [Heq | Hnodenext].
      + subst next.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity (
          (((&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> after) **
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_node)) **
           ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop) **
            ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) **
             xizi_dllseg next_node node node stop (rest ++ stop :: nil))))).
        * entailer!.
        * sep_apply_l_atomic (dup_store_ptr
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) after next_node).
          entailer!.
      + split_pure_spatial.
        * cancel (xizi_dll_links node next_node prev).
          cancel (xizi_dllseg next_node node next stop
            (rest ++ stop :: nil)).
          cancel (xizi_dll_links next after stop).
        * entailer!.
  }
  assert (Halign : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |--
    store_align4_n (Zlength nodes * 2)).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Hends.
      unfold store_align4_n.
      Exists nil.
      simpl.
      split_pure_spatial.
      + cancel.
      + dump_pre_spatial.
        split; [reflexivity | constructor].
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next_node.
      unfold xizi_dll_links, XiziDLL.links.
      sep_apply (store_ptr_align4
        (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) next_node).
      sep_apply (store_ptr_align4
        (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) prev).
      sep_apply (store_align4_merge 1 1).
      change (store_align4_n (1 + 1) **
        xizi_dllseg next_node node stop last rest |--
        store_align4_n (Zlength (expected :: rest) * 2)).
      sep_apply (IH next_node node).
      rewrite Zlength_cons.
      sep_apply (store_align4_merge (Zlength rest * 2) 2).
      replace (Z.succ (Zlength rest) * 2) with
        (Zlength rest * 2 + 2) by lia.
      cancel (store_align4_n (Zlength rest * 2 + 2)).
  }
  assert (Halign_bound : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |--
    “ Zlength nodes * 2 <= Int.max_unsigned / 4 + 1 ”).
  {
    intros.
    sep_apply (Halign node prev stop last nodes).
    prop_apply (store_align4_n_valid (Zlength nodes * 2)).
    Intros_p Hbound.
    dump_pre_spatial.
    exact Hbound.
  }
  assert (Hunfold_full : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    EX next rest,
      “ nodes = node :: rest ” &&
      “ node <> 0 ” &&
      xizi_dll_links node next prev **
      xizi_dllseg next node stop last rest).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Hends.
      destruct Hends as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      subst expected.
      Exists next rest.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  pre_process.
  sep_apply (Hunfold_full
    next_2 tmp_node linklist_pre last_2 todo_2); [ | exact PreH1 ].
  Intros next rest.
  match goal with
  | |- _ |-- ?Q =>
      change (xizi_dll_links next_2 next tmp_node **
        (xizi_dllseg next next_2 linklist_pre last_2 rest **
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2 **
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2 **
        (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
        xizi_dll_links tmp_node next_2 prev_2)))) |-- Q)
  end.
  prop_apply (Halign_bound
    first_2 linklist_pre tmp_node prev_2 before_2).
  Intros_p Hbound.
  sep_apply (Hsnoc
    first_2 linklist_pre tmp_node prev_2 before_2 next_2 next PreH7).
  Exists next tmp_node last_2 first_2
    (before_2 ++ tmp_node :: nil) (done_2 ++ next_2 :: nil) rest.
  split_pure_spatial.
  - cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2).
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2).
    cancel (xizi_dllseg first_2 linklist_pre next_2 tmp_node
      (before_2 ++ tmp_node :: nil)).
    unfold xizi_dll_links, XiziDLL.links.
    cancel (&(next_2 # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    cancel (&(next_2 # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node).
    cancel (xizi_dllseg next next_2 linklist_pre last_2 rest).
  - split_pures.
    + dump_pre_spatial.
      subst done_2 todo_2.
      change (nodes_general =
        (((before_2 ++ tmp_node :: nil) ++ next_2 :: nil) ++ rest)).
      rewrite PreH2.
      clear.
      induction before_2; simpl; auto.
      rewrite IHbefore_2.
      reflexivity.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial.
      subst linklist_length done_2.
      rewrite Zlength_app, !Zlength_cons, Zlength_nil.
      rewrite unsigned_last_nbits_eq.
      * rewrite !Zlength_app, !Zlength_cons, Zlength_nil.
        lia.
      * replace Int.max_unsigned with 4294967295 in Hbound by reflexivity.
        pose proof (Zlength_nonneg before_2) as Hnonneg.
        simpl in Hbound.
        assert (Hdouble : Zlength before_2 <= Zlength before_2 * 2) by lia.
        assert (Hsmall : Zlength before_2 <= 1073741824).
        { eapply Z.le_trans; eauto. }
        change (0 <= Zlength before_2 + 1 + 1 < 4294967296).
        split; lia.
    + dump_pre_spatial.
      subst nodes_general done_2 todo_2.
      rewrite !Zlength_app, !Zlength_cons, Zlength_nil.
      change (Zlength before_2 + 1 + (Zlength rest + 1) =
        Zlength before_2 + 1 + 1 + Zlength rest).
      lia.
    + dump_pre_spatial.
      subst done_2.
      reflexivity.
    + dump_pre_spatial. exact H1.
    + dump_pre_spatial. exact PreH1.
Qed.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_2 : DoubleLinkListLenGet_entail_wit_2_2.
Proof.
  assert (Hunfold_full : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    EX next rest,
      “ nodes = node :: rest ” &&
      “ node <> 0 ” &&
      xizi_dll_links node next prev **
      xizi_dllseg next node stop last rest).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Hends.
      destruct Hends as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      subst expected.
      Exists next rest.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  pre_process.
  sep_apply (Hunfold_full first_2 linklist_pre
    linklist_pre last_2 todo_2); [| exact PreH1].
  Intros next rest.
  subst tmp_node done_2 todo_2.
  Exists next linklist_pre last_2 first_2 (@nil Z)
    (first_2 :: nil) rest.
  simpl.
  split_pure_spatial.
  - unfold xizi_dllseg.
    simpl.
    unfold xizi_dll_links, XiziDLL.links.
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first_2).
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last_2).
    cancel (&(first_2 # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    cancel (&(first_2 # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_pre).
    cancel (XiziDLL.dllseg next first_2 linklist_pre last_2 rest).
  - split_pures.
    + dump_pre_spatial.
      rewrite PreH2.
      reflexivity.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial.
      subst linklist_length.
      simpl.
      rewrite unsigned_last_nbits_eq.
      * reflexivity.
      * change (0 <= 1 < 4294967296).
        lia.
    + dump_pre_spatial.
      rewrite PreH5.
      rewrite Zlength_nil, Z.add_0_l, Zlength_cons.
      pose proof (Zlength_nonneg rest).
      change (Zlength rest + 1 = 1 + Zlength rest).
      lia.
    + dump_pre_spatial. reflexivity.
    + dump_pre_spatial. assumption.
    + dump_pre_spatial. exact PreH1.
    + dump_pre_spatial.
      split; reflexivity.
Qed.

Lemma proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Proof.
  assert (Hsnoc_raw : forall node prev stop last nodes next after,
    stop <> 0 ->
    ((((xizi_dllseg node prev stop last nodes **
    &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) **
    &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    &(next # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> after) **
    &(next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop) |--
    xizi_dllseg node prev next stop (nodes ++ stop :: nil) **
    xizi_dll_links next after stop).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev next after Hstop0.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Hends.
      destruct Hends as [Hnode Hprev].
      subst node; subst prev.
      destruct (Z.eq_dec stop next) as [Heq | Hstopnext].
      + subst next.
        sepcon_lift
          (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> after).
        sep_apply_l_atomic (dup_store_ptr
          (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) after stop).
        entailer!.
      + Exists next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1 2.
      simpl.
      Intros next_node.
      Exists next_node.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      sep_apply_l_atomic (IH next_node node next after Hstop0).
      destruct (Z.eq_dec node next) as [Heq | Hnodenext].
      + subst next.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity (
          (((&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> after) **
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_node)) **
           ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop) **
            ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) **
             xizi_dllseg next_node node node stop (rest ++ stop :: nil))))).
        * entailer!.
        * sep_apply_l_atomic (dup_store_ptr
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) after next_node).
          entailer!.
      + split_pure_spatial.
        * cancel (xizi_dll_links node next_node prev).
          cancel (xizi_dllseg next_node node next stop
            (rest ++ stop :: nil)).
          cancel (xizi_dll_links next after stop).
        * entailer!.
  }
  assert (Hstop : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
      “ nodes = nil /\ prev = last ” && emp).
  {
    intros stop prev last nodes.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      entailer!.
  }
  pre_process.
  subst next.
  sep_apply (Hstop linklist_pre tmp_node last todo).
  Intros_p Hends.
  destruct Hends as [Htodo Hlast].
  subst todo last.
  subst nodes_general done linklist_length.
  sepcon_lift
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node).
  sepcon_lift
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
  sepcon_lift
    (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev).
  sepcon_lift
    (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre).
  sepcon_lift (xizi_dllseg first linklist_pre tmp_node prev before).
  sep_apply (Hsnoc_raw first linklist_pre tmp_node prev
    before linklist_pre first PreH7).
  sep_apply (xizi_dll_close linklist_pre first tmp_node
    (before ++ tmp_node :: nil) PreH3).
  split_pure_spatial.
  - rewrite app_nil_r.
    entailer!.
  - dump_pre_spatial.
    rewrite app_nil_r.
    reflexivity.
Qed.

Lemma proof_of_DoubleLinkListLenGet_return_wit_2 : DoubleLinkListLenGet_return_wit_2.
Proof.
  assert (Hstop : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
      “ nodes = nil /\ prev = last ” && emp).
  {
    intros stop prev last nodes.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      entailer!.
  }
  pre_process.
  subst first tmp_node done.
  sep_apply (Hstop linklist_pre linklist_pre last todo).
  Intros_p Hends.
  destruct Hends as [Htodo Hlast].
  subst todo last.
  subst nodes_general linklist_length.
  change (xizi_dll_links linklist_pre linklist_pre linklist_pre |--
    “ Zlength (@nil Z) = Zlength ((@nil Z) ++ (@nil Z)) ” &&
    xizi_dll linklist_pre ((@nil Z) ++ (@nil Z))).
  sep_apply (xizi_dll_empty_rev linklist_pre PreH3).
  split_pure_spatial.
  - simpl.
    entailer!.
  - dump_pre_spatial.
    reflexivity.
Qed.

Lemma proof_of_xizi_double_link_init_then_len_return_wit_1 : xizi_double_link_init_then_len_return_wit_1.
Proof.
  pre_process.
Qed.

Lemma proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  apply sepcon_cancel_res_emp.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
