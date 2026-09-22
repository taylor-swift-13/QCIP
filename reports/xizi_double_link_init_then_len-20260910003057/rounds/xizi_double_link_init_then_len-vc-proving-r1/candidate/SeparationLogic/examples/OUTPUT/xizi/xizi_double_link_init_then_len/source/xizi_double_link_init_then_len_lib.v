Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

(** Mathematical result of initializing a list and then observing its length. *)
Definition xizi_double_link_init_then_len_result (ret : Z) : Prop :=
  ret = 0.
