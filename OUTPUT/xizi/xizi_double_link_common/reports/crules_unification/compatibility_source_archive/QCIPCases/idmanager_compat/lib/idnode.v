Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass.
Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.

Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Local Open Scope sac.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Require Export QCIPCases.idmanager_compat.lib.glob.
Require Export QCIPCases.idmanager_compat.lib.dll.
Require Export QCIPCases.idmanager_compat.lib.bitmap.
Import DLL.

Local Open Scope monad.

Module IDNode.

Record idmanager: Type :=
  Build_idmanager {
    idmax: Z;
    hoffset: Z;
    idlist: list Z;
    idbuckets: list (list Z);
    storeA: addr -> Z -> Prop;
  }.

Arguments Build_idmanager _ _ _ _ _ : assert.

Notation "x '.(idmax)'" := (idmax x) (at level 1).
Notation "x '.(hoffset)'" := (hoffset x) (at level 1).
Notation "x '.(idlist)'" := (idlist x) (at level 1).
Notation "x '.(idbuckets)'" := (idbuckets x) (at level 1).
Notation "x '.(storeA)'" := (storeA x) (at level 1).

Definition id_in_ids (id: Z) (ids: list Z): bool :=
  if in_dec Z.eq_dec id ids then true else false.

Definition idlist_add (id: Z) (ids: list Z): list Z :=
  id :: ids.

Definition idlist_remove (id: Z) (ids: list Z): list Z :=
  remove Z.eq_dec id ids.

Definition idmanager_add (m: idmanager) (id: Z): idmanager :=
  Build_idmanager m.(idmax) m.(hoffset) (idlist_add id m.(idlist)) m.(idbuckets) m.(storeA).

Definition idmanager_delete (m: idmanager) (id: Z): idmanager :=
  Build_idmanager m.(idmax) m.(hoffset) (idlist_remove id m.(idlist)) m.(idbuckets) m.(storeA).

Definition idmanager_bucket_index (m: idmanager) (id: Z): Z :=
  id mod m.(hoffset).

Definition idmanager_insert_bucket (hoffset id: Z) (buckets: list (list Z)): list (list Z) :=
  let index := id mod hoffset in
  replace_Znth index (id :: Znth index buckets nil) buckets.

Definition idmanager_link (m: idmanager) (id: Z): idmanager :=
  Build_idmanager
    m.(idmax)
    m.(hoffset)
    m.(idlist)
    (idmanager_insert_bucket m.(hoffset) id m.(idbuckets))
    m.(storeA).

Definition idmanager_remove_bucket (hoffset id: Z) (buckets: list (list Z)): list (list Z) :=
  let index := id mod hoffset in
  replace_Znth index (idlist_remove id (Znth index buckets nil)) buckets.

Definition idmanager_remove (m: idmanager) (id: Z): idmanager :=
  Build_idmanager
    m.(idmax)
    m.(hoffset)
    (idlist_remove id m.(idlist))
    (idmanager_remove_bucket m.(hoffset) id m.(idbuckets))
    m.(storeA).

Definition idmanager_storeA (m: idmanager) (p: addr) (id: Z): Prop :=
  m.(storeA) p id.

Definition idnodes_no_id (id: Z) (nodes: list (DL_Node Z)): Prop :=
  ~ In id (map getData nodes).

Definition idmanager_query (m: idmanager) (id: Z): bool :=
  id_in_ids id m.(idlist).

Definition idmanager_getobj_ret (m: idmanager) (id ret: Z): Prop :=
  (ret = 0 /\ idmanager_query m id = false) \/
  (idmanager_query m id = true /\ idmanager_storeA m ret id).

Definition idmanager_min_free_id (m: idmanager) (id: Z): Prop :=
  0 <= id < m.(idmax) /\
  idmanager_query m id = false /\
  forall id',
    0 <= id' < id ->
    idmanager_query m id' = true.

Definition idmanager_full (m: idmanager): Prop :=
  forall id,
    0 <= id < m.(idmax) ->
    idmanager_query m id = true.

Fixpoint idmanager_first_free_id_from (m: idmanager) (fuel: nat) (id: Z): option Z :=
  match fuel with
  | O => None
  | S fuel' =>
      if idmanager_query m id
      then idmanager_first_free_id_from m fuel' (id + 1)
      else Some id
  end.

Definition idmanager_first_free_id (m: idmanager): option Z :=
  idmanager_first_free_id_from m (Z.to_nat m.(idmax)) 0.

Lemma id_in_ids_true_iff:
  forall id ids,
    id_in_ids id ids = true <-> In id ids.
Proof.
  intros id ids.
  unfold id_in_ids.
  destruct (in_dec Z.eq_dec id ids); intuition congruence.
Qed.

Lemma id_in_ids_false_iff:
  forall id ids,
    id_in_ids id ids = false <-> ~ In id ids.
Proof.
  intros id ids.
  unfold id_in_ids.
  destruct (in_dec Z.eq_dec id ids); intuition congruence.
Qed.

Lemma idmanager_first_free_id_from_min:
  forall fuel start m free,
    0 <= start <= free ->
    free < start + Z.of_nat fuel ->
    idmanager_query m free = false ->
    (forall id, start <= id < free -> idmanager_query m id = true) ->
    idmanager_first_free_id_from m fuel start = Some free.
Proof.
  induction fuel; intros start m free Hstart Hfuel Hfree Hbefore.
  - simpl in Hfuel; lia.
  - simpl.
    destruct (Z.eq_dec start free) as [Heq | Hneq].
    + subst start.
      rewrite Hfree.
      reflexivity.
    + assert (idmanager_query m start = true) as Hstart_alloc.
      { apply Hbefore; lia. }
      rewrite Hstart_alloc.
      apply IHfuel.
      * lia.
      * rewrite Nat2Z.inj_succ in Hfuel; lia.
      * exact Hfree.
      * intros id Hid; apply Hbefore; lia.
Qed.

Lemma idmanager_first_free_id_min:
  forall m id,
    idmanager_min_free_id m id ->
    idmanager_first_free_id m = Some id.
Proof.
  intros m id Hmin.
  unfold idmanager_min_free_id in Hmin.
  destruct Hmin as [[Hid_nonneg Hid_lt] [Hfree Hbefore]].
  unfold idmanager_first_free_id.
  apply idmanager_first_free_id_from_min.
  - lia.
  - rewrite Z2Nat.id by lia; lia.
  - exact Hfree.
  - intros id' Hid'. apply Hbefore; lia.
Qed.

Lemma idmanager_first_free_id_from_some_min:
  forall fuel start m free,
    0 <= start ->
    idmanager_first_free_id_from m fuel start = Some free ->
    start <= free < start + Z.of_nat fuel /\
    idmanager_query m free = false /\
    forall id, start <= id < free -> idmanager_query m id = true.
Proof.
  induction fuel; intros start m free Hstart Hsome.
  - simpl in Hsome. discriminate.
  - simpl in Hsome.
    destruct (idmanager_query m start) eqn:Hquery.
    + specialize (IHfuel (start + 1) m free ltac:(lia) Hsome)
        as [[Hrange Hfree] [Hfree_query Hbefore]].
      split; [rewrite Nat2Z.inj_succ; lia |].
      split; [exact Hfree_query |].
      intros id Hid.
      destruct (Z.eq_dec id start) as [Heq | Hneq].
      * subst id. exact Hquery.
      * apply Hbefore; lia.
    + inversion Hsome; subst free.
      split; [rewrite Nat2Z.inj_succ; lia |].
      split; [exact Hquery |].
      intros id Hid. lia.
Qed.

Lemma idmanager_first_free_id_some_min:
  forall m id,
    idmanager_first_free_id m = Some id ->
    idmanager_min_free_id m id.
Proof.
  intros m id Hfirst.
  unfold idmanager_first_free_id in Hfirst.
  pose proof (idmanager_first_free_id_from_some_min
    (Z.to_nat m.(idmax)) 0 m id ltac:(lia) Hfirst) as [[Hlower Hupper] [Hfree Hbefore]].
  unfold idmanager_min_free_id.
  split.
  - split; [lia |].
    destruct (Z_le_gt_dec 0 m.(idmax)) as [Hidmax | Hidmax].
    + rewrite Z2Nat.id in Hupper by exact Hidmax. lia.
    + rewrite (Coqlib.Z_to_nat_neg m.(idmax)) in Hupper by lia. simpl in Hupper. lia.
  - split; [exact Hfree |].
    intros id' Hid'. apply Hbefore; lia.
Qed.

Lemma idmanager_first_free_id_from_full:
  forall fuel start m,
    (forall id, start <= id < start + Z.of_nat fuel -> idmanager_query m id = true) ->
    idmanager_first_free_id_from m fuel start = None.
Proof.
  induction fuel; intros start m Hfull.
  - reflexivity.
  - simpl.
    assert (idmanager_query m start = true) as Hstart.
    { apply Hfull. rewrite Nat2Z.inj_succ; lia. }
    rewrite Hstart.
    apply IHfuel.
    intros id Hid.
    apply Hfull.
    rewrite Nat2Z.inj_succ; lia.
Qed.

Lemma idmanager_first_free_id_full:
  forall m,
    idmanager_full m ->
    0 <= m.(idmax) ->
    idmanager_first_free_id m = None.
Proof.
  intros m Hfull Hnonneg.
  unfold idmanager_first_free_id.
  apply idmanager_first_free_id_from_full.
  intros id Hid.
  rewrite Z2Nat.id in Hid by lia.
  apply Hfull; lia.
