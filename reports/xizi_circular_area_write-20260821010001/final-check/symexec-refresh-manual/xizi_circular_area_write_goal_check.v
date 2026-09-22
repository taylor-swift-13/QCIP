From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source Require Import xizi_circular_area_write_goal xizi_circular_area_write_proof_auto xizi_circular_area_write_proof_manual.

Module VC_Correctness : VC_Correct.
  Include char_array_strategy_proof.
  Include xizi_circular_area_write_proof_auto.
  Include xizi_circular_area_write_proof_manual.
End VC_Correctness.
