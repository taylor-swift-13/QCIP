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
Require Import QCIPLib.SAMCodeSynthesis.B_TcProcess.IP_B_TcProcess_lib.
Local Open Scope sac.

(*----- Function B_TcProcessFun -----*)

Definition B_TcProcessFun_safety_wit_1 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_bs: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "len" ) )) # UInt  |->_)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> old_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition B_TcProcessFun_safety_wit_2 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_bs: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "numerror" ) )) # UInt  |->_)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> old_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_3 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_bs: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "chksum" ) )) # UChar  |->_)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> old_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_4 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_bs: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> old_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_5 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_6 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (235 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 235) ”
.

Definition B_TcProcessFun_safety_wit_7 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (0) (235) (sb_list)) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_8 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (0) (235) (sb_list)) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (148 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 148) ”
.

Definition B_TcProcessFun_safety_wit_9 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition B_TcProcessFun_safety_wit_10 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH2 : ((Zlength (sb_list)) = 2)) (PreH3 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (1000 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1000) ”
.

Definition B_TcProcessFun_safety_wit_11 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Zlength (l)) = 4)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH5 : ((Zlength (sb_list)) = 2)) (PreH6 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_12 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Zlength (l)) = 4)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH5 : ((Zlength (sb_list)) = 2)) (PreH6 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (225 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 225) ”
.

Definition B_TcProcessFun_safety_wit_13 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_14 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) <> 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_15 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_16 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_17 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : ((Znth 0 l 0) <> 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_18 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (225 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 225) ”
.

Definition B_TcProcessFun_safety_wit_19 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : ((Znth 0 l 0) <> 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (225 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 225) ”
.

Definition B_TcProcessFun_safety_wit_20 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) <> 225)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ False ”
.

Definition B_TcProcessFun_safety_wit_21 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : (retval = 1)) (PreH3 : ((Znth 0 l 0) <> 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ False ”
.

Definition B_TcProcessFun_safety_wit_22 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_23 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_24 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((0 + (Znth 0 l 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (0 + (Znth 0 l 0) )) ”
.

Definition B_TcProcessFun_safety_wit_25 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_26 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (0 + (Znth 0 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) )) ”
.

Definition B_TcProcessFun_safety_wit_27 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (0 + (Znth 0 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_28 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) ”
) \/
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) ”
).

Definition B_TcProcessFun_safety_wit_28_split_goal_1 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) ) <= INT_MAX) ”
.

Definition B_TcProcessFun_safety_wit_28_split_goal_2 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((INT_MIN) <= (((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) ”
.

Definition B_TcProcessFun_safety_wit_29 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> ((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition B_TcProcessFun_safety_wit_30 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition B_TcProcessFun_safety_wit_31 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH2 : ((Znth 1 l 0) = 0)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Zlength (l)) = 4)) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition B_TcProcessFun_safety_wit_32 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH2 : ((Znth 1 l 0) = 0)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Zlength (l)) = 4)) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_33 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition B_TcProcessFun_safety_wit_34 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition B_TcProcessFun_safety_wit_35 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition B_TcProcessFun_safety_wit_36 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (51 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 51) ”
.

Definition B_TcProcessFun_safety_wit_37 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (new_err: Z) (new_len: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  ((( &( "len" ) )) # UInt  |-> new_len)
  **  ((( &( "numerror" ) )) # UInt  |-> new_err)
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (68 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 68) ”
.

Definition B_TcProcessFun_return_wit_1 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> 0)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret 0 1 ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_2 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> 51)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) = 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret 51 1 ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_3 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> 68)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 1)) (PreH2 : ((Znth 2 l 0) <> 0)) (PreH3 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH4 : ((Znth 1 l 0) = 0)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Znth 0 l 0) = 225)) (PreH7 : ((Zlength (l)) = 4)) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH11 : ((Zlength (sb_list)) = 2)) (PreH12 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret 68 1 ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_4 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 3 l 0) <> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH2 : ((Znth 1 l 0) = 0)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Zlength (l)) = 4)) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 3 l 0) <> (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH2 : ((Znth 1 l 0) = 0)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Zlength (l)) = 4)) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret old_wm 1 ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_5 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) <> 225)) (PreH2 : (retval = 1)) (PreH3 : ((Znth 0 l 0) <> 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) <> 225)) (PreH2 : (retval = 1)) (PreH3 : ((Znth 0 l 0) <> 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret old_wm retval ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_6 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) <> 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) <> 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret old_wm 1 ) ”
  &&  emp
).

