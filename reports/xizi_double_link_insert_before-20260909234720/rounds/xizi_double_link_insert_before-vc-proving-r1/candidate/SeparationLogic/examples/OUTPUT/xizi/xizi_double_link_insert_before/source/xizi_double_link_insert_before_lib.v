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
  (nodes : list (XiziStoreADLL.DL_Node A)) (anchor : Z)
  (inserted : XiziStoreADLL.DL_Node A)
  (result : list (XiziStoreADLL.DL_Node A)) : Prop :=
  (exists prefix current suffix,
    nodes = prefix ++ current :: suffix /\
    XiziStoreADLL.getPtr current = anchor /\
    ~ In anchor (xizi_dll_ptrs prefix) /\
    result = prefix ++ inserted :: current :: suffix) \/
  (~ In anchor (xizi_dll_ptrs nodes) /\ result = nodes ++ inserted :: nil).

(** Erasing payloads recovers the preserved original operation exactly. *)
Lemma xizi_insert_before_payload_address_semantics : forall {A}
  (nodes result : list (XiziStoreADLL.DL_Node A)) anchor inserted,
  xizi_insert_before_payload nodes anchor inserted result ->
  xizi_dll_ptrs result =
  xizi_double_link_insert_before_nodes (xizi_dll_ptrs nodes)
    anchor (XiziStoreADLL.getPtr inserted).
Proof.
  intros A nodes result anchor inserted H.
  destruct H as [(prefix & current & suffix & Hnodes & Hptr & Hfirst & Hresult) | [Habsent Hresult]].
  - subst nodes result. unfold xizi_dll_ptrs in *.
    rewrite !map_app; simpl. rewrite Hptr.
    symmetry; apply xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly; assumption.
  - subst result. unfold xizi_dll_ptrs in *.
    rewrite map_app; simpl.
    symmetry; apply xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly; assumption.
Qed.

Lemma first_payload_split__insert_before_payload : forall A (xs : list (XiziStoreADLL.DL_Node A)) a,
 In a (xizi_dll_ptrs xs) ->
 exists pre cur suf, xs = pre ++ cur :: suf /\ XiziStoreADLL.getPtr cur = a /\ ~ In a (xizi_dll_ptrs pre).
Proof.
 intros A xs; induction xs as [|x xs IH]; intros a Hin; simpl in Hin.
 - contradiction.
 - destruct (Z.eq_dec (XiziStoreADLL.getPtr x) a) as [E|N].
   + exists nil,x,xs; simpl; auto.
   + destruct Hin as [E|Hin]; [contradiction|].
     destruct (IH a Hin) as (pre&cur&suf&E&P&H).
     exists (x::pre),cur,suf. simpl. rewrite E. repeat split; auto.
     unfold xizi_dll_ptrs; simpl. intros [C|C]; contradiction.
Qed.
Lemma payload_insert__insert_before_payload : forall A (storeA : Z -> A -> Assertion) pre suf ins,
 xizi_dll_payloads storeA (pre ++ suf) **
 storeA (XiziStoreADLL.getPtr ins) (XiziStoreADLL.getData ins) |--
 xizi_dll_payloads storeA (pre ++ ins :: suf).
Proof.
 intros.
 sep_apply_l_atomic (payloads_split__storeA_shared storeA pre suf).
 sep_apply_r_atomic (payloads_join__storeA_shared storeA pre (ins :: suf)).
 unfold xizi_dll_payloads; simpl. entailer!.
Qed.
Lemma seg_absent__insert_before_payload : forall xs n p s l,
 xizi_dllseg n p s l xs |-- “ ~ In s xs ”.
Proof.
 induction xs as [|x xs IH]; intros.
 - simpl. entailer!.
 - unfold xizi_dllseg; simpl; fold xizi_dllseg.
   Intros next. Intros.
   prop_apply_p (IH next n s l).
   entailer!. subst. tauto.
Qed.
Lemma dll_absent__insert_before_payload : forall h xs,
 xizi_dll h xs |-- “ ~ In h xs ”.
Proof.
 intros. unfold xizi_dll, XiziDLL.dll. Intros f l.
 fold xizi_dllseg.
 prop_apply_p (seg_absent__insert_before_payload xs f h h l).
 entailer!.
Qed.
Lemma store_dll_absent__insert_before_payload : forall A (storeA : Z -> A -> Assertion) h xs,
 xizi_store_dll storeA h xs |-- “ ~ In h (xizi_dll_ptrs xs) ”.
Proof.
 intros. sep_apply_l_atomic (dll_decompose__storeA_shared storeA h xs).
 prop_apply_p (dll_absent__insert_before_payload h (xizi_dll_ptrs xs)).
 entailer!.
