#!/usr/bin/env python3
"""Extract the current CS_OrbitComputationFun definition for isolated testing."""

from __future__ import annotations

import argparse
from pathlib import Path


def extract_function(text: str, signature: str) -> str:
    start = text.index(signature)
    brace = text.index("{", start)
    depth = 0
    for index in range(brace, len(text)):
        if text[index] == "{":
            depth += 1
        elif text[index] == "}":
            depth -= 1
            if depth == 0:
                return text[start:index + 1] + "\n"
    raise ValueError(f"unterminated function: {signature}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    text = args.source.read_text(encoding="utf-8", errors="replace")
    function = extract_function(text, "void CS_OrbitComputationFun(void *p)")
    output = '#include "IP_CS_OrbitComputation.h"\n\n' + function
    args.output.write_text(output, encoding="utf-8", newline="\n")


if __name__ == "__main__":
    main()
