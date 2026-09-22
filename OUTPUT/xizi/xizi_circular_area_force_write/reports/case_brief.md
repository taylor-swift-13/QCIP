# Case Brief

- case_name: `xizi_circular_area_force_write`
- target_function: `CircularAreaWrite`
- mode: `b_force != 0`
- output_artifact_dir: `OUTPUT/xizi/xizi_circular_area_force_write`
- run: `xizi_circular_area_force_write-20260908100003`
- current_phase: `done`
- public_resource: `store_circular_area`
- success_resource: `store_forced_circular_area`
- source_version: `23d786abb961fb961488a900251247c9a8835b794e720a3d0c894b19df879131`
- source_goal_version: `cd0d0e48cd4702b6ce4e0d6cd0360eeb202a2f05b34afb7adb1ca3f90d3328ef`
- manual_witnesses: `30/30`
- reference_policy: only `QCP_examples/QCP_demos_LLM/**`
- semantic_risk: underfilling force success may produce equal indices/status=1 without a full FIFO, so the general postcondition intentionally remains raw
- entry_snapshots: `CircularAreaForceWriteInput` + parameter `@pre`; no `ca0/in0/requested/d0` `With`
