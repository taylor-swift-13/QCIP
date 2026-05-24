#!/usr/bin/env python3
"""Concurrent runner for grouped refinement VC goals.

Spawns one Codex agent per prepared proof group in parallel, then merges
per-group reports. Group partitioning and per-group work directory setup live
in ``prepare_agent_concurrent.py``; each agent sees all goals in its group at
once and follows the vc-checking proof-pattern notes when present.
"""

from __future__ import annotations

import argparse
import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from agent_runner import build_group_prompt, check_codex, run_codex_agent
from manual_goal_utils import load_manifest
from prepare_agent_concurrent import (
    DEFAULT_CHUNK_SIZE,
    GROUPS_MANIFEST_NAME,
    load_groups_manifest,
    prepare_groups,
)

DEFAULT_TIMEOUT_PER_GOAL = 600  # 10 minutes per assigned goal
DEFAULT_MAX_PARALLEL = 4


# ---------------------------------------------------------------------------
# Proof report helpers
# ---------------------------------------------------------------------------

def _find_report_entry(goal_name: str, proof_report: list[dict]) -> dict | None:
    """Find the proof_report.json entry matching a goal name."""
    for entry in proof_report:
        if str(entry.get("goal", "")) == goal_name:
            return entry
    return None


def _quick_status(goal_name: str, proof_report: list[dict]) -> dict:
    """Quick status from proof_report.json (not authoritative — validate_and_merge.py validates).

    Returns {"goal": name, "status": ..., "report": ...}
    """
    entry = _find_report_entry(goal_name, proof_report)
    if entry:
        result = {"goal": goal_name, "status": str(entry.get("status", "unknown"))}
        if entry.get("report"):
            result["report"] = str(entry["report"])
        return result
    return {"goal": goal_name, "status": "no_report"}


def _load_proof_report(work_dir: Path) -> list[dict]:
    """Load proof_report.json from work dir, or empty list if missing."""
    report_path = work_dir / "proof_report.json"
    if not report_path.exists():
        return []
    try:
        data = json.loads(report_path.read_text(encoding="utf-8"))
        return data if isinstance(data, list) else []
    except (json.JSONDecodeError, ValueError):
        return []


def _load_strategy_report(work_dir: Path) -> dict | None:
    """Load proof_strategy_report.json from a group work dir, or None if missing."""
    path = work_dir / "proof_strategy_report.json"
    if not path.exists():
        return None
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        return data if isinstance(data, dict) else None
    except (json.JSONDecodeError, ValueError):
        return None


def _merge_proof_reports(group_work_dirs: list[Path], dest: Path) -> list[dict]:
    """Merge per-group proof_report.json files into one at *dest*.

    Returns the merged list. The merged file has the same format as a single
    worker's proof_report.json, so validate_and_merge.py can read it directly
    from the concurrent pipeline output.
    """
    merged: list[dict] = []
    for work_dir in group_work_dirs:
        merged.extend(_load_proof_report(work_dir))
    dest.write_text(json.dumps(merged, indent=2), encoding="utf-8")
    return merged


def _merge_strategy_reports(group_work_dirs: list[Path], dest: Path) -> list[dict]:
    """Merge per-group proof_strategy_report.json files into one at *dest*.

    Returns a list of group strategy reports (each tagged with its group index).
    """
    merged: list[dict] = []
    for i, work_dir in enumerate(group_work_dirs):
        report = _load_strategy_report(work_dir)
        if report is not None:
            merged.append({"group": i, "work_dir": str(work_dir), **report})
    dest.write_text(json.dumps(merged, indent=2), encoding="utf-8")
    return merged


# ---------------------------------------------------------------------------
# Run agents
# ---------------------------------------------------------------------------

