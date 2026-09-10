# 单双链表 storeA 迁移

## 用户要求与基线

- 2026-09-09：迁移本地单双链表证明到带 storeA 的版本，与 crtosverify/master 中 idmanager 使用的接口对齐。
- 主分支参考 commit：d215f73b69916cc5c7c01af752bca4b6f96b3530。
- DLL.storeA 的类型是 addr -> A -> Assertion；IdNode 层的 node_storeA 是 addr -> Z -> Prop，经 store_idnode 包装后传给 store_dll。
- C 链表节点没有业务数据字段；链表谓词持有指针字段，storeA 表达外围业务对象的附加资源。不得往 C 节点结构添加数据字段。
- 迁移必须涵盖 C annotation、生成 VC 和证明，不能只给公共库添加未被函数规格使用的参数。
- 初始 intake 未修改正式文件；当前进展见下方，不能将初始化通过视为整套迁移完成。

## 工程现状

- QCIP 中双链表 active common 为 QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v，目前使用 list addr 的 AddrDLL。
- 单链表 active common 虽有 generic_sll，但现有 storeA 类型为 addr -> addr -> A -> Assertion，包含 next 地址，需与业务资源参数接口区分。
- crtosverify 当前检出 double_linklist；single_linklist 和 master 是其他本地分支。只读检查主分支采用 git show，未切换或覆盖当前工作区。
- controller 当前固定单 case C / case_lib 边界；共享模型与多 case 迁移的输入版本及采用顺序须明确后再进入 annotation。

## 已授权执行与复用约束

用户于 2026-09-09 授权执行，并强调除 storeA 外尽量保持现有版本、最大程度复用已有定义与证明。验收目标为泛型 payload 与结构资源分离、idmanager 实例可衔接、原有操作语义不弱化、所有目标证明通过。controller 增加显式共享 case_lib 路径支持，仍通过唯一 case_lib 合同和 final-candidate-apply 采用；版本绑定、默认路径兼容及路径拒绝检查 3 项通过。

## 编排检查补充

controller 原 final-check 仅记录 freshness skipped；本轮增加输出至 report root 的 canonical replay、generated 字节比较和 manual witness statement 比较，正式证明不作为 replay 输出。新增测试覆盖证明不被覆盖、goal 改变被拒绝、witness statement 改变被拒绝；共享 case_lib 路径与 freshness 共 4 项单元测试通过。DLL 初始化已通过实际 replay 与完整 final-check。

## Group 依赖快照修复

SLL 初始化 group 首次检查发现 accepted seed 引用 ptr_size_eq_4，但 group 基础库缺少此引理。根因是 group worktree 只从 HEAD 建立，preparing 仅覆盖 QCIPLib/目标文件，遗漏 accepted round 中已有的 SeparationLogic 架构更新。prepare_group_worktrees.py 已补充 fixed mapping 下 Rocq 依赖源同步，保护 worker manual 和 case_lib 不被覆盖。当前 SLL group 恢复 1175 个已接受依赖源；证据位于对应 group report 的 dependency_snapshot_repair.json。小型检查确认恢复正确、不覆盖 worker 输出并满足幂等性。此类错误应修复准备流程，不应为了旧 dependency 快照重写已接受 spec。

## 初始化验收与归档

DLL 初始化 run xizi_double_link_init-20260909212324 已 final-check passed，正式采用 XiziStoreADLL 与 xizi_store_dll。空表等式直接复用原 xizi_dll_empty 引理；唯一 manual witness 通过 group、parent、final 三层检查。SLL 初始化 run xizi_single_link_init-20260909212355 同样已 final-check passed。两者均已归档并清理本 run 的 round/group worktrees 与编译缓存。

归档脚本 storeA_migration_reference/archive_completed_run.py 只处理 controller 已 done / final-check passed 的 run，不写 acceptance。归档前比较迁移前后 C token，验证可执行源码未变；旧报告保留于 before_storeA。共用 lib 只在 common/rocq 保留正式副本。脚本处理 target_c_file 为绝对路径的情形，必须先确认 active goal_check 存在，避免复制旧归档而漏掉新 generated 文件。

后续 consumer run 使用默认 case-local lib，并只读已接受共用库。优先以 map getPtr 复用原地址序列数学操作，独立 payload 资源帧保持数据和值的关联。DLL insert_after、remove_node、empty 已进入 annotation；其最终证明尚未完成。

## SLL 删除的不变量修复

SLL remove_node 首轮 vc-checking 给出 return_wit_2 的具体反例：target = next = 0、suffix 非空，当前 predecessor 已指向 0，返回后却要求指向 suffix。初始 assertion 有 target 非空，但循环不变量没有携带该事实。当前内存模型允许地址 0 的对齐 pointer cell，不能仅凭裸 store_ptr 反推非空。修复为把已建立的 linklist_node != 0 保留进不变量，不加强函数输入规格、不改 C。controller 已基于该 semantic report 开始 annotation r2；原 r1 目标不能作为修复后的证明证据。

