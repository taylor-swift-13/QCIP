Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

Import ListNotations.
Import CRules.
Import DLL.
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
  (nodes : list (DL_Node A)) (anchor : Z)
  (inserted : DL_Node A)
  (result : list (DL_Node A)) : Prop :=
  (exists prefix current suffix,
    nodes = prefix ++ current :: suffix /\
    getPtr current = anchor /\
    ~ In anchor (ptrs prefix) /\
    result = prefix ++ inserted :: current :: suffix) \/
  (~ In anchor (ptrs nodes) /\ result = nodes ++ inserted :: nil).

(** Erasing payloads recovers the preserved original operation exactly. *)
Lemma xizi_insert_before_payload_address_semantics : forall {A}
  (nodes result : list (DL_Node A)) anchor inserted,
  xizi_insert_before_payload nodes anchor inserted result ->
  ptrs result =
  xizi_double_link_insert_before_nodes (ptrs nodes)
    anchor (getPtr inserted).
Proof.
  intros A nodes result anchor inserted H.
  destruct H as [(prefix & current & suffix & Hnodes & Hptr & Hfirst & Hresult) | [Habsent Hresult]].
  - subst nodes result. unfold ptrs in *.
    rewrite !map_app; simpl. rewrite Hptr.
    symmetry; apply xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly; assumption.
  - subst result. unfold ptrs in *.
    rewrite map_app; simpl.
    symmetry; apply xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly; assumption.
Qed.

Lemma first_payload_split__insert_before_payload : forall A (xs : list (DL_Node A)) a,
 In a (ptrs xs) ->
 exists pre cur suf, xs = pre ++ cur :: suf /\ getPtr cur = a /\ ~ In a (ptrs pre).
Proof.
 intros A xs; induction xs as [|x xs IH]; intros a Hin; simpl in Hin.
 - contradiction.
 - destruct (Z.eq_dec (getPtr x) a) as [E|N].
   + exists nil,x,xs; simpl; auto.
   + destruct Hin as [E|Hin]; [contradiction|].
     destruct (IH a Hin) as (pre&cur&suf&E&P&H).
     exists (x::pre),cur,suf. simpl. rewrite E. repeat split; auto.
     unfold ptrs; simpl. intros [C|C]; contradiction.
Qed.

Require Import Coq.Strings.String.
Lemma addr_split__insert_before_dispatch_and_reassembly : forall x px z pz xs ys,
 addr_dllseg x px z pz (xs ++ ys) |--
 EX y py, addr_dllseg x px y py xs ** addr_dllseg y py z pz ys.
Proof.
 intros; unfold addr_dllseg; rewrite addr_nodes_app.
 apply dllseg_split.
Qed.
Lemma addr_join__insert_before_dispatch_and_reassembly : forall x px y py z pz xs ys,
 addr_dllseg x px y py xs ** addr_dllseg y py z pz ys |--
 addr_dllseg x px z pz (xs ++ ys).
Proof.
 intros; unfold addr_dllseg; rewrite addr_nodes_app.
 apply dllseg_concat.
Qed.
Lemma addr_cons__insert_before_dispatch_and_reassembly : forall x px n z pz xs,
 &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
 &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> n **
 addr_dllseg n x z pz xs |--
 addr_dllseg x px z pz (x :: xs).
Proof.
 intros; unfold addr_dllseg, addr_nodes;
 simpl dllseg; unfold addr_store.
 Exists n; entailer!.
Qed.
Lemma payload_split__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys,
 payloads s (xs ++ ys) |-- payloads s xs ** payloads s ys.
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros ys; simpl [payloads].
 - entailer!.
 - sep_apply_l_atomic (IH ys); entailer!.
Qed.
Lemma payload_join__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys,
 payloads s xs ** payloads s ys |-- payloads s (xs ++ ys).
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros ys; simpl [payloads].
 - entailer!.
 - sep_apply_l_atomic (IH ys); entailer!.
Qed.
Lemma payload_insert__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs ys d n,
 payloads s (xs ++ ys) ** s n d |--
 payloads s (xs ++ Build_DL_Node d n :: ys).
Proof.
 intros. sep_apply_l_atomic (payload_split__insert_before_dispatch_and_reassembly A s xs ys).
 sep_apply_r_atomic (payload_join__insert_before_dispatch_and_reassembly A s xs (Build_DL_Node d n :: ys)).
 simpl payloads; entailer!.
