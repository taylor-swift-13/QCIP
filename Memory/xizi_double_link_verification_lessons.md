# xizi 双链表验证返工经验

## 背景与结论

本轮返工源于一个根本性规格错误：若函数规格只描述当前语句直接读写的
`node_next`、`node_prev` 字段，而没有用递归分离逻辑谓词描述整条链表，Rocq
证明即使能够通过，也只说明几块孤立内存满足字段等式，不能说明输入和输出是
结构完整、节点互不重叠、前后指针一致的双链表。

因此，“VC 已证明”不等于“程序功能已验证”。验证结论首先取决于规格是否覆盖
用户真正关心的数据结构语义，其次才取决于 proof script 是否通过。

旧交付物已整体归档到：

```text
archieve/xizi_double_link_invalid_20260714/OUTPUT/xizi/
```

归档目录只用于审计，不作为新 run 的规格、证明或 acceptance evidence。

## 旧规格的主要问题

### 1. 字段等式代替了数据结构谓词

旧版 `empty`、`head`、`init`、`insert_after`、`insert_before`、`len`、`next`、
`remove_node` 主要使用如下形式：

```c
linklist -> node_next == first &&
linklist -> node_prev == last
```

这种条件只拥有或约束两个字段，没有表达：

- 首尾之间还有多少节点；
- 各节点是否互不重叠；
- `next` 链和 `prev` 链是否互相一致；
- 尾节点是否正确回到哨兵；
- 函数执行后未修改的链表部分是否仍然存在；
- 抽象节点序列是否保持、插入或删除了正确元素。

### 2. 规格被具体实现路径过度弱化

典型问题是旧版 `len` 直接假设 `linklist->node_next == linklist`，于是只证明了
空表返回 0，完全没有验证循环遍历非空双链表的行为。这样的规格可以显著减少
VC，却同时删除了函数最重要的功能要求。

### 3. “无 Admitted 且能编译”被误当作充分条件

`Admitted.`、额外 `Axiom` 和编译失败当然必须拒绝，但这些只是 proof integrity
检查，不是 spec quality 检查。若前置条件过强或后置条件过弱，完整的 `Qed.`
仍可能证明错误问题。

## 严格参照单链表示例时应当参照什么

不能只模仿单链表 proof tactic；首先要模仿其规格结构。

### 1. 完整表谓词

单链表例子使用 `xizi_sll(first, l)` 描述从首节点开始的全部空间。双链表应使用
对应的完整环形双链表谓词，至少同时覆盖：

- 哨兵节点的 `next` 与 `prev` 字段；
- 从首节点到尾节点的所有数据节点；
- 每个数据节点的前驱、后继字段；
- 首节点前驱为哨兵、尾节点后继为哨兵；
- 抽象节点序列与物理节点次序一致。

### 2. 段谓词

单链表循环使用 `xizi_sllseg` 把已遍历前缀和未遍历后缀分开。双链表循环也应
采用双向 segment 谓词，使循环不变式同时记录段首外部前驱、段尾外部后继以及
抽象序列分解。不能在循环不变式里退化为若干裸字段等式。

### 3. frame 必须显式保留

读取函数的前后条件都应保留完整链表谓词。修改函数应把受影响的局部节点从
谓词中展开，完成字段更新后再折叠为新的完整谓词；未修改部分通过分离合取作为
frame 保留。

### 4. 抽象序列必须表达功能变化

- `empty`：返回值与抽象序列是否为 `nil` 对应，链表谓词保持不变。
- `head`：空表返回 `NULL`；非空表返回抽象序列首节点，链表保持不变。
- `init`：输出为空表谓词。
- `len`：返回 `Zlength(l)`，并保持同一抽象序列与空间谓词。
- `insert_after` / `insert_before`：抽象序列在指定位置插入节点。
- `next`：根据抽象位置返回后继或 `NULL`，完整结构保持不变。
- `remove_node`：抽象序列删除目标节点，目标节点成为独立的空环或满足明确的
  节点后置谓词，其余链表重新闭合。

## 双链表谓词设计要点

### 哨兵所有权

环形双链表的空表也不是 `emp`。空表仍拥有哨兵节点的两个字段，且二者都指向
哨兵自身。因此空表基例必须保留哨兵字段资源。

### 双向一致性

递归步不能只沿 `next` 存储后继；还必须表达当前节点的 `prev` 是上一节点，并
确保递归后缀使用当前节点作为外部前驱。否则谓词实际上仍是“附带无关 prev
字段的单链表”。

### 地址序列与数据序列

当前 xizi API 操作的核心对象是节点地址，抽象 `list addr` 可以直接表达节点
顺序。如果未来节点含业务数据，应明确区分“地址序列”和“数据序列”，避免在
插入、删除证明中混用。

### 局部展开与重新折叠

对插入、删除函数，推荐的证明结构是：

