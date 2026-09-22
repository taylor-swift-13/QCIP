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
  right.
  intros linklist_node_pre linklist_pre nodes_after nodes_before
         first last Hhead Hnode.
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev **
      xizi_dll_links q qnext qprev |-- “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      eapply derivable1_trans with
        (y :=
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext) **
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
          TT).
      + cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext).
        cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext).
        entailer!.
      + sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
             pnext qnext).
        entailer!.
    - entailer!.
  }
  assert (Hsplit :
    forall first prev stop last prefix suffix,
      xizi_dllseg first prev stop last
        (prefix ++ linklist_node_pre :: suffix) |--
      EX node_prev node_next,
        xizi_dllseg first prev linklist_node_pre node_prev prefix **
        xizi_dll_links linklist_node_pre node_next node_prev **
        xizi_dllseg node_next linklist_node_pre stop last suffix).
  {
    intros first0 prev stop last0 prefix.
    revert first0 prev.
    induction prefix as [| expected prefix IH]; intros first0 prev suffix.
    - simpl.
      Intros node_next.
      Intros.
      subst first0.
      Exists prev node_next.
      simpl.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      sep_apply (IH next first0 suffix).
      Intros node_prev node_next.
      fold xizi_dll_links.
      prop_apply
        (Hlinks_neq first0 linklist_node_pre next prev
           node_next node_prev).
      Intros.
      Exists node_prev node_next.
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  sep_apply (Hsplit first linklist_pre linklist_pre last nodes_before nodes_after).
  Intros node_prev node_next.
  Exists node_next node_prev.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  left.
  intros node head nodes_after nodes_before first last node_prev node_next
         Hnext Hnode.
  subst node_next.
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev **
      xizi_dll_links q qnext qprev |-- “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      eapply derivable1_trans with
        (y :=
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext) **
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
          TT).
      + cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext).
        cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext).
        entailer!.
      + sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
             pnext qnext).
        entailer!.
    - entailer!.
  }
  assert (Hjoin :
    forall head_first head_last seg_first start_prev seg_prev prefix suffix,
      xizi_dll_links head head_first head_last **
      xizi_dllseg seg_first start_prev node seg_prev prefix **
      xizi_dll_links node head seg_prev **
      xizi_dllseg head node head head_last suffix |--
      xizi_dll_links head head_first head_last **
      xizi_dllseg seg_first start_prev head head_last
        (prefix ++ node :: suffix)).
  {
    intros head_first head_last seg_first start_prev seg_prev prefix.
    revert seg_first start_prev.
    induction prefix as [| expected prefix IH];
      intros seg_first start_prev suffix.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst seg_first; subst seg_prev.
      fold xizi_dll_links.
      prop_apply
        (Hlinks_neq head node head_first head_last head start_prev).
      Intros.
      simpl.
      Exists head.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      fold xizi_dll_links.
      prop_apply
        (Hlinks_neq head seg_first head_first head_last next start_prev).
      Intros.
      sep_apply (IH next seg_first suffix).
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  destruct nodes_after as [| after_head after_tail].
  -
    eapply derivable1_trans with
      (y :=
        xizi_dll_links head first last **
        xizi_dllseg first head node node_prev nodes_before **
        xizi_dll_links node head node_prev **
        xizi_dllseg head node head last nil).
    + unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    +
    sep_apply (Hjoin first last first head node_prev nodes_before nil).
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    simpl xizi_double_link_next_rec_last_value.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - simpl.
    Intros next.
    Intros.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  left.
  intros node head nodes_after nodes_before first last node_prev node_next
         Hnext Hnode.
  assert (Hlinks_neq :
    forall p q pnext pprev qnext qprev,
      xizi_dll_links p pnext pprev **
      xizi_dll_links q qnext qprev |-- “ p <> q ”).
  {
    intros p q pnext pprev qnext qprev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      eapply derivable1_trans with
        (y :=
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext) **
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext) **
          TT).
      + cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pnext).
        cancel
          (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qnext).
        entailer!.
      + sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
             pnext qnext).
        entailer!.
    - entailer!.
  }
  destruct nodes_after as [| after_head after_tail].
  - simpl.
    Intros.
    entailer!.
  - simpl.
    Intros after_next.
    Intros.
    subst after_head.
    assert (Hjoin :
      forall seg_first start_prev seg_prev prefix,
        xizi_dll_links head first last **
        xizi_dllseg seg_first start_prev node seg_prev prefix **
        xizi_dll_links node node_next seg_prev **
        xizi_dll_links node_next after_next node **
        xizi_dllseg after_next node_next head last after_tail |--
        xizi_dll_links head first last **
        xizi_dllseg seg_first start_prev head last
          (prefix ++ node :: node_next :: after_tail)).
    {
      intros seg_first start_prev seg_prev prefix.
      revert seg_first start_prev.
      induction prefix as [| expected prefix IH];
      intros seg_first start_prev.
      - simpl.
        Intros_p Hbase.
        destruct Hbase as [Hfirst Hprev].
        subst seg_first; subst seg_prev.
        fold xizi_dll_links.
        prop_apply
          (Hlinks_neq head node first last node_next start_prev).
        Intros.
        simpl.
        Exists node_next.
        Exists after_next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
      - simpl.
        Intros next.
        Intros.
        fold xizi_dll_links.
        prop_apply
          (Hlinks_neq head seg_first first last next start_prev).
        Intros.
        sep_apply (IH next seg_first).
        simpl.
        Exists next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
    }
    eapply derivable1_trans with
      (y :=
        xizi_dll_links head first last **
        xizi_dllseg first head node node_prev nodes_before **
        xizi_dll_links node node_next node_prev **
        xizi_dll_links node_next after_next node **
        xizi_dllseg after_next node_next head last after_tail).
    + unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + sep_apply (Hjoin first head node_prev nodes_before).
      unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      simpl xizi_double_link_next_rec_last_value.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
Qed.
