# 循环缓冲区写入的三个调用者版本

原 CircularAreaWrite 及其规范、证明保留。新文件包含三个独立函数，使用原写入逻辑。

- CircularAreaWriteInvalid：前条件明确参数无效；返回 ERROR，状态和输入所有权保持。
- CircularAreaWriteNormal：前条件明确有效参数、正长度、b_force=0。已满时 ERROR 且状态不变；未满时 EOK，追加 min(请求长度, 剩余空间) 个输入字节。
- CircularAreaWriteForce：前条件明确有效参数、正长度、b_force!=0；返回 EOK，逻辑内容是“原内容 ++ 输入”的最后容量个字节。

普通写允许已满和未满，调用者无需预先判定满状态。三个版本保持缓冲区容量与整个输入内存所有权。

新 case_lib 导入原共享库的状态类型和基础存储谓词，并冻结原库的写入扩展定义与已证明引理，避免隔离工作区误用旧依赖。冻结代码是复用依赖，不能作为本任务新写证明统计。

新文件的检查宏去掉恒为假的 do-while 外壳，保持条件、返回值与求值次数；预处理后的写入逻辑已核对。原文件未修改。

正式文件经 controller 最终采用并完成 freshness、固定 Coq 检查和结构检查。具体证明与工具证据见 reports/workflow；原文件内容一致性见 reports/original_preservation.json。QCP 自动生成部分的可信性边界保持原工具约定，手写证明和新增库不使用 Admitted 或新增 Axiom。
