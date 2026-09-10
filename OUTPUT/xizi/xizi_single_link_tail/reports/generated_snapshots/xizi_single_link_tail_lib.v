Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.
Import SetsNotation.
Import naive_C_Rules.
Local Open Scope sets.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

(** The original traversal starts at the sentinel.  The mathematical sequence
    [head :: l] includes it only as a structural address; all element payloads
    remain framed separately by [xizi_sll_remove_payloads].  The imported
    [xizi_sll_tail_value l head = last l head] returns the sentinel for an empty
    element list, and the final element address otherwise. *)
Lemma xizi_sll_tail_head_cons : forall head l,
  xizi_sll_head head l |-- xizi_sll head (head :: l).
Proof.
  intros. unfold xizi_sll_head, generic_sll_head.
  Intros first. unfold xizi_sll at 1. simpl.
  fold xizi_sll.
  unfold xizi_addr_node_store, sll_addr_store,
    xizi_head_store, sll_head_store.
  Exists first. entailer!.
Qed.

Lemma xizi_sll_tail_cons_head : forall head l,
  xizi_sll head (head :: l) |-- xizi_sll_head head l.
Proof.
  intros. unfold xizi_sll at 1. simpl.
  fold xizi_sll. Intros first.
  unfold xizi_sll_head, generic_sll_head.
  unfold xizi_addr_node_store, sll_addr_store,
    xizi_head_store, sll_head_store.
  Exists first. entailer!.
Qed.

Lemma tail_of_sentinel_decomposition__tail_traversal :
  forall (head tail : Z) (xs prefix : list Z),
    head :: xs = (prefix ++ [tail])%list -> tail = xizi_sll_tail_value xs head.
Proof.
  intros head tail xs prefix H.
  apply (f_equal (fun l => last l head)) in H.
  rewrite last_last in H.
  unfold xizi_sll_tail_value.
  destruct xs; simpl in *; symmetry; exact H.
Qed.
