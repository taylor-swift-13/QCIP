Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.
Import naive_C_Rules.
Local Open Scope sac.

(** The pure emptiness relation is the public Boolean disjunction in the C
    contract. Generic [xizi_store_dll] preserves the same ordered logical
    nodes and every [storeA] payload, independently of the payload type.
    The shared model supplies all mathematical predicates needed here. *)
