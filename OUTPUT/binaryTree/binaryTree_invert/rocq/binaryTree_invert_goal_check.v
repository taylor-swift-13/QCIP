From QCIPCases.binaryTree.binaryTree_invert Require Import binaryTree_invert_goal binaryTree_invert_proof_auto binaryTree_invert_proof_manual.

Module VC_Correctness : VC_Correct.
  Include binaryTree_strategy_proof.
  Include binaryTree_invert_proof_auto.
  Include binaryTree_invert_proof_manual.
End VC_Correctness.
