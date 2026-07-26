# DSSDataGet final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0001 期望 royaw bits `1123823477 → 1123823478`，
      coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 字节重组公式经 endian spike 实测 + 200 条向量独立复核（0 失配）
- [x] 定向模式 8 类：随机、完好帧、校验错（0xCC）、通讯失败（bSucc=1）、
      flgSP 经 b8、flgSP 经 b9、非 1 字节（flgSP=0）、errCnt 回绕
- [x] 路径覆盖统计：errCode=0 237、0xCC 485、bSucc 278、flgSP=1 580、
      errCnt 自增 763
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh DSSDataGet 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全；`bSucc != 0` 时真实硬件
缓冲内容不定，stub 建模为"总是填入向量字节"（测试锁定 IP 逻辑行为）。
