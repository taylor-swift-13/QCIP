#!/usr/bin/env python3
"""Rebuild FloatTest references and record byte-for-byte vector freshness."""

from __future__ import annotations

import argparse
import hashlib
import json
import shlex
import subprocess
import tempfile
import time
from pathlib import Path


SEED = "0x9E3779B97F4A7C15"
COUNT = 1000


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_words(path: Path) -> list[str]:
    return shlex.split(path.read_text(encoding="utf-8")) if path.is_file() else []


def read_lines(path: Path) -> list[str]:
    return [line.strip() for line in path.read_text(encoding="utf-8").splitlines()
            if line.strip()] if path.is_file() else []


def source_dir(root: Path, collection: str, case: str) -> Path:
    base = root / "INPUT" / collection / case
    nested = base / "source"
    return nested if nested.is_dir() else base


def relative(root: Path, path: Path) -> str:
    return path.resolve().relative_to(root.resolve()).as_posix()


def record_case(root: Path, collection: str, case: str) -> dict[str, object]:
    case_dir = root / "OUTPUT" / collection / case
    src = source_dir(root, collection, case)
    driver = case_dir / "source" / f"{case}_main.c"
    archived = case_dir / "reports" / "vectors.txt"
    evidence_path = case_dir / "reports" / "coqc_check_evidence.json"
    ip_source_file = case_dir / "source" / f"{case}_ip_source.txt"
    cflags_file = case_dir / "source" / f"{case}_cflags.txt"
    extra_sources_file = case_dir / "source" / f"{case}_extra_srcs.txt"

    ip_source_text = (ip_source_file.read_text(encoding="utf-8").strip()
                      if ip_source_file.is_file() else str(src / f"IP_{case}.c"))
    compile_sources = [driver]
    if ip_source_text != "NONE":
        path = Path(ip_source_text)
        compile_sources.append(path if path.is_absolute() else root / path)
    std_utils = src / "std_utils.c"
    if std_utils.is_file():
        compile_sources.append(std_utils)
    compile_sources.extend(root / line for line in read_lines(extra_sources_file))

    tracked_sources = set(compile_sources)
    tracked_sources.update(path for path in (case_dir / "source").iterdir()
                           if path.is_file())
    tracked_sources.update(src.glob("*.c"))
    tracked_sources.update(src.glob("*.h"))
    tracked_sources.add(root / "FloatTest" / "ref" / "orbiter_support.h")

    archived_rows = [line.split() for line in archived.read_text(encoding="utf-8").splitlines()
                     if line.strip()]
    widths = sorted({len(row) for row in archived_rows})
    if len(archived_rows) != COUNT or len(widths) != 1:
        raise RuntimeError(f"{case}: archived vector shape is {len(archived_rows)} rows/{widths}")

    with tempfile.TemporaryDirectory(prefix=f"floattest-fresh-{case}-") as temp_name:
        temp = Path(temp_name)
        executable = temp / f"{case}_main.exe"
        fresh = temp / "vectors.txt"
        compile_argv = [
            "gcc", "-std=c11", "-O0", "-Wall", "-I", str(src),
            *read_words(cflags_file), *(str(path) for path in compile_sources),
            "-lm", "-o", str(executable),
        ]
        started = time.monotonic()
        subprocess.run(compile_argv, cwd=root, check=True)
        compile_seconds = time.monotonic() - started

        started = time.monotonic()
        with fresh.open("wb") as output:
            subprocess.run([str(executable), str(COUNT), SEED], cwd=root,
                           stdout=output, check=True)
        vector_seconds = time.monotonic() - started

        identical = archived.read_bytes() == fresh.read_bytes()
        fresh_hash = sha256(fresh)

    archived_hash = sha256(archived)
    evidence = json.loads(evidence_path.read_text(encoding="utf-8"))
    coqc_passed = evidence.get("status") == "passed" and evidence.get("returncode") == 0
    status = "passed" if identical and coqc_passed else "failed"
    source_digests = {
        relative(root, path): sha256(path)
        for path in sorted(tracked_sources)
        if path.is_file()
    }
    freshness = {
        "schema_version": "floattest-vector-freshness/v1",
        "status": status,
        "case": case,
        "collection": collection,
        "total_count": len(archived_rows),
        "columns_per_vector": widths[0],
        "seed": SEED,
        "vector_sha256": archived_hash,
        "fresh_vector_sha256": fresh_hash,
        "fresh_comparison": "byte-for-byte identical" if identical else "different",
        "compile_argv": [relative(root, Path(arg)) if arg.startswith(str(root)) else arg
                         for arg in compile_argv[:-1]] + ["<temporary-executable>"],
        "source_digests": source_digests,
    }
    timing = {
        "schema_version": "floattest-timing-summary/v1",
        "status": status,
        "case": case,
        "collection": collection,
        "vector_count": COUNT,
        "seed": SEED,
        "compile_seconds": round(compile_seconds, 6),
        "fresh_vector_generation_seconds": round(vector_seconds, 6),
        "coqc_check_seconds": evidence.get("elapsed_seconds"),
    }
    (case_dir / "reports" / "vector_freshness.json").write_text(
        json.dumps(freshness, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (case_dir / "reports" / "timing_summary.json").write_text(
        json.dumps(timing, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return {
        "case": case,
        "status": status,
        "columns_per_vector": widths[0],
        "vector_sha256": archived_hash,
        "compile_seconds": timing["compile_seconds"],
        "vector_seconds": timing["fresh_vector_generation_seconds"],
        "coqc_seconds": timing["coqc_check_seconds"],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--collection", default="orbiter-new")
    parser.add_argument("--case", action="append", dest="cases")
    args = parser.parse_args()
    root = args.repo_root.resolve()
    input_root = root / "INPUT" / args.collection
    cases = args.cases or sorted(path.name for path in input_root.iterdir() if path.is_dir())
    results = [record_case(root, args.collection, case) for case in cases]
    aggregate = {
        "schema_version": "floattest-freshness-run/v1",
        "status": "passed" if all(item["status"] == "passed" for item in results) else "failed",
        "collection": args.collection,
        "case_count": len(results),
        "total_vectors": len(results) * COUNT,
        "seed": SEED,
        "results": results,
    }
    print(json.dumps(aggregate, ensure_ascii=False, indent=2))
    return 0 if aggregate["status"] == "passed" else 1


if __name__ == "__main__":
    raise SystemExit(main())
