# IP_STSTransDataSave Byte-Copy Continuation Handoff

## Current State

The prior formal baseline under `QCP_examples/LLM_bench/Engineering/STSTransDataSave/`, `SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/`, and `OUTPUT/IP/STSTransDataSave/` proves only the conditional update of `sSTSTran.ptr`.

A stronger byte-level annotation candidate has now been developed in r2 and persisted under:

` .agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000002-annotation-r2-bytecopy/snapshots/ `

The r2 candidate models:

- `dataBuf[0..248)` copied into SRAM packet window at `1074343936 + old_ptr` when `old_ptr < 776`.
- `sSTSTran.ptr` updated to `old_ptr + 248` in the copy branch.
- SRAM and pointer unchanged in the `old_ptr >= 776` branch.

## Material Progress

- r1 identified the blocker around `Memcpyx` precondition derivation.
- Main diagnostic experiments showed ordinary `Memcpyx` pointer specs and `(unint08*)pDst` destination casts are accepted.
- r2 fixed the source actual by using `&(sSTSTran.dataBuf[0])` instead of `sSTSTran.dataBuf`.
- r2 kept `store(&(sSTSTran.ptr), ptr)` through branch-local assertions, fixing the pointer assignment failure.
- r2 scratch `symexec` reached the end of `STSTransDataSave` for both `true_case` and `false_case` named specs.
- r2 scratch lib passed `coqc`.

## Current Blocker

The mandatory annotation gate is not satisfied because `qcp-mcp` is unavailable in this environment.

Evidence:

- r2 report: `20260709T000002-annotation-r2-bytecopy/subagent_return_report.md`
- gate report: `20260709T000002-annotation-r2-bytecopy/annotation_gate_result.txt`
- gate errors include:
  - `subagent round_outcome must be completed`
  - `annotation-checking report status must be passed`
  - `qcp_mcp_requirement_satisfied must be truthy`

Per project rules, do not integrate the r2 scratch candidate into formal C/lib files until qcp-mcp plus annotation-checking pass.

## Candidate Files To Rehydrate

Copy these snapshots back into fresh scratch in an environment with `qcp-mcp`:

- `snapshots/source/IP_STSTransDataSave__annotation_subagent_tmp.c`
- `snapshots/source/IP_STSTransDataSave.h`
- `snapshots/rocq/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`

Suggested fresh scratch targets:

- `.tmp/INPUT/IP/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp.c`
- `.tmp/INPUT/IP/STSTransDataSave/r2/IP_STSTransDataSave.h`
- `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`

## Commands Already Known To Pass Locally

Scratch symexec:

```sh
linux-binary/symexec \
  --goal-file=.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_goal.v \
  --proof-auto-file=.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_proof_auto.v \
  --proof-manual-file=.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_proof_manual.v \
  --coq-logic-path=SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.r2 \
  -slp QCP_examples/LLM_bench/ SimpleC.EE.LLM_bench \
  -slp .tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2 SimpleC.EE.LLM_bench.Engineering.STSTransDataSave.r2 \
  -I.tmp/INPUT/IP/STSTransDataSave/r2 \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=.tmp/INPUT/IP/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp.c \
  --no-exec-info
```

Annotation gate command after qcp-mcp and annotation-checking pass:

```sh
python3 .agents/skills/verification-orchestrator/scripts/validate_annotation_gate.py \
  --subagent-report <completed-subagent-report.md> \
  --checking-report <passed-annotation-checking-report.md> \
  --annotation-scratch-lib .tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_lib.v \
  --coqproject _CoqProject
```

## Next Required Phase

Remain in `annotation` phase. The next real step is to rerun r2 in an environment where `qcp-mcp` exists, then run annotation-checking. If both pass, main can integrate the r2 C/lib patch, refresh formal symexec, and proceed to vc-checking/proving for the new manual witnesses.
