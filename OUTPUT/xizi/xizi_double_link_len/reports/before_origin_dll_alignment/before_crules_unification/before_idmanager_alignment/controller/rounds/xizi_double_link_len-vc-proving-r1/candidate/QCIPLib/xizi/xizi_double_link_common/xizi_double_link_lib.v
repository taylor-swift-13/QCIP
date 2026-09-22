Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

(** QCIP-side address model adapted from [crtosverify/lib/dll.v].

    The sentinel owns its two links.  [dllseg node prev stop last nodes]
    describes the finite chain from [node] up to (but excluding) [stop], while
    remembering the predecessor on both ends.  The explicit [node <> stop]
    guard in the nonempty branch fixes the ambiguous cyclic segment admitted
    by the older definition. *)
Module Type DLL_LAYOUT.
  Parameter Inline struct_name : string.
  Parameter Inline next_field : string.
  Parameter Inline prev_field : string.
End DLL_LAYOUT.

Module AddrDLL (Layout : DLL_LAYOUT).

Import Layout.

Definition links (node next prev : addr) : Assertion :=
  &(node # struct_name ->ₛ next_field) # Ptr |-> next **
  &(node # struct_name ->ₛ prev_field) # Ptr |-> prev.

Fixpoint dllseg
  (node prev stop last : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil => “ node = stop /\ prev = last ” && emp
  | expected :: rest =>
      “ node = expected ” &&
      “ node <> NULL ” &&
      “ node <> stop ” &&
      EX next : addr,
        links node next prev **
        dllseg next node stop last rest
  end.

Definition dll (head : addr) (nodes : list addr) : Assertion :=
  “ head <> NULL ” &&
  EX first last : addr,
    links head first last **
    dllseg first head head last nodes.

Lemma dll_empty : forall head,
  dll head nil |-- links head head head.
Proof.
  intros; unfold dll; Intros first last; simpl; Intros.
  destruct H0 as [Hfirst Hlast].
  subst first; subst last; entailer!.
Qed.

Lemma dll_empty_rev : forall head,
  head <> NULL ->
  links head head head |-- dll head nil.
Proof.
  intros; unfold dll, links; Exists head head; simpl; entailer!.
Qed.

Lemma dll_open : forall head nodes,
  dll head nodes |--
  EX first last,
    links head first last **
    dllseg first head head last nodes.
Proof.
  intros; unfold dll; Intros first last; Exists first last; entailer!.
Qed.

Lemma dll_close : forall head first last nodes,
  head <> NULL ->
  links head first last ** dllseg first head head last nodes |--
  dll head nodes.
Proof.
  intros; unfold dll, links; Exists first last; entailer!.
Qed.

Lemma dll_nonempty : forall head first rest,
  dll head (first :: rest) |--
  EX next last,
    “ first <> NULL ” &&
    “ first <> head ” &&
    links head first last **
    links first next head **
    dllseg next first head last rest.
Proof.
  intros; unfold dll; Intros actual_first last; simpl; Intros next; Intros.
  subst actual_first.
  Exists next last; entailer!.
Qed.

Lemma dll_nonempty_rev : forall head first next last rest,
  head <> NULL ->
  first <> NULL ->
  first <> head ->
  links head first last **
  links first next head **
  dllseg next first head last rest |--
  dll head (first :: rest).
Proof.
  intros; unfold dll, links; Exists first last; simpl; Exists next; entailer!.
Qed.

End AddrDLL.

Module XiziDoubleLinkLayout <: DLL_LAYOUT.
  Definition struct_name : string := "SysDoubleLinklistNode".
  Definition next_field : string := "node_next".
  Definition prev_field : string := "node_prev".
End XiziDoubleLinkLayout.

Module XiziDLL := AddrDLL XiziDoubleLinkLayout.

Definition xizi_dllseg :
  addr -> addr -> addr -> addr -> list addr -> Assertion := XiziDLL.dllseg.

Definition xizi_dll : addr -> list addr -> Assertion := XiziDLL.dll.

Definition xizi_dll_links : addr -> addr -> addr -> Assertion := XiziDLL.links.

(** Public ownership view for a standalone Xizi DLL node.  This follows
    [DLL.occupy_dll_node] from [crtosverify/lib/dll.v], while using the real
    Xizi C structure tag and retaining the non-null requirement expected by
    the API. *)
Definition xizi_dll_node (node : addr) : Assertion :=
  “ node <> NULL ” &&
  &(node # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.next_field) # Ptr |->_ **
  &(node # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.prev_field) # Ptr |->_.

Lemma xizi_dll_empty : forall head,
  xizi_dll head nil |-- xizi_dll_links head head head.
Proof. exact XiziDLL.dll_empty. Qed.

Lemma xizi_dll_empty_rev : forall head,
  head <> NULL ->
  xizi_dll_links head head head |-- xizi_dll head nil.
Proof. exact XiziDLL.dll_empty_rev. Qed.

Lemma xizi_dll_open : forall head nodes,
  xizi_dll head nodes |--
  EX first last,
    xizi_dll_links head first last **
    xizi_dllseg first head head last nodes.
Proof. exact XiziDLL.dll_open. Qed.

Lemma xizi_dll_close : forall head first last nodes,
  head <> NULL ->
  xizi_dll_links head first last **
  xizi_dllseg first head head last nodes |--
  xizi_dll head nodes.
Proof. exact XiziDLL.dll_close. Qed.

Lemma xizi_dll_nonempty : forall head first rest,
  xizi_dll head (first :: rest) |--
  EX next last,
    “ first <> NULL ” &&
    “ first <> head ” &&
    xizi_dll_links head first last **
    xizi_dll_links first next head **
    xizi_dllseg next first head last rest.
Proof. exact XiziDLL.dll_nonempty. Qed.

Lemma xizi_dll_nonempty_rev : forall head first next last rest,
  head <> NULL ->
  first <> NULL ->
  first <> head ->
  xizi_dll_links head first last **
  xizi_dll_links first next head **
  xizi_dllseg next first head last rest |--
  xizi_dll head (first :: rest).
Proof. exact XiziDLL.dll_nonempty_rev. Qed.

Lemma xizi_dllseg_unfold : forall node prev stop last nodes,
  node <> stop ->
  xizi_dllseg node prev stop last nodes |--
  EX next rest,
    “ nodes = node :: rest ” &&
    xizi_dll_links node next prev **
    xizi_dllseg next node stop last rest.
Proof.
  intros node prev stop last nodes Hneq.
  destruct nodes as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hsame _].
    contradiction.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst expected.
    Exists next rest.
    unfold xizi_dll_links.
    entailer!.
Qed.


(** Resource-carrying extension for incremental migration.  All declarations
    above remain unchanged for existing address-only consumers.

    [DL_Node], the order of its constructor arguments (data, pointer), and the
    four recursions follow crtosverify d215f73b lib/dll.v.  The Xizi layout is
    reused through [xizi_dll_links] and [XiziDoubleLinkLayout]; no C payload
    field is introduced.  [storeA] owns only payload resources, disjoint from
    the structural next/prev fields.  In particular an IDNode-style pure
    [node_storeA : addr -> Z -> Prop] must first be lifted by [store_idnode].

    Compared with the reference, [dllseg] retains the existing non-null and
    stop-exclusion guards and [store_dll] retains non-null sentinel ownership.
    The shifted predicates follow the reference ownership transfer exactly;
    unlike guarded [dllseg], they do not additionally assert endpoint
    exclusion.  They are resource views, not replacements for the guarded
    public list predicate.  Reverse conversion to a guarded segment therefore
    needs the corresponding shape facts. *)
Module XiziStoreADLL.

Record DL_Node (A : Type) : Type := Build_DL_Node {
  getData : A;
  getPtr : addr
}.
Arguments getData {A} _.
Arguments getPtr {A} _.
Arguments Build_DL_Node {A} _ _.

Fixpoint dllseg {A : Type} (storeA : addr -> A -> Assertion)
  (node prev stop last : addr) (nodes : list (DL_Node A)) : Assertion :=
  match nodes with
  | nil => “ node = stop /\ prev = last ” && emp
  | a :: rest =>
      “ node = getPtr a ” &&
      “ node <> NULL ” &&
      “ node <> stop ” &&
      EX next : addr,
        storeA node (getData a) **
        xizi_dll_links node next prev **
        dllseg storeA next node stop last rest
  end.

Fixpoint dllseg_shift {A : Type} (storeA : addr -> A -> Assertion)
  (prev last : addr) (nodes : list (DL_Node A)) : Assertion :=
  match nodes with
  | nil => “ prev = last ” && emp
  | a :: rest => EX node : addr,
      “ node = getPtr a ” &&
      storeA node (getData a) **
      &(node # XiziDoubleLinkLayout.struct_name ->ₛ
          XiziDoubleLinkLayout.prev_field) # Ptr |-> prev **
      &(prev # XiziDoubleLinkLayout.struct_name ->ₛ
          XiziDoubleLinkLayout.next_field) # Ptr |-> node **
      dllseg_shift storeA node last rest
  end.

Fixpoint dllseg_shift_rev {A : Type} (storeA : addr -> A -> Assertion)
  (node stop : addr) (nodes : list (DL_Node A)) : Assertion :=
  match nodes with
  | nil => “ node = stop ” && emp
  | a :: rest => EX next : addr,
      “ node = getPtr a ” &&
      storeA node (getData a) **
      &(next # XiziDoubleLinkLayout.struct_name ->ₛ
          XiziDoubleLinkLayout.prev_field) # Ptr |-> node **
      &(node # XiziDoubleLinkLayout.struct_name ->ₛ
          XiziDoubleLinkLayout.next_field) # Ptr |-> next **
      dllseg_shift_rev storeA next stop rest
  end.

Definition store_dll {A : Type} (storeA : addr -> A -> Assertion)
  (head : addr) (nodes : list (DL_Node A)) : Assertion :=
  “ head <> NULL ” &&
  EX first last : addr,
    xizi_dll_links head first last **
    dllseg storeA first head head last nodes.

(** Empty initialization is exactly the old empty-list model, independently
    of A and storeA, so its existing proofs are reused without modification. *)
Lemma store_dll_empty_eq : forall {A} (storeA : addr -> A -> Assertion) head,
  store_dll storeA head nil = xizi_dll head nil.
Proof. reflexivity. Qed.

Lemma store_dll_empty : forall {A} (storeA : addr -> A -> Assertion) head,
  store_dll storeA head nil |-- xizi_dll_links head head head.
Proof. intros; rewrite store_dll_empty_eq; apply xizi_dll_empty. Qed.

Lemma store_dll_empty_rev : forall {A} (storeA : addr -> A -> Assertion) head,
  head <> NULL ->
  xizi_dll_links head head head |-- store_dll storeA head nil.
Proof. intros; rewrite store_dll_empty_eq; apply xizi_dll_empty_rev; assumption. Qed.

End XiziStoreADLL.

Definition xizi_store_dll := @XiziStoreADLL.store_dll.
Arguments xizi_store_dll {A} _ _ _.

(** Shared bridges promoted from the accepted remove_node case library.
    Definitions and proof bodies are preserved; generic lemma suffixes are
    renamed from __storeA_remove to __storeA_shared. Removal-specific
    relations and first_split remain in the removal library. *)
Definition xizi_dll_ptrs {A : Type} (nodes : list (XiziStoreADLL.DL_Node A)) : list Z :=
  map XiziStoreADLL.getPtr nodes.

(** The payload frame is kept in the same logical order as the list. *)
Definition xizi_dll_payloads {A : Type} (storeA : addr -> A -> Assertion)
  (nodes : list (XiziStoreADLL.DL_Node A)) : Assertion :=
  fold_right (fun a P => storeA (XiziStoreADLL.getPtr a)
                               (XiziStoreADLL.getData a) ** P) emp nodes.

Lemma payloads_split__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) xs ys,
 xizi_dll_payloads storeA (xs ++ ys) |-- xizi_dll_payloads storeA xs ** xizi_dll_payloads storeA ys.
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros ys.
 - unfold xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_payloads in *; simpl in *; sep_apply_l_atomic (IH ys). entailer!.
Qed.
Lemma payloads_join__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) xs ys,
 xizi_dll_payloads storeA xs ** xizi_dll_payloads storeA ys |-- xizi_dll_payloads storeA (xs ++ ys).
Proof.
 intros A storeA xs; induction xs as [|a xs IH]; intros ys.
 - unfold xizi_dll_payloads; simpl. entailer!.
 - unfold xizi_dll_payloads in *; simpl in *; sep_apply_l_atomic (IH ys). entailer!.
Qed.
Lemma seg_decompose__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) xs n p s l,
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
Lemma seg_compose__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) xs n p s l,
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
Lemma dll_decompose__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) head xs,
 xizi_store_dll storeA head xs |-- xizi_dll head (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs.
Proof.
 intros. unfold xizi_store_dll, XiziStoreADLL.store_dll, xizi_dll, XiziDLL.dll.
 Intros first last.
 sep_apply_l_atomic (seg_decompose__storeA_shared storeA xs first head head last).
 Exists first last. unfold xizi_dllseg, xizi_dll_links. entailer!.
Qed.
Lemma dll_compose__storeA_shared : forall {A} (storeA : addr -> A -> Assertion) head xs,
 xizi_dll head (xizi_dll_ptrs xs) ** xizi_dll_payloads storeA xs |-- xizi_store_dll storeA head xs.
Proof.
 intros. unfold xizi_store_dll, XiziStoreADLL.store_dll, xizi_dll, XiziDLL.dll.
 Intros first last.
 fold xizi_dllseg.
 sep_apply_l_atomic (seg_compose__storeA_shared storeA xs first head head last).
 Exists first last. unfold xizi_dllseg, xizi_dll_links. entailer!.
Qed.

Require Import Coq.micromega.Psatz.
Lemma dll_ptrs_Zlength__dll_len_payload_cycle : forall A (xs : list (XiziStoreADLL.DL_Node A)),
 Zlength (xizi_dll_ptrs xs) = Zlength xs.
Proof. intros A xs. unfold xizi_dll_ptrs. rewrite !Zlength_correct, length_map. reflexivity. Qed.
Lemma xizi_dll_links_align4__dll_len_payload_cycle :
    forall node next prev,
      xizi_dll_links node next prev |-- store_align4_n 2.
Proof.
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply store_ptr_align4_32.
    sep_apply store_ptr_align4_32.
    sep_apply (store_align4_merge 1 1).
    replace (1 + 1) with 2 by lia.
    entailer!.
Qed.
Lemma xizi_dllseg_align4__dll_len_payload_cycle :
    forall node prev stop last nodes,
      xizi_dllseg node prev stop last nodes |--
      store_align4_n (2 * Zlength nodes).
Proof.
    intros node prev stop last nodes0.
    generalize dependent node.
    generalize dependent prev.
    induction nodes0 as [| expected rest IH]; intros.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      unfold store_align4_n.
      Exists (@nil Z).
      entailer!.
      constructor.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next0.
      Intros.
      sep_apply xizi_dll_links_align4__dll_len_payload_cycle.
      sep_apply IH.
      sep_apply (store_align4_merge 2 (2 * Zlength rest)).
      rewrite Zlength_cons.
      replace (2 + 2 * Zlength rest) with
        (2 * (Zlength rest + 1)) by lia.
      entailer!.
Qed.
Lemma xizi_dllseg_unfold_full__dll_len_payload_cycle :
    forall node prev stop last nodes0,
      node <> stop ->
      xizi_dllseg node prev stop last nodes0 |--
      EX next0 rest,
        “ nodes0 = node :: rest ” &&
        “ node <> 0 ” &&
        xizi_dll_links node next0 prev **
        xizi_dllseg next0 node stop last rest.
Proof.
    intros node prev stop last nodes0 Hneq.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next0.
      Intros.
      subst expected.
      Exists next0 rest.
      entailer!.
Qed.
Lemma xizi_dll_links_neq__dll_len_payload_cycle :
    forall a a_next a_prev b b_next b_prev,
      xizi_dll_links a a_next a_prev **
      xizi_dll_links b b_next b_prev |-- “ a <> b ”.
Proof.
    intros.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      sepcon_lift
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> b_next).
      sep_apply_l_atomic
        (dup_store_ptr
          (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
          b_next a_next).
      entailer!.
    - entailer!.
Qed.
Lemma xizi_dll_links_fold__dll_len_payload_cycle :
    forall node next0 prev,
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next0) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) |--
      xizi_dll_links node next0 prev.
