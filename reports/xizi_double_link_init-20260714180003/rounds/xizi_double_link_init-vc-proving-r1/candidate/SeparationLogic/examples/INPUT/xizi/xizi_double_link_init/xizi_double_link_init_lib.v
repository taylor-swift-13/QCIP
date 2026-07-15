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

Definition xizi_dll_empty (head : addr) : Assertion :=
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> head **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> head.
