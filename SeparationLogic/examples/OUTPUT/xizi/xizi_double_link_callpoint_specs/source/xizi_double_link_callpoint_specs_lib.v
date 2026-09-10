Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Export xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source Require Export xizi_double_link_head_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Export xizi_double_link_insert_after_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source Require Export xizi_double_link_remove_node_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Export xizi_double_link_next_lib.

Import naive_C_Rules.
Local Open Scope string_scope.
Local Open Scope sac.
Import ListNotations.
Local Open Scope Z_scope.

(** Use the accepted next callee's canonical first-value observation. *)
(** Observable result of either empty-list predicate after initialization. *)
Definition xizi_double_link_call_empty_result (ret : Z) : Prop :=
  ret = 1.

(** Observable null pointer returned by head/next on the initialized list. *)
Definition xizi_double_link_call_null_result (ret : Z) : Prop :=
  ret = 0.

(** Observable length of the initialized list. *)
Definition xizi_double_link_call_len_result (ret : Z) : Prop :=
  ret = 0.

(** Abstract sequence produced by inserting one node after an empty sentinel. *)
Definition xizi_double_link_singleton_nodes {A : Type}
  (node : XiziStoreADLL.DL_Node A) : list (XiziStoreADLL.DL_Node A) :=
  cons node nil.

(** The exact IDNode ownership split from the saved crtosverify reference.
    Layout is symbolic: no numeric offset or additional list-node field. *)
Definition xizi_call_store_idnode
  (node_storeA : addr -> Z -> Prop) (link : addr) (id : Z) : Assertion :=
  EX p : addr,
    “ link = &(p # "IdNode" ->ₛ "link") ” && “ node_storeA p id ” &&
    &(p # "IdNode" ->ₛ "id") # UShort |-> id.

Definition xizi_call_store_idnodes
  (node_storeA : addr -> Z -> Prop) (head : addr) (ids : list Z) : Assertion :=
  EX nodes : list (XiziStoreADLL.DL_Node Z),
    “ map XiziStoreADLL.getData nodes = ids ” &&
    XiziStoreADLL.store_dll (xizi_call_store_idnode node_storeA) head nodes.

(** A nonempty list exposes both the real outer id field and the embedded
    node's next/prev ownership, while retaining the sentinel and tail. *)
Lemma xizi_call_idnodes_nonempty_ownership :
  forall node_storeA head id ids,
  xizi_call_store_idnodes node_storeA head (id :: ids) |--
  EX (p link next last : addr) (rest : list (XiziStoreADLL.DL_Node Z)),
    “ head <> NULL /\ link <> NULL /\ link <> head /\
       link = &(p # "IdNode" ->ₛ "link") /\ node_storeA p id /\
       map XiziStoreADLL.getData rest = ids ” &&
    xizi_dll_links head link last **
    &(p # "IdNode" ->ₛ "id") # UShort |-> id **
    &(link # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
    &(link # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head **
    XiziStoreADLL.dllseg (xizi_call_store_idnode node_storeA)
      next link head last rest.
Proof.
  intros node_storeA head id ids.
  unfold xizi_call_store_idnodes. Intros nodes.
  destruct nodes as [|[data link] rest]; simpl in H; [discriminate|].
  inversion H; subst data.
  unfold XiziStoreADLL.store_dll. Intros first last.
  simpl XiziStoreADLL.dllseg. Intros next.
  unfold xizi_call_store_idnode. Intros p.
  subst first.
  Exists p link next last rest.
  unfold xizi_dll_links, XiziDLL.links, XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field, XiziDoubleLinkLayout.prev_field.
  entailer!.
Qed.
