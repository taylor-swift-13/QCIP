(* CS_IRES_Attitude 的无可用传感器路径 spec。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.

Import ListNotations.
Local Open Scope Z_scope.

Definition ires_no_sensor_fun
    (fs0 fs1 : Z) (old_fv old_fu : list Z) : list Z * list Z :=
  if Z.eqb (fs0 + fs1) 0 then ([0; 0], [0; 0])
  else (old_fv, old_fu).
