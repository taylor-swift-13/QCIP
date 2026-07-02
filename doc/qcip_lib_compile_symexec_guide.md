# QCIP xizi lib / symexec 编译说明

## 路径规则

- 自定义 xizi 公共库写在 `QCIPLib/xizi`，不放入 `QCP_examples/LLM_bench` 或 `SeparationLogic/examples/LLM_bench`。
- 生成的正式 Rocq case 产物写在 `QCIPCases/xizi/<case>`。
- 交付归档写在 `OUTPUT/xizi/<case>`。
- `INPUT/xizi` 只保存可编译 C 闭包，不写规格和证明。

## Coq 编译

`_CoqProject` 中需要包含：

```sh
-R QCIPLib QCIPLib -R QCIPCases QCIPCases
```

公共库编译：

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_strategy_goal.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_strategy_proof.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v
```

case 编译：

```sh
case=xizi_single_link_len
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_goal.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_goal_check.v
```

## symexec 模板

单链表 case 使用 xizi 单链表 strategy：

```sh
case=xizi_single_link_append
linux-binary/symexec \
  --input-file OUTPUT/xizi/$case/source/$case.c \
  -IOUTPUT/xizi/$case/source \
  -IQCP_examples/QCP_demos_LLM/ \
  -IQCIPLib/xizi/xizi_single_link_common \
  --coq-output-dir QCIPCases/xizi/$case \
  --coq-logic-path QCIPCases.xizi.$case \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  -slp QCIPLib/xizi/xizi_single_link_common QCIPLib.xizi.xizi_single_link_common \
  --strategy-folder-path QCIPLib/xizi/xizi_single_link_common \
  --no-exec-info
```

双链表字段级 case 不需要额外 xizi strategy：

```sh
case=xizi_double_link_insert_after
linux-binary/symexec \
  --input-file OUTPUT/xizi/$case/source/$case.c \
  -IOUTPUT/xizi/$case/source \
  -IQCP_examples/QCP_demos_LLM/ \
  --coq-output-dir QCIPCases/xizi/$case \
  --coq-logic-path QCIPCases.xizi.$case \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --no-exec-info
```

`-I QCP_examples/QCP_demos_LLM/` 用于 C 头文件搜索，`-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM` 用于 strategy / Coq 逻辑路径，二者不能互相替代。

