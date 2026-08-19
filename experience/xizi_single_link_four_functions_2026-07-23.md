# Xizi 单链表四个函数验证经验总结（2026-07-23）

## 1. 本轮目标与最终状态

本轮围绕以下四个函数整理并验证了一套统一的高层单链表规格：

1. `xizi_single_link_init`
2. `xizi_single_link_append`
3. `xizi_single_link_insert_after`
4. `xizi_single_link_len`

设计时参考了 LOS 链表的资源描述方式，同时保留 Xizi 自身“哨兵头结点 +
数据结点地址序列”的高层抽象。最终版本已经同步到：

```text
/home/yangfp/QCIP/crtosverify
```

对应分支和提交为：

```text
branch: single_linklist
commit: 6ee6a5870f7c2a5980e57828725efef2dd0d8446
```

提交标题：

```text
Use node predicate for init and restore generated auto proofs
```

推送后，本地 `HEAD` 与 `origin/single_linklist` 指向同一提交，工作区干净。

本轮最终约定是：

- `*_goal.v` 由符号执行生成，不手写改变其逻辑结构；
- `*_proof_manual.v` 保存人工完成的 manual witness；
- `*_proof_auto.v` 保持生成器原貌，其中的自动 witness 使用
  `Proof. Admitted.`，不在该文件中手工补证明；
- 因此“`goal_check` 可以编译”与“整个 case 不含 `Admitted`”是两个不同结论，
  后续汇报时必须明确区分。

## 2. 最终公共定义

### 2.1 数据链 `xizi_sll`

`xizi_sll(p, l)` 表示从数据结点指针 `p` 开始的一条完整单链表，抽象序列
为 `l`。序列中保存的是数据结点地址。

核心语义是：

```text
l = nil:
  p = NULL，并且不占有任何结点

l = node :: rest:
  p = node
  p != NULL
  拥有 p->node_next
  从 p->node_next 开始继续满足 rest
```

当前 generic 定义明确要求每个非空数据结点地址非空：

```coq
Fixpoint generic_sll
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (x: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = NULL ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      EX z: addr,
        storeA x z a **
        generic_sll storeA z l0
  end.
```

这一要求是合理的。非空逻辑序列对应真实数据结点，而 C 中的空链终止标志是
`NULL`，所以非空结点不能为 `NULL`。把这个事实放进通用链表谓词后：

- 每次展开非空链表都自动得到当前结点可解引用；
- 循环证明不必反复从其他条件补 `node != 0`；
- `NULL` 只对应空后缀，抽象语义更清楚；
- 规格不会允许“序列非空但首地址为 NULL”的伪链表模型。

### 2.2 链表段 `xizi_sllseg`

`xizi_sllseg(x, y, l)` 表示从 `x` 开始、到边界 `y` 之前结束的链表段，
其数据结点地址序列为 `l`。

它主要用于循环不变量，把链表拆成：

```text
已遍历前缀 * 尚未遍历后缀
```

例如 `len` 中：

```text
xizi_sllseg(first, tmp_list, l1) *
xizi_sll(tmp_list, l2)
```

表示 `l1` 已遍历，`l2` 尚未遍历，而 `l = l1 ++ l2`。

### 2.3 哨兵头 `xizi_sll_head`

当前定义为：

```coq
Definition generic_sll_head
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (store_head: addr -> addr -> Assertion)
  (head: addr)
  (l: list A): Assertion :=
  “ head <> NULL ” &&
  EX first: addr,
    store_head head first **
    generic_sll storeA first l.
```

Xizi 实例为：

```coq
Definition xizi_sll_head : addr -> list addr -> Assertion :=
  generic_sll_head xizi_addr_node_store xizi_head_store.
```

自然语言解释：

> `head` 是一个非空、可用的链表锚点；拥有它的 `node_next` 字段；该字段
> 指向一条抽象数据序列为 `l` 的单链表。`head` 自身不属于 `l`。

“头结点”在这里首先是一种结构角色，而不必理解成唯一的全局哨兵。对
`insert_after(anchor, new_node)` 而言，只要调用者能把 `anchor` 及其后继链
包装成 `xizi_sll_head(anchor, l)`，就可以把任意合法锚点当作局部头结点使用。
这同时保留了高抽象和调用点适配能力。

### 2.4 独立可写结点 `xizi_sll_node`

最终定义为：

```coq
Definition xizi_sll_node (node: addr): Assertion :=
  “ node <> NULL ” &&
  &(node # xizi_struct_name ->ₛ xizi_next_field) # Ptr |->_.
```

自然语言解释：

