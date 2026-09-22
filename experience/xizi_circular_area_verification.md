# Xizi 循环缓冲区验证经验

## 用户约束

- 参考已完成的单双链表 case 继续验证循环缓冲区。
- 先设计并确认数学 spec：覆盖实现的所有分支和状态变化，并确认被调函数的 spec 能在真实调用点建立；质量门通过后再做 symbolic execution 与 Rocq 证明。
- 只参考 `QCP_demos_LLM`，不参考 `QCP_demos_human`。

## 本轮 intake 结论

- 首个综合调用点选择 `CircularAreaWrite`：它调用 `CircularAreaIsFull`、`CircularAreaGetDataLength` 和 `CircularAreaDivideWrData`，适合检查公共缓冲区谓词与 callable specialization 是否闭合。
- spec 必须区分参数错误、满且非 force、连续写、跨尾写、按空闲容量截断和 force 更新读指针等行为。
- 当前实现的 force 写仍先按空闲容量截断；缓冲区已满时实际写入长度为 0。验证应忠实描述代码，不能擅自替换为常见的“覆盖旧数据”语义。
- annotation 风格采用 predicate-first：用抽象逻辑序列、容量、读写索引及 full/empty 状态描述内容和所有权，不在 Rocq 中镜像 C 写入算法。

## Annotation r1-r4 经验

- 严格 reference policy 下，搜索命令也必须限定到 handoff allowlist；即使排除了 `QCP_demos_human`，仓库根 `rg` / `find` 仍会使 attempt 失效。后续不得使用 `rg .` 或仓库根遍历。
- `<stdint.h>` / `<string.h>` 不被当前 QCP C parser 接受；parser-compatible typedef 可解决头文件语法问题。
- `memcpy` 后的 existential full assertion 会触发 `pre at branch <unspecified> is not determined`；该错误来自断言实例无法确定，不是 `memcpy` 调用分派本身。
- `Require emp / Ensure emp` 的弱 `memcpy` 合同虽能让 qcp-mcp 到 EOF，却丢失数组所有权和输入到输出的字节关系，必须由 annotation-checking 拒绝。
- r4 建立了行为完整的数学 spec：合法表示、FIFO 观察、data length、extensional slice update、ring write、截断长度、wrap/no-wrap、force/non-force、full-force actual=0，以及非 force logical append；内部 helper callsite 也能建立。
- 早期 r4 为探索精确 copy 语义，曾把 `memcpy` 替换成带完整数组契约和 copied-prefix loop invariant 的本地 `CircularAreaCopy`。这是实现重构，不满足“函数体与 CRTOS 对齐”，因此只作为失败路径记录，不能进入最终候选。
- r6 在保留原始 `memcpy` 的干净轮次中，使第一个 wrap copy 的 exact bytes 合同成立，但第二个 `p_head` / 偏移源段调用仍无法建立。
- r7 再次从 fresh worktree 复现同一 strict QCP blocker；已尝试 exact `UCharArray` blocks、`Zlength`/上下段规范化、显式 ghost 参数、pointer-add/field-index 和 branch-local exact assertion，仍无法通过。r7 无 reference-policy 污染，因此可作为“当前 QCP 接口无法对原始 wrap `memcpy` 建立精确内容合同”的干净证据。
- 不能用 `emp/emp` 或 shape-only 合同规避。后续通过把 `UCharArray::full` 精确拆成调用所需的 `seg`、在 wrap 两段之间重建剩余所有权，并显式保存 `Zlength(input_contents) = requested`，最终在不改动原始三处 `memcpy` 的前提下完成了 Read/Write 全内容证明；因此早期“只能重构 copy helper”的判断已被后续证据推翻。

## 2026-08-20 CRTOS API 对齐

