Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition coastingDynamic_fun (xs : list Z) : list Z :=
  [nthz 3 xs; nthz 4 xs; nthz 5 xs;
   nthz 6 xs; nthz 7 xs; nthz 8 xs;
   nthz 0 xs; nthz 1 xs; nthz 2 xs;
   1; 1].
