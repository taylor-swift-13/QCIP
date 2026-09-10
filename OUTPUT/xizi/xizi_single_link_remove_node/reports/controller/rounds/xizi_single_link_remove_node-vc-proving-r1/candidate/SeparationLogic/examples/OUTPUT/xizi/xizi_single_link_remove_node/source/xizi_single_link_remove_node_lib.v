Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Fixpoint xizi_sll_remove_first (node: Z) (l: list Z): list Z :=
  match l with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current node
      then suffix
      else current :: xizi_sll_remove_first node suffix
  end.

Lemma xizi_sll_remove_first_split__spec_derivations_direct:
  forall (node: Z) (l: list Z),
    In node l ->
    exists prefix suffix,
      l = prefix ++ node :: suffix /\
      ~ In node prefix /\
      xizi_sll_remove_first node l = prefix ++ suffix.
Proof.
  intros node l.
  induction l as [| current tail IH].
  - simpl. tauto.
  - intros Hin.
    simpl in Hin.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current.
      exists nil, tail.
      split; [reflexivity |].
      split; [simpl; tauto |].
      simpl.
      destruct (Z.eq_dec node node); [reflexivity | contradiction].
    + destruct Hin as [Heq | Hin]; [congruence |].
      destruct (IH Hin) as (prefix & suffix & Hl & Hnotin & Hremove).
      exists (current :: prefix), suffix.
      split.
      * simpl. rewrite Hl. reflexivity.
      * split.
        -- simpl. intros [Heq | Hmember].
           ++ congruence.
           ++ contradiction.
        -- simpl. destruct (Z.eq_dec current node); [contradiction |].
           rewrite Hremove. reflexivity.
Qed.


Require Import QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Import naive_C_Rules.
Local Open Scope sac.

(** Pure address projection keeps the established address-based operation. *)
Definition xizi_sll_payload_addresses {A: Type}
  (l: list (sll_payload_node A)): list Z := map sll_payload_ptr l.

(** The separating conjunction of the logical payloads. This is only a
    resource factorization of the shared generic model, not a traversal
    algorithm, and imposes no restriction on the arbitrary storeA. *)
Definition xizi_sll_remove_payloads {A: Type}
  (storeA: Z -> A -> Assertion) (l: list (sll_payload_node A)): Assertion :=
  fold_right (fun n acc => storeA (sll_payload_ptr n) (sll_payload_data n) ** acc)
    emp l.

(** Delete exactly one logical node; retain the order and data of all others.
    The projection clause preserves the existing remove_first specification. *)
Definition xizi_sll_payload_remove {A: Type}
  (node: Z) (a: A) (input output: list (sll_payload_node A)): Prop :=
  exists prefix suffix,
    input = prefix ++ Build_sll_payload_node a node :: suffix /\
    output = prefix ++ suffix /\
    xizi_sll_payload_addresses output =
      xizi_sll_remove_first node (xizi_sll_payload_addresses input).

Lemma payload_factor__remove_payloads : forall A (storeA: Z -> A -> Assertion) l x,
 xizi_sll_payload storeA x l |-- xizi_sll x (xizi_sll_payload_addresses l) ** xizi_sll_remove_payloads storeA l.
Proof.
 intros A storeA l; induction l as [|[a n] l IH]; intros x.
 - unfold xizi_sll_payload, generic_sll_payload, xizi_sll, xizi_sll_payload_addresses, xizi_sll_remove_payloads; simpl. entailer!.
 - unfold xizi_sll_payload, generic_sll_payload, xizi_sll, xizi_sll_payload_addresses, xizi_sll_remove_payloads in *; simpl in *.
   unfold sll_payload_cell, xizi_addr_node_store, sll_addr_store in *; simpl in *.
   Intros y. Intros. subst x. Exists y. sep_apply (IH y). entailer!.
Qed.
Lemma payload_unfactor__remove_payloads : forall A (storeA: Z -> A -> Assertion) l x,
 xizi_sll x (xizi_sll_payload_addresses l) ** xizi_sll_remove_payloads storeA l |-- xizi_sll_payload storeA x l.
Proof.
 intros A storeA l; induction l as [|[a n] l IH]; intros x.
 - unfold xizi_sll_payload, generic_sll_payload, xizi_sll, xizi_sll_payload_addresses, xizi_sll_remove_payloads; simpl. entailer!.
 - unfold xizi_sll_payload, generic_sll_payload, xizi_sll, xizi_sll_payload_addresses, xizi_sll_remove_payloads in *; simpl in *.
   unfold sll_payload_cell, xizi_addr_node_store, sll_addr_store in *; simpl in *.
   Intros y. Intros. subst x. Exists y. sep_apply (IH y). entailer!.
