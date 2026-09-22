Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** The insertion contract reuses the shared payload node and list predicates.
    Its mathematical effect is exactly cons (Build_sll_payload_node a p) l. *)
Require Export QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.