> `node` 不是空指针，并且当前拥有 `node->node_next` 这个指针字段；字段
> 中旧值是什么不重要，但调用者持有足够资源，可以读取或覆盖该字段。

`xizi_sll_node` 刻意不描述该结点后面已经挂着一条什么链，也不要求旧
`node_next` 等于某个 ghost 参数。它表示的是“一个独立、可写、尚待接入目标
链表的结点”。

如果只写：

```coq
“ node <> NULL ”
```

而不写：

```coq
&(node # ... ->ₛ "node_next") # Ptr |->_
```

则只能证明指针数值非空，不能证明拥有 `node_next` 字段。C 语句：

```c
node->node_next = ...;
```

将缺少写权限；同时也无法通过分离合取证明该结点与原链表占用的结点互不
重叠。

## 3. `has_permission`、`undef_data_at` 和 `xizi_sll_node`

### 3.1 `has_permission`

当旧值不重要、只关心某个位置可访问或可写时，源级 annotation 应优先使用：

```c
has_permission(&(node->node_next))
```

它表达“持有这个字段的权限”，不会把调用者限制为“该字段从未初始化”。
这与 QCP 新例子中保存临时变量或新结点字段权限的写法一致。

在循环不变量中，`append` 使用：

```c
has_permission(&(linklist_node -> node_next))
```

是为了在遍历原链表期间持续保留新结点字段的所有权，直到循环结束后执行：

```c
linklist_node->node_next = (void *)0;
```

### 3.2 `undef_data_at`

`undef_data_at` 更强调该内存位置处于未定义或尚未初始化的状态。LOS 的若干
初始化函数使用它是合理的，因为这些接口明确接收待初始化对象。

但对于 Xizi 的 `append` 和 `insert_after`，新结点的 `node_next` 可能原先
已经保存某个值，只是函数会覆盖它。若要求 `undef_data_at`，规格会不必要地
排除“字段已经初始化但允许覆盖”的调用点。

因此本轮统一原则是：

```text
旧值不关心，只需要覆盖权限       -> has_permission
公共规格需要非空结点 + 字段资源   -> xizi_sll_node
确实要求未初始化存储              -> undef_data_at
```

### 3.3 为什么公共规格使用 `xizi_sll_node`

直接在每个规格里重复：

```c
linklist_node != 0 &&
has_permission(&(linklist_node->node_next))
```

虽然可行，但抽象层次较低。封装成：

```c
xizi_sll_node(linklist_node)
```

有以下好处：

- 统一“非空 + 字段资源”的含义；
- `append`、`insert_after` 和 `init` 使用相同结点接口；
- 调用点只需要建立一个稳定的公共谓词；
- 将结构字段名集中在 common lib 中；
- 以后改变结点布局时，公开函数规格不必逐个展开修改。

## 4. `*` 与 `&&` 的使用原则

在规格中：

```c
xizi_sll_head(linklist, l) *
xizi_sll_node(linklist_node)
```

这里必须使用分离合取 `*`，因为它表达两个独立堆资源：

1. 原链表及其头字段；
2. 待插入结点的 `node_next` 字段。

分离合取还带来关键的“不重叠”语义：新结点字段不能已经被原链表谓词占用。
这排除了把链内已有结点再次 append/insert 而制造环或重复所有权的情况。

`&&` 更适合连接纯事实，或者把纯事实附加到某个空间断言，例如：

```c
node != 0 &&
length == Zlength(l1) &&
...
```

经验规则：

```text
两个需要分别拥有的内存块       -> *
地址相等、非空、长度关系等纯事实 -> &&
```

不能因为表面上都是“并且”就互换二者。`*` 不只是逻辑 conjunction，它还
描述堆的拆分与资源互斥。

## 5. 四个函数的最终规格

### 5.1 `xizi_single_link_init`

```c
void xizi_single_link_init(SysSingleLinklistType *linklist)
/*@ Require
      xizi_sll_node(linklist)
    Ensure
      xizi_sll_head(linklist, nil)
*/
{
    linklist->node_next = (void *)0;
}
```

规格的自然语言含义：

> 调用前，`linklist` 是一个非空且拥有 `node_next` 字段的独立结点；
> 函数把该字段写成 `NULL`；调用后，它成为表示空数据序列的链表头。

相比早期规格：

```c
linklist != 0 &&
undef_data_at(&(linklist->node_next), SysSingleLinklistType *)
```

新规格更抽象，也能统一复用公共结点谓词。`linklist != 0` 不必重复，因为
`xizi_sll_node` 已包含非空事实。

符号执行会生成一个 partial-solve witness，用来从 `xizi_sll_node` 展开得到：

```text
linklist != 0
拥有 linklist->node_next
```

