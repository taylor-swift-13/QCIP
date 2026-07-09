#!/usr/bin/env bash
# Syntax-check the C source. The QCP annotations live in /*@ ... */ comments
# and are ignored by the C compiler.
set -euo pipefail
cc="${CC:-gcc}"
cd "$(dirname "$0")"
main_c="$(find . -maxdepth 1 -type f -name 'binaryTree_*.c' -printf '%f\n' | sort | head -n 1)"
"$cc" -std=c11 -fsyntax-only -I. "$main_c"
