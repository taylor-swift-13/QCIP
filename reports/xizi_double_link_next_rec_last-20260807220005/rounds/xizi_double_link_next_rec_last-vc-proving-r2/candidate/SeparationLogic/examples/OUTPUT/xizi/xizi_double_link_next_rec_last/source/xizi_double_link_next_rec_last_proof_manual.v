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
  assert (Hsplit : forall start prev stop last before focus after,
      XiziDLL.dllseg start prev stop last (before ++ focus :: after) |--
      EX focus_prev focus_next,
        XiziDLL.dllseg start prev focus focus_prev before **
        XiziDLL.links focus focus_next focus_prev **
        XiziDLL.dllseg focus_next focus stop last after).
  {
    intros start prev stop last before.
    revert start prev.
    induction before as [| a before IH]; intros start prev focus after.
    - simpl. Intros next. Intros. subst start.
      Exists prev next.
      simpl. unfold XiziDLL.links. entailer!.
    - simpl. Intros next. Intros. subst start.
      sep_apply (IH next a focus after).
      Intros focus_prev focus_next.
      destruct (Z.eq_dec a focus) as [Heq | Hneq].
      + subst focus. unfold XiziDLL.links.
        sepcon_lift
          (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
        lazymatch goal with
        | |- ?E ** (?A ** (?B ** ?Rest)) |-- _ =>
            rewrite (logic_equiv_sepcon_swap A B Rest)
        end.
        lazymatch goal with
        | |- ?P |-- _ =>
          lazymatch P with
          | context [?loc # Ptr |-> focus_next] =>
            sep_apply_l_atomic (dup_store_ptr loc next focus_next)
          end
        end.
        Intros. contradiction.
      + Exists focus_prev focus_next.
        simpl. unfold XiziDLL.links. Exists next. entailer!.
  }
  aggressive_pre_process.
  sep_apply (Hsplit first_2 linklist_pre linklist_pre last_2
                    nodes_before linklist_node_pre nodes_after).
  Intros node_prev node_next.
  Exists node_next node_prev.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  assert (Hclose : forall stop stop_first stop_last start prev focus
                          focus_prev focus_next last before after,
      focus <> NULL -> focus <> stop ->
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last **
      xizi_dllseg start prev focus focus_prev before **
      &(focus # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> focus_next **
      &(focus # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> focus_prev **
      xizi_dllseg focus_next focus stop last after |--
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last **
      xizi_dllseg start prev stop last (before ++ focus :: after)).
  {
    intros stop stop_first stop_last start prev focus focus_prev focus_next
           last before after Hfocus0 Hfocusstop.
    unfold xizi_dllseg.
    revert start prev.
    induction before as [| a before IH]; intros start prev.
    - simpl. Intros. destruct H as [Hstart Hprev].
      subst start. subst prev.
      Exists focus_next. entailer!.
    - simpl. Intros next. Intros. subst start.
      sep_apply (IH next a).
      destruct (Z.eq_dec a stop) as [Heq | Hneq].
      + subst a. unfold XiziDLL.links.
        lazymatch goal with
        | |- ?P |-- _ =>
          lazymatch P with
          | context [?loc # Ptr |-> next] =>
              sepcon_lift (loc # Ptr |-> next);
              sep_apply_l_atomic (dup_store_ptr loc next stop_first)
          end
        end.
        Intros. contradiction.
      + Exists next. entailer!.
  }
  assert (Hlast : forall next focus stop last after,
      next = stop ->
      XiziDLL.dllseg next focus stop last after |--
      “ 0 = xizi_double_link_next_rec_last_value after ”).
  {
    intros next focus stop last after Hnext.
    destruct after as [| a after].
    - simpl. Intros. entailer!.
    - simpl. Intros next0. Intros. entailer!.
  }
  pre_process.
  destruct (Z.eq_dec linklist_node_pre linklist_pre) as [Heq | Hneq].
  - subst linklist_node_pre.
    lazymatch goal with
    | |- ?P |-- _ =>
      lazymatch P with
      | context [?loc # Ptr |-> node_next] =>
          sepcon_lift (loc # Ptr |-> node_next);
          sep_apply_l_atomic (dup_store_ptr loc node_next first)
      end
    end.
    Intros. contradiction.
  - prop_apply_p
      (Hlast node_next linklist_node_pre linklist_pre last nodes_after PreH1).
    Intros_p Hvalue.
    sep_apply (Hclose linklist_pre first last first linklist_pre
                        linklist_node_pre node_prev node_next last
                        nodes_before nodes_after PreH3 Hneq).
    unfold xizi_dll, XiziDLL.dll, XiziDLL.links.
    Exists first last.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  assert (Hclose : forall stop stop_first stop_last start prev focus
                          focus_prev focus_next last before after,
      focus <> NULL -> focus <> stop ->
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last **
      xizi_dllseg start prev focus focus_prev before **
      &(focus # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> focus_next **
      &(focus # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> focus_prev **
      xizi_dllseg focus_next focus stop last after |--
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
      &(stop # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> stop_last **
      xizi_dllseg start prev stop last (before ++ focus :: after)).
  {
    intros stop stop_first stop_last start prev focus focus_prev focus_next
           last before after Hfocus0 Hfocusstop.
    unfold xizi_dllseg.
    revert start prev.
    induction before as [| a before IH]; intros start prev.
    - simpl. Intros. destruct H as [Hstart Hprev].
      subst start. subst prev.
      Exists focus_next. entailer!.
    - simpl. Intros next. Intros. subst start.
      sep_apply (IH next a).
      destruct (Z.eq_dec a stop) as [Heq | Hneq].
      + subst a. unfold XiziDLL.links.
        lazymatch goal with
        | |- ?P |-- _ =>
          lazymatch P with
          | context [?loc # Ptr |-> next] =>
              sepcon_lift (loc # Ptr |-> next);
              sep_apply_l_atomic (dup_store_ptr loc next stop_first)
          end
        end.
        Intros. contradiction.
      + Exists next. entailer!.
  }
  assert (Hnext : forall next focus stop last after,
      next <> stop ->
      XiziDLL.dllseg next focus stop last after |--
      “ next = xizi_double_link_next_rec_last_value after ”).
  {
    intros next focus stop last after Hnext.
    destruct after as [| a after].
    - simpl. Intros. entailer!.
    - simpl. Intros next0. Intros. entailer!.
  }
  pre_process.
  destruct (Z.eq_dec linklist_node_pre linklist_pre) as [Heq | Hneq].
  - subst linklist_node_pre.
    lazymatch goal with
    | |- ?P |-- _ =>
      lazymatch P with
      | context [?loc # Ptr |-> node_next] =>
          sepcon_lift (loc # Ptr |-> node_next);
          sep_apply_l_atomic (dup_store_ptr loc node_next first)
      end
    end.
    Intros. contradiction.
  - prop_apply_p
      (Hnext node_next linklist_node_pre linklist_pre last nodes_after PreH1).
    Intros_p Hvalue.
    sep_apply (Hclose linklist_pre first last first linklist_pre
                        linklist_node_pre node_prev node_next last
                        nodes_before nodes_after PreH3 Hneq).
    unfold xizi_dll, XiziDLL.dll, XiziDLL.links.
    Exists first last.
    entailer!.
Qed.
