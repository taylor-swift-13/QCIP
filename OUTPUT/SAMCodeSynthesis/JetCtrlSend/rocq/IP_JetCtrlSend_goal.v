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
Require Import QCIPLib.SAMCodeSynthesis.JetCtrlSend.IP_JetCtrlSend_lib.
Local Open Scope sac.

(*----- Function JetCtrlSendPairStep -----*)

Definition JetCtrlSendPairStep_safety_wit_1 := 
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (0 <= w_pre)) (PreH2 : (w_pre < 256)) (PreH3 : (0 <= mask_pre)) (PreH4 : (mask_pre < 256)) ,
  ((( &( "mask" ) )) # UChar  |-> mask_pre)
  **  ((( &( "w" ) )) # UChar  |-> w_pre)
  **  ((( &( "p1" ) )) # UInt  |-> p1_pre)
  **  ((( &( "p0" ) )) # UInt  |-> p0_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition JetCtrlSendPairStep_safety_wit_2 := 
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p0_pre <> 1)) (PreH2 : (0 <= w_pre)) (PreH3 : (w_pre < 256)) (PreH4 : (0 <= mask_pre)) (PreH5 : (mask_pre < 256)) ,
  ((( &( "mask" ) )) # UChar  |-> mask_pre)
  **  ((( &( "w" ) )) # UChar  |-> w_pre)
  **  ((( &( "p1" ) )) # UInt  |-> p1_pre)
  **  ((( &( "p0" ) )) # UInt  |-> p0_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition JetCtrlSendPairStep_return_wit_1 := 
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p0_pre = 1)) (PreH2 : (0 <= w_pre)) (PreH3 : (w_pre < 256)) (PreH4 : (0 <= mask_pre)) (PreH5 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
) \/
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p0_pre = 1)) (PreH2 : (0 <= w_pre)) (PreH3 : (w_pre < 256)) (PreH4 : (0 <= mask_pre)) (PreH5 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
).

Definition JetCtrlSendPairStep_return_wit_1_split_goal_1 := 
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p0_pre = 1)) (PreH2 : (0 <= w_pre)) (PreH3 : (w_pre < 256)) (PreH4 : (0 <= mask_pre)) (PreH5 : (mask_pre < 256)) ,
  ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre)))
.

Definition JetCtrlSendPairStep_return_wit_2 := 
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre = 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
) \/
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre = 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
).

Definition JetCtrlSendPairStep_return_wit_2_split_goal_1 := 
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre = 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  ((Z.lor w_pre mask_pre) = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre)))
.

Definition JetCtrlSendPairStep_return_wit_3 := 
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre <> 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ (w_pre = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
) \/
(
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre <> 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  TT && emp 
|--
  “ (w_pre = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre))) ”
  &&  emp
).

Definition JetCtrlSendPairStep_return_wit_3_split_goal_1 := 
forall (mask_pre: Z) (w_pre: Z) (p1_pre: Z) (p0_pre: Z) (PreH1 : (p1_pre <> 1)) (PreH2 : (p0_pre <> 1)) (PreH3 : (0 <= w_pre)) (PreH4 : (w_pre < 256)) (PreH5 : (0 <= mask_pre)) (PreH6 : (mask_pre < 256)) ,
  (w_pre = (jet_step (p0_pre) (p1_pre) (w_pre) (mask_pre)))
.

(*----- Function JetCtrlSendFun -----*)

Definition JetCtrlSendFun_safety_wit_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  ((( &( "wPulse" ) )) # UChar  |->_)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition JetCtrlSendFun_safety_wit_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  ((( &( "wPulse" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition JetCtrlSendFun_safety_wit_3 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition JetCtrlSendFun_safety_wit_4 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition JetCtrlSendFun_safety_wit_5 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition JetCtrlSendFun_safety_wit_6 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition JetCtrlSendFun_safety_wit_7 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition JetCtrlSendFun_safety_wit_8 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH2 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_2)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition JetCtrlSendFun_safety_wit_9 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH2 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_2)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition JetCtrlSendFun_safety_wit_10 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH2 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_2)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition JetCtrlSendFun_safety_wit_11 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH2 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_3)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition JetCtrlSendFun_safety_wit_12 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH2 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_3)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition JetCtrlSendFun_safety_wit_13 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH2 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_3)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition JetCtrlSendFun_safety_wit_14 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH2 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH3 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH4 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition JetCtrlSendFun_safety_wit_15 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH2 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH3 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH4 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition JetCtrlSendFun_safety_wit_16 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH2 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH3 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH4 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (64 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 64) ”
.

Definition JetCtrlSendFun_safety_wit_17 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH2 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH3 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH4 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH5 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_5)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition JetCtrlSendFun_safety_wit_18 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH2 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH3 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH4 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH5 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_5)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition JetCtrlSendFun_safety_wit_19 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH2 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH3 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH4 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH5 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_5)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition JetCtrlSendFun_safety_wit_20 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition JetCtrlSendFun_safety_wit_21 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (235 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 235) ”
.

