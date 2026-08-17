#!/usr/bin/env python3
"""Inventory or audit QCIP FloatTest iplib deliveries."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path


REQUIRED = (
    "README.md",
    "source/{case}_main.c",
    "rocq/spec.v",
    "rocq/tests.v",
    "reports/vectors.txt",
    "reports/final_checklist.md",
)
EVIDENCE = (
    "reports/coqc_check_evidence.json",
    "reports/vector_freshness.json",
    "reports/timing_summary.json",
)
BUILD_SUFFIXES = {".vo", ".vos", ".vok", ".glob", ".aux", ".exe"}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def case_names(root: Path, relative: str) -> set[str]:
    base = root / relative
    return {path.name for path in base.iterdir() if path.is_dir()} if base.is_dir() else set()


def audit_case(root: Path, case: str, require_evidence: bool) -> dict[str, object]:
    base = root / "OUTPUT" / "iplib" / case
    errors: list[str] = []
    for pattern in REQUIRED + (EVIDENCE if require_evidence else ()):
        relative = pattern.format(case=case)
        if not (base / relative).is_file():
            errors.append(f"missing {relative}")

    vectors = base / "reports" / "vectors.txt"
    tests = base / "rocq" / "tests.v"
    spec = base / "rocq" / "spec.v"
    checklist = base / "reports" / "final_checklist.md"
    rows = [line.split() for line in vectors.read_text().splitlines() if line.strip()] if vectors.is_file() else []
    widths = sorted({len(row) for row in rows})

    if rows and len(widths) != 1:
        errors.append(f"mixed vector widths {widths}")
    if tests.is_file():
        text = tests.read_text()
        if text.count("Example t_") != len(rows):
            errors.append("positive theorem count differs from vector count")
        if "negative_control_wrong_expected" not in text:
            errors.append("missing negative control")
    formal = "".join(path.read_text() for path in (spec, tests) if path.is_file())
    if re.search(r"\b(?:Admitted|Axiom)\b", formal):
        errors.append("formal files contain Admitted or Axiom")
    if checklist.is_file() and "- [ ]" in checklist.read_text():
        errors.append("final checklist has unchecked items")

    if require_evidence:
        evidence_path = base / EVIDENCE[0]
        freshness_path = base / EVIDENCE[1]
        timing_path = base / EVIDENCE[2]
        loaded: dict[Path, dict[str, object]] = {}
        for path in (evidence_path, freshness_path, timing_path):
            if path.is_file():
                try:
                    data = json.loads(path.read_text())
                except (json.JSONDecodeError, UnicodeDecodeError) as exc:
                    errors.append(f"invalid JSON {path.name}: {exc}")
                    continue
                loaded[path] = data
                if data.get("status") != "passed":
                    errors.append(f"{path.name} status is not passed")
        if evidence_path in loaded:
            evidence = loaded[evidence_path]
            if evidence.get("returncode") != 0:
                errors.append("coqc returncode is not zero")
        if freshness_path in loaded and rows:
            freshness = loaded[freshness_path]
            if freshness.get("total_count") != len(rows):
                errors.append("freshness total_count differs from vector count")
            if widths and freshness.get("columns_per_vector") != widths[0]:
                errors.append("freshness columns_per_vector differs from vectors")
            if freshness.get("vector_sha256") != digest(vectors):
                errors.append("freshness vector_sha256 differs from vectors")

    artifacts = [str(path.relative_to(base)) for path in base.rglob("*")
                 if path.is_file() and path.suffix in BUILD_SUFFIXES]
    if artifacts:
        errors.append("build artifacts: " + ", ".join(artifacts))

    return {
        "case": case,
        "status": "passed" if not errors else "failed",
        "vector_count": len(rows),
        "columns_per_vector": widths[0] if len(widths) == 1 else None,
        "errors": errors,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--case")
    parser.add_argument("--require-evidence", action="store_true")
    args = parser.parse_args()
    root = args.repo_root.resolve()

    inputs = case_names(root, "INPUT/iplib")
    outputs = case_names(root, "OUTPUT/iplib")
    result: dict[str, object] = {
        "input_count": len(inputs),
        "output_count": len(outputs),
        "missing_outputs": sorted(inputs - outputs),
        "orphan_outputs": sorted(outputs - inputs),
    }
    exit_code = 0
    if args.case:
        if args.case not in outputs:
            result["audit"] = {"case": args.case, "status": "failed",
                               "errors": ["OUTPUT/iplib case directory does not exist"]}
            exit_code = 1
        else:
            audit = audit_case(root, args.case, args.require_evidence)
            result["audit"] = audit
            exit_code = 0 if audit["status"] == "passed" else 1
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
