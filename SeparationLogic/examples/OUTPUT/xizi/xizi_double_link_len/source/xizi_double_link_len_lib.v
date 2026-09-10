Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
From SimpleC.SL Require Import Mem SeparationLogic StoreAux.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

(** The result is the mathematical list length. The loop splits the shared
    DLL node list into a visited prefix and an unvisited suffix. Shifted
    prefix ownership leaves the cursor next field available for the test. *)