Definition JetCtrlSendFun_safety_wit_22 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (0) (235) (sb_list)) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition JetCtrlSendFun_safety_wit_23 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (0) (235) (sb_list)) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (147 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 147) ”
.

Definition JetCtrlSendFun_safety_wit_24 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition JetCtrlSendFun_safety_wit_25 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval_6)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition JetCtrlSendFun_return_wit_1 := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )) (PreH2 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH3 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH4 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH5 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH6 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH7 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  EX (sent: (@list Z)) ,
  “ (UartSendRecord uartno sent ) ” 
  &&  “ (JetCtrlSendPost pulse_list sent ) ”
  &&  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  (UCharArray.full sb_addr 3 sent )
) \/
(
forall (sb_list: (@list Z)) (pulse_list: (@list Z)) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )) (PreH2 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH3 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH4 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH5 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH6 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH7 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  TT && emp 
|--
  “ (JetCtrlSendPost pulse_list (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) ) ”
  &&  emp
).

Definition JetCtrlSendFun_return_wit_1_split_goal_1 := 
forall (sb_list: (@list Z)) (pulse_list: (@list Z)) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )) (PreH2 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH3 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH4 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH5 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH6 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH7 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  (JetCtrlSendPost pulse_list (replace_Znth (2) (retval_6) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
.

Definition JetCtrlSendFun_partial_solve_wit_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (0 * sizeof(UINT)))) # UInt  |-> (Znth 0 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 0 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (1 * sizeof(UINT)))) # UInt  |-> (Znth 1 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 1 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_3_pure := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 256) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_3_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (PreH1 : ((Zlength (pulse_list)) = 12)) (PreH2 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 256) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 256) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_3 := JetCtrlSendFun_partial_solve_wit_3_pure -> JetCtrlSendFun_partial_solve_wit_3_aux.

Definition JetCtrlSendFun_partial_solve_wit_4 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (2 * sizeof(UINT)))) # UInt  |-> (Znth 2 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 2 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_5 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (3 * sizeof(UINT)))) # UInt  |-> (Znth 3 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 3 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_6_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ” 
  &&  “ (retval < 256) ”
).

Definition JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ”
.

Definition JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_6_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH2 : ((Zlength (pulse_list)) = 12)) (PreH3 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_6 := JetCtrlSendFun_partial_solve_wit_6_pure -> JetCtrlSendFun_partial_solve_wit_6_aux.

Definition JetCtrlSendFun_partial_solve_wit_7 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH2 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (4 * sizeof(UINT)))) # UInt  |-> (Znth 4 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 4 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_8 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH2 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (5 * sizeof(UINT)))) # UInt  |-> (Znth 5 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 5 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_9_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH2 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 16) ” 
  &&  “ (16 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH4 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ” 
  &&  “ (retval < 256) ”
).

Definition JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH4 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ”
.

Definition JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH4 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_9_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH2 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH3 : ((Zlength (pulse_list)) = 12)) (PreH4 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 16) ” 
  &&  “ (16 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_9 := JetCtrlSendFun_partial_solve_wit_9_pure -> JetCtrlSendFun_partial_solve_wit_9_aux.

Definition JetCtrlSendFun_partial_solve_wit_10 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH2 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (6 * sizeof(UINT)))) # UInt  |-> (Znth 6 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 6 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_11 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH2 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH3 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (7 * sizeof(UINT)))) # UInt  |-> (Znth 7 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 7 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_12_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH2 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH3 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 32) ” 
  &&  “ (32 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH4 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH5 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ” 
  &&  “ (retval < 256) ”
).

