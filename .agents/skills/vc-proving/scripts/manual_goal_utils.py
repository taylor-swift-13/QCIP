#!/usr/bin/env python3
"""Shared helpers for refinement manual-goal split/merge verification."""

from __future__ import annotations

import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import hashlib
from pathlib import Path


LEMMA_RE = re.compile(
    r"^(?:Lemma|Theorem|Proposition|Corollary|Example|Fact|Remark)\s+"
    r"([A-Za-z0-9_']+)\s*:"
)
FORBIDDEN_TOPLEVEL_RE = re.compile(
    r"^(?:Definition|Fixpoint|CoFixpoint|Inductive|CoInductive|Notation|Axiom)\b"
)
FROM_REQUIRE_IMPORT_LINE_RE = re.compile(
    r"^From\s+([A-Za-z0-9_.]+)\s+Require\s+Import\s+([A-Za-z0-9_.\s]+)\.$"
)
REQUIRE_IMPORT_LINE_RE = re.compile(
    r"^Require\s+Import\s+([A-Za-z0-9_.\s]+)\.$"
)
SIMPLEC_EE_PREFIX = "SimpleC.EE"
DEFAULT_HELPER_IMPORT_ROOTS = (
    "Coq",
    "AUXLib",
    "SetsClass",
    "SimpleC.SL",
    "SimpleC.Common",
    "SimpleC.StrategyLib",
    "Logic",
    "MonadLib",
    "FP",
    "ListLib",
    "MaxMinLib",
    "GraphLib",
    "compcert",
    "compcert.lib",
    "String",
    "Permutation",
    "List",
    "ZArith",
    "Bool",
    "Arith",
    "Lia",
    "Psatz",
    "VST",
)
FORBIDDEN_HELPER_IMPORT_PREFIXES = (SIMPLEC_EE_PREFIX,)
FORBIDDEN_HELPER_IMPORT_LEAF_SUFFIXES = (
    "_goal",
    "_goal_check",
    "_proof_auto",
    "_proof_manual",
)


def parse_manual_file(text: str) -> tuple[str, list[dict[str, object]]]:
    """Parse a Rocq manual file into prelude text and lemma blocks."""

    lines = text.splitlines(keepends=True)
    line_offsets: list[int] = []
    offset = 0
    for line in lines:
        line_offsets.append(offset)
        offset += len(line)

    lemma_starts: list[tuple[int, str]] = []
    for idx, line in enumerate(lines):
        match = LEMMA_RE.match(line)
        if match:
            lemma_starts.append((idx, match.group(1)))

    if not lemma_starts:
        raise ValueError("No lemma blocks found in manual VC file.")

    prelude = "".join(lines[: lemma_starts[0][0]])
    lemmas: list[dict[str, object]] = []

    for pos, (start_idx, lemma_name) in enumerate(lemma_starts):
        end_idx = lemma_starts[pos + 1][0] if pos + 1 < len(lemma_starts) else len(lines)
        start_offset = line_offsets[start_idx]
        end_offset = line_offsets[end_idx] if end_idx < len(lines) else len(text)
        block = text[start_offset:end_offset]
        lemmas.append(
            {
                "name": lemma_name,
                "block": block,
                "header_line": lines[start_idx].rstrip("\n"),
                "start_line": start_idx + 1,
                "end_line": end_idx,
                "start_offset": start_offset,
                "end_offset": end_offset,
            }
        )

    return prelude, lemmas


def ensure_unique_lemma_names(lemmas: list[dict[str, object]]) -> None:
    seen: set[str] = set()
    duplicates: list[str] = []
    for lemma in lemmas:
        name = str(lemma["name"])
        if name in seen:
            duplicates.append(name)
        seen.add(name)
    if duplicates:
        dup_text = ", ".join(sorted(set(duplicates)))
        raise ValueError(f"Duplicate lemma names found: {dup_text}")


def find_single_lemma_by_name(lemmas: list[dict[str, object]], lemma_name: str) -> dict[str, object]:
    matches = [lemma for lemma in lemmas if lemma["name"] == lemma_name]
    if len(matches) != 1:
        raise ValueError(f"Expected exactly one lemma named {lemma_name}, found {len(matches)}")
    return matches[0]


def resolve_keep_dest(manual_file: Path, work_dir: str | None) -> Path:
    """Resolve the *destination* path that the work dir should be copied to
    if `--keep-workdir` is requested. The actual worker run dir is always a
    fresh directory under the repository `.tmp/` tree.
    """
    if work_dir:
        return Path(work_dir).expanduser().resolve()
    return tmp_run_parent(manual_file) / f"{manual_file.stem}__kept_manual_goals"


