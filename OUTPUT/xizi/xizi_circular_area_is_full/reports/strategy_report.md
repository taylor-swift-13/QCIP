# Strategy Report

函数内部 assertion 打开 `store_circular_area` 的 representation，再用 `CircularAreaLogicalState` 的 full equivalence 把等下标/status 分支转换为公开的 FIFO 长度结果。返回前重新封装原抽象 state，representation witness 不进入 public `With`。
