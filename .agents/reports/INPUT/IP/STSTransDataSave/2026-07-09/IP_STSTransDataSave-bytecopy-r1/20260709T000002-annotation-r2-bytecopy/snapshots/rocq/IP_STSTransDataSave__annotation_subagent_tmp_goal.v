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
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.r2.IP_STSTransDataSave__annotation_subagent_tmp_lib.
Local Open Scope sac.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_goal.
From SimpleC.EE.QCP_demos_LLM Require Import char_array_strategy_proof.

(*----- Function STSTransDataSave -----*)

Definition STSTransDataSave_safety_wit_1_true_case := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (PreH1 : (0 <= ptr_true_case)) (PreH2 : (ptr_true_case < 776)) (PreH3 : ((Zlength (data_head_true_case)) = 248)) (PreH4 : ((Zlength (data_tail_true_case)) = 8)) (PreH5 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH6 : ((Zlength (old_dst_true_case)) = 248)) (PreH7 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  ((( &( "pDst" ) )) # UInt  |->_)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_true_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_true_case )
  **  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full (1074343936 + ptr_true_case ) 248 old_dst_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (776 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 776) ”
.

Definition STSTransDataSave_safety_wit_2_false_case := 
forall (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (776 <= ptr_false_case)) (PreH2 : (ptr_false_case <= 1024)) (PreH3 : ((Zlength (data_head_false_case)) = 248)) (PreH4 : ((Zlength (data_tail_false_case)) = 8)) (PreH5 : ((Zlength (old_sram_false_case)) = 1024)) ,
  ((( &( "pDst" ) )) # UInt  |->_)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
  **  (CharArray.full 1074343936 1024 old_sram_false_case )
|--
  “ (776 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 776) ”
.

Definition STSTransDataSave_safety_wit_3_true_case := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (PreH1 : (ptr_true_case >= 776)) (PreH2 : (0 <= ptr_true_case)) (PreH3 : (ptr_true_case < 776)) (PreH4 : ((Zlength (data_head_true_case)) = 248)) (PreH5 : ((Zlength (data_tail_true_case)) = 8)) (PreH6 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH7 : ((Zlength (old_dst_true_case)) = 248)) (PreH8 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  ((( &( "pDst" ) )) # UInt  |->_)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_true_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_true_case )
  **  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full (1074343936 + ptr_true_case ) 248 old_dst_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ False ”
.

Definition STSTransDataSave_safety_wit_4_false_case := 
forall (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (776 <= ptr_false_case)) (PreH3 : (ptr_false_case <= 1024)) (PreH4 : ((Zlength (data_head_false_case)) = 248)) (PreH5 : ((Zlength (data_tail_false_case)) = 8)) (PreH6 : ((Zlength (old_sram_false_case)) = 1024)) ,
  ((( &( "pDst" ) )) # UInt  |->_)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
  **  (CharArray.full 1074343936 1024 old_sram_false_case )
|--
  “ False ”
.

Definition STSTransDataSave_safety_wit_5 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition STSTransDataSave_safety_wit_6 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (248 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 248) ”
.

Definition STSTransDataSave_safety_wit_7 := 
forall (suffix_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 data_head_false_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (248 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 248) ”
.

Definition STSTransDataSave_entail_wit_1_true_case := 
(
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (ptr_true_case < 776)) (PreH2 : (0 <= ptr_true_case)) (PreH3 : (ptr_true_case < 776)) (PreH4 : ((Zlength (data_head_true_case)) = 248)) (PreH5 : ((Zlength (data_tail_true_case)) = 8)) (PreH6 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH7 : ((Zlength (old_dst_true_case)) = 248)) (PreH8 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_true_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_true_case )
  **  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full (1074343936 + ptr_true_case ) 248 old_dst_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (ptr_false_case < 776) ” 
  &&  “ ((1074343936 + ptr_true_case ) = (1074343936 + ptr_false_case )) ”
  &&  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full (1074343936 + ptr_true_case ) 248 old_dst_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
) \/
(
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ ((1074343936 + ptr_true_case ) = (1074343936 + ptr_false_case )) ” 
  &&  “ (ptr_false_case < 776) ” 
  &&  “ (ptr_true_case = ptr_false_case) ” 
  &&  “ (data_head_true_case = data_head_false_case) ” 
  &&  “ (data_tail_true_case = data_tail_false_case) ”
  &&  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
).

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_1 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (ptr_false_case: Z) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ ((1074343936 + ptr_true_case ) = (1074343936 + ptr_false_case )) ”
.

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_2 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (ptr_false_case: Z) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (ptr_false_case < 776) ”
.

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_3 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (ptr_false_case: Z) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (ptr_true_case = ptr_false_case) ”
.

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_4 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (data_head_false_case: (@list Z)) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (data_head_true_case = data_head_false_case) ”
.

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_5 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (data_tail_false_case: (@list Z)) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  “ (data_tail_true_case = data_tail_false_case) ”
.

Definition STSTransDataSave_entail_wit_1_true_case_split_goal_spatial := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (ptr_false_case: Z) (PreH1 : (0 <= ((1024 - ptr_true_case ) - 248 ))) (PreH2 : (ptr_true_case < 776)) (PreH3 : (0 <= ptr_true_case)) (PreH4 : (ptr_true_case < 776)) (PreH5 : ((Zlength (data_head_true_case)) = 248)) (PreH6 : ((Zlength (data_tail_true_case)) = 8)) (PreH7 : ((Zlength (prefix_true_case)) = ptr_true_case)) (PreH8 : ((Zlength (old_dst_true_case)) = 248)) (PreH9 : ((Zlength (suffix_true_case)) = ((1024 - ptr_true_case ) - 248 ))) ,
  (CharArray.full 1074343936 ptr_true_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_true_case ) - 248 ) suffix_true_case )
|--
  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full ((1074343936 + ptr_true_case ) + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
.

Definition STSTransDataSave_entail_wit_2 := 
forall (suffix_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (0 <= 8)) (PreH2 : (0 <= ((1024 - ptr_false_case ) - 248 ))) (PreH3 : (0 <= ptr_false_case)) (PreH4 : (ptr_false_case < 776)) (PreH5 : (pDst = (1074343936 + ptr_false_case ))) ,
  (CharArray.full pDst 248 data_head_false_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (ptr_false_case < 776) ” 
  &&  “ (pDst = (1074343936 + ptr_false_case )) ”
  &&  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 data_head_false_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
.

Definition STSTransDataSave_return_wit_1 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_true_case: (@list Z)) (data_head_true_case: (@list Z)) (ptr_true_case: Z) (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> (ptr_false_case + 248 ))
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 data_head_false_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  (EX (ptr1: Z)  (new_sram: (@list Z)) ,
  “ (STSTransDataSaveBytePost ptr_false_case ptr1 (app (data_head_false_case) (data_tail_false_case)) old_sram_false_case new_sram ) ”
  &&  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr1)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
  **  (CharArray.full 1074343936 1024 new_sram ))
  ||
  (EX (ptr1_2: Z)  (new_sram_2: (@list Z)) ,
  “ (STSTransDataSaveBytePost ptr_true_case ptr1_2 (app (data_head_true_case) (data_tail_true_case)) (app (prefix_true_case) ((app (old_dst_true_case) (suffix_true_case)))) new_sram_2 ) ”
  &&  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr1_2)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_true_case )
  **  (CharArray.full 1074343936 1024 new_sram_2 ))
.

Definition STSTransDataSave_return_wit_2_false_case := 
(
forall (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (ptr_false_case >= 776)) (PreH2 : (776 <= ptr_false_case)) (PreH3 : (ptr_false_case <= 1024)) (PreH4 : ((Zlength (data_head_false_case)) = 248)) (PreH5 : ((Zlength (data_tail_false_case)) = 8)) (PreH6 : ((Zlength (old_sram_false_case)) = 1024)) ,
  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
  **  (CharArray.full 1074343936 1024 old_sram_false_case )
|--
  EX (ptr1: Z)  (new_sram: (@list Z)) ,
  “ (STSTransDataSaveBytePost ptr_false_case ptr1 (app (data_head_false_case) (data_tail_false_case)) old_sram_false_case new_sram ) ”
  &&  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr1)
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
  **  (CharArray.full 1074343936 1024 new_sram )
) \/
(
forall (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (ptr_false_case >= 776)) (PreH2 : (776 <= ptr_false_case)) (PreH3 : (ptr_false_case <= 1024)) (PreH4 : ((Zlength (data_head_false_case)) = 248)) (PreH5 : ((Zlength (data_tail_false_case)) = 8)) (PreH6 : ((Zlength (old_sram_false_case)) = 1024)) ,
  TT && emp 
|--
  “ (STSTransDataSaveBytePost ptr_false_case ptr_false_case (app (data_head_false_case) (data_tail_false_case)) old_sram_false_case old_sram_false_case ) ”
  &&  emp
).

Definition STSTransDataSave_return_wit_2_false_case_split_goal_1 := 
forall (old_sram_false_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (PreH1 : (ptr_false_case >= 776)) (PreH2 : (776 <= ptr_false_case)) (PreH3 : (ptr_false_case <= 1024)) (PreH4 : ((Zlength (data_head_false_case)) = 248)) (PreH5 : ((Zlength (data_tail_false_case)) = 8)) (PreH6 : ((Zlength (old_sram_false_case)) = 1024)) ,
  TT && emp 
|--
  “ (STSTransDataSaveBytePost ptr_false_case ptr_false_case (app (data_head_false_case) (data_tail_false_case)) old_sram_false_case old_sram_false_case ) ”
.

Definition STSTransDataSave_partial_solve_wit_1_pure := 
(
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (248 = 248) ” 
  &&  “ (0 <= 248) ” 
  &&  “ (248 < INT_MAX) ” 
  &&  “ ((Zlength (old_dst_true_case)) = 248) ” 
  &&  “ ((Zlength (data_head_false_case)) = 248) ”
) \/
(
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case <= UINT_MAX)) (PreH2 : (pDst <= UINT_MAX)) (PreH3 : (ptr_false_case >= 0)) (PreH4 : (pDst >= 0)) (PreH5 : (0 <= 8)) (PreH6 : (0 <= ((1024 - ptr_false_case ) - 248 ))) (PreH7 : (0 <= 248)) (PreH8 : (0 <= ptr_false_case)) (PreH9 : (ptr_false_case < 776)) (PreH10 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ ((Zlength (data_head_false_case)) = 248) ” 
  &&  “ ((Zlength (old_dst_true_case)) = 248) ”
).

Definition STSTransDataSave_partial_solve_wit_1_pure_split_goal_1 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case <= UINT_MAX)) (PreH2 : (pDst <= UINT_MAX)) (PreH3 : (ptr_false_case >= 0)) (PreH4 : (pDst >= 0)) (PreH5 : (0 <= 8)) (PreH6 : (0 <= ((1024 - ptr_false_case ) - 248 ))) (PreH7 : (0 <= 248)) (PreH8 : (0 <= ptr_false_case)) (PreH9 : (ptr_false_case < 776)) (PreH10 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ ((Zlength (data_head_false_case)) = 248) ”
.

Definition STSTransDataSave_partial_solve_wit_1_pure_split_goal_2 := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case <= UINT_MAX)) (PreH2 : (pDst <= UINT_MAX)) (PreH3 : (ptr_false_case >= 0)) (PreH4 : (pDst >= 0)) (PreH5 : (0 <= 8)) (PreH6 : (0 <= ((1024 - ptr_false_case ) - 248 ))) (PreH7 : (0 <= 248)) (PreH8 : (0 <= ptr_false_case)) (PreH9 : (ptr_false_case < 776)) (PreH10 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((( &( "pDst" ) )) # UInt  |-> pDst)
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ ((Zlength (old_dst_true_case)) = 248) ”
.

Definition STSTransDataSave_partial_solve_wit_1_aux := 
forall (suffix_true_case: (@list Z)) (old_dst_true_case: (@list Z)) (prefix_true_case: (@list Z)) (data_tail_false_case: (@list Z)) (data_head_false_case: (@list Z)) (ptr_false_case: Z) (pDst: Z) (PreH1 : (ptr_false_case < 776)) (PreH2 : (pDst = (1074343936 + ptr_false_case ))) ,
  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
|--
  “ (248 = 248) ” 
  &&  “ (0 <= 248) ” 
  &&  “ (248 < INT_MAX) ” 
  &&  “ ((Zlength (old_dst_true_case)) = 248) ” 
  &&  “ ((Zlength (data_head_false_case)) = 248) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (0 <= ((1024 - ptr_false_case ) - 248 )) ” 
  &&  “ (0 <= ptr_false_case) ” 
  &&  “ (ptr_false_case < 776) ” 
  &&  “ (pDst = (1074343936 + ptr_false_case )) ”
  &&  (CharArray.full pDst 248 old_dst_true_case )
  **  (CharArray.full (&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) 248 data_head_false_case )
  **  ((&(( &( "sSTSTran" ) )->ₛ "ptr")) # UInt  |-> ptr_false_case)
  **  (CharArray.full 1074343936 ptr_false_case prefix_true_case )
  **  (CharArray.full (pDst + 248 ) ((1024 - ptr_false_case ) - 248 ) suffix_true_case )
  **  (CharArray.full ((&(( &( "sSTSTran" ) )->ₛ "dataBuf") + (0 * sizeof(UCHAR) ) ) + 248 ) 8 data_tail_false_case )
.

Definition STSTransDataSave_partial_solve_wit_1 := STSTransDataSave_partial_solve_wit_1_pure -> STSTransDataSave_partial_solve_wit_1_aux.

Module Type VC_Correct.

Include char_array_Strategy_Correct.

Axiom proof_of_STSTransDataSave_safety_wit_1_true_case : STSTransDataSave_safety_wit_1_true_case.
Axiom proof_of_STSTransDataSave_safety_wit_2_false_case : STSTransDataSave_safety_wit_2_false_case.
Axiom proof_of_STSTransDataSave_safety_wit_3_true_case : STSTransDataSave_safety_wit_3_true_case.
Axiom proof_of_STSTransDataSave_safety_wit_4_false_case : STSTransDataSave_safety_wit_4_false_case.
Axiom proof_of_STSTransDataSave_safety_wit_5 : STSTransDataSave_safety_wit_5.
Axiom proof_of_STSTransDataSave_safety_wit_6 : STSTransDataSave_safety_wit_6.
Axiom proof_of_STSTransDataSave_safety_wit_7 : STSTransDataSave_safety_wit_7.
Axiom proof_of_STSTransDataSave_entail_wit_1_true_case : STSTransDataSave_entail_wit_1_true_case.
Axiom proof_of_STSTransDataSave_entail_wit_2 : STSTransDataSave_entail_wit_2.
Axiom proof_of_STSTransDataSave_return_wit_1 : STSTransDataSave_return_wit_1.
Axiom proof_of_STSTransDataSave_return_wit_2_false_case : STSTransDataSave_return_wit_2_false_case.
Axiom proof_of_STSTransDataSave_partial_solve_wit_1_pure : STSTransDataSave_partial_solve_wit_1_pure.
Axiom proof_of_STSTransDataSave_partial_solve_wit_1 : STSTransDataSave_partial_solve_wit_1.

End VC_Correct.
