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
From SimpleC.EE.INPUT.xizi.xizi_circular_area_write Require Import xizi_circular_area_write_goal.
From SimpleC.EE.INPUT.xizi.xizi_circular_area_write Require Import xizi_circular_area_write_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_common.rocq Require Import xizi_circular_area_lib.
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

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
pre_process.
Intros.
unfold CircularAreaLogicalState in *.
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

Lemma proof_of_CircularAreaWrite_safety_wit_21 : CircularAreaWrite_safety_wit_21.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_safety_wit_22 : CircularAreaWrite_safety_wit_22.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_safety_wit_27 : CircularAreaWrite_safety_wit_27.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_safety_wit_28 : CircularAreaWrite_safety_wit_28.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_1 : CircularAreaWrite_entail_wit_1.
Proof.
pre_process. unfold CircularAreaWriteInput.
Intros_p Hbounds.
repeat Split; Intros; try solve [entailer!].
unfold store_circular_area.
Intros base ops r w b ps.
Exists ops r w b ps base. entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_1 : CircularAreaWrite_entail_wit_2_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < (C - L) <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits ((C - L)-(C-writeidx)) 32 = (C - L)-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Left.
  Exists operations_2 readidx_2 b_status_2 (C - L) data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx ((C - L)-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) (C - L) input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
- Left. Right.
  Exists operations_2 b_status_2 readidx_2 (C - L) data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx ((C - L)-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) (C - L) input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_2 : CircularAreaWrite_entail_wit_2_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = data_length_pre-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Right.
  Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
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
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_3 : CircularAreaWrite_entail_wit_2_3.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < C <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = C-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left. Left. Left. Right.
Exists operations_2 (Z.rem (readidx_2 + C - (C-L)) C) 0 C data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_4 : CircularAreaWrite_entail_wit_2_4.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = data_length_pre-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left. Left. Left. Left. Left.
Exists operations_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) 0 data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_5 : CircularAreaWrite_entail_wit_2_5.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < C <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = C-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Right.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + C - (C-L)) C) C data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_6 : CircularAreaWrite_entail_wit_2_6.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = data_length_pre-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
rewrite (circular_read_update__wrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left. Right.
Exists operations_2 b_status_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) data_buffer readidx_2 b_status_2 physical_2 writeidx.
sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_7 : CircularAreaWrite_entail_wit_2_7.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < C <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (C-(C-writeidx)) 32 = C-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Left. Left. Right.
  Exists operations_2 readidx_2 b_status_2 C data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
- Right.
  Exists operations_2 b_status_2 readidx_2 C data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (C-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) (C-writeidx) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_2_8 : CircularAreaWrite_entail_wit_2_8.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hbad Hzero]|[Hwrap Hone]]; [exfalso; congruence|].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hwcast : unsigned_last_nbits writeidx 32 = writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hwcast in *.
assert (Hupcast : unsigned_last_nbits (C-writeidx) 32 = C-writeidx) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hupcast in *.
assert (Hdowncast : unsigned_last_nbits (data_length_pre-(C-writeidx)) 32 = data_length_pre-(C-writeidx)) by
  (apply circular_u32__wrap_preparation; lia).
rewrite Hdowncast in *.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__wrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Left. Left. Left. Left. Right.
  Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
