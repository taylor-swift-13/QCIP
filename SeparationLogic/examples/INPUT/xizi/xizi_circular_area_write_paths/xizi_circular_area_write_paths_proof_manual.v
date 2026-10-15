Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From SimpleC.EE.INPUT.xizi.xizi_circular_area_write_paths Require Import xizi_circular_area_write_paths_goal.
From SimpleC.EE.INPUT.xizi.xizi_circular_area_write_paths Require Import xizi_circular_area_write_paths_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_circular_area_write_paths Require Import xizi_circular_area_write_paths_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
pre_process.
Intros.
unfold CircularAreaFullByFieldsResult, CircularAreaStateFullResult, CircularAreaLogicalState in *.
entailer!.
all: destruct PreH5 as [_ [_ [_ [_ [_ [_ [_ [_ [Hfull _]]]]]]]]].
all: unfold CircularAreaStateFullResult, CircularAreaFullByFieldsResult.
- destruct (Z.eq_dec (Zlength (ca_contents state_is_full_spec)) (ca_capacity state_is_full_spec)) as [Hcap|Hcap].
  + exfalso. apply PreH1. exact (proj1 (proj2 Hfull Hcap)).
  + reflexivity.
- destruct (Z.eq_dec readidx_is_full_spec writeidx_is_full_spec); [congruence|reflexivity].
Qed. 

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
pre_process. Intros. unfold CircularAreaFullByFieldsResult, CircularAreaStateFullResult, CircularAreaLogicalState in *.
entailer!.
destruct PreH6 as [Hcap [_ [_ [_ [_ [_ [_ [_ [_ [Hempty _]]]]]]]]]].
assert (Hlen0 : Zlength (ca_contents state_is_full_spec) = 0) by (apply (proj1 Hempty); split; assumption).
- unfold CircularAreaStateFullResult. rewrite Hlen0. destruct (Z.eq_dec 0 (ca_capacity state_is_full_spec)); [exfalso; pose proof (proj1 Hcap); lia|reflexivity].
- unfold CircularAreaFullByFieldsResult. rewrite PreH2, PreH1. simpl. destruct (Z.eq_dec writeidx_is_full_spec writeidx_is_full_spec); [reflexivity|congruence].
Qed. 

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
pre_process. Intros. unfold CircularAreaFullByFieldsResult, CircularAreaStateFullResult, CircularAreaLogicalState in *.
entailer!.
all: destruct PreH6 as [_ [_ [_ [_ [_ [_ [_ [Hstatus [Hfull _]]]]]]]]].
all: destruct Hstatus as [Hzero|Hone].
- congruence.
- assert (Hlen : Zlength (ca_contents state_is_full_spec) = ca_capacity state_is_full_spec) by (apply (proj1 Hfull); split; assumption).
  unfold CircularAreaStateFullResult. rewrite Hlen. destruct (Z.eq_dec (ca_capacity state_is_full_spec) (ca_capacity state_is_full_spec)); congruence.
- congruence.
- unfold CircularAreaFullByFieldsResult. rewrite PreH2, Hone. simpl. destruct (Z.eq_dec writeidx_is_full_spec writeidx_is_full_spec); [reflexivity|congruence].
Qed. 