## Tactic 规则解释

group-worker-proving/docs/separation-logic-whole-proof-tactics.md 明确示范 entailer!；forbidden_lemma.md 没有禁止该 tactic。应遵循实际 forbidden 列表，不因泛指的“禁用黑盒 entailment tactic”自行扩大禁用范围。关键 shape/payload 推理仍须由已证明引理、资源分解和 pure facts 支撑。

DLL insert_after 的 legacy case_lib 仅导入 common lib，没有 re-export 空间记号。group 不得补顶层 project Require Import；新增 helper 前的独立 Import 也会被当前 parser 归入 seed 最后一个 block，触发 seed modified。可使用全限定 helper statement，并在新增 helper 的 Proof 内激活已加载 namespace；这不增加 Require 库依赖，随 helper proof body 合并，需在 report 如实记录。后续 annotation 应为预期空间 helper 提供必要的 seed imports/namespace context，避免此类准备缺口。

## 首批非空资源证明验收

DLL remove_node run xizi_double_link_remove_node-20260909215418 与 DLL empty run xizi_double_link_empty-20260909215624 均已通过 parent/full/final 检查。前者 5 个 witnesses 与 7 个 helpers；后者 4 个 witnesses，无新 helper。源码 token 比对表明可执行 C 不变；归档和 run 清理通过。

remove_node 中已证明的 payloads_split/join、seg_decompose/compose、dll_decompose/compose 全为任意 A/storeA 的通用事实。下一个 DLL len run xizi_double_link_len-20260909223939 使用 common lib 作为唯一 writable case_lib，在长度规约迁移时复用这些证明到 common，避免后续每个 query case 重复证明。该 run 尚未完成，不把其候选当作当前共用库证据。

## 插入验收与后续队列

DLL insert_after run xizi_double_link_insert_after-20260909215418（7 witnesses）和 SLL insert_after run xizi_single_link_insert_after-20260909220108（2 witnesses）都已 final-check passed、archive/cleanup 完成，可执行 C token 不变。至此 6 个 case 完整通过。DLL len 已 accepted annotation，新增共用桥仍是候选，正在 vc-checking。SLL empty 已 accepted annotation 等待 VC owner slot；SLL first 已进入 annotation；SLL remove 修复后 group 正在证明。单链表长度的公共桥迁移合同已准备，必须在 remove 的 helper 正式接受后才 intake，不能将 worker 候选当已接受参考。

## 删除最终通过和公共桥队列

SLL remove_node run xizi_single_link_remove_node-20260909220108 已通过 parent/final-check 并归档清理。8 个 witnesses，7 个 suffixed helpers；r2 的 target 非空不变量修复保留，原 C token 不变。SLL len run xizi_single_link_len-20260909231851 已建立 annotation round，以 SLL common 为唯一 writable case_lib，合同为 sll_length_bridge_contract.md；尚未 spawn。SLL next run xizi_single_link_next-20260909231243 annotation owner 正在编译。SLL first 已 accepted VC checking 并完成 preparing，group first_payload_query 尚待 worker slot。SLL empty group payload_emptiness 与 DLL len group dll_len_payload_cycle 正在正式 group check。DLL head run xizi_double_link_head-20260909231954 已 intake，尚未 step，可待 DLL common 扩展采用后再建立 snapshot。模型临时容量错误已在同一 owner attempt resume，未换模型，SLL removal 与 DLL length VC owners 均成功返回终态报告。

## NONE 头文件宏兼容修复

DLL head canonical QCP 在现有 xizi_double_link_def.h 的 `#define NONE ((void *)0)` 上报 Unsupported token 269。原 linux-binary/qcp_macro_compat.py 仅扫描顶层 C；此次主侧扩展 prepare_input，仅在临时副本中处理直接 quoted include 头文件的同一精确 NONE 宏。正式 C/头文件不变，保留行数及 source-local include precedence，头文件本地依赖绝对路径化。未命中时恢复原 exec 行为并先删除空临时目录。linux-binary/tests/test_qcp_macro_compat.py 4 项通过；DLL head 候选两次 canonical replay 生成 4 个 .v 字节完全相同。证据 reports/xizi_double_link_head-20260909231954/rounds/xizi_double_link_head-annotation-r1/tooling_compat_check/regression.json。owner 自己的 canonical 与 SessionManager 检查均通过 EOF。

整套最终回归脚本 audit_completed_suite.py 已准备（仅 syntax check，尚未运行，要求全部 25 cases passed）：重放各 case freshness/结构扫描，用报告目录中的独立 aggregate check 通过唯一 coq_tooling 入口编译当前依赖，记录当前 source digest；不会覆盖原 controller acceptance。

## 自动目标占位的信任边界

SLL len VC checker 明确指出 proof_auto.v 仍由 QCP 生成 Proof. Admitted.；检查迁移前归档和已验收其他 case 也存在，属于当前上游生成器行为。AGENTS/final-check 只要求 manual 和 case_lib 无 Admitted，并禁止手改 generated 文件。此次不绕过生成边界，不把已有自动目标占位冒称为完全无假设的内核证明。archive/audit 脚本已新增 generated_auto_admitted_count 与 README 边界说明；最终还需为先前 9 个已归档 case 补充相同说明和总数。用户已在 commentary 得知此事；未要求终止迁移或扩展自动证明生成器。

