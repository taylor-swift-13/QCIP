From QCIPCases.idmanager_compat.VC.code.id Require Import RemoveObj_goal RemoveObj_proof_auto RemoveObj_proof_manual.

Module VC_Correctness : VC_Correct.
  Include RemoveObj_proof_auto.
  Include RemoveObj_proof_manual.
End VC_Correctness.
