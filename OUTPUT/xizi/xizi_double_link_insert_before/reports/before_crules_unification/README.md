# xizi_double_link_insert_before 验证交付

本次验证已通过 controller final-check，run 为 `xizi_double_link_insert_before-20260910125839`。所有非注释 token 与迁移前一致。 本次指定的 8 个双链表与 9 个单链表函数已完成当前依赖下的统一复验。

泛型 storeA : addr -> A -> Assertion 表示嵌入 link 对应的业务资源；结构指针字段由链表谓词持有。公共 DLL 谓词保留参考逻辑条件，实际 C 用例使用 XiziLocalDLL，idmanager 入口另使用与 CRules 兼容的实例。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before_lib.v`；归档：`OUTPUT/xizi/xizi_double_link_insert_before/rocq/xizi_double_link_insert_before_lib.v`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_idmanager_alignment/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`211b63f7b6f617efa69c47071b5a646f0fbc2593c7c3e82fba43007759aa980d`；manual witness 数：7。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 0 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_double_link_insert_before-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_goal.v --proof-auto-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_insert_before-storeA-refresh/xizi_double_link_insert_before_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source --input-file=OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_insert_before-storeA-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before_goal_check.v --target-kind check --source-goal-version 211b63f7b6f617efa69c47071b5a646f0fbc2593c7c3e82fba43007759aa980d
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。

本次参考 DLL 迁移后的当前版本复验：canonical symbolic execution freshness、manual/case_lib 结构与禁用项检查、固定 Coq 编译均通过。统一证据：`OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment/suite_audits/20260910072705/audit.json`。历史报告仍按原版本保留。
