# Annotation Checking Ticket - IP_STSTransDataSave r4 import-fix

Review the r3 scratch candidate after fixing its Coq import from `.r2` to `.r3`.

Inputs:
- C scratch: `.tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp.c`
- header scratch: `.tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave.h`
- annotation_scratch_lib: `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`
- mcp evidence: `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000004-annotation-r4-importfix/mcp_symbolic_999_output.txt`

Expected checks:
- r3 scratch lib compiles.
- mcp result is success and errormessage is null.
- C annotation imports the same r3 scratch lib being checked.
- Spec is predicate-first byte-copy semantics, not a C algorithm mirror.
- true_case and false_case describe the intended SRAM/pointer post-state.

Write reports in this same directory:
- `annotation_checking_report_passed.md` if passed, otherwise failed report.
- `subagent_return_report_r4.md`.

Fields needed for gate if passed:
- `round_outcome: completed`
- `annotation_checking_status: passed`
- `status: passed`
- `qcp_mcp_requirement_satisfied: yes`
- `annotation_scratch_lib_coqc_status: passed`
- `ready_for_main_symexec: yes`
- `ready_for_main_common_case_formal_lib_update: yes`
