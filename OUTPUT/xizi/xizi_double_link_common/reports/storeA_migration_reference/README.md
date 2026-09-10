# storeA 迁移交付

全部 25 个用例完成 controller final-check，125 个手动目标完成证明，25 个 goal_check 通过当前公共依赖下的整套固定检查。各用例的 canonical symbolic execution freshness、manual/lib 结构和 forbidden lemma 扫描通过。

参照 `crtosverify/master` 的 `dll.v` 与 `idnode.v`，commit `d215f73b69916cc5c7c01af752bca4b6f96b3530`。原 C 算法、节点布局、接口和边界语义保留。仅有同签名重复声明差异的用例：xizi_double_link_empty_rec、xizi_double_link_init_then_empty；这些差异不改变可执行函数体，逐 case 比对见审计。

手动证明和维护库没有遗留 Admitted 或新增 Axiom。QCP 的 generated proof_auto 仍有 84 个 Admitted 占位；固定编译通过不等于这些自动目标已完成 Coq 内核证明。这是本次迁移明确保留的上游生成器信任边界。

与 idmanager 的定义、资源和 IDNode 实例对应见 [alignment.md](alignment.md)。当前整套审计：`OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/suite_audits/20260909181337/audit.json`。逐 case 的原始 controller 接受记录、目标版本、中文复现步骤和证明产物位于对应 OUTPUT 目录；本报告不改写原始接受记录。

迁移中必要的额外修正：单链表删除循环保留入口已建立的目标节点非空事实，修复原不变量遗漏；不加强输入规格、不改 C。QCP 的 NONE 宏兼容层扩展到直接包含的头文件，仅处理临时副本，4 项测试和重复生成比对通过。controller 增加共享 case_lib 绑定及隔离 freshness replay，group preparation 同步已接受依赖以避免丢失既有 Arch32 引理。归档比较器对同签名重复声明单列，6 项回归测试通过。详细修复过程和证据指针保存在各 run 报告及 `experience/xizi_link_storeA_migration.md`。

`next_rec_last` 第一轮证明虽通过固定 Coq 检查，但 final-check 检出两条派生证明使用禁用引理，已回滚并通过新的 VC checking/group proof 轮次修复，未改规格或目标陈述。原失败证据保留在 `reports/xizi_double_link_next_rec_last-20260910004243/final_check_forbidden_r1.json`；最终结论以修复后的 controller 验收及本次整套扫描为准。

整套审计只对 active case_lib、公共模型库和当前 manual 应用严格的库/禁用引理规则。既有 strategy 接口和实现另列为依赖：逐文件与 Git HEAD 基线字节比对相同，保留接口公理和旧策略证明的扫描结果，并随 goal_check 编译；不把这些接口声明误报为本次新增 Axiom，也不声称旧策略实现全部满足当前 helper 禁用清单。首轮脚本曾错误地把 strategy 接口套入 case_lib 规则，修正分类后重跑，原证据保留在 `suite_audits/20260909181010/audit.json`。

复现当前整套回归，在仓库根目录运行：

```sh
PYTHONDONTWRITEBYTECODE=1 python3 OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/audit_completed_suite.py --cleanup
```

| 用例 | 手动目标 | 自动目标占位 |
| --- | ---: | ---: |
| xizi_double_link_callpoint_specs | 14 | 34 |
| xizi_double_link_empty | 4 | 0 |
| xizi_double_link_empty_rec | 4 | 0 |
| xizi_double_link_head | 4 | 1 |
| xizi_double_link_head_rec | 4 | 1 |
| xizi_double_link_init | 1 | 1 |
| xizi_double_link_init_then_empty | 5 | 4 |
| xizi_double_link_init_then_insert_before | 4 | 4 |
| xizi_double_link_init_then_len | 8 | 5 |
| xizi_double_link_insert_after | 7 | 4 |
| xizi_double_link_insert_before | 7 | 4 |
| xizi_double_link_len | 6 | 2 |
| xizi_double_link_next | 7 | 3 |
| xizi_double_link_next_rec_last | 7 | 3 |
| xizi_double_link_next_rec_middle | 7 | 3 |
| xizi_double_link_remove_node | 5 | 0 |
| xizi_single_link_append | 4 | 1 |
| xizi_single_link_empty | 3 | 1 |
| xizi_single_link_first | 2 | 0 |
| xizi_single_link_init | 1 | 2 |
| xizi_single_link_insert_after | 2 | 0 |
| xizi_single_link_len | 4 | 4 |
| xizi_single_link_next | 2 | 0 |
| xizi_single_link_remove_node | 8 | 5 |
| xizi_single_link_tail | 5 | 2 |

计时统计见 `migration_timing_summary.json`。未知计时项保留 null，不能把并行区间简单相加当作墙钟耗时。
