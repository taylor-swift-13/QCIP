Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

Fixpoint xizi_dll_remove_first (node : Z) (nodes : list Z) : list Z :=
  match nodes with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current node
      then suffix
      else current :: xizi_dll_remove_first node suffix
  end.

Lemma xizi_dll_remove_first_split__spec_derivations_direct :
  forall (node : Z) (nodes : list Z),
    In node nodes ->
    exists prefix suffix,
      nodes = prefix ++ node :: suffix /\
      ~ In node prefix /\
      xizi_dll_remove_first node nodes = prefix ++ suffix.
Proof.
  intros node nodes.
  induction nodes as [| current tail IH].
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
      destruct (IH Hin) as (prefix & suffix & Hnodes & Hnotin & Hremove).
      exists (current :: prefix), suffix.
      split.
      * simpl. rewrite Hnodes. reflexivity.
      * split.
        -- simpl. intros [Heq | Hmember].
           ++ congruence.
           ++ contradiction.
        -- simpl. destruct (Z.eq_dec current node); [contradiction |].
           rewrite Hremove. reflexivity.
Qed.

(** One-field views are useful at the cut immediately before or after the
    removed node.  They are representation predicates, not an executable
    model of the C updates. *)
Definition xizi_dll_next (node next : addr) : Assertion :=
  &(node # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.next_field) # Ptr |-> next.

Definition xizi_dll_prev (node prev : addr) : Assertion :=
  &(node # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.prev_field) # Ptr |-> prev.

(** [xizi_dllseg_shift_tail head prev last nodes] owns a nonempty-or-empty
    prefix tail.  It owns every predecessor field and every internal next
    field, but deliberately omits the final [last.next] field: that is the
    boundary field pointing at the node selected for removal. *)
Fixpoint xizi_dllseg_shift_tail
  (head prev last : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil => “ prev = last ” && emp
  | node :: rest =>
      “ node <> NULL ” &&
      “ node <> head ” &&
      xizi_dll_prev node prev **
      match rest with
      | nil => “ node = last ” && emp
      | next :: _ =>
          xizi_dll_next node next **
          xizi_dllseg_shift_tail head node last rest
      end
  end.

(** Prefix fragment of a circular DLL, ending immediately before a removed
    node.  For an empty prefix [last = head] and the fragment is empty;
    otherwise it additionally owns [head.next]. *)
Definition xizi_dllseg_shift
  (head last : addr) (prefix : list addr) : Assertion :=
  “ head <> NULL ” &&
  match prefix with
  | nil => “ last = head ” && emp
  | first :: _ =>
      xizi_dll_next head first **
      xizi_dllseg_shift_tail head head last prefix
  end.

(** Full suffix tail after the first suffix node.  The base case owns the
    sentinel's [prev] field, closing the reverse side of the circle. *)
Fixpoint xizi_dllseg_shift_rev_tail
  (head prev node : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil => “ node = head ” && xizi_dll_prev head prev
  | expected :: rest =>
      “ node = expected ” &&
      “ node <> NULL ” &&
      “ node <> head ” &&
      EX next : addr,
        xizi_dll_links node next prev **
        xizi_dllseg_shift_rev_tail head node next rest
  end.

(** Suffix fragment beginning immediately after a removed node.  It omits
    the first node's [prev] field, which is precisely the other boundary
    field updated by removal.  The empty suffix identifies that boundary
    node with the sentinel and owns no field. *)
Definition xizi_dllseg_shift_rev
  (node head : addr) (suffix : list addr) : Assertion :=
  “ head <> NULL ” &&
  match suffix with
  | nil => “ node = head ” && emp
  | expected :: rest =>
      “ node = expected ” &&
      “ node <> NULL ” &&
      “ node <> head ” &&
      EX next : addr,
        xizi_dll_next node next **
        xizi_dllseg_shift_rev_tail head node next rest
  end.

Lemma xizi_dll_links_rev__dll_cut_split_reconnect : forall node next prev,
  xizi_dll_prev node prev ** xizi_dll_next node next |--
  xizi_dll_links node next prev.
Proof.
  intros.
  change
    (xizi_dll_prev node prev ** xizi_dll_next node next |--
     xizi_dll_next node next ** xizi_dll_prev node prev).
  cancel (xizi_dll_prev node prev).
  entailer!.
Qed.
Lemma xizi_dll_cut_frame_reorder__dll_cut_split_reconnect :
  forall head first last first0 prefix node suffix,
  xizi_dll_links head first last **
  xizi_dllseg first0 head head last (prefix ++ node :: suffix) |--
  xizi_dll_next head first **
  (xizi_dllseg first0 head head last (prefix ++ node :: suffix) **
   xizi_dll_prev head last).
Proof.
  intros.
  unfold xizi_dll_links, XiziDLL.links,
    xizi_dll_next, xizi_dll_prev.
  entailer!.
Qed.
Lemma xizi_dllseg_shift_head_nonnull__dll_cut_split_reconnect :
  forall head prev prefix,
  xizi_dllseg_shift head prev prefix |-- “ head <> NULL ”.
Proof.
  intros head prev prefix.
  unfold xizi_dllseg_shift.
  destruct prefix; entailer!.
Qed.
Lemma xizi_dllseg_with_sentinel_prev_to_rev_tail__dll_cut_split_reconnect :
  forall nodes node prev head last,
  xizi_dllseg node prev head last nodes **
  xizi_dll_prev head last |--
  xizi_dllseg_shift_rev_tail head prev node nodes.
Proof.
  induction nodes as [| expected rest IH]; intros node prev head last.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hnode Hprev].
    subst node; subst last.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst node.
    Exists next.
    fold xizi_dllseg.
    unfold xizi_dllseg, XiziDLL.dllseg in IH.
    sep_apply (IH next expected head last).
    unfold xizi_dll_links, XiziDLL.links,
      xizi_dllseg_shift_rev_tail.
    entailer!.
Qed.
Lemma xizi_dllseg_rev_tail_to_segment__dll_cut_split_reconnect :
  forall nodes head prev node,
  xizi_dllseg_shift_rev_tail head prev node nodes |--
  EX last,
    xizi_dllseg node prev head last nodes **
    xizi_dll_prev head last.
Proof.
  induction nodes as [| expected rest IH]; intros head prev node.
  - simpl.
    Intros.
    subst node.
    Exists prev.
    unfold xizi_dllseg, XiziDLL.dllseg, xizi_dll_prev.
    simpl; entailer!.
  - simpl.
    Intros next.
    Intros.
    subst node.
    fold xizi_dllseg.
    sep_apply (IH head expected next).
    Intros last.
    Exists last.
    unfold xizi_dllseg, XiziDLL.dllseg,
      xizi_dll_links, XiziDLL.links,
      xizi_dllseg_shift_rev_tail.
    simpl.
    Exists next.
    entailer!.
Qed.
Lemma xizi_dllseg_shift_rev_to_segment__dll_cut_split_reconnect :
  forall suffix node prev head,
  xizi_dll_prev node prev **
  xizi_dllseg_shift_rev node head suffix |--
  EX last,
    xizi_dllseg node prev head last suffix **
    xizi_dll_prev head last.
Proof.
  intros suffix node prev head.
  destruct suffix as [| expected rest].
  - unfold xizi_dllseg_shift_rev.
    simpl.
    Intros.
    subst node.
    Exists prev.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl; entailer!.
  - unfold xizi_dllseg_shift_rev.
    simpl.
    Intros next.
    Intros.
    subst node.
    fold xizi_dllseg.
    sep_apply
      (xizi_dllseg_rev_tail_to_segment__dll_cut_split_reconnect
         rest head expected next).
    Intros last.
    Exists last.
    unfold xizi_dllseg, XiziDLL.dllseg,
      xizi_dll_links, XiziDLL.links,
      xizi_dll_next, xizi_dll_prev.
    simpl.
    Exists next.
    entailer!.
Qed.
Lemma xizi_dll_links_frame_rev__dll_cut_split_reconnect :
  forall node next prev (P : Assertion),
  xizi_dll_prev node prev ** xizi_dll_next node next ** P |--
  xizi_dll_links node next prev ** P.
Proof.
  intros node next prev P.
  sep_apply
    (xizi_dll_links_rev__dll_cut_split_reconnect node next prev).
  entailer!.
Qed.
Lemma xizi_dllseg_cons_rev__dll_cut_split_reconnect :
  forall first next prev stop last rest,
  first <> NULL ->
  first <> stop ->
  xizi_dll_links first next prev **
  xizi_dllseg next first stop last rest |--
  xizi_dllseg first prev stop last (first :: rest).
Proof.
  intros first next prev stop last rest Hnonnull Hnotstop.
  unfold xizi_dllseg, XiziDLL.dllseg.
  simpl.
  Exists next.
  entailer!.
Qed.
Lemma xizi_dllseg_shift_edge_prepend__dll_cut_split_reconnect :
  forall rest expected head prev0 prev node last suffix,
  expected <> NULL ->
  expected <> head ->
  xizi_dll_next prev0 expected **
  (xizi_dll_prev expected prev0 **
   ((match rest with
     | nil => “ expected = prev ” && emp
     | expected2 :: _ =>
         xizi_dll_next expected expected2 **
         xizi_dllseg_shift_tail head expected prev rest
     end) **
    (xizi_dll_next prev node **
     xizi_dllseg node prev head last suffix))) |--
  xizi_dll_next prev0 expected **
  xizi_dllseg expected prev0 head last ((expected :: rest) ++ suffix).
Proof.
  induction rest as [| expected2 rest IH];
    intros expected head prev0 prev node last suffix
      Hexpected_nonnull Hexpected_not_head.
  - cbn [app].
    Intros.
    subst prev.
    sep_apply_r_atomic
      (xizi_dllseg_cons_rev__dll_cut_split_reconnect
         expected node prev0 head last suffix
         Hexpected_nonnull Hexpected_not_head).
    cancel (xizi_dll_next prev0 expected).
    sep_apply_r_atomic
      (xizi_dll_links_frame_rev__dll_cut_split_reconnect
         expected node prev0
         (xizi_dllseg node expected head last suffix)).
    entailer!.
  - cbn [app].
    unfold xizi_dllseg_shift_tail at 1.
    Intros_p Hinner_nonnull.
    Intros_p Hinner_not_head.
    cancel (xizi_dll_next prev0 expected).
    pose proof
      (xizi_dllseg_cons_rev__dll_cut_split_reconnect
         expected expected2 prev0 head last
         (expected2 :: (rest ++ suffix))
         Hexpected_nonnull Hexpected_not_head) as Hcons.
    cbn [app] in Hcons.
    sep_apply_r_atomic Hcons.
    sep_apply_r_atomic
      (xizi_dll_links_frame_rev__dll_cut_split_reconnect
         expected expected2 prev0
         (xizi_dllseg expected2 expected head last
            (expected2 :: (rest ++ suffix)))).
    pose proof
      (IH expected2 head expected prev node last suffix
         Hinner_nonnull Hinner_not_head) as Hih.
    cbn [app] in Hih.
    cancel (xizi_dll_prev expected prev0).
    exact Hih.
Qed.
Lemma xizi_dllseg_shift_prepend__dll_cut_split_reconnect :
  forall prefix head prev node last suffix,
  xizi_dllseg_shift head prev prefix **
  xizi_dll_next prev node **
  xizi_dllseg node prev head last suffix |--
  EX first,
    xizi_dll_next head first **
    xizi_dllseg first head head last (prefix ++ suffix).
Proof.
  intros prefix head prev node last suffix.
  destruct prefix as [| expected rest].
  - unfold xizi_dllseg_shift.
    simpl.
    Intros.
    subst prev.
    Exists node.
    entailer!.
  - unfold xizi_dllseg_shift.
    Intros_p Hhead_nonnull.
    unfold xizi_dllseg_shift_tail at 1.
    Intros_p Hexpected_nonnull.
    Intros_p Hexpected_not_head.
    Exists expected.
    sep_apply_r_atomic
      (xizi_dllseg_shift_edge_prepend__dll_cut_split_reconnect
         rest expected head head prev node last suffix
         Hexpected_nonnull Hexpected_not_head).
    entailer!.
Qed.
Lemma xizi_dll_reconnect_cut__dll_cut_split_reconnect :
  forall head prefix suffix node_prev node_next,
  xizi_dllseg_shift head node_prev prefix **
  xizi_dll_next node_prev node_next **
  xizi_dll_prev node_next node_prev **
  xizi_dllseg_shift_rev node_next head suffix |--
  xizi_dll head (prefix ++ suffix).
Proof.
  intros head prefix suffix node_prev node_next.
  prop_apply_p
    (xizi_dllseg_shift_head_nonnull__dll_cut_split_reconnect
       head node_prev prefix).
  Intros_p Hhead_nonnull.
  sep_apply
    (xizi_dllseg_shift_rev_to_segment__dll_cut_split_reconnect
       suffix node_next node_prev head).
  Intros last.
  sep_apply
    (xizi_dllseg_shift_prepend__dll_cut_split_reconnect
       prefix head node_prev node_next last suffix).
  Intros first.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  split_pure_spatial.
  - unfold xizi_dllseg.
    cancel (XiziDLL.dllseg first head head last (prefix ++ suffix)).
    unfold xizi_dll_links, XiziDLL.links,
      xizi_dll_next, xizi_dll_prev.
    entailer!.
  - dump_pre_spatial.
    exact Hhead_nonnull.
Qed.
Lemma xizi_dllseg_cut_at_node__dll_cut_split_reconnect :
  forall prefix first prev head last node suffix,
  head <> NULL ->
  xizi_dllseg first prev head last (prefix ++ node :: suffix) **
  xizi_dll_prev head last |--
  EX node_next node_prev,
    “ first = match prefix with
              | nil => node
              | expected :: _ => expected
              end ” &&
    “ node <> NULL ” &&
    (match prefix with
     | nil =>
         xizi_dllseg_shift_tail head prev node_prev nil
     | _ =>
         xizi_dllseg_shift_tail head prev node_prev prefix **
         xizi_dll_next node_prev node
     end) **
    xizi_dll_next node node_next **
    xizi_dll_prev node node_prev **
    xizi_dll_prev node_next node **
    xizi_dllseg_shift_rev node_next head suffix.
Proof.
  induction prefix as [| expected rest IH];
    intros first prev head last node suffix Hhead_nonnull.
  - simpl app.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros node_next.
    Intros.
    subst first.
    pose proof
      (xizi_dllseg_with_sentinel_prev_to_rev_tail__dll_cut_split_reconnect
         suffix node_next node head last) as Hsuffix.
    unfold xizi_dllseg, XiziDLL.dllseg in Hsuffix.
    sep_apply Hsuffix.
    destruct suffix as [| suffix_first suffix_rest].
    + simpl.
      Intros.
      Exists node_next prev.
      unfold xizi_dllseg_shift_rev, xizi_dllseg_shift_tail.
      simpl; entailer!.
      subst node_next.
      cancel (xizi_dll_prev head node).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + simpl.
      Intros suffix_next.
      Intros.
      Exists node_next prev.
      unfold xizi_dllseg_shift_rev, xizi_dllseg_shift_tail.
      simpl.
      Exists suffix_next.
      entailer!.
      subst node_next.
      change
        ((xizi_dll_next suffix_first suffix_next **
          xizi_dll_prev suffix_first node) **
         xizi_dll_links node suffix_first prev |--
         xizi_dll_next suffix_first suffix_next **
         (xizi_dll_next node suffix_first **
         (xizi_dll_prev node prev ** xizi_dll_prev suffix_first node))).
      cancel (xizi_dll_next suffix_first suffix_next).
      cancel (xizi_dll_prev suffix_first node).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  - simpl app.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst first.
    fold XiziDLL.dllseg.
    pose proof
      (IH next expected head last node suffix Hhead_nonnull) as Hih.
    unfold xizi_dllseg in Hih.
    sep_apply_l_atomic Hih.
    Intros node_next node_prev.
    Intros.
    Exists node_next node_prev.
    unfold xizi_dllseg_shift_tail, xizi_dll_links, XiziDLL.links.
    destruct rest as [| rest_first rest_tail].
    + simpl; entailer!.
      subst next.
      subst node_prev.
      change
        (xizi_dll_next expected node ** xizi_dll_prev expected prev |--
         xizi_dll_prev expected prev ** xizi_dll_next expected node).
      cancel (xizi_dll_prev expected prev).
      entailer!.
    + simpl; entailer!.
      subst next.
      change
        (xizi_dll_next expected rest_first ** xizi_dll_prev expected prev |--
         xizi_dll_prev expected prev **
         xizi_dll_next expected rest_first).
      cancel (xizi_dll_prev expected prev).
      entailer!.
Qed.
Lemma xizi_dll_split_at_node__dll_cut_split_reconnect :
  forall head prefix node suffix,
  xizi_dll head (prefix ++ node :: suffix) |--
  EX node_next node_prev,
    “ node <> NULL ” &&
    xizi_dllseg_shift head node_prev prefix **
    xizi_dll_next node_prev node **
    xizi_dll_next node node_next **
    xizi_dll_prev node node_prev **
    xizi_dll_prev node_next node **
    xizi_dllseg_shift_rev node_next head suffix.
Proof.
  intros head prefix node suffix.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  fold xizi_dll_links.
  sep_apply
    (xizi_dll_cut_frame_reorder__dll_cut_split_reconnect
       head first last first prefix node suffix).
  sep_apply_l_atomic
    (xizi_dllseg_cut_at_node__dll_cut_split_reconnect
       prefix first head head last node suffix H).
  Intros node_next node_prev.
  destruct prefix as [| expected rest].
  - simpl.
    Intros.
    subst first.
    subst node_prev.
    Exists node_next head.
    unfold xizi_dllseg_shift.
    simpl.
    entailer!.
  - simpl.
    Intros.
    subst first.
    Exists node_next node_prev.
    unfold xizi_dllseg_shift.
    simpl.
    entailer!.
Qed.
Lemma xizi_dll_close_open_fields__dll_cut_split_reconnect :
  forall head first last nodes,
  head <> NULL ->
  xizi_dllseg first head head last nodes **
  xizi_dll_prev head last **
  xizi_dll_next head first |--
  xizi_dll head nodes.
Proof.
  intros head first last nodes Hhead_nonnull.
  sep_apply_r_atomic
    (xizi_dll_close head first last nodes Hhead_nonnull).
  cancel (xizi_dllseg first head head last nodes).
  apply
    (xizi_dll_links_rev__dll_cut_split_reconnect head first last).
Qed.
Lemma xizi_dll_remove_fields_reorder__dll_cut_split_reconnect :
  forall head prefix suffix node node_next node_prev,
  xizi_dllseg_shift head node_prev prefix **
  xizi_dll_next node_prev node_next **
  xizi_dll_next node node **
  xizi_dll_prev node node **
  xizi_dll_prev node_next node_prev **
  xizi_dllseg_shift_rev node_next head suffix |--
  (xizi_dllseg_shift head node_prev prefix **
   xizi_dll_next node_prev node_next **
   xizi_dll_prev node_next node_prev **
   xizi_dllseg_shift_rev node_next head suffix) **
  xizi_dll_links node node node.
Proof.
  intros.
  unfold xizi_dll_links, XiziDLL.links,
    xizi_dll_next, xizi_dll_prev.
  entailer!.
Qed.
Lemma xizi_dll_remove_result__dll_cut_split_reconnect :
  forall head prefix suffix node node_next node_prev,
  node <> NULL ->
  xizi_dllseg_shift head node_prev prefix **
  xizi_dll_next node_prev node_next **
  xizi_dll_next node node **
  xizi_dll_prev node node **
  xizi_dll_prev node_next node_prev **
  xizi_dllseg_shift_rev node_next head suffix |--
  xizi_dll head (prefix ++ suffix) ** xizi_dll node nil.
Proof.
  intros head prefix suffix node node_next node_prev Hnode_nonnull.
  sep_apply
    (xizi_dll_remove_fields_reorder__dll_cut_split_reconnect
       head prefix suffix node node_next node_prev).
  sep_apply_l_atomic
    (xizi_dll_reconnect_cut__dll_cut_split_reconnect
       head prefix suffix node_prev node_next).
  sep_apply (xizi_dll_empty_rev node Hnode_nonnull).
  entailer!.
Qed.


(** Pure projections retain the existing address-level removal operation. *)
Definition xizi_dll_ptrs {A : Type} (nodes : list (XiziStoreADLL.DL_Node A)) : list Z :=
  map XiziStoreADLL.getPtr nodes.

(** The payload frame is kept in the same logical order as the list. *)
Definition xizi_dll_payloads {A : Type} (storeA : addr -> A -> Assertion)
  (nodes : list (XiziStoreADLL.DL_Node A)) : Assertion :=
  fold_right (fun a P => storeA (XiziStoreADLL.getPtr a)
                               (XiziStoreADLL.getData a) ** P) emp nodes.

(** Removing exactly one logical node preserves every other datum and its
    ordering, and refines the previously verified address-level operation. *)
Definition xizi_dll_remove_node_rel {A : Type}
  (removed : XiziStoreADLL.DL_Node A)
  (nodes remaining : list (XiziStoreADLL.DL_Node A)) : Prop :=
  (exists prefix suffix,
     nodes = prefix ++ removed :: suffix /\ remaining = prefix ++ suffix) /\
  xizi_dll_ptrs remaining =
    xizi_dll_remove_first (XiziStoreADLL.getPtr removed) (xizi_dll_ptrs nodes).

Lemma payloads_split__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) xs ys,
 xizi_dll_payloads storeA (xs ++ ys) |-- xizi_dll_payloads storeA xs ** xizi_dll_payloads storeA ys.
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros ys.
 - unfold xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_payloads in *; simpl in *; sep_apply_l_atomic (IH ys). entailer!.
Qed.
Lemma payloads_join__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) xs ys,
 xizi_dll_payloads storeA xs ** xizi_dll_payloads storeA ys |-- xizi_dll_payloads storeA (xs ++ ys).
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros ys.
 - unfold xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_payloads in *; simpl in *; sep_apply_l_atomic (IH ys). entailer!.
Qed.
Lemma seg_decompose__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) xs n p s l,
 XiziStoreADLL.dllseg storeA n p s l xs |--
 xizi_dllseg n p s l (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs.
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros n p s l.
 - unfold xizi_dllseg, xizi_dll_ptrs, xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_ptrs, xizi_dll_payloads, xizi_dllseg in *; simpl in *.
   Intros next. Intros. subst n.
   sep_apply_l_atomic (IH next (XiziStoreADLL.getPtr a) s l).
   Exists next. entailer!.
Qed.
Lemma seg_compose__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) xs n p s l,
 xizi_dllseg n p s l (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs |--
 XiziStoreADLL.dllseg storeA n p s l xs.
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros n p s l.
 - unfold xizi_dllseg, xizi_dll_ptrs, xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_ptrs, xizi_dll_payloads, xizi_dllseg in *; simpl in *.
   Intros next. Intros. subst n.
   sep_apply_l_atomic (IH next (XiziStoreADLL.getPtr a) s l).
   Exists next. entailer!.
Qed.
Lemma dll_decompose__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) head xs,
 xizi_store_dll storeA head xs |-- xizi_dll head (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs.
Proof.
 intros. unfold xizi_store_dll, XiziStoreADLL.store_dll, xizi_dll, XiziDLL.dll.
 Intros first last.
 sep_apply_l_atomic (seg_decompose__storeA_remove storeA xs first head head last).
 Exists first last. unfold xizi_dllseg, xizi_dll_links. entailer!.
Qed.
Lemma dll_compose__storeA_remove : forall {A} (storeA : addr -> A -> Assertion) head xs,
 xizi_dll head (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs |-- xizi_store_dll storeA head xs.
Proof.
 intros. unfold xizi_store_dll, XiziStoreADLL.store_dll, xizi_dll, XiziDLL.dll.
 Intros first last.
 fold xizi_dllseg.
 sep_apply_l_atomic (seg_compose__storeA_remove storeA xs first head head last).
 Exists first last. unfold xizi_dllseg, xizi_dll_links. entailer!.
Qed.
Lemma first_split__storeA_remove : forall {A} p (xs : list (XiziStoreADLL.DL_Node A)),
 In p (xizi_dll_ptrs xs) -> exists pre a suf,
 xs = pre ++ a :: suf /\ XiziStoreADLL.getPtr a = p /\
 xizi_dll_ptrs (pre ++ suf) = xizi_dll_remove_first p (xizi_dll_ptrs xs).
Proof.
 intros A p xs; induction xs as [|a xs IH]; intro Hin.
 - simpl in Hin; contradiction.
 - unfold xizi_dll_ptrs in *; simpl in *.
   destruct (Z.eq_dec (XiziStoreADLL.getPtr a) p) as [Heq|Hneq].
   + exists nil, a, xs. simpl. repeat split; auto.
   + destruct Hin as [Hbad|Hin]; [contradiction|].
     destruct (IH Hin) as (pre & b & suf & Hxs & Hb & Hr).
     exists (a::pre), b, suf. simpl. repeat split; auto.
     * rewrite Hxs; reflexivity.
     * rewrite Hr; reflexivity.
Qed.
