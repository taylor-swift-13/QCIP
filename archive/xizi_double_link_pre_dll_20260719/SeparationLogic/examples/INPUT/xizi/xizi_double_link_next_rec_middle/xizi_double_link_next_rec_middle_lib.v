Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass.
Require Import SimpleC.SL.Mem.
Require Import SimpleC.SL.SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Import SetsNotation.
Local Open Scope sets.
Local Open Scope list.
Local Open Scope string.

Import naive_C_Rules.
Local Open Scope sac.

(** [xizi_dllseg x y px py xs] owns the non-overlapping nodes whose
    addresses are [xs].  The segment begins at [x], stops just before [y],
    and records the predecessor links [px] at the beginning and [py] at the
    end.  Thus the address sequence, not a replay of the C function, is the
    mathematical content of the predicate. *)
Fixpoint xizi_dllseg
    (x y px py : addr) (xs : list Z) : Assertion :=
  match xs with
  | nil => “ x = y ” && “ px = py ” && emp
  | a :: xs0 =>
      “ x = a ” && “ x <> NULL ” &&
      EX next : addr,
        &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
        xizi_dllseg next y x py xs0
  end.

(** A strict successor is an adjacent pair in an abstract node-address
    sequence.  Requiring two consecutive elements excludes the sentinel/end
    case and states exactly the value computed by the target function. *)
Definition xizi_strict_successor
    (node successor : Z) (nodes : list Z) : Prop :=
  exists prefix suffix : list Z,
    nodes = (prefix ++ node :: successor :: suffix)%list.
