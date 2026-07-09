# Annotation Checking Ticket - IP_STSTransDataSave r3

## Role

You are handling the annotation-checking phase for the r3 byte-copy candidate. Work only in report paths and existing r3 scratch; do not edit formal files.

## Inputs

- r3 scratch C: `.tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp.c`
- r3 scratch header: `.tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave.h`
- r3 annotation_scratch_lib: `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`
- qcp-mcp evidence: `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000003-annotation-r3-mcp-probe/mcp_symbolic_999_output.txt`
- output report dir: `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000003-annotation-r3-mcp-probe/`

## Evidence Already Established

`linux-binary/mcp` was run interactively with `<symbolic>999</symbolic>` and returned JSON containing:

- `result: success`
- `errormessage: null`
- loaded `char_array` strategies
- witness summary for `STSTransDataSave`
- 8 auto-solved witnesses and 4 manual witnesses

This satisfies the qcp-mcp-style file-tail symbolic execution requirement if your review agrees.

## Required Review

1. Read annotation-checking instructions and spec-quality checklist.
2. Confirm the r3 annotation_scratch_lib compiles under `_CoqProject` flags.
3. Check the spec is predicate-first mathematical semantics, not a C algorithm mirror.
4. Check the C annotation calls the spec and models:
   - true branch: copy `dataBuf[0..248)` into SRAM packet window at `1074343936 + ptr` and update `ptr` to `ptr + 248`;
   - false branch: preserve SRAM and `ptr`.
5. Confirm builtin `CharArray` use is reasonable for this byte buffer case and note the unsigned-char limitation if needed.
6. Write an annotation-checking report and a subagent return report in the output report dir.

## Required Output Files

- `annotation_checking_report_passed.md`
- `subagent_return_report_r3.md`

Both reports must include fields needed by `validate_annotation_gate.py`:

- `round_outcome: completed` in the subagent report
- `annotation_checking_status: passed` in the subagent report
- `status: passed` in the checking report
- `qcp_mcp_requirement_satisfied: yes`
- `annotation_scratch_lib_coqc_status: passed`
- `ready_for_main_symexec: yes`
- `ready_for_main_common_case_formal_lib_update: yes`
