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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after Require Import xizi_double_link_insert_after_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after Require Import xizi_double_link_insert_after_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after Require Import xizi_double_link_insert_after_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_insert_after_entail_wit_1 : xizi_double_link_insert_after_entail_wit_1.
Proof.
  assert (Hlinksneq : forall p pnext pprev q qnext qprev,
    XiziDLL.links p pnext pprev ** XiziDLL.links q qnext qprev |-- “ p <> q ”).
  {
    intros p pnext pprev q qnext qprev.
    unfold XiziDLL.links.
    sepcon_assoc_change.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      rewrite (logic_equiv_sepcon_swap
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
      prop_apply_p (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hsplit : forall prefix first prev anchor stop last suffix,
    xizi_dllseg first prev stop last (prefix ++ anchor :: suffix) |--
    EX old_prev next,
      xizi_dllseg first prev anchor old_prev prefix **
      xizi_dll_links anchor next old_prev **
      xizi_dllseg next anchor stop last suffix).
  {
    induction prefix as [|node prefix IH]; intros first prev anchor stop last suffix.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst first.
      Exists prev next.
      unfold xizi_dll_links, XiziDLL.links.
      simpl.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      sep_apply (IH next first anchor stop last suffix).
      Intros old_prev anchor_next.
      unfold xizi_dll_links.
      prop_apply_p (Hlinksneq first next prev anchor anchor_next old_prev).
      Intros.
      Exists old_prev anchor_next.
      unfold xizi_dllseg, XiziDLL.dllseg at 2.
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  pre_process.
  sep_apply xizi_dll_open.
  Intros first last.
  sep_apply (Hsplit nodes_before first head linklist_pre head last nodes_after).
  Intros old_prev old_next.
  destruct nodes_after as [|next rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Hold_next Hlast].
    subst old_next; subst last.
    Left.
    Exists old_prev first.
    unfold xizi_dll_links, XiziDLL.links.
    simpl.
    entailer!.
  - Right.
    unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next_next.
    Intros.
    subst old_next.
    Exists next_next old_prev last first next rest.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_1 : xizi_double_link_insert_after_return_wit_1.
Proof.
  assert (Hlinksneq : forall p pnext pprev q qnext qprev,
    XiziDLL.links p pnext pprev ** XiziDLL.links q qnext qprev |-- “ p <> q ”).
  {
    intros p pnext pprev q qnext qprev.
    unfold XiziDLL.links.
    sepcon_assoc_change.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      rewrite (logic_equiv_sepcon_swap
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
      prop_apply_p (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hcons : forall node prev next stop last rest,
    node <> NULL -> node <> stop ->
    XiziDLL.links node next prev ** XiziDLL.dllseg next node stop last rest |--
    XiziDLL.dllseg node prev stop last (node :: rest)).
  {
    intros node prev next stop last rest Hnonnull Hstop.
    simpl. Exists next. entailer!.
  }
  assert (Hmerge : forall prefix first prev anchor old_prev next stop last suffix stop_next stop_prev,
    anchor <> NULL -> anchor <> stop ->
    XiziDLL.links stop stop_next stop_prev **
    (XiziDLL.dllseg first prev anchor old_prev prefix **
     (XiziDLL.links anchor next old_prev **
      XiziDLL.dllseg next anchor stop last suffix)) |--
    XiziDLL.links stop stop_next stop_prev **
    XiziDLL.dllseg first prev stop last (prefix ++ anchor :: suffix)).
  {
    induction prefix as [|node prefix IH];
      intros first prev anchor old_prev next stop last suffix stop_next stop_prev
        Hanchor_nonnull Hanchor_stop.
    - simpl.
      unfold XiziDLL.dllseg at 1. simpl. Intros.
      destruct H as [Hfirst Hprev]. subst first; subst prev.
      unfold XiziDLL.dllseg at 1. simpl. unfold XiziDLL.links.
      Exists next. entailer!.
    - simpl app. unfold XiziDLL.dllseg at 1. simpl.
      Intros first_next. Intros.
      fold (XiziDLL.dllseg first_next first anchor old_prev prefix).
      prop_apply_p (Hlinksneq stop stop_next stop_prev first first_next prev).
      Intros.
      rewrite (logic_equiv_sepcon_swap
        (XiziDLL.links stop stop_next stop_prev)
        (XiziDLL.links first first_next prev)
        (XiziDLL.dllseg first_next first anchor old_prev prefix **
         (XiziDLL.links anchor next old_prev **
          XiziDLL.dllseg next anchor stop last suffix))).
      rewrite (IH first_next first anchor old_prev next stop last suffix
        stop_next stop_prev Hanchor_nonnull Hanchor_stop).
      simpl. Exists first_next. unfold XiziDLL.links. entailer!.
  }
  left.
  pre_process.
  subst nodes_after.
  let A := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) in
  let B := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) in
  lazymatch goal with | |- context [A ** (B ** ?R)] =>
    rewrite (logic_equiv_sepcon_assoc A B R) end.
  fold (XiziDLL.links head first last).
  let A := constr:(&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_node_pre) in
  let B := constr:(&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> old_prev) in
  lazymatch goal with | |- context [A ** (B ** ?R)] =>
    rewrite (logic_equiv_sepcon_assoc A B R) end.
  fold (XiziDLL.links linklist_pre linklist_node_pre old_prev).
  let A := constr:(&(old_next # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_next) in
  let B := constr:(&(old_next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_node_pre) in
  lazymatch goal with | |- context [A ** (B ** ?R)] =>
    rewrite (logic_equiv_sepcon_assoc A B R) end.
  fold (XiziDLL.links old_next next_next linklist_node_pre).
  fold (XiziDLL.links linklist_node_pre old_next linklist_pre).
  prop_apply_p (Hlinksneq head first last old_next next_next linklist_node_pre). Intros.
  prop_apply_p (Hlinksneq head first last linklist_node_pre old_next linklist_pre). Intros.
  prop_apply_p (Hlinksneq head first last linklist_pre linklist_node_pre old_prev). Intros.
  unfold xizi_dllseg.
  sep_apply_l_atomic (Hcons old_next linklist_node_pre next_next head last rest
    PreH4 (ltac:(congruence))).
  sep_apply_l_atomic (Hcons linklist_node_pre linklist_pre old_next head last
    (old_next :: rest) PreH3 (ltac:(congruence))).
  unfold xizi_double_link_insert_after_nodes.
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.dllseg linklist_node_pre linklist_pre head last
      (linklist_node_pre :: old_next :: rest))
    (XiziDLL.links head first last)
    (XiziDLL.links linklist_pre linklist_node_pre old_prev **
     XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.dllseg linklist_node_pre linklist_pre head last
      (linklist_node_pre :: old_next :: rest))
    (XiziDLL.links linklist_pre linklist_node_pre old_prev)
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_comm
    (XiziDLL.dllseg linklist_node_pre linklist_pre head last
      (linklist_node_pre :: old_next :: rest))
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.links linklist_pre linklist_node_pre old_prev)
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)
    (XiziDLL.dllseg linklist_node_pre linklist_pre head last
      (linklist_node_pre :: old_next :: rest))).
  rewrite (Hmerge nodes_before first head linklist_pre old_prev linklist_node_pre
    head last (linklist_node_pre :: old_next :: rest) first last PreH2
    (ltac:(congruence))).
  apply xizi_dll_close.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_2 : xizi_double_link_insert_after_return_wit_2.
Proof.
  assert (Hlinksneq : forall p pnext pprev q qnext qprev,
    XiziDLL.links p pnext pprev ** XiziDLL.links q qnext qprev |-- “ p <> q ”).
  {
    intros p pnext pprev q qnext qprev.
    unfold XiziDLL.links. sepcon_assoc_change.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      rewrite (logic_equiv_sepcon_swap
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext)
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
      prop_apply_p (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hsingle : forall node prev stop,
    node <> NULL -> node <> stop ->
    XiziDLL.links node stop prev |--
    XiziDLL.dllseg node prev stop node ((node :: nil)%list)).
  {
    intros node prev stop Hnonnull Hstop.
    simpl. Exists stop. entailer!.
  }
  assert (Hmerge : forall prefix first prev anchor old_prev next stop last suffix stop_next stop_prev,
    anchor <> NULL -> anchor <> stop ->
    XiziDLL.links stop stop_next stop_prev **
    (XiziDLL.dllseg first prev anchor old_prev prefix **
     (XiziDLL.links anchor next old_prev **
      XiziDLL.dllseg next anchor stop last suffix)) |--
    XiziDLL.links stop stop_next stop_prev **
    XiziDLL.dllseg first prev stop last (prefix ++ anchor :: suffix)).
  {
    induction prefix as [|node prefix IH];
      intros first prev anchor old_prev next stop last suffix stop_next stop_prev
        Hanchor_nonnull Hanchor_stop.
    - simpl. unfold XiziDLL.dllseg at 1. simpl. Intros.
      destruct H as [Hfirst Hprev]. subst first; subst prev.
      unfold XiziDLL.dllseg at 1. simpl. unfold XiziDLL.links.
      Exists next. entailer!.
    - simpl app. unfold XiziDLL.dllseg at 1. simpl.
      Intros first_next. Intros.
      fold (XiziDLL.dllseg first_next first anchor old_prev prefix).
      prop_apply_p (Hlinksneq stop stop_next stop_prev first first_next prev). Intros.
      rewrite (logic_equiv_sepcon_swap
        (XiziDLL.links stop stop_next stop_prev)
        (XiziDLL.links first first_next prev)
        (XiziDLL.dllseg first_next first anchor old_prev prefix **
         (XiziDLL.links anchor next old_prev **
          XiziDLL.dllseg next anchor stop last suffix))).
      rewrite (IH first_next first anchor old_prev next stop last suffix
        stop_next stop_prev Hanchor_nonnull Hanchor_stop).
      simpl. Exists first_next. unfold XiziDLL.links. entailer!.
  }
  left.
  pre_process.
  subst nodes_after.
  let HN := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) in
  let HP := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_node_pre) in
  let AN := constr:(&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_node_pre) in
  let AP := constr:(&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> old_prev) in
  let IN := constr:(&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head) in
  let IP := constr:(&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> linklist_pre) in
  let P := constr:(xizi_dllseg first head linklist_pre old_prev nodes_before) in
  rewrite (logic_equiv_sepcon_swap AP HP (IN ** IP));
  rewrite (logic_equiv_sepcon_swap AN HP (AP ** (IN ** IP)));
  rewrite (logic_equiv_sepcon_swap P HP (AN ** (AP ** (IN ** IP))));
  rewrite (logic_equiv_sepcon_assoc HN HP (P ** (AN ** (AP ** (IN ** IP)))));
  rewrite (logic_equiv_sepcon_assoc AN AP (IN ** IP)).
  fold (XiziDLL.links head first linklist_node_pre).
  fold (XiziDLL.links linklist_pre linklist_node_pre old_prev).
  fold (XiziDLL.links linklist_node_pre head linklist_pre).
  prop_apply_p (Hlinksneq head first linklist_node_pre linklist_node_pre head linklist_pre). Intros.
  prop_apply_p (Hlinksneq head first linklist_node_pre linklist_pre linklist_node_pre old_prev). Intros.
  sep_apply_l_atomic (Hsingle linklist_node_pre linklist_pre head PreH3
    (ltac:(congruence))).
  unfold xizi_double_link_insert_after_nodes.
  unfold xizi_dllseg.
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.dllseg linklist_node_pre linklist_pre head linklist_node_pre
      ((linklist_node_pre :: nil)%list))
    (XiziDLL.links head first linklist_node_pre)
    (XiziDLL.links linklist_pre linklist_node_pre old_prev **
     XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.dllseg linklist_node_pre linklist_pre head linklist_node_pre
      ((linklist_node_pre :: nil)%list))
    (XiziDLL.links linklist_pre linklist_node_pre old_prev)
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_comm
    (XiziDLL.dllseg linklist_node_pre linklist_pre head linklist_node_pre
      ((linklist_node_pre :: nil)%list))
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)).
  rewrite (logic_equiv_sepcon_swap
    (XiziDLL.links linklist_pre linklist_node_pre old_prev)
    (XiziDLL.dllseg first head linklist_pre old_prev nodes_before)
    (XiziDLL.dllseg linklist_node_pre linklist_pre head linklist_node_pre
      ((linklist_node_pre :: nil)%list))).
  rewrite (Hmerge nodes_before first head linklist_pre old_prev linklist_node_pre
    head linklist_node_pre ((linklist_node_pre :: nil)%list) first linklist_node_pre
    PreH2 (ltac:(congruence))).
  apply xizi_dll_close.
Qed.
