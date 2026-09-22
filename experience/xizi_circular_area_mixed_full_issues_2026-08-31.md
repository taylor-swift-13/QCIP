# Xizi 环形缓冲区 `mixed_full` 兼容问题与解决记录（2026-08-31）

> 2026-09-02 更新：本文早期所称的公开
> `CircularAreaBackingResource` 已被 idmanager 风格的
> `store_circular_area (state : circular_area_state) p` 取代。`mixed_full`、
> 物理 option list、环形下标和 status 仍保留，但现在全部隐藏在
> `store_circular_area` 内部；本文后续的 BackingResource 表述只作历史
> 问题分析，不再是当前公开接口。

## 1. 背景与约束

本轮目标是解决 `CircularAreaInit` 与其他环形缓冲区 API 之间的数组
资源不兼容，并重新验证真实调用链。

用户约束：

- 不修改任何可执行 C 语句；
- 允许修改 C annotation、Rocq 规格与证明；
- 不能把未初始化内存伪装成已初始化内存；
- 必须重新运行 QCP symbolic execution、manual VC 证明和最终检查；
- 最终还要验证 Init、Write、Read、DataLength、Release 等 API 的组合调用点。

本文记录的是问题分析、已经采用的解决方式和当前验证状态。尚未完成的
项目会明确标记，不能把阶段性通过误写成最终完成。

## 2. 最初发现的核心问题

### 2.1 Init 与其他 API 的数组谓词不兼容

`CircularAreaInit` 成功后，分配器只给出：

```text
UCharArray::undef_full(data_buffer, aligned)
```

这表示整块字节数组已经分配，但每个字节都可能尚未初始化。

原 Read、Write、DataLength、Release 等规格却要求：

```text
UCharArray::full(data_buffer, area_length, contents)
```

`full` 声明整个数组中的每个单元都有确定字节值。数组库只支持从
`full` 遗忘成 `undef_full`，不存在反向的
`undef_full -> full`。因此，不能从 Init 的成功后置条件建立其他 API
的原前置条件。

这不是缺一条辅助引理，而是原规格在内存初始化语义上过强。添加
`undef_full -> full` 会是不可靠的公理，不能采用。

### 2.2 为什么不能简单把所有接口都改成 `undef_full`

Read 必须证明 memcpy 的源字节已经初始化；Write 之后也必须记录哪些
单元获得了确定值。如果只保留 `undef_full`，虽然可以释放整块内存，
但无法证明 Read 不会读取未初始化字节，也无法描述 FIFO 内容。

因此需要一种介于 `undef_full` 和 `full` 之间的资源：保留整块分配，
同时逐单元记录“已初始化或未初始化”。

## 3. 统一解决方案：`mixed_full` + 逻辑 FIFO

公共资源采用：

```text
UCharArray.mixed_full data_buffer area_length physical
```

其中：

```text
physical : list (option Z)
```

- `Some byte` 表示该物理单元已经初始化；
- `None` 表示该单元仍未初始化；
- 整个数组的分配所有权始终存在。

新增的核心抽象如下。

### 3.1 `CircularAreaLiveBytes`

只要求逻辑 FIFO 当前有效区间对应的物理环形单元为 `Some byte`：

```text
logical[k]
  对应
physical[(readidx + k) mod area_length] = Some logical[k]
```

不在有效 FIFO 区间中的物理单元保持不受约束，可以是 `None`，也可以是
历史写入留下的 `Some`。

### 3.2 `CircularAreaLogicalState`

统一描述：

- `readidx`、`writeidx` 的范围；
- FIFO 长度不超过 capacity；
- `writeidx = (readidx + Zlength logical) mod area_length`；
- `b_status` 与满/非满状态的一致性；
- 逻辑字节范围为 0..255；
- `CircularAreaLiveBytes`。

### 3.3 `CircularAreaBackingResource`

统一拥有：

- `CircularArea` 结构体的全部字段；
- backing buffer 的 `mixed_full`；
- descriptor 地址和 backing 地址非空；
- `CircularAreaLogicalState`。

这成为 Init、Read、Write、DataLength、Release 和调用点 harness 之间的
唯一 canonical backing resource。