这正好满足字段写入的安全条件。

### 5.2 `xizi_single_link_append`

```c
void xizi_single_link_append(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(
        linklist,
        app(l, cons(linklist_node, nil)))
*/
```

自然语言含义：

> 调用前，`linklist` 表示数据序列 `l`，并另外拥有一个独立可写结点
> `linklist_node`；调用后，原序列末尾追加该结点。

不再需要：

```c
linklist != 0
linklist_node != 0
old_next
linklist_node->node_next == old_next
```

原因分别是：

- `xizi_sll_head` 已包含 `linklist != 0`；
- `xizi_sll_node` 已包含 `linklist_node != 0`；
- C 实现不读取新结点的旧 `node_next`；
- 旧值只需“任意但可写”，不值得暴露为 ghost 参数。

循环不变量的关键分解是：

```c
cons(linklist, l) == app(l1a, cons(node, l1b))
```

以及：

```c
xizi_sllseg(linklist, node, l1a) *
xizi_sll(next, l1b)
```

循环从物理哨兵头 `linklist` 开始，所以内部遍历视图暂时使用
`cons(linklist, l)`；但公开抽象仍只把数据结点放进 `l`。内部物理视图不应
泄漏到函数后置条件。

不变量还必须保存：

```c
has_permission(&(linklist_node->node_next))
```

否则遍历原链表时可能丢失新结点字段资源，循环退出后无法合法把它写为
`NULL`。

### 5.3 `xizi_single_link_insert_after`

```c
void xizi_single_link_insert_after(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(linklist, cons(linklist_node, l))
*/
```

C 实现：

```c
linklist_node->node_next = linklist->node_next;
linklist->node_next = linklist_node;
```

自然语言含义：

> 把新结点插入锚点 `linklist` 之后；若锚点后原有序列为 `l`，操作后序列
> 为 `linklist_node :: l`。

`linklist` 不一定非要是整个容器唯一的哨兵头。关键是具体调用点能否提供：

```c
xizi_sll_head(linklist, l)
```

也就是说，调用者可以把任意合法锚点及其后继链作为一个“局部头 + 后缀”
视图传入。这个理解比把规格限定为“只能在全局哨兵头之后插入”更通用，同时
仍然完整匹配两次字段写入。

新结点必须与后继链分离，所以前置条件使用：

```c
xizi_sll_head(...) * xizi_sll_node(...)
```

不能只给两个非空条件。

### 5.4 `xizi_single_link_len`

```c
unsigned int xizi_single_link_len(
    const SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return == Zlength(l) &&
      xizi_sll_head(linklist, l)
*/
```

自然语言含义：

> 函数只读遍历头结点后的数据链，返回抽象序列 `l` 的长度，并归还完整、
> 未改变的链表资源。

公开规格不需要额外写：

```c
Zlength(l) <= UINT_MAX
```

当前证明通过链表占用的有效、对齐内存推导链长上界。common lib 中：

```coq
Lemma xizi_sll_length: forall x l,
  xizi_sll x l |-- store_align4_n (Zlength l).

Lemma xizi_sll_length_max: forall x l,
  xizi_sll x l |--
  “ Zlength l <= Int.max_unsigned / 4 + 1 ”.
```

循环步证明再利用整条链的分解和该上界，证明本次：

```text
length + 1
```

不会发生 32 位无符号回绕，从而可以使用：

```coq
unsigned_last_nbits_eq
```

把 C 无符号运算恢复为数学整数加一。这样，上界是从空间模型推导出的内部
证明事实，而不是强迫调用者在公开规格中重复提供。

`len` 的循环不变量采用标准前后缀分解：

```c
exists first l1 l2,
  l == app(l1, l2) &&
  length == Zlength(l1) &&
  linklist -> node_next == first &&
  xizi_sllseg(first, tmp_list, l1) *
  xizi_sll(tmp_list, l2)
```

其中：

- `l1` 是已遍历前缀；
- `l2` 是剩余后缀；
- `length` 始终等于 `l1` 的长度；
- `first` 保存头结点原始首指针，用于结束时重新拼回
  `xizi_sll_head(linklist, l)`。

## 6. LOS 参考方式

LOS 链表示例的主要价值不是复制某个同名谓词，而是学习资源建模原则：

1. 写字段必须在前置条件中拥有字段资源；
2. 初始化接口可以使用 `undef_data_at` 描述待初始化字段；
3. 多个独立字段或结构资源使用分离合取；
4. 公共规格描述容器抽象，具体前驱、后继和遍历切分留给不变量；
5. 不关心的旧值不应强行引入 `With old_next`。

但不能机械照搬 LOS：

