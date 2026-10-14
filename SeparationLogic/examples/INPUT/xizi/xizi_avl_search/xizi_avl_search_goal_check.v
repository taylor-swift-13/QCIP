From SimpleC.EE.INPUT.xizi.xizi_avl_search Require Import xizi_avl_search_goal xizi_avl_search_proof_auto xizi_avl_search_proof_manual.

Module VC_Correctness : VC_Correct.
  Include xizi_avl_search_proof_auto.
  Include xizi_avl_search_proof_manual.
End VC_Correctness.
