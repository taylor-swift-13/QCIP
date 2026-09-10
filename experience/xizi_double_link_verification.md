# 双链表验证工程经验

## 目标与边界

- 当前先在 QCIP 中完成可扩展的双链表定义、规格和端到端验证。
- `crtosverify/lib/dll.v` 只作为设计参考；在 QCIP 结果确认前不修改或同步 crtos 仓库。
- 旧证明和旧公共库保存在 `archive/xizi_double_link_pre_dll_20260719/`，不得作为新证明的接受证据。

## 用户约束清单（持续维护）

1. `/home/yangfp/QCIP/INPUT` 是原始输入目录：不写 annotation，不做为了
   验证而产生的源码或头文件改写。
2. 带 annotation 的工作源码、公共定义、Rocq 证明和报告全部交付到
   `/home/yangfp/QCIP/OUTPUT`，目录格式与现有输出对齐。
3. 当前不修改 `crtosverify`；先在 QCIP 中完成并确认设计，再决定是否同步。
4. QCIP 定义参考 `crtosverify/lib/dll.v`，但对明显错误应在 QCIP 侧主动修正。
5. 最终双链表定义必须简洁、优雅，并以工程可扩展性为主要设计指标。
6. spec 必须保持工程接口简洁；无条件覆盖的旧字段值用 `_` 表达 ownership，
   不使用 `old_next`、`old_prev` 一类无意义的明确逻辑值。
7. 旧证明与旧库移动到 `archive`；新验证不得混用旧产物作为接受证据。
8. 重新验证 INPUT 中全部 12 个双链表程序，最终结果输出到 OUTPUT。
9. 工作中积累的详细经验和用户新增要求必须持续记录在 `experience`，不能只
   留在聊天上下文中。
10. 最终目标不是只完成公共定义或单个示例，而是完整验证全部双链表程序。
11. 每个 `OUTPUT/xizi/xizi_double_link_<case>/` 必须沿用现有交付格式：
    `source/` 放带 annotation 的 C/头文件，`rocq/` 放生成目标与完整证明，
    `reports/` 放编译、验证和复现证据；公共目录同样按 `source/`、`rocq/`、
    `reports/` 组织。
12. 不生成 `doc` 交付快照；`OUTPUT/xizi/` 是唯一稳定交付目录。controller 的
    详细 evidence 保留在仓库根目录 `reports/`，经验保留在 `experience/`。

## 2026-07-19：公共定义设计

1. C 中 `DoubleLinklistType` 是 typedef 名，真实 struct tag 是
   `SysDoubleLinklistNode`。`dll.v` 把字段寻址的 struct tag 硬编码为
   `DoubleLinklistType`，会迫使程序修改 ABI，且会使仍使用
   `struct SysDoubleLinklistNode *` 的函数失配。QCIP 实例必须使用真实 tag。
2. 公共定义拆成 `DLL_LAYOUT` 与 `AddrDLL(Layout)`：核心有限双链表段只依赖
   struct/next/prev 三个布局参数，xizi 通过 `XiziDoubleLinkLayout` 实例化。
   后续同构 intrusive list 可复用核心定义，无需复制递归谓词和证明。
3. `dllseg node prev stop last nodes` 的非空分支必须包含 `node <> stop`。
   旧定义缺少这个约束时，`node = stop` 既可能表示空段，也可能展开为绕环的
   非空段，导致 segment 端点语义不唯一，并让部分旧 strategy 实际不可证。
4. 逻辑内容选择 `list addr`，与这些无 payload 的 intrusive 节点程序匹配；
   不把虚构的数据字段或证明辅助状态塞进公开抽象。

## 规格设计原则

- 公开 spec 只暴露调用者需要的 ownership、抽象节点序列和必要返回关系。
- 对会无条件覆盖字段的函数，前置条件使用 QCP 当前支持的
  `undef_data_at(field, type)` 获取可写 ownership，不为旧值命名。其数学意图
  等同于 permission-only wildcard；当前前端不能解析 `store(field, _)`。
- 查询函数应保持同一个 `xizi_dll` 抽象不变；更新函数描述抽象序列的局部
  变化；循环和递归优先复用同一 `dllseg`，避免为每个实现创建特制谓词。
- struct tag、字段名只出现在布局实例和生成 strategy 中，不进入通用递归定义。

## 已验证证据

- 所有 12 个 INPUT case 的普通 C11 语法检查通过（修正逻辑布局名后）。
- QCIP 公共库、strategy goal 与 strategy proof 已通过固定
  `coq_tooling.py check`；完整依赖检查的 fixed flags hash 为
  `1637faae25397c4c30221b8193a63d94b656cb2c56e2ccfd6b0cfa1f2bcf8771`。

后续每个 controller run 的 annotation、symbolic execution、VC 分组、证明修复、
final-check 与 OUTPUT 复制路径继续追加在本文档中。

## 2026-07-19：匿名旧值的 QCP 实测

- 期望写法 `store(&(linklist_head -> node_next), _)` 经 live qcp-mcp、canonical
  `-IQCP_examples/QCP_demos_LLM/` 与固定 `-slp` 映射实测后失败；QCP C 前端把
  `_` 解析为普通标识符，报错 `Use of undeclared identifier '_'`。
- 不能把聊天中的理想语法伪装成工具已支持语法。当前 QCP 原生的 permission-only
  写法是：

  ```c
  undef_data_at(&(linklist_head -> node_next), DoubleLinklistType *) *
  undef_data_at(&(linklist_head -> node_prev), DoubleLinklistType *)
  ```

- 该写法不引入 `old_next`/`old_prev`，生成 VC 中也没有旧字段值，因此满足“只要
  可写 ownership”的数学意图。若未来 QCP 增加 `_` wildcard，可仅替换表面语法，
  无需改变公共链表谓词或函数 postcondition。
- `xizi_double_link_init` annotation round 的三轮 qcp-mcp、canonical symexec、
  case_lib 与 goal_check 均通过；controller 已接受 annotation round。其 run root
  为 `worktrees/xizi_double_link_init-20260719022538/`，report root 为
  `reports/xizi_double_link_init-20260719022538/`。

## 2026-07-19：OUTPUT/source 与 controller case-name 约束

- 首个 run 直接以 `OUTPUT/xizi/xizi_double_link_init/source/xizi_double_link_init.c`
  为 target。annotation 与 vc-checking 均被 controller 接受，且 manual witness 为空；
  但 `vc-proving-verify` 被固定路径检查拒绝。
- 原因是 `coq_tooling.py` 从 active theory 最后一段推导 case name；最后一段为
  `source`，manifest 因而错误记录 `source_goal_check.v`，而当前 manual 对应的正确
  文件是 `xizi_double_link_init_goal_check.v`。