Definition JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH4 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH5 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ”
.

Definition JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH4 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH5 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_12_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH2 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH3 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH4 : ((Zlength (pulse_list)) = 12)) (PreH5 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 32) ” 
  &&  “ (32 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_12 := JetCtrlSendFun_partial_solve_wit_12_pure -> JetCtrlSendFun_partial_solve_wit_12_aux.

Definition JetCtrlSendFun_partial_solve_wit_13 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH2 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH3 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH4 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (8 * sizeof(UINT)))) # UInt  |-> (Znth 8 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 8 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_14 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH2 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH3 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH4 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (9 * sizeof(UINT)))) # UInt  |-> (Znth 9 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 9 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_15_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH2 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH3 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH4 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 64) ” 
  &&  “ (64 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH4 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH5 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH6 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ” 
  &&  “ (retval < 256) ”
).

Definition JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH4 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH5 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH6 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ”
.

Definition JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH4 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH5 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH6 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_15_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH2 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH3 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH4 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH5 : ((Zlength (pulse_list)) = 12)) (PreH6 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 64) ” 
  &&  “ (64 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_15 := JetCtrlSendFun_partial_solve_wit_15_pure -> JetCtrlSendFun_partial_solve_wit_15_aux.

Definition JetCtrlSendFun_partial_solve_wit_16 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH2 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH3 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH4 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH5 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (10 * sizeof(UINT)))) # UInt  |-> (Znth 10 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 10 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_17 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH2 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH3 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH4 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH5 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((pulse_addr + (11 * sizeof(UINT)))) # UInt  |-> (Znth 11 pulse_list 0))
  **  (UIntArray.missing_i pulse_addr 11 0 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_18_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH2 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH3 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH4 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH5 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 128) ” 
  &&  “ (128 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH4 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH5 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH6 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH7 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ” 
  &&  “ (retval < 256) ”
).

Definition JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH4 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH5 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH6 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH7 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= retval) ”
.

Definition JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_2 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH4 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH5 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH6 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH7 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH8 : ((Zlength (pulse_list)) = 12)) (PreH9 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval < 256) ”
.

Definition JetCtrlSendFun_partial_solve_wit_18_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH2 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH3 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH4 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH5 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH6 : ((Zlength (pulse_list)) = 12)) (PreH7 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (0 <= 128) ” 
  &&  “ (128 < 256) ” 
  &&  “ (retval < 256) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64))) ” 
  &&  “ (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
.

Definition JetCtrlSendFun_partial_solve_wit_18 := JetCtrlSendFun_partial_solve_wit_18_pure -> JetCtrlSendFun_partial_solve_wit_18_aux.

Definition JetCtrlSendFun_partial_solve_wit_19 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  (UCharArray.full sb_addr 3 sb_list )
|--
  “ (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128))) ” 
  &&  “ (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((sb_addr + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i sb_addr 0 0 3 sb_list )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
.

Definition JetCtrlSendFun_partial_solve_wit_20 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (0) (235) (sb_list)) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128))) ” 
  &&  “ (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((sb_addr + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i sb_addr 1 0 3 (replace_Znth (0) (235) (sb_list)) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
.

Definition JetCtrlSendFun_partial_solve_wit_21 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128)))) (PreH2 : (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64)))) (PreH3 : (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32)))) (PreH4 : (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16)))) (PreH5 : (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8)))) (PreH6 : (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ (retval_6 = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_5) (128))) ” 
  &&  “ (retval_5 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_4) (64))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_3) (32))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_2) (16))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval) (8))) ” 
  &&  “ (retval = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (((sb_addr + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i sb_addr 2 0 3 (replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
.

Definition JetCtrlSendFun_partial_solve_wit_22_pure := 
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_6) (128)))) (PreH2 : (retval_6 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH3 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH4 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH5 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH6 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ ((Zlength ((replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))))) = 3) ”
) \/
(
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_6) (128)))) (PreH4 : (retval_6 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH5 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH6 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH7 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH8 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH9 : ((Zlength (pulse_list)) = 12)) (PreH10 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ ((Zlength ((replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))))) = 3) ”
).

