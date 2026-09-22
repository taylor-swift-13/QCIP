# 双链表「remove 非空哨兵」分析：斩首调用点清单、偏移几何与完备性证明

> 分析对象：`/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread`（哨兵普查覆盖全树）
> 姊妹篇：《REMOVE_SELFLOOP_NODE.md》（remove 自环节点：no-op 不变量、依赖清单与失效边界）
> 版本：v4（2026-09-15）——替代 v1–v3 的 SENTINEL_DELETION_SMP_CONCURRENT / NONCONCURRENT 两份；按 remove 语义重组；全部结构体偏移经 `_Static_assert` 机器验证；全部调用点经源码逐行核对
> 行号基线：2026-09-15 工作区快照

---

## 0. 判据：什么叫「remove 非空哨兵」

`DoubleLinkListRmNode(X)`（double_link.c:71-78）对参数不做任何校验，盲做四写：

```c
① X->node_next->node_prev = X->node_prev;   // :73
② X->node_prev->node_next = X->node_next;   // :74
③ X->node_next = X;                          // :76
④ X->node_prev = X;                          // :77
```

- **X 自环**（`next == prev == X`）：四写全是把原值写回原处，恒等 no-op（见姊妹篇）。
- **X 是非空哨兵 H**（`H->next == 首节点 A ≠ H`，`H->prev == 尾节点 Z ≠ H`）：**四写全部真实生效**——①②把 A、Z 互链成环，③④把 H 自环：
  - `IsDoubleLinkListEmpty(H)`（double_link.c:86-89，判 `node_next == head`）失真为「空」；
  - A…Z 形成没有入口的孤儿环：pend 在该队列上的任务**永久丢失唤醒**；后续 give/pend/insert 从 H 继续走错分支。

哨兵与自环节点在字节层面同构，区别只在**入口身份**：有代码以它为遍历/判空/插入锚点（`DOUBLE_LINKLIST_FOR_EACH`、`IsDoubleLinkListEmpty`、`InsertNodeAfter`）。非空哨兵 = 活入口 + 挂着 waiter，remove 即**斩首**。

**直接以哨兵为参数的调用点不存在**（kernel/thread 全部 22 个字面 RmNode 调用点传的都是成员节点）。删非空哨兵只能间接发生：`RmNode(&死对象->member)` 的目标地址 `chunk_base + member_offset` 恰好等于复用该 chunk 的新对象的哨兵字段地址——**偏移重合**。

---

## 1. 调用点清单（ILP32 共 4 个；RV64 为 3 个）

| # | 调用点 | 目标成员@偏移 | 复用者哨兵@偏移 | UAF 入口链 | 前置闸门 |
|---|--------|--------------|----------------|-----------|---------|
| 1 | `zombierecycle.c:52`（回收线程） | TaskDescriptor.sched_link@16 | Semaphore/Event.pend_list@16 | S4 双删重插僵尸队列 | **无** |
| 2 | `assign.c:245` / `smp_assign.c:385`（ready remove） | TaskDescriptor.sched_link@16 | 同上 | `KTaskDelete` id-gap（ktask.c:80 解锁 → :940 裸删） | `_DeleteKTask` 无 stat/CLOSE 检查；仅名字排除 idle/回收线程（ktask.c:649-652），复用字节永不命中 |
| 3 | `event.c:70`（`_EventDelete` 第二次删除） | Event.link@24 | MsgQueue.send_pend_list@24 | S9 查删缝隙双删 | **无**（`:68` IdRemoveObj 找不到即静默返回，`:70`/`:73` 无条件执行） |
| 4 | `ktask.c:616`（`_StartupKTask`） | TaskDescriptor.sched_link@16 | 同 1/2 | `StartupKTask` id-gap | `JudgeKTaskStatIsInit`（ktask_stat.c:73-77，`(stat&0x07)==0x00`）：chunk+4 为对齐指针低字节时 bit2=0 即放行（ILP32 约 50%，RV64 8 字节对齐恒为 0 → 恒放行） |

### 被自身闸门结构性排除的 `ktask.c:420`（重要反例）

`:418` 闸门 `JudgeKTaskStatIsSuspend` 要求 `(stat & 0x07) == 0x02`。stat 在 chunk+4；哨兵重合的复用类型（Semaphore/Event）在 chunk+4 处恒为 `id.link.node_next`——**对齐指针低字节 `&0x07 ∈ {0,4}`，永不等于 2**，闸门恒拒。其余复用类型要么 chunk+4 不是指针（Delay.ticks、字符串、原始数据）但那些类型在 chunk+16 没有哨兵。

