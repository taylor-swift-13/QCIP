From QCIPCases.SAMCodeSynthesis.SendUartData Require Import IP_SendUartData_goal IP_SendUartData_proof_auto IP_SendUartData_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_SendUartData_proof_auto.
  Include IP_SendUartData_proof_manual.
End VC_Correctness.
