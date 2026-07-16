Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import IP_ThrusterCtrlLogic_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.ThrusterCtrlLogic.IP_ThrusterCtrlLogic_lib.
Local Open Scope sac.
Import ListNotations.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_1 : ThrusterCtrlLogicFun_partial_solve_wit_1.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_1. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 0 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_2 : ThrusterCtrlLogicFun_partial_solve_wit_2.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_2. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 0 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_3 : ThrusterCtrlLogicFun_partial_solve_wit_3.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_3. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 0 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_4 : ThrusterCtrlLogicFun_partial_solve_wit_4.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_4. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 1 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_5 : ThrusterCtrlLogicFun_partial_solve_wit_5.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_5. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 1 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_6 : ThrusterCtrlLogicFun_partial_solve_wit_6.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_6. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 1 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_7 : ThrusterCtrlLogicFun_partial_solve_wit_7.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_7. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 1 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_8 : ThrusterCtrlLogicFun_partial_solve_wit_8.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_8. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_9 : ThrusterCtrlLogicFun_partial_solve_wit_9.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_9. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_10 : ThrusterCtrlLogicFun_partial_solve_wit_10.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_10. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_11 : ThrusterCtrlLogicFun_partial_solve_wit_11.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_11. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_12 : ThrusterCtrlLogicFun_partial_solve_wit_12.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_12. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_13 : ThrusterCtrlLogicFun_partial_solve_wit_13.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_13. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_14 : ThrusterCtrlLogicFun_partial_solve_wit_14.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_14. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_15 : ThrusterCtrlLogicFun_partial_solve_wit_15.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_15. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 1 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_16 : ThrusterCtrlLogicFun_partial_solve_wit_16.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_16. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_17 : ThrusterCtrlLogicFun_partial_solve_wit_17.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_17. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_18 : ThrusterCtrlLogicFun_partial_solve_wit_18.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_18. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_19 : ThrusterCtrlLogicFun_partial_solve_wit_19.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_19. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_20 : ThrusterCtrlLogicFun_partial_solve_wit_20.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_20. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_21 : ThrusterCtrlLogicFun_partial_solve_wit_21.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_21. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_22 : ThrusterCtrlLogicFun_partial_solve_wit_22.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_22. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_23 : ThrusterCtrlLogicFun_partial_solve_wit_23.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_23. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_24 : ThrusterCtrlLogicFun_partial_solve_wit_24.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_24. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_25 : ThrusterCtrlLogicFun_partial_solve_wit_25.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_25. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_26 : ThrusterCtrlLogicFun_partial_solve_wit_26.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_26. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_27 : ThrusterCtrlLogicFun_partial_solve_wit_27.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_27. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_28 : ThrusterCtrlLogicFun_partial_solve_wit_28.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_28. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_29 : ThrusterCtrlLogicFun_partial_solve_wit_29.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_29. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_30 : ThrusterCtrlLogicFun_partial_solve_wit_30.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_30. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_31 : ThrusterCtrlLogicFun_partial_solve_wit_31.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_31. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yp_addr 2 3 yp_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_32 : ThrusterCtrlLogicFun_partial_solve_wit_32.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_32. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_33 : ThrusterCtrlLogicFun_partial_solve_wit_33.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_33. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_34 : ThrusterCtrlLogicFun_partial_solve_wit_34.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_34. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_35 : ThrusterCtrlLogicFun_partial_solve_wit_35.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_35. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_36 : ThrusterCtrlLogicFun_partial_solve_wit_36.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_36. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_37 : ThrusterCtrlLogicFun_partial_solve_wit_37.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_37. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_38 : ThrusterCtrlLogicFun_partial_solve_wit_38.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_38. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_39 : ThrusterCtrlLogicFun_partial_solve_wit_39.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_39. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_40 : ThrusterCtrlLogicFun_partial_solve_wit_40.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_40. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_41 : ThrusterCtrlLogicFun_partial_solve_wit_41.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_41. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_42 : ThrusterCtrlLogicFun_partial_solve_wit_42.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_42. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_43 : ThrusterCtrlLogicFun_partial_solve_wit_43.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_43. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_44 : ThrusterCtrlLogicFun_partial_solve_wit_44.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_44. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_45 : ThrusterCtrlLogicFun_partial_solve_wit_45.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_45. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_46 : ThrusterCtrlLogicFun_partial_solve_wit_46.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_46. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_47 : ThrusterCtrlLogicFun_partial_solve_wit_47.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_47. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_48 : ThrusterCtrlLogicFun_partial_solve_wit_48.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_48. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_49 : ThrusterCtrlLogicFun_partial_solve_wit_49.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_49. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_50 : ThrusterCtrlLogicFun_partial_solve_wit_50.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_50. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_51 : ThrusterCtrlLogicFun_partial_solve_wit_51.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_51. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_52 : ThrusterCtrlLogicFun_partial_solve_wit_52.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_52. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_53 : ThrusterCtrlLogicFun_partial_solve_wit_53.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_53. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_54 : ThrusterCtrlLogicFun_partial_solve_wit_54.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_54. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_55 : ThrusterCtrlLogicFun_partial_solve_wit_55.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_55. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_56 : ThrusterCtrlLogicFun_partial_solve_wit_56.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_56. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_57 : ThrusterCtrlLogicFun_partial_solve_wit_57.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_57. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_58 : ThrusterCtrlLogicFun_partial_solve_wit_58.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_58. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_59 : ThrusterCtrlLogicFun_partial_solve_wit_59.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_59. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_60 : ThrusterCtrlLogicFun_partial_solve_wit_60.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_60. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_61 : ThrusterCtrlLogicFun_partial_solve_wit_61.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_61. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_62 : ThrusterCtrlLogicFun_partial_solve_wit_62.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_62. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_partial_solve_wit_63 : ThrusterCtrlLogicFun_partial_solve_wit_63.
Proof.
  unfold ThrusterCtrlLogicFun_partial_solve_wit_63. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i yn_addr 2 3 yn_list 0);
  [dump_pre_spatial; lia | entailer!].
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_1 : ThrusterCtrlLogicFun_safety_wit_1.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_1. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_2 : ThrusterCtrlLogicFun_safety_wit_2.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_2. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_3 : ThrusterCtrlLogicFun_safety_wit_3.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_3. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_4 : ThrusterCtrlLogicFun_safety_wit_4.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_4. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_5 : ThrusterCtrlLogicFun_safety_wit_5.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_5. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_6 : ThrusterCtrlLogicFun_safety_wit_6.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_6. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_7 : ThrusterCtrlLogicFun_safety_wit_7.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_7. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_8 : ThrusterCtrlLogicFun_safety_wit_8.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_8. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_9 : ThrusterCtrlLogicFun_safety_wit_9.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_9. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_10 : ThrusterCtrlLogicFun_safety_wit_10.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_10. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_11 : ThrusterCtrlLogicFun_safety_wit_11.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_11. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_12 : ThrusterCtrlLogicFun_safety_wit_12.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_12. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_13 : ThrusterCtrlLogicFun_safety_wit_13.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_13. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_14 : ThrusterCtrlLogicFun_safety_wit_14.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_14. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_15 : ThrusterCtrlLogicFun_safety_wit_15.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_15. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_16 : ThrusterCtrlLogicFun_safety_wit_16.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_16. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_17 : ThrusterCtrlLogicFun_safety_wit_17.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_17. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_18 : ThrusterCtrlLogicFun_safety_wit_18.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_18. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_19 : ThrusterCtrlLogicFun_safety_wit_19.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_19. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_20 : ThrusterCtrlLogicFun_safety_wit_20.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_20. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_21 : ThrusterCtrlLogicFun_safety_wit_21.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_21. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_22 : ThrusterCtrlLogicFun_safety_wit_22.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_22. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_23 : ThrusterCtrlLogicFun_safety_wit_23.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_23. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_24 : ThrusterCtrlLogicFun_safety_wit_24.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_24. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_25 : ThrusterCtrlLogicFun_safety_wit_25.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_25. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_26 : ThrusterCtrlLogicFun_safety_wit_26.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_26. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_27 : ThrusterCtrlLogicFun_safety_wit_27.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_27. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_28 : ThrusterCtrlLogicFun_safety_wit_28.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_28. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_29 : ThrusterCtrlLogicFun_safety_wit_29.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_29. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_30 : ThrusterCtrlLogicFun_safety_wit_30.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_30. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_31 : ThrusterCtrlLogicFun_safety_wit_31.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_31. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_32 : ThrusterCtrlLogicFun_safety_wit_32.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_32. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_33 : ThrusterCtrlLogicFun_safety_wit_33.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_33. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_34 : ThrusterCtrlLogicFun_safety_wit_34.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_34. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_35 : ThrusterCtrlLogicFun_safety_wit_35.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_35. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_36 : ThrusterCtrlLogicFun_safety_wit_36.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_36. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_37 : ThrusterCtrlLogicFun_safety_wit_37.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_37. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_38 : ThrusterCtrlLogicFun_safety_wit_38.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_38. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_39 : ThrusterCtrlLogicFun_safety_wit_39.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_39. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_40 : ThrusterCtrlLogicFun_safety_wit_40.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_40. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_41 : ThrusterCtrlLogicFun_safety_wit_41.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_41. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_42 : ThrusterCtrlLogicFun_safety_wit_42.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_42. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_43 : ThrusterCtrlLogicFun_safety_wit_43.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_43. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_44 : ThrusterCtrlLogicFun_safety_wit_44.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_44. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_45 : ThrusterCtrlLogicFun_safety_wit_45.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_45. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_46 : ThrusterCtrlLogicFun_safety_wit_46.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_46. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_47 : ThrusterCtrlLogicFun_safety_wit_47.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_47. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_48 : ThrusterCtrlLogicFun_safety_wit_48.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_48. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_49 : ThrusterCtrlLogicFun_safety_wit_49.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_49. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_50 : ThrusterCtrlLogicFun_safety_wit_50.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_50. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_51 : ThrusterCtrlLogicFun_safety_wit_51.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_51. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_52 : ThrusterCtrlLogicFun_safety_wit_52.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_52. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_53 : ThrusterCtrlLogicFun_safety_wit_53.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_53. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_54 : ThrusterCtrlLogicFun_safety_wit_54.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_54. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_55 : ThrusterCtrlLogicFun_safety_wit_55.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_55. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_56 : ThrusterCtrlLogicFun_safety_wit_56.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_56. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_57 : ThrusterCtrlLogicFun_safety_wit_57.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_57. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_58 : ThrusterCtrlLogicFun_safety_wit_58.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_58. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_59 : ThrusterCtrlLogicFun_safety_wit_59.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_59. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_60 : ThrusterCtrlLogicFun_safety_wit_60.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_60. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_61 : ThrusterCtrlLogicFun_safety_wit_61.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_61. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_62 : ThrusterCtrlLogicFun_safety_wit_62.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_62. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_63 : ThrusterCtrlLogicFun_safety_wit_63.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_63. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_64 : ThrusterCtrlLogicFun_safety_wit_64.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_64. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_65 : ThrusterCtrlLogicFun_safety_wit_65.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_65. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_66 : ThrusterCtrlLogicFun_safety_wit_66.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_66. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_67 : ThrusterCtrlLogicFun_safety_wit_67.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_67. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_68 : ThrusterCtrlLogicFun_safety_wit_68.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_68. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_69 : ThrusterCtrlLogicFun_safety_wit_69.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_69. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_70 : ThrusterCtrlLogicFun_safety_wit_70.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_70. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_71 : ThrusterCtrlLogicFun_safety_wit_71.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_71. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_72 : ThrusterCtrlLogicFun_safety_wit_72.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_72. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_73 : ThrusterCtrlLogicFun_safety_wit_73.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_73. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_74 : ThrusterCtrlLogicFun_safety_wit_74.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_74. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_75 : ThrusterCtrlLogicFun_safety_wit_75.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_75. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_76 : ThrusterCtrlLogicFun_safety_wit_76.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_76. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_77 : ThrusterCtrlLogicFun_safety_wit_77.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_77. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_78 : ThrusterCtrlLogicFun_safety_wit_78.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_78. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_79 : ThrusterCtrlLogicFun_safety_wit_79.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_79. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_80 : ThrusterCtrlLogicFun_safety_wit_80.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_80. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_81 : ThrusterCtrlLogicFun_safety_wit_81.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_81. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_82 : ThrusterCtrlLogicFun_safety_wit_82.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_82. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_83 : ThrusterCtrlLogicFun_safety_wit_83.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_83. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_84 : ThrusterCtrlLogicFun_safety_wit_84.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_84. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_85 : ThrusterCtrlLogicFun_safety_wit_85.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_85. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_86 : ThrusterCtrlLogicFun_safety_wit_86.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_86. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_87 : ThrusterCtrlLogicFun_safety_wit_87.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_87. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_88 : ThrusterCtrlLogicFun_safety_wit_88.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_88. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_89 : ThrusterCtrlLogicFun_safety_wit_89.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_89. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_90 : ThrusterCtrlLogicFun_safety_wit_90.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_90. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_91 : ThrusterCtrlLogicFun_safety_wit_91.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_91. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_92 : ThrusterCtrlLogicFun_safety_wit_92.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_92. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_93 : ThrusterCtrlLogicFun_safety_wit_93.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_93. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_94 : ThrusterCtrlLogicFun_safety_wit_94.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_94. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_95 : ThrusterCtrlLogicFun_safety_wit_95.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_95. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_96 : ThrusterCtrlLogicFun_safety_wit_96.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_96. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_97 : ThrusterCtrlLogicFun_safety_wit_97.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_97. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_98 : ThrusterCtrlLogicFun_safety_wit_98.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_98. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_99 : ThrusterCtrlLogicFun_safety_wit_99.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_99. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_100 : ThrusterCtrlLogicFun_safety_wit_100.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_100. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_101 : ThrusterCtrlLogicFun_safety_wit_101.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_101. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_102 : ThrusterCtrlLogicFun_safety_wit_102.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_102. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_103 : ThrusterCtrlLogicFun_safety_wit_103.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_103. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_104 : ThrusterCtrlLogicFun_safety_wit_104.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_104. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_105 : ThrusterCtrlLogicFun_safety_wit_105.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_105. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_106 : ThrusterCtrlLogicFun_safety_wit_106.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_106. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_107 : ThrusterCtrlLogicFun_safety_wit_107.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_107. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_108 : ThrusterCtrlLogicFun_safety_wit_108.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_108. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_109 : ThrusterCtrlLogicFun_safety_wit_109.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_109. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_110 : ThrusterCtrlLogicFun_safety_wit_110.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_110. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_111 : ThrusterCtrlLogicFun_safety_wit_111.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_111. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_112 : ThrusterCtrlLogicFun_safety_wit_112.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_112. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_113 : ThrusterCtrlLogicFun_safety_wit_113.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_113. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_114 : ThrusterCtrlLogicFun_safety_wit_114.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_114. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_115 : ThrusterCtrlLogicFun_safety_wit_115.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_115. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_116 : ThrusterCtrlLogicFun_safety_wit_116.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_116. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_117 : ThrusterCtrlLogicFun_safety_wit_117.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_117. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_118 : ThrusterCtrlLogicFun_safety_wit_118.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_118. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_119 : ThrusterCtrlLogicFun_safety_wit_119.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_119. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_120 : ThrusterCtrlLogicFun_safety_wit_120.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_120. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_121 : ThrusterCtrlLogicFun_safety_wit_121.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_121. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_122 : ThrusterCtrlLogicFun_safety_wit_122.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_122. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_123 : ThrusterCtrlLogicFun_safety_wit_123.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_123. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_124 : ThrusterCtrlLogicFun_safety_wit_124.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_124. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_125 : ThrusterCtrlLogicFun_safety_wit_125.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_125. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_126 : ThrusterCtrlLogicFun_safety_wit_126.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_126. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_127 : ThrusterCtrlLogicFun_safety_wit_127.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_127. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_128 : ThrusterCtrlLogicFun_safety_wit_128.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_128. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_129 : ThrusterCtrlLogicFun_safety_wit_129.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_129. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_130 : ThrusterCtrlLogicFun_safety_wit_130.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_130. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_131 : ThrusterCtrlLogicFun_safety_wit_131.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_131. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_132 : ThrusterCtrlLogicFun_safety_wit_132.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_132. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_133 : ThrusterCtrlLogicFun_safety_wit_133.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_133. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_134 : ThrusterCtrlLogicFun_safety_wit_134.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_134. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_135 : ThrusterCtrlLogicFun_safety_wit_135.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_135. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_136 : ThrusterCtrlLogicFun_safety_wit_136.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_136. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_137 : ThrusterCtrlLogicFun_safety_wit_137.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_137. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_138 : ThrusterCtrlLogicFun_safety_wit_138.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_138. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_139 : ThrusterCtrlLogicFun_safety_wit_139.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_139. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_140 : ThrusterCtrlLogicFun_safety_wit_140.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_140. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_141 : ThrusterCtrlLogicFun_safety_wit_141.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_141. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_142 : ThrusterCtrlLogicFun_safety_wit_142.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_142. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_143 : ThrusterCtrlLogicFun_safety_wit_143.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_143. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_144 : ThrusterCtrlLogicFun_safety_wit_144.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_144. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_145 : ThrusterCtrlLogicFun_safety_wit_145.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_145. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_146 : ThrusterCtrlLogicFun_safety_wit_146.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_146. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_147 : ThrusterCtrlLogicFun_safety_wit_147.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_147. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_148 : ThrusterCtrlLogicFun_safety_wit_148.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_148. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_149 : ThrusterCtrlLogicFun_safety_wit_149.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_149. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_150 : ThrusterCtrlLogicFun_safety_wit_150.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_150. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_151 : ThrusterCtrlLogicFun_safety_wit_151.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_151. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_152 : ThrusterCtrlLogicFun_safety_wit_152.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_152. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_153 : ThrusterCtrlLogicFun_safety_wit_153.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_153. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_154 : ThrusterCtrlLogicFun_safety_wit_154.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_154. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_155 : ThrusterCtrlLogicFun_safety_wit_155.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_155. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_156 : ThrusterCtrlLogicFun_safety_wit_156.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_156. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_157 : ThrusterCtrlLogicFun_safety_wit_157.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_157. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_158 : ThrusterCtrlLogicFun_safety_wit_158.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_158. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_159 : ThrusterCtrlLogicFun_safety_wit_159.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_159. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_160 : ThrusterCtrlLogicFun_safety_wit_160.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_160. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_161 : ThrusterCtrlLogicFun_safety_wit_161.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_161. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_162 : ThrusterCtrlLogicFun_safety_wit_162.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_162. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_163 : ThrusterCtrlLogicFun_safety_wit_163.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_163. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_164 : ThrusterCtrlLogicFun_safety_wit_164.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_164. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_165 : ThrusterCtrlLogicFun_safety_wit_165.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_165. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_166 : ThrusterCtrlLogicFun_safety_wit_166.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_166. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_167 : ThrusterCtrlLogicFun_safety_wit_167.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_167. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_168 : ThrusterCtrlLogicFun_safety_wit_168.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_168. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_169 : ThrusterCtrlLogicFun_safety_wit_169.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_169. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_170 : ThrusterCtrlLogicFun_safety_wit_170.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_170. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_171 : ThrusterCtrlLogicFun_safety_wit_171.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_171. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_172 : ThrusterCtrlLogicFun_safety_wit_172.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_172. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_173 : ThrusterCtrlLogicFun_safety_wit_173.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_173. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_174 : ThrusterCtrlLogicFun_safety_wit_174.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_174. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_175 : ThrusterCtrlLogicFun_safety_wit_175.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_175. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_176 : ThrusterCtrlLogicFun_safety_wit_176.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_176. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_177 : ThrusterCtrlLogicFun_safety_wit_177.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_177. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_178 : ThrusterCtrlLogicFun_safety_wit_178.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_178. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_179 : ThrusterCtrlLogicFun_safety_wit_179.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_179. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_180 : ThrusterCtrlLogicFun_safety_wit_180.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_180. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_181 : ThrusterCtrlLogicFun_safety_wit_181.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_181. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_182 : ThrusterCtrlLogicFun_safety_wit_182.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_182. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_183 : ThrusterCtrlLogicFun_safety_wit_183.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_183. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_184 : ThrusterCtrlLogicFun_safety_wit_184.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_184. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_185 : ThrusterCtrlLogicFun_safety_wit_185.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_185. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_186 : ThrusterCtrlLogicFun_safety_wit_186.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_186. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_187 : ThrusterCtrlLogicFun_safety_wit_187.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_187. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_188 : ThrusterCtrlLogicFun_safety_wit_188.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_188. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_189 : ThrusterCtrlLogicFun_safety_wit_189.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_189. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_190 : ThrusterCtrlLogicFun_safety_wit_190.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_190. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_191 : ThrusterCtrlLogicFun_safety_wit_191.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_191. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_192 : ThrusterCtrlLogicFun_safety_wit_192.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_192. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_193 : ThrusterCtrlLogicFun_safety_wit_193.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_193. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_194 : ThrusterCtrlLogicFun_safety_wit_194.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_194. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_195 : ThrusterCtrlLogicFun_safety_wit_195.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_195. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_196 : ThrusterCtrlLogicFun_safety_wit_196.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_196. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_197 : ThrusterCtrlLogicFun_safety_wit_197.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_197. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_198 : ThrusterCtrlLogicFun_safety_wit_198.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_198. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_199 : ThrusterCtrlLogicFun_safety_wit_199.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_199. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_200 : ThrusterCtrlLogicFun_safety_wit_200.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_200. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_201 : ThrusterCtrlLogicFun_safety_wit_201.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_201. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_202 : ThrusterCtrlLogicFun_safety_wit_202.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_202. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_203 : ThrusterCtrlLogicFun_safety_wit_203.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_203. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_204 : ThrusterCtrlLogicFun_safety_wit_204.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_204. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_205 : ThrusterCtrlLogicFun_safety_wit_205.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_205. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_206 : ThrusterCtrlLogicFun_safety_wit_206.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_206. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_207 : ThrusterCtrlLogicFun_safety_wit_207.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_207. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_208 : ThrusterCtrlLogicFun_safety_wit_208.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_208. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_209 : ThrusterCtrlLogicFun_safety_wit_209.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_209. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_210 : ThrusterCtrlLogicFun_safety_wit_210.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_210. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_211 : ThrusterCtrlLogicFun_safety_wit_211.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_211. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_212 : ThrusterCtrlLogicFun_safety_wit_212.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_212. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_213 : ThrusterCtrlLogicFun_safety_wit_213.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_213. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_214 : ThrusterCtrlLogicFun_safety_wit_214.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_214. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_215 : ThrusterCtrlLogicFun_safety_wit_215.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_215. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_216 : ThrusterCtrlLogicFun_safety_wit_216.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_216. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_217 : ThrusterCtrlLogicFun_safety_wit_217.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_217. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_218 : ThrusterCtrlLogicFun_safety_wit_218.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_218. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_219 : ThrusterCtrlLogicFun_safety_wit_219.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_219. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_220 : ThrusterCtrlLogicFun_safety_wit_220.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_220. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_221 : ThrusterCtrlLogicFun_safety_wit_221.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_221. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_222 : ThrusterCtrlLogicFun_safety_wit_222.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_222. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_223 : ThrusterCtrlLogicFun_safety_wit_223.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_223. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_224 : ThrusterCtrlLogicFun_safety_wit_224.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_224. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_225 : ThrusterCtrlLogicFun_safety_wit_225.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_225. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_226 : ThrusterCtrlLogicFun_safety_wit_226.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_226. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_227 : ThrusterCtrlLogicFun_safety_wit_227.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_227. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_228 : ThrusterCtrlLogicFun_safety_wit_228.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_228. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_229 : ThrusterCtrlLogicFun_safety_wit_229.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_229. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_230 : ThrusterCtrlLogicFun_safety_wit_230.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_230. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_231 : ThrusterCtrlLogicFun_safety_wit_231.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_231. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_232 : ThrusterCtrlLogicFun_safety_wit_232.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_232. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_233 : ThrusterCtrlLogicFun_safety_wit_233.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_233. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_234 : ThrusterCtrlLogicFun_safety_wit_234.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_234. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_235 : ThrusterCtrlLogicFun_safety_wit_235.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_235. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_236 : ThrusterCtrlLogicFun_safety_wit_236.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_236. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_237 : ThrusterCtrlLogicFun_safety_wit_237.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_237. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_238 : ThrusterCtrlLogicFun_safety_wit_238.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_238. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_239 : ThrusterCtrlLogicFun_safety_wit_239.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_239. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_240 : ThrusterCtrlLogicFun_safety_wit_240.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_240. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_241 : ThrusterCtrlLogicFun_safety_wit_241.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_241. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_242 : ThrusterCtrlLogicFun_safety_wit_242.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_242. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_243 : ThrusterCtrlLogicFun_safety_wit_243.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_243. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_244 : ThrusterCtrlLogicFun_safety_wit_244.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_244. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_245 : ThrusterCtrlLogicFun_safety_wit_245.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_245. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_246 : ThrusterCtrlLogicFun_safety_wit_246.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_246. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_247 : ThrusterCtrlLogicFun_safety_wit_247.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_247. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_248 : ThrusterCtrlLogicFun_safety_wit_248.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_248. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_249 : ThrusterCtrlLogicFun_safety_wit_249.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_249. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_250 : ThrusterCtrlLogicFun_safety_wit_250.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_250. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_251 : ThrusterCtrlLogicFun_safety_wit_251.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_251. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_252 : ThrusterCtrlLogicFun_safety_wit_252.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_252. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_253 : ThrusterCtrlLogicFun_safety_wit_253.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_253. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_254 : ThrusterCtrlLogicFun_safety_wit_254.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_254. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_255 : ThrusterCtrlLogicFun_safety_wit_255.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_255. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_256 : ThrusterCtrlLogicFun_safety_wit_256.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_256. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_257 : ThrusterCtrlLogicFun_safety_wit_257.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_257. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_258 : ThrusterCtrlLogicFun_safety_wit_258.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_258. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_259 : ThrusterCtrlLogicFun_safety_wit_259.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_259. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_260 : ThrusterCtrlLogicFun_safety_wit_260.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_260. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_261 : ThrusterCtrlLogicFun_safety_wit_261.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_261. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_262 : ThrusterCtrlLogicFun_safety_wit_262.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_262. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_263 : ThrusterCtrlLogicFun_safety_wit_263.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_263. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_264 : ThrusterCtrlLogicFun_safety_wit_264.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_264. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_265 : ThrusterCtrlLogicFun_safety_wit_265.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_265. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_266 : ThrusterCtrlLogicFun_safety_wit_266.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_266. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_267 : ThrusterCtrlLogicFun_safety_wit_267.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_267. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_268 : ThrusterCtrlLogicFun_safety_wit_268.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_268. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_269 : ThrusterCtrlLogicFun_safety_wit_269.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_269. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_270 : ThrusterCtrlLogicFun_safety_wit_270.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_270. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_271 : ThrusterCtrlLogicFun_safety_wit_271.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_271. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_272 : ThrusterCtrlLogicFun_safety_wit_272.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_272. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_273 : ThrusterCtrlLogicFun_safety_wit_273.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_273. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_274 : ThrusterCtrlLogicFun_safety_wit_274.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_274. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_275 : ThrusterCtrlLogicFun_safety_wit_275.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_275. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_276 : ThrusterCtrlLogicFun_safety_wit_276.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_276. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_277 : ThrusterCtrlLogicFun_safety_wit_277.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_277. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_278 : ThrusterCtrlLogicFun_safety_wit_278.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_278. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_279 : ThrusterCtrlLogicFun_safety_wit_279.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_279. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_280 : ThrusterCtrlLogicFun_safety_wit_280.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_280. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_281 : ThrusterCtrlLogicFun_safety_wit_281.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_281. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_282 : ThrusterCtrlLogicFun_safety_wit_282.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_282. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_283 : ThrusterCtrlLogicFun_safety_wit_283.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_283. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_284 : ThrusterCtrlLogicFun_safety_wit_284.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_284. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_285 : ThrusterCtrlLogicFun_safety_wit_285.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_285. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_286 : ThrusterCtrlLogicFun_safety_wit_286.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_286. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_287 : ThrusterCtrlLogicFun_safety_wit_287.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_287. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_288 : ThrusterCtrlLogicFun_safety_wit_288.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_288. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_289 : ThrusterCtrlLogicFun_safety_wit_289.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_289. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_290 : ThrusterCtrlLogicFun_safety_wit_290.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_290. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_291 : ThrusterCtrlLogicFun_safety_wit_291.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_291. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_292 : ThrusterCtrlLogicFun_safety_wit_292.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_292. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_293 : ThrusterCtrlLogicFun_safety_wit_293.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_293. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_294 : ThrusterCtrlLogicFun_safety_wit_294.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_294. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_295 : ThrusterCtrlLogicFun_safety_wit_295.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_295. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_296 : ThrusterCtrlLogicFun_safety_wit_296.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_296. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_297 : ThrusterCtrlLogicFun_safety_wit_297.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_297. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_298 : ThrusterCtrlLogicFun_safety_wit_298.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_298. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_299 : ThrusterCtrlLogicFun_safety_wit_299.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_299. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_300 : ThrusterCtrlLogicFun_safety_wit_300.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_300. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_301 : ThrusterCtrlLogicFun_safety_wit_301.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_301. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_302 : ThrusterCtrlLogicFun_safety_wit_302.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_302. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_303 : ThrusterCtrlLogicFun_safety_wit_303.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_303. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_304 : ThrusterCtrlLogicFun_safety_wit_304.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_304. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_305 : ThrusterCtrlLogicFun_safety_wit_305.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_305. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_306 : ThrusterCtrlLogicFun_safety_wit_306.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_306. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_307 : ThrusterCtrlLogicFun_safety_wit_307.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_307. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_308 : ThrusterCtrlLogicFun_safety_wit_308.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_308. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_309 : ThrusterCtrlLogicFun_safety_wit_309.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_309. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_310 : ThrusterCtrlLogicFun_safety_wit_310.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_310. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_311 : ThrusterCtrlLogicFun_safety_wit_311.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_311. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_312 : ThrusterCtrlLogicFun_safety_wit_312.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_312. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_313 : ThrusterCtrlLogicFun_safety_wit_313.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_313. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_314 : ThrusterCtrlLogicFun_safety_wit_314.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_314. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_315 : ThrusterCtrlLogicFun_safety_wit_315.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_315. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_316 : ThrusterCtrlLogicFun_safety_wit_316.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_316. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_317 : ThrusterCtrlLogicFun_safety_wit_317.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_317. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_318 : ThrusterCtrlLogicFun_safety_wit_318.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_318. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_319 : ThrusterCtrlLogicFun_safety_wit_319.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_319. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_320 : ThrusterCtrlLogicFun_safety_wit_320.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_320. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_321 : ThrusterCtrlLogicFun_safety_wit_321.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_321. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_322 : ThrusterCtrlLogicFun_safety_wit_322.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_322. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_323 : ThrusterCtrlLogicFun_safety_wit_323.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_323. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_324 : ThrusterCtrlLogicFun_safety_wit_324.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_324. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_325 : ThrusterCtrlLogicFun_safety_wit_325.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_325. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_326 : ThrusterCtrlLogicFun_safety_wit_326.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_326. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_327 : ThrusterCtrlLogicFun_safety_wit_327.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_327. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_328 : ThrusterCtrlLogicFun_safety_wit_328.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_328. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_329 : ThrusterCtrlLogicFun_safety_wit_329.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_329. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_330 : ThrusterCtrlLogicFun_safety_wit_330.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_330. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_331 : ThrusterCtrlLogicFun_safety_wit_331.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_331. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_332 : ThrusterCtrlLogicFun_safety_wit_332.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_332. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_333 : ThrusterCtrlLogicFun_safety_wit_333.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_333. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_334 : ThrusterCtrlLogicFun_safety_wit_334.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_334. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_335 : ThrusterCtrlLogicFun_safety_wit_335.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_335. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_336 : ThrusterCtrlLogicFun_safety_wit_336.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_336. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_337 : ThrusterCtrlLogicFun_safety_wit_337.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_337. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_338 : ThrusterCtrlLogicFun_safety_wit_338.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_338. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_339 : ThrusterCtrlLogicFun_safety_wit_339.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_339. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_340 : ThrusterCtrlLogicFun_safety_wit_340.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_340. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_341 : ThrusterCtrlLogicFun_safety_wit_341.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_341. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_342 : ThrusterCtrlLogicFun_safety_wit_342.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_342. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_343 : ThrusterCtrlLogicFun_safety_wit_343.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_343. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_344 : ThrusterCtrlLogicFun_safety_wit_344.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_344. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_345 : ThrusterCtrlLogicFun_safety_wit_345.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_345. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_346 : ThrusterCtrlLogicFun_safety_wit_346.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_346. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_347 : ThrusterCtrlLogicFun_safety_wit_347.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_347. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_348 : ThrusterCtrlLogicFun_safety_wit_348.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_348. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_349 : ThrusterCtrlLogicFun_safety_wit_349.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_349. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_350 : ThrusterCtrlLogicFun_safety_wit_350.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_350. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_351 : ThrusterCtrlLogicFun_safety_wit_351.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_351. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_352 : ThrusterCtrlLogicFun_safety_wit_352.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_352. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_353 : ThrusterCtrlLogicFun_safety_wit_353.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_353. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_354 : ThrusterCtrlLogicFun_safety_wit_354.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_354. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_355 : ThrusterCtrlLogicFun_safety_wit_355.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_355. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_356 : ThrusterCtrlLogicFun_safety_wit_356.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_356. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_357 : ThrusterCtrlLogicFun_safety_wit_357.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_357. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_358 : ThrusterCtrlLogicFun_safety_wit_358.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_358. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_359 : ThrusterCtrlLogicFun_safety_wit_359.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_359. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_360 : ThrusterCtrlLogicFun_safety_wit_360.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_360. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_361 : ThrusterCtrlLogicFun_safety_wit_361.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_361. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_362 : ThrusterCtrlLogicFun_safety_wit_362.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_362. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_363 : ThrusterCtrlLogicFun_safety_wit_363.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_363. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_364 : ThrusterCtrlLogicFun_safety_wit_364.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_364. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_365 : ThrusterCtrlLogicFun_safety_wit_365.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_365. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_366 : ThrusterCtrlLogicFun_safety_wit_366.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_366. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_367 : ThrusterCtrlLogicFun_safety_wit_367.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_367. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_368 : ThrusterCtrlLogicFun_safety_wit_368.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_368. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_369 : ThrusterCtrlLogicFun_safety_wit_369.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_369. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_370 : ThrusterCtrlLogicFun_safety_wit_370.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_370. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_371 : ThrusterCtrlLogicFun_safety_wit_371.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_371. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_372 : ThrusterCtrlLogicFun_safety_wit_372.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_372. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_373 : ThrusterCtrlLogicFun_safety_wit_373.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_373. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_374 : ThrusterCtrlLogicFun_safety_wit_374.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_374. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_375 : ThrusterCtrlLogicFun_safety_wit_375.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_375. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_376 : ThrusterCtrlLogicFun_safety_wit_376.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_376. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_377 : ThrusterCtrlLogicFun_safety_wit_377.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_377. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_378 : ThrusterCtrlLogicFun_safety_wit_378.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_378. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_379 : ThrusterCtrlLogicFun_safety_wit_379.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_379. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_380 : ThrusterCtrlLogicFun_safety_wit_380.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_380. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_381 : ThrusterCtrlLogicFun_safety_wit_381.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_381. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_382 : ThrusterCtrlLogicFun_safety_wit_382.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_382. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_383 : ThrusterCtrlLogicFun_safety_wit_383.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_383. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_384 : ThrusterCtrlLogicFun_safety_wit_384.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_384. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_385 : ThrusterCtrlLogicFun_safety_wit_385.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_385. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_386 : ThrusterCtrlLogicFun_safety_wit_386.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_386. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_387 : ThrusterCtrlLogicFun_safety_wit_387.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_387. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_388 : ThrusterCtrlLogicFun_safety_wit_388.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_388. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_389 : ThrusterCtrlLogicFun_safety_wit_389.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_389. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_390 : ThrusterCtrlLogicFun_safety_wit_390.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_390. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_391 : ThrusterCtrlLogicFun_safety_wit_391.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_391. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_392 : ThrusterCtrlLogicFun_safety_wit_392.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_392. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_393 : ThrusterCtrlLogicFun_safety_wit_393.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_393. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_394 : ThrusterCtrlLogicFun_safety_wit_394.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_394. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_395 : ThrusterCtrlLogicFun_safety_wit_395.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_395. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_396 : ThrusterCtrlLogicFun_safety_wit_396.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_396. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_397 : ThrusterCtrlLogicFun_safety_wit_397.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_397. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_398 : ThrusterCtrlLogicFun_safety_wit_398.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_398. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_399 : ThrusterCtrlLogicFun_safety_wit_399.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_399. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_400 : ThrusterCtrlLogicFun_safety_wit_400.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_400. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_401 : ThrusterCtrlLogicFun_safety_wit_401.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_401. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_ThrusterCtrlLogicFun_safety_wit_402 : ThrusterCtrlLogicFun_safety_wit_402.
Proof.
  unfold ThrusterCtrlLogicFun_safety_wit_402. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