Lemma proof_of_CircularAreaGetDataLength_safety_wit_3 : CircularAreaGetDataLength_safety_wit_3.
Proof.
pre_process. Intros.
pose proof PreH3 as Hstate.
unfold CircularAreaLogicalState in Hstate.
destruct Hstate as [Hcap _].
entailer!.
Qed. 

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
pre_process. Intros.
unfold CircularAreaDataLengthByFieldsResult, CircularAreaStateDataLengthResult.
unfold CircularAreaStateFullResult in PreH2. rewrite PreH8 in PreH2.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
destruct Hstate as [Hcap [Hread [Hwrite [Hlen [_ [_ [Hindex _]]]]]]].
assert (Hnotfull : Zlength (ca_contents state_get_data_length_spec) <> ca_capacity state_get_data_length_spec).
{ intro Heq. rewrite Heq in PreH2. simpl in PreH2. destruct (Z.eq_dec (ca_capacity state_get_data_length_spec) (ca_capacity state_get_data_length_spec)); congruence. }
assert (Hshort : Zlength (ca_contents state_get_data_length_spec) < ca_capacity state_get_data_length_spec) by lia.
assert (Hexpr : Z.rem (unsigned_last_nbits (unsigned_last_nbits (unsigned_last_nbits writeidx_get_data_length_spec 32 + ca_capacity state_get_data_length_spec) 32 - unsigned_last_nbits readidx_get_data_length_spec 32) 32) (ca_capacity state_get_data_length_spec) = Zlength (ca_contents state_get_data_length_spec)).
{ exact (circular_area_query_expr__state_queries_errors readidx_get_data_length_spec writeidx_get_data_length_spec (ca_capacity state_get_data_length_spec) (Zlength (ca_contents state_get_data_length_spec)) Hcap Hread Hwrite ltac:(lia) Hindex). }
pose proof (circular_area_data_length_fields__state_queries_errors readidx_get_data_length_spec writeidx_get_data_length_spec (ca_capacity state_get_data_length_spec) b_status_get_data_length_spec (ca_contents state_get_data_length_spec) physical_get_data_length_spec PreH7 Hshort) as Hfields.
entailer!.
all: try exact Hexpr.
all: unfold CircularAreaDataLengthByFieldsResult in Hfields; destruct Hfields as [_ Hfields]; rewrite Hexpr; exact Hfields.
Qed. 

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
pre_process. Intros.
unfold CircularAreaDataLengthByFieldsResult, CircularAreaStateDataLengthResult.
unfold CircularAreaStateFullResult in PreH2.
assert (Hfull_len : Zlength (ca_contents state_get_data_length_spec) = ca_capacity state_get_data_length_spec).
{ destruct (Z.eq_dec (Zlength (ca_contents state_get_data_length_spec)) (ca_capacity state_get_data_length_spec)) as [Heq|Hneq]; [exact Heq|]. rewrite PreH2 in PreH8. simpl in PreH8. destruct (Z.eq_dec (Zlength (ca_contents state_get_data_length_spec)) (ca_capacity state_get_data_length_spec)); congruence. }
pose proof PreH3 as Hstate. unfold CircularAreaLogicalState in Hstate.
destruct Hstate as [Hcap [Hread [Hwrite [Hlen [_ [_ [_ [_ [Hfull _]]]]]]]]].
assert (Hfull_fields : readidx_get_data_length_spec = writeidx_get_data_length_spec /\ b_status_get_data_length_spec = 1) by (apply (proj2 Hfull); exact Hfull_len).
entailer!.
destruct Hfull_fields as [Heq Hstatus].
subst writeidx_get_data_length_spec b_status_get_data_length_spec.
cbn.
destruct (Z.eq_dec readidx_get_data_length_spec readidx_get_data_length_spec); [destruct (Z.eq_dec 1 0); [congruence|reflexivity]|congruence].
Qed. 

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
pre_process.
Intros.
unfold CircularAreaDivideWrDataResult.
entailer!.
Qed. 

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
pre_process.
Intros.
unfold CircularAreaDivideWrDataResult.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_entail_wit_1 : CircularAreaWriteInvalid_entail_wit_1.
Proof.
  pre_process.
  match goal with H : CircularAreaWriteInvalidParameters _ _ _ |- _ =>
    pose proof H as Hinvalid;
    unfold CircularAreaWriteInvalidParameters in H;
    destruct H as [Harea | [Hinput | Hlength]]
  end.
  - Right. entailer!.
  - Left. Right. entailer!.
  - Left. Left. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_1 : CircularAreaWriteInvalid_return_wit_1.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_2 : CircularAreaWriteInvalid_return_wit_2.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_3 : CircularAreaWriteInvalid_return_wit_3.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_4 : CircularAreaWriteInvalid_return_wit_4.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_5 : CircularAreaWriteInvalid_return_wit_5.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteInvalid_return_wit_6 : CircularAreaWriteInvalid_return_wit_6.
