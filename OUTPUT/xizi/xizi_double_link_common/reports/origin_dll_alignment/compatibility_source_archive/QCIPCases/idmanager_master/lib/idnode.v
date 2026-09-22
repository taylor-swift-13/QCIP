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
Require Export QCIPCases.idmanager_master.lib.glob.
Require Export QCIPCases.idmanager_master.lib.dll.
Require Export QCIPCases.idmanager_master.lib.bitmap.
Import DLL.

Local Open Scope monad.

Module IDNode.

Record idmanager: Type :=
  Build_idmanager {
    idmax: Z;
    hoffset: Z;
    idlist: list Z;
    storeA: addr -> Z -> Prop;
  }.

Arguments Build_idmanager _ _ _ _ : assert.

Notation "x '.(idmax)'" := (idmax x) (at level 1).
Notation "x '.(hoffset)'" := (hoffset x) (at level 1).
Notation "x '.(idlist)'" := (idlist x) (at level 1).
Notation "x '.(storeA)'" := (storeA x) (at level 1).

Definition id_in_ids (id: Z) (ids: list Z): bool :=
  if in_dec Z.eq_dec id ids then true else false.

Definition id_map_bytes_ok (idmax: Z) (ids bytes: list Z): Prop :=
  0 <= idmax /\
  Zlength bytes = (idmax + 7) / 8 /\
  Forall (fun id => 0 <= id < idmax) ids /\
  isOrder 0 ids /\
  Forall (fun byte => 0 <= byte <= 255) bytes /\
  forall id,
    0 <= id < idmax ->
    Z.testbit (Znth (id / 8) bytes 0) (id mod 8) = id_in_ids id ids.

Definition store_uchar_array (p: addr) (n: Z) (bytes: list Z): Assertion :=
  store_array (fun p i byte => (p + i * sizeof(UCHAR)) # UChar |-> byte) p n bytes.

Definition store_id_map (id_map: addr) (idmax: Z) (ids: list Z): Assertion :=
  EX bytes: list Z,
    “ id_map_bytes_ok idmax ids bytes ” &&
    store_uchar_array id_map ((idmax + 7) / 8) bytes.

Definition store_idnode (node_storeA: addr -> Z -> Prop) (link: addr) (id: Z): Assertion :=
  EX p: addr,
    “ link = &(p # "IdNode" ->ₛ "link") ”&&“node_storeA p id” &&
    &(p # "IdNode" ->ₛ "id") # UShort |-> id.

Definition store_idnodes (node_storeA: addr -> Z -> Prop) (head: addr) (ids: list Z): Assertion :=
  EX nodes: list (DL_Node Z),
    “ map getData nodes = ids ” &&
    store_dll (store_idnode node_storeA) head nodes.

Definition store_idmanager (m: idmanager) (p: addr): Assertion :=
  EX id_map htable: addr,
    &(p # "IdManager" ->ₛ "id_max") # UShort |-> m.(idmax) **
    &(p # "IdManager" ->ₛ "hoffset") # UShort |-> m.(hoffset) **
    &(p # "IdManager" ->ₛ "id_map") # Ptr |-> id_map **
    store_id_map id_map m.(idmax) m.(idlist) **
    &(p # "IdManager" ->ₛ "htable") # Ptr |-> htable **
    store_idnodes m.(storeA) htable m.(idlist).

End IDNode.