def run_agents(
    group_manifests: list[dict],
    max_parallel: int = DEFAULT_MAX_PARALLEL,
    timeout: int | None = None,
    timeout_per_goal: int = DEFAULT_TIMEOUT_PER_GOAL,
    only_groups: list[int] | None = None,
) -> dict[int, int]:
    """Spawn one Codex agent per prepared group in parallel.

    Parameters
    ----------
    only_groups : list[int] | None
        If provided, only spawn agents for these group indices. Default is
        all groups.

    Returns a dict mapping group_idx -> exit_code.
    """
    codex = check_codex()
    agent_results: dict[int, int] = {}

    if only_groups is None:
        target_indices = list(range(len(group_manifests)))
    else:
        target_indices = sorted(set(only_groups))
        for idx in target_indices:
            if not (0 <= idx < len(group_manifests)):
                raise SystemExit(
                    f"Invalid group index {idx}: must be in 0..{len(group_manifests) - 1}"
                )

    def _run_group(group_idx: int) -> tuple[int, int]:
        gm = group_manifests[group_idx]
        work_dir = Path(gm["work_dir"])
        goal_files = [Path(str(e["split_rocq_file"])).name for e in gm["goals"]]
        worker_manual_raw = gm.get("worker_manual_file")
        worker_helper_raw = gm.get("worker_helper_scratch_lib_file")
        worker_manual = Path(str(worker_manual_raw)).name if worker_manual_raw else None
        worker_helper_scratch_lib = None
        if worker_helper_raw:
            worker_helper_path = Path(str(worker_helper_raw))
            try:
                worker_helper_scratch_lib = str(worker_helper_path.resolve().relative_to(work_dir.resolve()))
            except ValueError:
                worker_helper_scratch_lib = worker_helper_path.name
        proof_group_id = str(gm.get("proof_group_id", f"group_{group_idx:02d}"))
        prompt = build_group_prompt(
            goal_files,
            worker_manual,
            worker_helper_scratch_lib,
            proof_group_id,
        )
        if timeout is not None:
            agent_timeout = timeout
        else:
            agent_timeout = timeout_per_goal * len(gm["goals"])
        exit_code = run_codex_agent(
            work_dir,
            prompt,
            agent_timeout,
            codex=codex,
            use_rocq_mcp=use_rocq_mcp,
        )
        return group_idx, exit_code

    if only_groups is None:
        print(f"\n=== Solving all {len(target_indices)} group(s) (max_parallel={max_parallel}) ===")
    else:
        print(f"\n=== Solving groups {target_indices} (max_parallel={max_parallel}) ===")
    with ThreadPoolExecutor(max_workers=max_parallel) as pool:
        futures = {
            pool.submit(_run_group, i): i
            for i in target_indices
        }
        for future in as_completed(futures):
            group_idx, exit_code = future.result()
            agent_results[group_idx] = exit_code
            status = "OK" if exit_code == 0 else f"FAIL (exit {exit_code})"
            print(f"  Group {group_idx}: {status}")

    return agent_results


# ---------------------------------------------------------------------------
# Finalize (merge reports and summarize)
# ---------------------------------------------------------------------------

def finalize(group_manifests: list[dict], base_work_dir: Path) -> dict:
    """Merge per-group reports and print a summary.

    Returns ``{"status_counts": ..., "groups": ...}``.
    """
    group_work_dirs = [Path(gm["work_dir"]) for gm in group_manifests]
    merged_report_path = base_work_dir / "proof_report.json"
    merged_report = _merge_proof_reports(group_work_dirs, merged_report_path)
    print(f"Merged proof_report.json written to {merged_report_path}")

    merged_strategy_path = base_work_dir / "proof_strategy_report.json"
    merged_strategies = _merge_strategy_reports(group_work_dirs, merged_strategy_path)
    print(f"Merged proof_strategy_report.json written to {merged_strategy_path}"
          f" ({len(merged_strategies)} group(s) reported)")

    print("\n=== Agent Reports (from proof_report.json) ===")
    summary: dict[str, list[dict]] = {}
    status_counts: dict[str, int] = {}

    for i, gm in enumerate(group_manifests):
        group_results = []
        for entry in gm["goals"]:
            name = str(entry["name"])
            result = _quick_status(name, merged_report)
            group_results.append(result)
            s = result["status"]
            status_counts[s] = status_counts.get(s, 0) + 1

        summary[f"group_{i}"] = group_results

        print(f"\n  Group {i}:")
        for r in group_results:
            status_str = r["status"]
            if r.get("report"):
                status_str += f" — {r['report']}"
            print(f"    {r['goal']}: {status_str}")

    print(f"\n=== Quick Summary (agent-reported, not yet validated) ===")
    for s, count in sorted(status_counts.items()):
        print(f"  {s}: {count}")
    print(f"  total: {sum(status_counts.values())}")
    print(f"\nRun validate_and_merge.py for authoritative validation.")

    summary_path = base_work_dir / "concurrent_summary.json"
    summary_path.write_text(json.dumps({
        "status_counts": status_counts,
        "groups": summary,
    }, indent=2), encoding="utf-8")

    return {"status_counts": status_counts, "groups": summary}


# ---------------------------------------------------------------------------
# Full pipeline (default: prepare + run + finalize)
# ---------------------------------------------------------------------------

