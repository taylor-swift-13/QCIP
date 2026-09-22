# xizi_double_link_remove_node 验证交付

当前 detached 规约增强已通过 controller final-check，run 为
`xizi_double_link_remove_node-20260918172030`。可执行 C 未修改。

本轮新增公开谓词 `xizi_dll_detached(node)`：它只持有节点的
`node_next` / `node_prev` 两个结构字段，并断言二者都指向节点自身；业务
payload 不包含在该谓词中。`DoubleLinkListRmNode` 新增
`xizi_dll_detached -> xizi_dll_detached` 幂等规约，原有 member/front/tail/strong
规约的删除后资源统一为
`xizi_dll_detached(linklist_node) * storeA(linklist_node, data)`。

泛型 storeA : addr -> A -> Assertion 表示嵌入 link 对应的业务资源；结构指针字段由链表谓词持有。公共 DLL 谓词保留参考逻辑条件，实际 C 用例与 idmanager 共用 CRules 模型；active 规约直接使用 DLL，旧名称仅保留兼容别名；MasterDLL 单独保留 master 参考布局。

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node_lib.v`；归档：`OUTPUT/xizi/xizi_double_link_remove_node/rocq/xizi_double_link_remove_node_lib.v`。
- `reports/workflow/xizi_double_link_remove_node-20260918172030/`：本 run 的
  controller、round、group 与最终证据。
- `reports/before_origin_dll_alignment/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`106e7450e1240a122a0c4f805c858ef2131497196d6f149e0007a7270f7415f0`；manual witness 数：5。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 0 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/xizi_double_link_remove_node-storeA-refresh
/home/yangfp/QCIP/linux-binary/symexec --goal-file=/tmp/xizi_double_link_remove_node-storeA-refresh/xizi_double_link_remove_node_goal.v --proof-auto-file=/tmp/xizi_double_link_remove_node-storeA-refresh/xizi_double_link_remove_node_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_remove_node-storeA-refresh/xizi_double_link_remove_node_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --CRules CRules --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source --input-file=OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node.c --no-exec-info
```

通过固定入口编译：

```sh
python3 /home/yangfp/QCIP/.agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_remove_node-detached-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node_goal_check.v --target-kind check --source-goal-version 106e7450e1240a122a0c4f805c858ef2131497196d6f149e0007a7270f7415f0
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。

本次 DLL 公共入口对齐 origin/idnode 后的当前依赖复验：canonical symbolic execution freshness、manual/case_lib 结构与禁用项检查、固定 Coq 编译均通过。统一证据：`OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/suite_audits/20260911051353/audit.json`。历史报告仍按原版本保留。

## 证明正文别名统一（2026-09-23）

2026-09-18 run 的 proof_manual.v 证明正文中保留了 11 处旧兼容别名拼写 `XiziLocalDLL.*`（`Module XiziLocalDLL := DLL.` 的别名，常量相同，编译本可通过，但不符合套件"active 文件只直接使用 DLL"的约定，`origin_dll_alignment/audit_completed_suite.py` 的别名断言会判失败）。本轮已将 proof_manual.v 中 `XiziLocalDLL.` 全部改写为 `DLL.`；`Module XiziLocalDLL := DLL.` 为直接模块别名，常量逐一同名，证明语义不变。固定 `coq_tooling.py check` 全链通过（goal_check，约 200 秒）；新 source_goal_version：`1ca58d5a984858c07a2feec25c282392104dfe129fa375dba515556a334cb991`（上文 `106e7450...` 为 2026-09-18 run 的历史记录）。OUTPUT 归档 proof_manual.v 已与 live 同步。
