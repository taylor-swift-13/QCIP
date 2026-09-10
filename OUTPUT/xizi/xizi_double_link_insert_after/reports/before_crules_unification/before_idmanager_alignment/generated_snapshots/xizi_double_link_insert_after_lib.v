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
  (nodes : list (XiziStoreADLL.DL_Node A)) : list Z :=
  map XiziStoreADLL.getPtr nodes.

Definition xizi_insert_after_payload {A : Type}
  (nodes : list (XiziStoreADLL.DL_Node A)) (anchor : Z)
  (inserted : XiziStoreADLL.DL_Node A)
  (result : list (XiziStoreADLL.DL_Node A)) : Prop :=
  exists prefix current suffix,
    nodes = prefix ++ current :: suffix /\
    XiziStoreADLL.getPtr current = anchor /\
    ~ In anchor (xizi_insert_after_ptrs prefix) /\
    result = prefix ++ current :: inserted :: suffix.

Definition xizi_insert_after_dispatch_payload {A : Type}
  (head : Z) (nodes : list (XiziStoreADLL.DL_Node A)) (anchor : Z)
  (inserted : XiziStoreADLL.DL_Node A)
  (result : list (XiziStoreADLL.DL_Node A)) : Prop :=
  (anchor = head /\ result = inserted :: nodes) \/
  (anchor <> head /\ xizi_insert_after_payload nodes anchor inserted result).

(** Erasing only the payload recovers the previously verified address API. *)
Lemma xizi_insert_after_payload_address_semantics : forall {A}
  (nodes result : list (XiziStoreADLL.DL_Node A)) anchor inserted,
  xizi_insert_after_payload nodes anchor inserted result ->
  xizi_insert_after_ptrs result =
  xizi_double_link_insert_after_nodes (xizi_insert_after_ptrs nodes)
    anchor (XiziStoreADLL.getPtr inserted).
Proof.
  intros A nodes result anchor inserted (prefix & current & suffix & Hnodes & Hptr & Hfirst & Hresult).
  subst nodes result.
  unfold xizi_insert_after_ptrs in *.
  rewrite !map_app; simpl.
  rewrite Hptr.
  symmetry; apply xizi_insert_after_first_occurrence__implementation_shape; assumption.
Qed.

Lemma xizi_insert_after_dispatch_payload_address_semantics : forall {A}
  head (nodes result : list (XiziStoreADLL.DL_Node A)) anchor inserted,
  xizi_insert_after_dispatch_payload head nodes anchor inserted result ->
  xizi_insert_after_ptrs result =
  xizi_double_link_insert_after_dispatch_nodes head
    (xizi_insert_after_ptrs nodes) anchor (XiziStoreADLL.getPtr inserted).
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
  (nodes : list (XiziStoreADLL.DL_Node A)) anchor,
  In anchor (xizi_insert_after_ptrs nodes) ->
  exists prefix value suffix,
    nodes = prefix ++ XiziStoreADLL.Build_DL_Node value anchor :: suffix /\
    ~ In anchor (xizi_insert_after_ptrs prefix).
Proof.
  intros A nodes; induction nodes as [|[value ptr] nodes IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec ptr anchor) as [Heq|Hneq].
    + subst ptr; exists nil, value, nodes; simpl; auto.
    + change (ptr = anchor \/ In anchor (xizi_insert_after_ptrs nodes)) in Hin.
      destruct Hin as [Heq|Hin]; [contradiction|].
      destruct (IH anchor Hin) as (prefix & current & suffix & Heq & Hfirst).
      exists (XiziStoreADLL.Build_DL_Node value ptr :: prefix), current, suffix.
      split; [simpl; now rewrite Heq|].
      change (~ (ptr = anchor \/ In anchor (xizi_insert_after_ptrs prefix))).
      tauto.