def find_repo_root(start: Path) -> Path:
    """Find the repository root that owns `.tmp` for this proving run."""
    current = start.resolve()
    if current.is_file():
        current = current.parent
    while current != current.parent:
        if (current / ".git").exists():
            return current
        current = current.parent
    cwd = Path.cwd().resolve()
    if (cwd / ".git").exists():
        return cwd
    raise SystemExit(f"Repository .tmp directory not found from {start}")


def tmp_run_parent(manual_file: Path) -> Path:
    """Return `.tmp/<relative-manual-dir>` for the given manual file."""
    manual_file = manual_file.resolve()
    root = find_repo_root(manual_file)
    tmp_root = root / ".tmp"
    try:
        rel_parent = manual_file.parent.relative_to(tmp_root)
        parent = tmp_root / rel_parent
        parent.mkdir(parents=True, exist_ok=True)
        return parent
    except ValueError:
        pass
    try:
        rel_parent = manual_file.parent.relative_to(root)
    except ValueError:
        digest = hashlib.sha256(str(manual_file.parent).encode("utf-8")).hexdigest()[:12]
        rel_parent = Path("external") / digest
    parent = root / ".tmp" / rel_parent
    parent.mkdir(parents=True, exist_ok=True)
    return parent


def make_run_workdir(stem: str, manual_file: Path | None = None) -> Path:
    """Create a fresh work dir under `.tmp`, never under the official case path."""
    parent = tmp_run_parent(manual_file) if manual_file else (Path.cwd() / ".tmp")
    parent.mkdir(parents=True, exist_ok=True)
    index = 0
    while True:
        suffix = f"{index:02d}"
        candidate = parent / f"{stem}__vc_proving_workers__{suffix}"
        if not candidate.exists():
            candidate.mkdir(parents=True)
            return candidate.resolve()
        index += 1


def prepare_keep_dest(keep_dest: Path, force: bool) -> None:
    """Validate the keep destination at split time. The dir is only populated
    later, in step 5, so we just check there's no collision unless --force.
    """
    if keep_dest.exists():
        if not force:
            raise SystemExit(
                f"Keep destination already exists: {keep_dest}\n"
                "Pass --force to overwrite, or rerun --keep-workdir with a different DEST."
            )
        shutil.rmtree(keep_dest)


def load_manifest(manifest_path: Path) -> dict[str, object]:
    if not manifest_path.is_file():
        raise SystemExit(f"Manifest not found: {manifest_path}")
    return json.loads(manifest_path.read_text(encoding="utf-8"))


def lemma_name_set(lemmas: list[dict[str, object]]) -> set[str]:
    return {str(lemma["name"]) for lemma in lemmas}


def lemma_by_name(lemmas: list[dict[str, object]]) -> dict[str, dict[str, object]]:
    return {str(lemma["name"]): lemma for lemma in lemmas}


def block_has_admitted(block: str) -> bool:
    return "Admitted." in block


def added_forbidden_toplevels(original_text: str, worker_text: str) -> list[str]:
    """Return forbidden top-level declarations added by a worker manual."""
    original_headers = {
        line.strip()
        for line in original_text.splitlines()
        if FORBIDDEN_TOPLEVEL_RE.match(line.strip())
    }
    added: list[str] = []
    for line in worker_text.splitlines():
        stripped = line.strip()
        if FORBIDDEN_TOPLEVEL_RE.match(stripped) and stripped not in original_headers:
            added.append(stripped)
    return added


def _normalize_require_import_line(line: str) -> str | None:
    tokens = line.strip().split()
    if not tokens:
        return None
    if len(tokens) >= 5 and tokens[0] == "From" and tokens[2:4] == ["Require", "Import"]:
        base = tokens[1]
        names: list[str] = []
        for token in tokens[4:]:
            done = token.endswith(".")
            name = token[:-1] if done else token
            if name:
                names.append(name)
            if done:
                break
        if names:
            normalized = f"From {base} Require Import {' '.join(names)}."
            if FROM_REQUIRE_IMPORT_LINE_RE.match(normalized):
                return normalized
    if len(tokens) >= 3 and tokens[0:2] == ["Require", "Import"]:
        names = []
        for token in tokens[2:]:
            done = token.endswith(".")
            name = token[:-1] if done else token
            if name:
                names.append(name)
            if done:
                break
        if names:
            normalized = f"Require Import {' '.join(names)}."
            if REQUIRE_IMPORT_LINE_RE.match(normalized):
                return normalized
    return None


