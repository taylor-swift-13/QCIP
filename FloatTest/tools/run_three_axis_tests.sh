#!/usr/bin/env bash
set -euo pipefail
N="${1:-30}"
gcc -std=c11 -O0 -Wall -I INPUT/SAMCodeSynthesis/ThreeAxisController FloatTest/ref/ThreeAxisController_main.c INPUT/SAMCodeSynthesis/ThreeAxisController/IP_ThreeAxisController.c INPUT/SAMCodeSynthesis/ThreeAxisController/std_utils.c -lm -o FloatTest/ref/ThreeAxisController_main.exe
FloatTest/ref/ThreeAxisController_main.exe "$N" > FloatTest/vectors/ThreeAxisController.txt
python3 FloatTest/tools/emit_three_axis_tests.py
BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-three-axis-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete' EXIT
SOURCE_GOAL_VERSION="floattest-ThreeAxisController-$(sha256sum FloatTest/cases/ThreeAxisController/tests.v | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/ThreeAxisController/tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: ThreeAxisController ($N vectors)"
