Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. 
Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.

Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Local Open Scope sac.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Require Export QCIPCases.idmanager_compat.lib.glob.

Local Open Scope monad.

Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.
Module DLL.
Include XiziIdmanagerDLL.
(* Frozen origin/idnode assumption, unchanged. Not part of the clean local DLL library. *)
Axiom store_dll_head_prev_next_nonzero:
  forall {A: Type} (storeA: addr -> A -> Assertion) (x: addr) (l: list (DL_Node A)),
    store_dll storeA x l |--
    EX h pt: addr,
      “ pt <> 0 /\ h <> 0 ” &&
      &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pt **
      &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> h **
      dllseg storeA h x x pt l.
End DLL.
(* Preserve original proof matching across the local sizeof implementation. *)
Arguments sizeof_front_end_type _ : simpl never.
