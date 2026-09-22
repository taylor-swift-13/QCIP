# Witness Ledger

Source-goal version:
`44819d3a6d3a8a320ab0fc5991cf7b48b003190802e321db2b573d59dcc1f464`

| Witness | Purpose | Final status |
| --- | --- | --- |
| `proof_of_DoubleLinkListRmNode_return_wit_1` | Body member branch reconnects the DLL and isolates the removed node | proved |
| `proof_of_DoubleLinkListRmNode_derive_remove_self_loop_spec_by_strong_spec` | Exact self-loop public contract derives from dispatch branch 1 | proved |
| `proof_of_DoubleLinkListRmNode_derive_remove_tail_spec_by_strong_spec` | Tail contract derives from dispatch branch 0 | proved |
| `proof_of_DoubleLinkListRmNode_derive_remove_front_spec_by_strong_spec` | Front contract derives from dispatch branch 0 | proved |
| `proof_of_DoubleLinkListRmNode_derive_remove_member_spec_by_strong_spec` | General member/remove-first contract derives from dispatch branch 0 | proved |

All five theorem statements match the isolated canonical symexec replay. Diagnostics split goals are
planning hints and are not target witnesses.