### 3.4 Init 的正确成功状态

Init 成功时设置：

```text
logical  = nil
physical = repeat None area_length
```

并利用数组库已有的 `undef_full_to_mixed_full`，把分配器返回资源转换为
`mixed_full`。这里没有构造任何虚假字节值。

### 3.5 Read/Write 的正确语义

- Write 只把实际写入区间更新为 `Some byte`，并扩展逻辑 FIFO；
- Read 只从 `CircularAreaLiveBytes` 保证为 `Some` 的区间读取；
- 回绕时将数组拆成两个 mixed segment 分别处理；
- Read 后逻辑 FIFO 变为 suffix，read index 按模推进；
- 不要求已经离开 FIFO 的 dead cells 恢复为 `None`。

## 4. 重新证明过程中发现的 annotation 问题

这些问题都不能靠 tactic 硬绕，因为生成的 VC 存在具体反例。

### 4.1 参数地址等式没有传递到 helper 返回 VC

多次出现以下资源不匹配：

```text
前件拥有 ca0 上的结构体字段
后件却要求 circular_area_pre 上的 BackingResource
```

如果没有：

```text
circular_area_pre = ca0
```

就不能把一个地址上的 points-to 资源迁移到另一个任意地址。

同类问题也出现在 `CircularAreaDivideRdData`：生成目标使用独立的
`data_length_pre`，但分支条件约束的是本地 `d0`。

最终解决方式不是继续增加局部 Assert，而是让 helper 的 Ensure 直接
使用稳定 ghost 名 `ca0`、`d0` 描述返回资源和结果。验收时直接扫描
generated VC，确认 helper 返回中不再出现错误的 `*_pre` 资源根。

### 4.2 展开 BackingResource 后丢失 non-null 事实

`CircularAreaBackingResource` 的纯部分要求：

```text
ca0 <> 0
data_buffer <> 0
```

但一些 Assert 将资源展开成字段 points-to 和 `mixed_full` 后，没有继续
保留这两个纯事实。当前内存模型中的 `isvalidptr_char` 允许地址 0，因此
不能从数组空间谓词反推出 `data_buffer <> 0`。

解决方式是在展开资源后的必要控制流节点显式保留已有的 non-null ghost
事实，并检查成功 return witness 的 antecedent 中确实存在这些事实。

### 4.3 输出指针非空事实在 Read 分支中丢失

入口宏已经检查 `output_buffer != 0`，但部分成功路径生成的 pure witness
要求 `out0 != 0` 时，前件没有保留该事实。地址 0 同样不能由数组谓词排除。

解决方式是将 `out0 != 0` 保持到所有成功读分支，而不是强化底层数组库。

### 4.4 output capacity 界丢失

memcpy 的目标切片需要：

```text
actual_read_length <= output_capacity
```

某些中间 Assert 只记录了 FIFO/capacity 关系，没有记录请求长度与输出
数组容量的关系，导致切片不能合法重组。

解决方式是从入口的 `requested <= output_capacity` 和
`actual = min(requested, logical length)` 保留该界到两个 memcpy 分支。

### 4.5 memcpy 后没有保留完整逻辑状态

部分 generated pure VC 只含 `CircularAreaLiveBytes` 和切片关系，却要求
重新建立完整 `CircularAreaLogicalState`。LiveBytes 本身不能推出
write-index 方程、`b_status` 等价关系和所有范围条件。

解决方式是在资源切分/合并 Assert 中同时保留原完整 LogicalState；Read
最终再通过 consume-prefix helper 证明新的 suffix LogicalState。

## 5. 调用点 harness 发现的返回码错误

生产 Read/Write 定义为：

```text
EOK   = 0
ERROR = 1
```

旧调用点 harness 却把成功和失败的返回码方向写反：

- Read live-one 被写成返回 1；
- empty/error 分支被写成返回 0；
- Write success 也按返回 1 建模。

因此旧 harness 即使完成证明，也不能作为真实生产 API 的组合合法性证据。
必须修正返回规格后重新跑完整 harness。旧结果应视为语义 stale。

## 6. QCP v2.1.0 工具问题

### 6.1 `NONE ((void *)0)` 宏解析问题

