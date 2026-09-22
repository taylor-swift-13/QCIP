From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source Require Import xizi_circular_area_init_goal xizi_circular_area_init_proof_auto xizi_circular_area_init_proof_manual.

Module VC_Correctness : VC_Correct.
  Include xizi_circular_area_init_proof_auto.
  Include xizi_circular_area_init_proof_manual.
End VC_Correctness.