DLL len xizi_double_link_len-20260909223939 已 final-check passed、归档清理。共享 DLL 主库现已正式包含两个投影/资源定义、6 个 __storeA_shared 桥和 10 个 __dll_len_payload_cycle helpers。后续 consumers 可直接复用，consumer_contract.md 已更新指引。SLL empty 也已 done/archived；完整通过 9/25。

## 队列快照（2026-09-09 23:50 左右）

已完整 done/archive/cleanup 9/25：DLL init/remove/empty/insert_after/len；SLL init/insert_after/remove/empty。先前 9 个已归档 case 的 README、verification_summary、checkpoint 已补自动目标占位边界和数量，不改原 controller acceptance。SLL first parent accepted，final-check 执行中（主 exec session 81533）。SLL next group payload_next 与 SLL len group len_payload_loop 工作中。DLL head 已 accepted VC checking，preparing 正在/已完成（session 96646），group head_query 等待 slot；DLL insert_before run xizi_double_link_insert_before-20260909234720 annotation-subagent 工作中，已读取正式采用的 DLL common bridges。

SLL first final-check passed，正在 archive/cleanup（主 exec session 1905）。DLL next run xizi_double_link_next-20260909235047 annotation worktree/handoff 已准备，尚未 spawn。下一步 slot 优先完成 DLL head group，再推进 DLL next annotation 与剩余查询/组合 case。archive_completed_run.py 现在记录 cleanup started/finished/elapsed，先前清理耗时未测量部分必须在最终 timing gaps 如实标注。

## 最新阶段补充

SLL first archive/cleanup 已完成（session 1905 已结束），完整通过 10/25。SLL next 和 SLL len 的 group workers 正在完成 fixed group-check。DLL head group head_query 已由 /root/group_worker_dll_head 启动。DLL insert_before annotation accepted，vc-checking step session 64073；尚未启动 VC owner。DLL next annotation worktree/handoff ready，尚未 spawn。当前维护库和手动证明未发现 Admitted；自动目标占位继续明确按生成器边界记录。

## 跨日队列补充（2026-09-10）

库存更新必须只匹配本次任务 run 时间戳 >= 20260909212300；只 glob -20* 会错误纳入之前验证的 legacy runs。曾短暂错误更新非权威 inventory，已立即按 cutoff 修复，无 controller 状态改动。DLL empty_rec run xizi_double_link_empty_rec-20260910000003 annotation round 已准备，尚未 spawn。当前完整通过 10，in-progress 6，pending 9。SLL len group completed，parent verify session 86716；SLL next parent accepted，final-check 正在执行，实际 session 见当前工具输出。DLL next annotation-subagent 已启动；DLL insert_before VC accepted，group insert_before_payload 已启动；DLL head group worker 仍在证明/编译。

SLL next final-check passed，archive/cleanup session 56922。完整通过 11/25。SLL len parent accepted/final-apply 完成，final-check session 85430；主 SLL common sha256 16835b99068ee104800ce56bd5abb2ce9e0abbf0955106bdd891fe5775d031d5（已采用 accepted candidate，尚等最终检查）。DLL common 最终 sha256 0b55545283593978a63332d79b82b807fda703ffa50bc7f62ca1438cb833a489。后续 SLL append/tail 可在 len 完整通过后复用共享 factor/unfactor；不得将自动目标占位误报为 manual 未完成。

## 00:20 左右队列与收尾要求

SLL len 已完整通过并归档清理，完整通过 12/25。DLL head parent accepted，final-check session 47477。DLL empty_rec annotation accepted，VC round step session 93294；尚无 VC owner。DLL init_then_empty run xizi_double_link_init_then_empty-20260910001038 annotation owner /root/annotation_subagent_dll_init_empty 正在工作。SLL append run xizi_single_link_append-20260910001748 annotation worktree/handoff ready，尚未 spawn；SLL tail run xizi_single_link_tail-20260910001748 已 intake，尚未 step。DLL next group dll_next_payload_dispatch 正在工作；DLL insert_before group已全部7个witness debug通过，final group-check运行中，13个新当前suffix helpers。

最终 timing 报告还需明确字段 total_elapsed_seconds / total_command_seconds / total_failed_rerun_seconds / total_human_activity_seconds / total_subagent_wait_seconds / timing_gap_seconds；不能精确取得的项写 unknown 并说明。controller timing_summary 有固定owner与controller intervals，但group time和早期cleanup测量不完整；不得凭估计补齐。Blocked/超过600秒轮次须依据保留report和timing_summary单列，缺失长耗时原因标report gap。现有cleanup_summary从SLL first开始记录started/finished/elapsed，早前9个run该部分未测量。

## 00:37 左右队列