官方 v2.1.0 会错误地尝试把任意 object-like macro 当作 `#if` 整数表达式
求值，遇到 `((void *)0)` 的 `void` token 后失败。

当前 launcher 只在临时副本中把这一条精确宏替换为 0，并保留原路径和
行号用于诊断；仓库 C 文件没有被修改。

### 6.2 MCP 交互函数参数丢失

官方 MCP 进入已解析函数时调用：

```text
cpd_define_param(info->name, NULL, env)
```

这会把已有参数函数当作零参数函数重新声明。修复为从已解析的
`func_info->param` 导入交互 scope。

### 6.3 MCP 的假 `mul overflow`

Read wrap 分支在 direct canonical symexec 中成功，但 qcp-mcp 报：

```text
mul overflow
```

诊断捕获到具体数据：

```text
m1 = -2
r1 = 0
```

真实乘积是 0。v2.1.0 使用只适合正乘数的除法边界检查负乘数，并且一个
上界分支误读了另一个系数，因此产生假阳性。

修复为在 `__int128` 中计算真实线性组合，再判断结果是否落入 solver 的
32 位系数范围。同时用宽整数计算 lcm，避免中间乘法的 C 整数溢出。

修复后回归结果：

- LLM `simple_arith/add.c`：MCP `proved`；
- CircularArea Init：MCP 正常生成 3 个 manual obligations；
- Read 原失败的 `<symbolic>505</symbolic>`：返回 `result=success`，不再出现
  `mul overflow`。

补丁和二进制来源记录位于：

```text
linux-binary/UPSTREAM-v2.1.0.md
linux-binary/patches/qcp-v2.1.0-mcp-compat.patch
```

## 7. 当前验证状态

截至本文记录时：

- Init：已按 canonical mixed backing 重新证明；
- Release：已证明能消费 mixed backing，不要求数组 full；
- DataLength：已证明保持 canonical resource；
- Read：annotation、QCP 和 VC 语义检查已多轮收敛，最终 Rocq group proof
  仍在主验证流程中执行；
- Write：尚需按同一 mixed model 完成重新规格和证明；
- 调用点 harness：必须修正 Read/Write 返回码后重新验证；
- 不应在 Read、Write 和修订后的 harness 全部 final-check 通过前声称
  “所有调用点已经合法”。

## 8. 后续验收清单

每个 API 和最终调用点必须同时满足：

1. executable-C normalized hash 不变；
2. canonical symexec 使用规定 `-I/-slp` 参数并到 EOF；
3. qcp-mcp 到 EOF；
4. generated manual witness 集重新冻结并全部证明；
5. fixed `coqc_check` 通过；
6. manual proof 无 `Admitted`、无额外 helper 声明；
7. case lib helper 均已证明、名称带 group suffix、无额外 Axiom；
8. freshness 检查确认重新生成的 witness statement 与最终证明一致；
9. 调用点使用真实返回码 `EOK=0`、`ERROR=1`；
10. Init 后的资源能够依次建立 Write、Read、DataLength、Release 的前置条件。

## 9. 可复用经验

- 初始化状态未知时，不要把“已分配”误写成“已初始化”；使用 option-valued
  physical model。
- `mixed_full` 只解决物理初始化状态，不自动提供地址非空、参数别名或
  高层逻辑状态；这些纯事实必须显式传递。
- 遇到空间资源基址不同，先检查 generated VC 的 binder/alias，而不是先写
  更强的 separation-logic tactic。
- `coqc` 编译通过不等于所有 assigned witnesses 已解；输入 skeleton 中的
  `Admitted` 仍可能使 partial group-check 返回 0。
- direct symexec 与 MCP 结果不一致时，应记录具体系数/状态并审计交互层，
  不能修改目标 C 来规避工具 bug。
- 调用点 harness 必须与生产常量和实际 return 分支逐项核对；组合证明只在
  API 返回语义真实时才有意义。

## 11. Init 最新重证结果（run `xizi_circular_area_init-20260831164429`）

- Init 的公开成功后置条件直接返回统一 `CircularAreaBackingResource`；
  `undef_full` 只作为 allocator 的内部中间资源，并在 Init 证明中通过
  `UCharArray.undef_full_to_mixed_full` 转为 `repeat None` 的 `mixed_full`。
