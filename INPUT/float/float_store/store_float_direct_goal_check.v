From FloatStore Require Import store_float_direct_goal store_float_direct_proof_auto store_float_direct_proof_manual.

Module VC_Correctness : VC_Correct.
  Include store_float_direct_proof_auto.
  Include store_float_direct_proof_manual.
End VC_Correctness.
