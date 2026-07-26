#!/usr/bin/env bash
# run_tests.sh — FloatTest 一键复现（从仓库根目录执行）
# 用法: bash FloatTest/tools/run_tests.sh <Case> [n=1000] [seed]
# 步骤: 编译参考程序 -> 生成向量 -> 生成 tests.v -> 固定 Coq 工具检查
# case 产物位置（自动识别）：
#   新布局 OUTPUT/SAMCodeSynthesis/<Case>/{source,rocq,reports}（默认）
#   旧布局 FloatTest/{ref,cases,vectors}（仅 PseudoRate 试点）
set -euo pipefail
CASE="${1:?usage: run_tests.sh <Case> [n] [seed]}"
N="${2:-1000}"
SEED="${3:-0x9E3779B97F4A7C15}"

COQ="${COQ:-E:/installs/Coq-Platform~8.20~2025.01/bin/coqc.exe}"
SRC="INPUT/SAMCodeSynthesis/${CASE}"

CASE_DIR="OUTPUT/SAMCodeSynthesis/${CASE}"
if [ -d "${CASE_DIR}" ]; then
  DRIVER="${CASE_DIR}/source/${CASE}_main.c"
  VEC="${CASE_DIR}/reports/vectors.txt"
  SPEC="${CASE_DIR}/rocq/spec.v"
  TESTS="${CASE_DIR}/rocq/tests.v"
else
  DRIVER="FloatTest/ref/${CASE}_main.c"
  VEC="FloatTest/vectors/${CASE}.txt"
  SPEC="FloatTest/cases/${CASE}/spec.v"
  TESTS="FloatTest/cases/${CASE}/tests.v"
fi

mkdir -p .tmp/floattest
EXE=".tmp/floattest/${CASE}_main.exe"

echo "== [1/5] 编译参考程序 (${CASE})"
EXTRA_SRCS=()
if [ -f "${SRC}/std_utils.c" ]; then
  EXTRA_SRCS+=("${SRC}/std_utils.c")
fi
gcc -std=c11 -O0 -Wall -I "${SRC}" \
    "${DRIVER}" "${SRC}/IP_${CASE}.c" "${EXTRA_SRCS[@]}" \
    -lm -o "${EXE}"

echo "== [2/5] 生成 ${N} 条测试向量"
"./${EXE}" "${N}" "${SEED}" > "${VEC}"
wc -l "${VEC}"

echo "== [3/5] 生成 tests.v"
python3 -X utf8 FloatTest/tools/emit_tests.py "${CASE}"

if [ -d "${CASE_DIR}" ]; then
  echo "== [4/5] 编译公共库与 spec"
  "$COQ" $(cat _CoqProject) "FloatTest/lib/FloatTestCommon.v"
  "$COQ" $(cat _CoqProject) "${SPEC}"

  echo "== [5/5] coqc 编译（差分测试）"
  "$COQ" $(cat _CoqProject) "${TESTS}"
else
  echo "== [4/4] 固定 Coq 工具检查（差分测试）"
  BUILD_WORKSPACE="$(mktemp -d "/tmp/floattest-${CASE}-XXXXXX")"
  trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete' EXIT
  SOURCE_GOAL_VERSION="floattest-${CASE}-$(sha256sum "${TESTS}" | cut -c1-16)"
  python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
      --workspace-root "$PWD" \
      --build-workspace "$BUILD_WORKSPACE" \
      --target-file "${TESTS}" \
      --target-kind check \
      --source-goal-version "$SOURCE_GOAL_VERSION" \
      --timeout-seconds 300
fi
echo "PASS: ${CASE} (${N} vectors)"
