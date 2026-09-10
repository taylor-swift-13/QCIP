Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

Import ListNotations.
Import CRules.
Local Open Scope Z_scope.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.

Fixpoint xizi_dll_remove_first (node : Z) (nodes : list Z) : list Z :=
  match nodes with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current node
      then suffix
      else current :: xizi_dll_remove_first node suffix
  end.

Lemma xizi_dll_remove_first_split__spec_derivations_direct :
  forall (node : Z) (nodes : list Z),
    In node nodes ->
    exists prefix suffix,
      nodes = prefix ++ node :: suffix /\
      ~ In node prefix /\
      xizi_dll_remove_first node nodes = prefix ++ suffix.
Proof.
  intros node nodes.
  induction nodes as [| current tail IH].
  - simpl. tauto.
  - intros Hin.
    simpl in Hin.
    destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current.
      exists nil, tail.
      split; [reflexivity |].
      split; [simpl; tauto |].
      simpl.
      destruct (Z.eq_dec node node); [reflexivity | contradiction].
    + destruct Hin as [Heq | Hin]; [congruence |].
      destruct (IH Hin) as (prefix & suffix & Hnodes & Hnotin & Hremove).
      exists (current :: prefix), suffix.
      split.
      * simpl. rewrite Hnodes. reflexivity.
      * split.
        -- simpl. intros [Heq | Hmember].
           ++ congruence.
           ++ contradiction.
        -- simpl. destruct (Z.eq_dec current node); [contradiction |].
           rewrite Hremove. reflexivity.
Qed.

(** Pure projections retain the existing address-level removal operation. *)
Definition xizi_dll_ptrs {A : Type} (nodes : list (DLL.DL_Node A)) : list Z :=
  map DLL.getPtr nodes.

(** The payload frame is kept in the same logical order as the list. *)
Definition xizi_dll_payloads {A : Type} (storeA : addr -> A -> Assertion)
  (nodes : list (DLL.DL_Node A)) : Assertion :=
  fold_right (fun a P => storeA (DLL.getPtr a)
                               (DLL.getData a) ** P) emp nodes.

(** Removing exactly one logical node preserves every other datum and its
    ordering, and refines the previously verified address-level operation. *)
Definition xizi_dll_remove_node_rel {A : Type}
  (removed : DLL.DL_Node A)
  (nodes remaining : list (DLL.DL_Node A)) : Prop :=
  (exists prefix suffix,
     nodes = prefix ++ removed :: suffix /\ remaining = prefix ++ suffix) /\
  xizi_dll_ptrs remaining =
    xizi_dll_remove_first (DLL.getPtr removed) (xizi_dll_ptrs nodes).

Lemma first_split__storeA_remove : forall {A} p (xs : list (DLL.DL_Node A)),
 In p (xizi_dll_ptrs xs) -> exists pre a suf,
 xs = pre ++ a :: suf /\ DLL.getPtr a = p /\
 xizi_dll_ptrs (pre ++ suf) = xizi_dll_remove_first p (xizi_dll_ptrs xs).
Proof.
 intros A p xs; induction xs as [|a xs IH]; intro Hin.
 - simpl in Hin; contradiction.
 - unfold xizi_dll_ptrs in *; simpl in *.
   destruct (Z.eq_dec (DLL.getPtr a) p) as [Heq|Hneq].
   + exists nil, a, xs. simpl. repeat split; auto.
   + destruct Hin as [Hbad|Hin]; [contradiction|].
     destruct (IH Hin) as (pre & b & suf & Hxs & Hb & Hr).
     exists (a::pre), b, suf. simpl. repeat split; auto.
     * rewrite Hxs; reflexivity.
     * rewrite Hr; reflexivity.
Qed.