def run_concurrent(
    manifest_path: Path,
    lib_file: Path,
    max_parallel: int = DEFAULT_MAX_PARALLEL,
    chunk_size: int = DEFAULT_CHUNK_SIZE,
    timeout: int | None = None,
    timeout_per_goal: int = DEFAULT_TIMEOUT_PER_GOAL,
    use_rocq_mcp: bool = True,
    group_plan_path: Path | None = None,
) -> dict:
    """Run the full prepare + agents + finalize pipeline.

    Convenience wrapper. For more control, call ``prepare_groups``,
    ``run_agents``, and ``finalize`` separately.
    """
    manifest = load_manifest(manifest_path)
    base_work_dir = Path(str(manifest["work_dir"])).resolve()

    group_manifests = prepare_groups(
        manifest_path=manifest_path,
        lib_file=lib_file,
        chunk_size=chunk_size,
        use_rocq_mcp=use_rocq_mcp,
        group_plan_path=group_plan_path,
    )
    run_agents(
        group_manifests=group_manifests,
        max_parallel=max_parallel,
        timeout=timeout,
        timeout_per_goal=timeout_per_goal,
    )
    return finalize(group_manifests, base_work_dir)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> int:
    parser = argparse.ArgumentParser(
        description="Adaptive concurrent runner for refinement VC goals. "
                    "By default runs prepare + agents + finalize. Use --skip-prepare "
                    "to load groups_manifest.json from a prior prepare_agent_concurrent.py "
                    "run and skip straight to the agent run + finalize."
    )
    parser.add_argument("manifest", help="Path to manifest.json (after split_manual_goals.py)")
    parser.add_argument("task_local_scratch_lib", nargs="?", default=None,
                        help="Path to task_local_scratch_lib. Required unless --skip-prepare is set.")
    parser.add_argument("--max-parallel", type=int, default=DEFAULT_MAX_PARALLEL,
                        help=f"Max concurrent agents (default: {DEFAULT_MAX_PARALLEL})")
    parser.add_argument("--chunk-size", type=int, default=DEFAULT_CHUNK_SIZE,
                        help=f"Fallback goal group size (default: {DEFAULT_CHUNK_SIZE})")
    parser.add_argument("--group-plan", default=None,
                        help="JSON proof group plan produced by vc-checking. Ignored with "
                             "--skip-prepare.")
    parser.add_argument("--timeout", type=int, default=None,
                        help="Per-group timeout in seconds. If unset, computed as "
                             "--timeout-per-goal * group size.")
    parser.add_argument("--timeout-per-goal", type=int, default=DEFAULT_TIMEOUT_PER_GOAL,
                        help=f"Used when --timeout is unset to compute per-group timeout "
                             f"(default: {DEFAULT_TIMEOUT_PER_GOAL}s).")
    parser.add_argument("--skip-prepare", action="store_true",
                        help="Skip preparation; load groups_manifest.json written by a "
                             "prior prepare_agent_concurrent.py run, spawn agents, and finalize.")
    parser.add_argument("--skip-finalize", action="store_true",
                        help="Skip report merge and summary.")
    parser.add_argument("--no-rocq-mcp", action="store_true",
                        help="Disable rocq-mcp config and use plain coqc + Rocq vernacular.")
    parser.add_argument("--groups", type=int, nargs="+", default=None, metavar="IDX",
                        help="Only run agents for these group indices (0-based). "
                             "Default: all groups. Useful with --skip-prepare for "
                             "selective re-runs (e.g. --groups 2 to redo just group 2).")
    args = parser.parse_args()

    manifest_path = Path(args.manifest).expanduser().resolve()
    manifest = load_manifest(manifest_path)
    base_work_dir = Path(str(manifest["work_dir"])).resolve()

    # --- Prepare phase ---
    if args.skip_prepare:
        group_manifests = load_groups_manifest(base_work_dir)
        if args.no_rocq_mcp:
            for gm in group_manifests:
                gm["use_rocq_mcp"] = False
        print(f"Loaded {len(group_manifests)} group manifest(s) from "
              f"{base_work_dir / GROUPS_MANIFEST_NAME}")
    else:
        if args.task_local_scratch_lib is None:
            raise SystemExit("task_local_scratch_lib is required for the prepare phase")
        lib_file = Path(args.task_local_scratch_lib).expanduser().resolve()
        if not lib_file.is_file():
            raise SystemExit(f"task_local_scratch_lib file not found: {lib_file}")
        group_manifests = prepare_groups(
            manifest_path=manifest_path,
            lib_file=lib_file,
            chunk_size=args.chunk_size,
            use_rocq_mcp=not args.no_rocq_mcp,
            group_plan_path=Path(args.group_plan).expanduser() if args.group_plan else None,
        )

    # --- Agent run phase ---
    agent_results = run_agents(
        group_manifests=group_manifests,
        max_parallel=args.max_parallel,
        timeout=args.timeout,
        timeout_per_goal=args.timeout_per_goal,
        only_groups=args.groups,
    )
    any_agent_failed = any(code != 0 for code in agent_results.values())

    # --- Finalize phase ---
    if args.skip_finalize:
        print("\n--skip-finalize: skipping copy-back and merge.")
        return 1 if any_agent_failed else 0

    if args.groups is not None:
        print(
            "\n--groups was set, so this is a partial run. Skipping finalize to avoid "
            "mixing stale and fresh per-group reports.\n"
            "Re-run without --groups (or with --skip-prepare and no --groups) to finalize "
            "once all groups are up to date."
        )
        return 1 if any_agent_failed else 0

    result = finalize(group_manifests, base_work_dir)
    counts = result["status_counts"]
    if any_agent_failed:
        return 1
    if counts.get("solved", 0) == sum(counts.values()):
        return 0
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
