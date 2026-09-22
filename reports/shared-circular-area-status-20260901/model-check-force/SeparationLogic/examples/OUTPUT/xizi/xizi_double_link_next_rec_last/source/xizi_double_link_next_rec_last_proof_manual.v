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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source
      Require Import xizi_double_link_next_rec_last_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetNext_entail_wit_1 : DoubleLinkListGetNext_entail_wit_1.
Proof.
  assert (Hsplit__double_link_get_next_dispatch : forall (prefix suffix : list Z)
    (head headfirst first prev last node : Z),
    ~ In node prefix ->
    xizi_dllseg first prev head last (prefix ++ node :: suffix) **
    ((&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
     (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)) |--
    EX node_next node_prev,
    “ node <> 0 ” && “ node <> head ” &&
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first prev node node_prev prefix **
    (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
    (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) **
    xizi_dllseg node_next node head last suffix).
  {
    induction prefix as [|current prefix IH];
      intros suffix head headfirst first prev last node Hfresh.
    - simpl.
      unfold xizi_dllseg at 1.
      unfold XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst first.
      Exists next prev.
      simpl xizi_dllseg.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl in Hfresh |- *.
      assert (Hcurrent : current <> node).
      { intro Heq. apply Hfresh. now left. }
      assert (Htail : ~ In node prefix).
      { intro Hin. apply Hfresh. now right. }
      unfold xizi_dllseg at 1.
      unfold XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst current.
      repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      rewrite (IH suffix head headfirst next first last node Htail).
      Intros node_next node_prev.
      Intros.
      Exists node_next node_prev.
      simpl xizi_dllseg.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  pre_process.
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - destruct
      (xizi_double_link_first_occurrence_split__double_link_get_next_dispatch
        nodes_dispatch_case linklist_node_pre Hin)
      as (prefix & suffix & Hshape & Hfresh).
    subst nodes_dispatch_case.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    unfold xizi_dll_links, XiziDLL.links.
    fold xizi_dllseg.
    let L := constr:(cons
      (xizi_dllseg first linklist_pre linklist_pre last
        (prefix ++ linklist_node_pre :: suffix))
      (cons (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
      (cons (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)
        (@nil expr)))) in
    sep_lift_L L.
    sepcon_assoc_change.
    rewrite (Hsplit__double_link_get_next_dispatch prefix suffix
      linklist_pre first first linklist_pre last linklist_node_pre Hfresh).
    Intros node_next node_prev.
    Intros.
    Right.
    Exists node_next node_prev prefix suffix last first.
    assert (Hdispatch :=
      xizi_double_link_dispatch_first_occurrence__double_link_get_next_dispatch
        prefix suffix linklist_pre linklist_node_pre H1 Hfresh).
    entailer!.
  - subst linklist_node_pre.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    Left.
    Exists last first.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [|contradiction].
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_1 : DoubleLinkListGetNext_return_wit_1.
Proof.
  pre_process.
  subst first linklist_node_pre.
  destruct nodes_dispatch_case as [|a rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [_ Hlast].
    subst last.
    unfold xizi_double_link_next_dispatch_value,
      xizi_double_link_first_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [|contradiction].
    simpl.
    split_pure_spatial.
    + apply xizi_dll_empty_rev. exact PreH2.
    + entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    destruct H as [_ [_ Hneq]].
    contradiction.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_2 : DoubleLinkListGetNext_return_wit_2.
Proof.
  assert (Hsplice__double_link_get_next_dispatch : forall
    (prefix suffix : list Z)
    (head headfirst last start prev stop stopprev suffixnext : Z),
    stop <> 0 -> stop <> head ->
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg start prev stop stopprev prefix **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> suffixnext) **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stopprev) **
    xizi_dllseg suffixnext stop head last suffix |--
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg start prev head last (prefix ++ stop :: suffix)).
  {
    assert (Hnext_fields_neq : forall p q p_next q_next,
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
      unfold undef_store_ptr.
      Intros.
      Intros.
      prop_apply
        (store_4byte_valid
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
          (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
      Intros.
      dump_pre_spatial.
      intro Heq.
      subst q.
      lia.
    }
    induction prefix as [|expected rest IH];
      intros suffix head headfirst last start prev stop stopprev suffixnext
        Hnonnull Hneq.
    - unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
      simpl.
      Intros.
      destruct H as [Hstart Hprev].
      subst start prev.
      Exists suffixnext.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
      simpl.
      Intros next.
      Intros.
      subst expected.
      let Lneq := constr:(cons
        (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst)
        (cons (&(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next)
          (@nil expr))) in
      prop_apply_L Lneq (Hnext_fields_neq head start headfirst next).
      Intros.
      repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      match goal with
      | |- ?hn ** (?sn ** (?sp ** (?rs ** (?hp ** (?stn ** (?stp ** ?ss)))))) |-- _ =>
          let Lrest := constr:(cons hn (cons hp (cons rs
            (cons stn (cons stp (cons ss (@nil expr))))))) in
          sep_apply_L Lrest
            (IH suffix head headfirst last next start stop stopprev suffixnext
              Hnonnull Hneq)
      end.
      Exists next.
      entailer!.
  }
  pre_process.
  subst node_next.
  destruct nodes_after as [|expected rest].
  - subst nodes_dispatch_case.
    split_pure_spatial.
    + pose proof (Hsplice__double_link_get_next_dispatch nodes_before nil
        linklist_pre first last first linklist_pre linklist_node_pre node_prev
        linklist_pre PreH6 PreH7) as Hsplice.
      let L := constr:(cons
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
        (cons (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)
        (cons (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before)
        (cons (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre)
        (cons (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev)
        (cons (xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil)
          (@nil expr))))))) in
      sep_apply_L L Hsplice.
      unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + dump_pre_spatial.
      simpl in PreH5.
      exact (eq_sym PreH5).
  - L_sepcon_lift'
      (xizi_dllseg linklist_pre linklist_node_pre linklist_pre last
        (expected :: rest)).
    unfold xizi_dllseg at 1.
    unfold XiziDLL.dllseg at 1.
    simpl.
    Intros next.
    Intros.
    contradiction.
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_3 : DoubleLinkListGetNext_return_wit_3.
Proof.
  assert (Hsplice__double_link_get_next_dispatch : forall
    (prefix suffix : list Z)
    (head headfirst last start prev stop stopprev suffixnext : Z),
    stop <> 0 -> stop <> head ->
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg start prev stop stopprev prefix **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> suffixnext) **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stopprev) **
    xizi_dllseg suffixnext stop head last suffix |--
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst) **
    (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg start prev head last (prefix ++ stop :: suffix)).
  {
    assert (Hnext_fields_neq : forall p q p_next q_next,
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
      unfold undef_store_ptr.
      Intros.
      Intros.
      prop_apply
        (store_4byte_valid
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
          (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
      Intros.
      dump_pre_spatial.
      intro Heq.
      subst q.
      lia.
    }
    induction prefix as [|expected rest IH];
      intros suffix head headfirst last start prev stop stopprev suffixnext
        Hnonnull Hneq.
    - unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
      simpl.
      Intros.
      destruct H as [Hstart Hprev].
      subst start prev.
      Exists suffixnext.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
      simpl.
      Intros next.
      Intros.
      subst expected.
      let Lneq := constr:(cons
        (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> headfirst)
        (cons (&(start # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next)
          (@nil expr))) in
      prop_apply_L Lneq (Hnext_fields_neq head start headfirst next).
      Intros.
      repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      match goal with
      | |- ?hn ** (?sn ** (?sp ** (?rs ** (?hp ** (?stn ** (?stp ** ?ss)))))) |-- _ =>
          let Lrest := constr:(cons hn (cons hp (cons rs
            (cons stn (cons stp (cons ss (@nil expr))))))) in
          sep_apply_L Lrest
            (IH suffix head headfirst last next start stop stopprev suffixnext
              Hnonnull Hneq)
      end.
      Exists next.
      entailer!.
  }
  assert (Hseg_head__double_link_get_next_dispatch : forall
    node prev stop last expected rest,
    xizi_dllseg node prev stop last (expected :: rest) |--
    “ node = expected ” && xizi_dllseg node prev stop last (expected :: rest)).
  {
    intros.
    unfold xizi_dllseg at 1.
    unfold XiziDLL.dllseg at 1.
    simpl.
    Intros next.
    Intros.
    Exists next.
    split_pure_spatial.
    - repeat fold XiziDLL.dllseg.
      repeat fold xizi_dllseg.
      entailer!.
    - entailer!.
  }
  pre_process.
  destruct nodes_after as [|expected rest].
  - unfold xizi_dllseg at 2.
    unfold XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Heq _]. contradiction.
  - sep_apply (Hseg_head__double_link_get_next_dispatch node_next
      linklist_node_pre linklist_pre last expected rest).
    Intros.
    subst expected nodes_dispatch_case.
    split_pure_spatial.
    + pose proof (Hsplice__double_link_get_next_dispatch nodes_before
        (node_next :: rest) linklist_pre first last first linklist_pre
        linklist_node_pre node_prev node_next PreH6 PreH7) as Hsplice.
      let L := constr:(cons
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
        (cons (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last)
        (cons (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before)
        (cons (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next)
        (cons (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev)
        (cons (xizi_dllseg node_next linklist_node_pre linklist_pre last
          (node_next :: rest)) (@nil expr))))))) in
      sep_apply_L L Hsplice.
      unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + dump_pre_spatial.
      simpl in PreH5.
      exact (eq_sym PreH5).
Qed.

Lemma proof_of_DoubleLinkListGetNext_return_wit_4 : DoubleLinkListGetNext_return_wit_4.
Proof.
  pre_process.
  subst linklist_node_pre.
  destruct nodes_dispatch_case as [|expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Heq _]. contradiction.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst expected.
    split_pure_spatial.
    + unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + dump_pre_spatial.
      simpl in PreH4.
      exact (eq_sym PreH4).
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case : DoubleLinkListGetNext_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  subst linklist_node_pre.
  Exists nodes_sentinel_case.
  unfold xizi_double_link_next_anchor.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Intros.
  Exists retval_2.
  unfold xizi_double_link_next_dispatch_value in H.
  destruct (Z.eq_dec linklist_pre linklist_pre); [|contradiction].
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetNext_derive_member_case_by_dispatch_case : DoubleLinkListGetNext_derive_member_case_by_dispatch_case.
Proof.
  assert (Hmember_seg__double_link_get_next_dispatch : forall
    start prev stop last nodes target,
    In target nodes ->
    xizi_dllseg start prev stop last nodes |--
    “ target <> stop ” && xizi_dllseg start prev stop last nodes).
  {
    intros start prev stop last nodes.
    revert start prev stop last.
    induction nodes as [|expected rest IH];
      intros start prev stop last target Hin.
    - contradiction.
    - unfold xizi_dllseg at 1.
      unfold XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      destruct Hin as [Heq | Hin].
      + subst expected target.
        Exists next.
        split_pure_spatial.
        * repeat fold XiziDLL.dllseg.
          repeat fold xizi_dllseg.
          entailer!.
        * entailer!.
      + repeat fold XiziDLL.dllseg.
        repeat fold xizi_dllseg.
        sep_apply (IH next start stop last target Hin).
        Intros.
        Exists next.
        split_pure_spatial; entailer!.
  }
  pre_process.
  unfold xizi_dll, XiziDLL.dll at 1.
  Intros first last.
  sep_apply (Hmember_seg__double_link_get_next_dispatch first linklist_pre
    linklist_pre last nodes_member_case linklist_node_pre ltac:(assumption)).
  Intros.
  Exists nodes_member_case.
  unfold xizi_double_link_next_anchor.
  entailer!.
  fold xizi_dll_links.
  sep_apply (xizi_dll_close linklist_pre first last nodes_member_case
    ltac:(assumption)).
  repeat fold xizi_dll.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Intros.
  Exists retval_2.
  split_pure_spatial.
  - entailer!.
  - unfold xizi_double_link_next_dispatch_value in H2.
    destruct (Z.eq_dec linklist_node_pre linklist_pre); [contradiction |].
    entailer!.
Qed.