1. 从完整谓词或段谓词展开目标节点及相邻节点；
2. 获得四个相关链接字段的独占所有权；
3. 执行 C 字段更新对应的分离逻辑 store 推理；
4. 证明新的前后链接一致；
5. 按新的抽象序列重新折叠段谓词和完整表谓词。

若规格一开始只给裸字段，步骤 1 和步骤 5 都消失了，这正是旧证明失去数据结构
语义的原因。

## 工作流经验

### 1. 错误交付必须先隔离

发现上游规格根本错误后，不能在旧 proof 上做局部修补。旧 generated files、
manual proof 和 common lib 应整体归档；新 run 从原始 C 输入和明确的问题语义
重新开始。旧文件只能作为反例审计，不能作为当前 source version 的证据。

### 2. annotation acceptance 必须先于 proof search

正确顺序是：

1. 设计并检查分离逻辑谓词；
2. 在 C 合同和循环不变式中使用谓词；
3. 跑 canonical symbolic execution；
4. 检查生成的 witness 是否仍然对应完整数据结构语义；
5. 才进入 VC 分组和 Rocq proof。

先看旧 proof 怎样容易通过，再反推规格，会诱导规格继续弱化。

### 3. 每个 case 都需要独立版本绑定

`source_version` 至少绑定 annotated C 和 annotation-approved `case_lib` seed；
`source_goal_version` 绑定 generated files、目标 witness 及其 statement。任何谓词、
annotation 或 witness statement 变化都必须使下游 VC 计划和证明 stale。

### 4. generated 文件不能手工迁就 proof

`*_goal.v`、`*_proof_auto.v`、`*_goal_check.v` 只能由 symbolic execution 刷新。
`*_proof_manual.v` 只能填写 witness proof body，不能修改 statement、加入 helper
definition 或保留 `Admitted.`。需要的 proved helper 必须进入当前 case 的
`case_lib`，并满足 group suffix 与 parent merge 合同。

### 5. 编译检查必须覆盖最终 check 文件

单独编译 helper lib 或 manual 文件不足以证明组合正确。group-worker 先运行
`group-check`，parent verify 合并后运行 full fixed check，final-check 再对最终
`*_goal_check.v` 运行 canonical fixed `coqc_check`。

## 防回归检查表

在接受链表类 annotation 前逐项检查：

- [ ] 前置条件包含完整递归分离逻辑谓词，而非只有字段等式。
- [ ] 后置条件保留或构造完整递归分离逻辑谓词。
- [ ] 空表基例仍拥有哨兵或表头字段资源。
- [ ] 双链表谓词同时约束 `next` 与 `prev`。
- [ ] 前向和后向链接在每个递归步一致。
- [ ] 循环不变式以 segment + suffix 表达遍历分解。
- [ ] 抽象序列表达长度、首节点、插入或删除的功能变化。
- [ ] 读取函数明确 frame 完整输入结构。
- [ ] 修改函数只展开必要局部资源，并能重新折叠完整谓词。
- [ ] spec 没有通过“只允许空表”等方式删除主要执行路径。
- [ ] generated manual witness 与 annotation 的抽象语义一致。
- [ ] manual 和 `case_lib` 无 `Admitted.`、额外 `Axiom`、forbidden lemma。
- [ ] final `*_goal_check.v` 通过 fixed `coqc_check`。
- [ ] freshness 检查确认生成文件与最终 annotation 一致。

## 本轮验证记录

本节随各 case 的 controller 结果持续更新，全部完成后再形成总表。

### 已完成：`xizi_double_link_init`

- run：`xizi_double_link_init-20260714180003`；最终状态 `done`。
- 规格：前置拥有哨兵的两个待写字段；后置为 `xizi_dll_empty`，同时拥有
  `node_next`、`node_prev` 并约束二者回指哨兵。
- witness：1 个，group `return_empty_predicate`；不需要 helper，manual proof 为
  `pre_process.`。
- canonical symexec 到文件尾；parent full fixed check 与 final fixed check 均通过。
- 交付已归档到 `doc/xizi_double_link_init/`，controller 机器证据保存在其
  `reports/controller/` 下。

### 已完成：`xizi_double_link_empty`

- run：`xizi_double_link_empty-20260714180001`；source-goal-version
  `8a3e5c83f0db2fceff3c9ccecb93b2ed6a076e35b57d04b028d39d7ff58414b7`。
- 首轮规格虽然使用了空间谓词，却在函数前后使用了不同 logical head，导致返回
  VC 缺少“当前参数就是前态哨兵”的身份关系；VC checking 正确将其退回 annotation。
- 修正后 3 个 witness 全部通过；使用后缀 helper
  `xizi_dll_front_empty_iff__dll_empty_classification` 刻画完整 DLL 空序列与
  sentinel 前端关系。
- group-check、parent full check 和 final fixed check 均通过；交付归档在
  `doc/xizi_double_link_empty/`。

