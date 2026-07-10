## annotation-subagent return report r5

- status: passed
- phase: annotation-checking
- target_case: `IP_STSTransDataSave`
- report_path: `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T_single-spec-r5/annotation_checking_report_passed.md`
- candidate_c_ready_for_main_backfill: `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave.c`
- candidate_lib_ready_for_main_backfill: `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave_lib.v`
- may_modify_formal_main_state_by_subagent: no
- formal_main_state_modified: no

## Decision

本轮 r5 annotation-checking 质量门通过。候选 C annotation 与候选 `annotation_scratch_lib` 可以交回主 agent，由主 agent 决定正式回填目标 `.c` 与 `common_case_formal_lib` 后再运行正式 symexec。

## Reasons

- `qcp-mcp_requirement_satisfied`: yes；调用方确认 qcp-mcp 已在候选 r5 上跑到文件尾并返回 success。
- `annotation_scratch_lib_coqc_status`: passed；候选 lib 使用仓库 `_CoqProject` 等价 flags 编译通过。
- `spec_quality`: passed；`STSTransDataSaveBytePost` 是 predicate-first 后状态关系，表达 `sSTSTran.ptr` 与 SRAM 条件式后状态，不是 C / `Memcpyx` 算法镜像。
- `memory_segmentation`: passed；`ptr`、`dataBuf[248+8]`、`prefix/old_dst/suffix` 的长度约束足以描述 1KB SRAM 分段和 248 字节目标区替换。
- `branch_semantics`: passed；true branch 表达 `prefix ++ data_head ++ suffix`，false branch 在 `ptr = 776` 时表达 `prefix ++ old_dst ++ suffix`。

## Required Main-Agent Actions

- 回填候选 C：
  - `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave.c`
- 回填候选 common_case_formal_lib 定义：
  - `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave_lib.v`
- 回填后重新记录正式 `common_case_formal_lib` 的 frozen prefix，再进入正式 symexec / goal-frozen。
- 后续 2 个 return manual witness 不属于 annotation-checking 失败；应在 VC checking / VC proving 阶段处理。

## Notes

- 本 subagent 只写入指定 report 目录，没有修改正式主状态文件。
- 当前正式 `OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_lib.v` 需要更新，因为它尚未包含 r5 的 `STSSramAfterCopy` / `STSTransDataSaveBytePost` 数学后状态定义。

