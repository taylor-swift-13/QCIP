#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$repo_root"

gcc -std=c11 -Wall -Wextra -fsyntax-only \
  INPUT/float/float_store/store_float_direct.c \
  INPUT/float/float_store/store_float_struct.c

linux-binary/symexec \
  --goal-file=INPUT/float/float_store/store_float_direct_goal.v \
  --proof-auto-file=INPUT/float/float_store/store_float_direct_proof_auto.v \
  --proof-manual-file=INPUT/float/float_store/store_float_direct_proof_manual.v \
  --coq-logic-path=FloatStore \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=INPUT/float/float_store/store_float_direct.c \
  --no-exec-info

linux-binary/symexec \
  --goal-file=INPUT/float/float_store/store_float_struct_goal.v \
  --proof-auto-file=INPUT/float/float_store/store_float_struct_proof_auto.v \
  --proof-manual-file=INPUT/float/float_store/store_float_struct_proof_manual.v \
  --coq-logic-path=FloatStore \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=INPUT/float/float_store/store_float_struct.c \
  --no-exec-info