Proof.
  pre_process.
  Exists state_write_invalid_spec.
  unfold CircularAreaWriteInvalidResult, CircularAreaWriteInput,
    CircularAreaDescriptorOwnership, CircularAreaInputOwnership.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_1 : CircularAreaWriteNormal_entail_wit_1.
Proof.
pre_process. unfold CircularAreaWriteNormalParameters in PreH1. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_2 : CircularAreaWriteNormal_entail_wit_2.
Proof.
pre_process. unfold CircularAreaWriteInput.
Intros.
repeat Split; Intros; try solve [entailer!].
unfold store_circular_area.
Intros base ops r w b ps.
pose proof H2 as Hfacts.
destruct Hfacts as [_ [_ Hstate]].
pose proof Hstate as Hrange. unfold CircularAreaLogicalState in Hrange.
Exists ops r w b ps base. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_3 : CircularAreaWriteNormal_entail_wit_3.
Proof.
pre_process. Intros.
unfold CircularAreaStateDataLengthResult in PreH2. subst retval.
assert (Hcast : unsigned_last_nbits (ca_capacity state_write_normal_spec - Zlength (ca_contents state_write_normal_spec)) 32 = ca_capacity state_write_normal_spec - Zlength (ca_contents state_write_normal_spec)) by (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hcast.
Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_4_1 : CircularAreaWriteNormal_entail_wit_4_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_normal_spec) in *.
set (L := Zlength (ca_contents state_write_normal_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32_wrap__normal_preparation; lia).
try rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < (C - L) <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits ((C - L)-(C-writeidx)) 32 = (C - L)-(C-writeidx)) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_normal_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left.
  Exists operations_2 readidx_2 b_status_2 (C - L) data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx ((C - L)-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) (C - L) input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
- Right.
  Exists operations_2 b_status_2 readidx_2 (C - L) data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx ((C - L)-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) (C - L) input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_4_2 : CircularAreaWriteNormal_entail_wit_4_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_normal_spec) in *.
set (L := Zlength (ca_contents state_write_normal_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32_wrap__normal_preparation; lia).
try rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = data_length_pre-(C-writeidx)) by
  (apply circular_u32_wrap__normal_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_normal_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Right.
  Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
- Right.
  Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_5_1 : CircularAreaWriteNormal_entail_wit_5_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_normal_spec) in *.
