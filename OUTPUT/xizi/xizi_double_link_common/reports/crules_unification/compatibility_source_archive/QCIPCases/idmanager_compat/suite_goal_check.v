Require Import QCIPCases.idmanager_compat.VC.code.id.AllocId_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.FreeId_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.GetObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.IdInsertObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.InsertObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.RemoveObj_goal_check.
Require Import QCIPCases.idmanager_master.lib.idnode.
Check (fun {A} (x : QCIPCases.idmanager_master.lib.dll.DLL.DL_Node A) => (x : QCIPCases.idmanager_compat.lib.dll.DLL.DL_Node A)).

(* Definitional compatibility checks for the unified active CRules instance. *)
Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
Module Unified := QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.
Check (@Unified.XiziLocalDLL.store_dll : forall {A : Type},
  (addr -> A -> CRules.expr) -> addr -> list (Unified.DLL.DL_Node A) -> CRules.expr).
Check (@Unified.XiziIdmanagerDLL.store_dll : forall {A : Type},
  (addr -> A -> CRules.expr) -> addr -> list (Unified.DLL.DL_Node A) -> CRules.expr).
Goal @Unified.XiziLocalDLL.dllseg = @Unified.XiziIdmanagerDLL.dllseg.
Proof. reflexivity. Qed.
Goal @Unified.XiziLocalDLL.dllseg_shift = @Unified.XiziIdmanagerDLL.dllseg_shift.
Proof. reflexivity. Qed.
Goal @Unified.XiziLocalDLL.dllseg_shift_rev = @Unified.XiziIdmanagerDLL.dllseg_shift_rev.
Proof. reflexivity. Qed.
Goal @Unified.XiziLocalDLL.store_dll = @Unified.XiziIdmanagerDLL.store_dll.
Proof. reflexivity. Qed.
Goal Unified.XiziLocalDLL.occupy_dll_node = Unified.XiziIdmanagerDLL.occupy_dll_node.
Proof. reflexivity. Qed.
Check (fun {A} (n : Unified.DLL.DL_Node A) => (n : Unified.XiziLocalDLL.DL_Node A)).
Check (fun {A} (n : Unified.DLL.DL_Node A) => (n : Unified.XiziIdmanagerDLL.DL_Node A)).
Check (fun (d : Z) (p : addr) =>
  ({| Unified.DLL.getData := d; Unified.DLL.getPtr := p |} : Unified.DLL.DL_Node Z)).