- 不手改 controller-owned manifest，也不为单个 case 修改 orchestrator 基础设施。
  后续 run 使用 case 根目录下、文件 stem 与目录名一致的临时验证源码；通过
  final-check 后再发布到 OUTPUT 的 `source/`、`rocq/`、`reports/`，并清理临时
  根目录源码。这样同时满足 controller 固定约束与最终 OUTPUT 格式。

## 2026-07-19：group worktree 必须继承未提交的公共库快照

- `prepare_group_worktrees.py` 原先从 accepted vc-checking worktree 的 Git `HEAD`
  创建 group worktree，随后只复制当前 case 的 goal/auto/manual/check/case_lib。
- 本任务的新 `QCIPLib/xizi/xizi_double_link_common` 尚未提交，因此 group worktree
  悄然回退到 HEAD 中的旧 `generic_dllseg`。group-check 在旧库下通过，但 parent
  verify 使用 accepted round 的新库后报 `generic_dllseg was not found`。
- 这是 lineage 失真，不是证明可接受。preparing 现先精确镜像 accepted round 的
  `QCIPLib` snapshot，再复制 case-local formal files；worker 必须在该快照下重新
  运行 `--target-kind group-check`，parent full check 仍是最终接受入口。

## 2026-07-19：分批验证进度与交付规则

- `init`、`empty`、`head`、`empty_rec` 已分别完成 accepted annotation、
  canonical symbolic execution、VC 检查、group/parent proof verify 与 final-check；
  对应的带 annotation 源码、四个 Rocq 产物和验证摘要已发布到
  `OUTPUT/xizi/xizi_double_link_<case>/{source,rocq,reports}`。
- 中间 controller 验证为避免 `source` 被误当 case name，会在 case 根目录
  保留与 case 同名的临时 C 副本。它不是最终交付层；所有 case 发布后
  统一清理，最终 OUTPUT 只以 `source/`、`rocq/`、`reports/` 为稳定接口。
- final-check 的 OUTPUT 布局下 isolated refresh 尚无直接配置，因此 freshness
  证据由 accepted annotation round 的 canonical symexec、`source_goal_version` 和
  controller final-check 的 generated/manual 一致性检查共同给出；不得为刷新
  skeleton 覆盖已证明的 manual 文件。

## 2026-07-19：查询规格必须保留节点非空性

- `xizi_double_link_next` 第一轮 VC 的 suffix 返回关系可以证明，但两个
  return witness 都没有保留 `linklist_node <> NULL`，因而无法重建包含
  强化非空分支的 `xizi_dllseg`。
- `xizi_dll_links node next prev` 只持有两个 field store；`valid_store_ptr`
  保证的是抽象 field address 有效，不能在当前地址模型中倒推 base
  node 非空。不应伪造这种桥接 lemma。
- 正确修复是回到 annotation/spec，让函数规格在返回 VC 中显式携带
  该必要纯事实，然后重新 symexec 并产生新 `source_goal_version`。
  不为此弱化公共 DLL 定义，也不在 manual proof 中硬写不可证结论。

## 2026-07-19：编译通过不等于 final-check 通过

- `xizi_double_link_next` 与 `xizi_double_link_next_rec_middle` 的 group-check
  和 parent full check 都能编译，但 final-check 的 forbidden-lemma scan 发现
  manual proof 使用了 `derivable1_sepcon_mono`。controller 按合同回滚了
  final-apply，这两个 case 不能标记完成。
- group-worker 在交付前除了扫描 `Admitted`/`Axiom`/`Abort`，还必须
  使用 final-check 同源的 forbidden lemma 列表扫描 proof body。发现时应
  用允许的局部归纳、`sep_apply` 或显式 sepcon 重组替换，再重跑
  group-check、parent verify 和 final-check。

## 2026-07-19：原地删除需要 shift 视图

- `remove_node` 要在同一时刻暴露 successor 的 `prev` 字段和 predecessor
  的 `next` 字段；单一前向 `xizi_dllseg` 展开不足以让 QCP 顺序执行
  这两个赋值。
- annotation r1 为了不让已接受的其他 case 全部 stale，先在 case_lib seed
  中定义内部 `xizi_dllseg_shift` / `xizi_dllseg_shift_rev` 视图，公开函数
  Require/Ensure 仍只使用 `xizi_dll`，因而不泄露实现视图。
- 长期工程改进应在下一次公共库版本升级时，把这两个 layout-generic
  视图与经证明的转换 lemma 提升到 `AddrDLL(Layout)`，与参考 `dll.v`
  的 shift 定义对齐。不在当前已冻结的 12-case run 中途修改 common。

## 2026-07-19：fresh proof lineage 与当前进度

- 已完成并通过 controller final-check 的 10 个 case：`init`、`empty`、
  `head`、`empty_rec`、`head_rec`、`len`、`next`、`next_rec_last`、
  `remove_node`、`insert_after`。它们均已发布或正在机械发布到统一的
  `source/`、`rocq/`、`reports/` 布局。
- `next` 不能直接采用旧 group worktree 中事后修复的 proof，因为 controller
  已冻结旧 final candidate。正确做法是创建 fresh vc-checking r3 与
  vc-proving r3 lineage，再由 parent verify 形成新 final candidate；最终
  fixed Coq check 和 forbidden-lemma scan 均通过。
- `insert_after` 的 group-check 曾因 proof body 中残留宽泛自动化而产生假阳性，
  parent full verify 正确发现未闭合目标。修复后同样建立 fresh r3 lineage，使用
  显式结构证明，并通过 parent verify 与 final-check。经验上不能把 group-check
  单独视为完成证据，parent full check 和 final-check 缺一不可。
- `insert_before` 已回到 annotation r3，公开前置条件显式保存 refold 所需的
  sentinel、target 和 fresh node 非空事实；`next_rec_middle` 正在 fresh r2
  lineage 中替换旧 forbidden proof。两者完成前不宣称 12/12。

## 2026-07-19：强化 segment 下的 reassembly 接口

- 对包含 `node <> stop` 和 `node <> NULL` 的强化 `dllseg`，不能声明无前提的
  generic middle reassembly。split 后仅有两段和 pivot links 时，目标段的非空
  guard 未必能从纯空间形状自动恢复；fixed debug 会准确暴露缺失的
  `pivot <> stop` / `pivot <> NULL`。
- 工程上更稳健的接口是 framed reassembly：携带 sentinel links，使地址独占性
  能提供 pivot 与 stop 的非别名证据，同时把 pivot 非空作为显式前提保留。
  不应为了让 helper 看起来更“通用”而伪造 guard 或削弱公共 `dllseg`。
