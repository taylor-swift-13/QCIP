From QCIPCases.SAMCodeSynthesis.UartInit Require Import IP_UartInit_goal IP_UartInit_proof_auto IP_UartInit_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_UartInit_proof_auto.
  Include IP_UartInit_proof_manual.
End VC_Correctness.
