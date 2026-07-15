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

Fixpoint xizi_dllseg
  (cur prev sentinel last : addr) (nodes : list addr) : Assertion :=
  match nodes with
  | nil =>
      “ cur = sentinel /\ prev = last ” && emp
  | node :: rest =>
      “ cur = node /\ cur <> sentinel ” &&
      EX next : addr,
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
        xizi_dllseg next cur sentinel last rest
  end.

Definition xizi_dll
  (sentinel : addr) (nodes : list addr) : Assertion :=
  EX first last : addr,
    &(sentinel # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    &(sentinel # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    xizi_dllseg first sentinel sentinel last nodes.

Definition xizi_dll_head_value (nodes : list addr) : addr :=
  match nodes with
  | nil => NULL
  | node :: _ => node
  end.

Definition xizi_dll_first_value
  (sentinel : addr) (nodes : list addr) : addr :=
  match nodes with
  | nil => sentinel
  | node :: _ => node
  end.
