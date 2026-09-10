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
From CRTOS_Verify.VC.code.id Require Import InsertObj_goal.
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
Require Import SL.ConAssertion SL.CriticalSTS SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import CRTOS_Verify.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

Lemma proof_of_InsertObj_safety_wit_2_linked_bucket : InsertObj_safety_wit_2_linked_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_safety_wit_3_empty_bucket : InsertObj_safety_wit_3_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_safety_wit_4_linked_bucket : InsertObj_safety_wit_4_linked_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_safety_wit_5_empty_bucket : InsertObj_safety_wit_5_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_entail_wit_3_linked_bucket : InsertObj_entail_wit_3_linked_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_entail_wit_4_empty_bucket : InsertObj_entail_wit_4_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_return_wit_1_empty_bucket : InsertObj_return_wit_1_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_return_wit_2_linked_bucket : InsertObj_return_wit_2_linked_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_1 : InsertObj_partial_solve_wit_1.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_2_pure : InsertObj_partial_solve_wit_2_pure.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_2 : InsertObj_partial_solve_wit_2.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_3_empty_bucket : InsertObj_partial_solve_wit_3_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_4_empty_bucket_pure : InsertObj_partial_solve_wit_4_empty_bucket_pure.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_4_empty_bucket : InsertObj_partial_solve_wit_4_empty_bucket.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_5_linked_bucket_pure : InsertObj_partial_solve_wit_5_linked_bucket_pure.
Proof. Admitted. 

Lemma proof_of_InsertObj_partial_solve_wit_5_linked_bucket : InsertObj_partial_solve_wit_5_linked_bucket.
Proof. Admitted. 

