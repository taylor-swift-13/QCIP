Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition frame_checksum (xs : list Z) : Z :=
  u8 (68 + nthz 2 xs + nthz 3 xs + u8 (nthz 0 xs) +
      nthz 4 xs + nthz 5 xs + nthz 6 xs + 1010 * nthz 1 xs).

Definition cduToSmuFramePack_fun (xs : list Z) : list Z :=
  [u8 (nthz 0 xs + 1);
   235; 149; 204; 56; 3; 249; 68;
   nthz 2 xs; nthz 3 xs; u8 (nthz 0 xs);
   nthz 4 xs; nthz 5 xs; nthz 6 xs;
   frame_checksum xs;
   1; 1; 1; 1; 1017].
