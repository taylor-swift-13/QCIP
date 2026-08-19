# Xizi 单链表验证与迁移经验总结（2026-07-22）

## 1. 工作范围与结果

今天完成的是 Xizi 单链表接口从早期、偏具体的规约，向 LOS 风格的抽象链表规约迁移，并将已确认的版本同步到 `crtosverify` 的 `single_linklist` 分支。

本轮处理了 8 个函数：

| 函数 | 核心语义 | CRTOS 提交 |
|---|---|---|
| `xizi_single_link_init` | 初始化哨兵头结点 | `d6254bb` |
| `xizi_single_link_append` | 尾部追加数据结点 | `5fff4a3` |
| `xizi_single_link_insert_after` | 在哨兵头后插入数据结点 | `fecddbb` |
| `xizi_single_link_len` | 计算数据结点数量 | `0cc9697` |
| `xizi_single_link_tail` | 从数据结点出发寻找尾结点 | `5aef4e4` |
| `xizi_single_link_first` | 读取哨兵头后的第一个数据结点 | `8501f39` |
| `xizi_single_link_next` | 读取指定数据结点的后继 | `d629954` |
| `xizi_single_link_empty` | 判断哨兵头表示的链表是否为空 | `6e54f0f` |

截至记录时，`crtosverify/single_linklist` 本地分支领先远端 8 个提交。这些提交尚未推送，不应把“本地验证和提交完成”误写成“远端已经更新”。`xizi_single_link_remove_node` 不在今天完成的 8 道题之内。

## 2. 首先确定：Xizi 单链表是有哨兵头结点的

理解接口语义是这次迁移最重要的前提。Xizi 的大部分公开单链表接口接收的 `linklist` 不是第一个数据结点，而是一个哨兵头结点：

```text
linklist(head) -> first data node -> ... -> last data node -> NULL
```

空表不是 `linklist == NULL`，而是：

```text
linklist != NULL
linklist->node_next == NULL
```

因此，下列接口的公开规约应以 `xizi_sll_head(linklist, l)` 为主体：

- `init`
- `append`
- `insert_after`
- `len`
- `first`
- `empty`

但 `tail` 和 `next` 的参数语义不同：它们接收的是数据结点本身，所以应使用 `xizi_sll`，不能机械地把所有函数都改成 `xizi_sll_head`。

这一区分避免了两个常见错误：

1. 把哨兵头结点错误计入抽象数据序列；
2. 把数据结点错误解释成头结点，导致规约比 C 实现多解引用或少解引用一层。

## 3. 三个核心谓词的分工

### 3.1 `xizi_sll(p, l)`

表示从数据结点指针 `p` 开始的一条完整单链表，抽象序列为 `l`。序列元素记录的是数据结点地址。

- `l == nil` 时，`p == 0`；
- `l == cons(p, l')` 时，拥有 `p->node_next`，并继续拥有从后继开始的链表。

它适合描述“数据链”，例如 `tail` 的输入、`next` 的输入和循环中的剩余后缀。

### 3.2 `xizi_sllseg(x, y, l)`

表示从 `x` 开始、到边界 `y` 之前结束的链表段，抽象序列为 `l`。

它主要用于循环不变量，将原链表拆成：

```text
已经遍历的前缀 * 尚未遍历的后缀
```

链表段谓词不是仅为描述形状；它还保存已遍历部分的内存所有权，使循环每走一步都能重新折叠出新的前缀。

### 3.3 `xizi_sll_head(h, l)`

表示 `h` 是哨兵头结点，拥有 `h->node_next` 字段，并且该字段指向的链表由 `xizi_sll(first, l)` 描述。

逻辑上可以理解为：

```text
exists first,
  h->node_next == first *
  xizi_sll(first, l)
```

其中 `h` 本身不属于抽象序列 `l`。这正是 Xizi 大多数公开接口应该暴露的抽象层级。

### 3.4 选择规则