def require_import_lines(text: str) -> list[str]:
    """Return top-level Require Import lines, normalized and deduplicated."""
    lines: list[str] = []
    seen: set[str] = set()
    for raw_line in text.splitlines():
        normalized = _normalize_require_import_line(raw_line)
        if normalized is None or normalized in seen:
            continue
        lines.append(normalized)
        seen.add(normalized)
    return lines


def added_require_import_lines(original_text: str, worker_text: str) -> list[str]:
    """Return Require Import lines present in worker_text but not original_text."""
    original = set(require_import_lines(original_text))
    return [line for line in require_import_lines(worker_text) if line not in original]


def require_import_modules(import_line: str) -> list[str]:
    """Expand a Require Import line to the logical modules it imports."""
    normalized = _normalize_require_import_line(import_line)
    if normalized is None:
        raise ValueError(f"Unsupported import line: {import_line}")
    from_match = FROM_REQUIRE_IMPORT_LINE_RE.match(normalized)
    if from_match:
        base = from_match.group(1)
        return [f"{base}.{name}" for name in from_match.group(2).split()]
    require_match = REQUIRE_IMPORT_LINE_RE.match(normalized)
    if require_match:
        return require_match.group(1).split()
    raise ValueError(f"Unsupported import line: {import_line}")


def imported_logical_modules(text: str) -> list[str]:
    """Return all logical modules from normalized top-level Require Import lines."""
    modules: list[str] = []
    for import_line in require_import_lines(text):
        try:
            modules.extend(require_import_modules(import_line))
        except ValueError:
            continue
    return list(dict.fromkeys(modules))


def _module_has_allowed_root(module: str, allowed_roots: tuple[str, ...]) -> bool:
    return any(module == root or module.startswith(root + ".") for root in allowed_roots)


def validate_helper_import_lines(
    import_lines: list[str],
    allowed_roots: tuple[str, ...] = DEFAULT_HELPER_IMPORT_ROOTS,
) -> list[str]:
    """Return policy errors for helper-suffix Require Import lines.

    VC proving may migrate extra library imports only as a controlled helper
    suffix dependency.  Generated case modules under SimpleC.EE remain frozen
    inputs and must not be introduced from proof search.
    """
    errors: list[str] = []
    for line in import_lines:
        try:
            modules = require_import_modules(line)
        except ValueError as exc:
            errors.append(str(exc))
            continue
        for module in modules:
            leaf = module.rsplit(".", 1)[-1]
            if any(module == prefix or module.startswith(prefix + ".")
                   for prefix in FORBIDDEN_HELPER_IMPORT_PREFIXES):
                errors.append(f"helper suffix import is not allowed for generated case module `{module}`")
                continue
            if any(leaf.endswith(suffix) for suffix in FORBIDDEN_HELPER_IMPORT_LEAF_SUFFIXES):
                errors.append(f"helper suffix import is not allowed for generated artifact `{module}`")
                continue
            if not _module_has_allowed_root(module, allowed_roots):
                roots = ", ".join(allowed_roots)
                errors.append(f"helper suffix import `{module}` is outside allowed roots: {roots}")
    return errors


def _find_coq_project(start: Path) -> Path:
    """Walk up from start to find the nearest _CoqProject."""
    current = start.resolve()
    while current != current.parent:
        if (current / "_CoqProject").is_file():
            return current
        current = current.parent
    raise SystemExit(f"_CoqProject not found in any parent of {start}")


def _parse_coq_project_flags(project_root: Path) -> list[str]:
    """Parse _CoqProject into coqc CLI flags (handles shell quoting)."""
    flags: list[str] = []
    for line in (project_root / "_CoqProject").read_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        flags.extend(shlex.split(line))
    return flags


def check_rocq_file_in_project(
    file_path: Path,
    project_root: Path,
    flags: list[str],
) -> None:
    """Compile a single .v file using an explicit `_CoqProject` context."""
    cmd = ["coqc"] + flags + [str(file_path.resolve())]
    result = subprocess.run(
        cmd,
        cwd=project_root,
        capture_output=True,
        text=True,
        preexec_fn=_set_rocq_memory_limit if os.name == "posix" else None,
    )
    if result.returncode != 0:
        output = (result.stdout + result.stderr).strip()
        if output:
            print(output, file=sys.stderr)
        raise SystemExit(result.returncode)


