Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.

Import ListNotations.
Import SetsNotation naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Local Open Scope sac.

(** Pure address projection preserves the established next-value semantics
    while the spatial predicate retains every logical node and its payload. *)
Definition xizi_sll_next_ptrs {A: Type}
  (l: list (sll_payload_node A)): list Z := map sll_payload_ptr l.

Lemma payload_first__payload_next: forall {A:Type} (storeA: Z -> A -> Assertion) x l,
 xizi_sll_payload storeA x l |-- “ x = xizi_sll_first_value (xizi_sll_next_ptrs l) ”.
Proof.
 intros A storeA x [|[a p] l].
 - unfold xizi_sll_payload, generic_sll_payload, generic_sll, xizi_sll_next_ptrs, xizi_sll_first_value.
   simpl. Intros. dump_pre_spatial. assumption.
 - unfold xizi_sll_payload, generic_sll_payload. simpl.
   unfold sll_payload_cell. simpl. Intros next. Intros.
   dump_pre_spatial. assumption.
Qed.
Lemma payload_append__payload_next: forall {A:Type} (storeA: Z -> A -> Assertion) prefix x y tail,
 xizi_sllseg_payload storeA x y prefix ** xizi_sll_payload storeA y tail |--
 xizi_sll_payload storeA x (prefix ++ tail).
Proof.
 intros A storeA prefix. induction prefix as [|[a p] prefix IH]; intros x y tail.
 - unfold xizi_sllseg_payload, generic_sllseg_payload. simpl. Intros. subst x.
   cancel (xizi_sll_payload storeA y tail).
 - unfold xizi_sllseg_payload, generic_sllseg_payload at 1. simpl.
   Intros next. change (generic_sllseg (sll_payload_cell xizi_struct_name xizi_next_field storeA) next y prefix) with (xizi_sllseg_payload storeA next y prefix).
   sep_apply_l_atomic (IH next y tail).
   unfold xizi_sll_payload, generic_sll_payload at 2. simpl.
   Exists next. split_pure_spatial.
   + cancel (sll_payload_cell xizi_struct_name xizi_next_field storeA x next (Build_sll_payload_node a p)).
     change (xizi_sll_payload storeA next (prefix ++ tail) |-- xizi_sll_payload storeA next (prefix ++ tail)).
     cancel (xizi_sll_payload storeA next (prefix ++ tail)).
   + dump_pre_spatial. assumption.
Qed.
Lemma payload_member_split__payload_next:
 forall {A:Type} (storeA: Z -> A -> Assertion) l root p,
 In p (xizi_sll_next_ptrs l) ->
 xizi_sll_payload storeA root l |--
 EX next prefix a suffix,
 “ p <> 0 ” &&
 “ l = prefix ++ Build_sll_payload_node a p :: suffix ” &&
 “ ~ In p (xizi_sll_next_ptrs prefix) ” &&
 xizi_sllseg_payload storeA root p prefix ** storeA p a **
 sll_link xizi_struct_name xizi_next_field p next **
 xizi_sll_payload storeA next suffix.
Proof.
 intros A storeA l. induction l as [|[a ptr] l IH]; intros root p Hin.
 - simpl in Hin. contradiction.
 - unfold xizi_sll_payload, generic_sll_payload at 1. simpl.
   unfold sll_payload_cell. simpl. Intros next. Intros. subst root.
   change (generic_sll (sll_payload_cell xizi_struct_name xizi_next_field storeA) next l) with (xizi_sll_payload storeA next l).
   destruct (Z.eq_dec ptr p) as [Heq|Hneq].
   + subst ptr. Exists next (@nil (sll_payload_node A)) a l.
     unfold xizi_sllseg_payload, generic_sllseg_payload. simpl.
     split_pure_spatial.
     * cancel (storeA p a).
       cancel (sll_link xizi_struct_name xizi_next_field p next).
       change (xizi_sll_payload storeA next l |-- xizi_sll_payload storeA next l).
       cancel (xizi_sll_payload storeA next l).
     * split_pures; dump_pre_spatial; auto.
   + assert (Hintail: In p (xizi_sll_next_ptrs l)).
     { simpl in Hin. destruct Hin as [Heq|Hin]; [contradiction|exact Hin]. }
     sep_apply_l_atomic (IH next p Hintail).
     Intros target_next prefix b suffix. Intros.
     Exists target_next (Build_sll_payload_node a ptr :: prefix) b suffix.
     split_pure_spatial.
     * unfold xizi_sllseg_payload, generic_sllseg_payload at 2. simpl.
       Exists next. unfold sll_payload_cell. simpl.
       split_pure_spatial.
       -- cancel (storeA ptr a).
          cancel (sll_link xizi_struct_name xizi_next_field ptr next).
          unfold xizi_sllseg_payload, generic_sllseg_payload.
          cancel (generic_sllseg (sll_payload_cell xizi_struct_name xizi_next_field storeA) next p prefix).
          cancel (storeA p b).
          cancel (sll_link xizi_struct_name xizi_next_field p target_next).
          change (xizi_sll_payload storeA target_next suffix |-- xizi_sll_payload storeA target_next suffix).
          cancel (xizi_sll_payload storeA target_next suffix).
       -- split_pures; dump_pre_spatial; auto.
     * split_pures; dump_pre_spatial; simpl; auto.
       -- f_equal. assumption.
       -- tauto.
Qed.
