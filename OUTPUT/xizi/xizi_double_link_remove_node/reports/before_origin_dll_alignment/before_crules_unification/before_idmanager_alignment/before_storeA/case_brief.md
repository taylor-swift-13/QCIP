# Case Brief

- Case: `xizi_double_link_remove_node`
- Target: `DoubleLinkListRmNode`
- Controller run: `xizi_double_link_remove_node-20260825172438`
- Final phase: `done`
- Output artifact dir: `OUTPUT/xizi/xizi_double_link_remove_node`
- Source version: `8241532844e42993e40d4e333d9d17fe0ce4168b442666c57a77dc74f2551733`
- Source-goal version: `44819d3a6d3a8a320ab0fc5991cf7b48b003190802e321db2b573d59dcc1f464`
- Proof manual scope: witness-proofs-after-lib-migration
- Case-lib frozen prefix: lines 1-592, SHA-256 `18ca8e6570bb7b1e111cffb2afc692e725bb116d0fcc4afc3c3b6132dd76c4a7`
- Case-lib proving suffix: empty; no helper/import added

## Objective

Keep the function name, signature, and executable body unchanged. Add a callable self-loop contract
`Require xizi_dll(linklist_node,nil) Ensure xizi_dll(linklist_node,nil)`, while preserving the
member/front/tail contracts.

## Real call evidence

`softtimer.c:286` first removes `t->sortlist`. The remove implementation writes both links back
to the node. The non-periodic path then calls `QuitRun(t)`; `_QuitRun` removes the same now-isolated
node at `softtimer.c:122`.

## Design

`remove_self_loop_spec <= strong_spec` is public. The unique body spec uses tagged
`dispatch_case=0` for member cut/reconnect and `dispatch_case=1` for exact self-loop ownership.
The self-loop sentinel is not modeled as a member of `nil`.
