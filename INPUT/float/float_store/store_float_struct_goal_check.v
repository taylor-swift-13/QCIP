From FloatStore Require Import store_float_struct_goal store_float_struct_proof_auto store_float_struct_proof_manual.

Module VC_Correctness : VC_Correct.
  Include store_float_struct_proof_auto.
  Include store_float_struct_proof_manual.
End VC_Correctness.