- descriptor 分配失败直接返回空指针；buffer 分配失败释放 descriptor 后返回；
  两条失败路径最终都是 `emp`，不再使用泄漏 descriptor 的失败资源。
- Init case lib 必须直接 `Require Export` 共享 `QCIPLib`。通过另一个未跟踪的
  callpoint case lib 间接导入，会导致 accepted round 可编译、group worktree
  却丢失依赖。
- group-check 仅导入缓存 manual `.vo` 可能产生假阳性。本轮 parent fresh check
  捕获了未闭合 bullet；重试时要求修改后 manual 的源码 hash 与 build workspace
  一致，且 `.vo` mtime 晚于源码，随后 parent full check 才接受。
- 最终唯一 witness 为 `proof_of_CircularAreaInit_return_wit_1`；无需新增 helper。
  fixed goal-check、manual/case-lib contract、forbidden lemma 扫描和 isolated
  canonical symexec freshness 全部通过。

## 10. 公共定义统一（2026-08-31）

为避免 callpoint 私有库和公共库各自维护一套状态定义，表示层已集中到：

```text
QCIPLib/xizi/xizi_circular_area_common/xizi_circular_area_lib.v
```

该文件现在是以下定义的唯一 active source：

- `xizi_circular_area_uninitialized`；
- `CircularAreaLiveBytes`；
- `CircularAreaLogicalState`；
- `CircularAreaBackingResource`；
- `CircularAreaAlignedLength`；
- `CircularAreaInitFailureResource`。

callpoint case lib 改为 `Require Export` 公共库，只保留调用点专用的返回结果
包装。公共库和 `OUTPUT` 镜像内容及 SHA-256 一致；公共库、callpoint 库、
七个直接依赖 case lib 和 callpoint `goal_check` 均通过 fixed Rocq 8.20.1
检查。

旧 `CircularAreaDescriptorState` 目前只作为兼容投影保留，供尚未逐函数迁移
的 fully-initialized case 使用。它不包含逻辑 FIFO、live-byte 初始化关系和
完整 backing ownership，不能再作为 canonical 状态。公共库 digest 的变化
也意味着旧 suite 验收证据仅可作历史参考；各函数迁移时必须生成新的
`source_version` / `source_goal_version` 并重新 final-check。

## 12. Read 最新重证结果（run `xizi_circular_area_read-20260831205615`）

- `CircularAreaRead` 可以直接消费 Init 返回的 canonical `mixed_full`：证明只把
  `CircularAreaLiveBytes` 保证为 `Some` 的 FIFO live 区间拆成一个或两个切片，
  不要求、也没有假设整个 backing buffer 可转换成 `full`。
- accepted annotation worktree 中通过未跟踪的 generated callpoint case lib 间接
  导入共享定义，会在 group worktree 中丢依赖。修正为 Read case lib 直接
  `Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib`，
  并在本 case 中定义严格、外延的三个查询结果谓词。
- 最终 36 个 target witnesses 分成五组：查询状态 8、长度与读区间拆分 9、
  调用归一化 6、拷贝切片 7、Read 后置条件 6；全部通过 group-check 和 parent
  full fixed check。
- case lib 只新增一个带当前 group suffix 的 proved helper：
  `CircularArea_empty_result_zero_length_pos__read_call_normalization`。
- final-check、forbidden lemma 扫描和 isolated canonical symexec freshness 均通过；
  刷新后的 goal/auto 逐字节一致，清洗后的 36 个 witness 名称及 statement hash
  与最终证明完全一致。

## 13. status 位统一定义修正（2026-09-01）

生产实现并不把 `b_status` 当作全局的“是否为满”布尔值。每次成功 Write 都
写 1，每次成功 Read 都写 0；只有 `readidx = writeidx` 时，status 才用于区分
满和空。因此旧共享不变量

```text
b_status = 1 <-> logical length = capacity
b_status = 0 <-> logical length < capacity
```

