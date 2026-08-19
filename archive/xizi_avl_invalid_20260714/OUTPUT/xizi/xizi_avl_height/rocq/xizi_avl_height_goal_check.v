From QCIPCases.xizi.xizi_avl_height Require Import xizi_avl_height_goal xizi_avl_height_proof_auto xizi_avl_height_proof_manual.

Module VC_Correctness : VC_Correct.
  Include xizi_avl_strategy_proof.
  Include xizi_avl_height_proof_auto.
  Include xizi_avl_height_proof_manual.
End VC_Correctness.
