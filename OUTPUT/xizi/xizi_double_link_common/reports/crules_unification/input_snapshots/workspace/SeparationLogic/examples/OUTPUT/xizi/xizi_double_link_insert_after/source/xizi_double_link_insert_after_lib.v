Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** A public anchor accepted by the implementation is either an abstract list
    member or the sentinel itself.  This proposition deliberately hides all
    pointer-level cuts used to implement the two cases. *)
Definition xizi_double_link_insert_after_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Pure sequence semantics for inserting [inserted] immediately after the
    first occurrence of [anchor] in the complete abstract sequence.  If the
    anchor is absent the sequence is unchanged.  This is a list-level API
    transformation and does not expose the circular C pointer updates. *)
Fixpoint xizi_double_link_insert_after_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then current :: inserted :: suffix
      else current ::
           xizi_double_link_insert_after_nodes suffix anchor inserted
  end.

(** Public dispatch semantics.  Inserting after the sentinel prepends to the
    abstract node sequence; inserting after an ordinary member uses the
    first-occurrence transformation above. *)
Definition xizi_double_link_insert_after_dispatch_nodes
  (head : Z) (nodes : list Z) (anchor inserted : Z) : list Z :=
  if Z.eq_dec anchor head
  then inserted :: nodes
  else xizi_double_link_insert_after_nodes nodes anchor inserted.

Lemma xizi_in_first_split_after__implementation_shape :
  forall (nodes : list Z) (anchor : Z),
    In anchor nodes ->
    exists prefix suffix,
      nodes = prefix ++ anchor :: suffix /\ ~ In anchor prefix.
