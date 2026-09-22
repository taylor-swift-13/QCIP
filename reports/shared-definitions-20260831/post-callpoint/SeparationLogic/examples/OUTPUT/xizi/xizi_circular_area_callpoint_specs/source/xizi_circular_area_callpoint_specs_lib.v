Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope string_scope.
Local Open Scope sac.

Definition CircularAreaCallResult (ret : Z) : Assertion :=
  (“ ret = 0 ” && EX failed_area : Z,
     CircularAreaInitFailureResource failed_area) ||
  (“ ret = 1 ” && emp).

Definition CircularAreaReadCallResult
    (ret output byte : Z) : Assertion :=
  (“ ret = 0 ” && EX failed_area : Z,
     CircularAreaInitFailureResource failed_area **
     UCharArray.undef_full output 1) ||
  (“ ret = 1 ” && UCharArray.full output 1 (byte :: nil)).

Definition CircularAreaEmptyResult (logical : list Z) (ret : Z) : Prop :=
  ret = match logical with nil => 1 | _ :: _ => 0 end.

Definition CircularAreaFullResult
    (area_length : Z) (logical : list Z) (ret : Z) : Prop :=
  ret = if Z.eq_dec (Zlength logical) area_length then 1 else 0.

Definition CircularAreaDataLengthResult
    (logical : list Z) (ret : Z) : Prop :=
  ret = Zlength logical.

Definition CircularAreaMaxLengthResult
    (area_length ret : Z) : Prop :=
  ret = area_length.
