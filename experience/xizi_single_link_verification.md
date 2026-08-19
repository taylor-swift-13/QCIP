# 单链表验证工程经验

## 用户约束与交付边界

1. 单链表公共 Rocq 定义参照已完成的双链表工程风格，但以
   小改动、避免大规模重写既有证明为首要兼容性目标。
2. `QCIPLib/xizi/xizi_single_link_common/` 和
   `OUTPUT/xizi/xizi_single_link_common/rocq/` 只保留一个
   `xizi_single_link_lib.v`，不再拆成 `core` 与 `lib`。
3. 不修改 `crtosverify`；`INPUT` 始终是原始输入，不写 annotation
   或交付注释。
4. 稳定交付只写入 `OUTPUT`，不生成平行的 `doc` 快照；
   README、source、Rocq、reports、snapshot 与 reuse/checkpoint 的内容
   要求不缩减，只是归档根目录改为 OUTPUT。
5. 所有新增用户要求、设计取舍、失败路径和可复用经验都要
   持续写入 `experience/`；该要求也已固化进
   `.agents/skills/verification-entry/SKILL.md`。

## 2026-07-19：单一 lib 的最小兼容改造

- 原 `xizi_single_link_lib_core.v` 只提供 `sll_link`、`generic_sll*`、
  `SLL_LAYOUT` 和 `SLLLib`；下游证明并不直接 import 它，而是统一
  import `xizi_single_link_lib`。
- 因此最稳定的改造是把 core 内容原样前置到唯一 lib，删除
  `Require Export ..._core` 和 core 文件，同时保留所有公开定义、
  module、引理名和谓词语义。合并前后顶层声明集合均为 36 个。
- 不为了形式上像双链表而强行改名或重新抽象；工程上的
  优雅首先体现在稳定的 public surface 和单一权威定义源。

## 验证证据与工具经验

- 唯一 lib 和 strategy proof 均通过
  `.agents/skills/vc-proving/scripts/coq_tooling.py check`。
- 既有 9 个 case：`append`、`empty`、`first`、`init`、
  `insert_after`、`len`、`next`、`remove_node`、`tail` 的
  `QCIPCases/.../*_goal_check.v` 全部通过，manual proof 零改动。
- 检查时发现 `_CoqProject` 已有 `-R QCIPCases QCIPCases`，但
  `coq_tooling.py` 的 fixed mapping 漏掉该路径，使所有 QCIPCases
  goal check 都在加载前失败。正确修复是让唯一 Coq 入口与
  `_CoqProject` 对齐，不是绕过工具直接手写 coqc flags。
- 修复后 fixed flags hash 为
  `b6e5573415735fec9159c1cc3ce8cb8fe6f8818e85a322d61c1317cdf0617564`。
- 多个完整 goal check 首次构建耗时较长时，可以为每个 target
  使用独立 build workspace 并行运行；不要让并行 coqc 共享同一
  缓存目录。

## 2026-08-14：remove_node 强规约导出三个客户端规格

- `strong_spec` 继续承担函数实现证明；实际调用默认采用
  `remove_member_spec`，只有明确知道首节点或尾节点时才采用
  `remove_front_spec` / `remove_tail_spec`。
- 成员版不能使用 `Coq.Lists.List.remove`：该函数会继续递归并删除
  后续相等元素。本 case 定义 `xizi_sll_remove_first`，第一次命中后
  立即返回 suffix，精确对应 C 的首次删除。
- loop invariant 必须保留未修改入参的 snapshot 桥接：
  `linklist == linklist@pre` 与
  `linklist_node == linklist_node@pre`。缺少时 current-address heap
  资源无法推出 snapshot-address postcondition，VC 具有具体反例。
- derived spec 的核心纯性质应放在 case lib：成员关系被拆成
  `prefix ++ node :: suffix`、prefix 不含 node，并得到
  `remove_first node l = prefix ++ suffix`。
- final-check 必须真实扫描 forbidden lemma。一次可编译候选因使用
  `derivable1_trans` 与 `derivable1_sepcon_mono` 被退回；最终改成
  `xizi_sll_head_split_target` 的直接应用和 case helper 原位改写。
- 固定 Coq tooling 的裸 import 解析需要区分两类：strategy goal/proof
  被 `Include` 时必须在 build workspace 中成为真实裸模块；Flocq
  等普通跨根裸 import 仍应使用 `Require Export` wrapper，避免形成
  两套逻辑库假设。
