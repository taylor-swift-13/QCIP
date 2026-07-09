# Final Check Checklist — binaryTree_invert

## 1. 生成文件一致性
- [x] symexec 成功执行，生成 goal / proof_auto / proof_manual
- [x] 生成文件与 `INPUT/binaryTree/binaryTree_invert/binaryTree_invert.c` 当前版本对应

## 2. Rocq 编译（依赖顺序）
- [x] `QCIPLib/binaryTree/common/binaryTree_lib.v`
- [x] `QCIPLib/binaryTree/common/binaryTree_strategy_goal.v` / `_strategy_proof.v`
- [x] `binaryTree_invert_goal.v`
- [x] `binaryTree_invert_proof_auto.v`
- [x] `binaryTree_invert_proof_manual.v`
- [x] `binaryTree_invert_goal_check.v`（编译通过 ⇒ VC_Correct 全部满足）

## 3. Admitted / Axiom 审查
- [x] `binaryTree_invert_proof_manual.v` 无 `Admitted`、无新增 `Axiom`
- [x] `binaryTree_lib.v` 无 `Admitted`、无额外 `Axiom`

## 4. Forbidden Lemma 扫描
- [x] 扫描 `binaryTree_invert_proof_manual.v`、`binaryTree_lib.v`
- [x] 未命中 `forbidden_lemma.md` 列表中的任何 lemma

## 5. 文件结构合规
- [x] `proof_manual.v` 仅含 witness theorem 证明（手动 witness：2）
- [x] `binaryTree_lib.v` 仅含数学 spec 定义（tree_size/tree_depth/tree_mirror）与已证 helper，非算法镜像

## 6. 归档一致性
- [x] `source/` 含 `binaryTree_invert.c`、`binaryTree_def.h`、`compile.sh`
- [x] `rocq/` 含 goal / proof_auto / proof_manual / goal_check
- [x] `README.md` 提供中文复现说明

## 结论
binaryTree_invert 通过 final-check。
