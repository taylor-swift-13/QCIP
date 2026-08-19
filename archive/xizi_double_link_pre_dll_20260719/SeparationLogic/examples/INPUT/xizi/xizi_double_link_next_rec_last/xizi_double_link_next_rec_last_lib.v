Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import Coq.Strings.String.
Require Import AUXLib.ListLib.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Import SetsNotation.
Local Open Scope sets.

Import naive_C_Rules.
Local Open Scope sac.

(* A segment of real list nodes from [cur] up to, but excluding, [stop].
   [pred] is the predecessor of [cur], while [tail] is the predecessor of
   [stop].  Recording both links makes the recursive predicate describe a
   genuinely doubly linked segment rather than a forward-only list. *)
Fixpoint xizi_dllseg
    (cur stop pred tail : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil =>
      “ cur = stop ” && “ pred = tail ” && emp
  | node :: rest =>
      “ cur = node ” && “ cur <> stop ” &&
      EX next : addr,
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pred **
        xizi_dllseg next stop cur tail rest
  end.

(* Complete ownership of a nonempty circular DLL whose sentinel is [head],
   with [last] designated as the final real node.  [prefix] records all real
   nodes before [last]; the empty prefix is the singleton-list case. *)
Definition xizi_dll_last
    (head last : addr) (prefix : list addr) : Assertion :=
  “ head <> NULL ” && “ last <> head ” &&
  EX first prev : addr,
    &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    xizi_dllseg first last head prev prefix **
    &(last # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head **
    &(last # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev.
