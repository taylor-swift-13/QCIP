Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.

Import ListNotations.
Import CRules.
Local Open Scope sac.
Local Open Scope string_scope.
Local Open Scope Z_scope.

(** Mathematical result of observing the first element of a sentinel-headed
    doubly linked list.  The empty list returns the API's null value; a
    nonempty list returns its first node address. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | first :: _ => first
  end.

(** Forget only logical data when computing the observed address; the spatial
    contract retains the original nodes and their payload resources. *)
Definition xizi_double_link_head_ptrs {A : Type}
  (nodes : list (DLL.DL_Node A)) : list Z :=
  map DLL.getPtr nodes.
