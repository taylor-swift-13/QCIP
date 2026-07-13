From MyTutorial Require Import float_one_goal float_one_proof_auto float_one_proof_manual.

Module VC_Correctness : VC_Correct.
  Include float_one_proof_auto.
  Include float_one_proof_manual.
End VC_Correctness.