- Left. Left. Right.
  Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 b_status_2 physical_2 writeidx.
  sep_apply_l_atomic (circular_physical_split__wrap_preparation data_buffer C writeidx (data_length_pre-(C-writeidx)) physical_2 ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__wrap_preparation input_buffer_pre data_length_pre 0 (C-writeidx) data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
  repeat rewrite Z.mul_1_r.
  repeat rewrite Z.add_0_r.
  repeat rewrite Z.add_0_l.
  entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < (C - L) <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__nowrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Right. 
Exists operations_2 readidx_2 b_status_2 (C - L) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx (C - L) physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 (C - L) input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Right. 
Exists operations_2 b_status_2 readidx_2 (C - L) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx (C - L) physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 (C - L) input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__nowrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Right. 
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
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
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_3 : CircularAreaWrite_entail_wit_3_3.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < C <= C) by lia.
rewrite (circular_read_update__nowrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Right. 
Exists operations_2 (Z.rem (readidx_2 + C - (C-L)) C) 0 C data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_4 : CircularAreaWrite_entail_wit_3_4.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < data_length_pre <= C) by lia.
rewrite (circular_read_update__nowrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Right. 
Exists operations_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) 0 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_5 : CircularAreaWrite_entail_wit_3_5.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < C <= C) by lia.
rewrite (circular_read_update__nowrap_preparation readidx_2 C (C-L) C Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left. Left. Left. Left. Right. 
Exists operations_2 b_status_2 (Z.rem (readidx_2 + C - (C-L)) C) C data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_6 : CircularAreaWrite_entail_wit_3_6.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH8 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH7. fold L in PreH7. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < data_length_pre <= C) by lia.
rewrite (circular_read_update__nowrap_preparation readidx_2 C (C-L) data_length_pre Hcap Hr ltac:(lia) ltac:(lia)) in *.
Left. Left. Left. Left. Right. 
Exists operations_2 b_status_2 (Z.rem (readidx_2 + data_length_pre - (C-L)) C) data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_7 : CircularAreaWrite_entail_wit_3_7.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < C <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__nowrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Left. Left. Right. 
Exists operations_2 readidx_2 b_status_2 C data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Left. Left. Left. Left. Left. 
Exists operations_2 b_status_2 readidx_2 C data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx C physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre (data_length_pre-C) C input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_entail_wit_3_8 : CircularAreaWrite_entail_wit_3_8.
Proof.
pre_process. Intros.
set (C := ca_capacity state_write_spec) in *.
set (L := Zlength (ca_contents state_write_spec)) in *.
pose proof PreH7 as Hstate.
unfold CircularAreaLogicalState in Hstate.
fold C L in Hstate.
destruct Hstate as [Hcap [Hr [Hw [Hl [Hphysical Hrest]]]]].
unfold CircularAreaStateDataLengthResult in PreH6. fold L in PreH6. subst retval.
subst input_offset.
assert (Hfreecast : unsigned_last_nbits (C-L) 32 = C-L) by
  (apply circular_u32__nowrap_preparation; lia).
rewrite Hfreecast in *.
unfold CircularAreaDivideWrDataResult in PreH1.
destruct PreH1 as [[Hnowrap Hzero]|[Hbad Hone]]; [|exfalso; congruence].
assert (Ha : 0 < data_length_pre <= C) by lia.
assert (Hshort : L < C) by lia.
pose proof (circular_nonfull_status__nowrap_preparation readidx_2 writeidx C b_status_2 (ca_contents state_write_spec) physical_2 PreH7 Hshort) as Hcases.
destruct Hcases as [Hbzero|Hneq].
- Left. Right. 
Exists operations_2 readidx_2 b_status_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
- Left. Left. Left. Left. Left. Right. 
Exists operations_2 b_status_2 readidx_2 data_buffer readidx_2 writeidx b_status_2 physical_2.
sep_apply_l_atomic (circular_physical_split__nowrap_preparation data_buffer C writeidx data_length_pre physical_2 ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (circular_input_split__nowrap_preparation input_buffer_pre data_length_pre 0 data_length_pre input_contents_write_spec ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply_l_atomic (store_uint_undef_store_uint (&("free_len")) (C-L)).
unfold CircularAreaWriteDestination.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
repeat rewrite Z.mul_1_r.
repeat rewrite Z.add_0_r.
repeat rewrite Z.add_0_l.
repeat rewrite Zlength_sublist by lia.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH21 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre 0 write_len_up write_len_down data_length_pre input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH12)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  sep_apply_l_atomic Hjoin.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  rewrite <- Hpa.
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH22.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    sep_apply (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew).
    sep_apply (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
  - dump_pre_spatial. exact Hresult.
Qed.
Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH21 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH22.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  pre_process.
  rewrite PreH23 in PreH20.
  assert (Hsame : data_length = data_length_pre) by lia.
  subst data_length.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH23 in *.
  rewrite Z.rem_mod_nonneg in PreH25 by lia.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [lia|].
      split; [lia|].
      split; [exact PreH22|].
      split; [left; reflexivity|].
      right. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  pre_process.
  rewrite PreH23 in PreH20.
  assert (Hsame : data_length = data_length_pre) by lia.
  subst data_length.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH23 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [lia|].
      split; [lia|].
      split; [exact PreH22|].
      split; [left; reflexivity|].
      left. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH14; lia).
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH12)) as Hjoin.
  rewrite Htotal.
  repeat rewrite Z.add_assoc.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia. rewrite Htotal.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace ((write_len_up+write_len_down)+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    replace (0+input_offset) with input_offset by lia.
    reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  rewrite Z.rem_mod_nonneg in PreH25 by lia.
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=input_offset) (a:=data_length)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [exact PreH20|].
      split; [exact PreH21|].
      split; [exact PreH22|].
      split; [right; exact PreH23|].
      right. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    entailer!.
  - dump_pre_spatial. exact Hresult.

Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH14; lia).
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (input_offset+write_len_up+write_len_down) data_length_pre
    (sublist (input_offset+write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset+write_len_up) 0 write_len_down
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+input_offset) 0 write_len_up
    (sublist input_offset (input_offset+write_len_up) input_contents_write_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre input_offset write_len_up write_len_down data_length_pre input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH12)) as Hjoin.
  rewrite Htotal.
  repeat rewrite Z.add_assoc.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist input_offset (input_offset+write_len_up) input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist input_offset (input_offset+data_length) input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist (input_offset+write_len_up) (input_offset+write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist input_offset (input_offset+write_len_up) input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist by lia. rewrite Htotal.
    replace (write_len_up+input_offset) with (input_offset+write_len_up) by lia.
    replace ((write_len_up+write_len_down)+input_offset) with (input_offset+write_len_up+write_len_down) by lia.
    replace (0+input_offset) with input_offset by lia.
    reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=input_offset) (a:=data_length)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [exact PreH20|].
      split; [exact PreH21|].
      split; [exact PreH22|].
      split; [right; exact PreH23|].
      left. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    entailer!.
  - dump_pre_spatial. exact Hresult.


Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH21 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length = write_len_up + write_len_down) by (rewrite PreH14; lia).
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up data_length input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up data_length input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join__wrap_returns input_buffer_pre 0 write_len_up write_len_down data_length_pre input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia) (eq_sym PreH12)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite <- Htotal in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up data_length input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia; reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - left. split; [exact PreH19|].
      split; [exact PreH20|].
      split; [reflexivity|].
      split; [reflexivity|].
      split; [lia|].
      split; [exact PreH25|].
      split; [exact PreH26|].
      right; exact PreH27.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH22.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_8 : CircularAreaWrite_return_wit_8.
