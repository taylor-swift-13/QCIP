Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope list.
Local Open Scope string_scope.

(** Shared record identity, transparently included by all canonical instances. *)
Module DLLNode.
Record DL_Node (A: Type): Type :=
  Build_DL_Node {
    getData: A;
    getPtr: addr;
  }.

Arguments getData {A} _.
Arguments getPtr {A} _.
Arguments Build_DL_Node {A} _ _.


Notation "x '.(data)'" := (getData x) (at level 1).
Notation "x '.(ptr)'" := (getPtr x) (at level 1).

End DLLNode.

Module Type DLL_LAYOUT.
  Parameter Inline struct_name : string.
  Parameter Inline next_field : string.
  Parameter Inline prev_field : string.
End DLL_LAYOUT.

(** One CRules implementation of the master predicates, parameterized only by layout. *)
Module CanonicalDLL (Layout : DLL_LAYOUT).
Import CRules.
Local Open Scope sac.
Include DLLNode.

Lemma shared_node_type : forall A (node : DLLNode.DL_Node A),
  (node : DL_Node A) = node.
Proof. reflexivity. Qed.
Lemma shared_node_projections : forall A (node : DLLNode.DL_Node A),
  @getData A node = DLLNode.getData node /\ @getPtr A node = DLLNode.getPtr node.
Proof. intros; split; reflexivity. Qed.

Definition dllseg {A: Type} (storeA: addr -> A -> Assertion) (x px y py: addr) (l: list (DL_Node A)): Assertion :=
  (fix dllseg x px y py l :=
     match l with
     | nil     => “ x = y /\ px = py ” && emp
     | a :: l0 => EX z: addr,
                    “ x = a.(ptr) ” &&
                    storeA x a.(data) **
                    &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px ** 
                    &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z **
                    dllseg z x y py l0
     end) x px y py l.
