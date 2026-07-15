Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass.
Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_dll_empty (head: addr) : Assertion :=
  “ head <> NULL ” &&
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head.