会错误排除普通部分 Write 后 `readidx <> writeidx /\ b_status = 1` 的真实状态，
也会排除部分 Read 后 `readidx <> writeidx /\ b_status = 0` 的真实状态。统一定义
现改为：status 必须为 0/1；`readidx = writeidx /\ status = 1` 当且仅当逻辑长度
为 capacity；`readidx = writeidx /\ status = 0` 当且仅当逻辑长度为 0。索引不等
时允许任一 status 值。

canonical common lib 与 OUTPUT mirror digest 均为
`5de2bf685d10d4e3137818d267f66f6117d84b17a8b2c68ba77e835bbc22c8c7`，
common lib fixed check 已通过。suite aggregate 随后在旧 Read helper 处失败，
这是预期 stale 传播证据，不是回滚理由；所有依赖旧定义的函数必须在新 digest
下重新生成并重证，不能沿用旧 final-check。

## 14. IsEmpty 统一状态重证（run `xizi_circular_area_is_empty-20260901073827`）

- 查询函数的规约应消费并原样返回同一个 `CircularAreaLogicalState` existential，
  包括逻辑 FIFO、物理 option-byte 列表和 `UCharArray::mixed_full`。查询不需要、
  也不应把 mixed buffer 转换成 full。
- 在修正后的 status 不变量下，empty 的精确定义是
  `readidx = writeidx /\\ b_status = 0`；索引不等时无论 status 为 0 还是 1 都
  返回 0。这与 Write 后 status=1、Read 后 status=0 的真实状态都兼容。
- 5 个 target witnesses 在单一 group 内完成，无 helper/import 新增；parent full
  check、final-check 和 isolated canonical symexec freshness 均通过。
- vc-checking r1 虽然语义判断正确，但遗漏 `group_plan_ready`、
  `checked_target_witnesses` 和 `attempt_id`，controller 按 `invalid-report` 拒绝；
  r2 补全 schema 后 accepted。以后 fixed phase report 必须同时满足语义与 handoff
  schema，不能把语义正确当作可接受报告。

## 15. GetDataLength 统一状态重证（run `xizi_circular_area_data_length-20260901083618`）

- 为避免 return VC 中出现无约束的 `circular_area_pre`，null/state 规格应拆开；
  非空 state spec 显式保留 `circular_area = circular_area@pre = area_addr`。只在
  Ensure 中补当前地址等式不足以把 pre-state 桥带入生成命题。
- 非满分支不能把 C 的 uint32 减法直接视为整数减法。本轮用带 group suffix 的
  `circular_area_unsigned_nonfull_mod_length__data_length_query` 分正负两种差值，
  先证明两层 `mod 2^32` 的归一化，再复用共享 modulo-length lemma。
- group-check 只验证 assigned wrapper 时可能漏掉完整 manual 中的开放目标。本轮
  第一次 parent full check 在 null disjunction proof 发现 incomplete proof；修复后
  同时要求 group worker 运行完整 fixed source check，再进行 parent retry。
- 最终 14/14 target witnesses、parent/full/final check 和 isolated freshness 均通过；
  查询前后保留同一 `CircularAreaLogicalState` 与 mixed buffer ownership。

## 16. Reset 统一状态重证（run `xizi_circular_area_reset-20260901102916`）

- Reset 不清空 backing cells，因此规约不能要求 `UCharArray::full`，也不能把
  physical list 改成全 `Some 0`。正确转换是保留同一 `mixed_full physical`，仅将
  logical FIFO、readidx、writeidx、status 变为 `nil,0,0,0`。
- 空 logical 的 `CircularAreaLiveBytes` 条件是 vacuous；结合原状态的 capacity、
  physical length 和 descriptor ownership，可直接重新闭合共享状态。
- 真实 C 无 null guard，会直接解引用 descriptor；统一规约只允许有效非空状态，
  不能为了调用方便虚构 null 成功/失败分支。
- 最终 1/1 witness，无 helper/import，parent/full/final 和 isolated freshness 通过。

## 17. GetMaxLength 统一状态重证（run `xizi_circular_area_max_length-20260901112029`）

- 只读查询也必须消费并原样返回完整 `CircularAreaBackingResource`，不能退化为
  descriptor-only state 或把 `mixed_full` 加强成 `full`；这样 Init、Write、Read、
  Reset 后的任意合法统一状态都可以直接调用。
