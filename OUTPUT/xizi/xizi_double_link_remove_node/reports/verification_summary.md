# xizi_double_link_remove_node 验证摘要

- accepted run：`xizi_double_link_remove_node-20260817134125`
- annotation 与 canonical symbolic execution：passed，到达文件尾
- manual witnesses：3，全部完成
- parent fixed Coq check：passed
- final-check：passed
- full 23-name forbidden scan：passed
- strong spec：完整 `nodes` 与 `nodes = prefix ++ node :: suffix`，删除后 `prefix ++ suffix`
- client spec：`In(node,nodes)` 即可调用，使用 `xizi_dll_remove_first` 表达删除第一次出现，并已证明 `remove_member_spec <= strong_spec`
- scope：仅增加 member 规约；没有增加无调用证据的 front/tail 规约，也没有修改其他函数
- inherent DLL difference：被删节点重置为空循环 `xizi_dll(node,nil)`
- case-local helper：annotation-approved segment shift views；本轮无新增 helper/import
- fixed flags hash：`75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`
- source_goal_version：`1c849d11baac6ce4019b27ec691382628d97fff824a20cf973449e11d94988a0`
- final isolated symexec refresh：OUTPUT 布局未配置，记录为 skipped；accepted annotation canonical symexec 已到文件尾并绑定 generated hashes
- authoritative reports：`reports/xizi_double_link_remove_node-20260817134125/`
