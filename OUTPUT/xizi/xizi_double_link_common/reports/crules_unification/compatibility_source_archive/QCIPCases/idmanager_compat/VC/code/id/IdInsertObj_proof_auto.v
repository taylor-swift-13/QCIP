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
From QCIPCases.idmanager_compat.VC.code.id Require Import IdInsertObj_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import QCIPCases.idmanager_compat.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

Lemma proof_of_IdInsertObj_safety_wit_1 : IdInsertObj_safety_wit_1.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_2_alloc_failed : IdInsertObj_safety_wit_2_alloc_failed.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_3_alloc_succeeded : IdInsertObj_safety_wit_3_alloc_succeeded.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_4_alloc_failed : IdInsertObj_safety_wit_4_alloc_failed.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_5_alloc_succeeded : IdInsertObj_safety_wit_5_alloc_succeeded.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_6_alloc_failed : IdInsertObj_safety_wit_6_alloc_failed.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_safety_wit_7_alloc_failed : IdInsertObj_safety_wit_7_alloc_failed.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_partial_solve_wit_1 : IdInsertObj_partial_solve_wit_1.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_partial_solve_wit_2 : IdInsertObj_partial_solve_wit_2.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure : IdInsertObj_partial_solve_wit_3_alloc_succeeded_pure.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_partial_solve_wit_3_alloc_succeeded : IdInsertObj_partial_solve_wit_3_alloc_succeeded.
Proof. Admitted. 

Lemma proof_of_IdInsertObj_partial_solve_wit_4_alloc_succeeded : IdInsertObj_partial_solve_wit_4_alloc_succeeded.
Proof. Admitted. 

