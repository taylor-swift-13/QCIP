(* Executable binary64 model of three original CS_AttCtrl_Propel kernels. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition propel_zero : fp64 := f64 0.
Definition propel_eps : fp64 := f64 4532020583610935537.

Definition propel_cfg (work_mode : Z) (timer start : fp64)
    (flags : list Z) : Z :=
  match flags with
  | [earth;yaw;jet_back;scan;rw8;sub;unload] =>
      if ((work_mode =? 1) && c64_lt timer start)%bool then 0
      else if ((work_mode =? 6) || (work_mode =? 7) ||
        ((work_mode =? 8) && (earth =? 1)) ||
        ((work_mode =? 8) && (earth =? 0) && (yaw =? 1)) ||
        ((work_mode =? 12) && (jet_back =? 1) && (scan =? 10)))%bool
      then 1
      else if ((work_mode =? 8) && (rw8 =? 0) && (sub =? 2))%bool
      then 2
      else if unload =? 1 then 3 else 4
  | _ => 4
  end.

Definition propel_cross_pair (ti tj : fp64) (fi fj state : Z)
    : fp64 * fp64 * Z * Z * Z :=
  if c64_gt (fp64_mul ti tj) propel_eps then
    let choose_j := (fi <? fj) || ((state =? 0) && (fi =? fj)) in
    let ti1 := if choose_j then propel_zero else ti in
    let fi1 := if choose_j then 0 else fi in
    let state1 := if choose_j then 1 else state in
    if c64_gt ti1 propel_eps
    then (ti1, propel_zero, fi1, 0, 0)
    else (ti1, tj, fi1, fj, state1)
  else (ti, tj, fi, fj, state).

Definition propel_cross (selector : Z) (times : list fp64)
    (jets states : list Z) : list Z :=
  match times, jets, states with
  | [t0;t1;t2], [j0;j1;j2], [s0;s1;s2] =>
      if selector =? 1 then
        let '(u0,u1,v0,v1,r0) := propel_cross_pair t0 t1 j0 j1 s0 in
        [bits_of_b64 u0;bits_of_b64 u1;bits_of_b64 t2;v0;v1;j2;r0;s1;s2]
      else if selector =? 2 then
        let '(u0,u2,v0,v2,r1) := propel_cross_pair t0 t2 j0 j2 s1 in
        [bits_of_b64 u0;bits_of_b64 t1;bits_of_b64 u2;v0;j1;v2;s0;r1;s2]
      else if selector =? 3 then
        let '(u1,u2,v1,v2,r2) := propel_cross_pair t1 t2 j1 j2 s2 in
        [bits_of_b64 t0;bits_of_b64 u1;bits_of_b64 u2;j0;v1;v2;s0;s1;r2]
      else map bits_of_b64 times ++ jets ++ states
  | _,_,_ => []
  end.

Fixpoint propel_find_loop (xs : list fp64) (idx length : Z)
    (found : bool) (minv maxv : fp64) (minpos maxpos : Z) : Z * Z :=
  match xs with
  | [] => (minpos,maxpos)
  | x::rest =>
      if idx <? length then
        if c64_eq x propel_zero then
          propel_find_loop rest (idx+1) length found minv maxv minpos maxpos
        else if found then
          propel_find_loop rest (idx+1) length true
            (if c64_lt x minv then x else minv)
            (if c64_ge x maxv then x else maxv)
            (if c64_lt x minv then idx else minpos)
            (if c64_ge x maxv then idx else maxpos)
        else propel_find_loop rest (idx+1) length true x x idx idx
      else (minpos,maxpos)
  end.

Definition cs_AttCtrl_Propel_fun (kind selector : Z) (timer start : fp64)
    (flags : list Z) (times : list fp64) (jets states : list Z)
    (values : list fp64) : list Z :=
  if kind =? 0 then
    propel_cfg selector timer start flags ::
      (map bits_of_b64 times ++ jets ++ states ++ [91;92])
  else if kind =? 1 then 0 :: (propel_cross selector times jets states ++ [91;92])
  else
    let '(minpos,maxpos) :=
      propel_find_loop values 0 selector false propel_zero propel_zero 91 92 in
    0 :: (map bits_of_b64 times ++ jets ++ states ++ [minpos;maxpos]).
