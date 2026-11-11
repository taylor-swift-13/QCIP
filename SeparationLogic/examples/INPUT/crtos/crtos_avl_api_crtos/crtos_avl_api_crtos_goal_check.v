From SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos Require Import crtos_avl_api_crtos_goal crtos_avl_api_crtos_proof_auto crtos_avl_api_crtos_proof_manual.

Module VC_Correctness : VC_Correct.
  Include crtos_avl_api_crtos_proof_auto.
  Include crtos_avl_api_crtos_proof_manual.
End VC_Correctness.
