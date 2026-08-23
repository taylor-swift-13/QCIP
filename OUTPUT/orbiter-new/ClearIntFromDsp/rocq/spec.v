Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition clearIntFromDsp_fun (_xs : list Z) : list Z :=
  [2; 536870912; 4; 536870916; 4].