set (L := Zlength (ca_contents state_write_normal_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32_wrap__normal_preparation; lia).
try rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < (C - L) <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_normal_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Right. 
Exists operations_2 readidx_2 b_status_2 (C - L) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx (C - L) physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 (C - L) input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. 
Exists operations_2 b_status_2 readidx_2 (C - L) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx (C - L) physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 (C - L) input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_entail_wit_5_2 : CircularAreaWriteNormal_entail_wit_5_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_normal_spec) in *.
set (L := Zlength (ca_contents state_write_normal_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32_wrap__normal_preparation; lia).
try rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_normal_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Right. 
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Left. 
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_normal_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_1 : CircularAreaWriteNormal_return_wit_1.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
  rewrite PreH27 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_normal_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre 0 write_len_up write_len_down data_length_pre input_contents_write_normal_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  sep_apply_l_atomic Hjoin.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_normal_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length input_contents_write_normal_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_normal_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_normal_spec data_length_pre input_contents_write_normal_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length) mod ca_capacity state_write_normal_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_normal_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_normal_spec) (off:=0) (a:=data_length)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH14.
    - exact PreH15.
    - exact PreH17.
    - exact (eq_sym PreH18).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_normal_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_normal_spec-writeidx+write_len_down))
      with (ca_capacity state_write_normal_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  rewrite PreH28.
  rewrite PreH19.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_normal_spec - writeidx)) with (ca_capacity state_write_normal_spec) by lia.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec
      PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
  - dump_pre_spatial. rewrite PreH25 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH14 PreH15 PreH17 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_2 : CircularAreaWriteNormal_return_wit_2.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
  rewrite PreH27 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_normal_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_normal_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH18 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_normal_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_normal_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_normal_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_normal_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_normal_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_normal_spec data_length_pre input_contents_write_normal_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length_pre) mod ca_capacity state_write_normal_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_normal_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_normal_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH14.
    - exact PreH15.
    - exact PreH17.
    - exact (eq_sym PreH18).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_normal_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_normal_spec-writeidx+write_len_down))
      with (ca_capacity state_write_normal_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  rewrite PreH28.
  rewrite PreH19.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_normal_spec - writeidx)) with (ca_capacity state_write_normal_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH19; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec
      PreH15 PreH18).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> write_len_down).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx write_len_down physical_after PreH14 PreH16 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec))).
    all: entailer!.
  - dump_pre_spatial. rewrite PreH25 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH14 PreH15 PreH17 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_3 : CircularAreaWriteNormal_return_wit_3.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
  rewrite PreH27 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_normal_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre 0 write_len_up write_len_down data_length_pre input_contents_write_normal_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  sep_apply_l_atomic Hjoin.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_normal_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length input_contents_write_normal_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_normal_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_normal_spec data_length_pre input_contents_write_normal_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length) mod ca_capacity state_write_normal_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_normal_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_normal_spec) (off:=0) (a:=data_length)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH14.
    - exact PreH15.
    - exact PreH17.
    - exact (eq_sym PreH18).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_normal_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_normal_spec-writeidx+write_len_down))
      with (ca_capacity state_write_normal_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  rewrite PreH28.
  rewrite PreH19.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_normal_spec - writeidx)) with (ca_capacity state_write_normal_spec) by lia.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec
      PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
  - dump_pre_spatial. rewrite PreH25 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH14 PreH15 PreH17 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_4 : CircularAreaWriteNormal_return_wit_4.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
  rewrite PreH27 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_normal_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_normal_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_normal_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH18 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_normal_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_normal_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_normal_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_normal_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_normal_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_normal_spec data_length_pre input_contents_write_normal_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length_pre) mod ca_capacity state_write_normal_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_normal_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_normal_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH14.
    - exact PreH15.
    - exact PreH17.
    - exact (eq_sym PreH18).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_normal_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_normal_spec-writeidx+write_len_down))
      with (ca_capacity state_write_normal_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  rewrite PreH28.
  rewrite PreH19.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_normal_spec - writeidx)) with (ca_capacity state_write_normal_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH19; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec
      PreH15 PreH18).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> write_len_down).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx write_len_down physical_after PreH14 PreH16 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_normal_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_normal_spec))).
    all: entailer!.
  - dump_pre_spatial. rewrite PreH25 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH14 PreH15 PreH17 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_5 : CircularAreaWriteNormal_return_wit_5.
Proof.
pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
assert (Ha : 0<data_length_pre) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length_pre data_length_pre input_contents_write_normal_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length_pre (ca_capacity state_write_normal_spec) physical (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec)
  (ca_capacity state_write_normal_spec) writeidx data_length_pre Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length_pre (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) = sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_normal_spec readidx writeidx b_status physical input_contents_write_normal_spec input_offset data_length_pre readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_normal_spec) physical)
  Hstate Hbytes PreH10 PreH11 PreH13 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_normal_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_normal_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
- dump_pre_spatial. rewrite PreH21 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH10 PreH11 PreH13 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_6 : CircularAreaWriteNormal_return_wit_6.
Proof.
pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_normal_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_normal_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec)
  (ca_capacity state_write_normal_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) = sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_normal_spec readidx writeidx b_status physical input_contents_write_normal_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_normal_spec) physical)
  Hstate Hbytes PreH10 PreH11 PreH13 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_normal_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_normal_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
- dump_pre_spatial. rewrite PreH21 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH10 PreH11 PreH13 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_7 : CircularAreaWriteNormal_return_wit_7.
Proof.
pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
assert (Ha : 0<data_length_pre) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length_pre data_length_pre input_contents_write_normal_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length_pre (ca_capacity state_write_normal_spec) physical (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec)
  (ca_capacity state_write_normal_spec) writeidx data_length_pre Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length_pre (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) = sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_normal_spec readidx writeidx b_status physical input_contents_write_normal_spec input_offset data_length_pre readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_normal_spec) physical)
  Hstate Hbytes PreH10 PreH11 PreH13 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_normal_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_normal_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_normal_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
