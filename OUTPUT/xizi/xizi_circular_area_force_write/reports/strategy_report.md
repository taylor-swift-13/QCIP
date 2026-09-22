# Strategy Report

公开前置只暴露 `circular_area_state`，指针、下标、状态位和 physical option list 均由统一资源内部 existential 管理。

成功分支不能复用普通 Write 的 FIFO 后置：真实代码在实际写入量被截断后仍把读下标追到写下标并置 full status。证明因此构造精确的 raw physical resource，并分别处理 wrap/no-wrap 字节列表更新。只有满足额外 full/recoverable 条件时，后续调用点才可建立普通 FIFO 解释。

第一轮 proof groups 因 case lib 引用了未纳入 worktree lineage 的普通 Write artifact 而失败；第二轮 annotation 将定义局部化，只依赖公共 circular-area lib 与官方库。最终四组完成 31 个 witness，parent merge 成功。
