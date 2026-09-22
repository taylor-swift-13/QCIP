From QCIPCases.binaryTree.binaryTree_size Require Import binaryTree_size_goal binaryTree_size_proof_auto binaryTree_size_proof_manual.

Module VC_Correctness : VC_Correct.
  Include binaryTree_strategy_proof.
  Include binaryTree_size_proof_auto.
  Include binaryTree_size_proof_manual.
End VC_Correctness.