- dump_pre_spatial. rewrite PreH21 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH10 PreH11 PreH13 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_8 : CircularAreaWriteNormal_return_wit_8.
Proof.
pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_normal_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_normal_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_normal_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_normal_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_normal_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec)
  (ca_capacity state_write_normal_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) = sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_normal_spec readidx writeidx b_status physical input_contents_write_normal_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_normal_spec) physical)
  Hstate Hbytes PreH10 PreH11 PreH13 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_normal_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_normal_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_normal_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_normal_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_normal_spec).
- dump_pre_spatial. rewrite PreH21 in Hresult. exact (result_bridge__normal_returns state_write_normal_spec data_length_pre input_contents_write_normal_spec circular_area_pre input_buffer_pre 0 state_after PreH10 PreH11 PreH13 Hresult).
Qed. 

Lemma proof_of_CircularAreaWriteNormal_return_wit_9 : CircularAreaWriteNormal_return_wit_9.
Proof.
pre_process.
Exists state_write_normal_spec.
split_pure_spatial.
- sep_apply_r_atomic (circular_area_descriptor_owned__state_queries_errors state_write_normal_spec circular_area_pre PreH9).
  sep_apply_r_atomic (circular_area_input_owned__state_queries_errors input_buffer_pre data_length_pre input_contents_write_normal_spec PreH10 PreH14).
  unfold store_circular_area.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
