From SimpleC.EE.QCP_demos_LLM Require Import bst_left_child_goal bst_left_child_proof_auto bst_left_child_proof_manual.

Module VC_Correctness : VC_Correct.
  Include bst_left_child_proof_auto.
  Include bst_left_child_proof_manual.
End VC_Correctness.
