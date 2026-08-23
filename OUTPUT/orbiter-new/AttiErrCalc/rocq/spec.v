Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.
Import ListNotations. Local Open Scope Z_scope.
Definition ERR_TWO:Z:=4611686018427387904.
Definition ERR_Q1:Z:=4598175219545276416.
Definition ERR_Q2:Z:=13826050856027422720.
Definition attiErrCalc_fun(xs:list Z):list Z :=
 let source0:=if Z.eqb (nthz 1 xs) 1 then nthz 8 xs else nthz 5 xs in
 let source1:=if Z.eqb (nthz 1 xs) 1 then nthz 9 xs else nthz 6 xs in
 let source2:=if Z.eqb (nthz 1 xs) 1 then nthz 10 xs else nthz 7 xs in
 [0;nthz 0 xs;0;0;0;0;
  if Z.eqb (nthz 0 xs) 1 then ERR_TWO else 0;
  b64_mul ERR_Q1 ERR_TWO;b64_mul ERR_Q2 ERR_TWO;
  b64_sub source0 (nthz 2 xs);b64_sub source1 (nthz 3 xs);b64_sub source2 (nthz 4 xs);
  1;1;1;1].
