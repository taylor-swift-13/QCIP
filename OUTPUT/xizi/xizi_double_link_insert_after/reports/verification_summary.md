# xizi_double_link_insert_after 验证交付

本次验证已通过 controller final-check，run 为 `xizi_double_link_insert_after-20260910183629`。所有非注释 token 与迁移前一致。 完整套件仍在迁移中，旧套件检查不作为本版本证据。

泛型 storeA : addr -> A -> Assertion 表示嵌入 link 对应的业务资源；结构指针字段由链表谓词持有。公共 DLL 谓词保留参考逻辑条件，实际 C 用例与 idmanager 共用 CRules 模型；XiziLocalDLL 是 XiziIdmanagerDLL 同一实例的别名。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after_lib.v`；归档：`OUTPUT/xizi/xizi_double_link_insert_after/rocq/xizi_double_link_insert_after_lib.v`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_crules_unification/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`577d4beb15763b19cd75745432d3231d26fe8af89bd6f95286a840917e074b5a`；manual witness 数：7。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 0 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_double_link_insert_after-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_double_link_insert_after-storeA-refresh/xizi_double_link_insert_after_goal.v --proof-auto-file=/tmp/xizi_double_link_insert_after-storeA-refresh/xizi_double_link_insert_after_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_insert_after-storeA-refresh/xizi_double_link_insert_after_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --CRules CRules --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source --input-file=OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_insert_after-storeA-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after_goal_check.v --target-kind check --source-goal-version 577d4beb15763b19cd75745432d3231d26fe8af89bd6f95286a840917e074b5a
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。
