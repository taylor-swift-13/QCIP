# Annotation Checking Report - IP_STSTransDataSave byte-copy r2

- status: blocked
- qcp_mcp_requirement_satisfied: no
- annotation_scratch_lib_coqc_status: passed
- ready_for_main_symexec: no
- ready_for_main_common_case_formal_lib_update: no
- reason: `qcp-mcp` is not available in the current environment, so the mandatory annotation-checking quality gate cannot be satisfied.
- scratch_symexec_status: passed for the r2 true_case / false_case candidate.
- candidate_snapshot: `snapshots/`
- next_phase: annotation
- next_action: rerun this r2 candidate in an environment with `qcp-mcp`, then rerun `validate_annotation_gate.py` before formal integration.
