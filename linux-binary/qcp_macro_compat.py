#!/usr/bin/env python3
"""Run an upstream QCP driver with a narrow null-macro compatibility pass.

QCP v2.1.0 attempts to evaluate every object-like macro as a preprocessing
integer expression.  A C null-pointer macro such as ``((void *)0)`` is not a
``#if`` expression, so the upstream frontend aborts on the ``void`` token.
This launcher substitutes only that exact macro definition in a temporary
copy, including directly included headers that define the same macro.
The repository source is never changed, its line numbering is kept,
and QCP is told to retain the original input filename in diagnostics.
"""

from __future__ import annotations

import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile


NULL_MACRO = re.compile(
    r"^(?P<prefix>\s*#\s*define\s+NONE\s+)\(\(void\s*\*\s*\)0\)(?P<suffix>\s*)$",
    re.MULTILINE,
)
QUOTED_INCLUDE = re.compile(
    r'^(?P<prefix>[ \t]*#[ \t]*include[ \t]+)"(?P<name>[^"\n]+)"',
    re.MULTILINE,
)


def prepare_input(source: Path, temp_root: Path, argv: list[str]) -> Path | None:
    """Rewrite exact NONE definitions in source or direct quoted headers only."""
    include_dirs = [source.parent]
    for index, argument in enumerate(argv):
        if argument == '-I' and index + 1 < len(argv):
            include_dirs.append(Path(argv[index + 1]))
        elif argument.startswith('-I') and len(argument) > 2:
            include_dirs.append(Path(argument[2:]))
    contents = source.read_text(encoding='utf-8')
    rewritten, replacements = NULL_MACRO.subn(
        lambda match: f"{match.group('prefix')}0{match.group('suffix')}", contents)
    if replacements > 1:
        raise ValueError(f'expected at most one NONE null macro in {source}, found {replacements}')
    rewritten_headers: dict[Path, Path] = {}

    def include(match: re.Match[str]) -> str:
        nonlocal replacements
        name = match.group('name')
        header = next((folder / name for folder in include_dirs if (folder / name).is_file()), None)
        if header is None:
            return match.group(0)
        header = header.resolve()
        if header in rewritten_headers:
            return f'{match.group("prefix")}"{rewritten_headers[header]}"'
        text = header.read_text(encoding='utf-8')
        changed, count = NULL_MACRO.subn(
            lambda item: f"{item.group('prefix')}0{item.group('suffix')}", text)
        if not count:
            # Moving the source must not alter quoted-include precedence.
            return f'{match.group("prefix")}"{header}"'
        if count > 1:
            raise ValueError(f'expected one NONE null macro in {header}, found {count}')
        # Redirect only the affected include, keeping source/header line counts.
        # Absolute includes preserve the original header's local dependencies.
        def local_include(item: re.Match[str]) -> str:
            dependency = header.parent / item.group('name')
            return (f'{item.group("prefix")}"{dependency.resolve()}"'
                    if dependency.is_file() else item.group(0))
        changed = QUOTED_INCLUDE.sub(local_include, changed)
        destination = temp_root / f'header_{len(rewritten_headers)}_{header.name}'
        destination.write_text(changed, encoding='utf-8')
        rewritten_headers[header] = destination
        replacements += count
        return f'{match.group("prefix")}"{destination}"'

    rewritten = QUOTED_INCLUDE.sub(include, rewritten)
    if not replacements:
        return None
    temporary_input = temp_root / source.name
    temporary_input.write_text(rewritten, encoding='utf-8')
    return temporary_input


def input_argument(argv: list[str]) -> tuple[int, str, bool] | None:
    for index, argument in enumerate(argv):
        if argument.startswith("--input-file="):
            return index, argument.split("=", 1)[1], True
        if argument == "--input-file" and index + 1 < len(argv):
            return index + 1, argv[index + 1], False
    return None


def main() -> int:
    driver_name = Path(sys.argv[0]).name
    upstream = Path(__file__).resolve().parent / "upstream-v2.1.0" / driver_name
    argv = sys.argv[1:]
    located = input_argument(argv)
    if located is None:
        os.execv(upstream, [str(upstream), *argv])

    index, displayed_input, joined = located
    source = Path(displayed_input)
    if not source.is_absolute():
        source = (Path.cwd() / source).resolve()
    with tempfile.TemporaryDirectory(prefix="qcp-null-macro-") as temp_dir:
        try:
            temporary_input = prepare_input(source, Path(temp_dir), argv)
        except ValueError as error:
            print(f'qcp_macro_compat: {error}', file=sys.stderr)
            return 2
        if temporary_input is None:
            # Leave no unused temporary directory behind when exec replaces us.
            Path(temp_dir).rmdir()
            os.execv(upstream, [str(upstream), *argv])
        forwarded = list(argv)
        if joined:
            forwarded[index] = f"--input-file={temporary_input}"
        else:
            forwarded[index] = str(temporary_input)
        if not any(arg.startswith("--input-file-name") for arg in forwarded):
            forwarded.append(f"--input-file-name={displayed_input}")
        forwarded.append(f"-I{source.parent}")
        completed = subprocess.run([str(upstream), *forwarded], check=False)
        return completed.returncode


if __name__ == "__main__":
    raise SystemExit(main())
