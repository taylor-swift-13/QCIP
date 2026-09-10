From CRTOS_Verify.VC.code.id Require Import GetObj_goal GetObj_proof_auto GetObj_proof_manual.

Module VC_Correctness : VC_Correct.
  Include GetObj_proof_auto.
  Include GetObj_proof_manual.
End VC_Correctness.
