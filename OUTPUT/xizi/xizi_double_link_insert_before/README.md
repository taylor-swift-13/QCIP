# xizi_double_link_insert_before 验证交付

本次验证已通过 controller final-check，run 为 `xizi_double_link_insert_before-20260911122413`。所有非注释 token 与迁移前一致。 本次指定的 8 个双链表与 9 个单链表函数已完成当前依赖下的统一复验。

泛型 storeA : addr -> A -> Assertion 表示嵌入 link 对应的业务资源；结构指针字段由链表谓词持有。公共 DLL 谓词保留参考逻辑条件，实际 C 用例与 idmanager 共用 CRules 模型；active 规约直接使用 DLL，旧名称仅保留兼容别名；MasterDLL 单独保留 master 参考布局。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before_lib.v`；归档：`OUTPUT/xizi/xizi_double_link_insert_before/rocq/xizi_double_link_insert_before_lib.v`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_origin_dll_alignment/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`09cf4cabc3d859d56949920d66485abdaa356e176fefbf588dd38ce0620cbecc`；manual witness 数：7。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 0 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_double_link_insert_before-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_goal.v --proof-auto-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --CRules CRules --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source --input-file=OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_insert_before-storeA-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before_goal_check.v --target-kind check --source-goal-version 09cf4cabc3d859d56949920d66485abdaa356e176fefbf588dd38ce0620cbecc
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。

本次 DLL 公共入口对齐 origin/idnode 后的当前依赖复验：canonical symbolic execution freshness、manual/case_lib 结构与禁用项检查、固定 Coq 编译均通过。统一证据：`OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/suite_audits/20260911051353/audit.json`。历史报告仍按原版本保留。

## 命名空间迁移（2026-09-23）

按 idmanager（crtosverify `origin/idnode`）风格完成 `DLL::` 去除，方案与 2026-09-22 其余 7 个双链 case 相同（见 `QCIP/experience/xizi_link_unqualified_namespace_2026-09-22.md`）：C annotation 增加 `/*@ Import Coq Import DLL */`，goal / proof_auto / proof_manual / case_lib / diagnostics 使用 `Import DLL.` 与未限定名。Assert 中局部存在变量 `ptrs` 与 `DLL.ptrs` 同名冲突，已 α-重命名为 `node_ptrs`；引用的 Coq 常量、规格、witness 语句与证明语义不变，未增加别名或包装定义。

复验：canonical symbolic execution 重新生成 goal / proof_auto（与旧版差异仅命名空间与 α 重命名；goal_check 逐字节不变），固定 `coq_tooling.py check` 全链通过（goal_check，约 235 秒），manual 7 个 witness 结构完整且无 `Admitted.` / extra `Axiom` / `_split_goal_`，case_lib 无 `Admitted.` / extra `Axiom`，diagnostics 已从刷新后的 manual skeleton 重新生成，OUTPUT 归档与 live 字节一致。新 source_goal_version：`e43d8b5d3ef27d61a62d774aae84fa7e1ce3a728ce35e677994c1a3507393064`（上文 `09cf4c...` 为 2026-09-11 run 的历史记录）。8 个双链 case 的命名空间风格自此统一。
