From SimpleC.EE.INPUT.xizi.xizi_avl_find_pre_node Require Import xizi_avl_find_pre_node_goal xizi_avl_find_pre_node_proof_auto xizi_avl_find_pre_node_proof_manual.

Module VC_Correctness : VC_Correct.
  Include xizi_avl_find_pre_node_proof_auto.
  Include xizi_avl_find_pre_node_proof_manual.
End VC_Correctness.