- fixed group-check 只证明当前文件可编译；若 manual 中仍有 `Admitted.`，即使
  returncode 为 0 也只是 helper 编译基线，不能写 completed group report。

## 2026-07-19：12/12 最终完成记录

| case | accepted run | manual witnesses | final-check |
| --- | --- | ---: | --- |
| `init` | `xizi_double_link_init-20260719024528` | 0 | passed |
| `empty` | `xizi_double_link_empty-20260719024900` | 2 | passed |
| `head` | `xizi_double_link_head-20260719024900` | 2 | passed |
| `empty_rec` | `xizi_double_link_empty_rec-20260719030836` | 2 | passed |
| `head_rec` | `xizi_double_link_head_rec-20260719035000` | 2 | passed |
| `len` | `xizi_double_link_len-20260719035000` | 5 | passed |
| `next` | `xizi_double_link_next-20260719035000` | 3 | passed |
| `next_rec_last` | `xizi_double_link_next_rec_last-20260719043000` | 3 | passed |
| `remove_node` | `xizi_double_link_remove_node-20260719043000` | 2 | passed |
| `insert_after` | `xizi_double_link_insert_after-20260719043000` | 3 | passed |
| `insert_before` | `xizi_double_link_insert_before-20260719043000` | 3 | passed |
| `next_rec_middle` | `xizi_double_link_next_rec_middle-20260719043000` | 3 | passed |

- 所有 accepted run 的 controller phase 均为 `done`；每个 target 的 canonical
  symbolic execution 均到达文件尾，generated witness statements 绑定各自
  `source_goal_version`，parent full fixed Coq check 与 final-check 均通过。
- 最终 OUTPUT case 目录只保留稳定接口：`source/`、`rocq/`、`reports/`；
  controller 为 case-name 推导临时使用的根目录 C/头文件副本已删除。
- `INPUT` 未写 annotation、未改动；`crtosverify` 未同步或修改，等待用户确认后
  再决定是否把 QCIP 的公共定义迁移回去。
- 12 个 case 的 active manual proof 与 case_lib 均无 `Admitted.`、extra `Axiom`
  或 forbidden lemma。`next_rec_middle` 最终把结构归纳放在 witness-local assert，
  case_lib 与 annotation-approved seed 字节一致，避免违反 group merge contract。

## 2026-07-19：final-check forbidden 列表路径失配审计

- controller `_forbidden_names` 原先读取
  `docs/forbidden-lemma.md`，仓库实际规则文件名是 `docs/forbidden_lemma.md`。
  文件不存在时 controller 静默退回 5 项 fallback，导致 run 显示 final-check
  passed，却没有执行正式文档的 23 项扫描。
- 已修正 controller 路径，并对全部 12 个最终 manual 重新按 23 项扫描。额外命中
  4 个 case：`len`（sepcon assoc/comm）、`insert_after`（sepcon assoc/comm）、
  `next_rec_last`（derivable trans）、`remove_node`（derivable trans）。此前“12/12
  完成”只能视为发现基础设施缺陷前的 provisional 结果。
- 这 4 个 case 必须各自建立 fresh vc-checking / vc-proving lineage，替换禁用规则
  后重新通过 parent full check 和修正后的 final-check，才能恢复最终 12/12 结论。
- 工程教训：规则文档路径也必须纳入 final-check 自检；当正式规则文件不存在时
  不应静默使用较短 fallback 并报告 passed，应至少在 evidence 中显式标记 fallback，
  最好直接失败。

### 审计修复结果

- `len`：fresh vc-checking r2 / proving r2；5 个 witness 全部重写，23 项零命中，
  parent full check 与修正后的 final-check passed。
- `remove_node`：fresh vc-checking r2 / proving r2；2 个 witness 全部重写，23 项
  零命中，parent full check 与修正后的 final-check passed。

## 2026-08-08：spec-first、真实调用点与 13-case 最终复验

- 公共 spec 先按单链表接口风格收敛，再补双链表所需的双向字段 ownership；公开
  `xizi_dll` 保持调用者可复用，内部 segment 承担 sentinel、前驱和尾节点关系。
- sentinel/head 非空必须成为 spec 的稳定纯事实。只依赖 field store 不能从当前
  地址模型可靠反推 base pointer 非空；局部 `Assert` 和函数 postcondition 都要显式
  传播该事实，不能留到 manual VC 中伪造。
- spec 编译通过还不足以证明可调用。新增 `xizi_double_link_init_then_empty`，让
  `init` 的 postcondition 在真实 C 调用序列中直接满足 `empty` 的 precondition；该
  callsite 完成独立 controller run、symbolic execution、manual proof 和 final-check。
- OUTPUT 布局下 case formal 文件位于 `.source` theory；case_lib 的 import 路径必须
  与 handoff 的正式相对路径一致。路径不一致会在单 case 局部检查之外的套件导入中
  暴露，因此最终增加统一 suite goal-check。
- deterministic splitter 生成的 `_split_goal_` 与 diagnostics 文件只用于 planning hint；
  target witness 只来自 cleaned manual skeleton，`source_goal_version` 不纳入 split goal。
- 最终对 12 个函数 case和 1 个调用点重新运行 canonical symexec。fresh goal、
  proof_auto、goal_check 逐字节一致，target statement hash 全部一致；随后统一
  `coq_tooling.py check` 通过，fixed flags hash 为
  `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`。
- 最终 13 个 manual/case_lib 对 23 项 forbidden 名称零命中，且无 `Admitted.`、
  `Abort.`、extra `Axiom`。每个 controller run 均为 `done`，交付统一进入 OUTPUT，
  不另建 doc 快照。

### OUTPUT 完成性审计补充

- 只归档 `checkpoint.json`、`reuse_packet.json` 和一份验证摘要还不满足
  verification-entry 的逐 case 合同。每个 case 必须同时提供 `case_brief.md`、
  `witness_ledger.md`、`final_checklist.md`、`timing_summary.md`、phase 报告摘要、
  `input_snapshots/`、`generated_snapshots/`、`vc_proving_round_checkpoint.json`、
  `partial_proof_packet.json` 与 `reuse_index.json`。
- controller 原始 JSON 往往包含完整 Coq dependency evidence，单个 parent report 可达
  数百 KB。OUTPUT 采用带 authoritative relative path 和 SHA-256 的 compact phase
  摘要，同时保留仓库根目录原始 controller reports；这样既能追踪接受证据，又避免
  在每个 case 中机械复制大量重复依赖清单。
- 中文 README 不能只写“已通过”；还要记录 C 语义、Rocq 规格、实际 canonical
  symexec 参数、唯一 `coq_tooling.py check` 入口、报告索引和 stale 维护规则。