| 场景 | 应使用的谓词 |
|---|---|
| 参数是哨兵头结点 | `xizi_sll_head` |
| 参数是数据结点，且要拥有其后续链 | `xizi_sll` |
| 循环中保存已遍历前缀 | `xizi_sllseg` |
| 循环中保存尚未遍历部分 | `xizi_sll` |

迁移时应先判断 API 参数的角色，再选谓词；不能只按函数名猜测。

## 4. 从 LOS 例子得到的规约设计原则

本轮重点参考了：

```text
/home/yangfp/OSV/LOS_Verify-capability/annotated_C/src/link
```

LOS 的价值不在于存在一个与 Xizi 完全同名的函数，而在于它展示了稳定的抽象方式：

1. 公开规约描述抽象容器内容，不暴露不必要的内部指针；
2. `With` 用来携带调用者已知、并需要跨越函数调用保存的抽象状态；
3. 内部指针、循环切分和返回后才产生的见证使用 `exists`；
4. 循环不变量用“前缀 + 当前结点 + 后缀”恢复整条链，而不是只保存当前指针非空；
5. 源级 annotation 负责提供结构事实，Rocq 证明负责消费这些事实，不在证明脚本里重新模拟 C 算法。

例如 LOS 的空表判断规约直接把返回值与抽象序列 `l` 是否为 `nil` 联系起来，而不是要求调用者先提供内部首指针。`xizi_single_link_empty` 最终采用了同样的思路。

## 5. `With`、`exists`、`undef_data_at` 与 `emp`

### 5.1 `With` 的实际含义

`With x` 引入的是调用者侧的 ghost 参数。调用者使用被调函数时，需要让验证器确定 `x` 的具体逻辑值：

- 简单情形可由前置条件自动推断；
- 推断不足时，需要在调用点通过 `where` 等机制显式绑定。

因此，`With` 不是“函数内部随便取一个值”，也不是隐藏局部变量的语法。把内部实现指针放进 `With`，会让调用者承担本不必要的实例化义务。

### 5.2 `exists` 的实际含义

`exists x` 表示逻辑中存在某个见证：

- 在前置条件中，调用者只需证明见证存在；
- 在后置条件中，函数证明产生见证，调用者可在返回后析取它。

`first` 和 `next` 返回的内部指针适合放在后置条件的 `exists` 中：调用者关心的是返回值确实等于链表中相应的指针，而无需在调用前为这个内部指针命名。

### 5.3 为什么不使用 `With _`

`_` 不是一个可靠的“匿名任意 ghost 值”设计方法。即使某个解析或推断阶段接受它，也没有清楚表达：

- 谁拥有该字段；
- 字段是否已初始化；
- 函数是否允许覆盖它；
- 调用者是否需要知道旧值。

若意图是“旧值任意，但字段可写”，应该使用所有权谓词，例如 `undef_data_at`；若意图是“内部存在某个指针”，应该使用抽象链表谓词或 `exists`。

### 5.4 为什么 `Require emp` 不够

`emp` 表示不拥有任何堆内存。它不能授权执行：

```c
linklist->node_next = 0;
```

写字段必须拥有该字段对应的空间。初始化函数所需的不是“旧值等于某个具体值”，而是“该字段存在、可写，旧内容无需读取”。因此：

```c
undef_data_at(&(linklist->node_next), SysSingleLinklistType *)
```

比 `emp` 或 `With first; linklist->node_next == first` 更准确。

## 6. 八个函数的迁移经验

### 6.1 `xizi_single_link_init`

最终规约：

```c
void xizi_single_link_init(SysSingleLinklistType *linklist)
/*@ Require
      linklist != 0 &&
      undef_data_at(&(linklist -> node_next), SysSingleLinklistType *)
    Ensure
      xizi_sll_head(linklist, nil)
*/
{
    linklist->node_next = (void *)0;
}
```

关键改进：

- 删除具体的 `With first`；
- 不再要求旧字段等于调用者提供的某个值；
- 用 `undef_data_at` 表示旧值任意但字段可写；
- 后置条件直接得到空的哨兵头链表。

