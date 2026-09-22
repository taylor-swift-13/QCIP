Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.
Local Open Scope Z_scope.

(** An admissible public anchor is either an abstract member or the sentinel
    itself.  Keeping this as a proposition avoids exposing either internal
    predecessor cut in the public contracts. *)
Definition xizi_double_link_insert_before_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Pure sequence semantics for inserting [inserted] immediately before the
    first occurrence of [anchor] in the complete abstract sequence.  Reaching
    the end appends [inserted]; in particular this is the public sentinel-head
    behavior, because the sentinel is not an element of the abstract node
    sequence.  This is a list-level API transformation and does not expose the
    circular C pointer updates. *)
Fixpoint xizi_double_link_insert_before_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => inserted :: nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then inserted :: current :: suffix
      else current ::
           xizi_double_link_insert_before_nodes suffix anchor inserted
  end.

Lemma xizi_in_first_split__insert_before_dispatch_and_reassembly :
  forall (nodes : list Z) anchor,
    In anchor nodes ->
    exists prefix suffix,
      nodes = prefix ++ anchor :: suffix /\ ~ In anchor prefix.
Proof.
  induction nodes as [| current nodes IH]; intros anchor Hin.
  - contradiction.
  - destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current.
      exists nil, nodes.
      simpl.
      split; [reflexivity | tauto].
    + destruct Hin as [Heq | Hin].
      * contradiction.
      * destruct (IH anchor Hin) as [prefix [suffix [Hnodes Hnotin]]].
        exists (current :: prefix), suffix.
        simpl.
        rewrite Hnodes.
        split; [reflexivity |].
        intros [Heq | Hin_prefix]; contradiction.
Qed.
Lemma xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly :
  forall prefix suffix anchor inserted,
    ~ In anchor prefix ->
    xizi_double_link_insert_before_nodes
      (prefix ++ anchor :: suffix) anchor inserted =
    prefix ++ inserted :: anchor :: suffix.
Proof.
  induction prefix as [| current prefix IH];
    intros suffix anchor inserted Hnotin.
  - simpl.
    destruct (Z.eq_dec anchor anchor); [reflexivity | contradiction].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + exfalso.
      apply Hnotin.
      left; exact Heq.
    + f_equal.
      apply IH.
      intros Hin.
      apply Hnotin.
      right; exact Hin.
Qed.
Lemma xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly :
  forall nodes anchor inserted,
    ~ In anchor nodes ->
    xizi_double_link_insert_before_nodes nodes anchor inserted =
    nodes ++ inserted :: nil.
Proof.
  induction nodes as [| current nodes IH];
    intros anchor inserted Hnotin.
  - reflexivity.
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + exfalso.
      apply Hnotin.
      left; exact Heq.
    + f_equal.
      apply IH.
      intros Hin.
      apply Hnotin.
      right; exact Hin.
Qed.


(** Payload-preserving lift of the existing address-list operation.  A first
    anchor splits the sequence into an unchanged prefix and suffix; absence
    appends the same inserted logical node.  In the public contracts absence
    is the sentinel case.  No concrete pointer updates are encoded here. *)
Definition xizi_insert_before_payload {A : Type}
  (nodes : list (DLL.DL_Node A)) (anchor : Z)
  (inserted : DLL.DL_Node A)
  (result : list (DLL.DL_Node A)) : Prop :=
  (exists prefix current suffix,
    nodes = prefix ++ current :: suffix /\
    DLL.getPtr current = anchor /\
    ~ In anchor (XiziLocalDLL.ptrs prefix) /\
    result = prefix ++ inserted :: current :: suffix) \/
  (~ In anchor (XiziLocalDLL.ptrs nodes) /\ result = nodes ++ inserted :: nil).

(** Erasing payloads recovers the preserved original operation exactly. *)
Lemma xizi_insert_before_payload_address_semantics : forall {A}
  (nodes result : list (DLL.DL_Node A)) anchor inserted,
  xizi_insert_before_payload nodes anchor inserted result ->
  XiziLocalDLL.ptrs result =
  xizi_double_link_insert_before_nodes (XiziLocalDLL.ptrs nodes)
    anchor (DLL.getPtr inserted).
Proof.
  intros A nodes result anchor inserted H.
  destruct H as [(prefix & current & suffix & Hnodes & Hptr & Hfirst & Hresult) | [Habsent Hresult]].
  - subst nodes result. unfold XiziLocalDLL.ptrs in *.
    rewrite !map_app; simpl. rewrite Hptr.
    symmetry; apply xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly; assumption.
  - subst result. unfold XiziLocalDLL.ptrs in *.
    rewrite map_app; simpl.
    symmetry; apply xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly; assumption.
Qed.

Lemma first_payload_split__insert_before_payload : forall A (xs : list (DLL.DL_Node A)) a,
 In a (XiziLocalDLL.ptrs xs) ->
 exists pre cur suf, xs = pre ++ cur :: suf /\ DLL.getPtr cur = a /\ ~ In a (XiziLocalDLL.ptrs pre).
Proof.
 intros A xs; induction xs as [|x xs IH]; intros a Hin; simpl in Hin.
 - contradiction.
 - destruct (Z.eq_dec (DLL.getPtr x) a) as [E|N].
   + exists nil,x,xs; simpl; auto.
   + destruct Hin as [E|Hin]; [contradiction|].
     destruct (IH a Hin) as (pre&cur&suf&E&P&H).
     exists (x::pre),cur,suf. simpl. rewrite E. repeat split; auto.
     unfold XiziLocalDLL.ptrs; simpl. intros [C|C]; contradiction.
