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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next Require Import xizi_double_link_next_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next Require Import xizi_double_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next Require Import xizi_double_link_next_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_entail_wit_1 : xizi_double_link_next_entail_wit_1.
Proof.
  unfold xizi_double_link_next_entail_wit_1.
  right.
  intros linklist_node_pre linklist_pre nodes_after nodes_before
         first last Hnode_nonnull.
  assert (Hfocus :
    forall first0 prev0 last0 before0,
      xizi_dllseg first0 prev0 linklist_pre last0
        (before0 ++ linklist_node_pre :: nodes_after) |--
      EX node_next node_prev,
        “ linklist_node_pre <> 0 ” &&
        xizi_dllseg first0 prev0 linklist_node_pre node_prev before0 **
        xizi_dll_links linklist_node_pre node_next node_prev **
        xizi_dllseg node_next linklist_node_pre linklist_pre last0 nodes_after).
  {
    intros first0 prev0 last0 before0.
    revert first0 prev0.
    induction before0 as [| current before0 IH]; intros first0 prev0.
    - simpl.
      Intros node_next.
      subst first0.
      Exists node_next prev0.
      simpl.
      entailer!.
    - simpl.
      Intros next.
      subst first0.
      sep_apply (IH next current).
      Intros node_next node_prev.
      destruct (Z.eq_dec current linklist_node_pre) as [Heq | Hneq].
      + subst current.
        unfold xizi_dll_links, XiziDLL.links.
        cbn [XiziDoubleLinkLayout.struct_name
             XiziDoubleLinkLayout.next_field
             XiziDoubleLinkLayout.prev_field].
        set_String_name.
        let p1 := constr:(&(linklist_node_pre # s ->ₛ s0) # Ptr |-> next) in
        let p2 := constr:(&(linklist_node_pre # s ->ₛ s0) # Ptr |-> node_next) in
        L_sepcon_lift' p1;
        lazymatch goal with
        | |- ?p1x ** (?prefix ** (?p2x ** ?rest)) |-- _ =>
            rewrite (logic_equiv_sepcon_swap prefix p2x rest)
        end;
        prop_apply_p
          (dup_store_ptr
             (&(linklist_node_pre # s ->ₛ s0))
             next node_next).
        Intros.
        contradiction.
      + Exists node_next node_prev.
        simpl.
        Exists next.
        entailer!.
  }
  unfold xizi_dll_links, XiziDLL.links in Hfocus.
  cbn [XiziDoubleLinkLayout.struct_name
       XiziDoubleLinkLayout.next_field
       XiziDoubleLinkLayout.prev_field] in Hfocus.
  sep_apply (Hfocus first linklist_pre last nodes_before).
  Intros node_next node_prev.
  Exists node_next node_prev.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Proof.
  unfold xizi_double_link_next_return_wit_1.
  left.
  intros target head nodes_after nodes_before first last node_next node_prev
         Hnext Htarget_nonnull.
  subst node_next.
  destruct nodes_after as [| after_head after_tail].
  - simpl.
    Intros.
    destruct H as [_ Hlast].
    subst last.
    assert (Hjoin :
      forall first0 prev0 before0,
        xizi_dll_links head first target **
        (xizi_dllseg first0 prev0 target node_prev before0 **
         xizi_dll_links target head node_prev) |--
        xizi_dll_links head first target **
        xizi_dllseg first0 prev0 head target (before0 ++ target :: nil)).
    {
      intros first0 prev0 before0.
      revert first0 prev0.
      induction before0 as [| current before0 IH]; intros first0 prev0.
      - simpl.
        Intros.
        destruct H as [Hfirst Hprev].
        subst first0; subst node_prev.
        destruct (Z.eq_dec target head) as [Heq | Hneq].
        + subst target.
          unfold xizi_dll_links, XiziDLL.links.
          cbn [XiziDoubleLinkLayout.struct_name
               XiziDoubleLinkLayout.next_field
               XiziDoubleLinkLayout.prev_field].
          set_String_name.
          let p2 := constr:(&(head # s ->ₛ s0) # Ptr |-> head) in
          L_sepcon_lift' p2;
          sep_apply (dup_store_ptr (&(head # s ->ₛ s0)) head first).
          Intros.
          contradiction.
        + Exists head.
          entailer!.
      - simpl.
        Intros next.
        subst first0.
        destruct (Z.eq_dec current head) as [Heq | Hneq].
        + subst current.
          unfold xizi_dll_links, XiziDLL.links.
          cbn [XiziDoubleLinkLayout.struct_name
               XiziDoubleLinkLayout.next_field
               XiziDoubleLinkLayout.prev_field].
          set_String_name.
          repeat rewrite <- logic_equiv_sepcon_assoc.
          let p2 := constr:(&(head # s ->ₛ s0) # Ptr |-> first) in
          L_sepcon_lift' p2;
          sep_apply (dup_store_ptr (&(head # s ->ₛ s0)) first next).
          Intros.
          contradiction.
        + rewrite (logic_equiv_sepcon_comm
                     (xizi_dll_links target head node_prev)
                     (xizi_dll_links head first target)).
          rewrite (logic_equiv_sepcon_swap
                     (xizi_dllseg next current target node_prev before0)
                     (xizi_dll_links head first target)
                     (xizi_dll_links target head node_prev)).
          rewrite (logic_equiv_sepcon_comm
                     (XiziDLL.links current next prev0)
                     (xizi_dll_links head first target **
                      (xizi_dllseg next current target node_prev before0 **
                       xizi_dll_links target head node_prev))).
          eapply derivable1_trans.
          { eapply derivable1_sepcon_mono.
            - exact (IH next current).
            - apply derivable1_refl. }
          {
            repeat rewrite <- logic_equiv_sepcon_assoc.
            let pc := constr:(XiziDLL.links current next prev0) in
            L_sepcon_lift' pc;
            rewrite (logic_equiv_sepcon_comm
                       (xizi_dll_links head first target)
                       (xizi_dllseg next current head target
                          (before0 ++ target :: nil))).
            simpl.
            Exists next.
            entailer!.
          }
    }
    rewrite logic_equiv_sepcon_assoc.
    eapply derivable1_trans.
    { exact (Hjoin first head nodes_before). }
    { sep_apply xizi_dll_close.
      entailer!. }
  - simpl.
    Intros next.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.
Proof.
  unfold xizi_double_link_next_return_wit_2.
  left.
  intros target head nodes_after nodes_before first last node_next node_prev
         Hnext_nonhead Htarget_nonnull.
  assert (Hvalue :
    xizi_dllseg node_next target head last nodes_after |--
    “ node_next = xizi_double_link_next_value nodes_after ”).
  {
    destruct nodes_after as [| expected rest].
    - simpl.
      Intros.
      destruct H as [Heq _].
      contradiction.
    - simpl.
      Intros next.
      entailer!.
  }
  assert (Hjoin :
    forall first0 prev0 before0,
      xizi_dll_links head first last **
      (xizi_dllseg first0 prev0 target node_prev before0 **
       (xizi_dll_links target node_next node_prev **
        xizi_dllseg node_next target head last nodes_after)) |--
      xizi_dll_links head first last **
      xizi_dllseg first0 prev0 head last
        (before0 ++ target :: nodes_after)).
  {
    intros first0 prev0 before0.
    revert first0 prev0.
    induction before0 as [| current before0 IH]; intros first0 prev0.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first0; subst node_prev.
      destruct (Z.eq_dec target head) as [Heq | Hneq].
      + subst target.
        unfold xizi_dll_links, XiziDLL.links.
        cbn [XiziDoubleLinkLayout.struct_name
             XiziDoubleLinkLayout.next_field
             XiziDoubleLinkLayout.prev_field].
        set_String_name.
        repeat rewrite <- logic_equiv_sepcon_assoc.
        let p2 := constr:(&(head # s ->ₛ s0) # Ptr |-> node_next) in
        L_sepcon_lift' p2;
        sep_apply (dup_store_ptr (&(head # s ->ₛ s0)) node_next first).
        Intros.
        contradiction.
      + Exists node_next.
        entailer!.
    - simpl.
      Intros next.
      subst first0.
      destruct (Z.eq_dec current head) as [Heq | Hneq].
      + subst current.
        unfold xizi_dll_links, XiziDLL.links.
        cbn [XiziDoubleLinkLayout.struct_name
             XiziDoubleLinkLayout.next_field
             XiziDoubleLinkLayout.prev_field].
        set_String_name.
        repeat rewrite <- logic_equiv_sepcon_assoc.
        let p2 := constr:(&(head # s ->ₛ s0) # Ptr |-> first) in
        L_sepcon_lift' p2;
        sep_apply (dup_store_ptr (&(head # s ->ₛ s0)) first next).
        Intros.
        contradiction.
      + rewrite (logic_equiv_sepcon_comm
                   (xizi_dllseg node_next target head last nodes_after)
                   (xizi_dll_links head first last)).
        rewrite (logic_equiv_sepcon_swap
                   (xizi_dll_links target node_next node_prev)
                   (xizi_dll_links head first last)
                   (xizi_dllseg node_next target head last nodes_after)).
        rewrite (logic_equiv_sepcon_swap
                   (xizi_dllseg next current target node_prev before0)
                   (xizi_dll_links head first last)
                   (xizi_dll_links target node_next node_prev **
                    xizi_dllseg node_next target head last nodes_after)).
        rewrite (logic_equiv_sepcon_comm
                   (XiziDLL.links current next prev0)
                   (xizi_dll_links head first last **
                    (xizi_dllseg next current target node_prev before0 **
                     (xizi_dll_links target node_next node_prev **
                      xizi_dllseg node_next target head last nodes_after)))).
        eapply derivable1_trans.
        { eapply derivable1_sepcon_mono.
          - exact (IH next current).
          - apply derivable1_refl. }
        {
          repeat rewrite <- logic_equiv_sepcon_assoc.
          let pc := constr:(XiziDLL.links current next prev0) in
          L_sepcon_lift' pc;
          rewrite (logic_equiv_sepcon_comm
                     (xizi_dll_links head first last)
                     (xizi_dllseg next current head last
                        (before0 ++ target :: nodes_after))).
          simpl.
          Exists next.
          entailer!.
        }
  }
  prop_apply_p Hvalue.
  Intros_p Hresult.
  repeat rewrite <- logic_equiv_sepcon_assoc.
  let psn := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) in
  let psp := constr:(&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) in
  let ptn := constr:(&(target # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) in
  let ptp := constr:(&(target # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev) in
  L_sepcon_lift' ptp;
  L_sepcon_lift' ptn;
  L_sepcon_lift' (xizi_dllseg first head target node_prev nodes_before);
  L_sepcon_lift' psp;
  L_sepcon_lift' psn;
  rewrite (logic_equiv_sepcon_assoc ptn ptp
             (xizi_dllseg node_next target head last nodes_after));
  rewrite (logic_equiv_sepcon_assoc psn psp
             (xizi_dllseg first head target node_prev nodes_before **
              ((ptn ** ptp) **
               xizi_dllseg node_next target head last nodes_after))).
  eapply derivable1_trans.
  { exact (Hjoin first head nodes_before). }
  { sep_apply xizi_dll_close.
    entailer!. }
Qed.
