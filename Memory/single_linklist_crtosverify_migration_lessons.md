# single_linklist 迁移到 crtosverify 的工作经验

## 背景

本 session 的任务是把 `/home/yangfp/QCIP/OUTPUT/xizi` 中已有的单链表证明和对应
Coq 库迁移到新克隆的 `crtosverify` 仓库，并建立 `single_linklist` 分支。

目标仓库：

```text
/home/yangfp/QCIP/crtosverify
https://gitee.com/ProgramVerification/crtosverify.git
```

关键结论：

- `single_linklist` 必须基于 `master` 修改；
- 不得在 `idnode` 分支上 push；
- `idnode` 只能作为文件组织参考；
- `annotated_C/src` 才是 C 源码组织入口；
- `annotated_C/gen` 是 `make` 过程生成的中间目录，不应作为最终源码组织提交。

## 分支错误与修正

一开始错误地从 `origin/idnode` 创建了 `single_linklist` 并 push。用户指出：

```text
你不要在 idnode 上 push 啊
我需要你 single list 分支去掉 idnode 分支独有的东西要在 master 分支上修改
文件组织参考一下 idnode 分支的实现
```

修正方式：

1. 从错误提交中提取只属于 single-link 迁移的 patch；
2. 切回 `master`；
3. 从 `master` 创建新的 single-link 工作分支；
4. 应用 patch；
5. 检查相对 `master` 的 diff 不包含 `idnode` 独有内容；
6. 用 `--force-with-lease` 更新远端 `single_linklist`，替换错误历史。

最终远端 `origin/single_linklist` 已回到 `master` 基础：

```text
fb44082 Organize single-link sources under annotated src
0c1e271 Migrate single-link cases to CRTOS_Verify
d215f73 master
```

## 文件组织

参考 `idnode` 分支时，重点是参考 `annotated_C/src` 的组织，而不是把生成目录当源码。

最终 single-link 组织：

```text
annotated_C/src/xizi_single_link_def.h
annotated_C/src/xizi/xizi_single_link_append/xizi_single_link_append.c
annotated_C/src/xizi/xizi_single_link_empty/xizi_single_link_empty.c
annotated_C/src/xizi/xizi_single_link_first/xizi_single_link_first.c
annotated_C/src/xizi/xizi_single_link_init/xizi_single_link_init.c
annotated_C/src/xizi/xizi_single_link_insert_after/xizi_single_link_insert_after.c
annotated_C/src/xizi/xizi_single_link_len/xizi_single_link_len.c
annotated_C/src/xizi/xizi_single_link_next/xizi_single_link_next.c
annotated_C/src/xizi/xizi_single_link_remove_node/xizi_single_link_remove_node.c
annotated_C/src/xizi/xizi_single_link_tail/xizi_single_link_tail.c
annotated_C/strategy/xizi_single_link.strategies
lib/xizi_single_link_lib_core.v
lib/xizi_single_link_lib.v
VC/code_proof/xizi/xizi_single_link_*/*_proof_manual.v
```

`src` 下的 C case 因为在两层目录内，所以公共头 include 应写为：

```c
#include "../../xizi_single_link_def.h"
```

`manual.v` 不应该出现在 `annotated_C/src` 里。manual proof 的位置是：

```text
VC/code_proof/xizi/xizi_single_link_*/*_proof_manual.v
```

## Makefile 经验

为了让仓库能从 `annotated_C/src` 重新生成，需要让 `make` 先把源码复制到
`annotated_C/gen`，再跑 StrategyCheck、symexec、coqdep 和 coqc。

关键修改点：

- `VC_code_FILE_NAME` 列出 `xizi/xizi_single_link_*`；
- `VC_h_code_FILE_NAME = xizi_single_link_def`；
- 添加 `annotated_C/gen/%` 和 `annotated_C/dep/%` 的目录规则；
- C 源和头文件从 `annotated_C/src` 复制到 `annotated_C/gen`；
- `gcc -MM` 和 `symexec` 必须带 QCP demo include 路径：

```make
C_INCLUDE_FLAG = -I../QCP_examples/QCP_demos_LLM
```

否则 `make all` 会在依赖生成阶段报：

```text
fatal error: verification_stdlib.h: No such file or directory
```

生成 code proof 时，`--coq-logic-path` 不能只取第一层目录 `xizi`，否则嵌套 case 的
module 路径会不匹配。对：

```text
xizi/xizi_single_link_append/xizi_single_link_append
```

应生成：

```text
CRTOS_Verify.VC.code.xizi.xizi_single_link_append
```

## 验证命令

这次最终使用：

```sh
make all
```

验证了完整链路：

1. 从 `annotated_C/src` 复制到 `annotated_C/gen`；
2. 运行 StrategyCheck；
3. 运行 symexec；
4. 运行 coqdep；
5. 编译 strategy proof；
6. 编译所有 single-link goal、auto、manual、goal_check。

构建通过后，清理了中间目录：

```sh
rm -rf annotated_C/gen annotated_C/dep
```

注意：清理 `annotated_C/gen` 是为了保持最终源码组织干净；它可以由 `make` 再生成。

## 推送与 HANDOFF 经验

用户要求写 HANDOFF 时，曾在 `crtosverify` 根目录新增并本地提交：

```text
HANDOFF.md
a13aaac Add single-link handoff
```

随后 push 失败，用户明确说：

```text
HANDOFF 不用 push
```

于是用：

```sh
git reset --hard origin/single_linklist
```

删除了本地 HANDOFF 提交，恢复到远端一致状态。以后如果只是临时交接说明，不要默认提交或 push；
尤其是用户说不用 push 时，必须保留或删除本地文件前先确认目标。

## 检查清单

- [ ] 当前仓库是 `/home/yangfp/QCIP/crtosverify`。
- [ ] 当前分支是 `single_linklist`。
- [ ] `single_linklist` 基于 `master`，不是 `idnode`。
- [ ] `git diff --name-status master..HEAD` 不包含 `VC/code_proof/id/`、`annotated_C/src/id*`、`lib/idnode.v` 等 idnode-only 内容。
- [ ] C 源放在 `annotated_C/src/xizi/...`。
- [ ] 公共头放在 `annotated_C/src/xizi_single_link_def.h`。
- [ ] `annotated_C/gen` 不作为最终源码提交。
- [ ] manual proof 位于 `VC/code_proof/xizi/xizi_single_link_*/*_proof_manual.v`。
- [ ] `make all` 从 `src` 重新生成并通过。
- [ ] push 远端 single-link 时只推 `origin/single_linklist`，不得推 `idnode`。
