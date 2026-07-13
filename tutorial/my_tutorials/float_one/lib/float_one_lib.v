Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Reals.Reals.
Require Import Coq.micromega.Psatz.
From Coq Require Import SpecFloat.
From SimpleC.SL Require Export FloatLib.

Local Open Scope Z_scope.
Local Open Scope R_scope.

Definition returnOnePost (ret : fp64) : Prop :=
  ret = fp64_of_real 1.0.