完整通过并归档清理 14/25：新增 DLL head 与 insert_before。DLL next parent verify session 59611；DLL empty_rec parent verify session 25239。正在工作的 owners：vc_checking_subagent_dll_init_empty、vc_checking_subagent_sll_append、annotation_subagent_sll_tail。DLL head_rec run xizi_double_link_head_rec-20260910002854 annotation ready；DLL init_then_len run xizi_double_link_init_then_len-20260910003057 annotation ready；DLL init_then_insert_before run xizi_double_link_init_then_insert_before-20260910003542 annotation step session 13469。尚未 intake：callpoint_specs、next_rec_last、next_rec_middle。collect_migration_timing.py 已准备并执行一次中期统计（不是最终），未知计时保留 null；最终全通过后再生成。idnode_callpoint_contract.md 已同步完整当前 consumer contract（含 DLL/SLL shared bridges）。

## Empty rec 归档检查修正

empty_rec final-check passed 后，archive 的原始全 token 相等检查拒绝。diff 显示唯一非注释差异是为挂接 nil_case/general 添加同签名函数 prototype，函数体完全不变。没有回退/改 formal 文件或 controller acceptance。归档比较器现在仅忽略同一翻译单元中与实际函数定义完全同签名的冗余 prototype，其他全部非注释 token 必须相等，并记录 executable_c_comparison.json 与 README 明确说明。6 项测试通过（重复声明可接受；函数体、冲突签名、新外部声明、全局初始化、字符串变化拒绝）；所有已归档 case 复查通过。suite audit 也使用同一比较并保留证据。Empty rec archive/cleanup session 87556。当前16/25完整通过。

## 00:49 队列

16/25 已完成归档清理（DLL next 与 empty_rec 新完成）。DLL init_then_empty group generic_init_empty 5 witnesses/0 helpers completed accepted，parent verify session 58795。当前三名 children：annotation_subagent_dll_head_rec（初次 lib check passed，因输出未完整保留而重复 fixed check 保存完整证据）、group_worker_sll_append（4 witnesses +1 payload append helper，首次编译/调试）、annotation_subagent_dll_callpoint（新启动，11 wrapper+真实 IDNode ownership 实例）。

所有剩余 case 已 intake，annotation handoff ready：DLL init_then_len-20260910003057、init_then_insert_before-20260910003542、next_rec_last-20260910004243、next_rec_middle-20260910004243。SLL tail-20260910001748 已 annotation accepted，vc-checking handoff ready。DLL head_rec-20260910002854 owner active；DLL callpoint_specs-20260910004321 owner active。之后优先 SLL tail VC；其余保持所有 case 持续推进。

DLL head_rec annotation accepted；VC worktree/handoff ready（step session82487 已完成），无VC owner。SLL tail vc_checking_subagent_sll_tail 已启动。DLL init_then_empty parent accepted/final-apply 完成，final-check 新 session 见工具结果。当前 active children：SLL append group、SLL tail VC、DLL callpoint annotation。

## 00:57 队列

DLL init_then_empty final-check passed，archive/cleanup session70150；完成17/25。SLL append parent accepted/final-apply 完成，final-check session30552。当前 children：SLL tail group tail_payload_traversal（5w），DLL callpoint annotation（11wrapper/14manual候选；IDNode非空资源引理已写，初次lib编译缺Strings.String，已在同attempt修复重编译），DLL init_then_len annotation（三个实现、nil/general长度规约，显式A/storeA调用修复后QCP EOF，lib检查进行中）。head_rec VC handoff ready无owner；init_then_insert_before/next_rec_last/next_rec_middle annotation ready无owner。

## 01:03 左右队列

SLL append final-check passed，archive/cleanup session6996；完整通过18/25。head_rec VC accepted/preparing session3886已完成，group head_query(4w)尚未spawn。callpoint annotation accepted（真实IdNode nonempty lemma已coqc通过），VC step session32893完成，VC owner待slot。init_then_len annotation accepted，VC step68140完成，VC owner待slot。当前三children：group_worker_sll_tail(5w/0helpers，编译中)、annotation_subagent_dll_init_insert_before、annotation_subagent_dll_next_last。next_rec_middle annotation ready尚未spawn。优先启动最后未开始的next_rec_middle annotation，再有序完成积压VC/groups；不能遗漏head_query group。

收尾新增 finalize_migration_reports.py，仅 syntax checked，尚未执行。要求 --audit 指向完整passed suite audit，逐source hash复核后更新各OUTPUT checkpoint/reuse的当前依赖审计字段，不改原controller接受记录；生成migration_result.json、总README、两common README，并补alignment的已验证IDNode实例。最终顺序：全部25done/archive -> audit_completed_suite.py --cleanup -> finalize_migration_reports.py --audit ACTUAL_AUDIT -> collect_migration_timing.py，最后审阅实际产物。

## 01:12 左右队列

