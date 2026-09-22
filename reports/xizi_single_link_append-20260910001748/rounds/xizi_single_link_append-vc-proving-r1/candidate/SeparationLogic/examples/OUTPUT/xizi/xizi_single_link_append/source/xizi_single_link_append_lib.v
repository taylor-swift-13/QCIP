Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.

Import ListNotations.
Import SetsNotation.
Import naive_C_Rules.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope sac.
Local Open Scope Z_scope.

Lemma payloads_append_singleton__append_payload :
  forall A (storeA : Z -> A -> Assertion) l data p,
  xizi_sll_remove_payloads storeA l ** storeA p data |--
  xizi_sll_remove_payloads storeA (l ++ [Build_sll_payload_node data p]).
Proof.
  intros A storeA l; induction l as [|n l IH]; intros data p.
  - unfold xizi_sll_remove_payloads; simpl. entailer!.
  - unfold xizi_sll_remove_payloads in *; simpl in *.
    sep_apply (IH data p). entailer!.
Qed.
