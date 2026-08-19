# xizi_double_link_insert_after 验证摘要

- accepted run：`xizi_double_link_insert_after-20260817150208`
- annotation 与 canonical symbolic execution：passed，到达文件尾
- manual witnesses：3，全部完成
- parent fixed Coq check：passed
- final-check：passed
- full 23-name forbidden scan：passed
- public spec：完整 `nodes + In(anchor,nodes)` 与三元 first-occurrence 插入变换
- API difference：双链表在任意数据成员后插入；单链表同名接口仅在 sentinel 后 prepend
- spec decision：现有单一一般成员规约已覆盖调用需求，不增加 strong/weak 变体
- formal changes：无；C、case-lib、manual 内容保持不变
- fixed flags hash：`75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`
- source_goal_version：`e2e9be8a2fca9b41961acf47b5ae65d910e67ce0b050c9a5eb5644b5936937a2`
- final isolated symexec refresh：OUTPUT 布局未配置，记录为 skipped；accepted annotation canonical symexec 已到文件尾并绑定 hashes
- authoritative reports：`reports/xizi_double_link_insert_after-20260817150208/`
