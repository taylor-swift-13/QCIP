# 双链表「remove 自环节点」分析：no-op 不变量、依赖清单与失效边界

> 分析对象：`/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread`
> 姊妹篇：《REMOVE_NONEMPTY_SENTINEL.md》（remove 非空哨兵：斩首调用点清单、偏移几何与完备性证明）
> 版本：v4（2026-09-15）——替代 v1–v3 的 SENTINEL_DELETION_SMP_CONCURRENT / NONCONCURRENT 两份；按 remove 语义重组
> 行号基线：2026-09-15 工作区快照

---

## 0. 定义：自环节点与空哨兵是同构的

**自环节点**：`X->next == X->prev == X`。来源只有两处：

1. `InitDoubleLinkList(X)`（double_link.c:30）——把头/节点初始化为自环；
2. 上一次 `DoubleLinkListRmNode(X)` 的写③④——摘除后把 X 自环（停车状态）。

自环节点作为数据结构**就是一个空链表头**——「独立的节点不就是哨兵吗」成立。区别不在字节里，在于**入口身份**：

- **哨兵** = 有代码以它为遍历/判空/插入锚点的地址（`KTaskZombie`、`sem->pend_list`、id 桶头……），身份永久、被对象或 BSS 长期引用；
- **自环成员节点** = 没有入口身份的地址（`task->sched_link` 等），自环只是「当前未挂载」的临时状态，随时会被插进某个链表。

判据：remove 前读 `X->next == X` 即可预知结果。

## 1. no-op 的机械证明

`DoubleLinkListRmNode(X)`（double_link.c:71-78）四写，代入 `X->next == X->prev == X`：

| 写 | 代入后 | 结果 |
|----|--------|------|
| ① `X->next->prev = X->prev` | `X->prev = X` | 写回原值 |
| ② `X->prev->next = X->next` | `X->next = X` | 写回原值 |
| ③ `X->next = X` | 同 | 写回原值 |
| ④ `X->prev = X` | 同 | 写回原值 |

**严格恒等 no-op**：结构不变、无副作用。空哨兵与自环成员节点在此完全等价。

## 2. 三分类总表（RmNode 参数的全部身份）

| 参数 X | remove 时 | 结果 |
|--------|----------|------|
| 自环节点 / 空哨兵 | 恒等重写 | **no-op**（本文主题） |
| 链内成员节点 | 邻居缝合断口，头不动 | **正常摘除**（设计行为） |
| 非空哨兵 | 邻居成环，头自环，入口报空 | **斩首**（见姊妹篇） |

内核大量路径的安全性押在「自环 no-op」这条隐含不变量上：它们赌参数**要么在链（正常摘除）、要么自环（no-op）**。赌局的隐藏缺口是第三种可能——参数是非空哨兵（姊妹篇）或野内存（§4）。

## 3. 依赖自环 no-op 的调用点清单

| 调用点 | 自环场景 | 自环来源 | 备注 |
|--------|---------|---------|------|
| `ktask.c:503`（`_KTaskWakeup`） | 裸挂起任务被唤醒（§4.1 专题） | `_SuspendKTask` :551 摘除 RUNNING 任务 | 常规路径，每天发生 |
| `ktask.c:551`（`_SuspendKTask`） | RUNNING 任务自挂起 | 调度器摘出（assign.c:87/:107/:329/:353） | no-op 后任务进 SUSPEND |
| `ktask.c:616`（`_StartupKTask`） | INIT 任务首次启动 | `InitDoubleLinkList`（ktask.c:737） | 正常为 no-op；**野 chunk 时闸门可过 → 姊妹篇调用点 #4** |
| `assign.c:245` / `smp_assign.c:385` | 摘「不在就绪队列」的任务 | 上次摘除 | 无成员校验；附带 :247-260 位图重算副作用（误清别的任务位） |
| `ktask.c:420`（`KTaskTimeout`） | S2' 链中「残留自环」环节 | `_KTaskResourceDelete` 已摘除 | RmNode 本身 no-op，**但 :424 insert 照跑** → 调度级伤害 |
| `zombierecycle.c:67`（S4 第二轮） | `task->link` 已自环 | 第一轮 :67 | 4 写进 free block，复用前无害，复用后任意写 |
| `id.c:103`（第二次 `IdRemoveObj`） | id 桶节点已摘除 | 第一次删除 | `id == -1` 门闩——**被 buddy allocator 破坏**（§4.5） |

## 4. 不变量的失效边界

### 4.1 专题：`ktask.c:503` 的入口闸门与自环路径

`_KTaskWakeup` 全树只有一个调用者 `KTaskWakeup`（ktask.c:1068-1077），一律按 id 经 `GetTaskWithIdnodeInfo` 查表拿 task 指针。这带来三个硬结论：

1. **`&task->sched_link` 恒等于『真任务描述符 + 16』，永远不是哨兵地址**。伪造指针（如 `container_of(哨兵)`）只能影响拿去查表的 id 值，指针本身到不了 :503——查表要么返回真任务，要么 NONE（debug 下 `NULL_PARAM_CHECK` 死循环、release 下 :1076 空指针解引用）。id 查表在效果上是**指针校验器**。
2. **死对象进不来**：任务 idnode 在 free 之前删除（zombierecycle.c:69 先于 :74），`k_task_id_manager` 无泄漏链；僵尸任务 stat=CLOSE 过不了 :494 检查。
3. **常规自环路径**：回收线程空转时 `SuspendKTask(zombie_recycle)`（zombierecycle.c:76）挂起自己——节点自环、不挂任何链表；任务退出时 `KTaskWakeup(zombie_recycle)`（ktask.c:583/660）→ :503 对自环节点 no-op → :508 插就绪。任何裸挂起（非 pend）任务的唤醒都走这条路。

