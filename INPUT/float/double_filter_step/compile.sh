#!/usr/bin/env bash
set -euo pipefail
cc="${CC:-gcc}"
"$cc" -std=c11 -Wall -Wextra -fsyntax-only -I. double_filter_step.c
