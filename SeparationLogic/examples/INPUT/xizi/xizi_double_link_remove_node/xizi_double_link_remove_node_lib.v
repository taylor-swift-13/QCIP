Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

(* [nodes] lists the successive addresses on the open path from [first]
   through [last].  The predicate owns every interior forward/backward link,
   but deliberately leaves [first.prev] and [last.next] to its caller. *)
Fixpoint xizi_dll_open (first last : addr) (nodes : list Z) : Assertion :=
  match nodes with
  | nil => “ first = last ” && emp
  | next :: rest =>
      “ first <> last ” &&
      &(first # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
      &(next # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> first **
      xizi_dll_open next last rest
  end.
