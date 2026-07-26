# GyroStateGet final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0002 期望 wa[0] bits `1078426586 → 1078426587`，
      coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机、完好帧（9 路）、校验错、通讯失败、
      numGyro=0（全透传）、numGyro=3（部分更新）、状态字节全 0xFF、
      errCnt 回绕
- [x] 覆盖统计：numGyro 0–9 全覆盖；元素级更新 4852、透传 4148；
      errCode=0 301、0xCC 422、bSucc 277
- [x] 重组公式与透传行为在向量上独立复核（0 失配）
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh GyroStateGet 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全；NumGyro > 9 的越界写
属 UB，不在被测行为范围内（驱动与 spec 按 NumGyro ∈ [0,9] 建模）。