Qed.

Definition allocid_index_scan_inv (bytes: list Z) (index: Z): Prop :=
  0 <= index /\
  forall i,
    0 <= i < index ->
    Znth i bytes 0 = 255.

Definition allocid_entry_scan_inv (bytes: list Z) (index id entry: Z): Prop :=
  index * 8 <= id <= index * 8 + 8 /\
  0 <= entry <= 255 /\
  exists offset,
    id = index * 8 + offset /\
    0 <= offset <= 8 /\
    entry = Z.shiftr (Znth index bytes 0) offset /\
    forall bit,
      0 <= bit < offset ->
      Z.testbit (Znth index bytes 0) bit = true.

Definition idlist_ok (idmax: Z) (ids: list Z): Prop :=
  Forall (fun id => 0 <= id < idmax) ids /\
  NoDup ids.

Fixpoint idbuckets_index_ok (hoffset index: Z) (buckets: list (list Z)): Prop :=
  match buckets with
  | nil => True
  | ids :: buckets' =>
      Forall (fun id => id mod hoffset = index) ids /\
      idbuckets_index_ok hoffset (index + 1) buckets'
  end.

Definition idbuckets_ok (idmax hoffset: Z) (ids: list Z) (buckets: list (list Z)): Prop :=
  0 < hoffset /\
  Zlength buckets = hoffset /\
  idlist_ok idmax ids /\
  Forall (idlist_ok idmax) buckets /\
  idbuckets_index_ok hoffset 0 buckets /\
  Permutation (concat buckets) ids.

Definition id_map_bytes_ok (idmax: Z) (ids bytes: list Z): Prop :=
  0 <= idmax /\
  idmax <= 65535 /\
  Zlength bytes = (idmax + 7) / 8 /\
  idlist_ok idmax ids /\
  Forall (fun byte => 0 <= byte <= 255) bytes /\
  forall id,
    0 <= id < idmax ->
    Z.testbit (Znth (id / 8) bytes 0) (id mod 8) = id_in_ids id ids.

Lemma Forall_Znth_Zlength:
  forall {A: Type} (P: A -> Prop) (l: list A) (d: A) (i: Z),
    Forall P l ->
    0 <= i < Zlength l ->
    P (Znth i l d).
Proof.
  intros A P l d i HForall Hrange.
  apply Forall_forall with (x := Znth i l d) in HForall; auto.
  unfold Znth.
  apply nth_In.
  apply Nat2Z.inj_lt.
  rewrite Z2Nat.id by lia.
  rewrite <- Zlength_correct.
  lia.
Qed.

Lemma id_map_bytes_ok_Znth_range:
  forall idmax ids bytes index,
    id_map_bytes_ok idmax ids bytes ->
    0 <= index < (idmax + 7) ÷ 8 ->
    0 <= Znth index bytes 0 <= 255.
Proof.
  intros idmax ids bytes index Hok Hindex.
  unfold id_map_bytes_ok in Hok.
  destruct Hok as [Hnonneg [_ [Hlen [_ [Hbytes _]]]]].
  apply Forall_Znth_Zlength; auto.
  rewrite Hlen.
  rewrite Z.quot_div_nonneg in Hindex by lia.
  lia.
Qed.

Lemma allocid_entry_scan_inv_init:
  forall idmax ids bytes index,
    id_map_bytes_ok idmax ids bytes ->
    0 <= index < (idmax + 7) ÷ 8 ->
    allocid_entry_scan_inv bytes index (index * 8) (Znth index bytes 0).
Proof.
  intros idmax ids bytes index Hok Hindex.
  unfold allocid_entry_scan_inv.
  split; [lia |].
  split.
  - eapply id_map_bytes_ok_Znth_range; eauto.
  - exists 0.
    split; [lia |].
    split; [lia |].
    split; [rewrite Z.shiftr_0_r; reflexivity |].
    intros bit Hbit; lia.
Qed.

Lemma allocid_entry_scan_inv_step:
  forall bytes index id entry,
    0 <= Znth index bytes 0 <= 255 ->
    allocid_entry_scan_inv bytes index id entry ->
    Z.land entry 1 <> 0 ->
    allocid_entry_scan_inv
      bytes index (id + 1) (unsigned_last_nbits (Z.shiftr entry 1) 8).
Proof.
  intros bytes index id entry Hbyte Hinv Hland.
  unfold allocid_entry_scan_inv in *.
  destruct Hinv as [Hid [Hentry [offset [Hid_eq [Hoff [Hentry_eq Hbits]]]]]].
  assert (offset < 8) as Hoff_lt.
  {
    destruct (Z.eq_dec offset 8) as [Hoff_eq | Hoff_neq]; [| lia].
    subst offset.
    assert (Z.shiftr (Znth index bytes 0) 8 = 0) as Hshift0.
    {
      rewrite Z.shiftr_div_pow2 by lia.
      apply Z.div_small.
      lia.
    }
    subst entry.
    rewrite Hshift0 in Hland.
    rewrite and_zero_one in Hland.
    contradiction.
  }
  split; [lia |].
  split.
  - pose proof (unsigned_Lastnbits_range (Z.shiftr entry 1) 8 ltac:(lia)).
    lia.
  - exists (offset + 1).
    split; [lia |].
    split; [lia |].
    split.
    + rewrite unsigned_last_nbits_eq.
      * subst entry.
        rewrite Z.shiftr_shiftr by lia.
        replace (offset + 1) with (offset + 1) by lia.
        reflexivity.
      * rewrite Z.shiftr_div_pow2 by lia.
        split.
        -- apply Z.div_pos; lia.
        -- apply Z.div_lt_upper_bound; lia.
    + intros bit Hbit.
      destruct (Z.eq_dec bit offset) as [Hbit_eq | Hbit_neq].
      * subst bit.
        assert (Z.testbit entry 0 = true) as Hentry_bit.
        {
          destruct (Z.odd entry) eqn:Hodd.
          - rewrite Z.bit0_odd; exact Hodd.
          - exfalso.
            apply Hland.
            apply land_1_odd.
            exact Hodd.
        }
        subst entry.
        rewrite Z.shiftr_spec in Hentry_bit by lia.
        replace (0 + offset) with offset in Hentry_bit by lia.
        exact Hentry_bit.
      * apply Hbits; lia.
Qed.

(* Basic facts that the return witnesses should be proved from. *)

Lemma id_map_bytes_ok_query_eq:
  forall m bytes id,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    0 <= id < m.(idmax) ->
    idmanager_query m id =
    Z.testbit (Znth (id / 8) bytes 0) (id mod 8).
Proof.
  intros m bytes id Hok Hid.
  unfold idmanager_query.
  unfold id_map_bytes_ok in Hok.
  destruct Hok as [_ [_ [_ [_ [_ Hbits]]]]].
  symmetry.
  apply Hbits.
  exact Hid.
Qed.

Lemma Ztestbit_255_low:
  forall bit,
    0 <= bit < 8 ->
    Z.testbit 255 bit = true.
Proof.
  intros bit Hbit.
  assert (bit = 0 \/ bit = 1 \/ bit = 2 \/ bit = 3 \/
          bit = 4 \/ bit = 5 \/ bit = 6 \/ bit = 7) as Hcases by lia.
  destruct Hcases as [-> | [-> | [-> | [-> | [-> | [-> | [-> | ->]]]]]]];
    reflexivity.
Qed.

Lemma div8_add_offset:
  forall index offset,
    0 <= offset < 8 ->
    (index * 8 + offset) / 8 = index.
Proof.
  intros index offset Hoff.
  rewrite Z.add_comm.
  rewrite Z.div_add by lia.
  rewrite Z.div_small by lia.
  lia.
Qed.

Lemma mod8_add_offset:
  forall index offset,
    0 <= offset < 8 ->
    (index * 8 + offset) mod 8 = offset.
Proof.
  intros index offset Hoff.
  rewrite Z.add_comm.
  rewrite Z.add_mod by lia.
  replace (8 * index) with (index * 8) by lia.
  rewrite Z_mod_mult by lia.
  rewrite Z.add_0_r.
  replace (offset mod 8) with offset by (symmetry; apply Z.mod_small; lia).
  apply Z.mod_small; lia.
Qed.

Lemma div8_eq_of_range:
  forall index id,
    index * 8 <= id < index * 8 + 8 ->
    id / 8 = index.
Proof.
  intros index id Hid.
  assert (exists offset, id = index * 8 + offset /\ 0 <= offset < 8) as Hoff.
  {
    exists (id - index * 8).
    split; lia.
  }
  destruct Hoff as [offset [Hid_eq Hoff]].
  subst id.
  apply div8_add_offset; lia.
Qed.

Lemma same_div8_mod8_neq:
  forall x y index,
    0 <= x ->
    0 <= y ->
    x / 8 = index ->
    y / 8 = index ->
    x <> y ->
    x mod 8 <> y mod 8.
Proof.
  intros x y index Hx Hy Hxdiv Hydiv Hneq Hmod.
  apply Hneq.
  pose proof (Z.div_mod x 8 ltac:(lia)) as Hxrepr.
  pose proof (Z.div_mod y 8 ltac:(lia)) as Hyrepr.
  lia.
Qed.

Lemma idmax_le_8_quot_ceil8:
  forall idmax,
    0 <= idmax ->
    idmax <= 8 * ((idmax + 7) ÷ 8).
