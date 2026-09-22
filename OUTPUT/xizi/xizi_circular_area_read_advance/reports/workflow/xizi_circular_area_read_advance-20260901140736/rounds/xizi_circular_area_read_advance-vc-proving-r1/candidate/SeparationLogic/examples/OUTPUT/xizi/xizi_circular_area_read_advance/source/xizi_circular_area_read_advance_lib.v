Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

(** The callable input resource has a null arm and, for every non-null arm,
    exactly the shared circular-area representation.  Keeping the disjunction
    behind one assertion also gives C annotations a unique function-entry
    branch for parameter-to-[at pre] bridges. *)
Definition CircularAreaDivideRdDataInput
    (circular_area data_buffer readidx writeidx area_length b_status operations
     data_length : Z)
    (logical : list Z) (physical : list (option Z)) : Assertion :=
  (“ circular_area = 0 ” && emp) ||
  (“ circular_area <> 0 /\
     0 <= data_length <= area_length /\
     CircularAreaLogicalState readidx writeidx area_length b_status
                              logical physical ” &&
   CircularAreaBackingResource
     circular_area data_buffer readidx writeidx area_length b_status operations
     logical physical).

(** [ret] states whether a circular read of [data_length] bytes starting at
    [readidx] must be split into a tail segment and a head segment. *)
Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length ret : Z) : Prop :=
  (readidx + data_length <= area_length /\ ret = 0) \/
  (area_length < readidx + data_length /\ ret = 1).