Qed.
Lemma payload_segment_append__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  prefix suffix first prev middle middle_prev stop last,
  ~ In stop (xizi_insert_after_ptrs prefix) ->
  SeparationLogic.naive_C_Rules.derivable1
    (SeparationLogic.naive_C_Rules.sepcon (XiziStoreADLL.dllseg storeA first prev middle middle_prev prefix) (XiziStoreADLL.dllseg storeA middle middle_prev stop last suffix))
    (XiziStoreADLL.dllseg storeA first prev stop last (prefix ++ suffix)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros A storeA prefix; induction prefix as [|[value ptr] prefix IH];
    intros suffix first prev middle middle_prev stop last Hnot.
  - simpl; Intros; destruct H as [Hfirst Hprev]; subst; entailer!.
  - simpl in *; Intros next; subst first.
    sep_apply_l_atomic (IH suffix next ptr middle middle_prev stop last ltac:(tauto)).
    Exists next; entailer!; tauto.
Qed.
Lemma payload_segment_cut__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  prefix value anchor suffix first prev stop last,
  ~ In anchor (xizi_insert_after_ptrs prefix) ->
  SeparationLogic.naive_C_Rules.derivable1
    (XiziStoreADLL.dllseg storeA first prev stop last (prefix ++ XiziStoreADLL.Build_DL_Node value anchor :: suffix))
    (SeparationLogic.naive_C_Rules.exp (fun before : Z => SeparationLogic.naive_C_Rules.sepcon (XiziStoreADLL.dllseg storeA first prev anchor before prefix) (XiziStoreADLL.dllseg storeA anchor before stop last (XiziStoreADLL.Build_DL_Node value anchor :: suffix)))).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros A storeA prefix; induction prefix as [|[v ptr] prefix IH];
    intros value anchor suffix first prev stop last Hnot.
  - simpl; Intros next; subst first. Exists prev next; entailer!.
  - simpl in *; Intros next; subst first.
    sep_apply_l_atomic (IH value anchor suffix next ptr stop last ltac:(tauto)).
    Intros before tailnext. Exists before next tailnext; entailer!; tauto.
Qed.
Lemma payload_next_neq__payload_insert_after : forall x y vx vy,
  SeparationLogic.naive_C_Rules.derivable1
    (SeparationLogic.naive_C_Rules.sepcon (SeparationLogic.naive_C_Rules.store_ptr (CNotation.eval_addr_expr (CNotation.RE_addr_of (CNotation.LE_arrow_field (CNotation.RE_const x (CNotation.FET_alias ("SysDoubleLinklistNode"%string))) ("node_next"%string)))) vx) (SeparationLogic.naive_C_Rules.store_ptr (CNotation.eval_addr_expr (CNotation.RE_addr_of (CNotation.LE_arrow_field (CNotation.RE_const y (CNotation.FET_alias ("SysDoubleLinklistNode"%string))) ("node_next"%string)))) vy))
    (SeparationLogic.naive_C_Rules.coq_prop (x <> y)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros x y vx vy; destruct (Z.eq_dec x y) as [Heq|Hneq].
  - subst y. sep_apply_l_atomic (SeparationLogic.naive_C_Rules.dup_store_ptr
        (CNotation.eval_addr_expr (CNotation.RE_addr_of (CNotation.LE_arrow_field (CNotation.RE_const x (CNotation.FET_alias ("SysDoubleLinklistNode"%string))) ("node_next"%string)))) vx vy).
      entailer!.
  - entailer!.
Qed.
Lemma payload_segment_frame_exclusion__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  nodes first prev stop last head value,
  SeparationLogic.naive_C_Rules.derivable1
    (SeparationLogic.naive_C_Rules.sepcon (XiziStoreADLL.dllseg storeA first prev stop last nodes) (SeparationLogic.naive_C_Rules.store_ptr (CNotation.eval_addr_expr (CNotation.RE_addr_of (CNotation.LE_arrow_field (CNotation.RE_const head (CNotation.FET_alias ("SysDoubleLinklistNode"%string))) ("node_next"%string)))) value))
    (SeparationLogic.naive_C_Rules.andp (SeparationLogic.naive_C_Rules.coq_prop (~ In head (xizi_insert_after_ptrs nodes))) (SeparationLogic.naive_C_Rules.sepcon (XiziStoreADLL.dllseg storeA first prev stop last nodes) (SeparationLogic.naive_C_Rules.store_ptr (CNotation.eval_addr_expr (CNotation.RE_addr_of (CNotation.LE_arrow_field (CNotation.RE_const head (CNotation.FET_alias ("SysDoubleLinklistNode"%string))) ("node_next"%string)))) value))).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros A storeA nodes; induction nodes as [|[v ptr] nodes IH];
    intros first prev stop last head value.
  - simpl; Intros; entailer!.
  - split_pure_spatial; [cancel|].
    simpl; Intros next; subst first.
    unfold xizi_dll_links, XiziDLL.links. sepcon_assoc_change.
    prop_apply_p (payload_next_neq__payload_insert_after ptr head next value). Intros.
    sep_apply_l_atomic (IH next ptr stop last head value). Intros.
    entailer!; tauto.
Qed.
Lemma payload_segment_excludes_stop__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  nodes first prev stop last,
  SeparationLogic.naive_C_Rules.derivable1
    (XiziStoreADLL.dllseg storeA first prev stop last nodes)
    (SeparationLogic.naive_C_Rules.andp (SeparationLogic.naive_C_Rules.coq_prop (~ In stop (xizi_insert_after_ptrs nodes))) (XiziStoreADLL.dllseg storeA first prev stop last nodes)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros A storeA nodes; induction nodes as [|[v ptr] nodes IH];
    intros first prev stop last.
  - simpl; Intros; entailer!.
  - split_pure_spatial; [cancel|].
    simpl; Intros next; subst first.
    sep_apply_l_atomic (IH next ptr stop last). Intros.
    entailer!; tauto.
Qed.
Lemma payload_store_dll_member_not_head__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  head nodes anchor,
  In anchor (xizi_insert_after_ptrs nodes) ->
  SeparationLogic.naive_C_Rules.derivable1
    (xizi_store_dll storeA head nodes)
    (SeparationLogic.naive_C_Rules.andp (SeparationLogic.naive_C_Rules.coq_prop (anchor <> head)) (xizi_store_dll storeA head nodes)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface.
  intros A storeA head nodes anchor Hin.
  split_pure_spatial; [cancel|].
  unfold xizi_store_dll, XiziStoreADLL.store_dll.
  Intros first last.
  sep_apply_l_atomic (payload_segment_excludes_stop__payload_insert_after storeA nodes first head head last).
  Intros. entailer!; intro Heq; subst anchor; contradiction.
Qed.
Lemma payload_segment_cons__payload_insert_after : forall {A}
  (storeA : Z -> A -> SeparationLogic.naive_C_Rules.expr)
  node value next prev stop last nodes,
  node <> 0 -> node <> stop ->
  SeparationLogic.naive_C_Rules.derivable1
    (SeparationLogic.naive_C_Rules.sepcon (storeA node value) (SeparationLogic.naive_C_Rules.sepcon (xizi_dll_links node next prev) (XiziStoreADLL.dllseg storeA next node stop last nodes)))
    (XiziStoreADLL.dllseg storeA node prev stop last (XiziStoreADLL.Build_DL_Node value node :: nodes)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface. intros; simpl; Exists next; entailer!. Qed.
Lemma payload_node_nonzero__payload_insert_after : forall node,
  SeparationLogic.naive_C_Rules.derivable1
    (xizi_dll_node node)
    (SeparationLogic.naive_C_Rules.andp (SeparationLogic.naive_C_Rules.coq_prop (node <> 0)) (xizi_dll_node node)).
Proof.
  Import SeparationLogic.naive_C_Rules CNotation Interface. intros; unfold xizi_dll_node; Intros; entailer!. Qed.
