#!/usr/bin/env bash
set -euo pipefail

for CASE in ModeConvert_EIM ModeConvert_SBM; do
  SRC="INPUT/cfg_target/${CASE}"
  gcc -std=c11 -O0 -Wall -I "$SRC" \
      "FloatTest/ref/${CASE}_main.c" "$SRC/IP_${CASE}.c" \
      -o "FloatTest/ref/${CASE}_main.exe"
  "FloatTest/ref/${CASE}_main.exe" 30 > "FloatTest/vectors/${CASE}.txt"
  python3 FloatTest/tools/emit_mode_convert_tests.py "$CASE"
done

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-mode-convert-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f \( -name "ModeConvert_EIM_main.exe" -o -name "ModeConvert_SBM_main.exe" \) -delete' EXIT

SOURCE_GOAL_VERSION="floattest-mode-convert-$(sha256sum FloatTest/cases/ModeConvert_EIM/tests.v FloatTest/cases/ModeConvert_SBM/tests.v | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE/build" \
    --target-file FloatTest/cases/ModeConvert_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300

echo "PASS: ModeConvert_EIM and ModeConvert_SBM specs"
