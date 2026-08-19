Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_double_struct_name : string := "SysDoubleLinklistNode".
Definition xizi_double_next_field : string := "node_next".
Definition xizi_double_prev_field : string := "node_prev".

Definition xizi_double_node_store
  (node next prev represented_node : addr) : Assertion :=
  “ node = represented_node ” &&
  &(node # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> next **
  &(node # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> prev.

Fixpoint xizi_dllseg
  (node prev tail last : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil => “ node = tail ” && “ prev = last ” && emp
  | represented_node :: rest =>
      “ node <> NULL ” &&
      EX next : addr,
        xizi_double_node_store node next prev represented_node **
        xizi_dllseg next node tail last rest
  end.

Definition xizi_dll (head : addr) (nodes : list addr) : Assertion :=
  EX first : addr,
  EX last : addr,
    &(head # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> first **
    &(head # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> last **
    xizi_dllseg first head head last nodes.

Lemma xizi_dll_front_empty_iff__dll_empty_classification :
  forall head first last nodes,
    &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    xizi_dllseg first head head last nodes
    |-- “ first = head <-> nodes = nil ”.
Proof.
  intros head first last nodes.
  destruct nodes as [| represented_node rest].
  - simpl.
    Intros_p Hfirst.
    dump_pre_spatial.
    tauto.
  - simpl.
    destruct (Z.eq_dec first head) as [Heq | Hneq].
    + subst first.
      Intros next.
      unfold xizi_double_node_store.
      unfold xizi_double_struct_name, xizi_double_next_field,
        xizi_double_prev_field.
      Intros_p Hrepresented.
      sep_apply
        (dup_store_ptr
           (&(head # "SysDoubleLinklistNode" ->ₛ "node_next"))
           head next).
      entailer!.
    + dump_pre_spatial.
      split.
      * intro Heq.
        exfalso.
        exact (Hneq Heq).
      * intro Hnil.
        discriminate Hnil.
Qed.
