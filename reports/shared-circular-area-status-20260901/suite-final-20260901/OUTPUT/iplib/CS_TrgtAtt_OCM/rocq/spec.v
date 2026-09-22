(* Executable fp64 model of IP_CS_TrgtAtt_OCM.c.  CS_Track_Atti is an observed stub. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
Require Import OUTPUT.iplib.CS_TrgtAtt_EIM.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.

Definition cs_TrgtAtt_OCM_fun
    (wm : Z) (seq : list Z) (atr cb coi w0i : list fp64)
  : list Z * list Z * list Z * list Z * Z :=
  let '(cro, wri, qri, wro) := cs_TrgtAtt_EIM_fun wm seq atr cb coi w0i in
  (cro, wri, qri, wro, 1).
