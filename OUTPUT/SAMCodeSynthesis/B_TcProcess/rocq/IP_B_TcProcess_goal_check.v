From QCIPCases.SAMCodeSynthesis.B_TcProcess Require Import IP_B_TcProcess_goal IP_B_TcProcess_proof_auto IP_B_TcProcess_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_B_TcProcess_proof_auto.
  Include IP_B_TcProcess_proof_manual.
End VC_Correctness.