- 如果 annotation 在 callpoint 展开 backing resource，返回 VC 必须保留
  `data_buffer != 0`。第一轮遗漏该桥，导致字段和 mixed buffer 都还在，却无法
  重折叠共享 resource；第二轮把非空事实显式加入 pre-read assertion 后解决。
- qcp-mcp 工具未暴露为外层 callable tool 时，可通过仓库自带
  `mcp/qcp-mcp/.venv` 和 Python API 走真实 `initialize/check/symbolic/close` 链，
  但 evidence 仍须记录实际 backend、cwd、`-I` 和 `-slp` 参数。直接调用 symexec
  不能冒充 qcp-mcp interactive evidence。
- 最终 3/3 witnesses，无 helper/import；parent/full/final fixed check 与隔离
  canonical symexec freshness 均通过，goal/auto byte hash 和 witness statement
  hash 全部一致。

## 18. DivideWrData 统一状态重证（run `xizi_circular_area_write_advance-20260901131444`）

- 写入跨尾判断只是对 `writeidx`、`data_length` 和 capacity 的只读查询，规约不应
  取得 `UCharArray::full`。改为消费并原样返回统一 `CircularAreaBackingResource`
  后，可直接在 Write 的 mixed buffer 调用点使用。
- 由于 capacity 与参数上界均不超过 256，C 的 uint32 加法不会溢出；结果关系可
  精确写成 `writeidx + data_length <= area_length` 返回 0，否则返回 1。
- annotation 需要显式保持函数参数和 pre-state existential 的地址桥，否则生成 VC
  会出现当前 `circular_area` 与资源地址脱节，即使资源本身完整也不可证。
- 最终 3/3 witnesses，无 helper/import；qcp-mcp、parent/full/final 与隔离 freshness
  全部通过。

## 19. DivideRdData 统一状态重证（run `xizi_circular_area_read_advance-20260901140736`）

- 与写跨尾判断一样，读跨尾判断只读取 index/capacity；统一合同应保留同一个
  `CircularAreaBackingResource` 和 `mixed_full`，而不是要求整个 buffer 已定义。
- annotation-checking 能通过不代表生成的 return VC 一定可证。第一轮生成目标中的
  `data_length_pre`、`circular_area_pre` 在前件完全无约束，却在后件要求与入口值
  相等；vc-checking 正确将其退回 annotation，而不是尝试硬证。
- 第二轮显式绑定 current parameter 与 pre-state existential 后，新的三个 manual
  obligations 都携带所需等式，并在单组内全部证明，无 helper/import。
- parent/full/final 和 isolated freshness 通过；goal/auto byte hash、三个 witness
  statement hash 全部一致。

## 20. Init 在修正共享定义下重验（run `xizi_circular_area_init-20260901153825`）

- `undef_full` 只应出现在 allocator 的内部 postcondition。Init 的公开成功结果必须
  把它封装为 `repeat None` 物理列表对应的 `CircularAreaBackingResource`，从而直接
  暴露 `mixed_full`，不能要求调用者先做 undef-to-mix 转换。
- descriptor 分配失败直接返回 null/`emp`；buffer 分配失败先释放 descriptor，再
  返回 null/`emp`。本轮两类失败分支都由 symbolic execution 自动闭合，没有资源
  泄漏 postcondition。
- 修正后的 status 语义仍允许初始 `readidx=writeidx=status=0` 且 logical=nil；因此
  Init 当前 annotation 无需改动，但必须在当前 common lib 下重新跑完整证据。
- 最终 20 auto + 1 manual，全量 parent/final 与隔离 freshness 通过；成功返回 proof
  无需新增 helper/import。

## 21. Read 在修正共享定义下重证（run `xizi_circular_area_read-20260901162856`）

- 旧 Read case lib 中“`status <> 0` 全局蕴含满”的 helper 在真实实现下是假的：
  普通 Write 成功后，即使读写下标不等，status 也会保持 1。修正后的 helper 只在
  `readidx = writeidx` 前提下推出满；判断非空则直接证明 logical list 非空。
