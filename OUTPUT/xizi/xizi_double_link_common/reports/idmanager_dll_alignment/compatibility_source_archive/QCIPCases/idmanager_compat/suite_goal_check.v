Require Import QCIPCases.idmanager_compat.VC.code.id.AllocId_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.FreeId_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.GetObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.IdInsertObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.InsertObj_goal_check.
Require Import QCIPCases.idmanager_compat.VC.code.id.RemoveObj_goal_check.
Require Import QCIPCases.idmanager_master.lib.idnode.
Check (fun {A} (x : QCIPCases.idmanager_master.lib.dll.DLL.DL_Node A) => (x : QCIPCases.idmanager_compat.lib.dll.DLL.DL_Node A)).
