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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last Require Import xizi_double_link_next_rec_last_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last Require Import xizi_double_link_next_rec_last_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last
      Require Import xizi_double_link_next_rec_last_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_rec_last_entail_wit_1 : xizi_double_link_next_rec_last_entail_wit_1.
Proof.
  pre_process.
  assert (Hlinksneq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
      “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      apply (derivable1_trans _
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev))).
      + entailer!.
      + eapply derivable1_trans.
        * apply derivable1_sepcon_mono.
          -- apply (dup_store_ptr
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
               pnext qnext).
          -- entailer!.
        * entailer!.
    - entailer!.
  }
  assert (Hsplit :
    forall first prev pivot stop last prefix suffix,
    xizi_dllseg first prev stop last (prefix ++ pivot :: suffix) |--
    EX pivot_prev next,
      xizi_dllseg first prev pivot pivot_prev prefix **
      xizi_dll_links pivot next pivot_prev **
      xizi_dllseg next pivot stop last suffix).
  {
    intros first0 prev0 pivot stop last0 prefix.
    revert first0 prev0.
    induction prefix as [| node prefix IH]; intros first0 prev0 suffix.
    - simpl.
      Intros next.
      Intros.
      subst first0.
      Exists prev0 next.
      simpl.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      subst first0.
      sep_apply_l_atomic (IH next node suffix).
      Intros pivot_prev pivot_next.
      apply (derivable1_trans _
        (xizi_dll_links node next prev0 **
         xizi_dll_links pivot pivot_next pivot_prev **
         xizi_dllseg next node pivot pivot_prev prefix **
         xizi_dllseg pivot_next pivot stop last0 suffix)).
      + entailer!.
      + prop_apply
          (Hlinksneq node pivot next prev0 pivot_next pivot_prev).
        Intros.
        Exists pivot_prev pivot_next.
        simpl.
        Exists next.
        entailer!.
  }
  sep_apply_l_atomic (xizi_dll_open linklist_pre
    (nodes_before ++ linklist_node_pre :: nodes_after)).
  Intros first last.
  sep_apply_l_atomic
    (Hsplit first linklist_pre linklist_node_pre linklist_pre last
      nodes_before nodes_after).
  Intros node_prev node_next.
  Exists node_next node_prev last first.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  pre_process.
  assert (Hlinksneq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
      “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      apply (derivable1_trans _
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev))).
      + entailer!.
      + eapply derivable1_trans.
        * apply derivable1_sepcon_mono.
          -- apply (dup_store_ptr
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
               pnext qnext).
          -- entailer!.
        * entailer!.
    - entailer!.
  }
  assert (Hjoin :
    forall stop stop_next stop_prev first prev pivot pivot_prev next last
      prefix suffix,
      pivot <> NULL ->
      xizi_dll_links stop stop_next stop_prev **
      xizi_dllseg first prev pivot pivot_prev prefix **
      xizi_dll_links pivot next pivot_prev **
      xizi_dllseg next pivot stop last suffix |--
      xizi_dll_links stop stop_next stop_prev **
      xizi_dllseg first prev stop last (prefix ++ pivot :: suffix)).
  {
    intros stop stop_next stop_prev first0 prev0 pivot pivot_prev next last0
      prefix.
    revert first0 prev0.
    induction prefix as [| node prefix IH]; intros first0 prev0 suffix Hnonnull.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first0; subst pivot_prev.
      prop_apply (Hlinksneq stop pivot stop_next stop_prev next prev0).
      Intros.
      simpl.
      Exists next.
      entailer!.
    - simpl.
      Intros first_next.
      Intros.
      subst first0.
      apply (derivable1_trans _
        (xizi_dll_links node first_next prev0 **
         (xizi_dll_links stop stop_next stop_prev **
          xizi_dllseg first_next node pivot pivot_prev prefix **
          xizi_dll_links pivot next pivot_prev **
          xizi_dllseg next pivot stop last0 suffix))).
      + entailer!.
      + sep_apply_l_atomic (IH first_next node suffix Hnonnull).
        apply (derivable1_trans _
          (xizi_dll_links node first_next prev0 **
           xizi_dll_links stop stop_next stop_prev **
           xizi_dllseg first_next node stop last0
             (prefix ++ pivot :: suffix))).
        * entailer!.
        * prop_apply
            (Hlinksneq node stop first_next prev0 stop_next stop_prev).
          Intros.
          simpl.
          Exists first_next.
          entailer!.
  }
  subst node_next.
  destruct nodes_after as [| after_node after_rest].
  - simpl xizi_double_link_next_rec_last_value.
    simpl xizi_dllseg.
    Intros.
    destruct H as [Hstop Hlast].
    subst last.
    apply (derivable1_trans _
      (xizi_dll_links linklist_pre first linklist_node_pre **
       xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
       xizi_dll_links linklist_node_pre linklist_pre node_prev **
       xizi_dllseg linklist_pre linklist_node_pre linklist_pre
         linklist_node_pre nil)).
    + unfold xizi_dll_links, XiziDLL.links.
      simpl.
      entailer!.
    + sep_apply_l_atomic
        (Hjoin linklist_pre first linklist_node_pre first linklist_pre
          linklist_node_pre node_prev linklist_pre linklist_node_pre
          nodes_before nil PreH2).
    sep_apply_l_atomic
      (xizi_dll_close linklist_pre first linklist_node_pre
        (nodes_before ++ linklist_node_pre :: nil)).
    entailer!.
  - simpl xizi_dllseg.
    Intros after_next.
    Intros.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  pre_process.
  assert (Hlinksneq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev ** xizi_dll_links q qnext qprev |--
      “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      apply (derivable1_trans _
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pprev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qprev))).
      + entailer!.
      + eapply derivable1_trans.
        * apply derivable1_sepcon_mono.
          -- apply (dup_store_ptr
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
               pnext qnext).
          -- entailer!.
        * entailer!.
    - entailer!.
  }
  assert (Hjoin :
    forall stop stop_next stop_prev first prev pivot pivot_prev next last
      prefix suffix,
      pivot <> NULL ->
      xizi_dll_links stop stop_next stop_prev **
      xizi_dllseg first prev pivot pivot_prev prefix **
      xizi_dll_links pivot next pivot_prev **
      xizi_dllseg next pivot stop last suffix |--
      xizi_dll_links stop stop_next stop_prev **
      xizi_dllseg first prev stop last (prefix ++ pivot :: suffix)).
  {
    intros stop stop_next stop_prev first0 prev0 pivot pivot_prev next last0
      prefix.
    revert first0 prev0.
    induction prefix as [| node prefix IH]; intros first0 prev0 suffix Hnonnull.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first0; subst pivot_prev.
      prop_apply (Hlinksneq stop pivot stop_next stop_prev next prev0).
      Intros.
      simpl.
      Exists next.
      entailer!.
    - simpl.
      Intros first_next.
      Intros.
      subst first0.
      apply (derivable1_trans _
        (xizi_dll_links node first_next prev0 **
         (xizi_dll_links stop stop_next stop_prev **
          xizi_dllseg first_next node pivot pivot_prev prefix **
          xizi_dll_links pivot next pivot_prev **
          xizi_dllseg next pivot stop last0 suffix))).
      + entailer!.
      + sep_apply_l_atomic (IH first_next node suffix Hnonnull).
        apply (derivable1_trans _
          (xizi_dll_links node first_next prev0 **
           xizi_dll_links stop stop_next stop_prev **
           xizi_dllseg first_next node stop last0
             (prefix ++ pivot :: suffix))).
        * entailer!.
        * prop_apply
            (Hlinksneq node stop first_next prev0 stop_next stop_prev).
          Intros.
          simpl.
          Exists first_next.
          entailer!.
  }
  destruct nodes_after as [| after_node after_rest].
  - simpl xizi_double_link_next_rec_last_value.
    simpl xizi_dllseg.
    Intros.
    entailer!.
  - simpl xizi_double_link_next_rec_last_value.
    simpl xizi_dllseg.
    Intros after_next.
    Intros.
    subst after_node.
    apply (derivable1_trans _
      (xizi_dll_links linklist_pre first last **
       xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
       xizi_dll_links linklist_node_pre node_next node_prev **
       xizi_dllseg node_next linklist_node_pre linklist_pre last
         (node_next :: after_rest))).
    + unfold xizi_dll_links, XiziDLL.links.
      simpl.
      Exists after_next.
      entailer!.
    + sep_apply_l_atomic
        (Hjoin linklist_pre first last first linklist_pre
          linklist_node_pre node_prev node_next last
          nodes_before (node_next :: after_rest) PreH2).
    sep_apply_l_atomic
      (xizi_dll_close linklist_pre first last
        (nodes_before ++ linklist_node_pre :: node_next :: after_rest)).
    entailer!.
Qed.
