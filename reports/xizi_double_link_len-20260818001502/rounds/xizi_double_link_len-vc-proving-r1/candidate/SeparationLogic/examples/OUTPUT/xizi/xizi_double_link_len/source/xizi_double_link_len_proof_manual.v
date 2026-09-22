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
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (Hlinks_store : forall node next prev,
    xizi_dll_links node next prev |-- store_align4_n 2).
  {
    intros node next prev.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply
      (store_ptr_align4
        (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
    sep_apply
      (store_ptr_align4
        (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) prev).
    sep_apply (store_align4_merge 1 1).
    replace (1 + 1) with 2 by lia.
    cancel.
  }
  assert (Hseg_store : forall first prev stop last (l : list Z),
    xizi_dllseg first prev stop last l |--
    store_align4_n (2 * Zlength l)).
  {
    intros first prev stop last l.
    revert first prev.
    induction l as [|a l IH]; intros first prev.
    - simpl.
      unfold store_align4_n.
      Exists (@nil Z).
      simpl.
      entailer!.
      constructor.
    - replace (2 * Zlength (a :: l)) with (2 + 2 * Zlength l)
        by (rewrite Zlength_cons; lia).
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      unfold xizi_dll_links, XiziDLL.links.
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_prev")) prev).
      sep_apply (store_align4_merge 1 1).
      change (store_align4_n (1 + 1) **
        xizi_dllseg next first stop last l |--
        store_align4_n (2 + 2 * Zlength l)).
      sep_apply (IH next first).
      replace (1 + 1) with 2 by lia.
      sep_apply (store_align4_merge (2 * Zlength l) 2).
      replace (2 * Zlength l + 2) with (2 + 2 * Zlength l) by lia.
      cancel.
  }
  assert (Hneq : forall p q p_next p_prev q_next q_prev : Z,
    xizi_dll_links p p_next p_prev **
    xizi_dll_links q q_next q_prev |-- “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    unfold xizi_dll_links, XiziDLL.links.
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
  assert (Hsnoc : forall first start cur prev next nextnext nextprev
      (l : list Z),
    cur <> 0 ->
    xizi_dll_links next nextnext nextprev **
    xizi_dllseg first start cur prev l **
    xizi_dll_links cur next prev |--
    xizi_dll_links next nextnext nextprev **
    xizi_dllseg first start next cur (l ++ cur :: nil)).
  {
    intros first start cur prev next nextnext nextprev l Hcur.
    unfold xizi_dll_links in Hneq |- *.
    revert first start cur prev next nextnext nextprev Hcur.
    induction l as [|a l IH];
      intros first start cur prev next nextnext nextprev Hcur.
    - simpl.
      Intros.
      destruct H as [Hfirst Hstart].
      subst first start.
      L_sepcon_lift' (XiziDLL.links cur next prev).
      L_sepcon_lift' (XiziDLL.links next nextnext nextprev).
      prop_apply_p (Hneq cur next next prev nextnext nextprev).
      Intros.
      simpl.
      unfold XiziDLL.links.
      Exists next.
      entailer!.
    - simpl.
      Intros current_next.
      prop_apply_p
        (Hneq first next current_next start nextnext nextprev).
      Intros.
      Exists current_next.
      split_pure_spatial.
      + cancel (XiziDLL.links first current_next start).
        sep_apply
          (IH current_next first cur prev next nextnext nextprev Hcur).
        cancel.
      + entailer!.
  }
  assert (Hcounter_bound : forall first start cur prev next nextnext
      nextprev (l : list Z),
    xizi_dllseg first start cur prev l **
    xizi_dll_links cur next prev **
    xizi_dll_links next nextnext nextprev |--
    “ Zlength ((l ++ cur :: nil) ++ next :: nil) < 2 ^ 32 ”).
  {
    intros.
    sep_apply (Hseg_store first start cur prev l).
    sep_apply (Hlinks_store cur next prev).
    sep_apply (Hlinks_store next nextnext nextprev).
    sep_apply (store_align4_merge (2 * Zlength l) 2).
    sep_apply (store_align4_merge (2 * Zlength l + 2) 2).
    prop_apply store_align4_n_valid.
    Intros.
    dump_pre_spatial.
    rewrite !Zlength_app, !Zlength_cons, !Zlength_nil.
    replace Int.max_unsigned with 4294967295 in H by reflexivity.
    replace (4294967295 / 4 + 1) with 1073741824 in H by reflexivity.
    simpl.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    pose proof (Zlength_nonneg l).
    lia.
  }
  assert (Hseg_nonnull : forall node prev stop last (l : list Z),
    node <> stop ->
    xizi_dllseg node prev stop last l |-- “ node <> 0 ”).
  {
    intros node prev stop last l Hneq_node.
    destruct l as [|a l].
    - simpl.
      Intros.
      destruct H as [Heq _].
      contradiction.
    - simpl.
      Intros next.
      entailer!.
  }
  assert (Hpost_snoc : forall (l : list Z) y r,
    l ++ y :: r = (l ++ y :: nil) ++ r).
  {
    intros l.
    induction l as [|a l IH]; intros y r; simpl.
    - reflexivity.
    - f_equal. apply IH.
  }
  pre_process.
  prop_apply_p
    (Hseg_nonnull next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros_p Hnext_nonnull.
  sep_apply
    (xizi_dllseg_unfold next_2 tmp_node linklist_pre last_2 todo_2
      PreH1).
  Intros next rest.
  subst todo_2.
  eapply derivable1_trans with (y :=
    xizi_dll_links next_2 next tmp_node **
    xizi_dllseg next next_2 linklist_pre last_2 rest **
    xizi_dll_links linklist_pre first_2 last_2 **
    xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
    xizi_dll_links tmp_node next_2 prev_2).
  - unfold xizi_dll_links, XiziDLL.links. entailer!.
  - prop_apply_p
      (Hcounter_bound first_2 linklist_pre tmp_node prev_2 next_2
        next tmp_node before_2).
    Intros_p Hbound.
    sep_apply
      (Hsnoc first_2 linklist_pre tmp_node prev_2 next_2 next
        tmp_node before_2 PreH7).
    subst done_2 linklist_length nodes_general.
    Exists next tmp_node last_2 first_2 (before_2 ++ tmp_node :: nil)
      ((before_2 ++ tmp_node :: nil) ++ next_2 :: nil) rest.
    rewrite unsigned_last_nbits_eq.
    + unfold xizi_dll_links, XiziDLL.links.
      entailer!.
      1: { rewrite <- Zlength_app. f_equal. apply Hpost_snoc. }
      1: rewrite !Zlength_app, !Zlength_cons, !Zlength_nil; lia.
    + split.
      * pose proof (Zlength_nonneg (before_2 ++ tmp_node :: nil)). lia.
      * rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in Hbound.
        rewrite !Zlength_app, !Zlength_cons, !Zlength_nil.
        exact Hbound.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  pre_process.
  subst done_2 tmp_node linklist_length.
  destruct todo_2 as [|expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Heq _].
    contradiction.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next.
    Intros.
    subst expected nodes_general.
    Exists next linklist_pre last_2 first_2 (@nil Z)
      (first_2 :: nil) rest.
    simpl.
    unfold unsigned_last_nbits.
    unfold xizi_dll_links, XiziDLL.links.
    Exists.
    entailer!.
    rewrite Zlength_cons.
    change (Z.succ (Zlength rest) = 1 + Zlength rest).
    lia.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (Hneq : forall p q p_next p_prev q_next q_prev : Z,
    xizi_dll_links p p_next p_prev **
    xizi_dll_links q q_next q_prev |-- “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    unfold xizi_dll_links, XiziDLL.links.
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
  assert (Hsnoc : forall first start cur prev next nextnext nextprev
      (l : list Z),
    cur <> 0 ->
    xizi_dll_links next nextnext nextprev **
    xizi_dllseg first start cur prev l **
    xizi_dll_links cur next prev |--
    xizi_dll_links next nextnext nextprev **
    xizi_dllseg first start next cur (l ++ cur :: nil)).
  {
    intros first start cur prev next nextnext nextprev l Hcur.
    unfold xizi_dll_links in Hneq |- *.
    revert first start cur prev next nextnext nextprev Hcur.
    induction l as [|a l IH];
      intros first start cur prev next nextnext nextprev Hcur.
    - simpl.
      Intros.
      destruct H as [Hfirst Hstart].
      subst first start.
      L_sepcon_lift' (XiziDLL.links cur next prev).
      L_sepcon_lift' (XiziDLL.links next nextnext nextprev).
      prop_apply_p (Hneq cur next next prev nextnext nextprev).
      Intros.
      simpl.
      unfold XiziDLL.links.
      Exists next.
      entailer!.
    - simpl.
      Intros current_next.
      prop_apply_p
        (Hneq first next current_next start nextnext nextprev).
      Intros.
      Exists current_next.
      split_pure_spatial.
      + cancel (XiziDLL.links first current_next start).
        sep_apply
          (IH current_next first cur prev next nextnext nextprev Hcur).
        cancel.
      + entailer!.
  }
  assert (Hsame : forall node prev last (l : list Z),
    xizi_dllseg node prev node last l |--
    “ l = nil /\ prev = last ”).
  {
    intros node prev last l.
    destruct l as [|a l].
    - simpl. entailer!.
    - simpl. Intros next0. entailer!.
  }
  assert (Hsame_emp : forall node prev,
    xizi_dllseg node prev node prev nil |-- emp).
  {
    intros node prev. simpl. entailer!.
  }
  pre_process.
  subst next.
  prop_apply_p (Hsame linklist_pre tmp_node last todo).
  Intros_p Htodo.
  destruct Htodo as [Htodo Hlast].
  subst todo last.
  simpl in PreH2, PreH5.
  subst nodes_general linklist_length done.
  sep_apply (Hsame_emp linklist_pre tmp_node).
  rewrite sepcon_emp_logic_equiv' at 1.
  eapply derivable1_trans with (y :=
    xizi_dll_links linklist_pre first tmp_node **
    xizi_dllseg first linklist_pre tmp_node prev before **
    xizi_dll_links tmp_node linklist_pre prev).
  - unfold xizi_dll_links, XiziDLL.links. entailer!.
  - sep_apply
      (Hsnoc first linklist_pre tmp_node prev linklist_pre first tmp_node
        before PreH7).
    unfold xizi_dll, XiziDLL.dll.
    Exists first tmp_node.
    entailer!.
    + rewrite app_nil_r.
      unfold xizi_dll_links, xizi_dllseg.
      entailer!.
    + rewrite app_nil_r. reflexivity.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  pre_process.
  subst first tmp_node done.
  destruct todo as [|a rest].
  - simpl in PreH2, PreH4.
    subst nodes_general linklist_length.
    unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Hfirst Hlast].
    subst last.
    unfold xizi_dll, XiziDLL.dll, xizi_dll_links, XiziDLL.links.
    Exists linklist_pre linklist_pre.
    simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next0.
    Intros.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_len_derive_nil_case_by_general : xizi_double_link_len_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  cancel (xizi_dll linklist_pre nil).
  apply_sepcon_adjoint.
  elim_emp.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
