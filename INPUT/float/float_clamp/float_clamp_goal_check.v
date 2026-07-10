From MyTutorial Require Import float_clamp_goal float_clamp_proof_auto float_clamp_proof_manual.

Module VC_Correctness : VC_Correct.
  Include float_clamp_proof_auto.
  Include float_clamp_proof_manual.
End VC_Correctness.