- 对齐基准是 `Ubiquitous/XiZi_IIoT_Macro/kernel/thread/circular_area.c`。公共 API 使用 `CircularAreaIsFull`、`CircularAreaIsEmpty`、`CircularAreaReset`、`CircularAreaRelease`、`CircularAreaRead`、`CircularAreaWrite`、`CircularAreaGetMaxLength`、`CircularAreaGetDataLength`、`CircularAreaInit`；内部跨尾判断保留原始 `static` 名称 `CircularAreaDivideRdData`、`CircularAreaDivideWrData`。
- 既有 case 目录名 `read_advance` / `write_advance` 只是归档标识，不再作为 C API 名称。旧的 `state`、`force_write` 标量模型不是 CRTOS 函数，不应伪装成新增公共 API。
- 函数 spec 直接使用参数名，不使用参数 `@pre`。需要表达调用前状态时，将字段值、数组内容等放进 `With` ghost 变量；循环 invariant 内确有当前值/入口值关系时，才保留必要的 `@pre`。
- descriptor 规约应覆盖 8 个字段：`data_buffer`、`readidx`、`writeidx`、`p_head`、`p_tail`、`area_length`、`b_status`、`CircularAreaOperations`，并保存完整 `UCharArray::full`，不能退化成只拥有本函数读取的少数字段。
- `CircularAreaGetDataLength` 的合法分支必须包含 `0 < area_length`，否则原函数的 `% area_length` 没有定义；还需约束 `readidx` / `writeidx` 落在容量内，使其可被 `Read` / `Write` 调用点复用。结果关系不能直接写成无界整数 `(writeidx - readidx + area_length) mod area_length`：C 会先把差值截到 32 位，再把与容量的和再次截到 32 位，最后才取余。反例 `readidx=0, writeidx=2, area_length=UINT_MAX` 中 C 结果为 `1`，无界整数公式为 `2`；应在 Rocq spec 中保留两层 `unsigned_last_nbits`。
- `CircularAreaRelease` 可为同一个 `x_free` 声明两个 named specs：先以完整 `UCharArray::full` 释放 data buffer，再以已经写成 reset/null 状态的 8 个 descriptor 字段释放 descriptor。最终 post 为 `emp`，且不需要 manual VC。
- CRTOS `kernel/include/xs_base.h` 将 `ERROR` 定义为 `1`，不是常见的 `-1`。自包含验证 case 的本地宏也必须精确使用 `1`；否则空指针、零长度和“满且非 force”等错误分支会证明成错误的返回值。发现旧候选使用 `ERROR (-1)` 后，所有实际经过该宏的 case 必须重新生成并重证，不能因为 valid 分支不变而沿用旧 final-check。
- `CircularAreaInit` 设置 `p_head = data_buffer`、`p_tail = data_buffer + area_length`；`p_tail` 是 one-past-end，不是最后一个元素。Read/Write 及内部 helper 的 callable descriptor spec 必须使用同一关系，否则 Init 输出无法建立调用前置条件，wrap 第二段 `memcpy` 也无法证明落在同一 ring。
- CRTOS 的 `readidx` / `writeidx` 字段类型是 `uint8`，而 `area_length` 是 `uint32`。对完整可操作 ring 使用 `0 < area_length <= 256` 是由实际字段宽度导出的有效表示不变量；应明确说明这一来源，并用精确 unsigned 条件处理加法，不能散落 `255`、`510` 等无解释魔数。
- 截至本轮记录，`CircularAreaReset`、`CircularAreaRelease` 不受 `ERROR` 修复影响；其余先前完成的基础/helper case 正在按 CRTOS `ERROR=1` 重新验证。每个最终 case 仍需把 canonical symbolic execution 输出到对应 report root，确认 generated goal / proof_auto / goal_check（无 manual witness 时也包括 proof_manual）逐字节一致。

## 最终证明与交付经验

