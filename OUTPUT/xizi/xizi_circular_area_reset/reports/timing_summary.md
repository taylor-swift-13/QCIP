# Timing summary

- Total controller run wall time: 3431.399 s
- Annotation phase: 1194.060 s; annotation subagent attempt: 1148.180 s
- VC-checking phase: 535.637 s; vc-checking attempt: 469.613 s
- VC-proving-preparing/worker/parent phase: 1399.618 s
- Group worker `circular_area_reset_store_roundtrip`: 1148.727 s
- Parent verify command: 194.661 s
- Final-check phase: 247.326 s; fixed full check command: 203.894 s
- Blocked rounds: none
- Long rounds (>600 s): annotation and group-worker; time was spent on repeated QCP/case-lib checks and interactive proof plus fixed group-check, respectively

Machine-readable complete timing ledger: `controller/timing_summary.json`.