Proof.
  pre_process.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH21 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - left. repeat split; try assumption; try lia.
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH22.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_9 : CircularAreaWrite_return_wit_9.
Proof.
  pre_process.
  rewrite PreH23 in PreH20.
  assert (Hsame : data_length = data_length_pre) by lia.
  subst data_length.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH23 in *.
  rewrite Z.rem_mod_nonneg in PreH25 by lia.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [lia|].
      split; [lia|].
      split; [exact PreH22|].
      split; [left; reflexivity|].
      right. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_10 : CircularAreaWrite_return_wit_10.
Proof.
  pre_process.
  rewrite PreH23 in PreH20.
  assert (Hsame : data_length = data_length_pre) by lia.
  subst data_length.
  pose proof PreH6 as Hstate.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
  cbn in PreH3. rewrite ?Z.mul_1_r in PreH3. subst input_buffer.
  unfold CircularAreaWriteDestination in PreH7. subst dest_ptr. subst retval.
  prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
  Intros_p Hofflen.
  assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
  rewrite PreH23 in *.
  rewrite sizeof_uchar in *.
  assert (Htotal : data_length_pre = write_len_up + write_len_down) by (rewrite PreH14; lia).
  rewrite Htotal.
  repeat rewrite Z.add_0_l in *.
  repeat rewrite Z.add_0_r in *.
  repeat rewrite Z.mul_1_r in *.
  sepcon_lift (UCharArray.seg input_buffer_pre (write_len_up+write_len_down) data_length_pre
    (sublist (write_len_up+write_len_down) data_length_pre input_contents_write_spec)).
  sepcon_lift (UCharArray.seg (input_buffer_pre+write_len_up) 0 write_len_down
    (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 write_len_up
    (sublist 0 write_len_up input_contents_write_spec)).
  sepcon_lift (UCharArray.seg input_buffer_pre 0 0 (sublist 0 0 input_contents_write_spec)).
  pose proof (wrap_source_join_prefix__wrap_returns input_buffer_pre 0 write_len_up write_len_down input_contents_write_spec
    Hoff ltac:(lia) ltac:(lia) ltac:(lia)) as Hjoin.
  repeat rewrite Z.add_0_l in Hjoin.
  repeat rewrite Z.add_0_r in Hjoin.
  rewrite PreH12 in Hjoin.
  sep_apply_l_atomic Hjoin.
  all: entailer!.
  replace (write_len_up+write_len_down) with data_length_pre by lia.
  sep_apply_l_atomic (UCharArray.seg_nil input_buffer_pre data_length_pre
    (sublist data_length_pre data_length_pre input_contents_write_spec)).
  all: entailer!.
  prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
  Intros_p Hbytes.
  assert (Hdown : 0 <= write_len_down <= writeidx) by lia.
  assert (Hup : 0 <= write_len_up) by lia.
  assert (Hend : writeidx+write_len_up <= 256) by (rewrite PreH13; lia).
  sep_apply (wrap_destination_join__wrap_returns data_buffer write_len_down writeidx write_len_up
    (sublist write_len_up data_length_pre input_contents_write_spec)
    (sublist write_len_down writeidx physical)
    (sublist 0 write_len_up input_contents_write_spec) Hdown Hup Hend).
  set (slice := sublist 0 data_length_pre input_contents_write_spec).
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length_pre slice) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up slice)).
  assert (Hpa : physical_after =
    CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec)).
  { unfold physical_after, slice. rewrite !Zsublist_Zsublist0 by lia. rewrite Htotal. reflexivity. }
  assert (Hpw : CircularAreaPhysicalWrite physical slice physical_after
      (ca_capacity state_write_spec) writeidx data_length_pre).
  { unfold physical_after, slice. eapply circular_area_physical_write_wrap__write_returns with
      (write_len_up:=write_len_up) (write_len_down:=write_len_down); try assumption; try lia;
      try (rewrite Zlength_sublist by lia; lia). }
  assert (Hres : exists state_after,
      CircularAreaWriteResult state_write_spec data_length_pre input_contents_write_spec b_force_pre
        circular_area_pre input_buffer_pre 0 state_after /\
      CircularAreaLogicalState readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
        (ca_capacity state_after) 1 (ca_contents state_after) physical_after /\
      ca_capacity state_after=ca_capacity state_write_spec).
  { eapply nowrap_result_state__wrap_returns with (r:=readidx) (w:=writeidx) (b:=b_status)
      (phys:=physical) (xs:=input_contents_write_spec) (off:=0) (a:=data_length_pre)
      (rm:=readidx_mid) (force:=b_force_pre) (n:=data_length_pre)
      (ca:=circular_area_pre) (src:=input_buffer_pre) (pa:=physical_after).
    - exact Hstate.
    - exact Hbytes.
    - exact PreH8.
    - exact PreH9.
    - exact PreH11.
    - exact (eq_sym PreH12).
    - lia.
    - right. split; [exact PreH19|].
      split; [lia|].
      split; [lia|].
      split; [exact PreH22|].
      split; [left; reflexivity|].
      left. split; [exact PreH24|exact PreH25].
    - exact Hpw.
  }
  destruct Hres as [state_after [Hresult [Hnew Hcap]]].
  assert (Hidx : (writeidx+data_length_pre) mod ca_capacity state_write_spec = write_len_down).
  { rewrite Htotal, PreH13. replace (writeidx+(ca_capacity state_write_spec-writeidx+write_len_down))
      with (ca_capacity state_write_spec+write_len_down) by lia.
    symmetry. apply Z.mod_unique with (q:=1); lia. }
  assert (Hcast : unsigned_last_nbits write_len_down 8 = (writeidx+data_length_pre) mod ca_capacity state_write_spec).
  { rewrite Hidx. apply unsigned_last_nbits_eq. change (0<=write_len_down<256). pose proof Hdown. lia. }
  rewrite <- Hcast in Hnew.
  rewrite PreH13.
  Exists state_after.
  split_pure_spatial.
  - replace (writeidx + (ca_capacity state_write_spec - writeidx)) with (ca_capacity state_write_spec) by lia.
    rewrite <- Hcap.
    assert (Hupcap : ca_capacity state_after - writeidx = write_len_up) by (rewrite Hcap, PreH13; lia).
    rewrite Hupcap.
    sep_apply_l_atomic (pack_input__wrap_returns input_buffer_pre data_length_pre input_contents_write_spec
      PreH9 PreH12).
    cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> operations).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "b_status") # Int |-> 1).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state_after).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_tail") # Ptr |-> (data_buffer + ca_capacity state_after)).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "writeidx") # UChar |-> unsigned_last_nbits write_len_down 8).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
    sepcon_lift (&(circular_area_pre # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
    pose proof (pack_descriptor__wrap_returns state_after circular_area_pre data_buffer operations
      readidx_mid (unsigned_last_nbits write_len_down 8) physical_after PreH8 PreH10 Hnew) as Hpack.
    sep_apply_r_atomic Hpack.
    all: entailer!.
    rewrite Hpa.
    rewrite Htotal.
    cancel (UCharArray.mixed_full data_buffer (ca_capacity state_after)
      (CircularAreaSomeBytes (sublist write_len_up (write_len_up+write_len_down) input_contents_write_spec) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input_contents_write_spec))).
    all: entailer!.
  - dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_11 : CircularAreaWrite_return_wit_11.
Proof.
  LLM_pre_process ltac:(int_auto).
  entailer!.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as (Hcap & Hrd & Hwd & Hlen & Hphys & Hbytes & Hindex & Hstat & Hfull & Hempty & Hlive).
  rewrite PreH23 in PreH25.
  replace (readidx + ca_capacity state_write_spec - (ca_capacity state_write_spec - Zlength (ca_contents state_write_spec))) with (readidx + Zlength (ca_contents state_write_spec)) in PreH25 by lia.
  rewrite Z.rem_mod_nonneg in PreH25 by lia.
  assert (Hmid : readidx_mid = writeidx) by (rewrite PreH25; symmetry; exact Hindex).
  contradiction.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_12 : CircularAreaWrite_return_wit_12.
Proof.
  LLM_pre_process ltac:(int_auto).
  entailer!.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as (Hcap & Hrd & Hwd & Hlen & Hphys & Hbytes & Hindex & Hstat & Hfull & Hempty & Hlive).
  rewrite PreH23 in PreH24.
  assert (Hlen0 : Zlength (ca_contents state_write_spec) = 0) by lia.
  assert (Heq : readidx = writeidx) by (apply (proj2 Hempty); exact Hlen0).
  rewrite PreH25 in PreH18.
  subst readidx_mid.
  contradiction.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_13 : CircularAreaWrite_return_wit_13.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH2.
  destruct PreH2 as [Hc [Hr [Hw [Hl [Hp [Hb [Hi Hrest]]]]]]].
  assert (Hz : Zlength (ca_contents state_write_spec)=0) by lia.
  rewrite Hz, Z.add_0_r, Z.mod_small in Hi by lia.
  exfalso. lia.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_14 : CircularAreaWrite_return_wit_14.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH2.
  destruct PreH2 as [Hc [Hr [Hw [Hl [Hp [Hb [Hi Hrest]]]]]]].
  assert (Heq : readidx+data_length-(ca_capacity state_write_spec-Zlength (ca_contents state_write_spec)) = readidx+Zlength (ca_contents state_write_spec)) by lia.
  rewrite Heq in PreH21. rewrite Z.rem_mod_nonneg in PreH21 by lia. exfalso. congruence.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_15 : CircularAreaWrite_return_wit_15.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_16 : CircularAreaWrite_return_wit_16.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_17 : CircularAreaWrite_return_wit_17.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length_pre) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length_pre data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length_pre (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length_pre Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length_pre (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) = sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length_pre readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_18 : CircularAreaWrite_return_wit_18.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_19 : CircularAreaWrite_return_wit_19.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_20 : CircularAreaWrite_return_wit_20.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_21 : CircularAreaWrite_return_wit_21.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_22 : CircularAreaWrite_return_wit_22.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_23 : CircularAreaWrite_return_wit_23.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length_pre) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length_pre data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length_pre (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length_pre Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length_pre (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) = sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length_pre readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length_pre) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length_pre) input_contents_write_spec) ++ sublist (writeidx+data_length_pre) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_24 : CircularAreaWrite_return_wit_24.
