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
Require Import QCIPLib.SAMCodeSynthesis.UartInit.IP_UartInit_lib.
Local Open Scope sac.

(*----- Function UartInitFun -----*)

Definition UartInitFun_return_wit_1 := 
(
forall (pIp_pre: Z) (stop: Z) (even: Z) (baud: Z) (uartno: Z) ,
  ((&((pIp_pre)  # "__UartInit" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "baud")) # UInt  |-> baud)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "even")) # UInt  |-> even)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "stop")) # UInt  |-> stop)
|--
  “ (UartInitPost uartno baud even stop ) ”
  &&  ((&((pIp_pre)  # "__UartInit" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "baud")) # UInt  |-> baud)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "even")) # UInt  |-> even)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "stop")) # UInt  |-> stop)
) \/
(
forall (stop: Z) (even: Z) (baud: Z) (uartno: Z) ,
  TT && emp 
|--
  “ (UartInitPost uartno baud even stop ) ”
  &&  emp
).

Definition UartInitFun_return_wit_1_split_goal_1 := 
forall (stop: Z) (even: Z) (baud: Z) (uartno: Z) ,
  (UartInitPost uartno baud even stop )
.

Definition UartInitFun_partial_solve_wit_1 := 
forall (pIp_pre: Z) (stop: Z) (even: Z) (baud: Z) (uartno: Z) ,
  ((&((pIp_pre)  # "__UartInit" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "baud")) # UInt  |-> baud)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "even")) # UInt  |-> even)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "stop")) # UInt  |-> stop)
|--
  ((&((pIp_pre)  # "__UartInit" ->ₛ "uartno")) # UInt  |-> uartno)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "baud")) # UInt  |-> baud)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "even")) # UInt  |-> even)
  **  ((&((pIp_pre)  # "__UartInit" ->ₛ "stop")) # UInt  |-> stop)
.

Module Type VC_Correct.


Axiom proof_of_UartInitFun_return_wit_1 : UartInitFun_return_wit_1.
Axiom proof_of_UartInitFun_partial_solve_wit_1 : UartInitFun_partial_solve_wit_1.

End VC_Correct.