def check_rocq_file(file_path: Path) -> None:
    """Compile a single .v file using the nearest `_CoqProject` flags."""
    project_root = _find_coq_project(file_path.parent)
    flags = _parse_coq_project_flags(project_root)
    check_rocq_file_in_project(file_path, project_root, flags)


def check_rocq_file_with_deps(
    file_path: Path,
    dep_files: list[Path] | None = None,
    project_root: Path | None = None,
    flags: list[str] | None = None,
    force_deps: bool = False,
) -> None:
    """Compile dependency files first, then compile the target file.

    If any dependency has a stale .vo (older than the .v source), it is
    recompiled before the target file is checked.  When *force_deps* is true,
    every listed dependency is recompiled even if its `.vo` timestamp looks
    current; this is needed after task_local_scratch_lib migration because
    unchanged `_goal.v` files can still depend on the newly rebuilt `_lib.vo`.

    When *project_root* and *flags* are provided, dependencies and target are
    compiled under that explicit worker-local `_CoqProject` context.  This is
    required for vc-proving handoff artifacts that may live outside the worker
    directory but must still resolve canonical case_deps overlay imports.
    """
    if (project_root is None) != (flags is None):
        raise ValueError("project_root and flags must be provided together")

    def compile_one(path: Path) -> None:
        if project_root is not None and flags is not None:
            check_rocq_file_in_project(path, project_root, flags)
        else:
            check_rocq_file(path)

    if dep_files:
        for dep in dep_files:
            dep = dep.resolve()
            if not dep.is_file():
                continue
            vo = dep.with_suffix(".vo")
            if force_deps or not vo.exists() or vo.stat().st_mtime < dep.stat().st_mtime:
                compile_one(dep)
    compile_one(file_path)


def cleanup_work_dir(work_dir: Path) -> None:
    if work_dir.exists():
        shutil.rmtree(work_dir)


# ---------------------------------------------------------------------------
# Shared agent work-directory setup helpers
# ---------------------------------------------------------------------------

def make_readonly(path: Path) -> None:
    """Remove write permission from a file. No-op if already read-only."""
    import stat as _stat
    current = path.stat().st_mode
    desired = current & ~(_stat.S_IWUSR | _stat.S_IWGRP | _stat.S_IWOTH)
    if current != desired:
        path.chmod(desired)


def make_user_writable(path: Path) -> None:
    """Ensure the owner can overwrite an existing copied file."""
    import stat as _stat
    if not path.exists():
        return
    current = path.stat().st_mode
    desired = current | _stat.S_IWUSR
    if current != desired:
        path.chmod(desired)


def resolve_coqc_flags(file_path: Path) -> tuple[Path, list[str]]:
    """Find _CoqProject near *file_path* and return (project_root, flags)."""
    project_root = _find_coq_project(file_path.parent)
    flags = _parse_coq_project_flags(project_root)
    return project_root, flags


def absolutize_coq_load_paths(coqproject_root: Path, flags: list[str]) -> list[str]:
    """Return flags with relative ``-Q``/``-R``/``-I`` paths made absolute."""
    resolved: list[str] = []
    i = 0
    while i < len(flags):
        flag = flags[i]
        if flag in {"-Q", "-R"} and i + 2 < len(flags):
            path_arg = Path(flags[i + 1]).expanduser()
            if not path_arg.is_absolute():
                path_arg = coqproject_root / path_arg
            resolved.extend([flag, str(path_arg.resolve()), flags[i + 2]])
            i += 3
            continue
        if flag == "-I" and i + 1 < len(flags):
            path_arg = Path(flags[i + 1]).expanduser()
            if not path_arg.is_absolute():
                path_arg = coqproject_root / path_arg
            resolved.extend([flag, str(path_arg.resolve())])
            i += 2
            continue
        resolved.append(flag)
        i += 1
    return resolved


def write_coqproject(project_root: Path, flags: list[str], readonly: bool = True) -> Path:
    """Write a minimal `_CoqProject` from flags and return its path."""
    project_root.mkdir(parents=True, exist_ok=True)
    dest = project_root / "_CoqProject"
    make_user_writable(dest)
    dest.write_text(shlex.join(flags) + "\n", encoding="utf-8")
    if readonly:
        make_readonly(dest)
    return dest


def manifest_coq_project(manifest: dict) -> tuple[Path, list[str]] | None:
    """Return an explicit worker-local `_CoqProject` context from a manifest."""
    root_raw = manifest.get("coqproject_root")
    flags_raw = manifest.get("coqc_flags")
    if root_raw is None or not isinstance(flags_raw, list):
        return None
    return Path(str(root_raw)).resolve(), [str(flag) for flag in flags_raw]