- LOS 的部分链表是双向、循环或不同哨兵布局；
- Xizi 是单向链表，抽象序列保存结点地址；
- Xizi 的 `xizi_sll_head` 明确区分锚点与数据序列；
- `append`/`insert_after` 接收的独立结点可能已初始化，因此比
  `undef_data_at` 更适合使用“任意旧值但有权限”的抽象。

正确方法是参考 LOS 的所有权思路，再按 Xizi 的实际 C 调用关系建立谓词。

## 7. 调用点匹配检查

高层谓词是否合理，最终要看调用点能否建立前置条件。

### 7.1 `xizi_sll_node(new_node)` 的建立

调用者需要证明：

```text
new_node != NULL
拥有 new_node->node_next
```

它不要求旧后继为 `NULL`。因此，下列对象都可能作为新结点传入：

- 刚分配、字段值未知但有写权限的结点；
- 已初始化、允许覆盖 `node_next` 的结点；
- 从某个独立资源中拆出的单结点。

但不能把仍属于原链表的结点直接作为新结点传入，因为：

```text
xizi_sll_head(original, l) * xizi_sll_node(new_node)
```

要求两部分资源分离。

### 7.2 `insert_after` 的锚点

调用点不需要证明参数是某个全局哨兵变量，只需把锚点字段和后继链折叠成：

```text
xizi_sll_head(anchor, suffix)
```

若调用点当前持有的是整条 `xizi_sll`，可以通过展开当前结点、拆出
`node_next` 字段与后继链，再建立局部 `xizi_sll_head` 视图。是否需要额外
helper lemma，应以真实调用点产生的 VC 为准。

## 8. symbolic execution 与 Rocq 文件边界

### 8.1 先固定规格，再生成 VC

最有效的顺序是：

1. 先根据 C 语义和调用点写出公开规格；
2. 用户确认规格；
3. 修改 common lib 中必要的谓词；
4. 运行 symbolic execution；
5. 观察生成的 safety、partial-solve、entail、return witnesses；
6. 只证明实际生成的 manual witnesses。

如果规格还在变化时就开始大量证明，会不断使旧 VC 和旧 proof 失效。

### 8.2 生成器会覆盖 `proof_auto.v`

在 `crtosverify` 中重新运行生成规则时，生成器会把 `*_proof_auto.v` 恢复为：

```coq
Proof. Admitted.
```

本轮最初曾把 auto witnesses 手工证明，之后根据最终约定全部恢复为
`Admitted`。需要牢记：

- 若项目要求 auto 文件保持生成结果，不应在其中维护人工证明；
- 重新符号执行后必须检查 Git diff，确认没有意外覆盖 manual 文件；
- 生成器通常提示 manual proof 文件已存在，因此不会覆盖它；
- `goal_check` 在存在 `Admitted` 时仍然能通过 Coq 编译。

因此报告应写：

```text
四个 goal_check 编译通过；proof_auto 按约定保留 Admitted。
```

不能写成：

```text
四个函数已经无公理、无 Admitted 地全部证明完成。
```

### 8.3 generated goal 不宜手工长期维护

规格变化后，safety witness 的参数和资源会变化。例如 `init` 从显式
`linklist != 0 + undef_data_at` 改成 `xizi_sll_node` 后，生成器增加了
partial-solve witness。正确做法是重新运行 symbolic execution，让生成器
决定 witness 结构，而不是只手工猜测修改 `*_goal.v`。

## 9. `crtosverify` 构建与同步经验

### 9.1 Makefile 的前置目录

直接执行某个 `goal_check.vo` 时，如果以下目录不存在：

```text
annotated_C/dep/xizi/<case>/
annotated_C/gen/xizi/<case>/
```

依赖生成会报错：

```text
fatal error: opening dependency file ... No such file or directory
```

应先创建精确的 case 目录，再准备公共生成文件：

```bash
make annotated_C/gen/xizi_single_link_def.h
make annotated_C/gen/xizi_single_link.strategies
```

然后执行目标：

```bash
make \
  VC/code_proof/xizi/xizi_single_link_init/\
xizi_single_link_init_goal_check.vo \
  -j1
```

构建结束后，若 `annotated_C/dep` 和 `annotated_C/gen` 是本次创建的临时目录，
应删除它们，避免把生成缓存误提交。

### 9.2 每次生成后检查四类变化

至少执行：

```bash
git status --short
git diff --check
git diff
```

重点确认：

1. C 规格是否是确认后的版本；
2. generated goal 是否与新规格对应；
3. `proof_auto.v` 是否符合当前项目约定；
4. `proof_manual.v` 是否没有被覆盖。

