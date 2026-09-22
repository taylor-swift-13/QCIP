Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.
Check (@DLL.store_dll : forall A, (addr -> A -> CRules.expr) -> addr -> list (DLL.DL_Node A) -> CRules.expr).
Check (@XiziIdmanagerDLL.store_dll : forall A, (addr -> A -> CRules.expr) -> addr -> list (DLL.DL_Node A) -> CRules.expr).
Check (@XiziLocalDLL.store_dll : forall A, (addr -> A -> naive_C_Rules.expr) -> addr -> list (DLL.DL_Node A) -> naive_C_Rules.expr).
Check (DLL.occupy_dll_node : addr -> CRules.expr).
Check (XiziIdmanagerDLL.occupy_dll_node : addr -> CRules.expr).
Check (XiziLocalDLL.occupy_dll_node : addr -> naive_C_Rules.expr).
Module OriginalRecordSyntax.
Import XiziIdmanagerDLL.
Definition sample : DLL.DL_Node unit := {| getData := tt; getPtr := 0%Z |}.
End OriginalRecordSyntax.
Module IncludeCompatibility.
Include XiziIdmanagerDLL.
Definition sample : DLL.DL_Node unit := {| getData := tt; getPtr := 0%Z |}.
End IncludeCompatibility.
Definition qualified_sample : DLL.DL_Node unit :=
  {| XiziIdmanagerDLL.getData := tt; XiziIdmanagerDLL.getPtr := 0%Z |}.
Definition local_sample : DLL.DL_Node unit :=
  {| XiziLocalDLL.getData := tt; XiziLocalDLL.getPtr := 0%Z |}.
Goal forall A, XiziIdmanagerDLL.DL_Node A = DLL.DL_Node A.
Proof. reflexivity. Qed.
Goal forall A, XiziLocalDLL.DL_Node A = DLL.DL_Node A.
Proof. reflexivity. Qed.
