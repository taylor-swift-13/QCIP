From QCIPCases.binaryTree.binaryTree_height Require Import binaryTree_height_goal binaryTree_height_proof_auto binaryTree_height_proof_manual.

Module VC_Correctness : VC_Correct.
  Include binaryTree_strategy_proof.
  Include binaryTree_height_proof_auto.
  Include binaryTree_height_proof_manual.
End VC_Correctness.
