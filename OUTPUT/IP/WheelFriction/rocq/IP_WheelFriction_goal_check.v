From SimpleC.EE.LLM_bench.Engineering.WheelFriction Require Import IP_WheelFriction_goal IP_WheelFriction_proof_auto IP_WheelFriction_proof_manual.

Module VC_Correctness : VC_Correct.
  Include IP_WheelFriction_proof_auto.
  Include IP_WheelFriction_proof_manual.
End VC_Correctness.
