From QCIPCases.xizi.xizi_avl_balance_factor Require Import xizi_avl_balance_factor_goal xizi_avl_balance_factor_proof_auto xizi_avl_balance_factor_proof_manual.

Module VC_Correctness : VC_Correct.
  Include xizi_avl_strategy_proof.
  Include xizi_avl_balance_factor_proof_auto.
  Include xizi_avl_balance_factor_proof_manual.
End VC_Correctness.