Proof.
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.
Lemma xizi_dllseg_snoc__dll_len_payload_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      middle <> 0 ->
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      xizi_dllseg node prev next0 middle (nodes0 ++ middle :: nil) **
      xizi_dll_links next0 next_after middle.
Proof.
    intros node prev middle middle_prev next0 next_after nodes0 Hnonzero.
    generalize dependent node.
    generalize dependent prev.
    induction nodes0 as [| expected rest IH]; intros.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node; subst prev.
      destruct (Z.eq_dec middle next0) as [Heq | Hneq].
      + subst next0.
        sep_apply_l_atomic
          (xizi_dll_links_neq__dll_len_payload_cycle
            middle middle middle_prev middle next_after middle).
        entailer!.
      + Exists next0.
        entailer!.
    - change
        ((“ node = expected ” && “ node <> NULL ” && “ node <> middle ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node middle middle_prev rest)) **
         xizi_dll_links middle next0 middle_prev **
         xizi_dll_links next0 next_after middle |--
         (“ node = expected ” && “ node <> NULL ” && “ node <> next0 ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node next0 middle (rest ++ middle :: nil))) **
         xizi_dll_links next0 next_after middle).
      Intros next1.
      Intros.
      destruct (Z.eq_dec node next0) as [Heqnode | Hnode].
      + subst next0.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_lift
          (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_after).
        sep_apply_l_atomic
          (dup_store_ptr
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next"))
            next_after next1).
        entailer!.
      + sep_apply_l_atomic (IH node next1).
        Exists next1.
        entailer!.