Proof.
pre_process.
pose proof PreH2 as Hstate.
unfold CircularAreaLogicalState in PreH2.
destruct PreH2 as [Hc [Hr [Hw [Hl [Hp Hrest]]]]].
try rewrite Z.rem_mod_nonneg in PreH21 by lia.
unfold CircularAreaWriteDestination in PreH3. subst dest_ptr. subst retval.
cbn in PreH12. rewrite ?Z.mul_1_r in PreH12. subst input_buffer.
prop_apply (UCharArray.seg_Zlength input_buffer_pre 0 input_offset (sublist 0 input_offset input_contents_write_spec)).
Intros_p Hofflen.
assert (Hoff : 0<=input_offset) by (pose proof (Zlength_nonneg (sublist 0 input_offset input_contents_write_spec)); lia).
assert (Ha : 0<data_length) by lia.
sep_apply (source_join__nowrap_returns input_buffer_pre input_offset data_length data_length_pre input_contents_write_spec Hoff ltac:(lia) PreH13 ltac:(lia)).
prop_apply (circular_area_uchar_full_forall__write_returns input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbytes.
sep_apply (destination_join__nowrap_returns data_buffer writeidx data_length (ca_capacity state_write_spec) physical (sublist input_offset (input_offset+data_length) input_contents_write_spec) ltac:(lia) ltac:(lia) PreH9).
pose proof (circular_area_physical_write_nowrap__write_returns physical
  (sublist input_offset (input_offset+data_length) input_contents_write_spec)
  (ca_capacity state_write_spec) writeidx data_length Hp ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) PreH9 ltac:(lia)) as Hphysical.