Proof.
  induction nodes as [|current nodes IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current.
      exists nil, nodes.
      simpl; auto.
    + destruct Hin as [Heq | Hin].
      * contradiction.
      * destruct (IH anchor Hin) as (prefix & suffix & Hnodes & Hnotin).
        exists (current :: prefix), suffix.
        simpl.
        split.
        -- now rewrite Hnodes.
        -- intros [Heq | Hinprefix]; contradiction.
Qed.
Lemma xizi_insert_after_first_occurrence__implementation_shape :
  forall (prefix suffix : list Z) (anchor inserted : Z),
    ~ In anchor prefix ->
    xizi_double_link_insert_after_nodes
      (prefix ++ anchor :: suffix) anchor inserted =
    prefix ++ anchor :: inserted :: suffix.
Proof.
  induction prefix as [|current prefix IH];
    intros suffix anchor inserted Hnotin.
  - simpl.
    destruct (Z.eq_dec anchor anchor); congruence.
  - simpl in *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current; exfalso; apply Hnotin; auto.
    + f_equal.
      apply IH.
      intros Hin; apply Hnotin; auto.
Qed.


Require Import QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.

(** Payload-preserving lift of the existing first-occurrence address spec.
    The relation retains the exact prefix, anchor value and suffix; it does
    not encode any of the four concrete pointer writes. *)
Definition xizi_insert_after_ptrs {A : Type}
  (nodes : list (DLL.DL_Node A)) : list Z :=
  map DLL.getPtr nodes.

Definition xizi_insert_after_payload {A : Type}
  (nodes : list (DLL.DL_Node A)) (anchor : Z)
  (inserted : DLL.DL_Node A)
  (result : list (DLL.DL_Node A)) : Prop :=
  exists prefix current suffix,
    nodes = prefix ++ current :: suffix /\
    DLL.getPtr current = anchor /\
    ~ In anchor (xizi_insert_after_ptrs prefix) /\
    result = prefix ++ current :: inserted :: suffix.

Definition xizi_insert_after_dispatch_payload {A : Type}
  (head : Z) (nodes : list (DLL.DL_Node A)) (anchor : Z)
  (inserted : DLL.DL_Node A)
  (result : list (DLL.DL_Node A)) : Prop :=
  (anchor = head /\ result = inserted :: nodes) \/
  (anchor <> head /\ xizi_insert_after_payload nodes anchor inserted result).

(** Erasing only the payload recovers the previously verified address API. *)
Lemma xizi_insert_after_payload_address_semantics : forall {A}
  (nodes result : list (DLL.DL_Node A)) anchor inserted,
  xizi_insert_after_payload nodes anchor inserted result ->
  xizi_insert_after_ptrs result =
  xizi_double_link_insert_after_nodes (xizi_insert_after_ptrs nodes)
    anchor (DLL.getPtr inserted).
Proof.
  intros A nodes result anchor inserted (prefix & current & suffix & Hnodes & Hptr & Hfirst & Hresult).
  subst nodes result.
  unfold xizi_insert_after_ptrs in *.
  rewrite !map_app; simpl.
  rewrite Hptr.
  symmetry; apply xizi_insert_after_first_occurrence__implementation_shape; assumption.
Qed.

Lemma xizi_insert_after_dispatch_payload_address_semantics : forall {A}
  head (nodes result : list (DLL.DL_Node A)) anchor inserted,
  xizi_insert_after_dispatch_payload head nodes anchor inserted result ->
  xizi_insert_after_ptrs result =
  xizi_double_link_insert_after_dispatch_nodes head
    (xizi_insert_after_ptrs nodes) anchor (DLL.getPtr inserted).
Proof.
  intros A head nodes result anchor inserted H.
  unfold xizi_insert_after_dispatch_payload in H.
  unfold xizi_double_link_insert_after_dispatch_nodes.
  destruct H as [[Heq Hresult] | [Hneq Hmember]].
  - subst anchor result; destruct (Z.eq_dec head head); [reflexivity | contradiction].
  - destruct (Z.eq_dec anchor head); [contradiction |].
    now apply xizi_insert_after_payload_address_semantics.
Qed.

Require Import Coq.Strings.String.
Lemma payload_first_split__payload_insert_after : forall {A}
  (nodes : list (DLL.DL_Node A)) anchor,
  In anchor (xizi_insert_after_ptrs nodes) ->
  exists prefix value suffix,
    nodes = prefix ++ DLL.Build_DL_Node value anchor :: suffix /\
    ~ In anchor (xizi_insert_after_ptrs prefix).
Proof.
  intros A nodes; induction nodes as [|[value ptr] nodes IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec ptr anchor) as [Heq|Hneq].
    + subst ptr; exists nil, value, nodes; simpl; auto.
    + change (ptr = anchor \/ In anchor (xizi_insert_after_ptrs nodes)) in Hin.
      destruct Hin as [Heq|Hin]; [contradiction|].
      destruct (IH anchor Hin) as (prefix & current & suffix & Heq & Hfirst).
      exists (DLL.Build_DL_Node value ptr :: prefix), current, suffix.
      split; [simpl; now rewrite Heq|].
      change (~ (ptr = anchor \/ In anchor (xizi_insert_after_ptrs prefix))).
      tauto.
Qed.

(** Spatial helpers tied to the historical guarded model were removed.
    Canonical segments carry no implicit nonzero or endpoint exclusion. *)

Lemma store_dll_member_not_sentinel__insert_after_payload : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr) head nodes member,
  In member (xizi_insert_after_ptrs nodes) ->
  SeparationLogic.naive_C_Rules.derivable1
    (XiziLocalDLL.store_dll storeA head nodes)
    (SeparationLogic.naive_C_Rules.coq_prop (member <> head)).
Proof.
  Import SeparationLogic.naive_C_Rules.
  intros A storeA head nodes member Hin.
  destruct (Z.eq_dec member head) as [Heq|Hneq].
  2: { dump_pre_spatial; exact Hneq. }
  subst member.
  destruct (payload_first_split__payload_insert_after nodes head Hin)
    as (prefix & value & suffix & Hnodes & Hfirst).
  subst nodes. unfold XiziLocalDLL.store_dll.
  Intros first last.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_split storeA first head head last prefix (DLL.Build_DL_Node value head :: suffix)).
  Intros anchor previous.
  simpl XiziLocalDLL.dllseg. Intros next. subst anchor.
  match goal with
  | |- context [SeparationLogic.naive_C_Rules.store_ptr ?field last] =>
      prop_apply_p (SeparationLogic.naive_C_Rules.dup_store_ptr field last previous)
  end.
  Intros_p Hfalse. contradiction.
Qed.
