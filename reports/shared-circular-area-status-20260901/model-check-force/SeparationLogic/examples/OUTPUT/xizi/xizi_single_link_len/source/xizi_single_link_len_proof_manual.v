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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_len.source Require Import xizi_single_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_len.source Require Import xizi_single_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetLen_entail_wit_1 : SingleLinkListGetLen_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists l.
  entailer!.
Qed.

Lemma proof_of_SingleLinkListGetLen_entail_wit_2 : SingleLinkListGetLen_entail_wit_2.
Proof.
  aggressive_pre_process.
  assert (Hbound_resource :
    (&(tmp_list # "SingleLinklistNode" ->ₛ "node_next") # Ptr |-> q) **
    xizi_sll q l0 **
    xizi_sllseg first_2 tmp_list l1_2 |--
    “ Zlength (l1_2 ++ tmp_list :: l0) <=
      Int.max_unsigned / 4 + 1 ”).
  {
    transitivity
      (xizi_sllseg first_2 tmp_list l1_2 **
       (&(tmp_list # "SingleLinklistNode" ->ₛ "node_next") # Ptr |-> q) **
       xizi_sll q l0).
    - cancel (xizi_sllseg first_2 tmp_list l1_2).
      cancel
        (&(tmp_list # "SingleLinklistNode" ->ₛ "node_next") # Ptr |-> q).
      cancel (xizi_sll q l0).
    - exact
        (xizi_sllseg_node_sll_length_max
          first_2 tmp_list q l1_2 l0 PreH2).
  }
  prop_apply_p Hbound_resource.
  Intros_p Hbound.
  assert (Hbits : 0 <= length + 1 < 2 ^ 32).
  {
    rewrite PreH4.
    rewrite Zlength_app, Zlength_cons in Hbound.
    change
      (Zlength l1_2 + (Zlength l0 + 1) <= 1073741824)
      in Hbound.
    change (0 <= Zlength l1_2 + 1 < 4294967296).
    pose proof (Zlength_nonneg l1_2).
    pose proof (Zlength_nonneg l0).
    lia.
  }
  rewrite (unsigned_last_nbits_eq (length + 1) 32 Hbits).
  Exists (l1_2 ++ tmp_list :: nil) l0.
  sep_apply_l_atomic (xizi_sllseg_len1 tmp_list q PreH2).
  sep_apply_l_atomic
    (xizi_sllseg_sllseg
      first_2 tmp_list q l1_2 (tmp_list :: nil)).
  entailer!.
  - rewrite PreH4, Zlength_app, Zlength_cons, Zlength_nil.
    lia.
  - rewrite PreH3, PreH1.
    rewrite <- app_assoc.
    reflexivity.
Qed.

Lemma proof_of_SingleLinkListGetLen_return_wit_1 : SingleLinkListGetLen_return_wit_1.
Proof.
  aggressive_pre_process.
  subst tmp_list.
  sep_apply_l_atomic (xizi_sll_zero 0 l2 eq_refl).
  Intros_p Hnil.
  subst l2.
  rewrite app_nil_r in PreH2.
  subst l.
  sep_apply_l_atomic (xizi_sllseg_0_sll first l1).
  entailer!.
  sep_apply_l_atomic (xizi_sll_zero tmp_list l2 PreH1).
  Intros_p Hnil_again.
  dump_pre_spatial.
  subst l2.
  rewrite app_nil_r in PreH2.
  subst l.
  exact PreH3.
Qed.
