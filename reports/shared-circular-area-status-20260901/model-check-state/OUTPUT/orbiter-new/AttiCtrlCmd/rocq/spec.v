Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.
Import ListNotations. Local Open Scope Z_scope.

Definition ctrl_direct (xs:list Z):bool :=
  (Z.eqb (nthz 0 xs) 3 || Z.eqb (nthz 0 xs) 4 ||
   (Z.eqb (nthz 0 xs) 5 && Z.eqb (nthz 1 xs) 0) ||
   ((Z.eqb (nthz 0 xs) 6 || Z.eqb (nthz 0 xs) 7 || Z.eqb (nthz 0 xs) 8) && Z.eqb (nthz 2 xs) 1))%bool.
Definition ctrl_marker (xs:list Z):Z := if ctrl_direct xs then 2 else 3.
Definition marker_bits (m i:Z):Z :=
  if Z.eqb (m+i) 2 then 4611686018427387904 else
  if Z.eqb (m+i) 3 then 4613937818241073152 else
  if Z.eqb (m+i) 4 then 4616189618054758400 else
  if Z.eqb (m+i) 5 then 4617315517961601024 else 4618441417868443648.
Definition attiCtrlCmd_fun(xs:list Z):list Z :=
  if Z.eqb (nthz 0 xs) 2 then
    [nthz 7 xs;nthz 8 xs;nthz 9 xs;nthz 10 xs;0;0;0;0;0;1;1;0;1]
  else let m:=ctrl_marker xs in
    [marker_bits m 0;marker_bits m 1;marker_bits m 2;marker_bits m 3;
     0;0;0;1;1;1;1;m;1].
