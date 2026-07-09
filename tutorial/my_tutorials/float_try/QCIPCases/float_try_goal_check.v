From MyTutorial Require Import float_try_goal float_try_proof_auto float_try_proof_manual.

Module VC_Correctness : VC_Correct.
  Include float_try_proof_auto.
  Include float_try_proof_manual.
End VC_Correctness.
