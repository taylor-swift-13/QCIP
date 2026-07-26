#!/usr/bin/env bash
set -euo pipefail

for CASE in CS_Ctrl_Att_Rate CS_IRES_Attitude CS_Track_Atti; do
  SRC="INPUT/cfg_target/${CASE}"
  EXE="FloatTest/ref/${CASE}_main.exe"
  gcc -std=c11 -O0 -Wall -I "$SRC" \
      "FloatTest/ref/${CASE}_main.c" "$SRC/IP_${CASE}.c" -lm -o "$EXE"
  COUNT=36
  if [ "$CASE" = "CS_Ctrl_Att_Rate" ]; then COUNT=35; fi
  if [ "$CASE" = "CS_IRES_Attitude" ]; then COUNT=30; fi
  "$EXE" "$COUNT" > "FloatTest/vectors/${CASE}.txt"
  python3 FloatTest/tools/emit_selection_tests.py "$CASE"
done

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-selection-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f \( -name "CS_Ctrl_Att_Rate_main.exe" -o -name "CS_IRES_Attitude_main.exe" -o -name "CS_Track_Atti_main.exe" \) -delete' EXIT
SOURCE_GOAL_VERSION="floattest-selection-$(sha256sum FloatTest/cases/CS_Ctrl_Att_Rate/tests.v FloatTest/cases/CS_IRES_Attitude/tests.v FloatTest/cases/CS_Track_Atti/tests.v | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/Selection_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: selection/zero-conversion specs"
