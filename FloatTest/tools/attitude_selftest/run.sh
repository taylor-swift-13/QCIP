#!/usr/bin/env bash
set -euo pipefail

N="${1:-10000}"
BUILD_ROOT="$(mktemp -d /tmp/attitude-selftest-XXXXXX)"
trap 'find "$BUILD_ROOT" -depth -type f -delete; find "$BUILD_ROOT" -depth -type d -empty -delete' EXIT

gcc -std=c11 -O0 -Wall -Wextra -fno-builtin-sin -fno-builtin-cos -fno-builtin-sqrt \
  FloatTest/tools/attitude_selftest/check.c \
  FloatTest/ref/iplib_attitude_helpers.c FloatTest/ref/ported_trig.c FloatTest/ref/ported_sqrt.c \
  -lm -o "$BUILD_ROOT/check"

"$BUILD_ROOT/check" "$N"
