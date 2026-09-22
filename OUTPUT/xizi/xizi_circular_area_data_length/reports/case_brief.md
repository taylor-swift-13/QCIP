# Case Brief

在统一 FIFO 抽象状态下验证 CRTOS `CircularAreaGetDataLength`，并保证内部 `CircularAreaIsFull` 调用消费、归还同一个资源根。非空返回逻辑内容长度；空指针返回 `ERROR=1`。不修改可执行 C token 或日志。
