(* Executable fp64 model of IP_CS_TrgtP2P_Tar_Init.c. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.
Require Import OUTPUT.iplib.CS_TrgtAtt_EIM.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.

Definition identity33 : list fp64 :=
  [ONE64; ZERO64; ZERO64; ZERO64; ONE64; ZERO64; ZERO64; ZERO64; ONE64].

Definition selected_angle2c (wm : Z) (seq : list Z) (angles : list fp64)
  : list fp64 :=
  match angles with
  | [a1; a2; a3] =>
      let sv := nth (Z.to_nat wm) seq 321 in
      if sv =? 123 then angle2c123 a1 a2 a3
      else if sv =? 132 then angle2c132 a1 a2 a3
      else if sv =? 213 then angle2c213 a1 a2 a3
      else if sv =? 231 then angle2c231 a1 a2 a3
      else if sv =? 312 then angle2c312 a1 a2 a3
      else angle2c321 a1 a2 a3
  | _ => []
  end.

Definition cs_TrgtP2P_Tar_Init_fun
    (next_mode wm : Z) (seq : list Z) (angles cso cro_initial : list fp64)
  : list Z * Z * Z :=
  if next_mode =? 1 then (map bits_of_b64 identity33, 1, 0)
  else if next_mode =? 2 then
    (map bits_of_b64 (selected_angle2c wm seq angles), 1, 0)
  else if next_mode =? 3 then (map bits_of_b64 cso, 1, 0)
  else (map bits_of_b64 cro_initial, 0, 1).
