Require Import Coq.ZArith.ZArith.
Require Export
  SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source.xizi_circular_area_callpoint_specs_lib.

Local Open Scope Z_scope.

Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

Require Import Coq.micromega.Lia.
Lemma circular_area_distinct_indices_imply_nonfull__is_full_contract :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status
                             logical physical ->
    readidx <> writeidx ->
    Zlength logical < area_length.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hneq.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hlength [Hread [_ [Hlogical [_ [_ [Hwrite _]]]]]]].
  destruct Hlength as [Hlength_pos Hlength_bound].
  destruct Hread as [Hread_nonneg Hread_bound].
  destruct Hlogical as [Hlogical_nonneg Hlogical_bound].
  assert (Zlength logical <> area_length) as Hnot_full.
  {
    intro Heq.
    rewrite Heq in Hwrite.
    rewrite Z.add_mod in Hwrite by lia.
    rewrite (Z.mod_small readidx area_length) in Hwrite by lia.
    rewrite (Z.mod_same area_length) in Hwrite by lia.
    replace (readidx + 0) with readidx in Hwrite by lia.
    rewrite (Z.mod_small readidx area_length) in Hwrite by lia.
    apply Hneq.
    symmetry.
    exact Hwrite.
  }
  lia.
Qed.
Lemma circular_area_nonfull_mod_length__data_length_contract :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status
                             logical physical ->
    Zlength logical < area_length ->
    (writeidx - readidx + area_length) mod area_length = Zlength logical.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hnonfull.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
      (Hcapacity & Hread & Hwrite & Hlogical_bounds & Hphysical_length &
       Hbytes & Hwrite_equation & Hstatus_full & Hstatus_nonfull & Hlive).
  rewrite Hwrite_equation.
  replace ((readidx + Zlength logical) mod area_length - readidx + area_length)
    with ((readidx + Zlength logical) mod area_length +
          (- readidx + area_length)) by lia.
  rewrite Z.add_mod_idemp_l by lia.
  replace (readidx + Zlength logical + (- readidx + area_length))
    with (Zlength logical + 1 * area_length) by lia.
  rewrite Z.mod_add by lia.
  rewrite Z.mod_small by lia.
  reflexivity.
Qed.
