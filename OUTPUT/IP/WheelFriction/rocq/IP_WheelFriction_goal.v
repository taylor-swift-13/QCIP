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
Require Import SimpleC.EE.LLM_bench.Engineering.WheelFriction.IP_WheelFriction_lib.
Local Open Scope sac.

(*----- Function WheelFricComp -----*)

Definition WheelFricComp_safety_wit_1 := 
forall (vf0_pre: Z) (cut_pre: Z) (kf_pre: Z) ,
  ((( &( "vf0" ) )) # UInt  |-> vf0_pre)
  **  ((( &( "cut" ) )) # UInt  |-> cut_pre)
  **  ((( &( "kf" ) )) # UInt  |-> kf_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFricComp_return_wit_1 := 
  TT && emp 
|--
  “ (0 = 0) ”
  &&  emp
.

(*----- Function WheelFriction -----*)

Definition WheelFriction_safety_wit_1 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_2 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_3 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_4 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_5 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_6 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_7 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_8 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_9 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_10 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_11 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_12 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_13 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_14 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_15 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_16 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_17 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_18 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_19 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_20 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_21 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_22 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition WheelFriction_safety_wit_23 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_24 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_25 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv1 = 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_26 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv1 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_27 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_28 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_29 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_30 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 <> 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_31 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv1 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_32 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv1 = 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_33 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_34 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_35 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_36 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_37 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_38 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_39 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_40 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_41 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_42 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_43 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_44 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_45 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_46 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_47 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_48 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_49 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_50 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_51 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_52 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition WheelFriction_safety_wit_53 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_54 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_55 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_56 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_57 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_58 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_59 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_60 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_61 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_62 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_63 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_64 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_65 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_66 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_67 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_68 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 <> 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_69 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_70 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_71 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_72 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv2 = 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3952088175 <= 9223372036854775807) ” 
  &&  “ ((-9223372036854775808) <= 3952088175) ”
.

Definition WheelFriction_safety_wit_73 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_74 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_75 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_76 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_77 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_78 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_79 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_80 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_81 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_82 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_83 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_84 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_85 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_86 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_87 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_88 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_89 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_90 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_91 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_92 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_93 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_94 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_95 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_96 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_97 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_98 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_99 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_100 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_101 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_102 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_103 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_104 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_105 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_106 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_107 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_108 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_109 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_110 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_111 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_112 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition WheelFriction_safety_wit_113 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_114 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_115 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_116 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_117 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_118 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_119 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_safety_wit_120 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition WheelFriction_return_wit_1 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_1_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ”
.

Definition WheelFriction_return_wit_1_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_1_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ”
.

Definition WheelFriction_return_wit_1_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_2 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_2_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ”
.

Definition WheelFriction_return_wit_2_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_2_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ”
.

Definition WheelFriction_return_wit_2_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_3 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_3_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval ) ”
.

Definition WheelFriction_return_wit_3_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_3_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_3_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_4 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_4_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ”
.

Definition WheelFriction_return_wit_4_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_4_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_4_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (fv2 <> 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_5 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_5_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ”
.

Definition WheelFriction_return_wit_5_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ”
.

Definition WheelFriction_return_wit_5_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ”
.

Definition WheelFriction_return_wit_5_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_6 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_4)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_4 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_3 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_6_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_4 ) ”
.

Definition WheelFriction_return_wit_6_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_3 ) ”
.

Definition WheelFriction_return_wit_6_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ”
.

Definition WheelFriction_return_wit_6_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_3 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (retval_2 = 0)) (PreH6 : (fv1 = 3952088175)) (PreH7 : (retval = 0)) (PreH8 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_7 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_7_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_2 ) ”
.

Definition WheelFriction_return_wit_7_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval ) ”
.

Definition WheelFriction_return_wit_7_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_7_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_8 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_8_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 retval_3 ) ”
.

Definition WheelFriction_return_wit_8_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ”
.

Definition WheelFriction_return_wit_8_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_8_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (fv3 = 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv2 = 3952088175)) (PreH5 : (fv1 <> 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_9 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_9_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_9_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_9_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ”
.

Definition WheelFriction_return_wit_9_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_10 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_10_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_10_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_10_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ”
.

Definition WheelFriction_return_wit_10_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_11 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_11_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_11_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_11_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_11_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_12 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_12_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_12_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 0 ) ”
.

Definition WheelFriction_return_wit_12_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_12_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_13 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_13_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_13_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ”
.

Definition WheelFriction_return_wit_13_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval ) ”
.

