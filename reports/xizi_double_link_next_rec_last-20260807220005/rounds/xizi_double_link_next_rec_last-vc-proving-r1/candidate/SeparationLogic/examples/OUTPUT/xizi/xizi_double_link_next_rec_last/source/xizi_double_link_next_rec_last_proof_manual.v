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

Lemma proof_of_xizi_double_link_next_rec_last_entail_wit_1 : xizi_double_link_next_rec_last_entail_wit_1.
Proof.
  assert (Hnext_neq :
    forall p q pnext qnext,
    &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
    &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext |--
    “ p <> q ”).
  {
    intros.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      sep_apply
        (dup_store_ptr
           (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
           pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
    xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    eapply derivable1_trans with
      (y :=
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
    - entailer!.
    - prop_apply (Hnext_neq p q pnext qnext).
      Intros.
      entailer!.
  }
  assert (Hright_framed :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    R ** (xizi_dll_links p pnext pprev **
          (S ** XiziDLL.links q qnext qprev)) |-- “ p <> q ”).
  {
    intros.
    eapply derivable1_trans with
      (y :=
        (xizi_dll_links p pnext pprev **
         xizi_dll_links q qnext qprev) ** (R ** S)).
    - entailer!.
    - prop_apply (Hlinks_neq p q pnext pprev qnext qprev).
      Intros.
      entailer!.
  }
  assert (Hright_framed_keep :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    R ** (xizi_dll_links p pnext pprev **
          (S ** XiziDLL.links q qnext qprev)) |--
    “ p <> q ” &&
    (R ** (xizi_dll_links p pnext pprev **
           (S ** XiziDLL.links q qnext qprev)))).
  {
    intros.
    apply derivable1s_truep_intros.
    - apply Hright_framed.
    - apply derivable1_refl.
  }
  assert (Hsplit :
    forall before first prev stop current last after,
    xizi_dllseg first prev stop last (before ++ current :: after) |--
    EX node_next node_prev,
      xizi_dllseg first prev current node_prev before **
      xizi_dll_links current node_next node_prev **
      xizi_dllseg node_next current stop last after).
  {
    induction before as [| a before IH]; intros.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros node_next.
      Intros.
      subst first.
      Exists node_next prev.
      simpl.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst first.
      sep_apply (IH next a stop current last after).
      Intros node_next node_prev.
      eapply derivable1_trans.
      + apply
          (Hright_framed_keep current a node_next node_prev next prev
             (xizi_dllseg next a current node_prev before)
             (xizi_dllseg node_next current stop last after)).
      + Intros.
        Exists node_next node_prev.
        simpl.
        Exists next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
    all: try entailer!.
  }
  pre_process.
  sep_apply
    (xizi_dll_open linklist_pre
       (nodes_before ++ linklist_node_pre :: nodes_after)).
  Intros first last.
  sep_apply
    (Hsplit nodes_before first linklist_pre linklist_pre
       linklist_node_pre last nodes_after).
  Intros node_next node_prev.
  Exists node_next node_prev last first.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  assert (Hnext_neq :
    forall p q pnext qnext,
    &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
    &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext |--
    “ p <> q ”).
  {
    intros.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      sep_apply
        (dup_store_ptr
           (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
           pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
    xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    eapply derivable1_trans with
      (y :=
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
    - entailer!.
    - prop_apply (Hnext_neq p q pnext qnext).
      Intros.
      entailer!.
  }
  assert (Hfront_framed :
    forall p q pnext pprev qnext qprev (S : Assertion),
    xizi_dll_links q qnext qprev **
    (xizi_dll_links p pnext pprev ** S) |-- “ p <> q ”).
  {
    intros.
    eapply derivable1_trans with
      (y :=
        (xizi_dll_links p pnext pprev **
         xizi_dll_links q qnext qprev) ** S).
    - entailer!.
    - prop_apply (Hlinks_neq p q pnext pprev qnext qprev).
      Intros.
      entailer!.
  }
  assert (Hfront_framed_keep :
    forall p q pnext pprev qnext qprev (S : Assertion),
    xizi_dll_links q qnext qprev **
    (xizi_dll_links p pnext pprev ** S) |--
    “ p <> q ” &&
    (xizi_dll_links q qnext qprev **
     (xizi_dll_links p pnext pprev ** S))).
  {
    intros.
    apply derivable1s_truep_intros.
    - apply Hfront_framed.
    - apply derivable1_refl.
  }
  assert (Hmiddle_framed :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    XiziDLL.links p pnext pprev **
    (R ** (xizi_dll_links q qnext qprev ** S)) |-- “ p <> q ”).
  {
    intros.
    eapply derivable1_trans with
      (y :=
        (xizi_dll_links p pnext pprev **
         xizi_dll_links q qnext qprev) ** (R ** S)).
    - entailer!.
    - prop_apply (Hlinks_neq p q pnext pprev qnext qprev).
      Intros.
      entailer!.
  }
  assert (Hmiddle_framed_keep :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    XiziDLL.links p pnext pprev **
    (R ** (xizi_dll_links q qnext qprev ** S)) |--
    “ p <> q ” &&
    (XiziDLL.links p pnext pprev **
     (R ** (xizi_dll_links q qnext qprev ** S)))).
  {
    intros.
    apply derivable1s_truep_intros.
    - apply Hmiddle_framed.
    - apply derivable1_refl.
  }
  assert (Hrecompose :
    forall before stop sentinel_first first prefix_prev
           current node_prev next last after,
    current <> NULL ->
    xizi_dll_links stop sentinel_first last **
    xizi_dllseg first prefix_prev current node_prev before **
    xizi_dll_links current next node_prev **
    xizi_dllseg next current stop last after |--
    xizi_dll_links stop sentinel_first last **
    xizi_dllseg first prefix_prev stop last (before ++ current :: after)).
  {
    induction before as [| a before IH]; intros.
    - simpl.
      Intros.
      destruct H0 as [Hfirst Hprev].
      subst first; subst node_prev.
      eapply derivable1_trans.
      + apply
          (Hfront_framed_keep current stop next prefix_prev
             sentinel_first last
             (xizi_dllseg next current stop last after)).
      + Intros.
        unfold xizi_dll_links at 2.
        unfold XiziDLL.dllseg.
        simpl.
        Exists next.
        entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next0.
      Intros.
      subst first.
      eapply derivable1_trans.
      + apply
          (Hmiddle_framed_keep a stop next0 prefix_prev
             sentinel_first last
             (xizi_dllseg next0 a current node_prev before)
             (xizi_dll_links current next node_prev **
              xizi_dllseg next current stop last after)).
      + Intros.
        eapply derivable1_trans with
          (y :=
            XiziDLL.links a next0 prefix_prev **
            (xizi_dll_links stop sentinel_first last **
             xizi_dllseg next0 a current node_prev before **
             xizi_dll_links current next node_prev **
             xizi_dllseg next current stop last after)).
        * entailer!.
        * sep_apply
            (IH stop sentinel_first next0 a current node_prev next last after H).
          simpl.
          Exists next0.
          entailer!.
  }
  assert (Hvalue :
    forall node prev stop last nodes,
    node = stop ->
    xizi_dllseg node prev stop last nodes |--
    “ 0 = xizi_double_link_next_rec_last_value nodes ”).
  {
    intros; subst node.
    destruct nodes as [| expected rest].
    - simpl. entailer!.
    - simpl. Intros next. Intros. contradiction.
  }
  pre_process.
  fold XiziDLL.links.
  fold xizi_dll_links.
  prop_apply (Hvalue node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros.
  eapply derivable1_trans with
    (y :=
      xizi_dll_links linklist_pre first last **
      xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
      xizi_dll_links linklist_node_pre node_next node_prev **
      xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after).
  {
    entailer!.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    entailer!.
  }
  sep_apply
    (Hrecompose nodes_before linklist_pre first first linklist_pre
       linklist_node_pre node_prev node_next last nodes_after PreH3).
  sep_apply
    (xizi_dll_close linklist_pre first last
       (nodes_before ++ linklist_node_pre :: nodes_after) PreH2).
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  assert (Hnext_neq :
    forall p q pnext qnext,
    &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
    &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext |--
    “ p <> q ”).
  {
    intros.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      sep_apply
        (dup_store_ptr
           (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
           pnext qnext).
      entailer!.
    - entailer!.
  }
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
    xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    eapply derivable1_trans with
      (y :=
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
         &(q # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev)).
    - entailer!.
    - prop_apply (Hnext_neq p q pnext qnext).
      Intros.
      entailer!.
  }
  assert (Hfront_framed :
    forall p q pnext pprev qnext qprev (S : Assertion),
    xizi_dll_links q qnext qprev **
    (xizi_dll_links p pnext pprev ** S) |-- “ p <> q ”).
  {
    intros.
    eapply derivable1_trans with
      (y :=
        (xizi_dll_links p pnext pprev **
         xizi_dll_links q qnext qprev) ** S).
    - entailer!.
    - prop_apply (Hlinks_neq p q pnext pprev qnext qprev).
      Intros.
      entailer!.
  }
  assert (Hfront_framed_keep :
    forall p q pnext pprev qnext qprev (S : Assertion),
    xizi_dll_links q qnext qprev **
    (xizi_dll_links p pnext pprev ** S) |--
    “ p <> q ” &&
    (xizi_dll_links q qnext qprev **
     (xizi_dll_links p pnext pprev ** S))).
  {
    intros.
    apply derivable1s_truep_intros.
    - apply Hfront_framed.
    - apply derivable1_refl.
  }
  assert (Hmiddle_framed :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    XiziDLL.links p pnext pprev **
    (R ** (xizi_dll_links q qnext qprev ** S)) |-- “ p <> q ”).
  {
    intros.
    eapply derivable1_trans with
      (y :=
        (xizi_dll_links p pnext pprev **
         xizi_dll_links q qnext qprev) ** (R ** S)).
    - entailer!.
    - prop_apply (Hlinks_neq p q pnext pprev qnext qprev).
      Intros.
      entailer!.
  }
  assert (Hmiddle_framed_keep :
    forall p q pnext pprev qnext qprev (R S : Assertion),
    XiziDLL.links p pnext pprev **
    (R ** (xizi_dll_links q qnext qprev ** S)) |--
    “ p <> q ” &&
    (XiziDLL.links p pnext pprev **
     (R ** (xizi_dll_links q qnext qprev ** S)))).
  {
    intros.
    apply derivable1s_truep_intros.
    - apply Hmiddle_framed.
    - apply derivable1_refl.
  }
  assert (Hrecompose :
    forall before stop sentinel_first first prefix_prev
           current node_prev next last after,
    current <> NULL ->
    xizi_dll_links stop sentinel_first last **
    xizi_dllseg first prefix_prev current node_prev before **
    xizi_dll_links current next node_prev **
    xizi_dllseg next current stop last after |--
    xizi_dll_links stop sentinel_first last **
    xizi_dllseg first prefix_prev stop last (before ++ current :: after)).
  {
    induction before as [| a before IH]; intros.
    - simpl.
      Intros.
      destruct H0 as [Hfirst Hprev].
      subst first; subst node_prev.
      eapply derivable1_trans.
      + apply
          (Hfront_framed_keep current stop next prefix_prev
             sentinel_first last
             (xizi_dllseg next current stop last after)).
      + Intros.
        unfold xizi_dll_links at 2.
        unfold XiziDLL.dllseg.
        simpl.
        Exists next.
        entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next0.
      Intros.
      subst first.
      eapply derivable1_trans.
      + apply
          (Hmiddle_framed_keep a stop next0 prefix_prev
             sentinel_first last
             (xizi_dllseg next0 a current node_prev before)
             (xizi_dll_links current next node_prev **
              xizi_dllseg next current stop last after)).
      + Intros.
        eapply derivable1_trans with
          (y :=
            XiziDLL.links a next0 prefix_prev **
            (xizi_dll_links stop sentinel_first last **
             xizi_dllseg next0 a current node_prev before **
             xizi_dll_links current next node_prev **
             xizi_dllseg next current stop last after)).
        * entailer!.
        * sep_apply
            (IH stop sentinel_first next0 a current node_prev next last after H).
          simpl.
          Exists next0.
          entailer!.
  }
  assert (Hvalue :
    forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ node = xizi_double_link_next_rec_last_value nodes ”).
  {
    intros.
    destruct nodes as [| expected rest].
    - simpl. Intros. destruct H0. contradiction.
    - simpl. Intros next. Intros. subst expected. entailer!.
  }
  pre_process.
  fold XiziDLL.links.
  fold xizi_dll_links.
  prop_apply (Hvalue node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros.
  eapply derivable1_trans with
    (y :=
      xizi_dll_links linklist_pre first last **
      xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
      xizi_dll_links linklist_node_pre node_next node_prev **
      xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after).
  {
    entailer!.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    entailer!.
  }
  sep_apply
    (Hrecompose nodes_before linklist_pre first first linklist_pre
       linklist_node_pre node_prev node_next last nodes_after PreH3).
  sep_apply
    (xizi_dll_close linklist_pre first last
       (nodes_before ++ linklist_node_pre :: nodes_after) PreH2).
  entailer!.
Qed.