- dump_pre_spatial. unfold CircularAreaWriteNormalResult. left. repeat split; auto; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_2_pure : CircularAreaWriteNormal_partial_solve_wit_2_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_3_pure : CircularAreaWriteNormal_partial_solve_wit_3_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_4_pure : CircularAreaWriteNormal_partial_solve_wit_4_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_5_pure : CircularAreaWriteNormal_partial_solve_wit_5_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_6_pure : CircularAreaWriteNormal_partial_solve_wit_6_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_7_pure : CircularAreaWriteNormal_partial_solve_wit_7_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_8_pure : CircularAreaWriteNormal_partial_solve_wit_8_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_9_pure : CircularAreaWriteNormal_partial_solve_wit_9_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_10_pure : CircularAreaWriteNormal_partial_solve_wit_10_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteNormal_partial_solve_wit_11_pure : CircularAreaWriteNormal_partial_solve_wit_11_pure.
Proof.
  pre_process.
  match goal with
  | H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
      unfold CircularAreaLogicalState in H;
      destruct H as [_ [_ [_ [_ [Hphysical _]]]]]
  end.
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_1 : CircularAreaWriteForce_entail_wit_1.
Proof.
pre_process. unfold CircularAreaWriteForceParameters in PreH1. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_2 : CircularAreaWriteForce_entail_wit_2.
Proof.
pre_process. unfold CircularAreaWriteInput.
Intros.
repeat Split; Intros; try solve [entailer!].
unfold store_circular_area.
Intros base ops r w b ps.
pose proof H2 as Hfacts.
destruct Hfacts as [_ [_ Hstate]].
pose proof Hstate as Hrange. unfold CircularAreaLogicalState in Hrange.
Exists ops r w b ps base. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_3 : CircularAreaWriteForce_entail_wit_3.
Proof.
pre_process. Intros.
unfold CircularAreaStateDataLengthResult in PreH2. subst retval.
assert (Hcast : unsigned_last_nbits (ca_capacity state_write_force_spec - Zlength (ca_contents state_write_force_spec)) 32 = ca_capacity state_write_force_spec - Zlength (ca_contents state_write_force_spec)).
{ apply unsigned_last_nbits_eq. change (0 <= ca_capacity state_write_force_spec - Zlength (ca_contents state_write_force_spec) < 4294967296). lia. }
rewrite Hcast.
Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_1 : CircularAreaWriteForce_entail_wit_4_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = (C-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Right.
Exists operations_2 (Z.rem (readidx_2 + C - (C-L)) C) 0 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_2 : CircularAreaWriteForce_entail_wit_4_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = (data_length_pre-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left.
Exists operations_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) 0 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_3 : CircularAreaWriteForce_entail_wit_4_3.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = (C-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Right.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + C - (C-L)) C) data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_4 : CircularAreaWriteForce_entail_wit_4_4.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = (data_length_pre-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Right.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_5 : CircularAreaWriteForce_entail_wit_4_5.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = (C-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_force_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Right.
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
- Right.
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_4_6 : CircularAreaWriteForce_entail_wit_4_6.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = (C-writeidx)) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = (data_length_pre-(C-writeidx))) by
 (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_force_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Left.
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
- Left. Right.
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_1 : CircularAreaWriteForce_entail_wit_5_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Right.
Exists operations_2 (Z.rem (readidx_2 + C - (C-L)) C) 0 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_2 : CircularAreaWriteForce_entail_wit_5_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Right.
Exists operations_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) 0 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_3 : CircularAreaWriteForce_entail_wit_5_3.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + C - (C-L)) C) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_4 : CircularAreaWriteForce_entail_wit_5_4.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH18 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Right.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_5 : CircularAreaWriteForce_entail_wit_5_5.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_force_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Right.
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Left.
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_entail_wit_5_6 : CircularAreaWriteForce_entail_wit_5_6.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_force_spec) in *.
set (L := Zlength (ca_contents state_write_force_spec)) in *.
pose proof PreH17 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
subst input_offset.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_force_spec) physical_2 PreH17 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Right.
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Right.
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_force_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_1 : CircularAreaWriteForce_return_wit_1.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - right. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_2 : CircularAreaWriteForce_return_wit_2.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - left. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_3 : CircularAreaWriteForce_return_wit_3.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - right. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_4 : CircularAreaWriteForce_return_wit_4.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - left. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_5 : CircularAreaWriteForce_return_wit_5.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - right. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_6 : CircularAreaWriteForce_return_wit_6.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - left. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_7 : CircularAreaWriteForce_return_wit_7.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - right. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_8 : CircularAreaWriteForce_return_wit_8.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH9. rewrite ?Z.mul_1_r in PreH9. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH13. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH20; lia).
  rewrite Htotal.
  repeat rewrite Z.mul_1_r in *.
  replace (input_offset+(write_len_up+write_len_down)) with (input_offset+write_len_up+write_len_down) by lia.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
  sep_apply_l_atomic (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_force_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH18)).
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH19; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_force_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_force_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_force_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia.
    repeat rewrite Z.add_0_l.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace (data_length+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_force_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  try rewrite Z.rem_mod_nonneg in PreH31 by lia.
  assert (Hnew : CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
    (ca_capacity state_write_force_spec) 1
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec)) physical_after).
  { eapply force_after__wrap_returns with (r:=readidx) (b:=b_status) (phys:=physical) (off:=input_offset) (a:=data_length).
    - exact Hstate.
    - exact Hbytes.
    - lia.
    - exact Hoff.
    - lia.
    - auto.
    - left. split; [lia|exact PreH31].
    - exact Hpw. }
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_force_spec = write_len_down).
  { rewrite Htotal, PreH19. replace (writeidx+(ca_capacity state_write_force_spec-writeidx+write_len_down))
      with (ca_capacity state_write_force_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  rewrite Hidx in Hnew.
  set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
    (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec++input_contents_write_force_spec))).
  Exists state_after.
  split_pure_spatial.
  - rewrite PreH19.
    replace (writeidx+(ca_capacity state_write_force_spec-writeidx)) with (ca_capacity state_write_force_spec) by lia.
    change (CircularAreaLogicalState readidx_mid write_len_down (ca_capacity state_after) 1 (ca_contents state_after) physical_after) in Hnew.
    assert (Hcap : ca_capacity state_after=ca_capacity state_write_force_spec) by reflexivity.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid write_len_down physical_after PreH14 PreH16 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH15 PreH18).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
  - dump_pre_spatial. unfold CircularAreaWriteForceResult, state_after. auto.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_9 : CircularAreaWriteForce_return_wit_9.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_10 : CircularAreaWriteForce_return_wit_10.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_11 : CircularAreaWriteForce_return_wit_11.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_12 : CircularAreaWriteForce_return_wit_12.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_13 : CircularAreaWriteForce_return_wit_13.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_14 : CircularAreaWriteForce_return_wit_14.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_15 : CircularAreaWriteForce_return_wit_15.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_return_wit_16 : CircularAreaWriteForce_return_wit_16.