18/25 archived；SLL tail group completed/accepted，parent verify session81205。head_rec group head_query由group_worker_dll_head_rec工作中（4w/0helpers，首次group check）。next_rec_last annotation completed/accepted，VC step28060执行中；其owner曾因stdout截断重复fixedlibcheck保存完整报告（同attempt，语义无失败）。next_rec_middle annotation owner正在lib编译（QCP EOF已通过）。callpoint VC owner vc_checking_subagent_dll_callpoint已启动。init_then_len、init_then_insert_before均annotation accepted/VC handoff ready，尚无VC owner。

## 全 annotation 已接受（约01:15）

所有25case已通过annotation。SLL tail final-check session44321；DLL head_rec parent verify session4111。当前3children均VC checking：vc_checking_subagent_dll_callpoint(14候选w)、vc_checking_subagent_dll_init_len、vc_checking_subagent_dll_init_insert_before。next_rec_last VC handoff ready；next_rec_middle VC step44316，随后handoff ready。主侧还没开始最终整套audit；完成数18。

Callpoint VC accepted，source_goal_version3667801c6a00f2cce5cd118b178cdcff2f6ac75727675e3073ecf08d2552c13c。分2个dependency-free groups：query_results 8w（group00尚未spawn）、singleton_updates 6w（group01，group_worker_dll_callpoint_updates已spawn）。Preparing48514已完成。当前另外两个child：vc_checking_subagent_dll_init_len、vc_checking_subagent_dll_init_insert_before。nextlast/middle VC worktree都ready尚无owner。

## 01:18 队列

SLL tail archive/cleanup完成；单链表9/9全部done，总19/25。DLL head_rec parent accepted/final-apply完成，final-check新session见工具。init_then_len VC accepted/preparing28998完成，group dll_init_len_payload_cycle(8w/预计0helpers)尚未spawn。init_then_insert_before VC accepted/preparing67502完成，group init_insert_before_contracts(4w)尚未spawn。当前3children：group_worker_dll_callpoint_updates(group01,6w)、vc_checking_subagent_dll_next_last、vc_checking_subagent_dll_next_middle。Callpoint group00 query_results(8w)仍待spawn，不能遗漏。

## 01:23 左右：全部VC检查已接受

head_rec final-check passed，archive/cleanup新session见工具，完成20/25。所有annotation和VC checking均accepted；仅剩group,parent/final,整套audit。当前3workers：group_worker_dll_init_len(8w/0helpers初次check)、group_worker_dll_callpoint_queries(group00 query_results8w)、group_worker_dll_next_last(7w)。Callpoint group01 singleton_updates6w已completed且review accepted，无helpers，须等group00 accepted后才能parent verify。剩余两个未spawn的group：init_then_insert_before group00 init_insert_before_contracts4w；next_rec_middle group00 dll_middle_payload_dispatch7w（preparing71976已完成）。Main除了head_rec归档无其它long running command。

## 01:28 左右队列

完成20/25。Callpoint两组全部completed+review accepted（8查询+6更新，0helper），parent verify session67755。当前三proof workers：group_worker_dll_init_len(8w，首次No such goal已去除冗余tactic重查)、group_worker_dll_next_last(7w，8suffixed结构helper，前5w编译通过正修最后2derive)、group_worker_dll_next_middle(7w，新spawn)。仅剩init_then_insert_before group00 init_insert_before_contracts4w尚未spawn，handoff/manifest已ready。其他formal source/annotations和VC plan均已accepted。

所有group均已启动。init_then_len group8w已completed/review accepted，parent verify session57401。当前3workers：next_last、next_middle、group_worker_dll_init_insert_before(4w，新spawn)。Callpoint parent verify67755仍在进行；未到final-apply前main不采用IDNode新case_lib。其他20个case完整归档清理。

## 01:33左右收尾

Next_rec_last group7w+8helpers已completed/review accepted，parent verify session1922。Callpoint parent accepted/final-apply完成，final-check新session见工具（IDNode实例已进入main accepted candidate，尚等final）。init_then_len parent57401仍运行。当前仅2workers：next_middle7w+8helpers首次groupcheck；init_insert_before4w首次groupcheck。无尚未启动的group，无新owner需要spawn。完成数仍20。

## 01:36左右

next_middle group7w+8helpers completed/review accepted，parent verify45263。init_then_len parent accepted/final-apply完成，final-check新session见工具。nextlast parent1922仍运行；callpoint final6636仍运行。只剩一个child group_worker_dll_init_insert_before(4w/0helpers，首次check)，其他24case手动证明全完成；最终done数20。

## 01:39左右

Callpoint final-check passed，archive/cleanup新session见工具（第21case）；IDNode真实资源实例与14个调用点目标已正式接受。Nextlast parent accepted/final-apply完成，final-check新session见工具。Nextmiddle parent45263、initlen final84831仍在执行；唯一child init_insert_before仍pending groupcheck。

Callpoint archive26589完成，总21。Nextmiddle parent accepted/final-apply完成，final-check新session见工具。Initinsert_before最后4w debug全Qed，最终groupcheck中（无helper/import），待terminal report。当前main长命令：initlen final84831、nextlast final11155、nextmiddle final新session。