- `CircularAreaRead` 最终保留 CRTOS 原始三处 `memcpy`，完成 29 个 target manual VC；`CircularAreaWrite` 同样保留原始三处 `memcpy`，完成 27 个 target manual VC。写分支返回规约需要入口 `UCharArray::full input_buffer requested input_contents`，所以必须在三个 branch-local exact assertion 中保存 `Zlength(input_contents) = requested`；只有 `[0, requested)` 的若干 `seg` 不能排除输入列表存在额外尾部，语义上不足以重建 `full`。
- group-worker 的隔离 `group-check` 通过并不自动保证 parent full `goal_check` 一定通过。曾有一条依赖 occurrence 顺序的 `rewrite ... by lia` 在 group 环境通过、合并后失败；修复方式是先显式证明 32 位范围与等式、给中间事实命名，再逐层 rewrite。parent `vc-proving-verify` 和最终 full fixed check 都不可省略。
- 完整 API 对齐审计不能只比较函数名和签名，还要比较去掉 annotation 后的 C token。该检查发现 `CircularAreaInit` 一度漏掉成功路径的 `KPrintf("CircularAreaInit done ...")`；在未取得用户授权时，即使规约与已有 VC 全部通过，也不能自行删除日志来规避工具限制。
- `CircularAreaIsFull`、`CircularAreaIsEmpty` 中保留的日志需要 `GlobalStrings(LitMap)` 资源，parser-compatible `KPrintf` callable spec 必须保持该资源；不得用 `emp/emp` 合同换取 QCP 通过。`CircularAreaInit` 的三条 variadic 日志则是在用户明确授权后统一从验证版本删除，并重新完成全流程验证。
- `CircularAreaInit` 曾有一个独立的工具边界：CRTOS 的两个失败日志以 1 个实参调用 `KPrintf`，成功日志以 4 个实参调用同一个 variadic `KPrintf`。canonical QCP 在声明的 `...` 处报 `unexpected PT_DOT`，而旧式空参数声明/无声明仍由 typechecker 的有限形参表拒绝不同 arity；官方上游 QCP 2.1.0 预编译 binary 也复现相同错误。最终用户明确授权在验证版本中删除 `KPrintf`，因此删除全部 3 条日志后重新执行完整 annotation、symbolic execution、VC checking/proving、parent verify 和 final-check；除这 3 条日志外，函数 token 与 CRTOS 对齐。这里的关键经验是：工具 blocker 必须先如实保留，只有得到明确源级改动授权后才能采用适配方案。
- Init 重证过程中还发现第二次 `x_malloc` 失败分支的所有权不能写成完整初始化 descriptor：`data_buffer`、`readidx`、`writeidx`、`b_status` 已初始化，而 `p_head`、`p_tail`、`area_length`、`operations` 仍是未初始化存储。按这一精确 partial-failure state 修正 spec 后，3 条返回 VC 全部闭合。
- 最终 11 个循环缓冲区 case 共 85 个 target manual witnesses；逐 case final-check 与汇总 `xizi_circular_area_suite_goal_check.v` fixed Rocq 8.20.1 检查均通过。所有函数 spec 的参数 `@pre` 命中为 0，23 项 forbidden lemma 零命中，manual/case_lib 无 Admitted、Abort 或额外 Axiom。
- 11 个最终 case 的函数 spec 均直接使用对应参数名，参数 `@pre` 命中为 0；入口状态统一由 `With` ghost 值承载。目录名 `read_advance` / `write_advance` 不影响其中函数仍为 CRTOS 的 `static CircularAreaDivideRdData` / `static CircularAreaDivideWrData`。
- 套件交付沿用单双链表布局：每个 case 包含 `source/`、`rocq/`、`reports/controller/`、`reports/workflow/`、input/generated snapshots、checkpoint 和 reuse packet；独立 freshness 输出留在 controller report root，仅复制机器可读结论到归档，不能覆盖已证明 manual。

## 2026-08-26 共享 descriptor invariant 统一