- Read 继续只消费 `CircularAreaLiveBytes` 保证已初始化的 live slice。非回绕复制
  一个 slice，回绕复制尾、头两个 slice；背板其余 `None` cell 原样保留，所以无需
  也不能把整个 `mixed_full` 加强成 `full`。
- 36 个 target witnesses 分为查询状态、长度/跨尾、复制调用点、返回与纯条件四组，
  全部完成；各组均未新增 helper 或 import。parent full check、final-check 和隔离
  canonical symbolic execution freshness 均通过。
- 隔离刷新后的 goal/auto 与正式文件逐字节一致，36 个 manual witness statement
  mapping digest 为
  `b364404199a5ae80d7a95335ec20dad88e7fb789e93add5a24455778f4db8707`。

## 22. Release 统一资源重证（run `xizi_circular_area_release-20260901182500`）

- 真实 C 没有 null guard，会立即写 descriptor 字段；因此 Release 合同只接受有效
  非空 `CircularAreaBackingResource`，不能虚构 null 输入的 no-op 或错误分支。
- 释放前无需把 backing buffer 从 `mixed_full` 转为 `full`。统一资源展开后，物理
  option-byte list 和整段 mixed allocation 直接满足 buffer `x_free` 的消费合同；
  descriptor 字段被置零后满足第二个 `x_free` 合同，最终严格得到 `emp`。
- 旧 case lib 间接导出 generated callpoint-spec lib，破坏唯一 active shared-lib 边界；
  本轮改为直接 `Require Export` tracked common circular-area lib，再重新生成并重证。
- 最终 1/1 manual witness，无 helper/import；parent/full/final check 与隔离 canonical
  freshness 全部通过。goal/auto 逐字节一致，manual statement hash 一致。

## 23. 调用点组合重建（run `xizi_circular_area_callpoint_specs-20260901193000`）

- 旧 callpoint declarations 虽曾生成证明，但没有忠实复用真实合同：非 force Write
  成功实际返回 EOK=0并设置 status=1，旧声明却写成返回1/status=0；空 Read 实际
  返回 ERROR=1，旧声明写成0；Read 输出 buffer 也把 `undef_full` 当成可直接消费。
  当前 common lib 下旧 full check 在 repeated-write proof 明确失败，应整体视为 stale。
- 新组合 case 修正上述三项，所有普通调用链只在同一个
  `CircularAreaBackingResource` 上演化。Init failure 是 null/emp；查询保留资源；
  Reset 保留 mixed physical；Release 消费到 emp。
- 一般 force Write 不能保证 canonical FIFO：当 requested 小于 free space 时，真实 C
  仍把 readidx 设成新 writeidx 且 status=1，可能把未初始化 cell 宣称为 full。因此
  组合规格保留 raw `CircularAreaForceWriteResource`，不允许它直接调用 canonical
  consumer。只有 fresh capacity=4 且恰写4字节时，物理四格均初始化，才由
  `CircularArea_force_full_fresh_to_backing__state_bridge_and_force_full` 恢复 full state。
- CRTOS 当前唯一实际 circular-area Write 调用点传 `b_force=0`，因此当前生产调用不走
  raw force 风险分支；该风险仍作为 API 层限制记录，不能靠证明隐藏。
- 8 条组合链、19/19 witnesses、parent/full/final check 和隔离 freshness 全通过；
  goal/auto 逐字节一致，manual statement mapping digest 为
  `76013a6fa9864596fdd8d6aff163f2f9737ab133917f51f4979d4df87aa6fe20`。

## 24. Read 输出合同统一（run `xizi_circular_area_read-20260902131921`）