## Nextlast final-check 禁用引理失败及正确重试

nextlast final11155 Coq passed 但最终实际forbidden scan失败：manual两条derive使用logic_equiv_sepcon_emp和derivable1_sepcon_mono（105/106/122/123行）。Controller已rollback main，不能采用此proof，之前worker clean-scan声明不可靠。已通过controller retry-round --phase vc-checking --previous-attempt 原group report启动r2（session44586），reason完整记录最终报告和允许的accepted next证明模式sepcon_cancel_end/derivable1_wand_sepcon_adjoint；旧group/VC只读参考，不改spec，不主侧直接修manual。新VC handoff须由controller获取并fresh spawn，后续准备r2group。复用8个正确helpers和其余5w，修2derive，实际按repository forbidden list扫描。

Initlen archive29604完成，第22case。Initinsert最后4w group完成并主侧用controller._forbidden_findings扫manual+lib通过（main_forbidden_scan.json），review accepted，parent新session见工具。Nextmiddle final98920待结果。

## 收尾第二轮

Nextmiddle 已归档清理，总23/25。Initinsert_before parent accepted/final-apply 完成，final-check session76645。Nextlast r2 VC已accepted，r2 preparing完成，group_worker_dll_next_last_r2正在固定groupcheck；7w+8本组后缀helpers已写，主侧实际controller._forbidden_findings扫描为空（终态后还需保存绑定hash的证据）。新group：dll_next_rec_last_payload_dispatch。上一轮最终失败已保存final_check_forbidden_r1.json；timing collector/finalizer已增加保留失败说明，syntax passed。其余脚本仍未执行整套audit/finalizer，须全部25归档后执行。

Initinsert_before final-check passed并归档清理，总24/25。Nextlast r2 group7w+8helpers已terminal completed，主侧绑定manual/lib hash的forbidden scan通过并保存main_forbidden_scan.json，review accepted；parent verify34405通过，final-apply通过，final-check session60223运行。无active children。最终全套audit仍待lastcase done/archive；预计总manual125w，准确计数由finalizer给出。

## 全25done，整套回归中

Nextlast r2 final60223 passed并归档清理，25case全部done/archived；125manual（SLL31 DLL94），84generated auto Admitted（SLL15 DLL69）。所有25run自建Git worktrees已清理，两个common当前库与OUTPUT副本字节一致，crtosverify干净且未切换分支。首轮suite audit 20260909181010逐case25freshness/structure/forbidden均通过，但脚本误将strategy_goal Module Type接口Axiom作为active case_lib extra-Axiom而提前失败，未运行aggregate Coq。已保留失败audit.json并清理该独立buildroot。修正分类：common *_lib仍严格扫描；既有strategy接口/实现逐文件git show HEAD字节相同才接受为未修改dependency，保留其声明/forbidden扫描结果（旧strategyproof确实有禁用lemma，不能声称这些依赖也满足当前helper规则），并编译aggregate。第二轮suite20260909181337 session94007正在运行。Finalizer新增inventory顶层complete和这次审计修复/依赖边界说明，尚未执行；timingcollector新增suite_audits记录。

## 最终完成

整套audit `OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/suite_audits/20260909181337/audit.json` passed（session94007 exit0）；25目标统一固定编译、全部freshness、manual/active libs结构与forbidden检查通过，formal source hashes未变，suite buildroot已清理。finalize_migration_reports.py与collect_migration_timing.py均已执行，inventory顶层complete、25checkpoints current dependency audit全部passed、migration_result.json complete。最终125manual（DLL94+SLL31），84generated auto Admitted（DLL69+SLL15）明确保留为生成器信任边界；未修改的strategy接口/实现按基线独立记录，不混入active case_lib无公理/forbidden结论。可执行C比对全部通过；同签名重复prototype差异为empty_rec和init_then_empty两个case。首controller至统计约5.03小时（不含此前阅读），具体unknown/并行边界见timing summary。最终文件hash及所有checkpoint核对通过。

## 主分支参考复核（2026-09-10）

用户再次明确参考仓库路径 `/home/yangfp/QCIP/crtosverify` 及其主分支。通过 `git show master:lib/dll.v` 和 `master:lib/idnode.v` 核对，均与迁移参考快照逐字节一致，master 仍为 d215f73。已通过整套审计所记录的 153 个正式源码/证明文件哈希全部匹配当前工作区，单双链表公共库的 OUTPUT 副本也一致。本次复核没有重跑 Coq、不新增 controller acceptance，也没有切换或修改 crtosverify；证据为 `OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/source_revalidation.json`。

## 当前函数 spec 逐项复核（2026-09-10）

用户要求检查迁移完成情况和当前 spec。已核对 25 个 active C 的 74 个函数规约块，全部量化任意 A/storeA 并在后置条件保留 payload；generated goals 的参数含生成器后缀，不可仅搜索完整单词 storeA 判断迁移遗漏。公共库保留地址层与原三参数 generic_sll callback，新业务入口为二参数 storeA；旧头文件 Extern 不是遗漏。明确本地 DL_Node 与参考 DLL.DL_Node 并非同一个 Rocq 类型，结构名及原 guarded 条件保留。spec_review.md/json 保存当前审查、153 文件哈希复核及未重跑 Coq 的范围说明。