- 原套件虽然逐 case 验证通过，但 `data_length`、`max_length`、`read`、`read_advance`、`write` 各自在 case lib 中复制了 `CircularAreaDescriptorState`，而且旧定义并不完全一致：多数只给 `b_status` 的 int32 范围，`max_length` 还只给字段类型范围，`write` 则使用等价但不同结合形状的索引约束。公共调用链因此没有单一、可追踪的 live-descriptor 数学接口。
- 唯一共享定义放在 `QCIPLib/xizi/xizi_circular_area_common/xizi_circular_area_lib.v`：读写索引均在 `[0, area_length)`，`0 < area_length <= 256`，`b_status` 精确为 `0` 或 `1`，并且 backing contents 长度等于容量。空间所有权仍留在各函数 contract，不塞入纯谓词。
- case lib 必须使用 `Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.`。仅用 `Require Import` 虽能让 case lib 自身通过，但 generated goal 只导入 case lib 时不会获得共享谓词的非限定名，因而后续 goal/check 会失败。
- `xizi_circular_area_read` 的 2026-08-26 r1 实际复现了这一失效链：annotation 的 case-lib-only fixed check 通过，canonical symexec 也能生成文件，但首个 group-check 在 generated `xizi_circular_area_read_goal.v` 报 `CircularAreaDescriptorState` 不可见；直接导入共享库的 debug 对照可解析该符号。controller 接受该 group blocker 后，其余同版本 groups 必须写 `stale`，并从 accepted annotation worktree 创建 r2，只把 import 改为 export 后重新生成 `source_goal_version`。因此 annotation 质量门除 case lib 自编译外，还应检查“generated goal 仅经 case lib 导入能解析共享 spec”的传递可见性。
- 删除 local duplicate 或把 live branch 补上共享谓词都会改变 formal source；即使旧 manual proof 文本看起来可复用，也必须按新的 `source_version` / `source_goal_version` 重新执行 annotation-check-round、VC checking、group-check、parent verify 与 final-check。旧套件通过记录只能作为 proof-pattern 参考，不能作为本轮 acceptance evidence。
- 共享谓词把 `b_status` 从任意 int32 收紧为布尔状态，并把 `max_length` 的 live descriptor 收紧为完整有效 ring。这个取舍来自“所有 live descriptor 使用同一有效状态”的接口约束；若未来需要验证损坏/半初始化 descriptor 上的只读投影，应另建明确的 partial-state predicate，而不应弱化共享 live-state invariant。

## 2026-09-02 idmanager 风格资源和 Init

- 用户明确要求按函数顺序逐个验证，每完成一道先汇报；当前顺序为公共定义、Init、Reset、Read、普通 Write、force Write、查询、Release、调用点组合。
- `circular_area_state` 只暴露 `ca_capacity` 和逻辑 FIFO `ca_contents`。`store_circular_area` 内部 existential 管理 data/operations pointer、read/write index、status、physical option list 和 `UCharArray.mixed_full`；不再保留并行的 `CircularAreaBackingResource` / `CircularAreaDescriptorState`。
- Init 公开合同无实现级 `With`/exists：失败为 `retval = 0 /\ emp`，成功为 `retval <> 0 /\ store_circular_area (CircularAreaInitState requested) retval`。`CircularAreaInitState` 确定容量为 `(requested / 4) * 4`、FIFO 为 `nil`。
- 真实 C 的第二次分配失败会释放 descriptor，因此最终同样是 null/emp；不应向公开 spec 返回 partial descriptor 资源。
- Init 证明在函数内选择 `readidx=0`、`writeidx=0`、`status=0`、`physical=repeat None capacity`，并用 `UCharArray.undef_full_to_mixed_full` 建立统一资源；这个转换不应留给调用者。
- run `xizi_circular_area_init-20260902203539` 生成 20 个 automatic obligations 和 1 个 manual witness，全部通过；group 无新增 helper/import，parent/final fixed `goal_check` 通过。controller 的严格隔离 freshness replay 因当前仓库布局未配置而记录为 skipped，不得误报为 passed。

