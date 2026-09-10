# Strategy Report

本轮不再使用 `xizi_double_link_empty_result` wrapper，也不在 general `Require` 中重复显式非空条件。VC 直接按 `nodes` 的 nil/cons 分支重建返回关系与 `xizi_dll` ownership。

证明组：`empty_general_branch_reconstruction`；未新增 helper 或 import。
