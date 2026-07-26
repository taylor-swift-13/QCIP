#!/usr/bin/env bash
set -euo pipefail

GYRO_CASE="CS_Gyro_Att_Predict"
GYRO_SRC="INPUT/cfg_target/${GYRO_CASE}"
GYRO_EXE="FloatTest/ref/${GYRO_CASE}_main.exe"
gcc -std=c11 -O0 -Wall \
    -include FloatTest/ref/CS_Gyro_Att_Predict_stubs.h \
    -I FloatTest/ref -I "$GYRO_SRC" \
    "FloatTest/ref/${GYRO_CASE}_main.c" "$GYRO_SRC/IP_${GYRO_CASE}.c" \
    -lm -o "$GYRO_EXE"
"$GYRO_EXE" 36 > "FloatTest/vectors/${GYRO_CASE}.txt"
python3 FloatTest/tools/emit_remaining_cfg_tests.py "$GYRO_CASE"

ORBIT_CASE="CS_OrbitComputation"
ORBIT_SRC="INPUT/cfg_target/${ORBIT_CASE}"
ORBIT_TMP="$(mktemp -d /tmp/floattest-orbit-source-XXXXXX)"
python3 FloatTest/tools/extract_orbit_control_source.py \
    "$ORBIT_SRC/IP_${ORBIT_CASE}.c" "$ORBIT_TMP/orbit_control.c"
ORBIT_EXE="FloatTest/ref/${ORBIT_CASE}_main.exe"
gcc -std=c11 -O0 -Wall -I "$ORBIT_SRC" \
    "FloatTest/ref/${ORBIT_CASE}_main.c" "$ORBIT_TMP/orbit_control.c" \
    -lm -o "$ORBIT_EXE"
"$ORBIT_EXE" 30 > "FloatTest/vectors/${ORBIT_CASE}.txt"
python3 FloatTest/tools/emit_remaining_cfg_tests.py "$ORBIT_CASE"

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-remaining-cfg-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete; find "$ORBIT_TMP" -depth -type f -delete; find "$ORBIT_TMP" -depth -type d -empty -delete; find FloatTest/ref -maxdepth 1 -type f \( -name "CS_Gyro_Att_Predict_main.exe" -o -name "CS_OrbitComputation_main.exe" \) -delete' EXIT
SOURCE_GOAL_VERSION="floattest-remaining-cfg-$(sha256sum FloatTest/cases/CS_Gyro_Att_Predict/tests.v FloatTest/cases/CS_OrbitComputation/tests.v | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/Remaining_cfg_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: remaining cfg_target specs"
