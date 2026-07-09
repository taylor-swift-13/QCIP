## Annotation Checking Report

- status: passed
- checked_scope:
  - candidate C: `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave.c`
  - candidate annotation_scratch_lib: `.tmp/INPUT/IP/STSTransDataSave/20260709T_single_spec_r5/IP_STSTransDataSave_lib.v`
  - target case: `IP_STSTransDataSave`
- qcp_mcp_requirement_satisfied: yes
  - 已由本轮输入说明确认：qcp-mcp 在该候选上跑到文件尾并返回 success；剩余 2 个 return manual witness 属于后续 VC / witness 层，不阻塞 annotation-checking 质量门。
- annotation_scratch_lib_coqc_status: passed
  - 使用仓库 `_CoqProject` 等价 flags 编译候选 lib 通过。
  - 裸 `coqc` 曾因缺少 `AUXLib` 逻辑路径映射失败；这不是候选 lib 语义或语法失败。
- spec_definition_status: passed
  - `STSTransDataSaveBytePost` 已存在，并以 `STSTransDataSavePost` 与 `STSSramAfterCopy` 的合取描述函数后状态。
  - spec 是 predicate-first：它描述 `sSTSTran.ptr` 更新和 1KB SRAM 窗口的数学后状态，没有定义 Rocq 版 `Memcpyx`、循环解释器或 C 控制流状态机。
  - `STSTransDataSavePost` 表达指针条件式更新：`old_ptr < 776` 时 `new_ptr = old_ptr + 248`，否则 `new_ptr = old_ptr`。
  - `STSSramAfterCopy` 表达 SRAM 条件式后状态：true branch 用 list 分段替换目标 248 字节，false branch 保持 SRAM 不变。
- function_spec_status: passed
  - C `Require` 明确拆分 `dataBuf[248+8]` 为 `data_head` 与 `data_tail`，并拆分 SRAM 为 `prefix / old_dst / suffix`。
  - `Ensure` 调用 `STSTransDataSaveBytePost(ptr, ptr1, app(data_head, data_tail), app(prefix, app(old_dst, suffix)), new_sram)`，把逻辑性质与空间资源并列表达。
  - `Ensure` 保留 `dataBuf` 两段不变，并把 SRAM 资源合并为 `CharArray::full(1074343936, 1024, new_sram)`，足以交给后续 witness 证明。
- invariant_status: passed / not_applicable
  - 目标函数没有循环，因此无 `Inv Assert` 需要质量门检查。
  - true branch 内部 `Assert` 只承担分支连接、`pDst` 地址桥接和 `Memcpyx` 前后空间资源转换作用，没有用算法镜像替代数学后置规格。
- annotation_scratch_lib_changes:
  - 候选 r5 lib 相对当前正式 `OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_lib.v` 扩展了数学定义：新增 list 依赖、常量、`STSSramAfterCopy`、`STSTransDataSaveBytePost`，并将 pointer post 从硬编码常量整理为命名常量版本。
  - 需要由主 agent 在质量门通过后正式回填到 `common_case_formal_lib`。
- summary:
  - 该候选通过 annotation-checking。它把函数语义表达为 “ptr 条件式更新 + SRAM 1KB 窗口条件式后状态”，不是 C / `Memcpyx` 算法镜像。
  - `ptr` 边界和三段 SRAM 分解足够：`0 <= ptr <= 776`、`old_dst` 长度 248、`suffix` 长度 `1024 - ptr - 248`，覆盖完整 1KB 窗口；`ptr = 776` 时 suffix 为 0。
  - `dataBuf[248+8]` 分解足够：`data_head` 长度 248 用于 copy，`data_tail` 长度 8 保持不变，合并后满足 spec 中 `data_buf` 长度 256。
  - true branch 的 spec 等价表达 `new_sram = prefix ++ data_head ++ suffix`；false branch 在 `ptr >= 776` 且 `ptr <= 776` 下即 `ptr = 776`，表达 `new_sram = prefix ++ old_dst ++ suffix`。
- failed_checks: none
- required_annotation_rework: none
- required_annotation_scratch_lib_rework: none
- ready_for_main_common_case_formal_lib_update: yes
- ready_for_main_symexec: yes
- timing_summary:
  - qcp-mcp status: success to file end, provided by caller.
  - coqc status: passed with repository Coq path mappings.
- timing_gaps:
  - No blocking gap for annotation-checking.
  - Remaining 2 return manual witness obligations should be handled in downstream VC checking / proving after main formal backfill and symexec.

## Focused Review Answers

1. Spec 是否 predicate-first：
   - 是。`STSTransDataSaveBytePost` 描述数学后状态，不重写 `Memcpyx` 或 C 分支执行器。
2. ptr / dataBuf / SRAM 分段是否足够：
   - 是。`ptr <= 776` 保证 `ptr + 248 <= 1024`；`prefix + old_dst + suffix` 的长度为 `ptr + 248 + (1024 - ptr - 248) = 1024`；`data_head + data_tail` 长度为 `248 + 8 = 256`。
3. true / false branch 是否由 `STSTransDataSaveBytePost` 表达：
   - 是。true branch 由 `STSSramAfterCopy` 的 `old_ptr < STS_PTR_LIMIT` 分支表达；false branch 由 `old_ptr >= STS_PTR_LIMIT` 分支表达，在 C 前置条件下即 `ptr = 776`。
4. 是否需要修改 common_case_formal_lib：
   - 需要。当前正式 lib 只有 pointer post 级定义；主 agent 应把候选 r5 lib 中的数学定义正式集成到 `common_case_formal_lib`。