### 4.2 失效边界 a：死内存 / 复用

「自环」字节在 free 后不再可靠：buddy allocator 在块首 8 字节写空闲链指针，复用者改写全块。此时 RmNode 的写①②是透写野字节的任意地址写、写③④破坏复用者。`:503` 因查表闸门免疫；`:420`/`:52`/`:245`/`:616` 不免疫——**这四个正是姊妹篇的斩首/节点级调用点**。

### 4.3 失效边界 b：全零 ≠ 自环（单核确定性 bug）

`KCreateTimer` 把 timer 整体 memset（softtimer.c:175），`_Init` 只挂 `link`（:45），**`sortlist` 保持全零**。对从未启动的 timer 调 `KDeleteTimer` → `_Delete:67` `RmNode(&timer->sortlist)` → 写① `NULL->prev = ...` 立即 NULL 解引用。全零不是自环，no-op 不变量不适用。只有「启动过再停止」的 timer 安全（`_QuitRun:122` 使其自环）。**P0，单核必现。**

### 4.4 失效边界 c：半自环 / 损坏节点

自环 no-op 要求两个指针**都**指向自己。只有一个指向自己的半自环节点，RmNode 不是 no-op。本树 SMP 版 `CriticalAreaLock`（CriticalArea.c:43-58，全局自旋锁 + assign_lock 防换出）保证同节点串行摘，正常流程无写撕裂；半自环只能来自其他 bug 的腐蚀（如姊妹篇的野写）。

### 4.5 失效边界 d：`id == -1` 门闩被分配器破坏

`IdRemoveObj` 设计上靠「已删对象 `id.id == -1`」让第二次删除静默返回（id.c:134-137）。但**每个 IPC 对象的 `id` 都在偏移 0，buddy free 恰好覆盖块首 8 字节**——`id.id` 变成 freelist 指针字节，门闩失效。第二次删除的 `IdRemoveObj(垃圾id)` 若撞上活对象的 id，会摘掉那个活对象的 id 桶节点（id.c:103，错对象）。

### 4.6 失效边界 e：no-op 掩盖状态错误（`:503` TOCTOU）

`:494` 的 SUSPEND 检查在取锁（`:501`）**之前**。SMP 下两个核并发 `KTaskWakeup(同一 id)`：

1. 双方都过 :494（当时确为 SUSPEND）；
2. 先进锁者完成 :503（摘除）+ :508 插就绪；调度器随后可把它摘成自环、置 RUNNING；
3. 后进锁者 :503 打在**自环节点上——no-op，毫无阻碍地继续** → **:508 把 RUNNING 任务再次插入就绪向量**。

「删自环 no-op」被代码当成「可以安全继续」的信号，但此时继续是错的：同一任务可被两个核同时选中 → **双调度**。RmNode 本身无结构性破坏，bug 在 :494 的锁外检查与 :508 的无条件 insert。

## 5. 防御性观察（更新版）

| # | 位置 | 结论 |
|---|------|------|
| D1 | `linklist.c:94` `LinklistResume` 函数内无判空 | 5 个调用点全部先判空（semaphore.c:176、mutex.c:178、msgqueue.c:153/193/265），BKL 下「判空→使用」同临界区，当前不可达；假任务指针只能污染拿去查表的 id 值，到不了 ktask.c:503（§4.1）。建议原语内判空 |
| D3 | `KTaskWakeup(zombie_recycle)`（ktask.c:583/660） | **UP 下不可达**：id 0 属于回收线程自身（`CreateKServiceKTask` 最先创建它），且回收线程创建前系统无任务、更无 SUSPEND 任务；**SMP 正常运行期另有 lost-wakeup 窗口**：回收线程「查空→挂起」与他核 `KTaskQuit`「插入+唤醒」跨核竞争，可致僵尸队列非空而回收线程永久睡眠。建议唤醒前判 `zombie_recycle > 0` 并把查空+挂起+插入+唤醒收进同一临界区 |
| D5 | `double_link.c:121` `DoubleLinkListLenGet` 无锁遍历 | **全树零调用，死代码**，可删除 |
| — | `NULL_PARAM_CHECK` 语义 | debug = 死循环（xs_kdbg.h:96-103），release = 空宏（:151）——多数「防护」实际是持锁挂起或裸奔，评估任何 negative path 时先想这一点 |

## 6. 修复建议

1. **P0**：`DoubleLinkListRmNode` 加调试断言（参数 `next/prev` 非 NULL）挡全零节点；timer `_Delete` 对未启动 timer 判 `sortlist` 自环（§4.3）；
2. **P1**：`_KTaskWakeup` 的 :494 检查移入临界区，消除 TOCTOU 双调度（§4.6）；
3. **P1**：`in_list` 标志机制化替代自环运气（每个内嵌节点记录挂载状态，remove 前查标志）；
4. **P2**：`IdRemoveObj` 门闩改放在 free 覆盖不到的偏移，或删除路径显式无效化 idnode 指针（§4.5）；
5. **P2**：`_StartRun` 重插前先摘（对齐 delay.c:60-63 模式），防活 timer 双插成环；
6. 联动姊妹篇 P0：S4 回收全程持锁、S9 查删同锁——从源头消灭「死内存上的 RmNode」（§4.2）。

---

*本文与姊妹篇《REMOVE_NONEMPTY_SENTINEL.md》共同替代 2026-09-14/15 的 SENTINEL_DELETION_SMP_CONCURRENT.md（v1–v3）与 SENTINEL_DELETION_NONCONCURRENT.md。*
