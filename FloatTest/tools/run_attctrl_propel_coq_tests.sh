#!/usr/bin/env bash
set -euo pipefail

CASE="CS_AttCtrl_Propel"
SRC="INPUT/cfg_target/${CASE}"
EXE="FloatTest/ref/${CASE}_main.exe"
gcc -std=c11 -O0 -Wall -ffunction-sections -fdata-sections \
    -Wl,--gc-sections -I "$SRC" \
    "FloatTest/ref/${CASE}_main.c" "$SRC/IP_${CASE}.c" -lm -o "$EXE"
"$EXE" 60 > "FloatTest/vectors/${CASE}.txt"
python3 FloatTest/tools/emit_attctrl_propel_tests.py

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-attctrl-propel-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f -name "CS_AttCtrl_Propel_main.exe" -delete' EXIT
SOURCE_GOAL_VERSION="floattest-${CASE}-$(sha256sum "FloatTest/cases/${CASE}/tests.v" | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file "FloatTest/cases/${CASE}/tests.v" \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: ${CASE} spec"