def build_compile_cmd(coqproject_root: Path, flags: list[str], file_placeholder: str) -> str:
    """Build a coqc command string an agent can copy-paste from its work dir."""
    parts = ["coqc"] + absolutize_coq_load_paths(coqproject_root, flags)
    return " ".join(shlex.quote(part) for part in parts) + f" {file_placeholder}"


def simplec_case_dependency_modules(manual_text: str) -> list[str]:
    """Return SimpleC.EE case-local `_goal`/`_lib` modules imported by a manual."""
    modules: list[str] = []
    for logical in imported_logical_modules(manual_text):
        if not logical.startswith(SIMPLEC_EE_PREFIX):
            continue
        leaf = logical.rsplit(".", 1)[-1]
        if leaf.endswith("_goal") or leaf.endswith("_lib"):
            modules.append(logical)
    return list(dict.fromkeys(modules))


def simplec_overlay_dependency_modules(text: str) -> list[str]:
    """Return generated SimpleC modules that should be copied into case_deps.

    The initial proof manual usually imports only the current `<case>_goal`
    and `<case>_lib`; generated goal files can then import additional shared
    strategy modules such as `int_array_strategy_goal` and
    `int_array_strategy_proof`.  Once a namespace is represented in the local
    overlay, those support modules must be copied too so the specific `-Q`
    entry does not shadow the repository loadpath for that namespace.
    """
    modules: list[str] = []
    forbidden_suffixes = ("_proof_manual",)
    for logical in imported_logical_modules(text):
        if not logical.startswith(SIMPLEC_EE_PREFIX):
            continue
        leaf = logical.rsplit(".", 1)[-1]
        if any(leaf.endswith(suffix) for suffix in forbidden_suffixes):
            continue
        modules.append(logical)
    return list(dict.fromkeys(modules))


def _expected_task_local_lib_leaves(source_file: Path, lib_file: Path) -> list[str]:
    """Infer likely canonical `_lib` leaves for the current task_local_scratch_lib."""
    candidates: list[str] = []

    def add(raw: str) -> None:
        if raw and raw.endswith("_lib") and raw not in candidates:
            candidates.append(raw)

    lib_stem = lib_file.stem
    if lib_stem.endswith("__vc_proving_subagent_tmp_lib"):
        add(lib_stem[: -len("__vc_proving_subagent_tmp_lib")] + "_lib")
    add(lib_stem)

    source_stem = source_file.stem
    if source_stem.endswith("__vc_proving_subagent_tmp_proof_manual"):
        add(source_stem[: -len("__vc_proving_subagent_tmp_proof_manual")] + "_lib")
    if source_stem.endswith("_proof_manual"):
        add(source_stem[: -len("_proof_manual")] + "_lib")

    return candidates


def _infer_task_local_logical_module(
    lib_modules: list[str],
    lib_source_map: dict[str, Path | None],
    source_file: Path,
    lib_file: Path,
) -> str | None:
    if not lib_modules:
        return None

    expected_leaves = set(_expected_task_local_lib_leaves(source_file, lib_file))
    expected_matches = [
        module for module in lib_modules
        if module.rsplit(".", 1)[-1] in expected_leaves
    ]
    if len(expected_matches) == 1:
        return expected_matches[0]
    if len(expected_matches) > 1:
        raise SystemExit(
            "Cannot infer task_local_scratch_lib logical module; multiple imported "
            "`_lib` modules match the expected current-case name(s): "
            + ", ".join(expected_matches)
        )

    matching_task_modules = [
        module
        for module, source in lib_source_map.items()
        if source is not None and _same_file_text(source.resolve(), lib_file.resolve())
    ]
    if len(matching_task_modules) == 1:
        return matching_task_modules[0]
    if len(matching_task_modules) > 1:
        raise SystemExit(
            "Cannot infer task_local_scratch_lib logical module; multiple imported "
            "`_lib` modules have the same content as the task_local_scratch_lib: "
            + ", ".join(matching_task_modules)
        )
    if len(lib_modules) == 1:
        return lib_modules[0]
    raise SystemExit(
        "Cannot infer task_local_scratch_lib logical module from multiple `_lib` "
        "imports. Ensure the task_local_scratch_lib seed matches the current "
        "common_case_formal_lib snapshot or uses the standard scratch filename."
    )


