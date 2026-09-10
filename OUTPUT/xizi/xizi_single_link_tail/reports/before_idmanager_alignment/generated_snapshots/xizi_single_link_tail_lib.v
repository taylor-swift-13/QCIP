Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Require Import Coq.Strings.String.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib.
Import SetsNotation.
Import naive_C_Rules.
Local Open Scope sets.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.
