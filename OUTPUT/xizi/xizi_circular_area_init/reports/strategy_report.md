# 证明策略

失败分支由 symbolic execution 自动闭合。成功分支使用对齐长度事实和 allocator 的 `undef_full`，构造 `repeat None` 物理列表、空逻辑 FIFO 以及 readidx/writeidx/status=0 的共享 resource。