Definition dllseg_shift {A: Type} (storeA: addr -> A -> Assertion) (px py: addr) (l: list (DL_Node A)): Assertion :=
  (fix dllseg_shift px py l :=
     match l with
     | nil     => “ px = py ” && emp
     | a :: l0 => EX x: addr,
                    “ x = a.(ptr) ” &&
                    storeA x a.(data) **
                    &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px ** 
                    &(px # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> x **
                    dllseg_shift x py l0
     end) px py l.

Definition dllseg_shift_rev {A: Type} (storeA: addr -> A -> Assertion) (x y : addr) (l: list (DL_Node A)): Assertion :=
  (fix dllseg_shift_rev x y l :=
    match l with
    | nil     => “ x = y ” && emp
    | a :: l0 => EX z: addr,
                    “ x = a.(ptr) ” &&
                    storeA x a.(data) **
                    &(z # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> x ** 
                    &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z **
                    dllseg_shift_rev z y l0
    end) x y l.

Definition store_dll {A: Type} (storeA: addr -> A -> Assertion) (x: addr) (l: list (DL_Node A)): Assertion :=
  EX h pt: addr,
    &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> pt ** 
    &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> h **
    dllseg storeA h x x pt l.

Definition occupy_dll_node (x: addr): Assertion :=
  (EX __, &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> __) ** 
  (EX __, &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> __).

Theorem dllseg_concat:
  forall
    {A : Type} (storeA : addr -> A -> Assertion)
    (x px y py z pz: addr) (l1 l2: list (DL_Node A)),
  dllseg storeA x px y py l1 ** dllseg storeA y py z pz l2 |--
  dllseg storeA x px z pz (l1 ++ l2).
Proof.
  intros A storeA x px y py z pz l1; revert x px.
  induction l1 as [|a l1 IH]; intros x px l2; simpl [dllseg].
  - Intros; destruct H as [Hx Hp]; subst; entailer!.
  - Intros next; Intros.
    sep_apply_l_atomic (IH next x l2).
    Exists next; entailer!.
Qed.

Theorem dllseg_split:
  forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (x px z pz: addr) (l1 l2: list (DL_Node A)),
  dllseg storeA x px z pz (l1 ++ l2) |--
  EX y py,dllseg storeA x px y py l1 ** dllseg storeA y py z pz l2.
Proof.
  intros A storeA x px z pz l1; revert x px.
  induction l1 as [|a l1 IH]; intros x px l2; simpl [dllseg].
  - Exists x px; entailer!.
  - Intros next; Intros.
    sep_apply_l_atomic (IH next x l2).
    Intros y py; Exists y py next; entailer!.
Qed.

Theorem dllseg_shift_split:
  forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (px pz: addr) (l1 l2: list (DL_Node A)),
  dllseg_shift storeA px pz (l1 ++ l2) |--
  EX py ,dllseg_shift storeA px py l1 ** dllseg_shift storeA py pz l2.
Proof.
  intros.
  revert px.
  induction l1;intros.
  + simpl.
    Exists px;entailer!.
  + simpl.
    Intros x.
    sep_apply_l_atomic (IHl1 x).
    Intros py.
    Exists py x.
    entailer!. 
Qed.

Theorem dllseg_shift_concat: 
forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (px py pz: addr) (l1 l2: list (DL_Node A)),
    dllseg_shift storeA px py l1 ** dllseg_shift storeA py pz l2
    |--
    dllseg_shift storeA px pz (l1 ++ l2).
Proof.
  intros.
  revert px.
  induction l1;intros.
  + simpl.
    entailer!;destruct H;subst;reflexivity.
  + simpl.
    Intros x.
    Exists x.
    sep_apply_l_atomic (IHl1 x).
    entailer!.
Qed.


Theorem dllseg_shift_rev_split:
forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (x z: addr) (l1 l2: list (DL_Node A)),
  dllseg_shift_rev storeA x z (l1 ++ l2) |--
  EX y,dllseg_shift_rev storeA x y l1 ** dllseg_shift_rev storeA y z l2.
Proof.
  intros.
  revert x.
  induction l1;intros.
  + Exists x;simpl.
    entailer!.
  + simpl.
    Intros z0.
    sep_apply_l_atomic (IHl1 z0).
    Intros y;Exists y z0.
    entailer!.
Qed.

Theorem dllseg_shift_rev_concat: 
forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (x y z: addr) (l1 l2: list (DL_Node A)),
    dllseg_shift_rev storeA x y l1 ** dllseg_shift_rev storeA y z l2 |--
    dllseg_shift_rev storeA x z (l1 ++ l2).
Proof.
  intros.
  revert x.
  induction l1;intros.
  + simpl.
    entailer!.
    subst;reflexivity.
  + simpl.
    Intros z0.
    Exists z0.
    entailer!.
Qed.



Lemma dllseg_to_dllseg_shift:
forall {A: Type} (storeA: addr -> A -> Assertion) (x px y py: addr) (l: list (DL_Node A)),
  dllseg storeA x px y py l **
  &(px # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> x 
  |--
  &(py # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> y **
  dllseg_shift storeA px py l.
Proof.
  intros.
  revert x px.
  induction l;intros.
  + simpl;entailer!;destruct H;subst;reflexivity.
  + simpl.
    Intros z.
    subst.
    sep_apply_l_atomic (IHl z a.(ptr)).
    Exists a.(ptr).
    entailer!.
Qed.

Lemma dllseg_to_dllseg_shift_rev:
forall {A: Type} (storeA: addr -> A -> Assertion) (x px y py: addr) (l: list (DL_Node A)),
  dllseg storeA x px y py l **
  &(y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> py
  |--
  dllseg_shift_rev storeA x y l **
  &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px.
Proof.
  intros.
  revert x px.
  induction l;intros.
  + simpl.
    entailer!.
    destruct H.
    subst.
    reflexivity.
  + simpl.
    Intros z.
    subst.
    sep_apply_l_atomic (IHl z (getPtr a)).
    Exists z.
    entailer!.
Qed.

Lemma dllseg_shift_to_dllseg:
forall {A: Type} (storeA: addr -> A -> Assertion) (px py y: addr) (l: list (DL_Node A)),
  &(py # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> y **
  dllseg_shift storeA px py l
  |--
  EX x,
  dllseg storeA x px y py l **
  &(px # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> x 
.
Proof.
  intros.
  revert px.
  induction l;intros;simpl.
  + Exists y.
    entailer!.
    subst;reflexivity.
  + Intros x.
    sep_apply_l_atomic (IHl x).
    Intros z;Exists x z.
    entailer!.
Qed.

Lemma dllseg_shift_rev_to_dllseg:
forall {A: Type} (storeA: addr -> A -> Assertion) (x px y: addr) (l: list (DL_Node A)),
  dllseg_shift_rev storeA x y l **
  &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px
  |--
  EX py,
  dllseg storeA x px y py l **
  &(y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> py.
Proof.
  intros.
  revert x px.
  induction l;intros;simpl.
  + Exists px.
    entailer!.
    subst;reflexivity.
  + Intros z.
    sep_apply_l_atomic (IHl z x).
    Intros py.
    Exists py z.
    entailer!.
Qed.

Lemma dllseg_shift_to_dllseg_shift_rev:
forall {A: Type} (storeA: addr -> A -> Assertion) (px y py: addr) (l: list (DL_Node A)),
  dllseg_shift storeA px py l **
  &(py # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> y **
  &(y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> py 
  |--
  EX x,
  dllseg_shift_rev storeA x y l **
  &(px # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> x **
  &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px.
Proof.
  intros.
  revert px.
  induction l;intros;simpl.
  + entailer!.
    Exists y;subst;entailer!;reflexivity.
  + Intros x.
    sep_apply_l_atomic (IHl x).
    Intros x0.
    Exists x x0.
    entailer!.
Qed.

Lemma store_dll_shift_unfold: 
forall {A: Type} (storeA: addr -> A -> Assertion)(x: addr) (l: list (DL_Node A)),
  store_dll storeA x l |--
  EX px: addr,
  &(px # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> x **
  &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px **
  dllseg_shift storeA x px l .
Proof.
  intros.
  unfold store_dll.
  Intros h pt.
  sep_apply_l_atomic (dllseg_to_dllseg_shift storeA h x x pt l).
  Exists pt.
  entailer!.
Qed.

Lemma store_dll_shift_rev_unfold:
forall {A: Type} (storeA: addr -> A -> Assertion)(x: addr) (l: list (DL_Node A)),
  store_dll storeA x l |--
  EX xn: addr ,
  &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> xn **
  &(xn # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> x **
  dllseg_shift_rev storeA xn x l.
Proof.
  intros.
  unfold store_dll.
  Intros h pt.
  sep_apply_l_atomic (dllseg_to_dllseg_shift_rev storeA h x x pt l).
  Exists h.
  entailer!.
Qed.

Lemma dllseg_head_insert:
  forall (A: Type) (storeA: Z -> A -> Assertion) 
         (py y z x pt: Z) (a: A) (l: list (DL_Node A)),
    dllseg storeA z y x pt l **
    storeA y a **
    &(y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> py **
    &(y # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z |--
    dllseg storeA y py x pt ((Build_DL_Node a y) :: l).
Proof.
    intros.
    simpl.
    Exists z.
    entailer!.
Qed.

Lemma dllseg_neq:
  forall {A : Type} (storeA : addr -> A -> Assertion)
  (x px y py: addr) (l: list (DL_Node A)),
  x <> y ->
  dllseg storeA x px y py l |--
  EX z a l0,
    “ l = a :: l0 ” &&
    “ x = a.(ptr) ” &&
    storeA x a.(data) **
    &(x # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> px ** 
    &(x # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z **
    dllseg storeA z x y py l0.
Proof.
  intros.
  destruct l; simpl.
  + entailer!.
  + Intros z0.
    Exists z0 d l.
    entailer!.
Qed.

Lemma dllseg_head_split:
  forall (A: Type) (storeA: Z -> A -> Assertion) 
         (y py x pt: Z) (a: A) (l: list (DL_Node A)),
    dllseg storeA y py x pt ((Build_DL_Node a y) :: l) |--
    EX z,
    dllseg storeA z y x pt l **
    storeA y a **
    &(y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> py **
    &(y # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z.
Proof.
    intros.
    simpl.
    Intros z.
    Exists z.
    entailer!.
Qed.

Theorem dllseg_shift_transfrom_a:
forall 
    {A : Type} (storeA : addr -> A -> Assertion)(z y: addr)(a: A),
    storeA y a **
    &( y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> z ** 
    &( z # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> y |--
    dllseg_shift storeA z y ((Build_DL_Node a y) :: nil).
Proof.
    pre_process.
    intros.
    csimpl.
    simpl.
    Exists y.
    entailer!.
Qed.

Theorem dllseg_shift_contact_a:
forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (x z y: addr)(a: A)(l: list (DL_Node A)),
    dllseg_shift storeA x z l **
    storeA y a **
    &( y # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> z ** 
    &( z # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> y |--
  dllseg_shift storeA x y (l ++ ((Build_DL_Node a y) :: nil)).
Proof.
    pre_process.
    intros.
    csimpl.
    simpl.
    induction l.
    +
    csimpl.
    simpl.
    Exists y.
    entailer!.
    rewrite H.
    entailer!.
    +
    pose proof dllseg_shift_transfrom_a storeA z y a.
    revert H.
    csimpl.
    intros.
    sep_apply_l_atomic H.
    pose proof dllseg_shift_concat storeA x z y (a0 :: l) (Build_DL_Node a y :: nil).
    sep_apply_l_atomic H0.
    entailer!.
Qed.

Theorem dllseg_shift_rev_contact_a:
forall 
    {A : Type} (storeA : addr -> A -> Assertion)
    (x z y: addr)(a: A)(l: list (DL_Node A)),
    dllseg_shift_rev storeA z x l **
    storeA y a **
    &( y # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> z ** 
    &( z # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> y |--
  dllseg_shift_rev storeA y x ((Build_DL_Node a y) :: l).
Proof.
    pre_process.
    intros.
    csimpl.
    simpl.
    induction l.
    +
    csimpl.
    simpl.
    Exists z.
    entailer!.
    +
    Exists z.
    entailer!.
Qed.

Lemma store_dll_empty : forall {A} (storeA : addr -> A -> Assertion) head,
  store_dll storeA head nil |--
  &(head # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> head **
  &(head # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> head.
Proof.
  intros; unfold store_dll, dllseg; Intros first last; Intros.
  destruct H as [Hfirst Hlast]; subst first; subst last; entailer!.
Qed.

Lemma store_dll_empty_rev : forall {A} (storeA : addr -> A -> Assertion) head,
  &(head # Layout.struct_name ->ₛ Layout.prev_field) # Ptr |-> head **
  &(head # Layout.struct_name ->ₛ Layout.next_field) # Ptr |-> head |--
  store_dll storeA head nil.
Proof. intros; unfold store_dll, dllseg; Exists head head; entailer!. Qed.

(** Address-only specialization of the reference predicate. These definitions
    add no guards and do not claim equivalence to the guarded legacy model. *)
Definition ptrs {A} (nodes : list (DL_Node A)) : list addr := map getPtr nodes.
Definition addr_nodes (nodes : list addr) : list (DL_Node unit) :=
  map (fun p => Build_DL_Node tt p) nodes.
Definition addr_store (_ : addr) (_ : unit) : Assertion := emp.
Definition addr_dllseg x px y py (nodes : list addr) : Assertion :=
  dllseg addr_store x px y py (addr_nodes nodes).
Definition addr_store_dll head (nodes : list addr) : Assertion :=
  store_dll addr_store head (addr_nodes nodes).
Definition payloads {A} (storeA : addr -> A -> Assertion)
  (nodes : list (DL_Node A)) : Assertion :=
  fold_right (fun a P => storeA (getPtr a) (getData a) ** P) emp nodes.

Lemma ptrs_addr_nodes : forall nodes, ptrs (addr_nodes nodes) = nodes.
Proof. induction nodes; simpl [ptrs addr_nodes] in *; congruence. Qed.

Lemma addr_nodes_app : forall xs ys,
  addr_nodes (List.app xs ys) = List.app (addr_nodes xs) (addr_nodes ys).
Proof. intros; unfold addr_nodes; apply map_app. Qed.

Lemma data_addr_nodes : forall nodes,
  map getData (addr_nodes nodes) = repeat tt (List.length nodes).
Proof. induction nodes; simpl [addr_nodes] in *; congruence. Qed.

Lemma ptrs_app : forall {A} (xs ys : list (DL_Node A)),
  ptrs (List.app xs ys) = List.app (ptrs xs) (ptrs ys).
Proof. intros; unfold ptrs; apply map_app. Qed.


Lemma dllseg_decompose : forall {A} (storeA : addr -> A -> Assertion) nodes x px y py,
  dllseg storeA x px y py nodes |--
  addr_dllseg x px y py (ptrs nodes) ** payloads storeA nodes.
Proof.
  intros A storeA nodes; induction nodes as [|a nodes IH]; intros x px y py.
  - unfold addr_dllseg, ptrs, addr_nodes, payloads, addr_store; simpl [dllseg]; entailer!.
  - unfold addr_dllseg, ptrs, addr_nodes, payloads, addr_store in *; simpl [dllseg] in *.
    Intros next; Intros; subst x.
    sep_apply_l_atomic (IH next (getPtr a) y py).
    Exists next; entailer!.
Qed.

Lemma dllseg_compose : forall {A} (storeA : addr -> A -> Assertion) nodes x px y py,
  addr_dllseg x px y py (ptrs nodes) ** payloads storeA nodes |--
  dllseg storeA x px y py nodes.
Proof.
  intros A storeA nodes; induction nodes as [|a nodes IH]; intros x px y py.
  - unfold addr_dllseg, ptrs, addr_nodes, payloads, addr_store; simpl [dllseg]; entailer!.
  - unfold addr_dllseg, ptrs, addr_nodes, payloads, addr_store in *; simpl [dllseg] in *.
    Intros next; Intros; subst x.
    sep_apply_l_atomic (IH next (getPtr a) y py).
    Exists next; entailer!.
Qed.

Lemma store_dll_decompose : forall {A} (storeA : addr -> A -> Assertion) head nodes,
  store_dll storeA head nodes |--
  addr_store_dll head (ptrs nodes) ** payloads storeA nodes.
Proof.
  intros; unfold addr_store_dll, store_dll; Intros first last.
  sep_apply_l_atomic (dllseg_decompose storeA nodes first head head last).
  Exists first last; unfold addr_dllseg; entailer!.
Qed.

Lemma store_dll_compose : forall {A} (storeA : addr -> A -> Assertion) head nodes,
  addr_store_dll head (ptrs nodes) ** payloads storeA nodes |--
  store_dll storeA head nodes.
Proof.
  intros; unfold addr_store_dll, store_dll; Intros first last.
  fold (addr_dllseg first head head last (ptrs nodes)).
  sep_apply_l_atomic (dllseg_compose storeA nodes first head head last).
  Exists first last; entailer!.
Qed.

End CanonicalDLL.

Module ReferenceDoubleLinkLayout <: DLL_LAYOUT.
  Definition struct_name : string := "DoubleLinklistType".
  Definition next_field : string := "node_next".
  Definition prev_field : string := "node_prev".
End ReferenceDoubleLinkLayout.

Module SysDoubleLinkLayout <: DLL_LAYOUT.
  Definition struct_name : string := "SysDoubleLinklistNode".
  Definition next_field : string := "node_next".
  Definition prev_field : string := "node_prev".
End SysDoubleLinkLayout.

Module DLL := CanonicalDLL ReferenceDoubleLinkLayout.
Module XiziIdmanagerDLL := CanonicalDLL SysDoubleLinkLayout.
Module XiziLocalDLL := XiziIdmanagerDLL.

(** Reflexivity witnesses for the exported shared record and assertion API. *)
Module DLLIdentityChecks.
Import CRules.
Lemma node_type_identity : XiziLocalDLL.DL_Node = DLL.DL_Node.
Proof. reflexivity. Qed.
Lemma local_idmanager_node_type_identity : XiziLocalDLL.DL_Node = XiziIdmanagerDLL.DL_Node.
Proof. reflexivity. Qed.
Lemma constructor_identity : @XiziLocalDLL.Build_DL_Node = @DLL.Build_DL_Node.
Proof. reflexivity. Qed.
Lemma data_projection_identity : @XiziLocalDLL.getData = @DLL.getData.
Proof. reflexivity. Qed.
Lemma ptr_projection_identity : @XiziLocalDLL.getPtr = @DLL.getPtr.
Proof. reflexivity. Qed.
Lemma dllseg_identity : @XiziLocalDLL.dllseg = @XiziIdmanagerDLL.dllseg.
Proof. reflexivity. Qed.
Lemma dllseg_shift_identity : @XiziLocalDLL.dllseg_shift = @XiziIdmanagerDLL.dllseg_shift.
Proof. reflexivity. Qed.
Lemma dllseg_shift_rev_identity : @XiziLocalDLL.dllseg_shift_rev = @XiziIdmanagerDLL.dllseg_shift_rev.
Proof. reflexivity. Qed.
Lemma store_dll_identity : @XiziLocalDLL.store_dll = @XiziIdmanagerDLL.store_dll.
Proof. reflexivity. Qed.
Lemma occupy_dll_node_identity : @XiziLocalDLL.occupy_dll_node = @XiziIdmanagerDLL.occupy_dll_node.
Proof. reflexivity. Qed.
Lemma payloads_identity : @XiziLocalDLL.payloads = @XiziIdmanagerDLL.payloads.
Proof. reflexivity. Qed.
Lemma payload_assertion_type_identity : forall A,
  (@XiziLocalDLL.store_dll A : (addr -> A -> Assertion) -> addr -> list (DLL.DL_Node A) -> Assertion)
  = (@XiziIdmanagerDLL.store_dll A : (addr -> A -> Assertion) -> addr -> list (DLL.DL_Node A) -> Assertion).
Proof. reflexivity. Qed.
Lemma record_syntax_identity : forall A (data : A) pointer,
  ({| XiziLocalDLL.getData := data; XiziLocalDLL.getPtr := pointer |} : DLL.DL_Node A)
  = DLL.Build_DL_Node data pointer.
Proof. reflexivity. Qed.
End DLLIdentityChecks.

Import naive_C_Rules.
Local Open Scope sac.
(** INTERNAL COMPATIBILITY ONLY: guarded address predicates and all legacy
    XiziStoreADLL declarations below remain solely as dependencies while public
    consumers migrate to canonical DLL. They are not canonical public specs. *)

(** QCIP-side address model adapted from [crtosverify/lib/dll.v].

    The sentinel owns its two links.  [dllseg node prev stop last nodes]
    describes the finite chain from [node] up to (but excluding) [stop], while
    remembering the predecessor on both ends.  The explicit [node <> stop]
    guard in the nonempty branch fixes the ambiguous cyclic segment admitted
    by the older definition. *)


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

(** Internal compatibility ownership view for a standalone Xizi DLL node.  This follows
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
