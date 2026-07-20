#!/usr/bin/env bash
# run_tests.sh — FloatTest 一键复现（从仓库根目录执行）
# 用法: bash FloatTest/tools/run_tests.sh <Case> [n=1000] [seed]
# 步骤: 编译参考程序 -> 生成向量 -> 生成 tests.v -> coqc 编译
set -euo pipefail
CASE="${1:?usage: run_tests.sh <Case> [n] [seed]}"
N="${2:-1000}"
SEED="${3:-0x9E3779B97F4A7C15}"

COQ="${COQ:-E:/installs/Coq-Platform~8.20~2025.01/bin/coqc.exe}"
SRC="INPUT/SAMCodeSynthesis/${CASE}"

echo "== [1/4] 编译参考程序 (${CASE})"
EXTRA_SRCS=()
if [ -f "${SRC}/std_utils.c" ]; then
  EXTRA_SRCS+=("${SRC}/std_utils.c")
fi
gcc -std=c11 -O0 -Wall -I "${SRC}" \
    "FloatTest/ref/${CASE}_main.c" "${SRC}/IP_${CASE}.c" "${EXTRA_SRCS[@]}" \
    -o "FloatTest/ref/${CASE}_main.exe"

echo "== [2/4] 生成 ${N} 条测试向量"
"./FloatTest/ref/${CASE}_main.exe" "${N}" "${SEED}" > "FloatTest/vectors/${CASE}.txt"
wc -l "FloatTest/vectors/${CASE}.txt"

echo "== [3/4] 生成 tests.v"
python -X utf8 FloatTest/tools/emit_tests.py "${CASE}"

echo "== [4/4] coqc 编译（差分测试）"
$COQ $(cat _CoqProject) "FloatTest/cases/${CASE}/tests.v"
echo "PASS: ${CASE} (${N} vectors)"
