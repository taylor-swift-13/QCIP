Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Definition xizi_circular_area_release_domain
    (circular_area data_buffer area_length : Z)
    (contents : list Z) : Prop :=
  circular_area <> 0 /\
  data_buffer <> 0 /\
  Zlength contents = area_length.
