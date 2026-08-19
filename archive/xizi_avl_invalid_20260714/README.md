# XiZi AVL 旧证明归档

本目录保存 2026-07-14 判定为不满足功能正确性要求的旧 AVL 验证产物，仅供审计，不再作为 active proof 使用。

归档范围：

- `OUTPUT/xizi/xizi_avl_*`：旧源码快照和旧 Rocq 证明输出；
- `QCIPCases/xizi/xizi_avl_*`：旧生成目标及证明文件；
- `QCIPLib/xizi/xizi_avl_common`：只记录树形、遗忘节点数据/高度/身份的旧公共谓词及其旧策略证明。

主要失效原因：旧 `store_tree` 的抽象树只记录左右子树形状，节点 `data` 和 `height` 被存在量化，节点物理身份也没有进入抽象模型；旧旋转规格的后置条件仅为 `store_non_empty_tree`，因此会遗忘原根、被提升节点、三棵子树以及旋转前后关系，不能证明左旋的功能语义。

新的 active 工作只针对 `xizi_avl_left_rotate`，验证用带 annotation 的 C 文件放在 `Verification/xizi/xizi_avl_left_rotate/`，干净输入保留在 `INPUT/xizi/xizi_avl_left_rotate/`。新证明不得导入或复用本归档中的旧结论。