结论：**偏移重合 ≠ 可达**。`:420` 的伤害降级为——复用为 SUSPEND 的新任务描述符时摘除该新任务的 `sched_link`（节点级，错对象），以及 `:424` 把野 task 插入就绪向量（调度级，后续 assign.c:245 + 切换到死栈）。它不删哨兵。

---

## 2. 偏移几何（`_Static_assert` 机器验证，ILP32）

野 RmNode 目标偏移集合（全部可达死对象的调用点）：

```
{4, 12, 16, 24, 28, 40, 64, 72, 92}
```

全树堆分配对象内嵌哨兵（`InitDoubleLinkList` 初始化、x_malloc 分配）偏移集合：

| 哨兵 | 偏移 | 宿主分配方式 |
|------|-----|-------------|
| Semaphore.pend_list / Event.pend_list | **16** | x_malloc（semaphore.c/event.c create） |
| MsgQueue.send_pend_list | **24** | x_malloc |
| Mutex.pend_list | 20 | x_malloc |
| MsgQueue.recv_pend_list | 32 | x_malloc |
| Pmp.tor_list / tor_swap_list（RV32） | 52/60 | x_malloc（pmp.c:151） |
| MemGather.wait_task（KERNEL_MEMBLOCK） | 68 | CreateMemGather |
| WaitQueue.block_threads_list | 0 | 调用者提供；且无任何目标偏移为 0 |

交集 = **{16, 24}** → 恰好对应 §1 的 4 个调用点。

关键结构体偏移（ILP32，KERNEL_EVENT 开、无 SMP/SEPARATE_COMPILE；sched_link@16 在 KERNEL_EVENT/SMP/PRIO_MAX 变化下均稳定，仅 SEPARATE_COMPILE 前移）：

| 结构体 | 关键成员偏移 | sizeof |
|--------|-------------|--------|
| TaskDescriptor | sched_link@16、delay@28(指针)、name@32、stack_start@80、exstatus@88、link@92、id@100(id.link@104) | 116 |
| Semaphore | id@0(id.link@4)、value@12、pend_list@16(HEAD)、link@24 | 32 |
| Event | id@0、bitfield@12、pend_list@16(HEAD)、link@24 | 32 |
| Mutex | id@0、val@12、holder@16、pend_list@20(HEAD)、link@28 | 36 |
| MsgQueue | id@0、msg_buf@12、each_len@20/max_msgs@22(uint16)、send_pend_list@24(HEAD)、recv_pend_list@32(HEAD)、link@40 | 52 |
| Timer | id_node@0、name@12、active_status@44、func_callback@48、origin@56/deadline@60、link@64、sortlist@72、t_work@84 | 92 |
| Delay | task@0、ticks@4、status@8、link@12 | 20 |
| IdNode | id@0、link@4 | 12 |

**LP64/RV64 delta**：sched_link@32；Semaphore/Event.pend_list@32 → 调用点 1/2/4 仍重合（3 个保留）；Event.link@48 × MsgQueue.send_pend_list@40 不重合 → 调用点 3 出局。

---

## 3. 完备性证明

- **目标侧**：kernel/thread 全部 22 个字面 RmNode 调用点逐一审计可达性（id 闸门、stat 闸门、锁范围、调用入口），能打到死对象的偏移集合即 §2 的 9 个值。间接 `ready_vector_done->remove()` 站点（ktask.c:105/268/320/374/551/578/656 等 15 处）全部汇入 assign.c:245 / smp_assign.c:385。
- **哨兵侧**：全树 `InitDoubleLinkList` + `DoubleLinklistType` 成员普查。BSS 全局哨兵（KTaskZombie、k_sem_list、就绪向量头、id 桶头、各 resources 驱动链表、bus_linklist、USB host 数组等）不参与 chunk 复用；PMP/MemGather 堆哨兵偏移不重合；`PmpRegionTor.link@28` 与 Mutex.link@28 重合但它是**节点**不是哨兵。
- **不可静态枚举的两类**（不计入调用点清单）：① 小对象复用大 chunk 时 `chunk+k` 落进相邻分配（堆布局依赖）；② 野 RmNode 写①②透写野字节当地址，地址级巧合命中 BSS 哨兵。

---

## 4. 三条件与端到端剧本

删非空哨兵 = 三个条件同时成立：

| 条件 | 性质 |
|------|------|
| ① UAF 链触发（对象 free 后引用仍在） | 结构性存在，可确定性复现 |
| ② chunk 复用为偏移重合的那类对象 | 堆摆布（固定尺寸热分配块，buddy 分裂从块首返回，基址对齐保持） |
| ③ 复用者 pend_list 当时非空 | 同步对象常态（空哨兵被 remove 是 no-op） |

