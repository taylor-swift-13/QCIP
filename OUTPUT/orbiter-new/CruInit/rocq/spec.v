Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cruInit_fun (xs : list Z) : list Z :=
  [0; nthz 2 xs; 1; 1; 0; 0;
   if nthz 0 xs =? 1 then 17 else 0;
   0; 0; 100].