Definition B_TcProcessFun_return_wit_7 := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : ((Znth 0 l 0) <> 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  EX (ret: Z)  (new_wm: Z)  (new_bs: Z)  (recv_l: (@list Z))  (sent: (@list Z)) ,
  “ ((Zlength (sent)) = 2) ” 
  &&  “ ((Znth (0) (sent) (0)) = 235) ” 
  &&  “ ((Znth (1) (sent) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno sent ) ” 
  &&  “ ((Zlength (recv_l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm recv_l ret new_wm new_bs ) ”
  &&  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> new_bs)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> new_wm)
  **  (UCharArray.full sb_addr 2 sent )
  **  (UCharArray.full rb_addr 4 recv_l )
) \/
(
forall (rb_list: (@list Z)) (sb_list: (@list Z)) (old_wm: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : (retval <> 1)) (PreH2 : ((Znth 0 l 0) <> 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  TT && emp 
|--
  EX (ret: Z) ,
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Znth (0) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 235) ” 
  &&  “ ((Znth (1) ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))) (0)) = 148) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (B_TcProcessPost old_wm l ret old_wm retval ) ”
  &&  emp
).

Definition B_TcProcessFun_partial_solve_wit_1 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full sb_addr 2 sb_list )
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((sb_addr + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i sb_addr 0 0 2 sb_list )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
.

Definition B_TcProcessFun_partial_solve_wit_2 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (0) (235) (sb_list)) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((sb_addr + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.missing_i sb_addr 1 0 2 (replace_Znth (0) (235) (sb_list)) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
.

Definition B_TcProcessFun_partial_solve_wit_3_pure := 
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ”
) \/
(
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (old_wm <= UINT_MAX)) (PreH2 : (uartno <= UINT_MAX)) (PreH3 : (4 <= UINT_MAX)) (PreH4 : (0 <= UINT_MAX)) (PreH5 : (old_wm >= 0)) (PreH6 : (uartno >= 0)) (PreH7 : (4 >= 0)) (PreH8 : (0 >= 0)) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ”
).

Definition B_TcProcessFun_partial_solve_wit_3_pure_split_goal_1 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (old_wm <= UINT_MAX)) (PreH2 : (uartno <= UINT_MAX)) (PreH3 : (4 <= UINT_MAX)) (PreH4 : (0 <= UINT_MAX)) (PreH5 : (old_wm >= 0)) (PreH6 : (uartno >= 0)) (PreH7 : (4 >= 0)) (PreH8 : (0 >= 0)) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ”
.

Definition B_TcProcessFun_partial_solve_wit_3_aux := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : ((Zlength (sb_list)) = 2)) (PreH2 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength ((replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))))) = 2) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
.

Definition B_TcProcessFun_partial_solve_wit_3 := B_TcProcessFun_partial_solve_wit_3_pure -> B_TcProcessFun_partial_solve_wit_3_aux.

