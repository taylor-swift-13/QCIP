#!/usr/bin/env bash
set -euo pipefail
cc="${CC:-gcc}"
"$cc" -std=c11 -Wall -Wextra -fsyntax-only -I. xizi_circular_area_write_advance.c
