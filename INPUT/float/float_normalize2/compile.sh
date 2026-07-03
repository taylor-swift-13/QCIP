#!/usr/bin/env bash
set -euo pipefail
cc="${CC:-gcc}"
"$cc" -std=c11 -Wall -Wextra -fsyntax-only -I. float_normalize2.c
