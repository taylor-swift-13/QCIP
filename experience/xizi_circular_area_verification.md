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
- r4 为获得精确 copy 语义，把 `memcpy` 替换成带完整数组契约和 copied-prefix loop invariant 的本地 `CircularAreaCopy`。这是语义等价的实现重构，不是纯 annotation；正式采用前必须取得用户确认。
- r6 在保留原始 `memcpy` 的干净轮次中，使第一个 wrap copy 的 exact bytes 合同成立，但第二个 `p_head` / 偏移源段调用仍无法建立。
- r7 再次从 fresh worktree 复现同一 strict QCP blocker；已尝试 exact `UCharArray` blocks、`Zlength`/上下段规范化、显式 ghost 参数、pointer-add/field-index 和 branch-local exact assertion，仍无法通过。r7 无 reference-policy 污染，因此可作为“当前 QCP 接口无法对原始 wrap `memcpy` 建立精确内容合同”的干净证据。
- 不能用 `emp/emp` 或 shape-only 合同规避；若要继续完整内容证明，需用户授权采用 r4 的等价逐字节 copy helper 重构。
