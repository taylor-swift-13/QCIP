# Final Check Checklist — UartInit

## 1. 生成文件一致性

- [x] `symexec` 成功执行，生成 `IP_UartInit_goal.v`、`IP_UartInit_proof_auto.v`、`IP_UartInit_proof_manual.v`
- [x] 生成文件与 `OUTPUT/SAMCodeSynthesis/UartInit/source/IP_UartInit.c` 当前版本对应

## 2. Rocq 编译

- [x] `QCIPLib/SAMCodeSynthesis/UartInit/IP_UartInit_lib.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_auto.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_manual.v` 编译通过
- [x] `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal_check.v` 编译通过

## 3. Admitted / Axiom 审查

- [x] `IP_UartInit_proof_manual.v` 中无 `Admitted`
- [x] `IP_UartInit_lib.v` 中无 `Admitted`
- [x] `IP_UartInit_proof_manual.v` / `IP_UartInit_lib.v` 中无新增 `Axiom`

## 4. Forbidden Lemma 扫描

- [x] 扫描文件：`IP_UartInit_proof_manual.v`、`IP_UartInit_lib.v`
- [x] 未命中 `verification-orchestrator/docs/forbidden_lemma.md` 列表中的任何 lemma

## 5. 文件结构合规

- [x] `IP_UartInit_proof_manual.v` 仅包含 witness theorem 证明
- [x] `IP_UartInit_lib.v` 中保留 annotation-phase 冻结前缀，仅含数学 spec 定义与已证 helper

## 6. 归档一致性

- [x] `OUTPUT/SAMCodeSynthesis/UartInit/source/` 包含带 QCP annotation 的 `IP_UartInit.c`
- [x] `OUTPUT/SAMCodeSynthesis/UartInit/rocq/` 包含 `*_lib.v`、`*_goal.v`、`*_proof_auto.v`、`*_proof_manual.v`、`*_goal_check.v`
- [x] `OUTPUT/SAMCodeSynthesis/UartInit/README.md` 已提供中文复现说明

## 结论

UartInit 通过 final-check，可以进入 `done` 阶段。