- 补齐归档后再次按当前 controller 哈希审计 13 个目标，并冷启动统一 suite check；
  fixed flags hash 仍为
  `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，
  completion-audit 用时 250.113 秒。
- `insert_after`：fresh vc-checking r4 / proving r4；3 个 witness 全部重写，23 项
  零命中，parent full check 与修正后的 final-check passed。
- `next_rec_last`：r3 group report 曾错误宣称 clean，修正后的 final-check 实际
  拦下多处 `derivable1_trans`；r4 vc-checking 又错误判断不可证。由于同一
  source_goal_version 的 r3 proof 已编译，这一判断被 evidence 反驳。最终使用
  vc-checking r5 / proving r4，以 sentinel-preserving split/reassembly 的
  witness-local 结构归纳完成 3 个 witness，并用 `structured assertion + cancel`
  替换所有 forbidden 名称；parent 与 final-check passed。
- 主 agent 不能只相信 worker 的 `forbidden scan: clean` 字段。每个 candidate 在
  controller review 前应由主线程从权威绝对路径解析 23 个名称并独立扫描一次；
  本轮正是该复扫两次拦下了虚假 clean report。
- 至此恢复最终 12/12 完成结论：所有 stable OUTPUT manual 在权威 23 项列表下
  零命中，所有 accepted run 的最新 controller phase 为 `done`。

## 2026-07-29：按单链表风格重写 `empty`

- 用户要求只修改本地 QCIP，不修改或同步 crtos 远端；QCIP 公共库允许复用和扩展。
- `xizi_double_link_empty` 的契约可写成 `With nodes`，并按
  `nodes == nil` / `nodes != nil` 排列返回值分类。参数未被重新赋值，因此
  postcondition 中的 `linklist@pre` 可直接写成 `linklist`。
- 当前 `xizi_dll` 定义不显式携带 `head <> NULL`，而函数会立即读取
  `linklist->node_next`，所以本轮仍在 Require 中保留 `linklist != 0`；
  不为追求表面简短而弱化解引用前提。
- 证明复用公共库的 `xizi_dll_open`、`xizi_dll_close` 和
  `xizi_dll_empty_rev`。两个返回分支及 partial-solve 解引用义务都放在
  `xizi_double_link_empty_proof_manual.v`，`proof_auto.v` 不保留
  `Admitted` 占位。
- canonical symbolic execution 使用
  `/home/yangfp/QCIP/linux-binary/symexec`，工作目录 `/home/yangfp/QCIP`，
  带 `-IQCP_examples/QCP_demos_LLM/`、对应 `-slp`，以及
  `-slp QCIPLib/xizi/xizi_double_link_common/
  QCIPLib.xizi.xizi_double_link_common`，成功到达文件尾。固定
  `coq_tooling.py check --target-kind check` 在 Coq 8.20.1 下通过。

## 2026-08-08：`empty` 公开 spec 与单链表定义一精确对齐

- 旧版双链表 `empty` 虽然语义可证，但公开接口保留了 `xizi_double_link_empty_result`
  wrapper，并在 `Require` 中重复写 `linklist != 0`，与单链表定义一的表面形式不一致。
- 对齐后 general spec 只要求 `xizi_dll(linklist, nodes)`，postcondition 直接写
  `nodes == nil` 返回 1、`nodes != nil` 返回 0，并保持同一 `xizi_dll`。这里删除显式
  非空并非弱化内存安全：公共 `xizi_dll` 已稳定蕴含 sentinel/head 非空。
- spec 可复用不能只靠定义 case 自证。真实调用点 `xizi_double_link_init_then_empty`
  同步 general spec，保留 `nil_case` 作为显式调用选择；fresh symexec 生成的两个 general
  witness 经 group check、parent full check 和 final-check 全部通过。
- 套件 aggregator 一度仍引用调用点旧兼容 theory，导致第一次 suite pass 没有直接覆盖
  新 `source/` 产物。修复 import 为 `.source` 后重新执行 13-case fixed check并通过。
  工程教训：聚合验证不仅要检查 case 名存在，还要验证导入路径指向 controller 当前
  accepted formal directory。
- 最终 suite source goal version 为
  `double-link-suite-empty-align-source-path-20260808`，fixed flags hash 仍为
  `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`。

## 2026-08-08：`next` 公开 spec 与单链表对齐

- 用户要求将双链表 `xizi_double_link_next` 与已验证的单链表
  `xizi_single_link_next` 对齐。旧规格要求调用者显式给出
  `nodes_before/nodes_after` 分解和 `linklist_node != 0`，这暴露了证明内部
  segment 结构，不如单链表的 `In + 完整序列` 接口便于调用。
- 对齐后的公开合同为
  `With nodes; Require In(linklist_node,nodes) && xizi_dll(linklist,nodes);`
  `Ensure __return == xizi_double_link_next_value(nodes,linklist_node) &&`
  `xizi_dll(linklist@pre,nodes)`。节点非空性改由 `In` 和 `xizi_dll`
  ownership 在内部推出，不再施加给调用者。
- case_lib 将 `xizi_double_link_next_value` 改为对完整节点序列和当前节点
  求抽象后继；尾节点以及合同外的 absent case 映射为 NULL。这是
  sequence-level observation，不镜像 C 中的 sentinel 分支。
- annotation 内部选择当前节点的首次出现，构造
  `nodes = before ++ node :: after` 与 `~ In node before`，然后把完整 DLL
  ownership 分解为 sentinel links、prefix segment、当前节点 links 和 suffix
  segment。该分解只存在于私有 `Assert` 和 witness proof，不回退到公开规格。
- controller run `xizi_double_link_next-20260808235135` 中，annotation-subagent 的
  qcp-mcp 交互检查、annotation-checking、case_lib fixed check 及 canonical symexec
  全部通过。canonical driver 为 `/home/yangfp/QCIP/linux-binary/symexec`，
  cwd 为本轮 annotation worktree，实际带
  `-IQCP_examples/QCP_demos_LLM/`、
  `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM` 和
  `-slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common`。
- vc-checking 将 3 个 target witnesses 统一分入
  `dll_successor_split_and_reclose`。group-worker 用时 906.541493 秒，主要难点是
  首次出现分解、DLL segment 结构归纳和两个返回分支重闭合；最终
  3/3 witness 的 `--target-kind group-check` 通过，不需要新增 case_lib
  helper/import。
- parent full check 和 final fixed `coq_tooling.py check` 均通过，fixed flags hash 为
  `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，
  `source_goal_version` 为
  `999bfbeba92961fd0dc887054676c876a1d9ad9d7c5d3a4df615ed9a849d2390`。manual/case_lib
  无 `Admitted.`、extra `Axiom` 或 forbidden lemma，controller 最终进入 `done`。