Definition B_TcProcessFun_partial_solve_wit_4 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH2 : ((Zlength (sb_list)) = 2)) (PreH3 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
.

Definition B_TcProcessFun_partial_solve_wit_5_pure := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH2 : ((Zlength (sb_list)) = 2)) (PreH3 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((( &( "chksum" ) )) # UChar  |-> 0)
  **  ((( &( "numerror" ) )) # UInt  |-> 0)
  **  ((( &( "len" ) )) # UInt  |-> 4)
  **  ((( &( "pIp" ) )) # Ptr  |-> pIp_pre)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength (rb_list)) = 4) ”
.

Definition B_TcProcessFun_partial_solve_wit_5_aux := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (PreH1 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH2 : ((Zlength (sb_list)) = 2)) (PreH3 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
  **  (UCharArray.full rb_addr 4 rb_list )
|--
  “ ((Zlength (rb_list)) = 4) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (UCharArray.full rb_addr 4 rb_list )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 0)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_5 := B_TcProcessFun_partial_solve_wit_5_pure -> B_TcProcessFun_partial_solve_wit_5_aux.

Definition B_TcProcessFun_partial_solve_wit_6 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Zlength (l)) = 4)) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH5 : ((Zlength (sb_list)) = 2)) (PreH6 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (0 * sizeof(UCHAR)))) # UChar  |-> (Znth 0 l 0))
  **  (UCharArray.missing_i rb_addr 0 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_7 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Zlength (l)) = 4)) (PreH3 : (0 <= retval)) (PreH4 : (retval <= UINT_MAX)) (PreH5 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH6 : ((Zlength (sb_list)) = 2)) (PreH7 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (0 * sizeof(UCHAR)))) # UChar  |-> (Znth 0 l 0))
  **  (UCharArray.missing_i rb_addr 0 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_8 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : ((Znth 0 l 0) <> 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ (retval = 1) ” 
  &&  “ ((Znth 0 l 0) <> 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (0 * sizeof(UCHAR)))) # UChar  |-> (Znth 0 l 0))
  **  (UCharArray.missing_i rb_addr 0 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> retval)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_9 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 0 l 0) = 225)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Zlength (l)) = 4)) (PreH4 : (0 <= retval)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH7 : ((Zlength (sb_list)) = 2)) (PreH8 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (1 * sizeof(UCHAR)))) # UChar  |-> (Znth 1 l 0))
  **  (UCharArray.missing_i rb_addr 1 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_10 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (0 * sizeof(UCHAR)))) # UChar  |-> (Znth 0 l 0))
  **  (UCharArray.missing_i rb_addr 0 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_11 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (1 * sizeof(UCHAR)))) # UChar  |-> (Znth 1 l 0))
  **  (UCharArray.missing_i rb_addr 1 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_12 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (2 * sizeof(UCHAR)))) # UChar  |-> (Znth 2 l 0))
  **  (UCharArray.missing_i rb_addr 2 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_13 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 1 l 0) = 0)) (PreH2 : ((Znth 0 l 0) = 225)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Zlength (l)) = 4)) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH8 : ((Zlength (sb_list)) = 2)) (PreH9 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (3 * sizeof(UCHAR)))) # UChar  |-> (Znth 3 l 0))
  **  (UCharArray.missing_i rb_addr 3 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_14 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH2 : ((Znth 1 l 0) = 0)) (PreH3 : ((Znth 0 l 0) = 225)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Zlength (l)) = 4)) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH9 : ((Zlength (sb_list)) = 2)) (PreH10 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8))) ” 
  &&  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (2 * sizeof(UCHAR)))) # UChar  |-> (Znth 2 l 0))
  **  (UCharArray.missing_i rb_addr 2 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Definition B_TcProcessFun_partial_solve_wit_15 := 
forall (pIp_pre: Z) (rb_list: (@list Z)) (rb_addr: Z) (sb_list: (@list Z)) (sb_addr: Z) (old_wm: Z) (wm_addr: Z) (uartno: Z) (l: (@list Z)) (retval: Z) (PreH1 : ((Znth 2 l 0) <> 0)) (PreH2 : ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8)))) (PreH3 : ((Znth 1 l 0) = 0)) (PreH4 : ((Znth 0 l 0) = 225)) (PreH5 : ((Znth 0 l 0) = 225)) (PreH6 : ((Zlength (l)) = 4)) (PreH7 : (0 <= retval)) (PreH8 : (retval <= UINT_MAX)) (PreH9 : (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )) (PreH10 : ((Zlength (sb_list)) = 2)) (PreH11 : ((Zlength (rb_list)) = 4)) ,
  (UCharArray.full rb_addr 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
|--
  “ ((Znth 2 l 0) <> 0) ” 
  &&  “ ((Znth 3 l 0) = (unsigned_last_nbits ((((0 + (Znth 0 l 0) ) + (Znth 1 l 0) ) + (Znth 2 l 0) )) (8))) ” 
  &&  “ ((Znth 1 l 0) = 0) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Znth 0 l 0) = 225) ” 
  &&  “ ((Zlength (l)) = 4) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (UartSendRecord uartno (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) ) ” 
  &&  “ ((Zlength (sb_list)) = 2) ” 
  &&  “ ((Zlength (rb_list)) = 4) ”
  &&  (((rb_addr + (2 * sizeof(UCHAR)))) # UChar  |-> (Znth 2 l 0))
  **  (UCharArray.missing_i rb_addr 2 0 4 l )
  **  (UCharArray.full sb_addr 2 (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))) )
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "workMode")) # Ptr  |-> wm_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "bSucc")) # UInt  |-> 1)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "sendBuf")) # Ptr  |-> sb_addr)
  **  ((&((pIp_pre)  # "__B_TcProcess" ->ₛ "recvBuf")) # Ptr  |-> rb_addr)
  **  ((wm_addr) # UInt  |-> old_wm)
.

Module Type VC_Correct.


Axiom proof_of_B_TcProcessFun_safety_wit_1 : B_TcProcessFun_safety_wit_1.
Axiom proof_of_B_TcProcessFun_safety_wit_2 : B_TcProcessFun_safety_wit_2.
Axiom proof_of_B_TcProcessFun_safety_wit_3 : B_TcProcessFun_safety_wit_3.
Axiom proof_of_B_TcProcessFun_safety_wit_4 : B_TcProcessFun_safety_wit_4.
Axiom proof_of_B_TcProcessFun_safety_wit_5 : B_TcProcessFun_safety_wit_5.
Axiom proof_of_B_TcProcessFun_safety_wit_6 : B_TcProcessFun_safety_wit_6.
Axiom proof_of_B_TcProcessFun_safety_wit_7 : B_TcProcessFun_safety_wit_7.
Axiom proof_of_B_TcProcessFun_safety_wit_8 : B_TcProcessFun_safety_wit_8.
Axiom proof_of_B_TcProcessFun_safety_wit_9 : B_TcProcessFun_safety_wit_9.
Axiom proof_of_B_TcProcessFun_safety_wit_10 : B_TcProcessFun_safety_wit_10.
Axiom proof_of_B_TcProcessFun_safety_wit_11 : B_TcProcessFun_safety_wit_11.
Axiom proof_of_B_TcProcessFun_safety_wit_12 : B_TcProcessFun_safety_wit_12.
Axiom proof_of_B_TcProcessFun_safety_wit_13 : B_TcProcessFun_safety_wit_13.
Axiom proof_of_B_TcProcessFun_safety_wit_14 : B_TcProcessFun_safety_wit_14.
Axiom proof_of_B_TcProcessFun_safety_wit_15 : B_TcProcessFun_safety_wit_15.
Axiom proof_of_B_TcProcessFun_safety_wit_16 : B_TcProcessFun_safety_wit_16.
Axiom proof_of_B_TcProcessFun_safety_wit_17 : B_TcProcessFun_safety_wit_17.
Axiom proof_of_B_TcProcessFun_safety_wit_18 : B_TcProcessFun_safety_wit_18.
Axiom proof_of_B_TcProcessFun_safety_wit_19 : B_TcProcessFun_safety_wit_19.
Axiom proof_of_B_TcProcessFun_safety_wit_20 : B_TcProcessFun_safety_wit_20.
Axiom proof_of_B_TcProcessFun_safety_wit_21 : B_TcProcessFun_safety_wit_21.
Axiom proof_of_B_TcProcessFun_safety_wit_22 : B_TcProcessFun_safety_wit_22.
Axiom proof_of_B_TcProcessFun_safety_wit_23 : B_TcProcessFun_safety_wit_23.
Axiom proof_of_B_TcProcessFun_safety_wit_24 : B_TcProcessFun_safety_wit_24.
Axiom proof_of_B_TcProcessFun_safety_wit_25 : B_TcProcessFun_safety_wit_25.
Axiom proof_of_B_TcProcessFun_safety_wit_26 : B_TcProcessFun_safety_wit_26.
Axiom proof_of_B_TcProcessFun_safety_wit_27 : B_TcProcessFun_safety_wit_27.
Axiom proof_of_B_TcProcessFun_safety_wit_28 : B_TcProcessFun_safety_wit_28.
Axiom proof_of_B_TcProcessFun_safety_wit_29 : B_TcProcessFun_safety_wit_29.
Axiom proof_of_B_TcProcessFun_safety_wit_30 : B_TcProcessFun_safety_wit_30.
Axiom proof_of_B_TcProcessFun_safety_wit_31 : B_TcProcessFun_safety_wit_31.
Axiom proof_of_B_TcProcessFun_safety_wit_32 : B_TcProcessFun_safety_wit_32.
Axiom proof_of_B_TcProcessFun_safety_wit_33 : B_TcProcessFun_safety_wit_33.
Axiom proof_of_B_TcProcessFun_safety_wit_34 : B_TcProcessFun_safety_wit_34.
Axiom proof_of_B_TcProcessFun_safety_wit_35 : B_TcProcessFun_safety_wit_35.
Axiom proof_of_B_TcProcessFun_safety_wit_36 : B_TcProcessFun_safety_wit_36.
Axiom proof_of_B_TcProcessFun_safety_wit_37 : B_TcProcessFun_safety_wit_37.
Axiom proof_of_B_TcProcessFun_return_wit_1 : B_TcProcessFun_return_wit_1.
Axiom proof_of_B_TcProcessFun_return_wit_2 : B_TcProcessFun_return_wit_2.
Axiom proof_of_B_TcProcessFun_return_wit_3 : B_TcProcessFun_return_wit_3.
Axiom proof_of_B_TcProcessFun_return_wit_4 : B_TcProcessFun_return_wit_4.
Axiom proof_of_B_TcProcessFun_return_wit_5 : B_TcProcessFun_return_wit_5.
Axiom proof_of_B_TcProcessFun_return_wit_6 : B_TcProcessFun_return_wit_6.
Axiom proof_of_B_TcProcessFun_return_wit_7 : B_TcProcessFun_return_wit_7.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_1 : B_TcProcessFun_partial_solve_wit_1.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_2 : B_TcProcessFun_partial_solve_wit_2.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_3_pure : B_TcProcessFun_partial_solve_wit_3_pure.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_3 : B_TcProcessFun_partial_solve_wit_3.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_4 : B_TcProcessFun_partial_solve_wit_4.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_5_pure : B_TcProcessFun_partial_solve_wit_5_pure.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_5 : B_TcProcessFun_partial_solve_wit_5.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_6 : B_TcProcessFun_partial_solve_wit_6.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_7 : B_TcProcessFun_partial_solve_wit_7.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_8 : B_TcProcessFun_partial_solve_wit_8.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_9 : B_TcProcessFun_partial_solve_wit_9.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_10 : B_TcProcessFun_partial_solve_wit_10.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_11 : B_TcProcessFun_partial_solve_wit_11.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_12 : B_TcProcessFun_partial_solve_wit_12.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_13 : B_TcProcessFun_partial_solve_wit_13.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_14 : B_TcProcessFun_partial_solve_wit_14.
Axiom proof_of_B_TcProcessFun_partial_solve_wit_15 : B_TcProcessFun_partial_solve_wit_15.

End VC_Correct.