Qed.

Require Import Coq.Strings.String.
Lemma addr_split__insert_before_dispatch_and_reassembly : forall x px z pz xs ys,
 XiziLocalDLL.addr_dllseg x px z pz (xs ++ ys) |--
 EX y py, XiziLocalDLL.addr_dllseg x px y py xs ** XiziLocalDLL.addr_dllseg y py z pz ys.
Proof.
 intros; unfold XiziLocalDLL.addr_dllseg; rewrite XiziLocalDLL.addr_nodes_app.
 apply XiziLocalDLL.dllseg_split.
Qed.
Lemma addr_join__insert_before_dispatch_and_reassembly : forall x px y py z pz xs ys,
 XiziLocalDLL.addr_dllseg x px y py xs ** XiziLocalDLL.addr_dllseg y py z pz ys |--
 XiziLocalDLL.addr_dllseg x px z pz (xs ++ ys).
Proof.
 intros; unfold XiziLocalDLL.addr_dllseg; rewrite XiziLocalDLL.addr_nodes_app.
 apply XiziLocalDLL.dllseg_concat.
Qed.
Lemma addr_cons__insert_before_dispatch_and_reassembly : forall x px n z pz xs,
 &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
 &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> n **
 XiziLocalDLL.addr_dllseg n x z pz xs |--
 XiziLocalDLL.addr_dllseg x px z pz (x :: xs).
Proof.
 intros; unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes;
 simpl XiziLocalDLL.dllseg; unfold XiziLocalDLL.addr_store.
 Exists n; entailer!.
Qed.
Lemma payload_split__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys,
 XiziLocalDLL.payloads s (xs ++ ys) |-- XiziLocalDLL.payloads s xs ** XiziLocalDLL.payloads s ys.
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros ys; simpl [XiziLocalDLL.payloads].
 - entailer!.
 - sep_apply_l_atomic (IH ys); entailer!.
Qed.
Lemma payload_join__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys,
 XiziLocalDLL.payloads s xs ** XiziLocalDLL.payloads s ys |-- XiziLocalDLL.payloads s (xs ++ ys).
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros ys; simpl [XiziLocalDLL.payloads].
 - entailer!.
 - sep_apply_l_atomic (IH ys); entailer!.
Qed.
Lemma payload_insert__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys d n,
 XiziLocalDLL.payloads s (xs ++ ys) ** s n d |--
 XiziLocalDLL.payloads s (xs ++ DLL.Build_DL_Node d n :: ys).
Proof.
 intros. sep_apply_l_atomic (payload_split__insert_before_dispatch_and_reassembly A s xs ys).
 sep_apply_r_atomic (payload_join__insert_before_dispatch_and_reassembly A s xs (DLL.Build_DL_Node d n :: ys)).
 simpl XiziLocalDLL.payloads; entailer!.
Qed.
Lemma seg_excludes_field__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs x px y py h hn,
 XiziLocalDLL.dllseg s x px y py xs **
 &(h # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> hn |--
 “ ~ In h (XiziLocalDLL.ptrs xs) ”.
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros x px y py h hn.
 - simpl [XiziLocalDLL.ptrs]; entailer!; tauto.
 - simpl XiziLocalDLL.dllseg. Intros n. Intros. subst x.
   destruct (Z.eq_dec (DLL.getPtr a) h) as [E|N].
   + rewrite E.
     sep_apply_l_atomic (dup_store_ptr (&(h # "SysDoubleLinklistNode" ->ₛ "node_next")) n hn).
     entailer!.
   + prop_apply_p (IH n (DLL.getPtr a) y py h hn).
     Intros. entailer!. simpl [XiziLocalDLL.ptrs] in *; tauto.
Qed.
Lemma head_absent__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) h xs,
 XiziLocalDLL.store_dll s h xs |-- “ ~ In h (XiziLocalDLL.ptrs xs) ”.
Proof.
 intros; unfold XiziLocalDLL.store_dll; Intros first last.
 sep_apply_l_atomic (seg_excludes_field__insert_before_dispatch_and_reassembly A s xs first h h last h first).
 entailer!.
Qed.
Lemma addr_open__insert_before_dispatch_and_reassembly : forall x px z pz a xs,
 XiziLocalDLL.addr_dllseg x px z pz (a :: xs) |--
 EX n, “ x = a ” &&
 &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
 &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> n **
 XiziLocalDLL.addr_dllseg n x z pz xs.
Proof.
 intros; unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes;
 simpl XiziLocalDLL.dllseg; unfold XiziLocalDLL.addr_store.
 Intros n; Exists n; entailer!.
Qed.
Lemma addr_nil__insert_before_dispatch_and_reassembly : forall x px z pz,
 XiziLocalDLL.addr_dllseg x px z pz nil |-- “ x = z /\ px = pz ” && emp.
Proof. intros; unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes; simpl XiziLocalDLL.dllseg; entailer!. Qed.
Lemma payload_append__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs d n,
 XiziLocalDLL.payloads s xs ** s n d |--
 XiziLocalDLL.payloads s (xs ++ DLL.Build_DL_Node d n :: nil).
Proof.
 intros. sep_apply_r_atomic (payload_join__insert_before_dispatch_and_reassembly A s xs (DLL.Build_DL_Node d n :: nil)).
 simpl XiziLocalDLL.payloads; entailer!.
Qed.