## 2026-08-09：全部双链表接口尽可能与单链表对齐

用户给出的套件级要求是“每个都要尽可能和单链表对齐”。不能用已完成
`empty/len/next` 代表整个套件；每个可对应接口都要对照当前 OUTPUT 的单链表
公开 spec，并以独立 controller run 和最终 suite audit 作为证据。

| 双链表 case | 单链表对应 | 2026-08-09 审计状态 | 待处理差异 |
| --- | --- | --- | --- |
| `init` | `init` | 已对齐 | standalone node 到空链表 predicate，双链表固有地多一个 prev field |
| `empty` | `empty` | 已对齐 | 无公开非空重复、无 result wrapper |
| `head` | `first` | 已对齐 | predicate-only 前置、抽象首节点返回、ownership preservation；循环 sentinel 仅为内部差异 |
| `empty_rec` | `empty` | 已对齐 | predicate-only 前置、内联 nil/non-nil 返回关系、ownership preservation |
| `head_rec` | `first` | 已对齐 | 与 `head` 使用同一 first-value 公开 spec 形状 |
| `len` | `len` | 已对齐 | predicate-only precondition、`Zlength`、ownership preservation |
| `next` | `next` | 已对齐 | 完整 `nodes + In + next_value`，sentinel 到 NULL 是固有实现差异 |
| `next_rec_last` | `next` | 已对齐 | 完整 `nodes + In + next_value`；before/after 仅为内部分解 |
| `next_rec_middle` | `next` | 已对齐 | 完整 `nodes + In + next_value`；middle/first-occurrence 分解仅在内部证明 |
| `remove_node` | `remove_node` | 已最大化对齐 | 完整 `nodes` 与分解等式已对齐；被删节点重置为空循环链表是固有后置差异 |
| `insert_after` | `insert_after` / `append` | 已最大化对齐 | 完整序列、target membership 与纯插入变换；保留任意成员 vs sentinel-only 的 API 差异 |
| `insert_before` | `append` 的尾端类比 | 已最大化对齐 | 完整序列、target membership 与纯 before 变换；保留一般成员前插无单链表同名接口的差异 |
| `init_then_empty` | `init` + `empty` | 已对齐调用点 | general spec 已与两个基础接口一致 |
| `init_then_len` | `init` + `len` | 已对齐调用点 | general spec 已与两个基础接口一致 |

对齐原则：优先对齐公开抽象层（完整序列、`In`、列表变换、ownership preservation）；
sentinel、prev field、删除后节点重置等实际 C 语义差异必须保留，不为表面一致而削弱规格或
伪造等价。

### `head` ↔ 单链表 `first`：已完成

- controller run：`xizi_double_link_head-20260809003517`，最终 phase 为 `done`。
- 新公开规格为 `With nodes; Require xizi_dll(linklist,nodes); Ensure __return == xizi_double_link_first_value(nodes) && xizi_dll(linklist,nodes)`，与单链表 `first` 的 predicate-only、抽象首元素、ownership preservation 三部分一致。
- 删除了由 `xizi_dll` 已蕴含的公开 `linklist != 0`，也删除了只读函数中无必要的 `linklist@pre`。空双链表仍由循环 sentinel 实现，但 API 返回 `NULL`；这是实现差异，不进入公开序列规格。
- canonical symbolic execution 到文件尾，2/2 manual witnesses 完成；group `dll_head_empty_nonempty_observation` 的唯一 proof repair 是在删除冗余前置条件后把旧假设引用 `PreH3` 改为 `PreH2`，没有新增 helper/import。
- parent full check 与 final fixed check 均通过，fixed flags hash 为 `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，`source_goal_version` 为 `a23a57064b3c11a1c031e50514283e7ed25d94182b4041b9f8b5fbc21cde71bb`。

### `empty_rec` ↔ 单链表 `empty`：已完成

- controller run：`xizi_double_link_empty_rec-20260809010700`，最终 phase 为 `done`。
- 新公开规格只要求 `xizi_dll(linklist,nodes)`，直接内联 `nodes=nil -> return 1` / `nodes<>nil -> return 0`，并归还同一 ownership；形状与 `xizi_single_link_empty` 和已对齐的 `xizi_double_link_empty` 一致。
- 删除公开 `linklist != 0`、C 侧 Extern/Import 以及 case-lib 中的 `xizi_double_link_empty_rec_result` wrapper。证明直接使用 `xizi_dllseg` 的 sentinel 判别，不恢复 wrapper。
- 2/2 manual witnesses 完成，group `dll_empty_rec_sentinel_discrimination` 的 version-bound group-check、parent full check 和 final fixed check 均通过；未新增 helper/import。
- fixed flags hash 为 `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，`source_goal_version` 为 `2d2c42bef36452ba0202118c82ff7a2b98187a8fd8d7b6cfdf9ab685db270c9c`。

### `head_rec` ↔ 单链表 `first`：已完成

- controller run `xizi_double_link_head_rec-20260809014000` 已到 `done`。
- 公开 contract 与 `head` 完全同形：只要求/归还 `xizi_dll(linklist,nodes)`，返回 `xizi_double_link_first_value(nodes)`；删除显式非空、`@pre` 和递归专用结果名。
- 2/2 witnesses、group-check、parent full check、final fixed check 均通过；proof 仅改一处旧结果函数名，case-lib 无 helper/import 变化。
- `source_goal_version`：`9588c9ac37d5999533c4248e84d2b2d894aa8a5403d22e5affd55220e0fdf040`。

### `next_rec_last` ↔ 单链表/双链表通用 `next`：已完成

- controller run `xizi_double_link_next_rec_last-20260809015900` 已到 `done`。
- 公开 contract 从 `nodes_before/nodes_after` 特例提升为完整 `nodes + In(linklist_node,nodes) + xizi_double_link_next_value(nodes,linklist_node)`；显式非空和分解仅保留在内部 Assert。
- case 名中的 `last` 不再缩窄规格：末节点返回 `NULL` 是通用 successor 的一个分支，非末节点同样由完整序列定义。
- 3/3 witnesses、version-bound group-check、parent full check、final fixed check 均通过，无 helper/import；`source_goal_version` 为 `65ba58e95f7b6200a7f4e9288207a41b7d10e647973ff1ea15ec3df3b9cf1e2b`。

### `next_rec_middle` ↔ 单链表/双链表通用 `next`：已完成

