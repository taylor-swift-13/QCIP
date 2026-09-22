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

Definition CircularAreaStateEmptyResult
           (state : circular_area_state) (result : Z) : Prop :=
  (ca_contents state = nil /\ result = 1) \/
  (ca_contents state <> nil /\ result = 0).

Lemma CircularAreaLogicalState_nil_iff__empty_query_unfold_and_repack :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState
      readidx writeidx area_length b_status logical physical ->
    (logical = nil <-> readidx = writeidx /\ b_status = 0).
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Hcapacity
      [Hread
        [Hwrite
          [Hlogical_length
            [Hphysical_length
              [Hbytes
                [Hwriteidx
                  [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  split.
  - intros Hnil.
    subst logical.
    rewrite Zlength_nil in Hwriteidx.
    replace (readidx + 0) with readidx in Hwriteidx by lia.
    rewrite Z.mod_small in Hwriteidx by exact Hread.
    split.
    + symmetry; exact Hwriteidx.
    + destruct Hstatus as [Hstatus | Hstatus]; [exact Hstatus |].
      exfalso.
      assert (Hlength : Zlength (@nil Z) = area_length).
      { apply (proj1 Hfull). split; [symmetry; exact Hwriteidx | exact Hstatus]. }
      rewrite Zlength_nil in Hlength.
      lia.
  - intros [Hindices Hstatus_zero].
    apply Zlength_nil_inv.
    apply (proj1 Hempty).
    split; assumption.
Qed.
