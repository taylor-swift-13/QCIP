# Annotation Delegation Ticket - IP_STSTransDataSave byte-copy r1

## Role

You are `annotation-subagent` for the annotation phase only.

## Goal

Work in scratch only and attempt to upgrade `IP_STSTransDataSave` from the existing ptr-only proof to a byte-level SRAM copy specification.

## Inputs

- Formal C source: `QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c`
- Header: `QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.h`
- Current lib: `SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_lib.v`
- Input source snapshot: `INPUT/IP/STSTransDataSave/IP_STSTransDataSave.c`
- Output root: `OUTPUT/IP/STSTransDataSave/`
- Round report dir: `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000001-annotation-r1-bytecopy/`

## Scratch Paths

Create fresh scratch paths only under `.tmp/`:

- `.tmp/INPUT/IP/STSTransDataSave/IP_STSTransDataSave__annotation_subagent_tmp.c`
- `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`

Do not edit formal files under `QCP_examples/`, `SeparationLogic/examples/`, or `OUTPUT/`.

## Required Work

1. Read the relevant skills/instructions: verification-orchestrator, annotation-filling, annotation-checking, and array docs.
2. Create fresh scratch copies from current formal files.
3. Design a predicate-first spec that models:
   - full SRAM packet window length 1024 at address `1074343936` (`SRAM_BASE + STS_PK_UP`),
   - full `sSTSTran.dataBuf[256]`,
   - if `old_ptr < 776`, `new_ptr = old_ptr + 248` and SRAM segment `[old_ptr, old_ptr+248)` becomes `dataBuf[0..248)`, preserving prefix/suffix,
   - if `old_ptr >= 776`, `new_ptr = old_ptr` and SRAM unchanged.
4. Prefer builtin `CharArray`/array predicates from local examples. If `UCharArray` is not available through examples, use `CharArray` and record the signedness limitation.
5. Give `Memcpyx` a real copy contract in scratch if possible, or explain the exact syntax/tool blocker.
6. Run whatever local non-destructive checks are available (`symexec` on scratch if viable, `coqc` for scratch lib, grep/compile checks). If qcp-mcp or annotation-checking is unavailable in your environment, report that explicitly rather than claiming passed.
7. Return one of: `completed`, `blocked`, or `stale`.

## Output Report

Write `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000001-annotation-r1-bytecopy/subagent_return_report.md` containing:

- outcome
- files written in scratch
- proposed C annotation patch
- proposed lib patch
- commands run and results
- blockers and next main-agent action

## Boundary

Do not modify formal C/lib/Rocq files. Do not modify `OUTPUT/`. Scratch/report writes only.
