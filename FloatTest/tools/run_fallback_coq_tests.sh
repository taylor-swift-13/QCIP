#!/usr/bin/env bash
set -euo pipefail

for CASE in CS_GyroData_Disposal CS_PrecessionNutationCal; do
  SRC="INPUT/cfg_target/${CASE}"
  EXE="FloatTest/ref/${CASE}_main.exe"
  gcc -std=c11 -O0 -Wall -I "$SRC" \
      "FloatTest/ref/${CASE}_main.c" "$SRC/IP_${CASE}.c" -lm -o "$EXE"
  "$EXE" 36 > "FloatTest/vectors/${CASE}.txt"
  python3 FloatTest/tools/emit_fallback_tests.py "$CASE"
done

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-fallback-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f \( -name "CS_GyroData_Disposal_main.exe" -o -name "CS_PrecessionNutationCal_main.exe" \) -delete' EXIT
SOURCE_GOAL_VERSION="floattest-fallback-$(sha256sum FloatTest/cases/CS_GyroData_Disposal/tests.v FloatTest/cases/CS_PrecessionNutationCal/tests.v | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/Fallback_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: fallback-path specs"
