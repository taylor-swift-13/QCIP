Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition centroid_poly (xs : list Z) : Z :=
  let d := b64_sub (nthz 0 xs) (nthz 1 xs) in
  let sq := b64_mul d d in
  b64_add (b64_add (b64_mul (nthz 2 xs) sq) (b64_mul (nthz 3 xs) d)) (nthz 4 xs).

Definition centroidAndInertiaEst_fun (xs : list Z) : list Z :=
  let p := centroid_poly xs in
  [p; p; nthz 5 xs; nthz 6 xs;
   nthz 5 xs; p; nthz 7 xs;
   nthz 6 xs; nthz 7 xs; p;
   p; nthz 8 xs; nthz 9 xs; nthz 10 xs; nthz 11 xs].
