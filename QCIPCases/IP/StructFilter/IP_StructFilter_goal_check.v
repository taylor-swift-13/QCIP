From QCIPCases.IP.StructFilter Require Import IP_StructFilter_goal IP_StructFilter_proof_auto IP_StructFilter_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_StructFilter_proof_auto.
  Include IP_StructFilter_proof_manual.
End VC_Correctness.
