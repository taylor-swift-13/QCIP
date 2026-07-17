From QCIPCases.SAMCodeSynthesis.JetCtrlSend Require Import IP_JetCtrlSend_goal IP_JetCtrlSend_proof_auto IP_JetCtrlSend_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_JetCtrlSend_proof_auto.
  Include IP_JetCtrlSend_proof_manual.
End VC_Correctness.