## 双链表完全对齐要求（2026-09-10）

用户明确要求全部双链表 spec 迁移至 idmanager/dll.v 定义：公共 dllseg/store_dll 不再保留本地额外非空/终点排除条件。此前“保留 guards”的合同已被新要求取代。新任务仅迁移双链表，单链表保持现状。参考仍为 crtosverify/master:d215f73，正式 C 算法和实际结构布局保留；字段结构名适配必须明示。新报告位于 OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment；上一套通过记录只证明旧 guarded 模型，不能当作新模型完成证据。

最新用户优先级：以 master:lib/dll.v 定义为先，再对齐可复用的 list addr 特例/投影，最后复用有效证明。不能反过来以旧证明约束公共定义。已同步当前 annotation handoff 的 problem_context，不改 source_version 或 formal files。

初始化新 run xizi_double_link_init-20260910112837 的 annotation 与 VC checking 已由 controller 接受；canonical DLL 的五个资源定义主侧文本比对通过（仅结构名、注释、空白正规化）。新增 DLL.addr_nodes/addr_store/addr_dllseg/addr_store_dll 是 unit+emp 特例，并有独立 payload 分解组合桥。尚未 final-apply，不作为正式新库证据。controller review-attempt 的 --attempt 必须传 report 路径，mark-attempt-* 才接受 attempt ID；VC result 键为 vc_checking，phase 名为 vc-checking。主侧便捷脚本已修正这两处调用差异。


2026-09-10 原源码范围与兼容性修正：用户限定 double_link.c 的 8 个与 single_link.c 的 9 个原函数。实际对照发现本地 DoubleLinkListGetHead 内联了判空调用，SingleLinkListGetTailNode 改写了循环，需恢复原代码后重新验证。reference DLL 的 DoubleLinklistType 与实际 SysDoubleLinklistNode 必须用共享 DL_Node 的不同布局实例，不得文字替换后声称兼容。master 无 VC，origin/idnode 六组证明作为兼容候选；其原 lib/dll.v nonzero Axiom、82 auto Admitted、18 Abort 诊断需保留来源并单列，不能添加到干净公共库或假称无假设。报告位于 OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment。

## 严格接口迁移进展与可复用修正（2026-09-10）

旧 25-case guarded 结果继续仅作为历史。当前范围固定为 8 DLL + 9 SLL。新的三实例公共库已实际导入六组 origin/idnode 原证明和 master 原 idnode 库编译通过，并由 init run final-apply/final-check 采用；主库 SHA256 为 2aa44db212fe9abc6dac6dc11e49a10fb4783c01c549bded57e89acd5cfa3384。DLL 用 CRules/DoubleLinklistType，XiziIdmanagerDLL 用 CRules/SysDoubleLinklistNode，XiziLocalDLL 用 naive_C_Rules/SysDoubleLinklistNode。三个实例共享真正 DL_Node；投影须用 notation abbreviation，Definition 函数别名不能支持原 record syntax。库侧 sizeof simpl 控制修复当前依赖与原证明的匹配差异；旧 nonzero axiom 仅隔离保留在原证明兼容入口。

已通过本轮完整最终检查：DLL init、empty、insert_after、len；SLL tail 原循环恢复也已重新验证。剩余 DLL 继续 controller 流程，尚不能宣称整体完成。当前定义及各实例引理接口 82 项静态检查通过。

容量证明不能把 arbitrary storeA 占有的堆丢掉：从 shifted segment 导出 store_align4_n 时需保留 ** TT，再用容量界推出计数不会溢出。Len 最终采用 witness 内的局部容量推导，case_lib seed 未变。

恢复 DoubleLinkListGetHead 的原 IsDoubleLinkListEmpty 调用时，不能仅附加一个独立的展开字段调用规约并假定它已验证。当前 head annotation 声明与已验证 empty 完全一致的 general，再声明 expanded <= general，生成派生义务并在原调用处选择 expanded。expanded 的后置条件对字段使用存在量词，保留 canonical nodes=nil 返回分类，不额外假定先前字段值的确定性。最终应同时检查派生 VC、跨文件 general 规约一致及原函数 token 比对。

## 严格接口迁移最终交付（2026-09-10）

本次限定的 8 个 DLL 原函数与 9 个 SLL 原函数已完成，共 72 个 manual witnesses（DLL 42，SLL 30）。17 函数当前版本 canonical freshness、manual/active case_lib 结构及禁用项检查、统一 fixed Coq 编译均通过；正式 source hashes 在编译前后保持一致。最终报告为 `OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment/final_summary.json`，当前整套证据为同目录 `suite_audits/20260910072705/audit.json`。

