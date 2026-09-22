# 循环缓冲区调用点组合验证

本目录保存 run `xizi_circular_area_callpoint_specs-20260903180000` 的 accepted 交付。8 条调用链全部改用统一 `circular_area_state/store_circular_area`：Init 后查询/Release、空 Read/Release、首次 Write/Release、Write→Read→Release、重复 Write、Read 后再 Write、Reset 后查询/Release，以及受限的 force 写满/Release。

公开规格不再通过 `With` 暴露 backing pointer、读写下标、status 或 operations pointer；这些物理字段由 `store_circular_area` 内部 existential 管理。调用点只保留唯一 `read_one_spec`：空与非空 FIFO 由同一个 `CircularAreaReadOneResult` 分支关系描述，输出统一使用 `UCharArray::mixed_full`。

一般 force Write 仍只产生 raw force resource，不能冒充 canonical FIFO。只有 fresh、容量 4、恰写 4 字节的专用调用链通过已证明 bridge 恢复统一资源后调用 Release。

- source version：`27e8621ccd68267f4f5672a7a10f08c8221043753fb4e564a0a366228899be62`
- source-goal version：`15da2fde2298b69f88c0fe5907fc87db072189a4eb4e85931de644e7f172a542`
- manual VC：29/29；4 个证明组；helper/import：无
- parent fixed check、final-check、manual/case_lib/forbidden 扫描：通过
- isolated freshness：skipped；accepted annotation canonical symexec 到文件尾

完整 workflow 位于 `reports/workflow/xizi_circular_area_callpoint_specs-20260903180000/`。复现 symbolic execution 时必须保留 `-IQCP_examples/QCP_demos_LLM/` 和 `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM`；Rocq 检查只使用 `coq_tooling.py`。