def expand_simplec_case_dependency_modules(
    initial_modules: list[str],
    coqproject_root: Path,
    flags: list[str],
) -> list[str]:
    """Expand generated SimpleC `_goal`/`_lib` imports from dependency sources.

    Some generated proof manuals import only `<case>_goal`; the generated goal
    file then imports the canonical `_lib` module backed by
    common_case_formal_lib.  The worker overlay must still bind that module to
    task_local_scratch_lib, so dependency discovery follows generated
    `_goal` / `_lib` imports to a fixed point.
    """
    modules = list(dict.fromkeys(initial_modules))
    scanned: set[str] = set()
    index = 0
    while index < len(modules):
        logical = modules[index]
        index += 1
        if logical in scanned:
            continue
        scanned.add(logical)
        src = locate_logical_module(coqproject_root, flags, logical)
        if src is None or not src.is_file():
            continue
        try:
            text = src.read_text(encoding="utf-8")
        except OSError:
            continue
        for dep in simplec_overlay_dependency_modules(text):
            if dep not in modules:
                modules.append(dep)
    return modules


def _logical_suffix(logical_module: str, logical_root: str) -> Path | None:
    if logical_module == logical_root:
        return Path()
    prefix = logical_root + "."
    if not logical_module.startswith(prefix):
        return None
    return Path(*logical_module[len(prefix):].split("."))


def _coq_loadpath_entries(coqproject_root: Path, flags: list[str]) -> list[tuple[Path, str]]:
    entries: list[tuple[Path, str]] = []
    i = 0
    while i < len(flags):
        flag = flags[i]
        if flag in {"-Q", "-R"} and i + 2 < len(flags):
            path_arg = Path(flags[i + 1]).expanduser()
            if not path_arg.is_absolute():
                path_arg = coqproject_root / path_arg
            entries.append((path_arg.resolve(), flags[i + 2]))
            i += 3
            continue
        i += 1
    return entries


def locate_logical_module(
    coqproject_root: Path,
    flags: list[str],
    logical_module: str,
) -> Path | None:
    """Locate a `.v` source for a logical module using `_CoqProject` flags."""
    for physical_root, logical_root in _coq_loadpath_entries(coqproject_root, flags):
        suffix = _logical_suffix(logical_module, logical_root)
        if suffix is None:
            continue
        candidate = (physical_root / suffix).with_suffix(".v")
        if candidate.is_file():
            return candidate
    return None


def _same_file_text(left: Path, right: Path) -> bool:
    try:
        return left.read_text(encoding="utf-8") == right.read_text(encoding="utf-8")
    except OSError:
        return False


def _select_simplec_lib_dependency_source(
    logical_module: str,
    official_source: Path | None,
    lib_file: Path,
    task_local_logical_module: str | None,
) -> tuple[Path, bool]:
    """Return (source_path, is_task_local_scratch_lib) for a `_lib` import.

    A manual may import both a case-specific common_case_formal_lib and shared
    generated libraries such as `string_lib` or `sll_lib`.  Only the imported
    module selected for this proving round's task_local_scratch_lib should be
    replaced by that task-local copy; other `_lib` imports remain read-only
    compile dependencies copied from the on-disk source tree.
    """
    task_local = lib_file.resolve()
    if logical_module == task_local_logical_module:
        return task_local, True

    if official_source is not None:
        return official_source.resolve(), False

    raise SystemExit(
        f"Cannot locate dependency module source for {logical_module}; "
        "it is not the selected task_local_scratch_lib module"
    )