Definition JetCtrlSendFun_partial_solve_wit_22_pure_split_goal_1 := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (uartno <= UINT_MAX)) (PreH2 : (uartno >= 0)) (PreH3 : (retval = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_6) (128)))) (PreH4 : (retval_6 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH5 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH6 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH7 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH8 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH9 : ((Zlength (pulse_list)) = 12)) (PreH10 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((( &( "wPulse" ) )) # UChar  |-> retval)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ ((Zlength ((replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))))) = 3) ”
.

Definition JetCtrlSendFun_partial_solve_wit_22_aux := 
forall (pIp_pre: Z) (sb_list: (@list Z)) (sb_addr: Z) (pulse_list: (@list Z)) (pulse_addr: Z) (uartno: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (retval = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_6) (128)))) (PreH2 : (retval_6 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64)))) (PreH3 : (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32)))) (PreH4 : (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16)))) (PreH5 : (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8)))) (PreH6 : (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4)))) (PreH7 : ((Zlength (pulse_list)) = 12)) (PreH8 : ((Zlength (sb_list)) = 3)) ,
  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
|--
  “ ((Zlength ((replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))))) = 3) ” 
  &&  “ (retval = (jet_step ((Znth 10 pulse_list 0)) ((Znth 11 pulse_list 0)) (retval_6) (128))) ” 
  &&  “ (retval_6 = (jet_step ((Znth 8 pulse_list 0)) ((Znth 9 pulse_list 0)) (retval_5) (64))) ” 
  &&  “ (retval_5 = (jet_step ((Znth 6 pulse_list 0)) ((Znth 7 pulse_list 0)) (retval_4) (32))) ” 
  &&  “ (retval_4 = (jet_step ((Znth 4 pulse_list 0)) ((Znth 5 pulse_list 0)) (retval_3) (16))) ” 
  &&  “ (retval_3 = (jet_step ((Znth 2 pulse_list 0)) ((Znth 3 pulse_list 0)) (retval_2) (8))) ” 
  &&  “ (retval_2 = (jet_step ((Znth 0 pulse_list 0)) ((Znth 1 pulse_list 0)) (0) (4))) ” 
  &&  “ ((Zlength (pulse_list)) = 12) ” 
  &&  “ ((Zlength (sb_list)) = 3) ”
  &&  (UCharArray.full sb_addr 3 (replace_Znth (2) (retval) ((replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list)))))) )
  **  (UIntArray.full pulse_addr 12 pulse_list )
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "pulse")) # Ptr  |-> pulse_addr)
  **  ((&((pIp_pre)  # "__JetCtrlSend" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
.

Definition JetCtrlSendFun_partial_solve_wit_22 := JetCtrlSendFun_partial_solve_wit_22_pure -> JetCtrlSendFun_partial_solve_wit_22_aux.

Module Type VC_Correct.


Axiom proof_of_JetCtrlSendPairStep_safety_wit_1 : JetCtrlSendPairStep_safety_wit_1.
Axiom proof_of_JetCtrlSendPairStep_safety_wit_2 : JetCtrlSendPairStep_safety_wit_2.
Axiom proof_of_JetCtrlSendPairStep_return_wit_1 : JetCtrlSendPairStep_return_wit_1.
Axiom proof_of_JetCtrlSendPairStep_return_wit_2 : JetCtrlSendPairStep_return_wit_2.
Axiom proof_of_JetCtrlSendPairStep_return_wit_3 : JetCtrlSendPairStep_return_wit_3.
Axiom proof_of_JetCtrlSendFun_safety_wit_1 : JetCtrlSendFun_safety_wit_1.
Axiom proof_of_JetCtrlSendFun_safety_wit_2 : JetCtrlSendFun_safety_wit_2.
Axiom proof_of_JetCtrlSendFun_safety_wit_3 : JetCtrlSendFun_safety_wit_3.
Axiom proof_of_JetCtrlSendFun_safety_wit_4 : JetCtrlSendFun_safety_wit_4.
Axiom proof_of_JetCtrlSendFun_safety_wit_5 : JetCtrlSendFun_safety_wit_5.
Axiom proof_of_JetCtrlSendFun_safety_wit_6 : JetCtrlSendFun_safety_wit_6.
Axiom proof_of_JetCtrlSendFun_safety_wit_7 : JetCtrlSendFun_safety_wit_7.
Axiom proof_of_JetCtrlSendFun_safety_wit_8 : JetCtrlSendFun_safety_wit_8.
Axiom proof_of_JetCtrlSendFun_safety_wit_9 : JetCtrlSendFun_safety_wit_9.
Axiom proof_of_JetCtrlSendFun_safety_wit_10 : JetCtrlSendFun_safety_wit_10.
Axiom proof_of_JetCtrlSendFun_safety_wit_11 : JetCtrlSendFun_safety_wit_11.
Axiom proof_of_JetCtrlSendFun_safety_wit_12 : JetCtrlSendFun_safety_wit_12.
Axiom proof_of_JetCtrlSendFun_safety_wit_13 : JetCtrlSendFun_safety_wit_13.
Axiom proof_of_JetCtrlSendFun_safety_wit_14 : JetCtrlSendFun_safety_wit_14.
Axiom proof_of_JetCtrlSendFun_safety_wit_15 : JetCtrlSendFun_safety_wit_15.
Axiom proof_of_JetCtrlSendFun_safety_wit_16 : JetCtrlSendFun_safety_wit_16.
Axiom proof_of_JetCtrlSendFun_safety_wit_17 : JetCtrlSendFun_safety_wit_17.
Axiom proof_of_JetCtrlSendFun_safety_wit_18 : JetCtrlSendFun_safety_wit_18.
Axiom proof_of_JetCtrlSendFun_safety_wit_19 : JetCtrlSendFun_safety_wit_19.
Axiom proof_of_JetCtrlSendFun_safety_wit_20 : JetCtrlSendFun_safety_wit_20.
Axiom proof_of_JetCtrlSendFun_safety_wit_21 : JetCtrlSendFun_safety_wit_21.
Axiom proof_of_JetCtrlSendFun_safety_wit_22 : JetCtrlSendFun_safety_wit_22.
Axiom proof_of_JetCtrlSendFun_safety_wit_23 : JetCtrlSendFun_safety_wit_23.
Axiom proof_of_JetCtrlSendFun_safety_wit_24 : JetCtrlSendFun_safety_wit_24.
Axiom proof_of_JetCtrlSendFun_safety_wit_25 : JetCtrlSendFun_safety_wit_25.
Axiom proof_of_JetCtrlSendFun_return_wit_1 : JetCtrlSendFun_return_wit_1.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_1 : JetCtrlSendFun_partial_solve_wit_1.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_2 : JetCtrlSendFun_partial_solve_wit_2.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_3_pure : JetCtrlSendFun_partial_solve_wit_3_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_3 : JetCtrlSendFun_partial_solve_wit_3.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_4 : JetCtrlSendFun_partial_solve_wit_4.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_5 : JetCtrlSendFun_partial_solve_wit_5.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_6_pure : JetCtrlSendFun_partial_solve_wit_6_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_6 : JetCtrlSendFun_partial_solve_wit_6.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_7 : JetCtrlSendFun_partial_solve_wit_7.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_8 : JetCtrlSendFun_partial_solve_wit_8.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_9_pure : JetCtrlSendFun_partial_solve_wit_9_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_9 : JetCtrlSendFun_partial_solve_wit_9.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_10 : JetCtrlSendFun_partial_solve_wit_10.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_11 : JetCtrlSendFun_partial_solve_wit_11.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_12_pure : JetCtrlSendFun_partial_solve_wit_12_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_12 : JetCtrlSendFun_partial_solve_wit_12.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_13 : JetCtrlSendFun_partial_solve_wit_13.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_14 : JetCtrlSendFun_partial_solve_wit_14.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_15_pure : JetCtrlSendFun_partial_solve_wit_15_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_15 : JetCtrlSendFun_partial_solve_wit_15.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_16 : JetCtrlSendFun_partial_solve_wit_16.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_17 : JetCtrlSendFun_partial_solve_wit_17.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_18_pure : JetCtrlSendFun_partial_solve_wit_18_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_18 : JetCtrlSendFun_partial_solve_wit_18.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_19 : JetCtrlSendFun_partial_solve_wit_19.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_20 : JetCtrlSendFun_partial_solve_wit_20.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_21 : JetCtrlSendFun_partial_solve_wit_21.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_22_pure : JetCtrlSendFun_partial_solve_wit_22_pure.
Axiom proof_of_JetCtrlSendFun_partial_solve_wit_22 : JetCtrlSendFun_partial_solve_wit_22.

End VC_Correct.