这使规约精确匹配“覆盖初始化”的 C 语义。初始化函数不读取旧值，所以要求旧值具体是什么既多余又降低可调用性。

### 6.2 `xizi_single_link_append`

最终公开规约的核心是：

```c
/*@ With l old_next
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      xizi_sll_head(linklist, l) &&
      linklist_node -> node_next == old_next
    Ensure
      xizi_sll_head(linklist, app(l, cons(linklist_node, nil)))
*/
```

它表达：原数据序列为 `l`，执行后得到 `l ++ [linklist_node]`。新结点旧的 `node_next` 内容可以任意，因为函数最终会把它改为 `NULL`。

循环不变量使用类似以下分解：

```c
/*@ Inv
    exists l1a l1b next,
      cons(linklist, l) == app(l1a, cons(node, l1b)) &&
      ... &&
      xizi_sllseg(linklist, node, l1a) *
      xizi_sll(next, l1b) &&
      linklist_node -> node_next == old_next
*/
```

这里有一个容易误解的技巧：公开规约把哨兵头与数据序列分开，但循环从 `linklist` 自身开始遍历，所以不变量内部暂时用 `cons(linklist, l)` 表示“包含哨兵头在内的物理遍历序列”。这是内部证明视图，不应泄漏到公开后置条件。

同时保留新结点字段所有权非常重要，它确保：

- 新结点没有被原链表谓词占用；
- 函数可以合法修改 `linklist_node->node_next`；
- 空数据链，即只有哨兵头的情形，也能由同一不变量覆盖。

### 6.3 `xizi_single_link_insert_after`

最终核心规约：

```c
/*@ With l old_next
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      xizi_sll_head(linklist, l) &&
      linklist_node -> node_next == old_next
    Ensure
      xizi_sll_head(linklist, cons(linklist_node, l))
*/
```

虽然函数名是 `insert_after`，当前 API 中的 `linklist` 参数表示哨兵头，所以它的实际效果是把新结点插到哨兵头之后，也就是数据序列头部：

```text
l  --->  [new] ++ l
```

迁移时必须依据 C 主体的指针操作确定语义，不能仅凭名称把它规约成“在任意数据结点之后插入”。

`old_next` 的作用与 append 中相同：保持对新结点字段的写权限，并允许旧值任意。C 主体不需要修改；变化集中在公开抽象规约。

### 6.4 `xizi_single_link_len`

最终核心规约：

```c
/*@ With l
    Require
      linklist != 0 &&
      Zlength(l) <= UINT_MAX &&
      xizi_sll_head(linklist, l)
    Ensure
      __return == Zlength(l) &&
      xizi_sll_head(linklist, l)
*/
```

返回值只统计数据结点，不统计哨兵头。链表在函数后保持不变。

典型循环不变量为：

```c
exists first l1 l2,
  l == app(l1, l2) &&
  Zlength(l) <= UINT_MAX &&
  length == Zlength(l1) &&
  linklist == linklist@pre &&
  linklist -> node_next == first &&
  xizi_sllseg(first, tmp_list, l1) *
  xizi_sll(tmp_list, l2)
```

经验有三点：

1. `l == app(l1, l2)` 保存抽象序列的完整性；
2. `length == Zlength(l1)` 将计数器与已遍历前缀精确绑定；
3. `Zlength(l) <= UINT_MAX` 必须在循环中持续可用，否则自增的整数安全证明可能在中途丢失依据。

只写“计数器非负、游标位于链中”不足以证明精确长度。

### 6.5 `xizi_single_link_tail`

最终规约核心：

```c
/*@ With l
    Require
      linklist != 0 &&
      xizi_sll(linklist, l)
    Ensure
      exists l1,
        l == app(l1, cons(__return, nil)) &&
        __return != 0 &&
        xizi_sllseg(linklist@pre, __return, l1) *
        (__return -> node_next == 0)
*/
```

此函数从传入的数据结点开始遍历，因此使用 `xizi_sll`，而不是 `xizi_sll_head`。前置的 `linklist != 0` 排除了空数据链；后置条件证明：