### 已发现的流程性风险：group-check 必须真正重编译修改后的 `case_lib`

`xizi_double_link_insert_after` 的 group report 曾显示 group-check 通过，但 parent
verify 在合并后的 helper 第 65 行报 `Wrong bullet`。候选 helper 与 group worktree
文本一致，说明“group-check 通过”本身不足以排除 build workspace 复用了旧
`case_lib` 编译物。以后凡 group 新增 helper，除了检查 evidence 的 target kind 和
source-goal version，还必须确认依赖顺序确实重编译了修改后的 lib；parent full
check 始终是最终裁决，不能因 group report 为 passed 而跳过。

### 已发现的流程性风险：import 必须在 seed declaration 之前

`xizi_double_link_head_rec` 的 annotation seed 在使用字符串 notation 的 Fixpoint
之前没有导入 `Coq.Strings.String`、打开 `string_scope`。group-worker 可按合同增加
官方 import，并在 group-local 完整文件中放到开头后通过 group-check；但 parent 的
append-only merge 把该 import 放到 Fixpoint 之后，最终在第一个
`"SysDoubleLinklistNode"` 处失败。由 annotation spec declaration 自身需要的 import
必须在 annotation round 成为 seed 的一部分，不能留给 group helper 阶段补救。

### 已发现的流程性风险：从 group blocker 回退 annotation 的 controller 路径

`xizi_double_link_insert_before` 的 group-worker 找到 `old_prev <> NULL` 缺失后，
controller 正确拒绝 group report；但 `retry-round --phase annotation` 以 controller-owned
vc-proving attempt 为 previous attempt 时，因为该 attempt 没有 `report` 字段而对
`Path('.')` 调用 `with_name` 崩溃。修复 controller 前不得手改 handoff 或绕过版本链；
应保留 group counterexample、report 和 accepted annotation worktree，由 controller
修复后生成正式 retry round。

### 反例优先：段谓词的节点基址非空条件必须显式传递

`insert_before` 的非 singleton VC 允许 `prefix=[]`、`old_prev=first=NULL`，但后置
重建的 `xizi_dllseg` 把 `old_prev` 当作节点并要求其非空。字段地址的
`isvalidptr` 不能推出节点基址非空。涉及 prefix/last/predecessor 的规格必须逐一确认
非空事实是纯前提、谓词展开结论或可从结构不重叠推出；不能靠直觉交给 entailment。

## 新的源码边界：`INPUT` 必须无 QCP annotation

用户最终明确要求 `INPUT` 只保存干净 C。由此形成新的强制边界：

- `INPUT/xizi/...`：原始 C 与头文件，不出现 `/*@ ... */` 或 inline `where`；
- `Verification/xizi/<case>/`：由干净源码复制出的正式 annotation source；
- `SeparationLogic/examples/Verification/xizi/<case>/`：case lib 与生成/手写 Rocq 文件；
- `doc/<case>/source/`：同时保存干净源码和明确命名的 `*_annotated.c`，不能混淆。

controller 的 target C 必须绑定 `Verification` 副本。这样 final-candidate-apply 只会写回
验证副本和 formal 文件，不会重新污染 `INPUT`。

### 当前正式交付：`xizi_double_link_init-20260714130001`

较早的 `xizi_double_link_init-20260714180003` 使用 `INPUT` 作为 annotated source，现已
由新 run 取代。新 run 的完整结果如下：

- 干净输入：`INPUT/xizi/xizi_double_link_init/xizi_double_link_init.c`；
- annotation source：`Verification/xizi/xizi_double_link_init/xizi_double_link_init.c`；
- post predicate `xizi_dll_empty` 同时拥有 `next=head` 和 `prev=head`；
- annotation 完成三轮 qcp-mcp、三轮 symexec 和 annotation-checking；
- 唯一 witness `proof_of_xizi_double_link_init_return_wit_1` 直接展开谓词证明；
- 不需要 helper，group-check、parent full check、final fixed check 均通过；
- manual/case-lib 无 `Admitted`、额外 `Axiom`、forbidden lemma；
- 正式归档已更新到 `doc/xizi_double_link_init/`。
- 最终发布全集已同步到 `OUTPUT/xizi/xizi_double_link_init/`。

本轮按用户收敛后的范围只交付这一个简单双链表程序；其余旧双链表 proof 不再被当作
当前完成目标。

## `OUTPUT` 发布门

`Verification`/formal 写回与 `doc` 归档都不能替代最终 `OUTPUT` 发布。每个已完成 case 必须把 annotated 源码、无 annotation 输入快照、完整 Rocq/diagnostics、当前 accepted controller/group/final-check evidence、README 和经验总结同步到 `OUTPUT/<case>/`；同步后必须逐文件比对正式源，并运行发布源码语法检查。只有这些检查通过，才能向用户报告最终产物已经交付。