Definition WheelFriction_return_wit_13_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_14 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_3 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_14_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_14_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_3 ) ”
.

Definition WheelFriction_return_wit_14_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 retval_2 ) ”
.

Definition WheelFriction_return_wit_14_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_return_wit_15 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
  &&  emp
).

Definition WheelFriction_return_wit_15_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_15_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval ) ”
.

Definition WheelFriction_return_wit_15_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_15_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 0 ) ”
.

Definition WheelFriction_return_wit_16 := 
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  EX (vf3': Z)  (vf2': Z)  (vf1': Z)  (vf0': Z) ,
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 vf0' ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 vf1' ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 vf2' ) ” 
  &&  “ (WheelFricPost1 fv3 kf3 cut3 vf03 vf3' ) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf0')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf1')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf2')
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf3')
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
) \/
(
forall (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ” 
  &&  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ” 
  &&  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ” 
  &&  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
  &&  emp
).

Definition WheelFriction_return_wit_16_split_goal_1 := 
forall (vf03: Z) (cut3: Z) (kf3: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv3 kf3 cut3 vf03 0 ) ”
.

Definition WheelFriction_return_wit_16_split_goal_2 := 
forall (vf02: Z) (cut2: Z) (kf2: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv2 kf2 cut2 vf02 retval_2 ) ”
.

Definition WheelFriction_return_wit_16_split_goal_3 := 
forall (vf01: Z) (cut1: Z) (kf1: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv1 kf1 cut1 vf01 0 ) ”
.

Definition WheelFriction_return_wit_16_split_goal_4 := 
forall (vf00: Z) (cut0: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 <> 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  TT && emp 
|--
  “ (WheelFricPost1 fv0 kf0 cut0 vf00 retval ) ”
.

Definition WheelFriction_partial_solve_wit_1 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf_old0: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> vf_old0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_2 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv1 = 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_3 := 
forall (vf_old3: Z) (vf_old2: Z) (vf_old1: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv1 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv1 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> vf_old1)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_4 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv2 = 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_5 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (fv1 <> 3952088175)) (PreH3 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv2 = 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_6 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv2 = 3952088175) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_7 := 
forall (vf_old3: Z) (vf_old2: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv2 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv1 = 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv2 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> vf_old2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_8 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (fv2 <> 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_9 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (retval_2 = 0)) (PreH4 : (fv1 = 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (fv2 <> 3952088175) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_10 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (fv2 <> 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_11 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (fv2 <> 3952088175)) (PreH3 : (fv1 <> 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (fv2 <> 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_12 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (fv2 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_13 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_3 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (retval_2 = 0)) (PreH5 : (fv1 = 3952088175)) (PreH6 : (retval = 0)) (PreH7 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (retval_3 = 0) ” 
  &&  “ (fv2 = 3952088175) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (fv1 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_14 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (fv0 <> 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv2 = 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (fv0 <> 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Definition WheelFriction_partial_solve_wit_15 := 
forall (vf_old3: Z) (vf03: Z) (vf02: Z) (vf01: Z) (vf00: Z) (cut3: Z) (cut2: Z) (cut1: Z) (cut0: Z) (kf3: Z) (kf2: Z) (kf1: Z) (kf0: Z) (fv3: Z) (fv2: Z) (fv1: Z) (fv0: Z) (retval: Z) (retval_2: Z) (PreH1 : (fv3 = 3952088175)) (PreH2 : (retval_2 = 0)) (PreH3 : (fv2 = 3952088175)) (PreH4 : (fv1 <> 3952088175)) (PreH5 : (retval = 0)) (PreH6 : (fv0 = 3952088175)) ,
  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
|--
  “ (fv3 = 3952088175) ” 
  &&  “ (retval_2 = 0) ” 
  &&  “ (fv2 = 3952088175) ” 
  &&  “ (fv1 <> 3952088175) ” 
  &&  “ (retval = 0) ” 
  &&  “ (fv0 = 3952088175) ”
  &&  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (0 * sizeof(UINT) ) )) # UInt  |-> fv0)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (1 * sizeof(UINT) ) )) # UInt  |-> fv1)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (2 * sizeof(UINT) ) )) # UInt  |-> fv2)
  **  (((&(( &( "sMWData" ) )->ₛ "F_Valid_MW") + (3 * sizeof(UINT) ) )) # UInt  |-> fv3)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (0 * sizeof(UINT) ) )) # UInt  |-> retval)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (1 * sizeof(UINT) ) )) # UInt  |-> 0)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (2 * sizeof(UINT) ) )) # UInt  |-> retval_2)
  **  (((&(( &( "sMWData" ) )->ₛ "vf") + (3 * sizeof(UINT) ) )) # UInt  |-> vf_old3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (0 * sizeof(UINT) ) )) # UInt  |-> kf0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (1 * sizeof(UINT) ) )) # UInt  |-> kf1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (2 * sizeof(UINT) ) )) # UInt  |-> kf2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "kf") + (3 * sizeof(UINT) ) )) # UInt  |-> kf3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (0 * sizeof(UINT) ) )) # UInt  |-> cut0)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (1 * sizeof(UINT) ) )) # UInt  |-> cut1)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (2 * sizeof(UINT) ) )) # UInt  |-> cut2)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "cut") + (3 * sizeof(UINT) ) )) # UInt  |-> cut3)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (0 * sizeof(UINT) ) )) # UInt  |-> vf00)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (1 * sizeof(UINT) ) )) # UInt  |-> vf01)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (2 * sizeof(UINT) ) )) # UInt  |-> vf02)
  **  (((&(( &( "sMWCtrl" ) )->ₛ "vf0") + (3 * sizeof(UINT) ) )) # UInt  |-> vf03)
.

Module Type VC_Correct.


Axiom proof_of_WheelFricComp_safety_wit_1 : WheelFricComp_safety_wit_1.
Axiom proof_of_WheelFricComp_return_wit_1 : WheelFricComp_return_wit_1.
Axiom proof_of_WheelFriction_safety_wit_1 : WheelFriction_safety_wit_1.
Axiom proof_of_WheelFriction_safety_wit_2 : WheelFriction_safety_wit_2.
Axiom proof_of_WheelFriction_safety_wit_3 : WheelFriction_safety_wit_3.
Axiom proof_of_WheelFriction_safety_wit_4 : WheelFriction_safety_wit_4.
Axiom proof_of_WheelFriction_safety_wit_5 : WheelFriction_safety_wit_5.
Axiom proof_of_WheelFriction_safety_wit_6 : WheelFriction_safety_wit_6.
Axiom proof_of_WheelFriction_safety_wit_7 : WheelFriction_safety_wit_7.
Axiom proof_of_WheelFriction_safety_wit_8 : WheelFriction_safety_wit_8.
Axiom proof_of_WheelFriction_safety_wit_9 : WheelFriction_safety_wit_9.
Axiom proof_of_WheelFriction_safety_wit_10 : WheelFriction_safety_wit_10.
Axiom proof_of_WheelFriction_safety_wit_11 : WheelFriction_safety_wit_11.
Axiom proof_of_WheelFriction_safety_wit_12 : WheelFriction_safety_wit_12.
Axiom proof_of_WheelFriction_safety_wit_13 : WheelFriction_safety_wit_13.
Axiom proof_of_WheelFriction_safety_wit_14 : WheelFriction_safety_wit_14.
Axiom proof_of_WheelFriction_safety_wit_15 : WheelFriction_safety_wit_15.
Axiom proof_of_WheelFriction_safety_wit_16 : WheelFriction_safety_wit_16.
Axiom proof_of_WheelFriction_safety_wit_17 : WheelFriction_safety_wit_17.
Axiom proof_of_WheelFriction_safety_wit_18 : WheelFriction_safety_wit_18.
Axiom proof_of_WheelFriction_safety_wit_19 : WheelFriction_safety_wit_19.
Axiom proof_of_WheelFriction_safety_wit_20 : WheelFriction_safety_wit_20.
Axiom proof_of_WheelFriction_safety_wit_21 : WheelFriction_safety_wit_21.
Axiom proof_of_WheelFriction_safety_wit_22 : WheelFriction_safety_wit_22.
Axiom proof_of_WheelFriction_safety_wit_23 : WheelFriction_safety_wit_23.
Axiom proof_of_WheelFriction_safety_wit_24 : WheelFriction_safety_wit_24.
Axiom proof_of_WheelFriction_safety_wit_25 : WheelFriction_safety_wit_25.
Axiom proof_of_WheelFriction_safety_wit_26 : WheelFriction_safety_wit_26.
Axiom proof_of_WheelFriction_safety_wit_27 : WheelFriction_safety_wit_27.
Axiom proof_of_WheelFriction_safety_wit_28 : WheelFriction_safety_wit_28.
Axiom proof_of_WheelFriction_safety_wit_29 : WheelFriction_safety_wit_29.
Axiom proof_of_WheelFriction_safety_wit_30 : WheelFriction_safety_wit_30.
Axiom proof_of_WheelFriction_safety_wit_31 : WheelFriction_safety_wit_31.
Axiom proof_of_WheelFriction_safety_wit_32 : WheelFriction_safety_wit_32.
Axiom proof_of_WheelFriction_safety_wit_33 : WheelFriction_safety_wit_33.
Axiom proof_of_WheelFriction_safety_wit_34 : WheelFriction_safety_wit_34.
Axiom proof_of_WheelFriction_safety_wit_35 : WheelFriction_safety_wit_35.
Axiom proof_of_WheelFriction_safety_wit_36 : WheelFriction_safety_wit_36.
Axiom proof_of_WheelFriction_safety_wit_37 : WheelFriction_safety_wit_37.
Axiom proof_of_WheelFriction_safety_wit_38 : WheelFriction_safety_wit_38.
Axiom proof_of_WheelFriction_safety_wit_39 : WheelFriction_safety_wit_39.
Axiom proof_of_WheelFriction_safety_wit_40 : WheelFriction_safety_wit_40.
Axiom proof_of_WheelFriction_safety_wit_41 : WheelFriction_safety_wit_41.
Axiom proof_of_WheelFriction_safety_wit_42 : WheelFriction_safety_wit_42.
Axiom proof_of_WheelFriction_safety_wit_43 : WheelFriction_safety_wit_43.
Axiom proof_of_WheelFriction_safety_wit_44 : WheelFriction_safety_wit_44.
Axiom proof_of_WheelFriction_safety_wit_45 : WheelFriction_safety_wit_45.
Axiom proof_of_WheelFriction_safety_wit_46 : WheelFriction_safety_wit_46.
Axiom proof_of_WheelFriction_safety_wit_47 : WheelFriction_safety_wit_47.
Axiom proof_of_WheelFriction_safety_wit_48 : WheelFriction_safety_wit_48.
Axiom proof_of_WheelFriction_safety_wit_49 : WheelFriction_safety_wit_49.
Axiom proof_of_WheelFriction_safety_wit_50 : WheelFriction_safety_wit_50.
Axiom proof_of_WheelFriction_safety_wit_51 : WheelFriction_safety_wit_51.
Axiom proof_of_WheelFriction_safety_wit_52 : WheelFriction_safety_wit_52.
Axiom proof_of_WheelFriction_safety_wit_53 : WheelFriction_safety_wit_53.
Axiom proof_of_WheelFriction_safety_wit_54 : WheelFriction_safety_wit_54.
Axiom proof_of_WheelFriction_safety_wit_55 : WheelFriction_safety_wit_55.
Axiom proof_of_WheelFriction_safety_wit_56 : WheelFriction_safety_wit_56.
Axiom proof_of_WheelFriction_safety_wit_57 : WheelFriction_safety_wit_57.
Axiom proof_of_WheelFriction_safety_wit_58 : WheelFriction_safety_wit_58.
Axiom proof_of_WheelFriction_safety_wit_59 : WheelFriction_safety_wit_59.
Axiom proof_of_WheelFriction_safety_wit_60 : WheelFriction_safety_wit_60.
Axiom proof_of_WheelFriction_safety_wit_61 : WheelFriction_safety_wit_61.
Axiom proof_of_WheelFriction_safety_wit_62 : WheelFriction_safety_wit_62.
Axiom proof_of_WheelFriction_safety_wit_63 : WheelFriction_safety_wit_63.
Axiom proof_of_WheelFriction_safety_wit_64 : WheelFriction_safety_wit_64.
Axiom proof_of_WheelFriction_safety_wit_65 : WheelFriction_safety_wit_65.
Axiom proof_of_WheelFriction_safety_wit_66 : WheelFriction_safety_wit_66.
Axiom proof_of_WheelFriction_safety_wit_67 : WheelFriction_safety_wit_67.
Axiom proof_of_WheelFriction_safety_wit_68 : WheelFriction_safety_wit_68.
Axiom proof_of_WheelFriction_safety_wit_69 : WheelFriction_safety_wit_69.
Axiom proof_of_WheelFriction_safety_wit_70 : WheelFriction_safety_wit_70.
Axiom proof_of_WheelFriction_safety_wit_71 : WheelFriction_safety_wit_71.
Axiom proof_of_WheelFriction_safety_wit_72 : WheelFriction_safety_wit_72.
Axiom proof_of_WheelFriction_safety_wit_73 : WheelFriction_safety_wit_73.
Axiom proof_of_WheelFriction_safety_wit_74 : WheelFriction_safety_wit_74.
Axiom proof_of_WheelFriction_safety_wit_75 : WheelFriction_safety_wit_75.
Axiom proof_of_WheelFriction_safety_wit_76 : WheelFriction_safety_wit_76.
Axiom proof_of_WheelFriction_safety_wit_77 : WheelFriction_safety_wit_77.
Axiom proof_of_WheelFriction_safety_wit_78 : WheelFriction_safety_wit_78.
Axiom proof_of_WheelFriction_safety_wit_79 : WheelFriction_safety_wit_79.
Axiom proof_of_WheelFriction_safety_wit_80 : WheelFriction_safety_wit_80.
Axiom proof_of_WheelFriction_safety_wit_81 : WheelFriction_safety_wit_81.
Axiom proof_of_WheelFriction_safety_wit_82 : WheelFriction_safety_wit_82.
Axiom proof_of_WheelFriction_safety_wit_83 : WheelFriction_safety_wit_83.
Axiom proof_of_WheelFriction_safety_wit_84 : WheelFriction_safety_wit_84.
Axiom proof_of_WheelFriction_safety_wit_85 : WheelFriction_safety_wit_85.
Axiom proof_of_WheelFriction_safety_wit_86 : WheelFriction_safety_wit_86.
Axiom proof_of_WheelFriction_safety_wit_87 : WheelFriction_safety_wit_87.
Axiom proof_of_WheelFriction_safety_wit_88 : WheelFriction_safety_wit_88.
Axiom proof_of_WheelFriction_safety_wit_89 : WheelFriction_safety_wit_89.
Axiom proof_of_WheelFriction_safety_wit_90 : WheelFriction_safety_wit_90.
Axiom proof_of_WheelFriction_safety_wit_91 : WheelFriction_safety_wit_91.
Axiom proof_of_WheelFriction_safety_wit_92 : WheelFriction_safety_wit_92.
Axiom proof_of_WheelFriction_safety_wit_93 : WheelFriction_safety_wit_93.
Axiom proof_of_WheelFriction_safety_wit_94 : WheelFriction_safety_wit_94.
Axiom proof_of_WheelFriction_safety_wit_95 : WheelFriction_safety_wit_95.
Axiom proof_of_WheelFriction_safety_wit_96 : WheelFriction_safety_wit_96.
Axiom proof_of_WheelFriction_safety_wit_97 : WheelFriction_safety_wit_97.
Axiom proof_of_WheelFriction_safety_wit_98 : WheelFriction_safety_wit_98.
Axiom proof_of_WheelFriction_safety_wit_99 : WheelFriction_safety_wit_99.
Axiom proof_of_WheelFriction_safety_wit_100 : WheelFriction_safety_wit_100.
Axiom proof_of_WheelFriction_safety_wit_101 : WheelFriction_safety_wit_101.
Axiom proof_of_WheelFriction_safety_wit_102 : WheelFriction_safety_wit_102.
Axiom proof_of_WheelFriction_safety_wit_103 : WheelFriction_safety_wit_103.
Axiom proof_of_WheelFriction_safety_wit_104 : WheelFriction_safety_wit_104.
Axiom proof_of_WheelFriction_safety_wit_105 : WheelFriction_safety_wit_105.
Axiom proof_of_WheelFriction_safety_wit_106 : WheelFriction_safety_wit_106.
Axiom proof_of_WheelFriction_safety_wit_107 : WheelFriction_safety_wit_107.
Axiom proof_of_WheelFriction_safety_wit_108 : WheelFriction_safety_wit_108.
Axiom proof_of_WheelFriction_safety_wit_109 : WheelFriction_safety_wit_109.
Axiom proof_of_WheelFriction_safety_wit_110 : WheelFriction_safety_wit_110.
Axiom proof_of_WheelFriction_safety_wit_111 : WheelFriction_safety_wit_111.
Axiom proof_of_WheelFriction_safety_wit_112 : WheelFriction_safety_wit_112.
Axiom proof_of_WheelFriction_safety_wit_113 : WheelFriction_safety_wit_113.
Axiom proof_of_WheelFriction_safety_wit_114 : WheelFriction_safety_wit_114.
Axiom proof_of_WheelFriction_safety_wit_115 : WheelFriction_safety_wit_115.
Axiom proof_of_WheelFriction_safety_wit_116 : WheelFriction_safety_wit_116.
Axiom proof_of_WheelFriction_safety_wit_117 : WheelFriction_safety_wit_117.
Axiom proof_of_WheelFriction_safety_wit_118 : WheelFriction_safety_wit_118.
Axiom proof_of_WheelFriction_safety_wit_119 : WheelFriction_safety_wit_119.
Axiom proof_of_WheelFriction_safety_wit_120 : WheelFriction_safety_wit_120.
Axiom proof_of_WheelFriction_return_wit_1 : WheelFriction_return_wit_1.
Axiom proof_of_WheelFriction_return_wit_2 : WheelFriction_return_wit_2.
Axiom proof_of_WheelFriction_return_wit_3 : WheelFriction_return_wit_3.
Axiom proof_of_WheelFriction_return_wit_4 : WheelFriction_return_wit_4.
Axiom proof_of_WheelFriction_return_wit_5 : WheelFriction_return_wit_5.
Axiom proof_of_WheelFriction_return_wit_6 : WheelFriction_return_wit_6.
Axiom proof_of_WheelFriction_return_wit_7 : WheelFriction_return_wit_7.
Axiom proof_of_WheelFriction_return_wit_8 : WheelFriction_return_wit_8.
Axiom proof_of_WheelFriction_return_wit_9 : WheelFriction_return_wit_9.
Axiom proof_of_WheelFriction_return_wit_10 : WheelFriction_return_wit_10.
Axiom proof_of_WheelFriction_return_wit_11 : WheelFriction_return_wit_11.
Axiom proof_of_WheelFriction_return_wit_12 : WheelFriction_return_wit_12.
Axiom proof_of_WheelFriction_return_wit_13 : WheelFriction_return_wit_13.
Axiom proof_of_WheelFriction_return_wit_14 : WheelFriction_return_wit_14.
Axiom proof_of_WheelFriction_return_wit_15 : WheelFriction_return_wit_15.
Axiom proof_of_WheelFriction_return_wit_16 : WheelFriction_return_wit_16.
Axiom proof_of_WheelFriction_partial_solve_wit_1 : WheelFriction_partial_solve_wit_1.
Axiom proof_of_WheelFriction_partial_solve_wit_2 : WheelFriction_partial_solve_wit_2.
Axiom proof_of_WheelFriction_partial_solve_wit_3 : WheelFriction_partial_solve_wit_3.
Axiom proof_of_WheelFriction_partial_solve_wit_4 : WheelFriction_partial_solve_wit_4.
Axiom proof_of_WheelFriction_partial_solve_wit_5 : WheelFriction_partial_solve_wit_5.
Axiom proof_of_WheelFriction_partial_solve_wit_6 : WheelFriction_partial_solve_wit_6.
Axiom proof_of_WheelFriction_partial_solve_wit_7 : WheelFriction_partial_solve_wit_7.
Axiom proof_of_WheelFriction_partial_solve_wit_8 : WheelFriction_partial_solve_wit_8.
Axiom proof_of_WheelFriction_partial_solve_wit_9 : WheelFriction_partial_solve_wit_9.
Axiom proof_of_WheelFriction_partial_solve_wit_10 : WheelFriction_partial_solve_wit_10.
Axiom proof_of_WheelFriction_partial_solve_wit_11 : WheelFriction_partial_solve_wit_11.
Axiom proof_of_WheelFriction_partial_solve_wit_12 : WheelFriction_partial_solve_wit_12.
Axiom proof_of_WheelFriction_partial_solve_wit_13 : WheelFriction_partial_solve_wit_13.
Axiom proof_of_WheelFriction_partial_solve_wit_14 : WheelFriction_partial_solve_wit_14.
Axiom proof_of_WheelFriction_partial_solve_wit_15 : WheelFriction_partial_solve_wit_15.

End VC_Correct.
