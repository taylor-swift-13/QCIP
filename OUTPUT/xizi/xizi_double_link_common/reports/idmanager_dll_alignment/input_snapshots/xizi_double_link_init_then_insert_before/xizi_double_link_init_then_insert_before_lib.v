Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source
  Require Export xizi_double_link_insert_before_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.
Local Open Scope Z_scope.

(** The composition uses the accepted insertion relation and address operation
    directly, keeping the member, dispatch, and sentinel contracts identical. *)
Lemma xizi_insert_before_absent_append__dispatch_case_derivations :
  forall nodes anchor inserted,
    ~ In anchor nodes ->
    xizi_double_link_insert_before_nodes nodes anchor inserted =
      nodes ++ inserted :: nil.
Proof.
  induction nodes as [| current suffix IH]; intros anchor inserted Hnotin.
  - reflexivity.
  - simpl in Hnotin |- *.
    destruct (Z.eq_dec current anchor) as [Heq | Hneq].
    + subst current. exfalso. apply Hnotin. left. reflexivity.
    + f_equal. apply IH. intros Hin. apply Hnotin. right. exact Hin.
Qed.