- 返回值是原序列的最后一个结点；
- 原链可分成返回值之前的前缀和最后一个结点；
- 返回结点的 `node_next == 0`。

循环不变量保持：

```c
exists l1 l2 next,
  l == app(l1, cons(linklist, l2)) &&
  linklist != 0 &&
  linklist -> node_next == next &&
  xizi_sllseg(linklist@pre, linklist, l1) *
  xizi_sll(next, l2)
```

这一形式把当前结点单独暴露出来，既能检查 `node_next`，又能在前进一步后延长前缀。

### 6.6 `xizi_single_link_first`

最终规约核心：

```c
/*@ With l
    Require
      linklist != 0 &&
      xizi_sll_head(linklist, l)
    Ensure
      exists first,
        __return == first &&
        (linklist -> node_next == first) *
        xizi_sll(first, l)
*/
```

迁移前容易把 `first` 放进 `With`，让调用者在调用前为内部首指针命名。迁移后只把抽象序列 `l` 放在 `With` 中，返回后再通过 `exists first` 暴露实际首指针。

这样既保留完整内存所有权，又降低了调用者负担。空表自然包含在规约中：当 `l == nil` 时，`xizi_sll(first, nil)` 推出 `first == 0`，因此返回 `NULL`。

### 6.7 `xizi_single_link_next`

最终规约核心：

```c
/*@ With l
    Require
      linklist_node != 0 &&
      xizi_sll(linklist_node, cons(linklist_node, l))
    Ensure
      exists next,
        __return == next &&
        (linklist_node -> node_next == next) *
        xizi_sll(next, l)
*/
```

该函数输入是数据结点，所以规约拥有从该结点开始的完整后缀。执行后：

- 返回字段中保存的 `next`；
- 当前结点字段所有权仍然存在；
- 从 `next` 开始的后缀链保持不变。

同一规约覆盖两种情形：

- 中间结点：`l` 非空，返回下一个数据结点；
- 尾结点：`l == nil`，由 `xizi_sll(next, nil)` 得出 `next == 0`。

### 6.8 `xizi_single_link_empty`

最终规约核心：

```c
/*@ With l
    Require
      linklist != 0 &&
      xizi_sll_head(linklist, l)
    Ensure
      ((l == nil && __return == 1) ||
       (l != nil && __return == 0)) &&
      xizi_sll_head(linklist, l)
*/
```

这一版直接参考 LOS 的抽象空表判断方式。它不再让调用者提供 `first`，而是把返回值与抽象数据序列是否为空精确对应：

- `l == nil` 当且仅当返回 1；
- `l != nil` 当且仅当返回 0；
- 函数只读，链表所有权完整返回。

这比“返回值等于 `linklist->node_next == NULL` 的某种低层表达”更适合作为公开 API 规约，因为调用者通常关心容器是否为空，而不是哨兵头字段的实现细节。

## 7. 循环不变量的通用构造方法

对单链表遍历，最稳定的做法是先写出抽象等式，再写空间拆分。

### 7.1 抽象等式

一般形态：

```text
原序列 = 已遍历前缀 ++ 当前/剩余序列
```

若当前结点需要单独访问字段，则使用：

```text
原序列 = 前缀 ++ [当前结点] ++ 后缀
```

### 7.2 空间拆分

一般形态：

```text
xizi_sllseg(原起点, 当前边界, 前缀) *
xizi_sll(剩余起点, 后缀)
```

星号保证两部分内存互不重叠，并覆盖函数仍然拥有的全部链表内存。

### 7.3 保存非空间事实

循环不变量还必须显式保留后续证明需要的事实，例如：

- 原始头指针未改变；
- 新结点字段仍归函数所有；
- 计数器与前缀长度相等；
- 整数上界足以证明下一次加一安全；
- 当前结点非空，可以安全解引用。

不要假设验证器会自动从循环外永久保留这些事实。

## 8. Rocq 手工证明中的可复用模式

### 8.1 折叠一个非空链结点

常见形式是先得到当前字段和后缀，再应用 `xizi_sll_cons` 折叠：

