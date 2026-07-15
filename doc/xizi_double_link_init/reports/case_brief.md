# Case Brief

- Case：`xizi_double_link_init`
- Run：`xizi_double_link_init-20260714130001`
- 干净输入：`INPUT/xizi/xizi_double_link_init/xizi_double_link_init.c`
- 正式 annotation source：`Verification/xizi/xizi_double_link_init/xizi_double_link_init.c`
- Formal 目录：`SeparationLogic/examples/Verification/xizi/xizi_double_link_init/`
- Proof 类型：direct、predicate-first separation logic
- 功能目标：把非空哨兵的两个链接字段同时写为自身。
- 内存目标：前后均精确拥有两个互不重叠的指针字段，不分配、不释放、不遗失资源。
- 反模式：仅写纯字段等式；只描述单向链接；把 annotation 写入 `INPUT`。
- 参考策略：仅允许 `QCP_examples/QCP_demos_LLM/**`，禁止 `QCP_demos_human`。
