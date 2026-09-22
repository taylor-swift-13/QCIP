(* Executable fp64 model of the active CS_TrgtAtt_AMM_2NoSAR core. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.
Require Import FloatTest.lib.FloatAttitude.

Import ListNotations.
Local Open Scope Z_scope.

Definition fa_add3 (x y : list fp64) : list fp64 :=
  match x, y with
  | [x0; x1; x2], [y0; y1; y2] =>
      [fp64_add x0 y0; fp64_add x1 y1; fp64_add x2 y2]
  | _, _ => []
  end.

Definition fa_add3_drift (x y : list fp64) (dpsi : fp64) : list fp64 :=
  match x, y with
  | [x0; x1; x2], [y0; y1; y2] =>
      [fp64_add x0 y0; fp64_add x1 y1; fp64_add (fp64_add x2 y2) dpsi]
  | _, _ => []
  end.

Definition fa_sub3 (x y : list fp64) : list fp64 :=
  match x, y with
  | [x0; x1; x2], [y0; y1; y2] =>
      [fp64_sub x0 y0; fp64_sub x1 y1; fp64_sub x2 y2]
  | _, _ => []
  end.

Definition cs_TrgtAtt_AMM_2NoSAR_fun
    (qbo qrb : list fp64) (psi dpsi : fp64)
    (cb csib coi w0i wrb0 a_ref_in : list fp64) : list Z :=
  let qro_ping := fa_qmulti qbo qrb in
  let tmp_q := [ZERO64; ZERO64;
                ported_sin (fp64_mul HALF64 psi);
                ported_cos (fp64_mul HALF64 psi)] in
  let tmp_cp := fa_q2c tmp_q in
  let tmp_cpp := fa_mm333 tmp_cp csib in
  let tmp_c := fa_q2c qro_ping in
  let tmp_f33 := fa_mm333 cb tmp_c in
  let cro_si := fa_mm333 tmp_cpp tmp_f33 in
  let wri_si := fa_add3_drift (fa_mm331 cro_si w0i)
                              (fa_mm331 tmp_cpp wrb0) dpsi in
  let cro := fa_mm333 csib cro_si in
  let wri := fa_mm331 csib wri_si in
  let qro := fa_c2q cro in
  let qri := fa_c2q (fa_mm333 cro coi) in
  let wro := fa_sub3 wri (fa_mm331 cro w0i) in
  map bits_of_b64 (cro_si ++ wri_si ++ cro ++ wri ++ qro ++ qri ++ wro ++ a_ref_in)
  ++ [1; 1; 1].