Proof.
  intros idmax Hnonneg.
  rewrite Z.quot_div_nonneg by lia.
  pose proof (Z.div_mod (idmax + 7) 8 ltac:(lia)) as Hdiv.
  pose proof (Z.mod_pos_bound (idmax + 7) 8 ltac:(lia)) as Hmod.
  lia.
Qed.

Lemma id_div8_lt_quot_ceil8:
  forall id idmax,
    0 <= id < idmax ->
    id / 8 < (idmax + 7) ÷ 8.
Proof.
  intros id idmax Hid.
  rewrite Z.quot_div_nonneg by lia.
  apply Z.div_lt_upper_bound; try lia.
  pose proof (idmax_le_8_quot_ceil8 idmax ltac:(lia)) as Hceil.
  rewrite Z.quot_div_nonneg in Hceil by lia.
  lia.
Qed.

Lemma byte_eq_255_of_low_bits:
  forall b,
    0 <= b <= 255 ->
    (forall bit, 0 <= bit < 8 -> Z.testbit b bit = true) ->
    b = 255.
Proof.
  intros b Hb Hbits.
  apply Z.bits_inj.
  unfold Z.eqf.
  intros n.
  destruct (Z_lt_ge_dec n 0) as [Hnneg | Hnnonneg].
  - rewrite Z.testbit_neg_r by lia.
    rewrite Z.testbit_neg_r by lia.
    reflexivity.
  - destruct (Z_lt_ge_dec n 8) as [Hnlow | Hnhigh].
    + rewrite Hbits by lia.
      symmetry; apply Ztestbit_255_low; lia.
    + assert (256 <= 2 ^ n) as Hpow.
      { replace 256 with (2 ^ 8) by reflexivity.
        apply Z.pow_le_mono_r; lia. }
      assert (Z.testbit b n = false) as Hbhigh.
      { destruct (Z.eq_dec b 0) as [-> | Hbneq].
        - apply Z.bits_0.
        - apply Z.bits_above_log2.
          + lia.
          + apply (proj1 (Z.log2_lt_pow2 b n ltac:(lia))); lia. }
      rewrite Hbhigh.
      assert (Z.testbit 255 n = false) as H255high.
      { apply Z.bits_above_log2.
        - lia.
        - apply (proj1 (Z.log2_lt_pow2 255 n ltac:(lia))); lia. }
      rewrite H255high.
      reflexivity.
Qed.

Lemma Ztestbit_1_neq0:
  forall bit,
    bit <> 0 ->
    Z.testbit 1 bit = false.
Proof.
  intros bit Hneq.
  destruct (Z_lt_ge_dec bit 0) as [Hneg | Hnonneg].
  - apply Z.testbit_neg_r; lia.
  - assert (0 < bit) by lia.
    apply Z.bits_above_log2.
    + lia.
    + apply (proj1 (Z.log2_lt_pow2 1 bit ltac:(lia))).
      apply Zpow_facts.Zpower_gt_1; lia.
Qed.

Lemma id_in_ids_add_neq:
  forall query id ids,
    query <> id ->
    id_in_ids query (idlist_add id ids) = id_in_ids query ids.