assert (Hcopyself : sublist 0 data_length (sublist input_offset (input_offset+data_length) input_contents_write_spec) = sublist input_offset (input_offset+data_length) input_contents_write_spec) by (apply sublist_self; lia).
rewrite Hcopyself in Hphysical.
pose proof (nowrap_result_state__nowrap_returns state_write_spec readidx writeidx b_status physical input_contents_write_spec input_offset data_length readidx_mid b_force_pre data_length_pre circular_area_pre input_buffer_pre
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  Hstate Hbytes PreH4 PreH5 PreH7 ltac:(lia) Hoff ltac:(intuition lia) Hphysical) as Hafter.
destruct Hafter as [state_after [Hresult [Hlogical Hcap]]].
rewrite index_cast__nowrap_returns by lia.
pose proof (pack_descriptor__nowrap_returns state_after circular_area_pre data_buffer operations readidx_mid ((writeidx+data_length) mod ca_capacity state_write_spec)
  (sublist 0 writeidx physical ++ CircularAreaSomeBytes (sublist input_offset (input_offset+data_length) input_contents_write_spec) ++ sublist (writeidx+data_length) (ca_capacity state_write_spec) physical)
  PreH4 PreH6 Hlogical) as Hpack.
rewrite Hcap in Hpack.
sep_apply Hpack.
sep_apply (pack_input__nowrap_returns input_buffer_pre data_length_pre input_contents_write_spec PreH5 PreH8).
Exists state_after.
split_pure_spatial.
- cancel (CircularAreaDescriptorOwnership state_after circular_area_pre).
  cancel (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
- dump_pre_spatial. exact Hresult.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_25 : CircularAreaWrite_return_wit_25.
Proof.
pre_process.
Exists state_write_spec.
assert (Hfull : Zlength (ca_contents state_write_spec) = ca_capacity state_write_spec).
{ unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hstate. unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [_ [Hlen _]]]].
  rewrite unsigned_last_nbits_eq in PreH1.
  - lia.
  - change (0 <= ca_capacity state_write_spec - retval < 4294967296). lia. }