### 剧本 A（调用点 1，S4 链，窗口最大）

1. CPU1 对任务 T 连删两次：第一次 `KTaskDelete(T)` 把 T 插入 KTaskZombie；回收线程 :52 摘下、**:53 解锁**（此后 :64 free 栈、:67 RmNode、:69 KTaskIdDelete、:71-73 free delay、:74 free(T)，全程无锁）；窗口内第二次 `KTaskDelete(T)` 仍能通过 id 解析（id 到 :69 才删）→ **:658 再次插入 KTaskZombie**；
2. T 被 free 后 `KTaskZombie.node_next = chunk_T + 16`；
3. 堆摆布使新 Semaphore S 落进该 chunk（pend_list@16 恰为野节点地址）；让任务 W 在 S 上 pend 住（哨兵非空）；
4. 此后任何任务退出 → 回收线程下一轮：:50 判非空 → **:52 `RmNode(&S->pend_list)` 斩首** → W 永久失联。

注：回收线程是**最高优先级**（`KTASK_PRIORITY_MAX-1`，本树数值大=优先级高，idle 用 `KTASK_LOWEST_PRIORITY=0`；v3「最低优先级」系错误，已修正）——双核下 CPU1 删除时它可在 CPU0 立即运行，窗口天然存在。

### 剧本 B（调用点 3，S9 链）

双核（或单核缝隙抢占）各自 `KEventDelete(id)`：两个 `FindEventById` 都落在第一次 `IdRemoveObj` 之前（event.c:228 解锁 → 裸指针）→ 第二次 `_EventDelete` 对已 free chunk 执行 **:70 `RmNode(&event->link)`**。chunk 复用为 MsgQueue 且有发送者阻塞在 `send_pend_list`（队列写满时 pend）→ 斩首发送等待队列。

**S9 单核可触发**（v3「单核不可触发」已证伪）：查/删是两个独立临界区，缝隙内中断已重开，tick/IRQ-exit 调度（assign.c:123 锁等级为 0 即换出）可在缝隙内抢占，让另一个删除完整执行。窗口窄、概率低，但存在。

### 调用点 2/4（id-gap 类）

`KTaskDelete` / `StartupKTask` 经 `GetTaskWithIdnodeInfo`（ktask.c:64-82，:80 解锁）拿裸指针，缝隙内另一核完成 delete+回收 free+堆复用。`:616` 的 INIT 闸门对对齐指针字节有约 50%（ILP32）/100%（RV64）放行率；`_DeleteKTask` 无闸门。两者都把 chunk+16 的 RmNode 送到 Sem/Event 的 pend_list 上。

---

## 5. UAF 根因链清单（v3 场景继承 + 本轮核实修正）

| 链 | 机理 | 本轮修正 |
|----|------|---------|
| S4 | 回收线程 :53 后整段 free 路径无锁 → 双删重插僵尸队列 → :52 野 RmNode | 回收线程是最高优先级（v3 优先级方向错误已修正） |
| S9 | Mutex/Event/MsgQueue/Timer Delete API 查到→解锁→裸删 | 单核可触发（已证伪 v3）；semaphore.c「查+删同锁」是正确范本 |
| S2' | delay.c:139-141 解锁窗口 → `KTaskTimeout(野task)` | 「stat 残留=SUSPEND 必过」错误：正常删除先置 CLOSE（ktask.c:109），buddy free 又覆盖块首 8 字节（stat@4 变 freelist 指针字节）；`:420` 哨兵路径被自身闸门排除（§1） |
| S3(b) | softtimer.c:310-312 解锁窗口 → WorkSubmit/回调读野内存；`TimerCBEnter` :256 野函数指针调用 | timer `_Delete` 的 free 在**锁外**（:70 解锁 :71 free）；`KGetTimer`（v3 误称 FindTimerById）等四个 API 无 NULL 检查，无效 id 单核必崩 |
| S7 | msgqueue 创建失败路径漏 `IdRemoveObj` → id 桶野节点 | Semaphore 布局实为 value@12/pend_list@16/link@24；chunk+4 = 复用者 `id.link`（id 桶节点）；`max_msgs`/`each_len` 为 uint16，`0x1FFFFFFF` 截断为 65535，乘积 512KiB 不溢出——确定性触发需 msg_size≳32769 |
| N6（新） | `_DeleteKTask` 从不调 `KTaskUnSetDelay`：被删任务的 ACTIVE delay 节点永久留在 `xiaoshan_delay_head`，回收 free 后 tick ISR 照常遍历（delay.c:134/138 野读）→ delay.c:109/ktask.c:420 野操作 | **无需任何竞态**，deadline 到期必触发 |
| N2（新） | `KTimerStartRun`/`KTimerAssignMemberRun`（KGetTimer 缝隙）把死 timer 重插排序链表 → tick 在 softtimer.c:292 对死节点 RmNode | tick 时刻无竞态 |
| N5（新） | 活 timer 重复 StartRun 不先摘 → 排序链表成环 | 无 UAF |
| 新增确定性单核 bug | 删除**从未启动**的 timer：`KCreateTimer` memset 清零后 sortlist 从未初始化，`_Delete:67` 对全零节点 RmNode → NULL 解引用（「全零 ≠ 自环」，见姊妹篇 §4b） | v3 遗漏 |

