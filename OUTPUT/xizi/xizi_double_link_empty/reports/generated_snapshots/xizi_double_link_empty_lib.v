Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.

(** The public emptiness contract returns one exactly for the empty logical
    node sequence, and zero for a nonempty sequence.  XiziLocalDLL.store_dll
    owns the actual SysDoubleLinklistNode links and all storeA payloads;
    nodes have the shared DLL.DL_Node type.  The empty-case declaration is
    retained as a specialization of this same polymorphic contract.
    No nonnull or endpoint guards are added to the canonical predicates. *)
