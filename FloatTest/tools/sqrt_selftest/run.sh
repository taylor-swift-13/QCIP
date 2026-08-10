#!/usr/bin/env bash
# run.sh — ported_sqrt.c（C, musl 移植）与 fp64_sqrt（Coq）的逐比特差分自测
# 从仓库根目录执行: bash FloatTest/tools/sqrt_selftest/run.sh [n=2000] [seed]
set -euo pipefail
N="${1:-2000}"
SEED="${2:-0x9E3779B97F4A7C15}"
DIR="FloatTest/tools/sqrt_selftest"

COQ="${COQ:-E:/installs/Coq-Platform~8.20~2025.01/bin/coqc.exe}"

# 本仓库 Windows 环境只有 python（无 python3）；优先 python3，自动回退
PYTHON="${PYTHON:-python3}"
command -v "${PYTHON}" >/dev/null 2>&1 || PYTHON=python

mkdir -p .tmp/floattest

echo "== [1/5] 编译自测参考程序（ported_sqrt.c shadow libm sqrt）"
gcc -std=c11 -O0 -Wall -fno-builtin-sqrt \
    "${DIR}/sqrt_main.c" FloatTest/ref/ported_sqrt.c \
    -o .tmp/floattest/sqrt_selftest.exe

echo "== [2/5] 生成向量（定向 + ${N} 随机）"
./.tmp/floattest/sqrt_selftest.exe "${N}" "${SEED}" > "${DIR}/vectors.txt"
wc -l "${DIR}/vectors.txt"

echo "== [3/5] 生成 tests.v"
"${PYTHON}" -X utf8 "${DIR}/emit_sqrt_tests.py"

echo "== [4/5] 编译公共库"
"$COQ" $(cat _CoqProject) FloatTest/lib/FloatTestCommon.v

echo "== [5/5] coqc 差分测试"
"$COQ" $(cat _CoqProject) "${DIR}/tests.v"
echo "PASS: sqrt_selftest (${N} random + directed vectors)"
