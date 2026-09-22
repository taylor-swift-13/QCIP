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
Require Import QCIPLib.SAMCodeSynthesis.SendUartData.IP_SendUartData_lib.
Local Open Scope sac.

(*----- Function SendUartDataFun -----*)

Definition SendUartDataFun_return_wit_1 := 
(
forall (pIp_pre: Z) (sendsize: Z) (buf: Z) (uartno: Z) ,
  ((&((pIp_pre)  # "__SendUartData" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "buf")) # Ptr  |-> buf)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "sendsize")) # UInt  |-> sendsize)
|--
  “ (SendUartDataPost uartno buf sendsize ) ”
  &&  ((&((pIp_pre)  # "__SendUartData" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "buf")) # Ptr  |-> buf)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "sendsize")) # UInt  |-> sendsize)
) \/
(
forall (sendsize: Z) (buf: Z) (uartno: Z) ,
  TT && emp 
|--
  “ (SendUartDataPost uartno buf sendsize ) ”
  &&  emp
).

Definition SendUartDataFun_return_wit_1_split_goal_1 := 
forall (sendsize: Z) (buf: Z) (uartno: Z) ,
  (SendUartDataPost uartno buf sendsize )
.

Definition SendUartDataFun_partial_solve_wit_1 := 
forall (pIp_pre: Z) (sendsize: Z) (buf: Z) (uartno: Z) ,
  ((&((pIp_pre)  # "__SendUartData" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "buf")) # Ptr  |-> buf)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "sendsize")) # UInt  |-> sendsize)
|--
  ((&((pIp_pre)  # "__SendUartData" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "buf")) # Ptr  |-> buf)
  **  ((&((pIp_pre)  # "__SendUartData" ->ₛ "sendsize")) # UInt  |-> sendsize)
.

Module Type VC_Correct.


Axiom proof_of_SendUartDataFun_return_wit_1 : SendUartDataFun_return_wit_1.
Axiom proof_of_SendUartDataFun_partial_solve_wit_1 : SendUartDataFun_partial_solve_wit_1.

End VC_Correct.
