Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import SimpleC.SL.IntLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition store_circular_area_or_null
           (state : circular_area_state) (circular_area : addr) : Assertion :=
  (“ circular_area = 0 ” && emp) ||
  (“ circular_area <> 0 ” && store_circular_area state circular_area).

Definition CircularAreaStateFullResult
           (state : circular_area_state) (result : Z) : Prop :=
  (Zlength (ca_contents state) = ca_capacity state /\ result = 1) \/
  (Zlength (ca_contents state) <> ca_capacity state /\ result = 0).
