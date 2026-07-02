Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Export xizi_double_link_lib_core.

Local Open Scope Z_scope.
Local Open Scope sets.
Import ListNotations.
Local Open Scope list.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_double_struct_name : string := "SysDoubleLinklistNode".
Definition xizi_double_next_field : string := "node_next".
Definition xizi_double_prev_field : string := "node_prev".

Definition xizi_double_addr_node_store : addr -> addr -> addr -> addr -> Assertion :=
  dll_addr_store
    xizi_double_struct_name xizi_double_next_field xizi_double_prev_field.

Definition xizi_double_head_store : addr -> addr -> addr -> Assertion :=
  dll_head_store
    xizi_double_struct_name xizi_double_next_field xizi_double_prev_field.

Definition xizi_dllseg :
  addr -> addr -> addr -> addr -> list addr -> Assertion :=
  generic_dllseg xizi_double_addr_node_store.

Definition xizi_dll : addr -> list addr -> Assertion :=
  generic_dll_head xizi_double_addr_node_store xizi_double_head_store.
