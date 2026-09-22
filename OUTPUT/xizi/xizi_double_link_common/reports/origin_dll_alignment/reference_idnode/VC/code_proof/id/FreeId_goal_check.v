From CRTOS_Verify.VC.code.id Require Import FreeId_goal FreeId_proof_auto FreeId_proof_manual.

Module VC_Correctness : VC_Correct.
  Include FreeId_proof_auto.
  Include FreeId_proof_manual.
End VC_Correctness.
