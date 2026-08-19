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

(** [xizi_dllseg cur prev stop last nodes] owns the bidirectional open
    chain whose node-address sequence is [nodes].  The chain starts at
    [cur], its first node points back to [prev], and after the last node it
    reaches [stop] with predecessor [last].  Thus the empty segment records
    both boundary equalities without owning memory. *)
Fixpoint xizi_dllseg
    (cur prev stop last : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil => “ cur = stop /\ prev = last ” && emp
  | node :: rest =>
      “ cur = node ” &&
      EX next : addr,
        &(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
        xizi_dllseg next node stop last rest
  end.

(** The abstract result of observing the successor of a list member.  The
    suffix excludes the observed node: no suffix means that it is the last
    node, while a nonempty suffix begins with its successor. *)
Definition xizi_dll_next_result (suffix : list addr) : addr :=
  match suffix with
  | nil => NULL
  | next :: _ => next
  end.

(** Pure boundary information carried by the suffix split.  Besides making
    the sentinel case explicit, the nonempty clause records that a genuine
    successor is a data node rather than the sentinel. *)
Definition xizi_dll_suffix
    (head next : addr) (suffix : list addr) : Prop :=
  match suffix with
  | nil => next = head
  | first :: _ => next = first /\ first <> head
  end.
