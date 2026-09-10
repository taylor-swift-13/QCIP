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

(** The abstract head of a suffix.  The empty suffix corresponds to the
    circular sentinel, which the public C API reports as [NULL]. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | next :: _ => next
  end.

(** Mathematical observation returned by the next-node API.  It searches
    the complete abstract sequence for the first occurrence of [node] and
    returns the following node, or [NULL] at the end (and when absent). *)
Fixpoint xizi_double_link_next_value
  (nodes : list Z) (node : Z) : Z :=
  match nodes with
  | nil => 0
  | current :: suffix =>
      if Z.eq_dec current node
      then xizi_double_link_first_value suffix
      else xizi_double_link_next_value suffix node
  end.

(** Publicly admissible query nodes: either an abstract member or the
    circular sentinel itself.  The predicate intentionally hides all
    implementation-level prefix/suffix cuts. *)
Definition xizi_double_link_next_anchor
  (head : Z) (nodes : list Z) (node : Z) : Prop :=
  In node nodes \/ node = head.

(** Complete public observation for the next-node API.  A sentinel query
    wraps to the abstract first node (or [NULL] for the empty sequence);
    a member query uses the ordinary sequence successor observation. *)
Definition xizi_double_link_next_dispatch_value
  (nodes : list Z) (head node : Z) : Z :=
  if Z.eq_dec node head
  then xizi_double_link_first_value nodes
  else xizi_double_link_next_value nodes node.

Lemma xizi_double_link_next_value_first_occurrence__double_link_get_next_dispatch :
  forall (prefix suffix : list Z) (node : Z),
    ~ In node prefix ->
    xizi_double_link_next_value (prefix ++ node :: suffix) node =
      xizi_double_link_first_value suffix.
Proof.
  induction prefix as [|current prefix IH]; intros suffix node Hnotin.
  - simpl.
    destruct (Z.eq_dec node node); [reflexivity | contradiction].
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exfalso. apply Hnotin. now left.
    + apply IH. intro Hin. apply Hnotin. now right.
Qed.
Lemma xizi_double_link_first_occurrence_split__double_link_get_next_dispatch :
  forall (nodes : list Z) (node : Z),
    In node nodes ->
    exists prefix suffix,
      nodes = prefix ++ node :: suffix /\ ~ In node prefix.
Proof.
  induction nodes as [|current rest IH]; intros node Hin.
  - contradiction.
  - destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exists nil, rest. simpl. split; [reflexivity |].
      intros Hnil. exact Hnil.
    + destruct Hin as [Heq | Hin]; [contradiction |].
      destruct (IH node Hin) as (prefix & suffix & Hshape & Hfresh).
      exists (current :: prefix), suffix. simpl.
      split.
      * now rewrite Hshape.
      * intros [Heq | Hin']; [contradiction | now apply Hfresh].
Qed.
Lemma xizi_double_link_dispatch_first_occurrence__double_link_get_next_dispatch :
  forall (prefix suffix : list Z) (head node : Z),
    node <> head ->
    ~ In node prefix ->
    xizi_double_link_next_dispatch_value (prefix ++ node :: suffix) head node =
      xizi_double_link_first_value suffix.
Proof.
  intros prefix suffix head node Hneq Hfresh.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec node head); [contradiction |].
  now apply xizi_double_link_next_value_first_occurrence__double_link_get_next_dispatch.
Qed.

Lemma seg_nonzero__dll_next_rec_last_dispatch : forall xs n p s l,
 s <> 0 -> xizi_dllseg n p s l xs |-- “ n <> 0 ”.
Proof.
 intros xs n p s l Hs. destruct xs; unfold xizi_dllseg; simpl.
 - Intros. destruct H; subst; entailer!.
 - Intros q. Intros. entailer!.
Qed.
Lemma seg_split__dll_next_rec_last_dispatch : forall before node after n p s l,
 ~ In node before -> s <> 0 ->
 xizi_dllseg n p s l (before ++ node :: after) |--
 EX prev next, “ node <> 0 ” && “ node <> s ” && “ next <> 0 ” &&
 xizi_dllseg n p node prev before ** xizi_dll_links node next prev **
 xizi_dllseg next node s l after.
Proof.
 induction before as [|a before IH]; intros node after n p s l Hnot Hs.
 - cbn [app]. unfold xizi_dllseg at 1; cbn [XiziDLL.dllseg].
   Intros next. Intros. subst n. fold xizi_dllseg. fold xizi_dll_links.
   prop_apply_p (seg_nonzero__dll_next_rec_last_dispatch after next node s l Hs).
   Exists p next. unfold xizi_dllseg; cbn [XiziDLL.dllseg]. entailer!.
 - cbn [app]. unfold xizi_dllseg at 1; cbn [XiziDLL.dllseg].
   Intros q. Intros. subst n. fold xizi_dllseg. fold xizi_dll_links.
   assert (Ha : a <> node) by (simpl in Hnot; tauto).
   assert (Hb : ~ In node before) by (simpl in Hnot; tauto).
   sep_apply_l_atomic (IH node after q a s l Hb Hs).
   Intros prev next. Exists prev next.
   unfold xizi_dllseg; cbn [XiziDLL.dllseg]. Exists q. entailer!.
Qed.
Lemma seg_join__dll_next_rec_last_dispatch : forall before n p node prev next s last after hf hl,
 node <> 0 -> node <> s ->
 xizi_dll_links s hf hl ** xizi_dllseg n p node prev before **
 xizi_dll_links node next prev ** xizi_dllseg next node s last after |--
 xizi_dll_links s hf hl ** xizi_dllseg n p s last (before ++ node :: after).
Proof.
 induction before as [|a before IH]; intros n p node prev next s last after hf hl Hn Hs.
 - cbn [app]. unfold xizi_dllseg at 1; cbn [XiziDLL.dllseg].
   Intros. destruct H as [H1 H2]. subst n p.
   unfold xizi_dllseg; cbn [XiziDLL.dllseg]. Exists next.
   unfold xizi_dll_links. entailer!.
 - cbn [app]. unfold xizi_dllseg at 1; cbn [XiziDLL.dllseg].
   Intros q. Intros. subst n. fold xizi_dllseg. fold xizi_dll_links.
   destruct (Z.eq_dec a s) as [Heq|Hneq].
   + subst a. sep_apply_l_atomic (xizi_dll_links_neq__dll_len_payload_cycle s hf hl s q p). entailer!.
   + sep_apply_l_atomic (IH q a node prev next s last after hf hl Hn Hs).
     unfold xizi_dllseg; cbn [XiziDLL.dllseg]. Exists q. unfold xizi_dll_links. entailer!.
Qed.
Lemma seg_first__dll_next_rec_last_dispatch : forall xs n p s l,
 xizi_dllseg n p s l xs |--
 “ (n = s -> xizi_double_link_first_value xs = 0) /\
   (n <> s -> xizi_double_link_first_value xs = n) ”.
Proof.
 intros xs n p s l. destruct xs; unfold xizi_dllseg; cbn [XiziDLL.dllseg].
 - Intros. destruct H. subst n. entailer!; simpl; tauto.
 - Intros q. Intros. subst n. entailer!; simpl; tauto.
Qed.
Lemma seg_member_exclude__dll_next_rec_last_dispatch : forall xs n p s l node,
 In node xs -> xizi_dllseg n p s l xs |-- “ node <> s ”.
Proof.
 induction xs as [|a xs IH]; intros n p s l node Hin; [contradiction|].
 unfold xizi_dllseg at 1; cbn [XiziDLL.dllseg]. Intros q. Intros. subst n.
 destruct Hin as [Heq|Hin].
 - subst node; entailer!.
 - fold xizi_dllseg. prop_apply_p (IH q a s l node Hin). entailer!.
Qed.
Lemma dll_expose__dll_next_rec_last_dispatch : forall head before node after,
 ~ In node before ->
 xizi_dll head (before ++ node :: after) |--
 EX first last prev next,
 “ head <> 0 ” && “ first <> 0 ” && “ node <> 0 ” && “ node <> head ” && “ next <> 0 ” &&
 xizi_dll_links head first last ** xizi_dllseg first head node prev before **
 xizi_dll_links node next prev ** xizi_dllseg next node head last after.
Proof.
 intros head before node after Hnot. unfold xizi_dll, XiziDLL.dll.
 Intros first last. Intros. fold xizi_dllseg. fold xizi_dll_links.
 prop_apply_p (seg_nonzero__dll_next_rec_last_dispatch (before ++ node :: after) first head head last H). Intros.
 sep_apply_l_atomic (seg_split__dll_next_rec_last_dispatch before node after first head head last Hnot H).
 Intros prev next. Exists first last prev next. entailer!.
Qed.
Lemma dll_reassemble__dll_next_rec_last_dispatch : forall head first last node prev next before after,
 head <> 0 -> node <> 0 -> node <> head ->
 xizi_dll_links head first last ** xizi_dllseg first head node prev before **
 xizi_dll_links node next prev ** xizi_dllseg next node head last after |--
 xizi_dll head (before ++ node :: after).
Proof.
 intros head first last node prev next before after Hh Hn Hneq.
 sep_apply_l_atomic (seg_join__dll_next_rec_last_dispatch before first head node prev next head last after first last Hn Hneq).
 sep_apply_r_atomic (xizi_dll_close head first last (before ++ node :: after) Hh).
 entailer!.
Qed.
Lemma store_member_exclude__dll_next_rec_last_dispatch : forall A (storeA: Z -> A -> Assertion) head nodes node,
 In node (xizi_dll_ptrs nodes) ->
 xizi_store_dll storeA head nodes |-- “ node <> head ”.
Proof.
 intros A storeA head nodes node Hin.
 sep_apply_l_atomic (dll_decompose__storeA_shared storeA head nodes).
 unfold xizi_dll, XiziDLL.dll. Intros first last. fold xizi_dllseg.
 prop_apply_p (seg_member_exclude__dll_next_rec_last_dispatch (xizi_dll_ptrs nodes) first head head last node Hin).
 entailer!.
Qed.