Qed.
Lemma xizi_dllseg_two_links_uint_bound__dll_len_payload_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      “ Zlength nodes0 + 2 < 2 ^ 32 ”.
Proof.
    intros.
    sep_apply xizi_dllseg_align4__dll_len_payload_cycle.
    sep_apply xizi_dll_links_align4__dll_len_payload_cycle.
    sep_apply xizi_dll_links_align4__dll_len_payload_cycle.
    sep_apply (store_align4_merge (2 * Zlength nodes0) 2).
    sep_apply (store_align4_merge (2 * Zlength nodes0 + 2) 2).
    prop_apply store_align4_n_valid.
    Intros.
    rewrite addr_max_unsigned_eq_int in H.
    replace Int.max_unsigned with 4294967295 in H by reflexivity.
    replace (4294967295 / 4) with 1073741823 in H by reflexivity.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    entailer!.
Qed.
Lemma xizi_dllseg_advance__dll_len_payload_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      middle <> 0 ->
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      “ Zlength nodes0 + 2 < 2 ^ 32 ” &&
      xizi_dllseg node prev next0 middle (nodes0 ++ middle :: nil) **
      xizi_dll_links next0 next_after middle.
Proof.
    intros.
    prop_apply_p
      (xizi_dllseg_two_links_uint_bound__dll_len_payload_cycle
        node prev middle middle_prev next0 next_after nodes0).
    Intros.
    sep_apply_l_atomic
      (xizi_dllseg_snoc__dll_len_payload_cycle
        node prev middle middle_prev next0 next_after nodes0 H).
    entailer!.
Qed.
Lemma xizi_dllseg_stop__dll_len_payload_cycle :
    forall stop prev last nodes0,
      xizi_dllseg stop prev stop last nodes0 |--
      “ nodes0 = nil ” && “ prev = last ” && emp.
Proof.
    intros stop prev last nodes0.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      Intros next0.
      Intros.
      contradiction.
Qed.
