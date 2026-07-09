# Annotation Delegation Ticket - IP_STSTransDataSave byte-copy r2

## Role

You are the annotation phase worker for this round. Work only in scratch/report paths.

## Context From r1

r1 returned `blocked`, but main-agent diagnostic experiments narrowed the failure:

- `Memcpyx` contract with `CharArray::full(dst,248,old_dst) * CharArray::full(src,248,bytes)` works for ordinary pointer parameters.
- It also works with `(unint08*)pDst` destination.
- The actual parameter `sSTSTran.dataBuf` fails to match the call precondition.
- The actual parameter `&(sSTSTran.dataBuf[0])` passes the `Memcpyx` call, but the experiment then failed at `sSTSTran.ptr = sSTSTran.ptr + 248` because the before/after `Assert` blocks omitted `store(&(sSTSTran.ptr), ptr)`.

Representative successful minimal forms are under `.tmp/INPUT/IP/STSTransDataSave/memcpy_min/direct_params` and `local_pdst_cast`; failing/suggestive forms are under `.tmp/INPUT/IP/STSTransDataSave/experiments/char_addr0`.

## Goal

Create a fresh byte-level annotation candidate that keeps the full function semantics:

- if `old_ptr < 776`, copy `dataBuf[0..248)` into SRAM packet window at offset `old_ptr`, set `ptr = old_ptr + 248`;
- if `old_ptr >= 776`, keep `ptr` and SRAM unchanged.

## Fresh Scratch Paths

Use fresh r2 scratch only:

- `.tmp/INPUT/IP/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp.c`
- `.tmp/INPUT/IP/STSTransDataSave/r2/IP_STSTransDataSave.h`
- `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/r2/IP_STSTransDataSave__annotation_subagent_tmp_lib.v`

Do not edit formal files under `QCP_examples/`, `SeparationLogic/examples/`, or `OUTPUT/`.

## Required Experiments

1. Use `CharArray` first, not `UCharArray`, because local examples support it.
2. Use `&(sSTSTran.dataBuf[0])` as the copied source base in `Memcpyx` and matching `CharArray::full` resources.
3. Keep `store(&(sSTSTran.ptr), ptr)` in all branch-local `Assert` blocks before and after `Memcpyx` until the actual pointer assignment consumes it.
4. First prove the true branch with pre-split SRAM prefix/dst/suffix resources.
5. Then handle the else branch. If a single function contract cannot express both branches with branch-dependent SRAM resources in QCP annotation syntax, report the exact smallest passing true-branch candidate and the exact blocker for the joined full-function spec.
6. Compile the scratch lib with `coqc` and run scratch `symexec`; include exact commands/results.
7. If no qcp-mcp is available, state that annotation-checking gate is still unsatisfied. Do not claim completed unless the required gate can be met.

## Report

Write:

`.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000002-annotation-r2-bytecopy/subagent_return_report.md`

Include outcome `completed`, `blocked`, or `stale`; exact scratch files; C/lib patch; commands; and next main-agent action.
