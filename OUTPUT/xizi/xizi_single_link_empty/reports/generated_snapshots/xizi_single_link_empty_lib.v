Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Import SetsNotation.
Import naive_C_Rules.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope sac.

(** Exact emptiness relation; independent of representation and payload. *)
Definition xizi_sll_empty_result {A: Type} (l: list A) (ret: Z): Prop :=
  (l = nil /\ ret = 1) \/ (l <> nil /\ ret = 0).