---

## 6. 节点级野 RmNode（不删哨兵，但确定性成立）

| 调用点 | 目标@偏移 | 伤害 |
|--------|----------|------|
| `mutex.c:72` | Mutex.link@28 | 管理链表节点摘除 / 透写 |
| `msgqueue.c:308` | MsgQueue.link@40 | 同上 |
| `softtimer.c:67/68` | Timer.sortlist@72 / link@64 | 排序/管理节点摘除；双 free 后 `CHECK` 死循环 |
| `softtimer.c:122` | Timer.sortlist@72 | QuitRun-after-delete（:115 状态检查在锁外，TOCTOU） |
| `softtimer.c:292` | Timer.sortlist@72 | N2 重插后 tick 摘除 |
| `delay.c:109` | Delay.link@12 | N6 链，透写堆元数据 |
| `zombierecycle.c:67` | TaskDescriptor.link@92 | 复用后任意写 |
| `id.c:103` | IdNode.link@4 | 摘除复用者自己的 id 桶节点；**变体：buddy 只覆盖块首 8 字节，chunk+8 的旧 node_prev 存活，若野节点原为桶中首节点，写②直接改写 BSS 桶头 node_next——哨兵被写穿（腐蚀，非斩首）** |
| `ktask.c:420` | TaskDescriptor.sched_link@16 | 节点级（§1 反例）+ :424 调度级 |

---

## 7. 插入侧危害（同根 UAF，非 RmNode）

| 位置 | 危害 |
|------|------|
| `ktask.c:658` | 把死任务/双删任务的 sched_link 插入 KTaskZombie（S4 起点） |
| `ktask.c:424` | `KTaskTimeout` 把野 task 插入就绪向量 → 调度器消费（assign.c:245 + 切换死栈） |
| `softtimer.c:94/100` | `_StartRun` 把死 timer 插入排序链表（N2）；活 timer 双插成环（N5） |

---

## 8. 修复优先级（v4）

1. **P0**：S4——回收线程「摘下→free」全程持锁，或 in-zombie 标志 + 引用计数；`_DeleteKTask` 拒绝 CLOSE/in-zombie 重复入队；
2. **P0**：S9——全部 Delete API 统一为 `_SemaphoreDelete` 模式（id 下传，查+摘+标记同锁，free 放锁外且由删除标记保证后续查询失败）；
3. **P0**：timer——四个 API 补 NULL 检查；`_Delete` 对未启动 timer 判 sortlist 自环（防 NULL 解引用）；
4. **P1**：`KTaskDelete`/`StartupKTask` id-gap 收编（查删同锁或引用计数）；`_DeleteKTask` 补 `KTaskUnSetDelay`（N6）；
5. **P1**：S3(b)——timer 引用计数化 / WorkSubmit 纳入临界区；
6. **P2**：`DoubleLinkListRmNode` 引入 in_list 标志；`IdGetObj` 桶遍历加 magic 校验。

---

*本文与姊妹篇《REMOVE_SELFLOOP_NODE.md》共同替代 2026-09-14/15 的 SENTINEL_DELETION_SMP_CONCURRENT.md（v1–v3）与 SENTINEL_DELETION_NONCONCURRENT.md。BKL 前提（CriticalArea.c:43-58 = 关本核中断 + 全局自旋锁 `_CriticalLock` + `assign_lock` 防换出）维持 v2 结论：临界区跨核串行化，竞态只发生在代码主动解锁的缝隙；注意该保证以 `smp_os_running_task[coreid] != NULL` 为前提（启动早期窗口除外），且 SMP 仅存在于 RISC-V k210 系 defconfig（`HwLockSpinlock` 实为 test-and-set，非 ticket）。*
