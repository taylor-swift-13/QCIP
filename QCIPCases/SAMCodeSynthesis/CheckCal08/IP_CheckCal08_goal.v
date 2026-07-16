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
Require Import QCIPLib.SAMCodeSynthesis.CheckCal08.IP_CheckCal08_lib.
Local Open Scope sac.

(*----- Function CheckCal08Fun -----*)

Definition CheckCal08Fun_safety_wit_1 := 
forall (pIp_pre: Z) (pkv_addr: Z) (old_chksum: Z) (len: Z) (pkv_list: (@list Z)) (PreH1 : (0 <= len)) (PreH2 : ((Zlength (pkv_list)) = len)) ,
  ((( &( "i" ) )) # UInt  |->_)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> old_chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CheckCal08Fun_safety_wit_2 := 
forall (pIp_pre: Z) (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (PreH1 : (0 <= len)) (PreH2 : ((Zlength (pkv_list)) = len)) ,
  ((( &( "i" ) )) # UInt  |->_)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> 0)
  **  (UCharArray.full pkv_addr len pkv_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition CheckCal08Fun_safety_wit_3 := 
(
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  (UCharArray.full pkv_addr len pkv_list )
  **  ((( &( "i" ) )) # UInt  |-> i)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
|--
  “ ((chksum + (Znth i pkv_list 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (chksum + (Znth i pkv_list 0) )) ”
) \/
(
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  (UCharArray.full pkv_addr len pkv_list )
  **  ((( &( "i" ) )) # UInt  |-> i)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
|--
  “ ((chksum + (Znth i pkv_list 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (chksum + (Znth i pkv_list 0) )) ”
).

Definition CheckCal08Fun_safety_wit_3_split_goal_1 := 
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  (UCharArray.full pkv_addr len pkv_list )
  **  ((( &( "i" ) )) # UInt  |-> i)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
|--
  “ ((chksum + (Znth i pkv_list 0) ) <= INT_MAX) ”
.

Definition CheckCal08Fun_safety_wit_3_split_goal_2 := 
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  (UCharArray.full pkv_addr len pkv_list )
  **  ((( &( "i" ) )) # UInt  |-> i)
  **  ((( &( "len_local" ) )) # UInt  |-> len)
  **  ((( &( "pkv_local" ) )) # Ptr  |-> pkv_addr)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
|--
  “ ((INT_MIN) <= (chksum + (Znth i pkv_list 0) )) ”
.

Definition CheckCal08Fun_entail_wit_1 := 
(
forall (pIp_pre: Z) (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (PreH1 : (0 <= len)) (PreH2 : ((Zlength (pkv_list)) = len)) ,
  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> 0)
  **  (UCharArray.full pkv_addr len pkv_list )
|--
  EX (chksum: Z) ,
  “ (0 <= 0) ” 
  &&  “ (0 <= len) ” 
  &&  “ (CheckCal08Inv pkv_list len 0 chksum ) ”
  &&  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp_pre)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
) \/
(
forall (len: Z) (pkv_list: (@list Z)) (PreH1 : (0 <= len)) (PreH2 : ((Zlength (pkv_list)) = len)) ,
  TT && emp 
|--
  “ (CheckCal08Inv pkv_list len 0 0 ) ”
  &&  emp
).

Definition CheckCal08Fun_entail_wit_1_split_goal_1 := 
forall (len: Z) (pkv_list: (@list Z)) (PreH1 : (0 <= len)) (PreH2 : ((Zlength (pkv_list)) = len)) ,
  (CheckCal08Inv pkv_list len 0 0 )
.

Definition CheckCal08Fun_entail_wit_2 := 
(
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum_2: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum_2 )) ,
  (UCharArray.full pkv_addr len pkv_list )
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> (unsigned_last_nbits ((chksum_2 + (Znth i pkv_list 0) )) (8)))
|--
  EX (chksum: Z) ,
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= len) ” 
  &&  “ (CheckCal08Inv pkv_list len (i + 1 ) chksum ) ”
  &&  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
) \/
(
forall (len: Z) (pkv_list: (@list Z)) (chksum_2: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum_2 )) ,
  TT && emp 
|--
  “ (CheckCal08Inv pkv_list len (i + 1 ) (unsigned_last_nbits ((chksum_2 + (Znth i pkv_list 0) )) (8)) ) ”
  &&  emp
).

Definition CheckCal08Fun_entail_wit_2_split_goal_1 := 
forall (len: Z) (pkv_list: (@list Z)) (chksum_2: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum_2 )) ,
  (CheckCal08Inv pkv_list len (i + 1 ) (unsigned_last_nbits ((chksum_2 + (Znth i pkv_list 0) )) (8)) )
.

Definition CheckCal08Fun_return_wit_1 := 
(
forall (pIp_pre: Z) (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i >= len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
|--
  EX (new_chksum: Z) ,
  “ (CheckCal08Post pkv_list len new_chksum ) ”
  &&  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> new_chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
) \/
(
forall (pIp_pre: Z) (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (len <= UINT_MAX)) (PreH2 : (len >= 0)) (PreH3 : (i >= len)) (PreH4 : (0 <= i)) (PreH5 : (i <= len)) (PreH6 : (CheckCal08Inv pkv_list len i chksum )) ,
  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
|--
  EX (new_chksum: Z) ,
  “ (CheckCal08Post pkv_list len new_chksum ) ”
  &&  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> new_chksum)
).

Definition CheckCal08Fun_partial_solve_wit_1 := 
forall (pkv_addr: Z) (len: Z) (pkv_list: (@list Z)) (pIp: Z) (chksum: Z) (i: Z) (PreH1 : (i < len)) (PreH2 : (0 <= i)) (PreH3 : (i <= len)) (PreH4 : (CheckCal08Inv pkv_list len i chksum )) ,
  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
  **  (UCharArray.full pkv_addr len pkv_list )
|--
  “ (i < len) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= len) ” 
  &&  “ (CheckCal08Inv pkv_list len i chksum ) ”
  &&  (((pkv_addr + (i * sizeof(UCHAR)))) # UChar  |-> (Znth i pkv_list 0))
  **  (UCharArray.missing_i pkv_addr i 0 len pkv_list )
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "pkv")) # Ptr  |-> pkv_addr)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "len")) # UInt  |-> len)
  **  ((&((pIp)  # "__CheckCal08" ->ₛ "chksum")) # UChar  |-> chksum)
.

Module Type VC_Correct.


Axiom proof_of_CheckCal08Fun_safety_wit_1 : CheckCal08Fun_safety_wit_1.
Axiom proof_of_CheckCal08Fun_safety_wit_2 : CheckCal08Fun_safety_wit_2.
Axiom proof_of_CheckCal08Fun_safety_wit_3 : CheckCal08Fun_safety_wit_3.
Axiom proof_of_CheckCal08Fun_entail_wit_1 : CheckCal08Fun_entail_wit_1.
Axiom proof_of_CheckCal08Fun_entail_wit_2 : CheckCal08Fun_entail_wit_2.
Axiom proof_of_CheckCal08Fun_return_wit_1 : CheckCal08Fun_return_wit_1.
Axiom proof_of_CheckCal08Fun_partial_solve_wit_1 : CheckCal08Fun_partial_solve_wit_1.

End VC_Correct.