Qed.
Lemma payload_head_factor__remove_payloads : forall A (storeA: Z -> A -> Assertion) l h,
 xizi_sll_head_payload storeA h l |-- xizi_sll_head h (xizi_sll_payload_addresses l) ** xizi_sll_remove_payloads storeA l.
Proof.
 intros. unfold xizi_sll_head_payload, generic_sll_head_payload, xizi_sll_head, generic_sll_head.
 Intros f. Exists f. fold xizi_sll. fold (@xizi_sll_payload A storeA). sep_apply (payload_factor__remove_payloads A storeA l f). entailer!.
Qed.
Lemma payload_head_unfactor__remove_payloads : forall A (storeA: Z -> A -> Assertion) l h,
 xizi_sll_head h (xizi_sll_payload_addresses l) ** xizi_sll_remove_payloads storeA l |-- xizi_sll_head_payload storeA h l.
Proof.
 intros. unfold xizi_sll_head_payload, generic_sll_head_payload, xizi_sll_head, generic_sll_head.
 Intros f. Exists f. fold xizi_sll. fold (@xizi_sll_payload A storeA). sep_apply (payload_unfactor__remove_payloads A storeA l f). unfold xizi_head_store, xizi_sll_payload, generic_sll_payload. entailer!.
Qed.
Lemma payloads_remove_split__remove_payloads : forall A (storeA: Z -> A -> Assertion) p s a n,
 xizi_sll_remove_payloads storeA (p ++ Build_sll_payload_node a n :: s) |-- xizi_sll_remove_payloads storeA (p ++ s) ** storeA n a.
Proof.
 intros A storeA p; induction p as [|b p IH]; intros s a n.
 - unfold xizi_sll_remove_payloads; simpl. entailer!.
 - unfold xizi_sll_remove_payloads in *; simpl in *. sep_apply (IH s a n). entailer!.
Qed.
Lemma payload_first_occurrence__remove_payloads : forall A n (l: list (sll_payload_node A)),
 In n (xizi_sll_payload_addresses l) -> exists a p s,
 l = p ++ Build_sll_payload_node a n :: s /\
 ~ In n (xizi_sll_payload_addresses p) /\ xizi_sll_payload_remove n a l (p ++ s).
Proof.
 intros A n l. induction l as [|[a x] l IH]; simpl; intros H.
 - contradiction.
 - destruct (Z.eq_dec x n) as [E|N].
   + subst x. exists a, nil, l. split; [reflexivity|]. split; [simpl; tauto|].
     exists nil, l. repeat split. unfold xizi_sll_payload_addresses; simpl.
     destruct (Z.eq_dec n n); congruence.
   + change (x = n \/ In n (xizi_sll_payload_addresses l)) in H.
     destruct H as [E|H]; [contradiction|].
     destruct (IH H) as (b & p & s & E & Hnot & Hr).
     exists b, (Build_sll_payload_node a x :: p), s.
     split; [simpl; rewrite E; reflexivity|]. split.
     * simpl. intros [Heq|Hin]; [contradiction|exact (Hnot Hin)].
     * exists (Build_sll_payload_node a x :: p), s. split; [simpl; rewrite E; reflexivity|].
       split; [reflexivity|]. destruct Hr as (p' & s' & _ & _ & Hr).
       change (x :: xizi_sll_payload_addresses (p ++ s) = xizi_sll_remove_first n (x :: xizi_sll_payload_addresses l)).
       simpl. destruct (Z.eq_dec x n); [contradiction|]. rewrite Hr. reflexivity.
Qed.
Lemma payload_member_nonzero__remove_payloads : forall A (storeA: Z -> A -> Assertion) h p a n s,
 xizi_sll_head_payload storeA h (p ++ Build_sll_payload_node a n :: s) |-- “ n <> NULL ”.
Proof.
 intros. sep_apply (payload_head_factor__remove_payloads A storeA (p ++ Build_sll_payload_node a n :: s) h).
 unfold xizi_sll_head, generic_sll_head. Intros f. Intros.
 unfold xizi_sll_payload_addresses. rewrite map_app. simpl.
 fold xizi_sll. unfold xizi_head_store, sll_head_store, sll_link.
 sep_apply (xizi_sll_head_split_target h f (map sll_payload_ptr p) n (map sll_payload_ptr s) H).
 entailer!.
Qed.