生成器可能留下行尾空格或 EOF 空行。提交前应清理，使
`git diff --check` 无输出。

### 9.3 推送确认

不能只看到 `git push` 命令启动就声称已推送。远端响应可能较慢，本轮一次
push 约等待两分钟才返回。必须看到：

```text
single_linklist -> single_linklist
```

之后再比较：

```bash
git rev-parse HEAD
git rev-parse origin/single_linklist
git status --short
```

只有 commit id 相同且工作区干净，才能汇报“本地与远端一致”。

任何账号或密码都不应写入经验文档、源码、Git remote URL、shell 脚本或提交
记录。

## 10. 本轮走过的弯路

### 10.1 过早开始证明

在规格仍未确认时就修改 VC，会导致规格调整后重复生成和重复证明。尤其
`append`、`insert_after` 的资源接口从具体字段条件改成 `xizi_sll_node`
后，旧 witness 结构立即失效。

改进：

```text
先打印并确认 spec -> 再验证 -> 最后同步
```

### 10.2 把不关心的旧值显式命名

早期规格使用 `With old_next` 和：

```c
linklist_node->node_next == old_next
```

但实现从不读取这个旧值，只会覆盖它。这既增加调用点 ghost 参数，又降低
规格抽象度。

改进：

```text
旧值不读取 -> 不命名旧值 -> 只保留字段权限
```

### 10.3 重复写非空条件

以下条件在新定义中都是冗余的：

```text
xizi_sll_head(linklist, l)  已推出 linklist != 0
xizi_sll_node(node)         已推出 node != 0
```

公共规格应避免重复，以免使用者误以为这些纯条件承担了额外资源语义。

### 10.4 混淆 `*` 和 `&&`

原链表与新结点是两份必须分离的堆资源，必须用 `*`。若只用普通 conjunction
或只写纯非空事实，无法表达新结点不在原链表中，也无法稳定完成字段写入。

### 10.5 把 auto 编译通过当作完整证明

`Admitted` 不妨碍 Coq 文件编译。用户要求 auto 文件保留生成器输出时，
`goal_check` 通过只能作为“文件组合与接口一致”的证据，不能作为“所有逻辑
义务均已闭合”的证据。

## 11. 后续单链表函数的推荐模板

### 11.1 覆盖初始化一个结点

```c
/*@ Require
      xizi_sll_node(node)
    Ensure
      ...
*/
```

### 11.2 把独立结点接入已有链表

```c
/*@ With l
    Require
      xizi_sll_head(anchor, l) *
      xizi_sll_node(new_node)
    Ensure
      ...
*/
```

### 11.3 只读遍历并保持链表

```c
/*@ With l
    Require
      xizi_sll_head(head, l)
    Ensure
      result_relation &&
      xizi_sll_head(head, l)
*/
```

### 11.4 循环遍历

优先考虑：

```text
原序列 = 已遍历前缀 ++ 剩余后缀
已遍历部分使用 xizi_sllseg
剩余部分使用 xizi_sll
计数器或返回候选与前缀建立纯关系
保存头字段的原始 first，以便退出时折叠回 xizi_sll_head
```

### 11.5 规格审查清单

每个新函数开始验证前检查：

- 参数究竟是全局哨兵、局部锚点还是数据结点？
- 函数读取旧字段值，还是只覆盖它？
- 每个被读写字段的所有权来自哪里？
- 新结点是否需要与原结构分离？
- 非空事实是否已被抽象谓词包含？
- 是否错误地把内部指针暴露成 `With`？
- 循环退出后能否重新折叠公开谓词？
- 长度或算术边界能否从空间模型推导，而不是放进公开前置条件？
- symbolic execution 是否已重新生成到文件尾？
- auto/manual 文件是否符合目标仓库的约定？
- “可编译”和“无 Admitted 完整证明”是否在报告中明确区分？

## 12. 最核心的结论

这四个函数最终形成了一套一致接口：

```text
xizi_sll_head  描述锚点及其后继数据链
xizi_sll       描述完整数据链
xizi_sllseg    描述遍历前缀
xizi_sll_node  描述独立、非空、字段可写的结点
```

公开规格只描述调用者真正需要知道的抽象变化：

```text
init:         node              -> empty head
append:       l * node          -> l ++ [node]
insert_after: l * node          -> node :: l
len:          l                 -> return length(l), preserve l
```

实现内部需要的旧指针值、遍历切分、当前结点和算术上界，都留在不变量、
生成 witness 或 Rocq helper 中处理。这样既贴近 LOS 的资源建模原则，又保持
了 Xizi 单链表接口所需的高抽象和调用点可复用性。
