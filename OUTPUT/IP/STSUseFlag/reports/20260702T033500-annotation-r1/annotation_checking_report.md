## Annotation Checking Report

- status: passed
- checked_scope: `STSUseFlag` in `QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c`
- qcp_mcp_requirement_satisfied: yes
- annotation_scratch_lib_coqc_status: passed
- spec_definition_status: passed; `STSUseFlagPost` is a field-level mathematical post-state relation and does not define a Rocq loop, state machine, `Fixpoint`, or `Inductive`.
- function_spec_status: passed; `Require` captures the four owned global fields and `Ensure` calls `STSUseFlagPost` over old/new field values while returning ownership of all fields.
- invariant_status: n/a; target function has no loop.
- annotation_scratch_lib_changes: `STSUseFlag_TRUE32`, `STSUseFlag_FALSE32`, `STSUseFlagMappedStatus`, `STSUseFlagPost`.
- summary: Candidate annotation is ready for main integration, subject to main accepting the QCP parser source-shape adaptation described in `annotation_filling_analysis.md`.
- failed_checks: none
- required_annotation_rework: none
- required_annotation_scratch_lib_rework: none
- ready_for_main_common_case_formal_lib_update: yes
- ready_for_main_symexec: yes

### Quality Gate Details

`coqc .tmp/SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__annotation_subagent_tmp_lib.v` passed.

Forbidden / suspicious top-level declaration scan over the candidate scratch C/lib found no occurrences of:

- `Admitted`
- `Axiom`
- `Fixpoint`
- `Inductive`
- `Notation`

The spec is intentionally a relation over field values. It is not weakened to `emp` / range-only ownership, and it is not an executable Rocq copy of the C program. The finite status mapping `1 -> 6`, `2 -> 7`, `4 -> 8`, otherwise unchanged, is a mathematical relation for the observable status field.

### qcp-mcp Gate

Final qcp-mcp symbolic run reached the file tail successfully.

- safety witnesses: 10 total, 10 auto-solved
- return witnesses: 7 total, 7 manual
- other witness classes: 0

The manual return witnesses are expected downstream VCs proving each feasible branch implies `STSUseFlagPost`.

### Timing Summary

- qcp-mcp diagnostics and final symbolic runs: see `timing_log.md`, events `ann-r1-e003`, `ann-r1-e006`, `ann-r1-e008`.
- annotation_scratch_lib coqc: event `ann-r1-e005`, about 0.71 seconds.
- annotation-checking review: event `ann-r1-e009`, about 24 seconds.

### Timing Gaps

Initial skill/document reading before the first persisted ledger row was not precisely split. It is listed as a timing gap in `timing_log.md` and summarized in `subagent_return_report.md`.
