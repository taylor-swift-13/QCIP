# xizi_double_link_head_rec 验证交付

本次 storeA 迁移已通过 controller final-check，run 为 `xizi_double_link_head_rec-20260910002854`。可执行 C 未改动；迁移规约与证明。所有非注释 token 与迁移前一致。 本次单双链表套件已全部完成，并通过当前公共库依赖下的整套回归。旧版套件报告仅供历史参考。

泛型 `storeA : addr -> A -> Assertion` 与 idmanager 使用的 `dll.v` 对齐，表示内嵌 link 对应外部对象的业务资源；结构指针字段由链表谓词持有。保留已有非空、哨兵与函数行为条件。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_head_rec/source/xizi_double_link_head_rec_lib.v`；归档：`OUTPUT/xizi/xizi_double_link_head_rec/rocq/xizi_double_link_head_rec_lib.v`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_storeA/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`aa2e56bcdf500834911beb8b678d3d58ebea9c22b742b6235265fbf47d16d5d2`；manual witness 数：4。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 1 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_double_link_head_rec-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_double_link_head_rec-storeA-refresh/xizi_double_link_head_rec_goal.v --proof-auto-file=/tmp/xizi_double_link_head_rec-storeA-refresh/xizi_double_link_head_rec_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_head_rec-storeA-refresh/xizi_double_link_head_rec_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source --input-file=OUTPUT/xizi/xizi_double_link_head_rec/source/xizi_double_link_head_rec.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_head_rec-storeA-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_head_rec/source/xizi_double_link_head_rec_goal_check.v --target-kind check --source-goal-version aa2e56bcdf500834911beb8b678d3d58ebea9c22b742b6235265fbf47d16d5d2
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。

当前依赖回归证据：`OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/suite_audits/20260909181337/audit.json`；不替换本 case 原始 controller 接受记录。