def prepare_simplec_case_dependencies(
    work_dir: Path,
    source_file: Path,
    lib_file: Path,
    coqproject_root: Path,
    coqc_flags: list[str],
) -> dict[str, object]:
    """Create a read-only case dependency overlay for generated SimpleC imports.

    QCP proof manuals import generated case modules by their final logical
    names, for example `SimpleC.EE.QCP_demos_LLM.sortArray3_goal` and
    `SimpleC.EE.QCP_demos_LLM.sortArray3_lib`.  A vc-proving round must resolve
    those imports to the current generated goal plus the current
    task_local_scratch_lib, not to stale `.vo` files compiled from the on-disk
    common_case_formal_lib and not to a scratch
    filename such as `*_vc_proving_subagent_tmp_lib.v`.

    The overlay keeps canonical logical filenames under `case_deps/` and maps
    each imported case package with a specific `-Q` entry, e.g.
    `-Q case_deps/LLM_bench/Algorithms/foo
       SimpleC.EE.LLM_bench.Algorithms.foo`.
    """
    manual_text = source_file.read_text(encoding="utf-8")
    modules = expand_simplec_case_dependency_modules(
        simplec_case_dependency_modules(manual_text),
        coqproject_root,
        coqc_flags,
    )
    dep_root = work_dir / "case_deps"
    if dep_root.exists():
        shutil.rmtree(dep_root)
    copied: list[str] = []
    module_map: dict[str, str] = {}
    task_local_modules: list[str] = []
    task_local_files: list[str] = []
    namespace_dirs: dict[str, Path] = {}
    lib_modules = [module for module in modules if module.rsplit(".", 1)[-1].endswith("_lib")]
    lib_source_map = {
        module: locate_logical_module(coqproject_root, coqc_flags, module)
        for module in lib_modules
    }
    task_local_logical_module = _infer_task_local_logical_module(
        lib_modules=lib_modules,
        lib_source_map=lib_source_map,
        source_file=source_file,
        lib_file=lib_file,
    )

    for logical in modules:
        namespace, leaf = logical.rsplit(".", 1)
        namespace_suffix = _logical_suffix(namespace, SIMPLEC_EE_PREFIX)
        if namespace_suffix is None:
            continue
        namespace_dir = dep_root / namespace_suffix
        namespace_dirs[namespace] = namespace_dir
        dest = namespace_dir / f"{leaf}.v"
        suffix = _logical_suffix(logical, SIMPLEC_EE_PREFIX)
        if suffix is None:
            continue
        if leaf.endswith("_lib"):
            official_src = lib_source_map.get(logical)
            src, is_task_local = _select_simplec_lib_dependency_source(
                logical,
                official_src,
                lib_file,
                task_local_logical_module,
            )
            if is_task_local:
                task_local_modules.append(logical)
                task_local_files.append(str(dest))
        else:
            src = locate_logical_module(coqproject_root, coqc_flags, logical)
            if src is None:
                raise SystemExit(f"Cannot locate dependency module source: {logical}")
        if not src.is_file():
            raise SystemExit(f"Dependency source not found for {logical}: {src}")
        dest.parent.mkdir(parents=True, exist_ok=True)
        make_user_writable(dest)
        shutil.copy2(src, dest)
        make_readonly(dest)
        copied.append(str(dest))
        module_map[logical] = str(dest)

    if not copied:
        return {
            "root": None,
            "flags": [],
            "files": [],
            "modules": [],
            "module_map": {},
            "task_local_scratch_lib_modules": [],
            "task_local_scratch_lib_files": [],
        }

    dep_flags: list[str] = []
    for namespace, namespace_dir in namespace_dirs.items():
        dep_flags.extend(["-Q", str(namespace_dir.resolve()), namespace])
    return {
        "root": str(dep_root),
        "flags": dep_flags,
        "files": copied,
        "modules": modules,
        "module_map": module_map,
        "task_local_scratch_lib_modules": task_local_modules,
        "task_local_scratch_lib_files": task_local_files,
    }


def sorted_dependency_files(dep_files: list[str]) -> list[Path]:
    """Compile local case dependencies in a stable, dependency-friendly order."""
    files = list(dict.fromkeys(Path(p).resolve() for p in dep_files))
    stable_order = sorted(files, key=lambda p: (0 if p.stem.endswith("_lib") else 1, p.name))
    paths_by_stem: dict[str, list[Path]] = {}
    for path in stable_order:
        paths_by_stem.setdefault(path.stem, []).append(path)
    deps: dict[Path, set[Path]] = {path: set() for path in stable_order}
    for path in stable_order:
        if not path.is_file():
            continue
        try:
            import_lines = require_import_lines(path.read_text(encoding="utf-8"))
        except OSError:
            continue
        for import_line in import_lines:
            try:
                modules = require_import_modules(import_line)
            except ValueError:
                continue
            for module in modules:
                candidates = paths_by_stem.get(module.rsplit(".", 1)[-1], [])
                if len(candidates) != 1:
                    continue
                dep = candidates[0]
                if dep != path:
                    deps[path].add(dep)

    ordered: list[Path] = []
    visiting: set[Path] = set()
    visited: set[Path] = set()

    def visit(path: Path) -> None:
        if path in visited:
            return
        if path in visiting:
            return
        visiting.add(path)
        for dep in sorted(deps.get(path, set()), key=lambda p: stable_order.index(p)):
            visit(dep)
        visiting.remove(path)
        visited.add(path)
        ordered.append(path)

    for path in stable_order:
        visit(path)
    return ordered