Proof.

pre_process.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in PreH8.
destruct PreH8 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH27 by lia.
unfold CircularAreaWriteDestination in PreH9. subst dest_ptr. subst retval.
cbn in PreH18. rewrite ?Z.mul_1_r in PreH18. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_force_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_force_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_force_spec Hoff ltac:(lia) PreH19 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_force_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_force_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ltac:(lia) ltac:(lia) PreH15).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_force_spec)
  (ca_capacity state_write_force_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH15 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) = sublist input_offset (input_offset+data_length) input_contents_write_force_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (force_after__nowrap_returns readidx writeidx (ca_capacity state_write_force_spec) b_status
  (ca_contents state_write_force_spec) physical input_contents_write_force_spec input_offset data_length readidx_mid
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  Hstate Hbytes ltac:(lia) Hoff ltac:(lia) ltac:(intuition lia) ltac:(intuition lia) Hphysical) as Hlogical.
set (state_after := Build_circular_area_state (ca_capacity state_write_force_spec)
  (CircularAreaLastCapacity (ca_capacity state_write_force_spec) (ca_contents state_write_force_spec ++ input_contents_write_force_spec))).
assert (Hcap : ca_capacity state_after = ca_capacity state_write_force_spec) by reflexivity.
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_force_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_force_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_force_spec) physical)
  PreH10 PreH12 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_force_spec PreH11 PreH14).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_force_spec).
- dump_pre_spatial. unfold CircularAreaWriteForceResult. split; reflexivity.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_2_pure : CircularAreaWriteForce_partial_solve_wit_2_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_3_pure : CircularAreaWriteForce_partial_solve_wit_3_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_4_pure : CircularAreaWriteForce_partial_solve_wit_4_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_5_pure : CircularAreaWriteForce_partial_solve_wit_5_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_6_pure : CircularAreaWriteForce_partial_solve_wit_6_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_7_pure : CircularAreaWriteForce_partial_solve_wit_7_pure.
Proof.
pre_process. unfold CircularAreaLogicalState in *. entailer!.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_8_pure : CircularAreaWriteForce_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_9_pure : CircularAreaWriteForce_partial_solve_wit_9_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_10_pure : CircularAreaWriteForce_partial_solve_wit_10_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_11_pure : CircularAreaWriteForce_partial_solve_wit_11_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_12_pure : CircularAreaWriteForce_partial_solve_wit_12_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_13_pure : CircularAreaWriteForce_partial_solve_wit_13_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_14_pure : CircularAreaWriteForce_partial_solve_wit_14_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_15_pure : CircularAreaWriteForce_partial_solve_wit_15_pure.
Proof.
  aggressive_pre_process;
  unfold CircularAreaLogicalState in PreH24;
  destruct PreH24 as (_ & _ & _ & _ & Hphysical & _);
  split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_16_pure : CircularAreaWriteForce_partial_solve_wit_16_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_17_pure : CircularAreaWriteForce_partial_solve_wit_17_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_18_pure : CircularAreaWriteForce_partial_solve_wit_18_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_19_pure : CircularAreaWriteForce_partial_solve_wit_19_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_20_pure : CircularAreaWriteForce_partial_solve_wit_20_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_21_pure : CircularAreaWriteForce_partial_solve_wit_21_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_22_pure : CircularAreaWriteForce_partial_solve_wit_22_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWriteForce_partial_solve_wit_23_pure : CircularAreaWriteForce_partial_solve_wit_23_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial; rewrite Zlength_sublist by lia; lia.
Qed. 