```coq
sep_apply (xizi_sll_cons x next l Hx).
entailer!.
```

具体参数和前提应以当前库中引理声明为准，不应凭记忆硬写。

### 8.2 处理空后缀

对 `xizi_sll(0, nil)` 或已知空序列，使用库中的 `xizi_sll_zero` 等引理折叠或展开，比手工展开递归定义更稳定。

### 8.3 拼接链表段

append、tail 一类证明经常组合：

- `xizi_sllseg_len1`
- `xizi_sllseg_sllseg`
- `xizi_sllseg_sll`

其目的分别是构造单结点段、拼接两个段、把段与完整后缀合并。证明脚本应围绕逻辑分解操作，而不是重复循环步骤。

### 8.4 返回指针的相等性

`first` 和 `next` 的分支通常只需暴露见证、处理相等性并完成空间消去。常见动作包括：

```coq
right.
intros.
subst.
cancel.
```

或在矛盾分支中使用 `inversion`。具体分支方向取决于生成的 VC，不能机械复制。

### 8.5 空表判断中的纯命题

`empty` 的非空分支需要把字段和后缀重新折叠成非空 `xizi_sll`，并证明 `cons q l0 <> nil`。这类纯命题有时不会被 `entailer!` 自动关闭，直接使用 `discriminate` 更明确。

空分支则把首指针代换为 0，再分析抽象序列；与 `xizi_sll(0, l)` 冲突的非空情形通过展开或库引理排除。

### 8.6 不使用未审计的捷径

手工证明中不得引入：

- `Admitted`
- `Abort`
- 顶层 `Axiom`
- 项目禁止列表中的不可靠辅助引理

生成的 auto 文件属于工具产物，应遵循仓库既有生成方式，不应为追求表面整洁而手改。人工维护的证明应集中在 manual 文件和经过证明、可复用的库引理中。

## 9. QCIP 验证流程的实际经验

### 9.1 标准流水线

一题完整迁移至少包含：

1. 修改 `OUTPUT/xizi/<case>/source/<case>.c` 的 annotation；
2. 运行符号执行，重新生成 goal 和 auto 文件；
3. 针对新 goal digest 编写或迁移 manual witness；
4. 对真实 `<case>_goal_check.v` 执行固定检查；
5. 将最终 Rocq 文件同步到 `OUTPUT/.../rocq`；
6. 再迁移到 `crtosverify`，通过其 Makefile 独立构建。

符号执行命令的通用形式为：

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/xizi/<case>/<case>_goal.v \
  --proof-auto-file=QCIPCases/xizi/<case>/<case>_proof_auto.v \
  --proof-manual-file=QCIPCases/xizi/<case>/<case>_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=QCIPCases.xizi.<case> \
  --input-file=OUTPUT/xizi/<case>/source/<case>.c \
  --no-exec-info
```

实际路径需按仓库布局调整。

### 9.2 symexec 不会安全覆盖已有 manual

工具会保护已有的 manual proof，常见提示是 manual proof file 未更新。因此重新生成 goal 后不能误以为 manual 已自动匹配新 VC。

正确做法是：

- 记录新 goal 的 digest；
- 明确检查 manual 中每个 witness 对应的新目标；
- 有意识地保留、替换或重写 manual；
- 最后运行 goal-check，而不是仅以 symexec 退出成功作为完成标准。

### 9.3 控制器的模块名推断问题

今天多次遇到控制器把目标路径：

```text
OUTPUT/xizi/<case>/source/<case>.c
```

错误地按目录或 stem 推断为模块 `source`，随后尝试导入不存在的：

```text
source_goal
source_proof_auto
source_proof_manual
```

结果是 worker 在真正检查目标证明之前就报告阻塞。这类失败不能解释为规约或证明错误。

临时绕过方式是保留 worker 生成的候选证明，然后对真实目标执行固定检查，例如：

```bash
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root <group-worktree> \
  --build-workspace <run-root>/_coq_builds/<case>-actual-check \
  --target-file SeparationLogic/examples/OUTPUT/xizi/<case>/source/<case>_goal_check.v \
  --target-kind check \
  --source-goal-version <digest>
