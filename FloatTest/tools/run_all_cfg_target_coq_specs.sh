#!/usr/bin/env bash
set -euo pipefail

bash FloatTest/tools/run_mode_convert_coq_tests.sh
bash FloatTest/tools/run_attctrl_propel_coq_tests.sh
bash FloatTest/tools/run_fallback_coq_tests.sh
bash FloatTest/tools/run_target_attitude_coq_tests.sh
bash FloatTest/tools/run_selection_coq_tests.sh
bash FloatTest/tools/run_remaining_cfg_coq_tests.sh
python3 FloatTest/tools/generate_cfg_case_docs.py --check

BUILD_WORKSPACE="$(mktemp -d /tmp/floattest-all-cfg-specs-XXXXXX)"
trap 'find "$BUILD_WORKSPACE" -depth -type f -delete; find "$BUILD_WORKSPACE" -depth -type d -empty -delete' EXIT
SOURCE_GOAL_VERSION="floattest-all-cfg-specs-$(find FloatTest/cases -mindepth 2 -maxdepth 2 -name tests.v -print0 | sort -z | xargs -0 sha256sum | sha256sum | cut -c1-16)"
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
    --workspace-root "$PWD" \
    --build-workspace "$BUILD_WORKSPACE" \
    --target-file FloatTest/cases/CfgTarget_all_tests.v \
    --target-kind check \
    --source-goal-version "$SOURCE_GOAL_VERSION" \
    --timeout-seconds 300
echo "PASS: all 12 cfg_target algorithm specs"