- 用户要求只修改 `CircularAreaRead`，并在旧证明基础上增量适配，不能把已有证明丢弃后重写整套 case。
- 旧正式 Read 成功分支没有声明返回 `EOK=0`，导致调用者不能从正式合同推出成功返回值；本轮把该等式加入唯一通用成功分支。
- 输出缓冲区从 `UCharArray::full` / `list Z` 改为 `UCharArray::mixed_full` / `list (option Z)`。成功后的精确状态为 `map Some bytes ++ untouched_suffix`，因此 `full` 与 `undef_full` 都可先转为 `mixed_full` 后调用，且不会虚构未写后缀已经初始化。
- empty-one 与 live-one 是同一通用 Read 合同的两个实例：空 logical 返回 `ERROR=1` 且资源不变；非空 logical 返回 `EOK=0`，消费 FIFO 前缀并把输出前缀变成 `Some`。
- 36 个 generated manual witnesses 沿用旧 FIFO、索引、跨尾和 slice 证明结构，分四组完成；未新增 helper/import。四个 group-check、parent full check、final fixed `goal_check`、manual/case_lib 合同与 forbidden-lemma 扫描全部通过。
- annotation-check-round 的 canonical symexec 到达文件尾。controller final-check 的严格隔离 freshness replay 因当前仓库布局未配置而记录为 `skipped`；不能把这一项误报为独立 freshness 通过。

## 25. Read/Write 入口快照改用 `@pre`（runs `*-2026090810000{1,2,3}`）

- 用户要求删除仅用于保存 C 参数入口值的 `With`：Read 的 `ca0/out0/requested/d0`，普通 Write 与 force Write 的 `ca0/in0/requested/d0`。`state`、`LitMap`、输入内容、输出容量和输出旧内容等真正的逻辑参数仍由 `With` 量化，不能误删。
- QCP 对含多个 `Require` 分支的规格不能直接确定 `@pre` 属于哪个入口分支，会报 `pre at branch <unspecified> is not determined`。稳定设计是把原有 nullable 分支等价封装成一个 `Assertion`：`CircularAreaReadInput`、`CircularAreaWriteInput`、`CircularAreaForceWriteInput`，从而让公开规格只有一个 syntactic entry，再统一使用 `circular_area@pre`、buffer `@pre`、`data_length@pre` 和 `b_force@pre`。
- 不能只在 Require/Ensure 边界机械替换名字。函数体内调用 helper 前仍需保留 current parameter 与 `@pre` 的桥，否则生成的 return VC 会出现无约束的 `*_pre` 地址。这里的桥是入口值保持事实，不是恢复快照 `With`。
- Read 37/37、普通 Write 32/32、force Write 30/30 manual witnesses 均完成；三者 canonical symexec、group checks、parent full check、final fixed `goal_check`、manual/case_lib/forbidden scan 全部通过。final-check 的严格隔离 freshness 因仓库布局未配置而明确记为 `skipped`。
- parent merge 暴露了 group-check 未显式关闭的 `CircularAreaErrorResult 1` pure side goal。稳健做法是在真实 merged context debug 中复现，改用明确的 `pre_process` 分支并显式 unfold 结果谓词；不能把 group-check 单独通过当成 parent acceptance。
- force Write 的语义例外保持不变：一般成功仍返回 raw forced resource；只有满足恢复前提时才能 bridge 回普通 FIFO `store_circular_area`。入口改为 `@pre` 不改变或掩盖该实现风险。

## 26. DivideRdData 删除 `d0`（run `xizi_circular_area_read_advance-20260909120000`）

- 用户要求将 `CircularAreaDivideRdData` 公开 `With` 中仅保存入口长度的 `d0` 改为 `data_length@pre`；可执行 C 语句不改。
- 在 `Require` 中入口参数本身就是前态，应用 `data_length`；在 `Ensure` 和函数体完整 `Assert` 中需要引用入口值时用 `data_length@pre`。
- 不能在旧的 null/state 两个独立规格分支上机械替换：QCP 会报 `pre at branch <unspecified> is not determined`。稳定方法是把两种入口语义等价封装为单个 predicate-first `CircularAreaDivideRdDataInput`，从而建立唯一 syntactic entry。
- 第一轮的局部 `which implies` 虽能让 symexec 到文件尾，但不满足完整 `Assert` 质量合同；不应作为最终修复。该轮还因过宽搜索命中 `QCP_demos_human` 而被 controller 拒绝，后续轮次必须只读 handoff 允许的参考路径。
- 最终 canonical symexec 生成 4 个 manual obligations，4/4 已证，无 helper/import；group-check、parent fixed check、final fixed `goal_check`、freshness 和 formal hygiene 全部通过。
