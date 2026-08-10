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

# 本仓库 Windows 环境只有 python（无 python3）；优先 python3，自动回退
PYTHON="${PYTHON:-python3}"
command -v "${PYTHON}" >/dev/null 2>&1 || PYTHON=python

# 源码目录：iplib（source/ 子目录）或 SAMCodeSynthesis
if [ -d "INPUT/iplib/${CASE}/source" ]; then
  SRC="INPUT/iplib/${CASE}/source"
else
  SRC="INPUT/SAMCodeSynthesis/${CASE}"
fi

# 产物目录：OUTPUT/iplib 或 OUTPUT/SAMCodeSynthesis；否则旧布局（PseudoRate）
CASE_DIR=""
for base in OUTPUT/iplib OUTPUT/SAMCodeSynthesis; do
  if [ -d "${base}/${CASE}" ]; then CASE_DIR="${base}/${CASE}"; break; fi
done
if [ -n "${CASE_DIR}" ]; then
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

# 每个 case 可选的额外编译参数（如 -DWKMD_EIM=0x11）
EXTRA_CFLAGS=()
if [ -n "${CASE_DIR}" ] && [ -f "${CASE_DIR}/source/${CASE}_cflags.txt" ]; then
  read -r -a EXTRA_CFLAGS < "${CASE_DIR}/source/${CASE}_cflags.txt"
fi

mkdir -p .tmp/floattest
EXE=".tmp/floattest/${CASE}_main.exe"

echo "== [1/5] 编译参考程序 (${CASE})"
EXTRA_SRCS=()
if [ -f "${SRC}/std_utils.c" ]; then
  EXTRA_SRCS+=("${SRC}/std_utils.c")
fi
# 每个 case 可选的额外源文件清单（如三角 case 用 FloatTest/ref/ported_trig.c），
# 每行一个仓库根目录相对路径
if [ -n "${CASE_DIR}" ] && [ -f "${CASE_DIR}/source/${CASE}_extra_srcs.txt" ]; then
  while IFS= read -r src_line; do
    [ -n "${src_line}" ] && EXTRA_SRCS+=("${src_line}")
  done < "${CASE_DIR}/source/${CASE}_extra_srcs.txt"
fi
gcc -std=c11 -O0 -Wall -I "${SRC}" "${EXTRA_CFLAGS[@]}" \
    "${DRIVER}" "${SRC}/IP_${CASE}.c" "${EXTRA_SRCS[@]}" \
    -lm -o "${EXE}"

echo "== [2/5] 生成 ${N} 条测试向量"
"./${EXE}" "${N}" "${SEED}" > "${VEC}"
wc -l "${VEC}"

echo "== [3/5] 生成 tests.v"
"${PYTHON}" -X utf8 FloatTest/tools/emit_tests.py "${CASE}"

if [ -d "${CASE_DIR}" ]; then
  echo "== [4/5] 编译公共库与 spec"
  "$COQ" $(cat _CoqProject) "FloatTest/lib/FloatTestCommon.v"
  # FloatTrig.vo 依赖 FloatTestCommon.vo，必须在其后重编译以保持摘要一致
  "$COQ" $(cat _CoqProject) "FloatTest/lib/FloatTrig.v"
  # case 可声明额外 Rocq spec 依赖，每行一个仓库相对路径，按顺序编译。
  if [ -f "${CASE_DIR}/source/${CASE}_coq_deps.txt" ]; then
    while IFS= read -r coq_dep; do
      [ -n "${coq_dep}" ] && "$COQ" $(cat _CoqProject) "${coq_dep}"
    done < "${CASE_DIR}/source/${CASE}_coq_deps.txt"
  fi
  "$COQ" $(cat _CoqProject) "${SPEC}"

  echo "== [5/5] coqc 编译（差分测试）"
  "$COQ" $(cat _CoqProject) "${TESTS}"
else
  echo "== [4/4] 固定 Coq 工具检查（差分测试）"
  BUILD_WORKSPACE="$(mktemp -d "/tmp/floattest-${CASE}-XXXXXX")"
  trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete' EXIT
  SOURCE_GOAL_VERSION="floattest-${CASE}-$(sha256sum "${TESTS}" | cut -c1-16)"
  # coq_tooling.py 以裸名 coqc 调起进程：把 $COQ 所在目录补进 PATH
  # （Git Bash 的 PATH 转换只认 /e/... 形式，E:/... 形式会被拆坏，故先 cygpath -u）
  COQ_DIR="$(dirname "$(cygpath -u "${COQ}")")"
  PATH="${COQ_DIR}:$PATH" "${PYTHON}" .agents/skills/vc-proving/scripts/coq_tooling.py check \
      --workspace-root "$PWD" \
      --build-workspace "$BUILD_WORKSPACE" \
      --target-file "${TESTS}" \
      --target-kind check \
      --source-goal-version "$SOURCE_GOAL_VERSION" \
      --timeout-seconds 300
fi
echo "PASS: ${CASE} (${N} vectors)"
