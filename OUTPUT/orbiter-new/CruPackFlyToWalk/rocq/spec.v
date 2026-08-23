Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cruPackFlyToWalk_fun (xs : list Z) : list Z :=
  [nthz 0 xs; u32 (nthz 2 xs); 85;
   nthz 3 xs; nthz 4 xs; nthz 5 xs; 0; 0;
   u8 (85 + nthz 3 xs + nthz 4 xs + nthz 5 xs);
   1; 1; 13; 62; 1; 1; 63].
