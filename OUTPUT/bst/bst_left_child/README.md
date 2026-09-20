# bst_left_child：最小二叉搜索树遍历验证

本 case 验证一次最简单的 BST 遍历动作：读取非空节点的 `left` 字段并返回左孩子指针。它用于确认从 `bst.zip` 导入的图模型能够接到 QCIP 的 C annotation、symbolic execution 和 Rocq 证明流程。

## 规格与模型

输入要求：

- 图 `g` 满足 `bst_gvalid(g)`；
- `root` 是 `g` 中的有效且非空节点；
- 具体内存单元 `root->left` 保存 `ptr_of (bst_left g root)`。

输出保证：返回值等于模型中的左孩子指针，并原样保留该字段的内存所有权。

模型对应关系为：

```text
root->left（C 字段）
    ↕ store
ptr_of (bst_left g root)（图模型中的左边）
```

case-local 结果谓词 `bst_left_child_result ret expected := ret = expected` 仅用于保持 annotation 与生成 VC 的接口清晰。

## 验证结果

- controller run：`bst_left_child-20260920175645`
- `source_version`：`6d3c52c43e7c82130398d1738f08c83c9f2564eb44fe5ac2d554f5c850892e59`
- `source_goal_version`：`2127b4f3e5d07cf445e8110f49702d9de9cab3cf6d6923db9d3e8de2a1f390f4`
- target witness：`proof_of_bst_left_child_return_wit_1`
- annotation、vc-checking、group-worker、parent verify 和 final-check：全部通过
- symbolic execution：到达函数末尾，freshness 比对通过
- `bst_left_child_goal_check.v`：fixed `coqc_check` 通过
- manual proof 与 case lib：无 `Admitted.`、无额外 `Axiom`、无 forbidden declaration

## 复现

在仓库根目录执行 canonical symbolic execution：

```bash
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/QCP_demos_LLM/bst_left_child_goal.v \
  --proof-auto-file=SeparationLogic/examples/QCP_demos_LLM/bst_left_child_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/QCP_demos_LLM/bst_left_child_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.QCP_demos_LLM \
  --input-file=QCP_examples/QCP_demos_LLM/bst_left_child.c \
  --no-exec-info
```

Rocq 检查必须走仓库固定入口：

```bash
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root "$PWD" \
  --build-workspace worktrees/bst_left_child-recheck \
  --target-file SeparationLogic/examples/QCP_demos_LLM/bst_left_child_goal_check.v \
  --target-kind check \
  --source-goal-version 2127b4f3e5d07cf445e8110f49702d9de9cab3cf6d6923db9d3e8de2a1f390f4
```

## 交付结构

- `source/`：已 annotation 的 C 文件和遍历模型头文件。
- `rocq/`：case lib、生成文件、manual proof、diagnostics 与所用 BST 模型快照。
- `reports/controller/`：append-only run log 和 timing summary。
- `reports/rounds/`：annotation、vc-checking、group-worker 与 parent merge 的完整 handoff/report。
- `reports/checkpoint.json`：最终版本与验收状态。
- `reports/reuse_packet.json`：继续验证其它 BST 遍历函数时可复用的建模和证明信息。

