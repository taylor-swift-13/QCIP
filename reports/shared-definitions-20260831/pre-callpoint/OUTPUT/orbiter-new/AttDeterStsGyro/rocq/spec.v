Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition attDeterStsGyro_fun (xs : list Z) : list Z :=
  let bz4 := nthz 0 xs in
  let iner := nthz 1 xs in
  let residual_case := nthz 2 xs in
  let initial_count := nthz 3 xs in
  let old0 := nthz 4 xs in let old1 := nthz 5 xs in let old2 := nthz 6 xs in
  let cur0 := nthz 7 xs in let cur1 := nthz 8 xs in let cur2 := nthz 9 xs in
  let next_count :=
    if Z.eqb iner 1
    then if Z.eqb residual_case 0 then initial_count + 1 else 0
    else initial_count in
  if Z.eqb bz4 0
  then [b64_neg old0; b64_neg old1; b64_neg old2;
        old0; old1; old2; iner; next_count; 0]
  else [cur0; cur1; cur2; cur0; cur1; cur2; iner; next_count; 0].
