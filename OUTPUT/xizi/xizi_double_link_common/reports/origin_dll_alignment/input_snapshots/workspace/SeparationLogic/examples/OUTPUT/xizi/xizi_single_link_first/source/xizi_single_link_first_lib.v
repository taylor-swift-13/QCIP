Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.
Import naive_C_Rules.
Local Open Scope sets.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

(** Pure address projection preserves the existing first-value specification;
    the spatial contract separately preserves each node's abstract payload. *)
Definition xizi_sll_first_ptrs {A: Type} (l: list (sll_payload_node A)) : list Z :=
  map sll_payload_ptr l.
