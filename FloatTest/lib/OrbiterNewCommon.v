(* Shared executable helpers for INPUT/orbiter-new FloatTest specifications. *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Export FloatLib.
From Flocq.IEEE754 Require Export BinarySingleNaN Binary Bits.
Require Export FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition nthz (n : nat) (xs : list Z) : Z := nth n xs 0.
Definition u8 (x : Z) : Z := Z.land x 255.
Definition u16 (x : Z) : Z := Z.land x 65535.
Definition u32 (x : Z) : Z := Z.land x 4294967295.

Definition b64_add (a b : Z) : Z := bits_of_b64 (fp64_add (f64 a) (f64 b)).
Definition b64_sub (a b : Z) : Z := bits_of_b64 (fp64_sub (f64 a) (f64 b)).
Definition b64_mul (a b : Z) : Z := bits_of_b64 (fp64_mul (f64 a) (f64 b)).
Definition b64_div (a b : Z) : Z := bits_of_b64 (fp64_div (f64 a) (f64 b)).
Definition b64_neg (a : Z) : Z := bits_of_b64 (fp64_neg (f64 a)).
Definition b64_sqrt (a : Z) : Z := bits_of_b64 (fp64_sqrt (f64 a)).

Definition z_eqb (a b : Z) : bool := Z.eqb a b.
Definition z_leb (a b : Z) : bool := Z.leb a b.
Definition z_ltb (a b : Z) : bool := Z.ltb a b.

Fixpoint all_z_eqb (xs ys : list Z) : bool :=
  match xs, ys with
  | [], [] => true
  | x :: xs', y :: ys' => Z.eqb x y && all_z_eqb xs' ys'
  | _, _ => false
  end.
