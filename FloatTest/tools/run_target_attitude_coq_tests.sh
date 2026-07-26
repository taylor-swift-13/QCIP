#!/usr/bin/env bash
set -euo pipefail

for CASE in CS_TrgtAtt_EIM CS_TrgtAtt_NWM_USU; do
  SRC="INPUT/cfg_target/${CASE}"
  EXE="FloatTest/ref/${CASE}_main.exe"
  gcc -std=c11 -O0 -Wall -I "$SRC" \
      "FloatTest/ref/${CASE}_main.c" "$SRC/IP_${CASE}.c" -lm -o "$EXE"
  "$EXE" 36 > "FloatTest/vectors/${CASE}.txt"
  python3 FloatTest/tools/emit_target_attitude_tests.py "$CASE"
done

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-target-attitude-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f \( -name "CS_TrgtAtt_EIM_main.exe" -o -name "CS_TrgtAtt_NWM_USU_main.exe" \) -delete' EXIT
SOURCE_GOAL_VERSION="floattest-target-attitude-$(sha256sum FloatTest/cases/CS_TrgtAtt_EIM/tests.v FloatTest/cases/CS_TrgtAtt_NWM_USU/tests.v | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/TargetAttitude_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: target-attitude specs"