```

报告中必须区分：

- 控制器最终验收；
- 对真实 goal-check 的固定独立检查。

在控制器 bug 未修复前，不能把后者冒充前者，但它仍然是判断证明能否重放的有效证据。

### 9.4 `group_plan.json` 缺失问题

VC checking 阶段多次出现报告声称已经生成计划，但实际没有写出控制器要求的 `group_plan.json`，最终触发 `FileNotFoundError`。

处理经验：

- 不只看自然语言报告，要检查计划文件确实存在；
- 检查 JSON schema；
- 检查每个 witness 是否恰好被某个 group 覆盖；
- 若缺失，应让同一检查阶段补齐计划，而不是直接进入证明阶段。

## 10. 迁移到 `crtosverify` 的经验

### 10.1 文件位置

annotation C 的目标位置为：

```text
crtosverify/annotated_C/src/xizi/<case>/<case>.c
```

目标仓库有独立的生成目录、逻辑库和 Makefile，不能把 QCIP 中通过的结果简单视为 CRTOS 中也已通过。

### 10.2 使用仓库 Makefile 构建

CRTOS 中应使用仓库规定的构建流程，不用临时、直接的 `coqc` 命令替代。首次生成常需先建立目录和公共生成物：

```bash
make annotated_C/dep/xizi/<case>/ \
     annotated_C/gen/xizi/<case>/ \
     VC/code_proof/xizi/<case>/ \
     annotated_C/gen/xizi_single_link_def.h \
     annotated_C/gen/xizi_single_link.strategies