Proof.
  intros query id ids Hneq.
  unfold idlist_add, id_in_ids.
  destruct (in_dec Z.eq_dec query (id :: ids)) as [Hin_cons | Hnotin_cons];
  destruct (in_dec Z.eq_dec query ids) as [Hin | Hnotin]; auto.
  - destruct Hin_cons as [Heq | Hin']; [congruence | contradiction].
  - exfalso; apply Hnotin_cons; right; exact Hin.
Qed.

Lemma Forall_replace_nth:
  forall {A: Type} (P: A -> Prop) n l a,
    Forall P l ->
    P a ->
    Forall P (replace_nth n l a).
Proof.
  intros A P n l a HForall Ha.
  revert n.
  induction HForall; intros n.
  - destruct n; constructor.
  - destruct n; simpl; constructor; auto.
Qed.

Lemma Forall_replace_Znth:
  forall {A: Type} (P: A -> Prop) i l a,
    Forall P l ->
    P a ->
    Forall P (replace_Znth i a l).
Proof.
  intros A P i l a HForall Ha.
  unfold replace_Znth.
  apply Forall_replace_nth; auto.
Qed.

Lemma allocid_index_scan_inv_full:
  forall m bytes index,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    allocid_index_scan_inv bytes index ->
    index = (m.(idmax) + 7) ÷ 8 ->
    idmanager_full m.
Proof.
  intros m bytes index Hmap Hscan Hindex.
  unfold idmanager_full.
  intros id Hid.
  rewrite (id_map_bytes_ok_query_eq m bytes id Hmap Hid).
  unfold allocid_index_scan_inv in Hscan.
  destruct Hscan as [Hidx_nonneg Hfull_bytes].
  rewrite Hfull_bytes.
  - apply Ztestbit_255_low.
    apply Z.mod_pos_bound; lia.
  - subst index.
    split.
    + apply Z.div_pos; lia.
    + apply id_div8_lt_quot_ceil8; exact Hid.
Qed.

Lemma allocid_entry_scan_inv_full:
  forall m bytes index id entry,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    allocid_index_scan_inv bytes index ->
    allocid_entry_scan_inv bytes index id entry ->
    id >= m.(idmax) ->
    idmanager_full m.
Proof.
  intros m bytes index id entry Hmap Hidx Hentry Hid_ge.
  unfold idmanager_full.
  intros id' Hid'.
  rewrite (id_map_bytes_ok_query_eq m bytes id' Hmap Hid').
  unfold allocid_index_scan_inv in Hidx.
  destruct Hidx as [Hindex_nonneg Hfull_bytes].
  unfold allocid_entry_scan_inv in Hentry.
  destruct Hentry as [Hid_range [Hentry_range [offset [Hid_eq [Hoff [Hentry_eq Hbits]]]]]].
  assert (id' < id) as Hid'_lt_id by lia.
  destruct (Z_lt_ge_dec id' (index * 8)) as [Hbefore | Hin_byte].
  - rewrite Hfull_bytes.
    + apply Ztestbit_255_low.
      apply Z.mod_pos_bound; lia.
    + split.
      * apply Z.div_pos; lia.
      * apply Z.div_lt_upper_bound; lia.
  - assert (id' / 8 = index) as Hdiv.
    { apply div8_eq_of_range. lia. }
    rewrite Hdiv.
    assert (id' = index * 8 + (id' mod 8)) as Hid'_repr.
    { pose proof (Z.div_mod id' 8 ltac:(lia)) as Hrepr. lia. }
    apply Hbits.
    split.
    + apply Z.mod_pos_bound; lia.
    + lia.
Qed.

Lemma allocid_success_min_free:
  forall m bytes index id entry,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    allocid_index_scan_inv bytes index ->
    Znth index bytes 0 <> 255 ->
    allocid_entry_scan_inv bytes index id entry ->
    Z.land entry 1 = 0 ->
    id < m.(idmax) ->
    idmanager_min_free_id m id.
Proof.
  intros m bytes index id entry Hmap Hidx Hnotfull Hentry Hland Hid_lt.
  unfold allocid_index_scan_inv in Hidx.
  destruct Hidx as [Hindex_nonneg Hfull_bytes].
  unfold allocid_entry_scan_inv in Hentry.
  destruct Hentry as [Hid_range [Hentry_range [offset [Hid_eq [Hoff [Hentry_eq Hbits]]]]]].
  assert (0 <= index < (m.(idmax) + 7) ÷ 8) as Hindex_range.
  { assert (index <= id / 8) as Hidx_le_div.
    { subst id. rewrite Z.add_comm. rewrite Z.div_add by lia.
      pose proof (Z.div_pos offset 8 ltac:(lia)); lia. }
    pose proof (id_div8_lt_quot_ceil8 id m.(idmax) ltac:(lia)).
    lia. }
  assert (0 <= Znth index bytes 0 <= 255) as Hbyte_range.
  { eapply id_map_bytes_ok_Znth_range; eauto. }
  assert (offset < 8) as Hoff_lt.
  { destruct (Z.eq_dec offset 8) as [Hoff_eq | Hoff_neq]; [| lia].
    subst offset.
    exfalso.
    apply Hnotfull.
    eapply byte_eq_255_of_low_bits; eauto. }
  unfold idmanager_min_free_id.
  split; [lia |].
  split.
  - rewrite (id_map_bytes_ok_query_eq m bytes id Hmap ltac:(lia)).
    subst id.
    rewrite div8_add_offset by lia.
    rewrite mod8_add_offset by lia.
    assert (Z.testbit (Z.shiftr (Znth index bytes 0) offset) 0 = false) as Hentry_bit.
    { rewrite Z.bit0_odd.
      apply land_1_odd.
      subst entry; exact Hland. }
    rewrite Z.shiftr_spec in Hentry_bit by lia.
    replace (0 + offset) with offset in Hentry_bit by lia.
    exact Hentry_bit.
  - intros id' Hid'.
    rewrite (id_map_bytes_ok_query_eq m bytes id' Hmap ltac:(lia)).
    destruct (Z_lt_ge_dec id' (index * 8)) as [Hbefore | Hin_byte].
    + rewrite Hfull_bytes.
      * apply Ztestbit_255_low.
        apply Z.mod_pos_bound; lia.
      * split.
        -- apply Z.div_pos; lia.
        -- apply Z.div_lt_upper_bound; lia.
    + assert (id' / 8 = index) as Hdiv.
      { apply div8_eq_of_range. lia. }
      rewrite Hdiv.
      assert (id' = index * 8 + (id' mod 8)) as Hid'_repr.
      { pose proof (Z.div_mod id' 8 ltac:(lia)) as Hrepr. lia. }
      apply Hbits.
      split.
      * apply Z.mod_pos_bound; lia.
      * lia.
Qed.

Lemma id_map_bytes_ok_allocid_set:
  forall m bytes index id entry,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    allocid_index_scan_inv bytes index ->
    Znth index bytes 0 <> 255 ->
    allocid_entry_scan_inv bytes index id entry ->
    Z.land entry 1 = 0 ->
    id < m.(idmax) ->
    id_map_bytes_ok m.(idmax) (idlist_add id m.(idlist))
      (replace_Znth index
        (Z.lor (unsigned_last_nbits (Znth index bytes 0) 8)
               (unsigned_last_nbits (Z.shiftl 1 (id mod 8)) 8))
        bytes).
Proof.
  intros m bytes index id entry Hmap Hidx Hnotfull Hentry Hland Hid_lt.
  pose proof Hmap as Hmap_keep.
  pose proof (allocid_success_min_free m bytes index id entry Hmap Hidx Hnotfull Hentry Hland Hid_lt) as Hmin.
  unfold id_map_bytes_ok in Hmap.
  destruct Hmap as [Hidmax_nonneg [Hidmax_bound [Hlen [Hids [Hbytes Hbitsmap]]]]].
  unfold id_map_bytes_ok.
  split; [exact Hidmax_nonneg |].
  split; [exact Hidmax_bound |].
  split; [rewrite Zlength_replace_Znth; exact Hlen |].
  split.
  - unfold idmanager_min_free_id in Hmin.
    destruct Hmin as [Hid_range [Hfree Hbefore]].
    unfold idlist_ok in *.
    destruct Hids as [Hids_range Hnodup].
    split.
    + unfold idlist_add. constructor; auto.
    + unfold idlist_add. constructor; auto.
      apply id_in_ids_false_iff.
      unfold idmanager_query in Hfree.
      exact Hfree.
  - split.
    + apply Forall_replace_Znth; auto.
      assert (0 <=
        Z.lor (unsigned_last_nbits (Znth index bytes 0) 8)
              (unsigned_last_nbits (Z.shiftl 1 (id mod 8)) 8) < 256) as Hlor.
      { change 256 with (two_power_nat 8).
        apply lor_close;
          replace (two_power_nat 8) with (2 ^ 8) by reflexivity;
          apply unsigned_Lastnbits_range; lia. }
      lia.
    + intros query Hquery.
      unfold allocid_index_scan_inv in Hidx.
      destruct Hidx as [Hindex_nonneg Hfull_bytes].
      unfold allocid_entry_scan_inv in Hentry.
      destruct Hentry as [Hentry_id_range [Hentry_range [offset [Hid_eq [Hoff [Hentry_eq Hentry_bits]]]]]].
      assert (0 <= id < m.(idmax)) as Hid_valid by lia.
      assert (0 <= index < (m.(idmax) + 7) ÷ 8) as Hindex_range.
      { assert (index <= id / 8) as Hidx_le_div.
        { rewrite Hid_eq. rewrite Z.add_comm. rewrite Z.div_add by lia.
          pose proof (Z.div_pos offset 8 ltac:(lia)); lia. }
        pose proof (id_div8_lt_quot_ceil8 id m.(idmax) Hid_valid). lia. }
      assert (offset < 8) as Hoff_lt.
      { assert (0 <= Znth index bytes 0 <= 255) as Hbyte_range.
        { eapply id_map_bytes_ok_Znth_range; eauto. }
        destruct (Z.eq_dec offset 8) as [Hoff_eq | Hoff_neq]; [| lia].
        subst offset. exfalso. apply Hnotfull.
        eapply byte_eq_255_of_low_bits; eauto. }
      assert (id / 8 = index) as Hid_div.
      { rewrite Hid_eq. apply div8_add_offset; lia. }
      assert (id mod 8 = offset) as Hid_mod.
      { rewrite Hid_eq. apply mod8_add_offset; lia. }
      destruct (Z.eq_dec query id) as [Hquery_id | Hquery_neq].
      * subst query.
        rewrite Hid_div.
        rewrite Znth_replace_Znth_Same by
          (rewrite Hlen; rewrite Z.quot_div_nonneg in Hindex_range by lia; lia).
        rewrite Z.lor_spec.
        rewrite Ztestbits_unsigned_eq by lia.
        rewrite Ztestbits_unsigned_eq by lia.
        rewrite Z.shiftl_spec by (rewrite Hid_mod; lia).
        rewrite Hid_mod.
        replace (offset - offset) with 0 by lia.
        simpl.
        unfold idlist_add, id_in_ids.
        destruct (in_dec Z.eq_dec id (id :: m.(idlist))) as [_ | Hnotin].
        -- destruct (Z.testbit (Znth index bytes 0) offset); reflexivity.
        -- exfalso; apply Hnotin; left; reflexivity.
      * rewrite id_in_ids_add_neq by exact Hquery_neq.
        destruct (Z.eq_dec (query / 8) index) as [Hsame | Hdiff].
        -- rewrite Hsame.
           rewrite Znth_replace_Znth_Same by
             (rewrite Hlen; rewrite Z.quot_div_nonneg in Hindex_range by lia; lia).
           rewrite Z.lor_spec.
           rewrite Ztestbits_unsigned_eq by (apply Z.mod_pos_bound; lia).
           rewrite Ztestbits_unsigned_eq by (apply Z.mod_pos_bound; lia).
           assert (Z.testbit (Z.shiftl 1 (id mod 8)) (query mod 8) = false) as Hmask_bit.
           { rewrite Z.shiftl_spec by (apply Z.mod_pos_bound; lia).
             apply Ztestbit_1_neq0.
             assert (query mod 8 <> id mod 8) as Hmod_neq.
             { eapply same_div8_mod8_neq; eauto; lia. }
             lia. }
           rewrite Hmask_bit.
           rewrite Bool.orb_false_r.
           rewrite <- Hsame.
           apply Hbitsmap; exact Hquery.
        -- rewrite Znth_replace_Znth_Diff.
           ++ apply Hbitsmap; exact Hquery.
           ++ rewrite Hlen. rewrite Z.quot_div_nonneg in Hindex_range by lia. lia.
           ++ rewrite Hlen.
              split.
              ** apply Z.div_pos; lia.
              ** pose proof (id_div8_lt_quot_ceil8 query m.(idmax) Hquery) as Hquery_div.
                 rewrite Z.quot_div_nonneg in Hquery_div by lia.
                 exact Hquery_div.
           ++ intro Heq. apply Hdiff. symmetry. exact Heq.
Qed.

Lemma id_in_ids_remove_same:
  forall id ids,
    id_in_ids id (remove Z.eq_dec id ids) = false.
Proof.
  intros id ids.
  apply id_in_ids_false_iff.
  apply remove_In.
Qed.

Lemma id_in_ids_remove_neq:
  forall query id ids,
    query <> id ->
    id_in_ids query (remove Z.eq_dec id ids) = id_in_ids query ids.
Proof.
  intros query id ids Hneq.
  destruct (id_in_ids query ids) eqn:Hin.
  { apply id_in_ids_true_iff in Hin.
    apply id_in_ids_true_iff.
    apply in_in_remove; auto. }
  { apply id_in_ids_false_iff in Hin.
    apply id_in_ids_false_iff.
    intro Hremove.
    apply in_remove in Hremove.
    tauto. }
Qed.

Lemma idlist_ok_remove:
  forall idmax ids id,
    idlist_ok idmax ids ->
    idlist_ok idmax (remove Z.eq_dec id ids).
Proof.
  intros idmax ids id [Hrange Hnodup].
  split.
  { apply Forall_forall. intros x Hx.
    apply in_remove in Hx as [Hx _].
    apply Forall_forall with (x := x) in Hrange; auto. }
  { induction Hnodup as [|x xs Hnotin Hnodup IH].
    { constructor. }
    simpl. destruct (Z.eq_dec id x).
    { apply IH. inversion Hrange; auto. }
    { constructor.
      { intro Hin. apply in_remove in Hin as [Hin _]. auto. }
      { apply IH. inversion Hrange; auto. } } }
Qed.

Lemma id_map_bytes_ok_freeid_clear:
  forall m bytes id,
    id_map_bytes_ok m.(idmax) m.(idlist) bytes ->
    0 <= id < m.(idmax) ->
    id_map_bytes_ok m.(idmax) (remove Z.eq_dec id m.(idlist))
      (replace_Znth (id / 8)
        (Z.land (Znth (id / 8) bytes 0)
          (unsigned_last_nbits (Z.lnot (signed_last_nbits (Z.shiftl 1 (id mod 8)) 32)) 8))
        bytes).
Proof.
  intros m bytes id Hmap Hid.
  pose proof Hmap as Hmap_keep.
  unfold id_map_bytes_ok in Hmap.
  destruct Hmap as [Hidmax_nonneg [Hidmax_bound [Hlen [Hids [Hbytes Hbitsmap]]]]].
  assert (0 <= id / 8 < (m.(idmax) + 7) ÷ 8) as Hid_index_quot_range.
  { split.
    - apply Z.div_pos; lia.
    - apply id_div8_lt_quot_ceil8; exact Hid. }
  assert (0 <= id / 8 < (m.(idmax) + 7) / 8) as Hid_index_div_range.
  { split.
    - apply Z.div_pos; lia.
    - apply Z.div_lt_upper_bound; try lia.
      rewrite <- Z.quot_div_nonneg by lia.
      pose proof (idmax_le_8_quot_ceil8 m.(idmax) ltac:(lia)) as Hceil.
      lia. }
  assert (0 <= id / 8 < Zlength bytes) as Hid_index_len.
  { rewrite Hlen. exact Hid_index_div_range. }
  assert (0 <= Znth (id / 8) bytes 0 <= 255) as Hbyte_range.
  { eapply id_map_bytes_ok_Znth_range; eauto. }
  unfold id_map_bytes_ok.
  split; [exact Hidmax_nonneg |].
  split; [exact Hidmax_bound |].
  split; [rewrite Zlength_replace_Znth; exact Hlen |].
  split; [apply idlist_ok_remove; exact Hids |].
  split.
  - apply Forall_replace_Znth; auto.
    assert (0 <= Z.land (Znth (id / 8) bytes 0)
      (unsigned_last_nbits (Z.lnot (signed_last_nbits (Z.shiftl 1 (id mod 8)) 32)) 8) < two_power_nat 8) as Hland.
    { apply land_close. change (two_power_nat 8) with 256. lia. }
    change (two_power_nat 8) with 256 in Hland. lia.
  - intros query Hquery.
    destruct (Z.eq_dec query id) as [Hqid | Hqneq].
    + subst query.
      rewrite id_in_ids_remove_same.
      rewrite Znth_replace_Znth_Same by exact Hid_index_len.
      rewrite Z.land_spec.
      rewrite Ztestbits_unsigned_eq by (apply Z.mod_pos_bound; lia).
      rewrite Z.lnot_spec by (apply Z.mod_pos_bound; lia).
      rewrite Ztestbits_signed_eq by (pose proof (Z.mod_pos_bound id 8 ltac:(lia)); lia).
      rewrite Z.shiftl_spec by (pose proof (Z.mod_pos_bound id 8 ltac:(lia)); lia).
      replace (id mod 8 - id mod 8) with 0 by lia.
      simpl. rewrite Bool.andb_false_r. reflexivity.
    + rewrite id_in_ids_remove_neq by exact Hqneq.
      destruct (Z.eq_dec (query / 8) (id / 8)) as [Hsame | Hdiff].
      * rewrite Hsame.
        rewrite Znth_replace_Znth_Same by exact Hid_index_len.
        rewrite Z.land_spec.
        rewrite Ztestbits_unsigned_eq by (apply Z.mod_pos_bound; lia).
        replace (Z.testbit (Z.lnot (signed_last_nbits (Z.shiftl 1 (id mod 8)) 32)) (query mod 8)) with true.
        -- rewrite Bool.andb_true_r.
           rewrite <- Hsame.
           apply Hbitsmap; exact Hquery.
        -- rewrite Z.lnot_spec by (apply Z.mod_pos_bound; lia).
           rewrite Ztestbits_signed_eq by (pose proof (Z.mod_pos_bound query 8 ltac:(lia)); lia).
           rewrite Z.shiftl_spec by (pose proof (Z.mod_pos_bound query 8 ltac:(lia)); lia).
           assert (query mod 8 <> id mod 8) as Hmod_neq.
           { eapply same_div8_mod8_neq; eauto; lia. }
           destruct (Z_lt_ge_dec (query mod 8 - id mod 8) 0).
           ++ rewrite Z.testbit_neg_r by lia. reflexivity.
           ++ rewrite Ztestbit_1_neq0 by lia. reflexivity.
      * rewrite Znth_replace_Znth_Diff.
        -- apply Hbitsmap; exact Hquery.
        -- exact Hid_index_len.
        -- rewrite Hlen. split.
           ++ apply Z.div_pos; lia.
           ++ apply Z.div_lt_upper_bound; try lia.
              rewrite <- Z.quot_div_nonneg by lia.
              pose proof (idmax_le_8_quot_ceil8 m.(idmax) ltac:(lia)) as Hceil.
              lia.
        -- intro Heq. apply Hdiff. symmetry. exact Heq.
Qed.

Definition store_uchar_array (p: addr) (n: Z) (bytes: list Z): Assertion :=
  UCharArray.full p n bytes.

Definition store_id_map (id_map: addr) (idmax: Z) (ids: list Z): Assertion :=
  EX bytes: list Z,
    “ id_map_bytes_ok idmax ids bytes ” &&
    store_uchar_array id_map ((idmax + 7) / 8) bytes.

Definition store_idnode (node_storeA: addr -> Z -> Prop) (link: addr) (id: Z): Assertion :=
  EX p: addr,
    “ link = &(p # "IdNode" ->ₛ "link") ”&&“node_storeA p id” &&
    &(p # "IdNode" ->ₛ "id") # UShort |-> id.

Lemma dllseg_store_idnode_tail_append:
  forall (node_storeA: addr -> Z -> Prop) (x px y py z id: Z)
         (l: list (DL_Node Z)),
    dllseg (store_idnode node_storeA) x px y py l **
    store_idnode node_storeA y id **
    &(y # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> py **
    &(y # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> z |--
    dllseg (store_idnode node_storeA) x px z y
      (l ++ {| getData := id; getPtr := y |} :: nil).
Proof.
  intros node_storeA x px y py z id l.
  revert x px.
  induction l as [| a l IH]; intros x px.
  - simpl.
    Intros.
    destruct H as [Hx Hpx].
    subst.
    Exists z.
    entailer!.
  - simpl.
    Intros next.
    subst x.
    Exists next.
    entailer!.
    sep_apply (IH next a.(getPtr)).
    entailer!.
Qed.

Lemma dllseg_store_idnode_tail_append_field:
  forall (node_storeA: addr -> Z -> Prop) (p x px y py z id: Z)
         (l: list (DL_Node Z)),
    y = &(p # "IdNode" ->ₛ "link") ->
    node_storeA p id ->
    &(y # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> py **
    &(y # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> z **
    &(p # "IdNode" ->ₛ "id") # UShort |-> id **
    dllseg (store_idnode node_storeA) x px y py l |--
    dllseg (store_idnode node_storeA) x px z y
      (l ++ {| getData := id; getPtr := y |} :: nil).
Proof.
  intros node_storeA p x px y py z id l Hlink Hstore.
  subst y.
  revert x px.
  induction l as [| a l IH]; intros x px.
  - simpl.
    Intros.
    destruct H as [Hx Hpx].
    subst.
    Exists z.
    unfold store_idnode.
    Exists p.
    entailer!.
  - simpl.
    Intros next.
    subst x.
    Exists next.
    entailer!.
    sep_apply (IH next a.(getPtr)).
    entailer!.
Qed.

Definition store_idnode_unlinked (node_storeA: addr -> Z -> Prop) (link: addr) (id: Z): Assertion :=
  store_idnode node_storeA link id **
  &(link # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |->_ **
  &(link # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |->_.

Definition store_idnode_insert_ready (m: idmanager) (p: addr): Assertion :=
  “ (forall id, 0 <= id < m.(idmax) -> idmanager_storeA m p id) ” &&
  &(p # "IdNode" ->ₛ "id") # UShort |->_ **
  &(p # "IdNode" ->ₛ "link" .ₛ "node_prev") # Ptr |->_ **
  &(p # "IdNode" ->ₛ "link" .ₛ "node_next") # Ptr |->_.

Definition store_idnodes (node_storeA: addr -> Z -> Prop) (head: addr) (ids: list Z): Assertion :=
  EX nodes: list (DL_Node Z),
    “ map getData nodes = ids ” &&
    store_dll (store_idnode node_storeA) head nodes.

Definition store_uninit_idbucket (head: addr): Assertion :=
  &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> 0 **
  &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> 0.

Definition store_idbucket (node_storeA: addr -> Z -> Prop) (head: addr) (ids: list Z): Assertion :=
  match ids with
  | nil => store_idnodes node_storeA head nil || store_uninit_idbucket head
  | _ => store_idnodes node_storeA head ids
  end.

Fixpoint store_idbucket_list
  (node_storeA: addr -> Z -> Prop) (htable: addr) (index: Z) (buckets: list (list Z)): Assertion :=
  match buckets with
  | nil => emp
  | ids :: rest =>
      store_idbucket node_storeA (htable + index * sizeof("SysDoubleLinklistNode")) ids **
      store_idbucket_list node_storeA htable (index + 1) rest
  end.

Definition store_idbuckets_except
  (node_storeA: addr -> Z -> Prop) (htable: addr) (index: Z)
  (bucket: list Z) (buckets: list (list Z)): Assertion :=
  EX prefix suffix: list (list Z),
    “ buckets = prefix ++ bucket :: suffix /\ Zlength prefix = index ” &&
    store_idbucket_list node_storeA htable 0 prefix **
    store_idbucket_list node_storeA htable (index + 1) suffix.

Definition store_idbuckets
  (node_storeA: addr -> Z -> Prop) (htable: addr) (hoffset: Z) (buckets: list (list Z)): Assertion :=
  store_idbucket_list node_storeA htable 0 buckets.

Definition store_idmanager (m: idmanager) (p: addr): Assertion :=
  EX id_map htable: addr,
    &(p # "IdManager" ->ₛ "id_max") # UShort |-> m.(idmax) **
    &(p # "IdManager" ->ₛ "hoffset") # UShort |-> m.(hoffset) **
    &(p # "IdManager" ->ₛ "id_map") # Ptr |-> id_map **
    store_id_map id_map m.(idmax) m.(idlist) **
    &(p # "IdManager" ->ₛ "htable") # Ptr |-> htable **
    (“ idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ” &&
     store_idbuckets m.(storeA) htable m.(hoffset) m.(idbuckets)).

Definition store_idmanager_allocated_unlinked (m: idmanager) (p: addr) (id: Z): Assertion :=
  EX id_map htable: addr,
    “ idmanager_min_free_id m id ” &&
    &(p # "IdManager" ->ₛ "id_max") # UShort |-> m.(idmax) **
    &(p # "IdManager" ->ₛ "hoffset") # UShort |-> m.(hoffset) **
    &(p # "IdManager" ->ₛ "id_map") # Ptr |-> id_map **
    store_id_map id_map m.(idmax) (idlist_add id m.(idlist)) **
    &(p # "IdManager" ->ₛ "htable") # Ptr |-> htable **
    (“ idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ” &&
     store_idbuckets m.(storeA) htable m.(hoffset) m.(idbuckets)).

Definition store_idmanager_freeid_post (m: idmanager) (p: addr) (id: Z): Assertion :=
  EX id_map htable: addr,
    &(p # "IdManager" ->ₛ "id_max") # UShort |-> m.(idmax) **
    &(p # "IdManager" ->ₛ "hoffset") # UShort |-> m.(hoffset) **
    &(p # "IdManager" ->ₛ "id_map") # Ptr |-> id_map **
    store_id_map id_map m.(idmax) (remove Z.eq_dec id m.(idlist)) **
    &(p # "IdManager" ->ₛ "htable") # Ptr |-> htable **
    (“ idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ” &&
     store_idbuckets m.(storeA) htable m.(hoffset) m.(idbuckets)).

Definition store_idmanager_allocid_post (m: idmanager) (p: addr) (ret: Z): Assertion :=
  (“ idmanager_first_free_id m = Some ret /\ ret < 65536 ” &&
   store_idmanager_allocated_unlinked m p ret) ||
  (“ idmanager_first_free_id m = None /\ ret = -1 ” &&
   store_idmanager m p).

Definition store_idmanager_insert_post (m: idmanager) (manager idnode: addr) (ret: Z): Assertion :=
  (“ ret = -1 ” &&
   store_idmanager m manager **
   store_idnode_insert_ready m idnode) ||
  (“ idmanager_min_free_id m ret ” &&
   store_idmanager (idmanager_link (idmanager_add m ret) ret) manager).

Definition store_idmanager_remove_ready (m: idmanager) (manager idnode: addr) (id: Z): Assertion :=
  EX id_map htable: addr, EX bytes: list Z,
  EX prefix suffix: list (DL_Node Z), EX bucket: list Z,
    “ 0 <= id < m.(idmax) /\
      id_map_bytes_ok m.(idmax) (idlist_remove id m.(idlist)) bytes /\
      idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) /\
      idbuckets_ok m.(idmax) m.(hoffset) (idlist_remove id m.(idlist))
        (idmanager_remove_bucket m.(hoffset) id m.(idbuckets)) /\
      bucket = Znth (id mod m.(hoffset)) m.(idbuckets) nil /\
      bucket = map getData (prefix ++ {| getData := id; getPtr := &(idnode # "IdNode" ->ₛ "link") |} :: suffix) /\
      idlist_remove id bucket = map getData (prefix ++ suffix) /\
      idmanager_storeA m idnode id ” &&
    &(manager # "IdManager" ->ₛ "id_max") # UShort |-> m.(idmax) **
    &(manager # "IdManager" ->ₛ "hoffset") # UShort |-> m.(hoffset) **
    &(manager # "IdManager" ->ₛ "id_map") # Ptr |-> id_map **
    store_uchar_array id_map ((m.(idmax) + 7) / 8) bytes **
    &(manager # "IdManager" ->ₛ "htable") # Ptr |-> htable **
    store_idbuckets_except m.(storeA) htable (id mod m.(hoffset)) bucket m.(idbuckets) **
    store_dll (store_idnode m.(storeA))
      (htable + (id mod m.(hoffset)) * sizeof("SysDoubleLinklistNode"))
      (prefix ++ {| getData := id; getPtr := &(idnode # "IdNode" ->ₛ "link") |} :: suffix).

Definition store_idmanager_removeobj_post (m: idmanager) (manager idnode: addr) (id: Z): Assertion :=
  store_idmanager (idmanager_remove m id) manager **
  store_idnode m.(storeA) &(idnode # "IdNode" ->ₛ "link") id **
  &(idnode # "IdNode" ->ₛ "link" .ₛ "node_prev") # Ptr |->_ **
  &(idnode # "IdNode" ->ₛ "link" .ₛ "node_next") # Ptr |->_.

Definition store_idmanager_getobj_post (m: idmanager) (manager: addr) (id ret: Z): Assertion :=
  “ idmanager_getobj_ret m id ret ” &&
  store_idmanager m manager.

Lemma Znth_In_Zlength:
  forall {A: Type} (l: list A) (d: A) (i: Z),
    0 <= i < Zlength l ->
    In (Znth i l d) l.
Proof.
  intros A l d i Hrange.
  unfold Znth.
  apply nth_In.
  apply Nat2Z.inj_lt.
  rewrite Z2Nat.id by lia.
  rewrite <- Zlength_correct.
  lia.
Qed.

Lemma idbuckets_index_ok_Znth:
  forall hoffset start buckets index,
    0 <= index < Zlength buckets ->
    idbuckets_index_ok hoffset start buckets ->
    Forall (fun id => id mod hoffset = start + index)
      (Znth index buckets nil).
Proof.
  intros hoffset start buckets; revert start.
  induction buckets as [| b bs IH]; intros start index Hrange Hidx; simpl in *.
  - rewrite Zlength_nil in Hrange; lia.
  - destruct (Z.eq_dec index 0) as [H0 | Hn0].
    + subst index. destruct Hidx as [Hhead _].
      replace (start + 0) with start by lia. exact Hhead.
    + destruct Hidx as [_ Htail].
      rewrite Znth_cons by lia.
      replace (start + index) with (start + 1 + (index - 1)) by lia.
      apply IH; [rewrite Zlength_cons in Hrange; lia | exact Htail].
Qed.

Lemma idbuckets_index_ok_in_range:
  forall hoffset start buckets id,
    idbuckets_index_ok hoffset start buckets ->
    In id (concat buckets) ->
    start <= id mod hoffset < start + Zlength buckets.
Proof.
  intros hoffset start buckets; revert start.
  induction buckets as [| bucket buckets IH]; intros start id Hidx Hin.
  - simpl in Hin. contradiction.
  - simpl in Hidx, Hin.
    rewrite in_app_iff in Hin.
    destruct Hidx as [Hhead Htail].
    destruct Hin as [Hin | Hin].
    + apply Forall_forall with (x := id) in Hhead; auto.
      pose proof (Zlength_nonneg buckets).
      rewrite Zlength_cons. lia.
    + specialize (IH (start + 1) id Htail Hin).
      rewrite Zlength_cons. lia.
Qed.

Lemma idbuckets_index_ok_member_Znth:
  forall hoffset start buckets id,
    idbuckets_index_ok hoffset start buckets ->
    start <= id mod hoffset < start + Zlength buckets ->
    In id (concat buckets) ->
    In id (Znth (id mod hoffset - start) buckets nil).
Proof.
  intros hoffset start buckets; revert start.
  induction buckets as [| bucket buckets IH]; intros start id Hidx Hrange Hin.
  - simpl in Hin. contradiction.
  - simpl in Hidx, Hin.
    rewrite in_app_iff in Hin.
    destruct Hidx as [Hhead Htail].
    destruct Hin as [Hin | Hin].
    + apply Forall_forall with (x := id) in Hhead; auto.
      replace (id mod hoffset - start) with 0 by lia.
      simpl. exact Hin.
    + pose proof (idbuckets_index_ok_in_range hoffset (start + 1) buckets id Htail Hin)
        as Htail_range.
      assert (0 < id mod hoffset - start) by lia.
      rewrite Znth_cons by lia.
      replace (id mod hoffset - start - 1) with
        (id mod hoffset - (start + 1)) by lia.
      eapply IH; eauto.
Qed.

Lemma idbuckets_ok_id_in_bucket:
  forall idmax hoffset ids buckets id,
    idbuckets_ok idmax hoffset ids buckets ->
    0 <= id < idmax ->
    In id ids ->
    In id (Znth (id mod hoffset) buckets nil).
Proof.
  intros idmax hoffset ids buckets id Hok Hid Hin.
  destruct Hok as [Hhoff [Hlen [_ [_ [Hidx Hperm]]]]].
  replace (id mod hoffset) with (id mod hoffset - 0) by lia.
  apply idbuckets_index_ok_member_Znth with (start := 0); auto.
  - rewrite Hlen.
    pose proof (Z.mod_pos_bound id hoffset Hhoff).
    lia.
  - eapply Permutation_in.
    + apply Permutation_sym. exact Hperm.
    + exact Hin.
Qed.

Lemma idmanager_query_true_from_bucket:
  forall m id bucket,
    0 <= id < m.(idmax) ->
    idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ->
    bucket = Znth (id mod m.(hoffset)) m.(idbuckets) nil ->
    In id bucket ->
    idmanager_query m id = true.
Proof.
  intros m id bucket Hid Hok Hbucket Hin.
  unfold idmanager_query.
  apply id_in_ids_true_iff.
  destruct Hok as [Hhoff [Hlen [_ [_ [_ Hperm]]]]].
  eapply Permutation_in.
  - exact Hperm.
  - apply in_concat.
    exists bucket.
    split; auto.
    subst bucket.
    apply Znth_In_Zlength.
    rewrite Hlen.
    apply Z.mod_pos_bound; auto.
Qed.

Lemma idmanager_query_false_from_bucket:
  forall m id bucket,
    0 <= id < m.(idmax) ->
    idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ->
    bucket = Znth (id mod m.(hoffset)) m.(idbuckets) nil ->
    ~ In id bucket ->
    idmanager_query m id = false.
Proof.
  intros m id bucket Hid Hok Hbucket Hnotin.
  unfold idmanager_query.
  apply id_in_ids_false_iff.
  intros Hin.
  apply Hnotin.
  rewrite Hbucket.
  eapply idbuckets_ok_id_in_bucket; eauto.
Qed.

Lemma idbuckets_index_ok_replace:
  forall hoffset start buckets index ids,
    0 <= index < Zlength buckets ->
    idbuckets_index_ok hoffset start buckets ->
    Forall (fun id => id mod hoffset = start + index) ids ->
    idbuckets_index_ok hoffset start (replace_Znth index ids buckets).
Proof.
  intros hoffset start buckets; revert start.
  induction buckets as [| b bs IH]; intros start index ids Hrange Hidx Hids; simpl in *.
  - rewrite Zlength_nil in Hrange; lia.
  - destruct (Z.eq_dec index 0) as [H0 | Hn0].
    + subst index. simpl.
      replace (start + 0) with start in Hids by lia.
      split; [exact Hids | destruct Hidx as [_ Htail]; exact Htail].
    + rewrite replace_Znth_cons by lia. simpl.
      destruct Hidx as [Hhead Htail].
      split; [exact Hhead |].
      apply IH; [rewrite Zlength_cons in Hrange; lia | exact Htail |].
      replace (start + index) with (start + 1 + (index - 1)) in Hids by lia.
      exact Hids.
Qed.

Lemma concat_replace_Znth_cons_perm:
  forall (index id: Z) (buckets: list (list Z)),
    0 <= index < Zlength buckets ->
    Permutation
      (concat (replace_Znth index (id :: Znth index buckets nil) buckets))
      (id :: concat buckets).
Proof.
  intros index id buckets; revert index.
  induction buckets as [| b bs IH]; intros index Hrange; simpl in *.
  - rewrite Zlength_nil in Hrange; lia.
  - destruct (Z.eq_dec index 0) as [H0 | Hn0].
    + subst index. simpl. reflexivity.
    + rewrite replace_Znth_cons by lia.
      rewrite Znth_cons by lia.
      simpl.
      eapply Permutation_trans.
      * apply Permutation_app_head.
        apply IH. rewrite Zlength_cons in Hrange; lia.
      * symmetry. apply Permutation_middle.
Qed.

Lemma idbuckets_ok_insert:
  forall (m: idmanager) id,
    idmanager_min_free_id m id ->
    idbuckets_ok m.(idmax) m.(hoffset) m.(idlist) m.(idbuckets) ->
    idbuckets_ok m.(idmax) m.(hoffset)
      (idlist_add id m.(idlist))
      (idmanager_insert_bucket m.(hoffset) id m.(idbuckets)).
Proof.
  intros m id Hmin Hok.
  unfold idbuckets_ok in *.
  destruct Hok as [Hhoff [Hlen [Hids [Hbuckets [Hindex Hperm]]]]].
  unfold idmanager_min_free_id in Hmin.
  destruct Hmin as [Hid_range [Hfree _]].
  assert (Hnotin_ids: ~ In id m.(idlist)).
  { apply id_in_ids_false_iff.
    unfold idmanager_query in Hfree.
    exact Hfree. }
  assert (Hidx_range: 0 <= id mod m.(hoffset) < Zlength m.(idbuckets)).
  { rewrite Hlen. apply Z.mod_pos_bound. lia. }
  unfold idmanager_insert_bucket.
  split; [exact Hhoff |].
  split; [rewrite Zlength_replace_Znth; exact Hlen |].
  split.
  - unfold idlist_ok in *.
    destruct Hids as [Hids_range Hids_nodup].
    split.
    + unfold idlist_add. constructor; auto.
    + unfold idlist_add. constructor; auto.
  - split.
    + apply Forall_replace_Znth; auto.
      pose proof (Forall_Znth_Zlength (idlist_ok m.(idmax)) m.(idbuckets)
        nil (id mod m.(hoffset)) Hbuckets Hidx_range) as Hold.
      unfold idlist_ok in *.
      destruct Hold as [Hold_range Hold_nodup].
      split.
      * constructor; auto.
      * constructor; auto.
        intro Hin.
        apply Hnotin_ids.
        apply (Permutation_in id Hperm).
        apply in_concat.
        exists (Znth (id mod m.(hoffset)) m.(idbuckets) nil).
        split; auto.
        apply Znth_In_Zlength. exact Hidx_range.
    + split.
      * apply idbuckets_index_ok_replace; auto.
        constructor.
        -- lia.
        -- eapply Forall_impl.
           ++ intros x Hx. exact Hx.
           ++ apply idbuckets_index_ok_Znth; auto.
      * eapply Permutation_trans.
        -- apply concat_replace_Znth_cons_perm. exact Hidx_range.
        -- apply perm_skip. exact Hperm.
Qed.

Lemma store_idbucket_list_app:
  forall (node_storeA: addr -> Z -> Prop) (htable start: Z)
         (l1 l2: list (list Z)),
    store_idbucket_list node_storeA htable start l1 **
    store_idbucket_list node_storeA htable (start + Zlength l1) l2 |--
    store_idbucket_list node_storeA htable start (l1 ++ l2).
Proof.
  intros node_storeA htable start l1; revert start.
  induction l1 as [| b bs IH]; intros start l2; simpl.
  - rewrite Zlength_nil.
    replace (start + 0) with start by lia.
    entailer!.
  - rewrite Zlength_cons.
    replace (start + Z.succ (Zlength bs)) with (start + 1 + Zlength bs) by lia.
    sep_apply (IH (start + 1) l2).
    entailer!.
Qed.

Lemma store_idbucket_list_cons_dll:
  forall (node_storeA: addr -> Z -> Prop) (htable start: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)) (id link: Z),
    map getData nodes = bucket ->
    store_idbucket_list node_storeA htable (start + 1) buckets **
    store_dll (store_idnode node_storeA)
      (htable + start * sizeof("SysDoubleLinklistNode"))
      ({| getData := id; getPtr := link |} :: nodes) |--
    store_idbucket_list node_storeA htable start ((id :: bucket) :: buckets).
Proof.
  intros node_storeA htable start bucket buckets nodes id link Hnodes.
  simpl.
  unfold store_idbucket, store_idnodes.
  Exists ({| getData := id; getPtr := link |} :: nodes).
  simpl.
  entailer!.
  rewrite Hnodes. reflexivity.
Qed.

Lemma store_idbucket_list_bucket_dll:
  forall (node_storeA: addr -> Z -> Prop) (htable start: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)),
    map getData nodes = bucket ->
    store_idbucket_list node_storeA htable (start + 1) buckets **
    store_dll (store_idnode node_storeA)
      (htable + start * sizeof("SysDoubleLinklistNode")) nodes |--
    store_idbucket_list node_storeA htable start (bucket :: buckets).
Proof.
  intros node_storeA htable start bucket buckets nodes Hnodes.
  simpl.
  unfold store_idbucket, store_idnodes.
  destruct bucket.
  - Left. Exists nodes. entailer!.
  - Exists nodes. entailer!.
Qed.

Lemma store_idbucket_list_bucket_dllseg:
  forall (node_storeA: addr -> Z -> Prop) (htable start: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)) (first last: Z),
    map getData nodes = bucket ->
    store_idbucket_list node_storeA htable (start + 1) buckets **
    &(((htable + start * sizeof("SysDoubleLinklistNode"))) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    &(((htable + start * sizeof("SysDoubleLinklistNode"))) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    dllseg (store_idnode node_storeA) first
      (htable + start * sizeof("SysDoubleLinklistNode"))
      (htable + start * sizeof("SysDoubleLinklistNode")) last nodes |--
    store_idbucket_list node_storeA htable start (bucket :: buckets).
Proof.
  intros node_storeA htable start bucket buckets nodes first last Hnodes.
  simpl.
  unfold store_idbucket, store_idnodes, store_dll.
  destruct bucket.
  - Left. Exists nodes first last. entailer!.
  - Exists nodes first last. entailer!.
Qed.

Lemma store_idbucket_cases:
  forall (node_storeA: addr -> Z -> Prop) (head: addr) (bucket: list Z),
    store_idbucket node_storeA head bucket |--
    (“ bucket = nil ” &&
     &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> 0 **
     &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> 0) ||
    (EX nodes: list (DL_Node Z), EX prev next: addr,
      “ map getData nodes = bucket /\ prev <> 0 /\ next <> 0 ” &&
      &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
      &(head # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
      dllseg (store_idnode node_storeA) next head head prev nodes).
Proof.
  intros node_storeA head bucket.
  destruct bucket as [| x xs]; simpl;
    unfold store_idnodes, store_uninit_idbucket.
  - apply derivable1_orp_elim.
    + Intros nodes.
      sep_apply (@store_dll_head_prev_next_nonzero Z).
      Intros h pt.
      Right.
      Exists nodes pt h.
      entailer!.
    + Left.
      entailer!.
  - Intros nodes.
    sep_apply (@store_dll_head_prev_next_nonzero Z).
    Intros h pt.
    Right.
    Exists nodes pt h.
    entailer!.
Qed.

Lemma store_idbucket_list_split:
  forall (node_storeA: addr -> Z -> Prop) (htable start index: Z)
         (buckets: list (list Z)),
    0 <= index < Zlength buckets ->
    store_idbucket_list node_storeA htable start buckets |--
    EX bucket: list Z, EX prefix suffix: list (list Z),
      “ bucket = Znth index buckets nil /\
        buckets = prefix ++ bucket :: suffix /\
        Zlength prefix = index ” &&
      store_idbucket node_storeA
        (htable + (start + index) * sizeof("SysDoubleLinklistNode")) bucket **
      store_idbucket_list node_storeA htable start prefix **
      store_idbucket_list node_storeA htable (start + index + 1) suffix.
Proof.
  intros node_storeA htable start index buckets Hrange.
  revert start index Hrange.
  induction buckets as [| b bs IH]; intros start index Hrange.
  - unfold CRules.derivable1. intros m Hm.
    rewrite Zlength_nil in Hrange. lia.
  - destruct (Z.eq_dec index 0) as [Hidx | Hidx].
    + subst index. simpl.
      Exists b (@nil (list Z)) bs.
      replace (start + 0) with start by lia.
      replace (start + 0 + 1) with (start + 1) by lia.
      entailer!.
    + assert (0 <= index - 1 < Zlength bs) as Htail
        by (rewrite Zlength_cons in Hrange; lia).
      specialize (IH (start + 1) (index - 1) Htail).
      simpl. sep_apply IH. Intros bucket prefix suffix.
      Exists bucket (b :: prefix) suffix.
      simpl.
      replace (Zlength prefix + 1) with (1 + Zlength prefix) by lia.
      replace (start + index) with (start + 1 + (index - 1)) by lia.
      replace (start + index + 1) with (start + 1 + (index - 1) + 1) by lia.
      entailer!.
      all: destruct H as [Hz [Happ Hlen]].
      all: try (rewrite Znth_cons by lia; exact Hz).
      all: try (rewrite Happ; reflexivity).
      all: try (rewrite Zlength_cons; lia).
Qed.

Lemma store_idbuckets_split:
  forall (node_storeA: addr -> Z -> Prop) (htable hoffset index: Z)
         (buckets: list (list Z)),
    0 <= index < Zlength buckets ->
    store_idbuckets node_storeA htable hoffset buckets |--
    EX bucket: list Z,
      “ bucket = Znth index buckets nil ” &&
      store_idbucket node_storeA
        (htable + index * sizeof("SysDoubleLinklistNode")) bucket **
      store_idbuckets_except node_storeA htable index bucket buckets.
Proof.
  intros node_storeA htable hoffset index buckets Hrange.
  unfold store_idbuckets.
  sep_apply (store_idbucket_list_split node_storeA htable 0 index buckets Hrange).
  Intros bucket prefix suffix.
  Exists bucket.
  unfold store_idbuckets_except.
  Exists prefix suffix.
  replace (0 + index) with index by lia.
  replace (0 + index + 1) with (index + 1) by lia.
  entailer!.
Qed.

Lemma store_idbuckets_insert:
  forall (node_storeA: addr -> Z -> Prop) (htable hoffset index: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)) (id link: Z),
    0 <= index ->
    bucket = Znth index buckets nil ->
    map getData nodes = bucket ->
    store_idbuckets_except node_storeA htable index bucket buckets **
    store_dll (store_idnode node_storeA)
      (htable + index * sizeof("SysDoubleLinklistNode"))
      ({| getData := id; getPtr := link |} :: nodes) |--
    store_idbuckets node_storeA htable hoffset
      (replace_Znth index (id :: Znth index buckets nil) buckets).
Proof.
  intros node_storeA htable hoffset index bucket buckets nodes id link
    Hindex Hbucket Hnodes.
  unfold store_idbuckets_except, store_idbuckets.
  Intros prefix suffix.
  destruct H as [Hbuckets Hprefix].
  rewrite <- Hbucket.
  rewrite Hbuckets.
  rewrite replace_Znth_app_r by lia.
  rewrite replace_Znth_nothing by lia.
  replace (index - Zlength prefix) with 0 by lia.
  simpl.
  sep_apply (store_idbucket_list_cons_dll node_storeA htable index
    bucket suffix nodes id link Hnodes).
  replace index with (0 + Zlength prefix) by lia.
  sep_apply (store_idbucket_list_app node_storeA htable 0 prefix
    ((id :: bucket) :: suffix)).
  entailer!.
Qed.

Lemma store_idbuckets_replace:
  forall (node_storeA: addr -> Z -> Prop) (htable hoffset index: Z)
         (bucket new_bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)),
    0 <= index ->
    bucket = Znth index buckets nil ->
    map getData nodes = new_bucket ->
    store_idbuckets_except node_storeA htable index bucket buckets **
    store_dll (store_idnode node_storeA)
      (htable + index * sizeof("SysDoubleLinklistNode")) nodes |--
    store_idbuckets node_storeA htable hoffset
      (replace_Znth index new_bucket buckets).
Proof.
  intros node_storeA htable hoffset index bucket new_bucket buckets nodes
    Hindex Hbucket Hnodes.
  unfold store_idbuckets_except, store_idbuckets.
  Intros prefix suffix.
  destruct H as [Hbuckets Hprefix].
  rewrite Hbuckets.
  rewrite replace_Znth_app_r by lia.
  rewrite replace_Znth_nothing by lia.
  replace (index - Zlength prefix) with 0 by lia.
  simpl.
  sep_apply (store_idbucket_list_bucket_dll node_storeA htable index
    new_bucket suffix nodes Hnodes).
  replace index with (0 + Zlength prefix) by lia.
  sep_apply (store_idbucket_list_app node_storeA htable 0 prefix
    (new_bucket :: suffix)).
  entailer!.
Qed.

Lemma store_idbuckets_merge:
  forall (node_storeA: addr -> Z -> Prop) (htable hoffset index: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)),
    0 <= index ->
    bucket = Znth index buckets nil ->
    map getData nodes = bucket ->
    store_idbuckets_except node_storeA htable index bucket buckets **
    store_dll (store_idnode node_storeA)
      (htable + index * sizeof("SysDoubleLinklistNode")) nodes |--
    store_idbuckets node_storeA htable hoffset buckets.
Proof.
  intros node_storeA htable hoffset index bucket buckets nodes
    Hindex Hbucket Hnodes.
  sep_apply (store_idbuckets_replace node_storeA htable hoffset index
    bucket bucket buckets nodes Hindex Hbucket Hnodes).
  rewrite Hbucket.
  rewrite replace_Znth_Znth.
  entailer!.
Qed.

Lemma store_idbuckets_merge_dllseg:
  forall (node_storeA: addr -> Z -> Prop) (htable hoffset index: Z)
         (bucket: list Z) (buckets: list (list Z))
         (nodes: list (DL_Node Z)) (first last: Z),
    0 <= index ->
    bucket = Znth index buckets nil ->
    map getData nodes = bucket ->
    store_idbuckets_except node_storeA htable index bucket buckets **
    &(((htable + index * sizeof("SysDoubleLinklistNode"))) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    &(((htable + index * sizeof("SysDoubleLinklistNode"))) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    dllseg (store_idnode node_storeA) first
      (htable + index * sizeof("SysDoubleLinklistNode"))
      (htable + index * sizeof("SysDoubleLinklistNode")) last nodes |--
    store_idbuckets node_storeA htable hoffset buckets.
Proof.
  intros node_storeA htable hoffset index bucket buckets nodes first last
    Hindex Hbucket Hnodes.
  unfold store_idbuckets_except, store_idbuckets.
  Intros prefix suffix.
  destruct H as [Hbuckets Hprefix].
  rewrite Hbuckets.
  replace (0 + Zlength prefix) with index by lia.
  sep_apply (store_idbucket_list_bucket_dllseg node_storeA htable index
    bucket suffix nodes first last Hnodes).
  replace index with (0 + Zlength prefix) by lia.
  sep_apply (store_idbucket_list_app node_storeA htable 0 prefix
    (bucket :: suffix)).
  entailer!.
Qed.

Lemma dllseg_exit_suffix_nil:
  forall (node_storeA: addr -> Z -> Prop) (head prev last: Z)
         (suffix: list (DL_Node Z)),
    &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    dllseg (store_idnode node_storeA) head prev head last suffix |--
    “ suffix = nil ” &&
    &(head # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last **
    dllseg (store_idnode node_storeA) head prev head last suffix.
Proof.
  intros node_storeA head prev last suffix.
  destruct suffix as [| a suffix].
  - simpl. entailer!.
  - simpl.
    Intros next.
    sep_apply (dup_store_ptr (&(head # "SysDoubleLinklistNode" ->ₛ "node_prev")) last prev).
    entailer!.
Qed.

End IDNode.
