Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition ONE64 : Z := 4607182418800017408.
Definition attDeterWalk_fun (xs : list Z) : list Z :=
  let lmd := nthz 0 xs in let lc := nthz 1 xs in let rm := nthz 2 xs in
  let tf := b64_mul rm (b64_add lc ONE64) in
  let r0 := b64_mul tf (b64_add lmd ONE64) in
  let r1 := b64_mul tf lmd in let r2 := b64_mul rm lc in
  let hn := b64_add r0 r2 in let ht := b64_div r1 rm in
  let shn := hn in let chn := b64_add hn ONE64 in
  let sht := ht in let cht := b64_add ht ONE64 in
  let c00 := b64_neg (b64_mul sht shn) in
  let c01 := cht in let c02 := b64_neg (b64_mul sht chn) in
  let c10 := chn in let c11 := 0 in let c12 := b64_neg shn in
  let c20 := b64_neg (b64_mul cht shn) in let c21 := b64_neg sht in
  let c22 := b64_neg (b64_mul cht chn) in
  [c00;c01;c02;c10;c11;c12;c20;c21;c22;
   c00;c10;c20;c01;c11;c21;c02;c12;c22; 4;4;1;1].