split_pure_spatial.
- sep_apply_r_atomic (circular_area_descriptor_owned__state_queries_errors state_write_spec circular_area_pre PreH6).
  sep_apply_r_atomic (circular_area_input_owned__state_queries_errors input_buffer_pre data_length_pre input_contents_write_spec PreH7 PreH11).
  unfold store_circular_area.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
- dump_pre_spatial. unfold CircularAreaWriteResult. right. left. repeat split; auto.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_26 : CircularAreaWrite_return_wit_26.
Proof.
pre_process.
Exists state_write_spec.
unfold CircularAreaWriteInput.
fold (CircularAreaDescriptorOwnership state_write_spec circular_area_pre).
fold (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbounds.
split_pure_spatial.
- entailer!.
- dump_pre_spatial. unfold CircularAreaWriteResult. left. repeat split; auto; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_27 : CircularAreaWrite_return_wit_27.
Proof.
pre_process.
Exists state_write_spec.
unfold CircularAreaWriteInput.
fold (CircularAreaDescriptorOwnership state_write_spec circular_area_pre).
fold (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbounds.
split_pure_spatial.
- entailer!.
- dump_pre_spatial. unfold CircularAreaWriteResult. left. repeat split; auto; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_return_wit_28 : CircularAreaWrite_return_wit_28.
Proof.
pre_process.
Exists state_write_spec.
unfold CircularAreaWriteInput.
fold (CircularAreaDescriptorOwnership state_write_spec circular_area_pre).
fold (CircularAreaInputOwnership input_buffer_pre data_length_pre input_contents_write_spec).
Intros_p Hbounds.
split_pure_spatial.
- entailer!.
- dump_pre_spatial. unfold CircularAreaWriteResult. left. repeat split; auto; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_2_pure : CircularAreaWrite_partial_solve_wit_2_pure.
Proof.
pre_process.
unfold CircularAreaLogicalState in PreH6.
destruct PreH6 as [Hcap [Hr [Hw [Hlen Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH5.
assert (Hcast : unsigned_last_nbits (ca_capacity state_write_spec - retval) 32 =
  ca_capacity state_write_spec - retval).
{ apply unsigned_last_nbits_eq.
  change (0 <= ca_capacity state_write_spec - retval < 4294967296).
  lia. }
rewrite Hcast in *.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
pre_process.
unfold CircularAreaLogicalState in PreH6.
destruct PreH6 as [Hcap [Hr [Hw [Hlen Hrest]]]].
unfold CircularAreaStateDataLengthResult in PreH5.
assert (Hcast : unsigned_last_nbits (ca_capacity state_write_spec - retval) 32 =
  ca_capacity state_write_spec - retval).
{ apply unsigned_last_nbits_eq.
  change (0 <= ca_capacity state_write_spec - retval < 4294967296).
  lia. }
rewrite Hcast in *.
entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_8_pure : CircularAreaWrite_partial_solve_wit_8_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_9_pure : CircularAreaWrite_partial_solve_wit_9_pure.
Proof.
pre_process; unfold CircularAreaLogicalState in *; entailer!.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_10_pure : CircularAreaWrite_partial_solve_wit_10_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_11_pure : CircularAreaWrite_partial_solve_wit_11_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_12_pure : CircularAreaWrite_partial_solve_wit_12_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_13_pure : CircularAreaWrite_partial_solve_wit_13_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_14_pure : CircularAreaWrite_partial_solve_wit_14_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_15_pure : CircularAreaWrite_partial_solve_wit_15_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_16_pure : CircularAreaWrite_partial_solve_wit_16_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_17_pure : CircularAreaWrite_partial_solve_wit_17_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_18_pure : CircularAreaWrite_partial_solve_wit_18_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_19_pure : CircularAreaWrite_partial_solve_wit_19_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_20_pure : CircularAreaWrite_partial_solve_wit_20_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_21_pure : CircularAreaWrite_partial_solve_wit_21_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in *.
  all: repeat match goal with H : _ /\ _ |- _ => destruct H end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_22_pure : CircularAreaWrite_partial_solve_wit_22_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_23_pure : CircularAreaWrite_partial_solve_wit_23_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_24_pure : CircularAreaWrite_partial_solve_wit_24_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_25_pure : CircularAreaWrite_partial_solve_wit_25_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_26_pure : CircularAreaWrite_partial_solve_wit_26_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_27_pure : CircularAreaWrite_partial_solve_wit_27_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_28_pure : CircularAreaWrite_partial_solve_wit_28_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_29_pure : CircularAreaWrite_partial_solve_wit_29_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_30_pure : CircularAreaWrite_partial_solve_wit_30_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_31_pure : CircularAreaWrite_partial_solve_wit_31_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_32_pure : CircularAreaWrite_partial_solve_wit_32_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

Lemma proof_of_CircularAreaWrite_partial_solve_wit_33_pure : CircularAreaWrite_partial_solve_wit_33_pure.
Proof.
  aggressive_pre_process.
  all: match goal with H : CircularAreaLogicalState _ _ _ _ _ _ |- _ =>
    unfold CircularAreaLogicalState in H;
    destruct H as [Hcap [Hr [Hw [Hlogical [Hphysical Hrest]]]]]
  end.
  all: split_pures; dump_pre_spatial;
    rewrite Zlength_sublist by lia; lia.
Qed. 

