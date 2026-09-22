From QCIPCases.SAMCodeSynthesis.CheckCal08 Require Import IP_CheckCal08_goal IP_CheckCal08_proof_auto IP_CheckCal08_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_CheckCal08_proof_auto.
  Include IP_CheckCal08_proof_manual.
End VC_Correctness.
