Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Import naive_C_Rules.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

(** Initialization yields the empty generic list for every A and storeA.
    The query preserves the same logical nodes and decides equality to nil.
    Composition therefore returns 1 with the empty generic list unchanged.
    These properties use the shared predicates directly. *)