Qed.
Lemma payload_absent_result__insert_before_payload : forall A (xs result : list (XiziStoreADLL.DL_Node A)) a ins,
 ~ In a (xizi_dll_ptrs xs) ->
 xizi_insert_before_payload xs a ins result -> result = xs ++ ins :: nil.
Proof.
 intros A xs result a ins H R.
 destruct R as [(pre&cur&suf&E&P&F&R)|[N E]]; auto.
 subst xs. exfalso. apply H. unfold xizi_dll_ptrs.
 rewrite map_app. apply in_or_app. right. simpl. auto.
Qed.
Lemma seg_cut__insert_before_payload : forall pre suf n p s l a,
 xizi_dllseg n p s l (pre ++ a :: suf) |--
 EX ap an, “ a <> 0 ” && “ a <> s ” &&
 xizi_dllseg n p a ap pre **
 xizi_dll_links a an ap ** xizi_dllseg an a s l suf.
Proof.
 induction pre as [|x pre IH]; intros.
 - unfold xizi_dllseg; simpl; fold xizi_dllseg.
   Intros an. Intros. subst n. Exists p an.
   unfold xizi_dllseg; simpl. entailer!.
 - match goal with |- _ |-- ?Q => change ((“ n = x ” && “ n <> NULL ” && “ n <> s ” &&
     EX nn, xizi_dll_links n nn p ** xizi_dllseg nn n s l (pre ++ a :: suf)) |-- Q) end.
   Intros nn. Intros.
   sep_apply_l_atomic (IH suf nn n s l a).
   Intros ap an. Intros.
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle n nn p a an ap).
   Exists ap an.
   match goal with |- ?P |-- _ => change (P |-- “ a <> 0 ” && “ a <> s ” &&
     (“ n = x ” && “ n <> NULL ” && “ n <> a ” &&
       EX nn, xizi_dll_links n nn p ** xizi_dllseg nn n a ap pre) **
     xizi_dll_links a an ap ** xizi_dllseg an a s l suf) end.
   Exists nn. entailer!.
Qed.
Lemma seg_join__insert_before_payload : forall xs ys n p m mp s l sn sp,
 xizi_dllseg n p m mp xs ** xizi_dllseg m mp s l ys ** xizi_dll_links s sn sp |--
 xizi_dllseg n p s l (xs ++ ys) ** xizi_dll_links s sn sp.
Proof.
 induction xs as [|x xs IH]; intros.
 - unfold xizi_dllseg at 1. simpl. Intros. destruct H; subst. entailer!.
 - match goal with |- _ |-- ?Q => change ((“ n = x ” && “ n <> NULL ” && “ n <> m ” &&
     EX nn, xizi_dll_links n nn p ** xizi_dllseg nn n m mp xs) **
     xizi_dllseg m mp s l ys ** xizi_dll_links s sn sp |-- Q) end.
   Intros nn. Intros.
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle n nn p s sn sp).
   Intros.
   sep_apply_l_atomic (IH ys nn n m mp s l sn sp).
   match goal with |- ?P |-- _ => change (P |-- (“ n = x ” && “ n <> NULL ” && “ n <> s ” &&
     EX nn, xizi_dll_links n nn p ** xizi_dllseg nn n s l (xs ++ ys)) **
     xizi_dll_links s sn sp) end.
   Exists nn. entailer!.
Qed.
Lemma seg_cons__insert_before_payload : forall n nn p s l xs,
 n <> 0 -> n <> s ->
 xizi_dll_links n nn p ** xizi_dllseg nn n s l xs |--
 xizi_dllseg n p s l (n::xs).
Proof.
 intros. unfold xizi_dllseg; simpl. Exists nn. entailer!.
Qed.
Lemma dll_nonzero__insert_before_payload : forall h xs,
 xizi_dll h xs |-- “ h <> 0 ”.
Proof. intros. unfold xizi_dll, XiziDLL.dll. Intros f l. entailer!. Qed.
Lemma node_nonzero__insert_before_payload : forall n,
 xizi_dll_node n |-- “ n <> 0 ”.
Proof. intros. unfold xizi_dll_node. entailer!. Qed.
Lemma list_last__insert_before_payload : forall (xs : list Z),
 xs = nil \/ exists pre a, xs = pre ++ a :: nil.
Proof.
 intros xs. destruct xs as [|x xs]; [auto|right].
 destruct (@exists_last Z (x::xs)) as [pre [a E]]; [discriminate|].
 exists pre,a; exact E.
Qed.
Lemma seg_single__insert_before_payload : forall n p s,
 n <> 0 -> n <> s ->
 xizi_dll_links n s p |-- xizi_dllseg n p s n (n :: nil).
Proof. intros. unfold xizi_dllseg; simpl. Exists s. entailer!. Qed.
