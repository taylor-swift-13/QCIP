(* Executable model of the dispatch and argument forwarding in
 * INPUT/iplib/CS_Track_Plan/source/IP_CS_Track_Plan.c. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cs_Track_Plan_fun
    (style : Z) (t_sinacc_max dt_rate_ref dt_torq_ref : fp64) : list Z :=
  if style =? 0 then
    [1; 1; bits_of_b64 t_sinacc_max;
     bits_of_b64 dt_rate_ref; bits_of_b64 dt_torq_ref]
  else if style =? 1 then
    [2; 1; 0; 0; 0]
  else if style =? 2 then
    [3; 1; bits_of_b64 dt_rate_ref;
     bits_of_b64 dt_torq_ref; 0]
  else if style =? 3 then
    [4; 1; 0; 0; 0]
  else
    [0; 1; 0; 0; 0].