```

随后生成并检查：

```text
VC/code_proof/xizi/<case>/<case>_goal.v
VC/code_proof/xizi/<case>/<case>_goal_check.vo
```

### 10.3 include 路径要按两个阶段考虑

`../../xizi_single_link_def.h` 需要同时适配：

- `annotated_C/src/xizi/<case>`；
- `annotated_C/gen/xizi/<case>`。

不能只在源目录下凭直觉判断 include 是否正确。`init` 在 QCIP 输出中仍保留了其已有 include 写法，本轮没有为了表面一致性做无关机械改动；后续若要统一，应单独审计构建路径。

### 10.4 QCIP 与 CRTOS 的策略库不完全相同

`empty` 的证明暴露了一个典型问题：QCIP 环境中可用的空间项重排策略，在 CRTOS 环境中不一定存在。QCIP worker 使用的某个重排 tactic 在 CRTOS 中无法直接调用。

最终做法是在：

```text
crtosverify/lib/xizi_single_link_lib.v
```

中增加一个经过证明、带后缀名区分的辅助引理，用来处理反向排列的空间项，再在 manual proof 中调用。原则是：

- 先证明通用的逻辑变换；
- 不用 `Axiom` 绕过；
- 命名避免覆盖原有库引理；
- 只有确实为当前题和后续题复用所需时才修改公共库。

### 10.5 临时诊断不得留在最终证明中

为检查未关闭目标，可以临时插入 `Show.` 并通过 Makefile 获取 proof state。定位到剩余命题是 `cons ... <> nil` 后，使用 `discriminate` 关闭，并从最终文件删除 `Show.`。

### 10.6 构建产物清理要精确

本轮构建产生的 `annotated_C/dep` 和 `annotated_C/gen` 等目录属于生成物。清理时只能删除本轮明确生成的准确路径，不能在有用户改动的仓库里做宽泛清理。

## 11. 新旧规约迁移的总体收益

本轮迁移不是只把谓词名字替换掉，而是改变公开 API 的抽象边界。

迁移前常见问题：

- 把内部 `node_next` 指针作为 `With` 参数暴露；
- 直接描述字段具体值，调用者需要知道实现布局；
- 哨兵头和数据结点的角色混淆；
- 循环不变量只跟踪游标，无法恢复原链；
- 后置条件描述“执行了某次写入”，但没有描述抽象序列如何变化。

迁移后形成的统一原则：

- 公开接口主要围绕抽象序列 `l`；
- 哨兵头接口使用 `xizi_sll_head`；
- 数据结点接口使用 `xizi_sll`；
- 内部指针通过谓词封装或后置 `exists` 暴露；
- 变更型操作使用 `cons`、`app` 精确描述序列变化；
- 只读操作完整返回原链表所有权；
- 循环通过 `xizi_sllseg * xizi_sll` 保存整条链的所有权。

## 12. 易错点与检查清单

### 12.1 写规约前

- 参数是哨兵头还是数据结点？
- 空表如何表示？
- 抽象序列是否包含哨兵头？
- 函数读字段、写字段，还是二者都有？
- 新结点是否可能与原链重叠，所有权是否排除了重叠？

### 12.2 选择 ghost 变量时

- 该值是否是调用者真正知道并需要跨调用保存的抽象状态？若是，可用 `With`。
- 该值是否只是实现内部指针或返回后才确定的见证？若是，优先 `exists`。
- 是否只是需要一个任意旧值来证明字段可写？若是，考虑 `undef_data_at`，不要用 `With _`。

### 12.3 写循环不变量时

- 是否有原序列与前缀、当前结点、后缀的等式？
- 是否有对应的空间分解？
- 是否保留原始头指针和新结点所有权？
- 是否保留整数范围和计数关系？
- 是否能同时覆盖零次循环、一次循环和多次循环？

### 12.4 验证时

- symexec 是否真的生成了新的 goal？
- manual proof 是否匹配新 goal digest？
- 检查的是实际 `<case>_goal_check.v`，还是错误推断出的 `source_goal`？
- 是否存在 `Admitted`、`Abort`、新增顶层 `Axiom`？
- QCIP 和 CRTOS 是否都独立重放？
- CRTOS 是否通过 Makefile，而不是临时命令？

### 12.5 提交时

- 只暂存当前 case 和确有必要的公共库修改；
- 先检查 scoped `git diff` 和 scoped `git status`；
- 不覆盖、回退或清理其他用户改动；
- 本地 commit、远端 push、验证通过是三个不同状态，报告时要明确区分。

## 13. 后续工作的建议顺序

继续迁移 `xizi_single_link_remove_node` 等复杂操作时，建议按以下顺序：

1. 先明确参数是哨兵头、待删除数据结点，还是前驱结点；
2. 从 C 主体推导真实序列变换，不根据函数名猜测；
3. 用 `xizi_sll_head` 写公开规约；
4. 将删除位置表示成 `prefix ++ [target] ++ suffix`；
5. 用链表段保存查找过程中的前缀；
6. 明确删除后目标结点字段所有权是返回给调用者、保持原值，还是被重置；
7. 先在 QCIP 生成并固定检查真实 goal，再同步 CRTOS；
8. 若需新增库引理，先证明其通用性和空间项顺序，再提交。

## 14. 最值得复用的结论

1. **先辨认物理角色，再选逻辑谓词。** 哨兵头用 `xizi_sll_head`，数据链用 `xizi_sll`。
2. **公开规约应面向抽象序列。** 内部首指针和后继指针不应无理由变成调用者的 `With` 参数。
3. **写权限来自所有权，不来自指针非空。** 初始化未知字段应使用 `undef_data_at`，`emp` 不能授权写内存。
4. **循环证明的核心是完整分解。** `前缀段 * 剩余链` 配合序列拼接等式，才能在循环后恢复整体。
5. **LOS 提供的是设计范式，不是可机械复制的答案。** 必须结合 Xizi 的哨兵头布局和实际 C 操作调整。
6. **生成成功不等于证明完成。** 必须检查 manual 与新 goal 的对应关系，并重放真实 goal-check。
7. **QCIP 通过不等于 CRTOS 通过。** 两边的策略、目录和构建方式存在差异，必须分别验证。
8. **验证证据要准确表述。** 控制器失败、固定目标检查通过、本地提交和远端推送不能混为一谈。

