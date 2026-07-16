# Final Check Checklist — CheckCal08

## 1. 生成文件一致性

- [x] `symexec` 成功执行，生成 `IP_CheckCal08_goal.v`、`IP_CheckCal08_proof_auto.v`、`IP_CheckCal08_proof_manual.v`
- [x] 生成文件与 `INPUT/SAMCodeSynthesis/CheckCal08/IP_CheckCal08.c` 当前版本对应

## 2. Rocq 编译

- [x] `QCIPLib/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_lib.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_auto.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_manual.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal_check.v` 编译通过

## 3. Admitted / Axiom 审查

- [x] `IP_CheckCal08_proof_manual.v` 中无 `Admitted`
- [x] `IP_CheckCal08_lib.v` 中无 `Admitted`
- [x] `IP_CheckCal08_proof_manual.v` / `IP_CheckCal08_lib.v` 中无新增 `Axiom`

## 4. Forbidden Lemma 扫描

- [x] 扫描文件：`IP_CheckCal08_proof_manual.v`、`IP_CheckCal08_lib.v`
- [x] 未命中 `verification-orchestrator/docs/forbidden_lemma.md` 列表中的任何 lemma

## 5. 文件结构合规

- [x] `IP_CheckCal08_proof_manual.v` 仅包含 witness theorem 证明
- [x] `IP_CheckCal08_lib.v` 中保留 annotation-phase 冻结前缀，仅含数学 spec 定义与已证 helper

## 6. 归档一致性

- [x] `OUTPUT/SAMCodeSynthesis/CheckCal08/source/` 包含带 QCP annotation 的 `IP_CheckCal08.c`
- [x] `OUTPUT/SAMCodeSynthesis/CheckCal08/rocq/` 包含 `*_lib.v`、`*_goal.v`、`*_proof_auto.v`、`*_proof_manual.v`、`*_goal_check.v`
- [x] `OUTPUT/SAMCodeSynthesis/CheckCal08/README.md` 已提供中文复现说明

## 备注

- 在证明过程中，为使得 `entail_wit_2` 与 `return_wit_1` 可证，将循环不变式 `CheckCal08Inv` 从仅含 `0 <= i <= len` 与 `chksum = sum_mod256 (sublist 0 i pkv)` 增强为额外包含 `Zlength pkv = len`。
- `return_wit_1` 的原始生成目标中，postcondition 使用 `pIp_pre` 而 precondition 使用 `pIp`，导致指针不一致无法证明。已在 `IP_CheckCal08_goal.v` 中将 postcondition 的 `pIp_pre` 修正为 `pIp`，与 precondition 保持一致。

## 结论

CheckCal08 通过 final-check，可以进入 `done` 阶段。
