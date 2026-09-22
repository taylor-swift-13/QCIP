# Case Brief

- Case：`xizi_double_link_empty`
- Run：`xizi_double_link_empty-20260808185540`
- 状态：done / final-check passed
- Source version：`7521d28f78b203e9210c7fda4881358160e9e1aac4eb5b61dd5397abd0b72e12`
- Source goal version：`8b91d6eab6826562326ca7321df33d1f9057b0fe7c11e36ef9e464bb26da1844`
- OUTPUT：`OUTPUT/xizi/xizi_double_link_empty`

## 本轮目标

只读判断 sentinel 的 next 是否回到自身；公开 general spec 与单链表 empty 对齐，直接关联抽象序列是否为空与返回值，并保持 xizi_dll。

## 结论

canonical symbolic execution、VC semantic checking、group check、parent full fixed check、final-check 与 13-case suite fixed check 均通过。
