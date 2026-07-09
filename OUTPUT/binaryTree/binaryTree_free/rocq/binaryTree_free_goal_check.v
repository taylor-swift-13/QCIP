From QCIPCases.binaryTree.binaryTree_free Require Import binaryTree_free_goal binaryTree_free_proof_auto binaryTree_free_proof_manual.

Module VC_Correctness : VC_Correct.
  Include binaryTree_strategy_proof.
  Include binaryTree_free_proof_auto.
  Include binaryTree_free_proof_manual.
End VC_Correctness.
