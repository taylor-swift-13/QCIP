# Case Brief

- Case: `xizi_circular_area_reset`
- Run: `xizi_circular_area_reset-20260902224500`
- Controller phase: `done`
- Public state: one `circular_area_state`
- Pre: `store_circular_area state circular_area`
- Post: `store_circular_area (Build_circular_area_state (ca_capacity state) nil) circular_area`
- Hidden implementation state: backing pointer, operations pointer, read/write indices, status, physical option list
- Case lib: re-exports the shared circular-area library; no case-local declaration added
- Proof manual scope: current manual witness proofs only
- Source version: `15a2a5b033e66fc8e731a9fe74303e05797c804a2ab0059105fb8eaee1448ed0`
- Source-goal version: `3141c87f6ed81899c0588879ca2b34e2a5f7efaeb632c3b8e9d188193ee59137`