## 2026-09-02 统一资源 Reset

- Reset 公开 contract 只有一个 `With (state : circular_area_state)`：前置为 `store_circular_area state circular_area`，后置为 `store_circular_area (Build_circular_area_state (ca_capacity state) nil) circular_area`。容量保持，逻辑 FIFO 清空。
- QCP 不会自动展开 opaque `store_circular_area` 以获得可写字段。有效模式是在函数体内增加一个 full `Assert`，只在内部 existential 展开 descriptor/backing 资源和重建空状态所需的 capacity/physical-length 纯事实；不把它们泄露回 public `With`。
- 重建空 `CircularAreaLogicalState` 不需要暴露原 `ca_contents`：capacity 为正、physical 长度等于 capacity 即可建立 index=0/status=0/nil 的边界和 iff，live-byte 范围为空。
- run `xizi_circular_area_reset-20260902224500` 有 2 个 target manual witnesses，同组证明并通过 group/parent/final fixed checks；无 helper/import。`source_version=15a2a5b033e66fc8e731a9fe74303e05797c804a2ab0059105fb8eaee1448ed0`，`source_goal_version=3141c87f6ed81899c0588879ca2b34e2a5f7efaeb632c3b8e9d188193ee59137`。
- canonical annotation symexec 到函数末尾；controller final-check 的 strict isolated replay 因仓库布局未配置记录为 skipped，应与“生成文件已由 canonical symexec 刷新”的通过证据分开表述。

## 2026-09-03 统一资源 Read

- Read 的 public contract 只选择 `state : circular_area_state`；descriptor pointer、operations pointer、读写下标、status 和 physical option list 全部由 `store_circular_area` 隐藏。调用者另外提供输出缓冲区的 `UCharArray::mixed_full`，因此 Init 输出可直接调用 Read，`undef_full` 到 mixed 的转换不再留给调用点。
- `CircularAreaReadResult` 是 extensional FIFO 关系：错误分支返回 `ERROR=1` 并保持 state/output；成功分支返回 `EOK=0`，读取 `min requested logical_length` 个字节，state 变为 FIFO suffix，输出变为 `map Some prefix ++ old suffix`，capacity 不变。
- annotation r1 虽然 QCP 可走到 EOF，但把 `CircularAreaDivideRdData(...)` 从原始 `if` 条件中拆出并重复比较 descriptor 字段，属于未授权的可执行控制流变化，必须拒绝。r2 将调用恢复到原始条件，只通过 `where` 和 helper 的 existential post bridge 传递 hidden layout discriminator；去 annotation 后的 executable token comparison 为 0。
- internal helper 可以在 post 中 existential 打开同一个 representation，用于紧邻的实现分支判定；这不等于把 representation witness 放进 public `With`。这是兼顾原始调用点和统一 caller resource 的关键模式。
- group-local fixed check 通过仍不保证 parent merge 通过。本轮 `return_wit_5/6` 使用 `aggressive_pre_process` 在隔离组中通过，但在合并带 helper 的完整上下文中留下 incomplete proof；改为显式 `right; intros; unfold CircularAreaErrorResult; entailer!` 后 parent/final full check 通过。对分支型 postcondition优先显式选择语义分支，避免依赖上下文敏感搜索。
- run `xizi_circular_area_read-20260902235500` 共 36 个 target manual witnesses，按 8/10/7/11 四组全部证明。新增 3 个 group-suffixed helper；parent verify、final fixed `goal_check`、manual/case_lib contract 和 forbidden scan 全部通过。`source_version=3aa6db57967431e735ff9f6839c0d6619da93fabd84f838c0885b891c5509128`，`source_goal_version=ec4546d17bd3435b8f334dd17a85828f00132fbe9595a831d5816da470a7b8fe`。

