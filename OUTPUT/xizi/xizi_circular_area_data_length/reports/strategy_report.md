# Strategy Report

使用公共 `store_circular_area` 打开实现表示，借助 `CircularAreaLogicalState` 和 seed 中的非满取模长度引理处理 uint32 算术。跨函数调用保留单一 `area_addr` ghost，使 IsFull 的 pre/post 所有权根相同；不把物理表示重新暴露到各函数 `With`。
