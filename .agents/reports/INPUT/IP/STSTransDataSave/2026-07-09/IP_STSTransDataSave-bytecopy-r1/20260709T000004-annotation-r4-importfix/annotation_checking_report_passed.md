# Annotation Checking Report - IP_STSTransDataSave r4 import-fix

## Result

- status: passed
- round_outcome: completed
- annotation_checking_status: passed
- qcp_mcp_requirement_satisfied: yes
- annotation_scratch_lib_coqc_status: passed
- ready_for_main_symexec: yes
- ready_for_main_common_case_formal_lib_update: yes

## Inputs Checked

- C scratch: .tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp.c
- Header scratch: .tmp/INPUT/IP/STSTransDataSave/r3/IP_STSTransDataSave.h
- annotation_scratch_lib: .tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r3/IP_STSTransDataSave__annotation_subagent_tmp_lib.v
- MCP evidence: .agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000004-annotation-r4-importfix/mcp_symbolic_999_output.txt

## Gate Checks

- Scratch lib compiles: passed. Re-ran coqc with _CoqProject plus the case-local r3 -R binding; exit code 0.
- MCP evidence: passed. mcp_symbolic_999_output.txt records result: success and errormessage: null for the r3 C scratch.
- Import consistency: passed. The C scratch imports SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.r3.IP_STSTransDataSave__annotation_subagent_tmp_lib, matching the r3 scratch lib checked in this gate.
- Predicate-first spec: passed. STSTransDataSaveBytePost is defined as a mathematical conjunction of pointer post-state and SRAM window relation; it does not encode C control flow or mirror Memcpyx implementation steps.
- true_case intended post-state: passed. The true case requires 0 <= ptr, ptr < 776, 248-byte source/destination slices, packet-window prefix/suffix lengths, and ensures STSTransDataSaveBytePost with ptr1 = ptr + 248 and a rebuilt 1024-byte SRAM window.
- false_case intended post-state: passed. The false case requires 776 <= ptr <= 1024, preserves the old 1024-byte SRAM list through STSTransDataSaveBytePost, and keeps ptr1 = ptr.

## Notes For Main Integration

- This check authorizes main to integrate the r3 annotation candidate into the formal C file and integrate the checked scratch spec into common_case_formal_lib / case lib, subject to the main-agent ownership rules.
- After integration, main should refresh the frozen prefix before running formal symexec and should treat the four manual witnesses reported by MCP as expected downstream VC work.