## 2026-09-03 统一资源普通 Write

- 普通 Write 独立把 public precondition 固定为 `b_force == 0`。公开 ghost 只有 `state`、参数快照和调用者输入字节；所有 ring representation witness 都在 `store_circular_area` 内部，避免 force 的非规范状态结论污染普通调用点。
- `CircularAreaWriteResult` 的成功语义是 `actual = min(requested, capacity - Zlength(contents))`，post contents 为旧 FIFO 追加输入的 `actual` 前缀，capacity 保持；错误路径返回 `ERROR=1` 并保持 ring/input 所有权。输入数组使用 `full`，目标 backing 继续使用统一 `mixed_full` 并对 memcpy 区间精确拆分。
- 本轮保留真实 CRTOS 函数的全部 force 分支，但由前置 `b_force=0` 在证明中排除，不能删除死分支来降低 VC。去 annotation 后 432/432 executable tokens 一致。
- run `xizi_circular_area_write-20260903025248` 生成 31 个 manual witnesses，按 9/3/5/7/7 五组完成；仅新增 `circular_area_query_length__state_queries` helper。parent/final fixed checks 与结构扫描通过，`source_version=dbafbfd910c8b220d7292640fa522fb85a3fb3b937de2e7467d0ea33899a4b36`，`source_goal_version=7e4b5aef48d33f7a8e2f27dcf9be1a6581f755289877b2385ce885f6018de1e1`。

## 2026-09-03 统一资源 force Write

- 旧 `xizi_circular_area_force_write` 是三整数标量模型，不是 CRTOS 函数；本轮用真实 `CircularAreaWrite` 函数体替换，并在 public precondition 固定 `b_force != 0`。除 annotation 外，可执行 token 与普通 Write case 的真实函数体一致。
- 真实实现先把 actual length 截断为 `min(requested, free)`，成功后却无条件执行 `status=1` 和 `readidx=writeidx`。因此 underfill 时不能满足普通 `CircularAreaLogicalState` 的“等索引且 status=1 当且仅当 FIFO 满”约束。通用成功 post 必须返回 `store_forced_circular_area` raw resource，不能提供无条件 raw-to-`store_circular_area` bridge。
- raw state 只公开 capacity、forced index 和 exact physical option list；data/operations pointer 仍由资源谓词 existential 隐藏。`CircularAreaForceRawRecoverable` 与 `CircularAreaForceFillToCapacity` 只保留有明确前提的后续恢复接口。
- annotation r1 的 case lib 直接 import 普通 Write case artifact；该文件没有纳入 group worktree lineage，导致三组在编译目标前即失败。r2 将所有 force 专用定义局部化，只依赖公共 circular-area lib 和官方库，clean case-lib/full goal-check 均通过。跨 case 的 active formal import 若不在 lineage 中，不能作为可复现依赖。
- vc-checking r2 两次遗漏独立 `group_plan.json`，虽然 agent report 内有计划，controller 仍不能验收；主 agent 必须在 spawn 返回后先检查 handoff 要求的独立工件，再调用 controller review。
- outcomes 成功分支中，深层 `UCharArray.full` 的 pure fact 提取与 wrap/no-wrap physical segment merge 需要局部 atomic 重排；`repeat split` 容易把 `ForceWriteResult/raw bounds` 多目标焦点留错，显式顶层 split 更稳定。
- run `xizi_circular_area_force_write-20260903045012` 共 31 个 target manual witnesses，按 12/8/6/5 四组完成；outcomes 组新增 8 个 `__force_write_outcomes` helpers。parent/final fixed checks、manual/case-lib contract 和 forbidden scan 全部通过。`source_version=07faec602af00a85b492785296b2bba40247480a7d807bc6acf69c05bc37460b`，`source_goal_version=3821b0edd7e81141ba5f85a61f47d3664c3ab81f6ea9840dc86ac43f5a2514cc`。