以 master:lib/dll.v 为准的 82 项接口检查通过；master 原 idnode 库与 origin/idnode 六组原 VC 证明导入本地新库编译通过，除导入外正文不变。原兼容编译的 218 项依赖与最终版本一致，固定工具版本和映射相同。短路径 StateRelBasic.v 是固定工具生成的 Require Export alias，须分别检查 wrapper 与物理模块，不能把两者哈希差异误认为源码改变。

本套生成 auto 文件保留 21 个 Admitted；原 idmanager 既有 nonzero axiom、82 auto Admitted 与 18 Abort 诊断另行记录。维护库及 manual 无新增 Admitted/额外 Axiom；未修改的策略依赖按原基线单列，不混入严格 case_lib 检查结论。各 controller run done、交付 checkpoint 与 reuse packet 已更新；本轮 worktrees/build 与报告脚本 cache 已清理，历史输入和旧用例保留。

## CRules 统一任务开始（2026-09-10）

用户明确要求统一。目标改为双链表统一 CRules，布局参数化的一套公共定义/证明，实际布局 XiziLocalDLL 与 XiziIdmanagerDLL 为同一实例别名。8 DLL 全部重新验证、idnode 原证明重编译，9 SLL 当前依赖回归。旧双模型通过结论保留为基线，不能代替新验证。controller 新增可选 --coq-rules，把 --CRules 模块参数持久化并带入 canonical symexec 与 freshness；旧默认不变，5 项工具测试通过。报告位于 OUTPUT/xizi/xizi_double_link_common/reports/crules_unification。

CRules 统一 annotation r1 技术候选编译和 MCP/canonical 通过，但 owner 的未限定路径 git diff --check 意外输出禁止目录内容，按规则报告 blocked，controller 已拒绝接受并创建新 annotation round。今后所有 diff/whitespace 检查必须给显式允许路径。旧技术候选只读保留，主侧可运行原证明兼容实验，但最终必须与 clean accepted candidate 哈希一致才有效。retry-round 的 previous-attempt 使用 attempt ID，不能传相对 report 路径。

CRules 候选 r2 SHA 053f77f39d0787ee6fe394189ea11c18211df9945f242a1fa420e38848599bb2 已通过 master 原 idnode + origin/idnode 六组原证明实际导入编译，以及五谓词 reflexivity、共享记录和 CRules 类型检查。首个主侧 probe 漏写 @ 导致隐式 A 提前实例化，已保留失败记录并修复；原证明本身未失败。候选尚待 init group/parent/final 完成采用，其余 7 DLL 尚待迁移。

Group worker 启动后必须及时调用 mark-attempt-started 注册 group_attempt；若等 terminal report 才首次 mark-attempt-returned，controller 的 action pending 检查会拒绝并掩盖为 attempt not found。已有 terminal report 可经 controller review-attempt 的正式 group 入口正常审查接受，无需改写 report 或伪造开始时间；本次 init group 按此路径接受，缺失启动计时作为 gap 记录。后续 drive start 在实际 spawn 后及时登记。

统一公共库与 InitDoubleLinkList 的 controller final-check 已通过并归档，common SHA 053f77... 与原 idnode 编译通过的 r2 完全一致。新库 1185 行，active 定义和证明只保留一个 CRules 布局参数化实现；原 naive 的 guarded 历史入口仍为未迁移历史用例/策略单列保留，不冒充 active 实现。其余 7 DLL 已建立独立 run，逐项推进。

CRules 统一中期：init、empty、insert_after、insert_before 四个 run final-check/归档完成。Len 的五个 group proofs 通过，容量界局部证明可直接复用。全部八个函数 annotation 保持 C 与规格不变；consumer case_lib 主要是导入 CRules，当前各组尚未新增 helper。VC report 的 agent_result.phase 会掩盖嵌套 vc_checking result；身份字段应放 report 顶层，status/source_goal_version 放嵌套 phase result。drive spawn 已把该集成经验写入后续 handoff 的 operational notes，避免重复失败。

## CRules 统一最终完成（2026-09-10）

8 个 DLL run 均经 controller final-apply/final-check 完成并归档；9 个 SLL 保持源码/规格/证明不变并通过当前依赖回归。统一 suite `crules_unification/suite_audits/20260910113338/audit.json` passed，17 函数 72 manual witnesses、21 既有 generated auto Admitted 单列。公共库单份 CanonicalDLL/CRules 实现，实际布局本地与 idmanager 为同一模块实例别名；45 项静态接口检查与原 idnode 实际编译通过，218 个兼容依赖同当前版本，原证明除 imports 外正文不变。公共库 SHA053f77... 与 compatibility fixture 及 OUTPUT 副本相同。42 DLL proof scripts 中 41 直接复用，init 一项仅将末尾 entailer 改为两次显式字段 cancel。8 个 C 含 annotation 逐字节不变。全部本轮 worktrees/build 和报告脚本 cache 已清理，原 crtosverify repo clean。最终汇总与复现 README 在 OUTPUT/xizi/xizi_double_link_common/reports/crules_unification。