Qed.
Lemma seg_excludes_field__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs x px y py h hn,
 dllseg s x px y py xs **
 &(h # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> hn |--
 “ ~ In h (ptrs xs) ”.
Proof.
 intros A s xs; induction xs as [|a xs IH]; intros x px y py h hn.
 - simpl [ptrs]; entailer!; tauto.
 - simpl dllseg. Intros n. Intros. subst x.
   destruct (Z.eq_dec (getPtr a) h) as [E|N].
   + rewrite E.
     sep_apply_l_atomic (dup_store_ptr (&(h # "SysDoubleLinklistNode" ->ₛ "node_next")) n hn).
     entailer!.
   + prop_apply_p (IH n (getPtr a) y py h hn).
     Intros. entailer!. simpl [ptrs] in *; tauto.
Qed.
Lemma head_absent__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) h xs,
 store_dll s h xs |-- “ ~ In h (ptrs xs) ”.
Proof.
 intros; unfold store_dll; Intros first last.
 sep_apply_l_atomic (seg_excludes_field__insert_before_dispatch_and_reassembly A s xs first h h last h first).
 entailer!.
Qed.
Lemma addr_open__insert_before_dispatch_and_reassembly : forall x px z pz a xs,
 addr_dllseg x px z pz (a :: xs) |--
 EX n, “ x = a ” &&
 &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
 &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> n **
 addr_dllseg n x z pz xs.
Proof.
 intros; unfold addr_dllseg, addr_nodes;
 simpl dllseg; unfold addr_store.
 Intros n; Exists n; entailer!.
Qed.
Lemma addr_nil__insert_before_dispatch_and_reassembly : forall x px z pz,
 addr_dllseg x px z pz nil |-- “ x = z /\ px = pz ” && emp.
Proof. intros; unfold addr_dllseg, addr_nodes; simpl dllseg; entailer!. Qed.
Lemma payload_append__insert_before_dispatch_and_reassembly : forall A (s: Z -> A -> Assertion) xs d n,
 payloads s xs ** s n d |--
 payloads s (xs ++ Build_DL_Node d n :: nil).
Proof.
 intros. sep_apply_r_atomic (payload_join__insert_before_dispatch_and_reassembly A s xs (Build_DL_Node d n :: nil)).
 simpl payloads; entailer!.
Qed.

Lemma addr_store_dll_unfold__entail_dispatch_decomposition : forall head nodes,
 addr_store_dll head nodes |--
 EX first last,
 &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
 &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
 addr_dllseg first head head last nodes.
Proof.
 intros; unfold addr_store_dll, store_dll; Intros first last.
 Exists first last; fold (addr_dllseg first head head last nodes); entailer!.
Qed.
Lemma addr_single__return_store_reassembly : forall x px z,
  &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
  &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> z |--
  addr_dllseg x px z x (x :: nil).
Proof.
  intros; unfold addr_dllseg, addr_nodes, addr_store; simpl dllseg.
  Exists z; entailer!.
Qed.
Lemma addr_snoc__return_store_reassembly : forall x px y py z xs,
  addr_dllseg x px y py xs **
  &(y # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> py **
  &(y # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> z |--
  addr_dllseg x px z y (xs +:: y).
Proof.
  intros.
  sep_apply_l_atomic (addr_single__return_store_reassembly y py z).
  sep_apply_l_atomic (addr_join__insert_before_dispatch_and_reassembly
    x px y py z y xs (y :: nil)).
  entailer!.
Qed.
Lemma addr_store_single__return_store_reassembly : forall head node,
  &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node |--
  addr_store_dll head (node :: nil).
Proof.
  intros; unfold addr_store_dll, store_dll, addr_nodes, addr_store.
  simpl dllseg; Exists node node head; entailer!.
Qed.
Lemma addr_store_append__return_store_reassembly : forall head first prev before_prev prefix node,
  addr_dllseg first head prev before_prev prefix **
  &(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> before_prev **
  &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first |--
  addr_store_dll head ((prefix +:: prev) +:: node).
Proof.
  intros.
  sep_apply_l_atomic (addr_snoc__return_store_reassembly
    first head prev before_prev node prefix).
  sep_apply_l_atomic (addr_snoc__return_store_reassembly
    first head node prev head (prefix +:: prev)).
  unfold addr_store_dll, store_dll.
  Exists first node.
  fold (addr_dllseg first head head node ((prefix +:: prev) +:: node)).
  entailer!.
Qed.
Lemma addr_store_middle__return_store_reassembly :
  forall head first last prev before_prev prefix node anchor next suffix,
  addr_dllseg first head prev before_prev prefix **
  &(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> before_prev **
  &(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor **
  &(anchor # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node **
  &(anchor # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
  addr_dllseg next anchor head last suffix **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first |--
  addr_store_dll head
    ((prefix +:: prev) ++ node :: anchor :: suffix).
Proof.
  intros.
  sep_apply_l_atomic (addr_snoc__return_store_reassembly
    first head prev before_prev node prefix).
  sep_apply_l_atomic (addr_snoc__return_store_reassembly
    first head node prev anchor (prefix +:: prev)).
  sep_apply_l_atomic (addr_cons__insert_before_dispatch_and_reassembly
    anchor node next head last suffix).
  unfold addr_store_dll, store_dll.
  Exists first last.
  fold (addr_dllseg first head head last
    ((prefix +:: prev) ++ node :: anchor :: suffix)).
  cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
  cancel (&(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
  replace (((prefix +:: prev) ++ node :: anchor :: suffix)%list)
    with ((((prefix +:: prev) +:: node) ++ anchor :: suffix)%list)
    by (rewrite <- app_assoc; reflexivity).
  sep_apply_r_atomic (addr_join__insert_before_dispatch_and_reassembly
    first head anchor node head last
    ((prefix +:: prev) +:: node) (anchor :: suffix)).
  entailer!.
  apply derivable1_sepcon_comm.
Qed.
Lemma addr_store_front__return_store_reassembly : forall head last node anchor next suffix,
  &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head **
  &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor **
  &(anchor # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node **
  &(anchor # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
  addr_dllseg next anchor head last suffix **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node |--
  addr_store_dll head (node :: anchor :: suffix).
Proof.
  intros.
  sep_apply_l_atomic (addr_cons__insert_before_dispatch_and_reassembly
    anchor node next head last suffix).
  sep_apply_l_atomic (addr_cons__insert_before_dispatch_and_reassembly
    node head anchor head last (anchor :: suffix)).
  unfold addr_store_dll, store_dll.
  Exists node last.
  fold (addr_dllseg node head head last (node :: anchor :: suffix)).
  entailer!.
Qed.