def compile_rocq_files(project_root: Path, flags: list[str], files: list[Path]) -> None:
    """Compile a list of Rocq files with explicit flags."""
    for file_path in files:
        check_rocq_file_in_project(
            file_path,
            project_root,
            absolutize_coq_load_paths(project_root, flags),
        )


def _set_rocq_memory_limit() -> None:
    """Apply a hard 4 GiB address-space cap to Rocq child processes."""
    try:
        import resource

        resource.setrlimit(
            resource.RLIMIT_AS,
            (ROCQ_MEMORY_LIMIT_BYTES, ROCQ_MEMORY_LIMIT_BYTES),
        )
    except Exception:
        # Best-effort guard; worker-local wrappers provide the hard kill path.
        return


def setup_lib_copy(work_dir: Path, lib_file: Path, readonly: bool = False) -> Path:
    """Copy ``lib_file`` into ``<work_dir>/lib/``. Returns the copy path.

    Parameters
    ----------
    readonly : bool
        If True, remove write permission for worker reference copies.
        If False, keep writable for explicit low-level setup callers.
    """
    lib_dir = work_dir / "lib"
    lib_dir.mkdir(exist_ok=True)
    dest = lib_dir / lib_file.name
    if dest.exists() or dest.is_symlink():
        dest.unlink()
    shutil.copy2(lib_file, dest)
    if readonly:
        make_readonly(dest)
    return dest


def copy_tutorial(work_dir: Path, tutorial_src: Path) -> list[Path]:
    """Copy tutorial(s) into ``<work_dir>/tutorial/`` (read-only).

    Accepts either a single ``.md`` file or a directory containing ``.md``
    files. Returns the list of destination paths (empty if source missing).
    """
    if not tutorial_src.exists():
        print(f"WARNING: Tutorial source not found at {tutorial_src}", file=sys.stderr)
        return []

    tutorial_dir = work_dir / "tutorial"
    tutorial_dir.mkdir(exist_ok=True)

    if tutorial_src.is_file():
        sources = [tutorial_src]
    else:
        sources = sorted(tutorial_src.glob("*.md"))

    copied: list[Path] = []
    for src in sources:
        dest = tutorial_dir / src.name
        make_user_writable(dest)
        shutil.copy2(src, dest)
        make_readonly(dest)
        copied.append(dest)
    return copied


def copy_coqproject(work_dir: Path, coqproject_root: Path) -> Path:
    """Write a worker-local `_CoqProject` with source load paths absolutized."""
    flags = absolutize_coq_load_paths(coqproject_root, _parse_coq_project_flags(coqproject_root))
    return write_coqproject(work_dir, flags, readonly=True)


def write_rocq_memory_wrappers(work_dir: Path) -> Path:
    """Create worker-local `coqc` / `coqtop` wrappers with a 4 GiB hard kill."""
    bin_dir = work_dir / "bin"
    bin_dir.mkdir(parents=True, exist_ok=True)
    guard = (Path(__file__).resolve().parent / "rocq_memory_guard.py").resolve()
    python = sys.executable

    for tool in ("coqc", "coqtop"):
        real = shutil.which(tool)
        if real is None:
            continue
        wrapper = bin_dir / tool
        make_user_writable(wrapper)
        wrapper.write_text(
            "#!/bin/sh\n"
            f"exec {shlex.quote(python)} {shlex.quote(str(guard))} "
            f"--label {shlex.quote(tool)} "
            f"--limit-bytes {ROCQ_MEMORY_LIMIT_BYTES} -- "
            f"{shlex.quote(real)} \"$@\"\n",
            encoding="utf-8",
        )
        wrapper.chmod(0o755)
    return bin_dir


def generate_rocq_mcp_config(work_dir: Path, coqproject_root: Path) -> Path | None:
    """Write ``.codex/config.toml`` for rocq-mcp. Returns path or None."""
    rocq_mcp = shutil.which("rocq-mcp")
    if rocq_mcp is None:
        print("WARNING: rocq-mcp not found in PATH — skipping .codex/config.toml",
              file=sys.stderr)
        return None
    codex_dir = work_dir / ".codex"
    codex_dir.mkdir(exist_ok=True)
    config_path = codex_dir / "config.toml"
    config_path.write_text(
        f'[mcp_servers.rocq-mcp]\n'
        f'command = "{rocq_mcp}"\n'
        f'cwd = "{coqproject_root}"\n'
        f'startup_timeout_sec = 20\n'
        f'tool_timeout_sec = 120\n',
        encoding="utf-8",
    )
    return config_path