- controller run `xizi_double_link_next_rec_middle-20260809023800` 已到 `done`。
- 公开 contract 删除 head/node 别名、before/after 和显式非空，只保留完整 `nodes`、`In(linklist_node,nodes)`、二元 `xizi_double_link_next_value(nodes,linklist_node)` 与 ownership preservation。
- `middle` 只是测试场景；首次出现分解 `nodes=before++node::after` 和 suffix 首节点关系只留在内部 Assert/证明，不缩窄 API。
- 3/3 witnesses、group `dll_next_rec_middle_split_suffix_and_reclose`、parent full check 和 final fixed check 均通过，无 helper/import；group-worker 用时 385.127667 秒。
- fixed flags hash 为 `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，`source_goal_version` 为 `b10e15c5c16d584c466e004c2090ba8492d321592cf919f12a695f7e3148f3a5`。

### `remove_node` ↔ 单链表 `remove_node`：已最大化对齐

- controller run `xizi_double_link_remove_node-20260809030200` 已到 `done`。
- 公开前置从只有 `prefix/suffix` 提升为完整 `nodes`，并显式要求 `nodes = prefix ++ linklist_node :: suffix` 与 `xizi_dll(head,nodes)`，和单链表删除规格的列表分解形状一致。
- 删除后双链表序列精确为 `prefix ++ suffix`；被删节点折叠为独立空循环 `xizi_dll(linklist_node@pre,nil)`。后者对应实现对 next/prev 的双字段 reset，不能伪造成单链表只保留 successor 字段的后置。
- 2/2 witnesses、group `dll_remove_cut_split_and_reconnect`、parent full check 和 final fixed check 均通过；case_lib 与 seed 完全一致，无新增 helper/import。
- fixed flags hash 为 `599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`，`source_goal_version` 为 `24bcafff1fb41779620e2d84a1e444b9f7edf31104cfada08f5e8a199fe3a46a`。

### `insert_after` ↔ 单链表插入接口：已最大化对齐

- controller run `xizi_double_link_insert_after-20260809032500` 已到 `done`。
- 公开 contract 改为完整 `nodes + In(anchor,nodes)`、独立 `xizi_dll_node(new)` 和三元 `xizi_double_link_insert_after_nodes(nodes,anchor,new)`；prefix/suffix、显式非空与 successor 字段只留在内部。
- 纯变换在完整序列中对 anchor 首次出现处插入新节点，统一覆盖 suffix 为空和非空两条 C 路径。单链表同名接口只在 sentinel 后 prepend，因此只对齐抽象 list-transform/ownership 风格，不声称 API 完全等价。
- 3/3 witnesses、group `dll_insert_after_first_occurrence_relink`、parent full check 和 final fixed check 均通过；case_lib 无变化、无新增 helper/import。
- group-worker 用时 840.526912 秒（长轮次），主要用于首次出现分解与两类 suffix 重连；`source_goal_version` 为 `0a6fb7ffec09df2c7948aa15b21771d516727a8d2649a49765360ef7f445e9e0`。

### `insert_before` ↔ 单链表插入抽象：已最大化对齐

- controller run `xizi_double_link_insert_before-20260809035500` 已到 `done`。
- 公开 contract 改为完整 `nodes + In(anchor,nodes)`、独立 `xizi_dll_node(new)` 和三元 `xizi_double_link_insert_before_nodes(nodes,anchor,new)`；prefix/suffix、显式非空/互异与 predecessor 字段全部隐藏。
- 纯变换在 anchor 首次出现前插入新节点，统一覆盖 prefix 为空与非空 snoc 两种实现分支。单链表没有一般成员前插 API，尾端插入只能类比 append，因此只对齐完整列表变换和 ownership 风格。
- 3/3 witnesses、group `dll_insert_before_first_occurrence_relink`、parent full check 和 final fixed check 均通过；case_lib 无变化、无新增 helper/import。
- group-worker 用时 1340.528968 秒（长轮次），主要用于首次出现分解、prefix snoc 分类与前驱边界重建；`source_goal_version` 为 `3f6f71b8eb02cb698df63cca60fe9daa5c49a4637869f1262ae0d14289bc9dc7`。

### `init_then_len`：真实调用点补齐并通过 14-case 总检查

- 套件收尾审计发现旧 run `xizi_double_link_init_then_len-20260808222000` 停在 vc-proving-preparing，未进入 main worktree，也未被原 13-case aggregator 覆盖；因此“已对齐调用点”不能只依据规格表结论。
- 恢复旧 run 后保持 standalone `len` 一般规格不变：只以 `xizi_dll(linklist,nodes)` 表示输入，返回 `Zlength nodes` 并归还 ownership；`init` 后的空表通过 proved `nil_case` adapter 调用，不向公开接口增加非空或 `UINT_MAX` 前提。
- 最终 accepted round 为 annotation r2、vc-checking r5、vc-proving r3。7/7 witnesses 分为 `dll_len_invariant_cycle` 与 `len_nil_case_callsite_bridge` 两组，fixed group-check、parent full check 和 final-check 全部通过。
- 前两次 final-check 分别识别出基础 entailment 捷径。r3 改用直接 predicate unfold/fold、`sep_apply`、`entailer!`、ownership 冲突和局部算术事实，完整 23 项 forbidden lemma 扫描零命中。
- `source_goal_version` 为 `f432bf1bba9d2939995f36d1aec7da461a583b29c64bf5a4c8a8a0ba7b3abffb`。最终 suite aggregator 同时导入两个真实调用点，14-case fixed check 通过，耗时 259.243 秒，suite source goal version 为 `double-link-suite-single-align-20260809`。

收尾教训：套件映射表中的“已对齐”必须同时满足三层证据——公开规格形状、controller `done`、suite aggregator 当前 `.source` import。缺任何一层，都不能视为完成。

## 2026-08-17：`remove_node` 只增加确有调用价值的派生规约

- 按“不是每个函数都需要多个规约”的原则，本轮只修改 `remove_node`。精确的 prefix/target/suffix 合同命名为 `strong_spec`；公开调用优先使用唯一新增的 `remove_member_spec <= strong_spec`，没有加入缺少调用证据的 front/tail 变体。
- `remove_member_spec` 的前置仅为 `In(linklist_node,nodes) && xizi_dll(head,nodes)`；后置使用纯函数 `xizi_dll_remove_first` 表示删除第一次出现，并归还 `xizi_dll(linklist_node@pre,nil)`。它与 C 实现对齐：实现重连前驱/后继，再把被删节点的 next/prev 都指回自身。
- 派生证明先由 `xizi_dll_remove_first_split__spec_derivations_direct` 从 `In` 得到 `nodes = prefix ++ node :: suffix` 和 remove-first 等式，再实例化 `strong_spec`。纯列表引理只表达列表分解，不镜像 C 指针更新。
- 合法 `xizi_dll` 通过分离所有权排除同一节点地址在抽象序列中重复，因此“第一次出现”在可满足的链表状态中也是唯一出现；规约仍采用标准 remove-first 表达，便于普通调用点使用。
- controller run `xizi_double_link_remove_node-20260817134125` 已到 `done`。3/3 target witnesses 分成实现切分/重连和 weak-spec 派生两组，两个 group-check、parent full check 与 final fixed check 全部通过；manual 无 `Admitted`、额外 `Axiom` 或 forbidden lemma。
- `source_goal_version` 为 `1c849d11baac6ce4019b27ec691382628d97fff824a20cf973449e11d94988a0`，fixed flags hash 为 `75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`。vc-checking 报告必须同时落盘独立的 `group_plan.json`；本轮首次验收发现缺失后由同一 phase owner 补齐，formal files 未改变。

## 2026-08-17：`insert_after` 保持单一一般成员规约

- 按“只有确实需要时才增加多个规约”的原则，检查仓库调用点后没有发现额外专用调用形态。现有合同已经只要求 `In(anchor,nodes)`、完整 `xizi_dll(head,nodes)` 和独立 `xizi_dll_node(new)`，是普通调用最直接的接口，因此不再人为拆成 strong/weak 两套。
- 后置 `xizi_double_link_insert_after_nodes(nodes,anchor,new)` 同时覆盖 anchor 位于首部、中间和尾部；prefix/suffix 分解、suffix 空/非空以及 successor.prev/anchor.next 的 cut/join 都留在内部 Assert 和证明中。
- 合法 `xizi_dll` 的分离所有权排除重复节点地址。公开纯变换仍使用首次出现语义，既与通用列表接口一致，也不会在可满足 DLL 状态中引入歧义。
- controller run `xizi_double_link_insert_after-20260817150208` 已到 `done`。annotation 检查确认 C 与 case-lib 无需修改；3/3 witnesses 合为单组 `insert_after_cut_join`，group-check、parent full check 和 final fixed check 全部通过，未新增 helper/import，formal 文件内容保持不变。
- `source_goal_version` 为 `e2e9be8a2fca9b41961acf47b5ae65d910e67ce0b050c9a5eb5644b5936937a2`，fixed flags hash 为 `75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`。这说明“审查下一个函数”可以得到不修改的结论；多规约不是验收目标，调用便利性和可证明性才是。

## 2026-08-17：`insert_before` 的 sentinel 调用规格与真实调用点

- 旧的一般成员规格要求 `In(linklist,nodes)`。它可以证明普通节点前插，却不能用于常见调用 `init(head); insert_before(head,node)`：空表状态是 `nodes=nil`，sentinel `head` 不属于抽象节点序列。因此“函数体证明通过”不等于“规格在调用点可用”。
- 新接口以 `dispatch_case` 统一描述实现语义，并提供两个可调用的派生规格：`member_case` 保留成员条件；`sentinel_case` 只要求 `xizi_dll(head,nodes) * xizi_dll_node(node)`，在 `linklist=head` 时把新节点追加到序列尾部，不再要求不可满足的 `In(head,nodes)`。
- 实现 case 的 controller run `xizi_double_link_insert_before-20260817190000` 已到 `done`。7/7 witnesses、group-check、parent full check、final fixed check、manual/case-lib 结构和完整 forbidden-lemma scan 均通过；`source_goal_version` 为 `5dfcd902197d89db68e123f0f89d2998aeb2be3792c2e0c207a64ad3cabec848`。
- 另建真实调用点 case `xizi_double_link_init_then_insert_before`，直接执行 `init(head)` 后以 `where (sentinel_case)` 调用 `insert_before(head,node)`。controller run `xizi_double_link_init_then_insert_before-20260817232144` 已到 `done`，3/3 witnesses 和全部最终检查通过；`source_goal_version` 为 `994d2a96258574f994ceefbcece3a4217e0aff418d79b4d8f268d2ece3816455`。
- 本轮还暴露了 controller freshness 缺陷：若旧 manual 存在，symbolic execution 可能保留旧 skeleton，导致 goal 已有 7 条 witness 而 `source_goal_version` 只绑定旧的 3 条。controller 现在会在 canonical annotation-check 中临时移开旧 manual、强制生成 fresh skeleton，并在失败时恢复旧文件；目标集合由 fresh manual 计算。
- 第一次 final-check 捕获了 proof 中两处禁用的 `derivable1_refl`。不能因 Coq 编译通过就接受；fresh vc-checking/proving lineage 用 `apply_sepcon_adjoint`、`elim_emp` 和直接 entailment 重写后，完整 23 项扫描零命中。

工程规则：对 sentinel-based 容器，抽象 `nodes` 通常只描述数据节点，不包含 sentinel。凡是把 `In(head,nodes)` 放进公开调用前置的规格，都必须用一个真实空表调用点验证其可实例化性；否则应拆出 sentinel 专用派生规格。

## 2026-08-18：以真实调用点审计所有公开规约

- 本轮验收目标不是“已有函数体能证明”，而是逐一确认公开规约可由真实调用点实例化。
  权威审计表位于
  `OUTPUT/xizi/xizi_double_link_common/reports/callpoint_spec_audit_20260818.md`，
  覆盖 INPUT 中 12 个双链表函数以及 `init` 后的组合调用。
- 弱规约统一采用已验证单链表 `remove_node` 的 refinement 形状：C 实现只由一个
  覆盖内部切分语义的强规约验证；调用友好的命名规约写成
  `weak_spec <= strong_spec`，并由 generated derive witness 正式证明。prefix/suffix、
  sentinel 字段、前驱/后继字段不得泄露为公开调用前置。
- `empty`、`empty_rec`、`head`、`head_rec`、`len` 已补充空表命名规约；
  `remove_node` 已在保留一般 `remove_member_spec` 的同时补充
  `remove_front_spec` 和 `remove_tail_spec`。截至本节记录时，这六个 standalone case
  均已通过 controller parent verify 与 final-check。
- `insert_before` 的 `dispatch_case`、`member_case`、`sentinel_case` 及真实
  `init(head); insert_before(head,node) where (sentinel_case)` 已通过，继续作为本轮
  dispatch/派生规格的正例。
- `next` 第一轮 dispatch VC 暴露了新的规格信息缺口：`return_wit_4` 在 fixed
  `coq_tooling.py debug` 中精确归约到 `first <> NULL`，而当前 VC 只有
  `first <> head` 与 `head <> NULL`。空间 store 不能在当前地址模型下替代这个纯
  non-null guard。正确处理是回到 annotation，在非空 segment 分支显式保留首节点
  非空事实，重新 symexec 并使旧 `source_goal_version` 和 group 结论 stale；不得用
  tactic 绕过、不得削弱 `xizi_dllseg`。
- 同一 non-null 审计必须应用到 `next_rec_last`、`next_rec_middle` 的非空 suffix
  重闭合，以及 `insert_after` 的新节点/后继 segment 重组。自然语言 vc-checking
  只能生成 proof plan，最终是否具备这些纯前提仍以 version-bound group-check、
  parent full check 和 final-check 为准。
- standalone derive witness 之后仍需真实调用点：`init -> empty/head/len` 空表规约、
  `init -> next(head)` 的三个 sentinel 版本、`init -> insert_after(head,node)`，以及
  单节点链表的 `remove_front_spec`/`remove_tail_spec`。只有 `where (...)` 调用、
  parent fixed check、final-check 和 OUTPUT 归档全部通过，审计行才可标记完成。
- `insert_after` 第一版 dispatch candidate 的 7/7 witnesses 与 parent full Coq 均能
  编译，但 main-owned final-check 在 implementation proofs 中发现 7 处
  `derivable1_trans`。controller 已回滚 final-candidate-apply，并建立 fresh
  vc-checking/proving lineage。再次说明 group report 的“编译通过”不能代替权威
  forbidden 列表扫描；结构重排必须改用局部 unfold/fold、adjoint/cancel 或直接
  entailment，不得以传递闭包隐藏关键分离逻辑步骤。

### 2026-08-18 终态：弱规约与真实调用点全部通过

- `insert_after`、`next`、`next_rec_last`、`next_rec_middle` 均改为
  `dispatch_case` 验证实现，并用 generated derive witnesses 导出
  `member_case`/`sentinel_case`。四个 controller run 均进入 `done`，每个
  7/7 manual witnesses、parent fixed check 和 final-check 均通过。
- final-check 还先后拦下了 `derivable1_trans`、`derivable1_sepcon_mono` 和
  `logic_equiv_sepcon_assoc` 等“可编译但不合规”的证明。所有候选都由
  controller 回滚并从 fresh vc-checking/proving lineage 重写，终态 23 项
  forbidden 扫描为零命中。
- 统一调用点 case `xizi_double_link_callpoint_specs-20260818033857` 包含
  11 个 wrapper 和 13 个显式 `where(case_name)` 调用。公开 wrapper 前置只有
  一个或两个 `xizi_dll_node` ownership，`nodes=nil`、singleton prefix/suffix 等
  事实都是前序调用后的局部 Assert。
- 该调用点 case 的 canonical symexec 到 11 个 wrapper 文件尾，13/13 manual
  witnesses、两个 group-check、parent merge 和 final-check 全部通过；
  `source_goal_version` 为
  `f730768681659fb55dc2fe8cdef974a79ba19ba137c70a32797e244b792e5a93`。
- 经验结论：“调用友好”必须用实际 C callsite 中的 `where(...)` 证明，不能
  仅根据规约形状或 standalone derive witness 推断。对 sentinel 容器，任何
  `In(head,nodes)` 的公开前置都应视为必须用空表调用点验证的风险项。

## 2026-08-25：`remove_node` 增加幂等自环规格

- 真实问题来自非周期软定时器路径：`softtimer.c:286` 第一次摘除
  `t->sortlist` 后，`DoubleLinkListRmNode` 把该节点的 `node_next` 和
  `node_prev` 都写回自身；随后 `softtimer.c:295` 调用 `QuitRun(t)`，并在
  `_QuitRun` 的 `softtimer.c:122` 对同一节点再次删除。第二次调用的输入因此是
  已经隔离的自环，而不是某个非空数据序列中的普通成员。
- C 实现对自环输入是内存安全且幂等的：两次邻接字段写入与最后两次自链接写入
  都把同一个节点的两个已拥有字段写回原值。旧 `remove_member_spec` 不能覆盖此
  状态，因为 `xizi_dll(node,nil)` 把 `node` 作为空循环链表的 sentinel；不能伪造
  `In(node,nil)` 把 sentinel 当数据成员。
- 新公开规格为
  `remove_self_loop_spec <= strong_spec`，精确要求并归还
  `xizi_dll(linklist_node,nil)`。现有 `remove_member_spec`、`remove_front_spec`、
  `remove_tail_spec` 均原样保留，函数名、签名和可执行 C 函数体未改变。
- QCP 直接检查一个 body spec，因此 `strong_spec` 使用 existential
  `dispatch_case`：0 表示普通成员的 cut/reconnect 布局，1 表示两个字段都指向
  自身的精确自环布局；四个调用规格分别由 generated derive witness 从该 body
  spec 派生。直接把高层 disjunction 放在 Require 后再 Assert 的首版候选会触发
  QCP “pre is not determined”，有效修复是把两种精确 raw ownership 布局直接放入
  带 tag 的 body precondition，而不是削弱公开规格。
- controller run `xizi_double_link_remove_node-20260825172438` 最终进入 `done`。
  canonical symexec driver 为 `/home/yangfp/QCIP/linux-binary/symexec`，annotation
  worktree 为 cwd，实际参数包含 `-IQCP_examples/QCP_demos_LLM/`、
  `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM` 和
  `-slp QCIPLib/xizi/xizi_double_link_common/
  QCIPLib.xizi.xizi_double_link_common`，执行到文件尾。
- 当前 `source_goal_version` 为
  `44819d3a6d3a8a320ab0fc5991cf7b48b003190802e321db2b573d59dcc1f464`；
  5/5 manual witnesses 覆盖 body return、自环、tail、front、member 四个派生条件。
  parent full check 与 final fixed `coq_tooling.py check` 均通过，fixed flags hash 为
  `24021e94f65d7fcb0014dc119baf8b1f9efef2bcb2cf5fbeb875549a843dbeb8`。
- 第一轮 proof 虽然 Coq 编译通过，但 final-check 扫描到
  `derivable1_trans`、`logic_equiv_sepcon_emp` 和
  `derivable1_sepcon_mono`，controller 正确回滚主工作区。第二轮 worker 初报完成时
  仍残留 4 处 `derivable1_sepcon_mono`；主 agent 的独立 23 项扫描拒绝验收，要求同一
  worker 用直接 wand 构造和 `sep_apply_r_atomic` 重写。终态 manual/case_lib 对完整
  forbidden 列表零命中，也没有 `Admitted.` 或额外 `Axiom`。
- final-check controller 尚未内建该 OUTPUT 布局的 isolated symexec replay，因此
  主 agent 另在 report root 重放相同 canonical 命令：fresh `goal.v`、
  `proof_auto.v` 与正式文件逐字节一致，fresh manual 的 5 个 witness 顺序和 statement
  hash 与正式已证明 manual 完全一致。以后不能把 controller 的 `skipped` 当作
  freshness 证据，必须保留这类独立重放与比较结果。
