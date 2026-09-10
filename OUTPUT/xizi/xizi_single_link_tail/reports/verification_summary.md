# xizi_single_link_tail 验证交付

本次验证已通过 controller final-check，run 为 `xizi_single_link_tail-20260910120042`。按用户指定源码恢复原函数体，并重新生成目标和证明；与原源码的函数名、参数和函数体 token 比对通过。详见 executable_c_comparison.json。 完整套件仍在迁移中，旧套件检查不作为本版本证据。

沿用泛型 storeA : addr -> A -> Assertion 的单链表载荷规约，保持 NULL 终止、原节点次序及全部业务资源。单链表没有改成循环双链表模型。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_single_link_tail/source/xizi_single_link_tail_lib.v`；归档：`OUTPUT/xizi/xizi_single_link_tail/rocq/xizi_single_link_tail_lib.v`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_idmanager_alignment/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`ac6b605538e2cbcd0c4166cb53459c8e4a3855b9894ab72643e87189e564e4e3`；manual witness 数：4。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 0 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_single_link_tail-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_single_link_tail-storeA-refresh/xizi_single_link_tail_goal.v --proof-auto-file=/tmp/xizi_single_link_tail-storeA-refresh/xizi_single_link_tail_proof_auto.v --proof-manual-file=/tmp/xizi_single_link_tail-storeA-refresh/xizi_single_link_tail_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source --input-file=OUTPUT/xizi/xizi_single_link_tail/source/xizi_single_link_tail.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_single_link_tail-storeA-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_single_link_tail/source/xizi_single_link_tail_goal_check.v --target-kind check --source-goal-version ac6b605538e2cbcd0c4166cb53459c8e4a3855b9894ab72643e87189e564e4e3
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。
