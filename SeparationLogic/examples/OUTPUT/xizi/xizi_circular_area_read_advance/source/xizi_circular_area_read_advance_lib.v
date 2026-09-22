Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

(** A single syntactic entry branch for [CircularAreaDivideRdData].  Packaging
    the nullable ownership alternatives gives QCP one unambiguous [@pre]
    snapshot while preserving the original null and valid-state behaviors. *)
Definition CircularAreaDivideRdDataInput
    (state : circular_area_state) (LitMap : string -> Z)
    (circular_area data_length area_addr : Z) : Assertion :=
  GlobalStrings LitMap **
  ((“ circular_area = 0 ” && emp) ||
   (“ circular_area = area_addr /\ circular_area <> 0 /\
      0 <= data_length <= Zlength (ca_contents state) ” &&
    store_circular_area state circular_area)).

(** Abstract result visible to callers: the helper preserves the FIFO and
    returns one of the two branch tags.  Which tag is observed depends on the
    hidden concrete read index, so the public state intentionally cannot
    distinguish them. *)
Definition CircularAreaStateDivideRdDataResult
    (state : circular_area_state) (data_length result : Z) : Prop :=
  CircularAreaValid state /\
  0 <= data_length <= Zlength (ca_contents state) /\
  (result = 0 \/ result = 1).

(** [ret] states whether a circular read of [data_length] bytes starting at
    [readidx] must be split into a tail segment and a head segment. *)
Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length ret : Z) : Prop :=
  (readidx + data_length <= area_length /\ ret = 0) \/
  (area_length < readidx + data_length /\ ret = 1).
