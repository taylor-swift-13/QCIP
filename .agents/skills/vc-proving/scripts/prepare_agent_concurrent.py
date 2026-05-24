#!/usr/bin/env python3
"""Prepare per-group work directories for concurrent proof-group solving.

Partitions goals using a vc-checking proof group plan when available, otherwise
falls back to lexicographic sort + chunk. It creates one ``group_NN/`` work
subdirectory per group, and persists ``groups_manifest.json`` at the base work dir so the run phase
(``run_agent_concurrent.py --skip-prepare``) can pick them up.

This is the required vc-proving preparation entrypoint.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from group_goals import (
    DEFAULT_CHUNK_SIZE,
    fallback_group_entries,
    group_entries_from_plan,
    load_group_plan,
)
from manual_goal_utils import (
    absolutize_coq_load_paths,
    compile_rocq_files,
    load_manifest,
    prepare_simplec_case_dependencies,
    resolve_coqc_flags,
    sorted_dependency_files,
    write_coqproject,
)
from prepare_group_workdir import prepare_group

GROUPS_MANIFEST_NAME = "groups_manifest.json"

EMBEDDED_GROUP_PLAN_KEYS = (
    "witness_group_plan",
    "proof_group_plan",
)


def prepare_groups(
    manifest_path: Path,
    lib_file: Path,
    chunk_size: int = DEFAULT_CHUNK_SIZE,
    use_rocq_mcp: bool = True,
    group_plan_path: Path | None = None,
) -> list[dict]:
    """Partition goals into groups and prepare a work dir for each.

    Writes ``<base_work_dir>/groups_manifest.json`` so the run phase can be
    invoked separately. Returns the list of group manifest dicts.
    """
    manifest = load_manifest(manifest_path)
    source_file = Path(str(manifest["source_file"])).resolve()
    lemmas = manifest["lemmas"]
    group_plan_source = "sort_chunk_fallback"
    group_plan_data = None
    if group_plan_path is not None:
        group_plan_path = group_plan_path.resolve()
        group_plan_data = load_group_plan(group_plan_path)
        group_plan_source = f"group_plan_file:{group_plan_path}"
    else:
        for key in EMBEDDED_GROUP_PLAN_KEYS:
            if manifest.get(key) is not None:
                group_plan_data = manifest[key]
                group_plan_source = f"manifest:{key}"
                break

    if group_plan_data is not None:
        group_entries = group_entries_from_plan(lemmas, group_plan_data)
        print(
            f"Grouped {len(lemmas)} goals into {len(group_entries)} proof group(s) "
            f"from {group_plan_source}"
        )
    else:
        group_entries = fallback_group_entries(lemmas, chunk_size=chunk_size)
        print(
            f"Grouped {len(lemmas)} goals into {len(group_entries)} fallback group(s) "
            f"(chunk_size={chunk_size})"
        )

    base_work_dir = Path(str(manifest["work_dir"])).resolve()
    coqproject_root, coqc_flags = resolve_coqc_flags(source_file)
    case_deps = prepare_simplec_case_dependencies(
        work_dir=base_work_dir,
        source_file=source_file,
        lib_file=lib_file,
        coqproject_root=coqproject_root,
        coqc_flags=coqc_flags,
    )
    base_coqc_flags = list(case_deps["flags"]) + absolutize_coq_load_paths(
        coqproject_root,
        coqc_flags,
    )
    write_coqproject(base_work_dir, base_coqc_flags, readonly=True)
    compile_rocq_files(
        base_work_dir,
        base_coqc_flags,
        sorted_dependency_files([str(path) for path in case_deps["files"]]),
    )

    print("\n=== Preparing group work directories ===")
    group_manifests: list[dict] = []
    canonical_groups: list[dict] = []
    for i, group_entry in enumerate(group_entries):
        group = group_entry["goals"]
        group_work_dir = base_work_dir / f"group_{i:02d}"
        gm = prepare_group(
            work_dir=group_work_dir,
            group_goals=group,
            lib_file=lib_file,
            source_file=source_file,
            use_rocq_mcp=use_rocq_mcp,
            group_meta=group_entry,
        )
        group_manifests.append(gm)
        names = ", ".join(g["name"] for g in group)
        print(f"  Group {i} ({len(group)} goals, id={gm['proof_group_id']}): {names}")
        canonical_groups.append({
            "proof_group_id": gm["proof_group_id"],
            "members": [str(g["name"]) for g in group],
            "representative_witness": gm.get("representative_witness"),
            "natural_language_proof_pattern": gm.get("natural_language_proof_pattern"),
            "shared_helper_candidates": gm.get("shared_helper_candidates"),
            "proving_hints": gm.get("proving_hints"),
            "grouping_confidence": gm.get("grouping_confidence"),
            "grouping_source": gm.get("grouping_source"),
        })

    groups_manifest_path = base_work_dir / GROUPS_MANIFEST_NAME
    groups_manifest_path.write_text(
        json.dumps(group_manifests, indent=2), encoding="utf-8"
    )
    print(f"\nGroup manifests written to {groups_manifest_path}")

    # Update top-level manifest so validate_and_merge.py and other downstream
    # tools can find task_local_scratch_lib and coqc_flags.
    manifest["coqproject_root"] = str(base_work_dir)
    manifest["coqc_flags"] = base_coqc_flags
    manifest["base_coqproject_root"] = str(coqproject_root)
    manifest["base_coqc_flags"] = coqc_flags
    manifest["case_dependency_root"] = case_deps["root"]
    manifest["case_dependency_files"] = case_deps["files"]
    manifest["case_dependency_modules"] = case_deps["modules"]
    manifest["case_dependency_module_map"] = case_deps["module_map"]
    manifest["case_dependency_task_local_scratch_lib_modules"] = case_deps[
        "task_local_scratch_lib_modules"
    ]
    manifest["case_dependency_task_local_scratch_lib_files"] = case_deps[
        "task_local_scratch_lib_files"
    ]
    manifest["dependency_mode"] = "worker_case_dependency_overlay"
    manifest["task_local_scratch_lib_file"] = str(lib_file)
    manifest["grouping_source"] = group_plan_source
    manifest["proof_groups"] = canonical_groups
    manifest["use_rocq_mcp"] = use_rocq_mcp
    manifest_path.write_text(json.dumps(manifest, indent=2), encoding="utf-8")

    return group_manifests


def load_groups_manifest(base_work_dir: Path) -> list[dict]:
    """Load the persisted list of group manifests written by ``prepare_groups``."""
    path = base_work_dir / GROUPS_MANIFEST_NAME
    if not path.is_file():
        raise SystemExit(
            f"groups_manifest not found at {path}. "
            f"Run prepare_agent_concurrent.py first."
        )
    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, list):
        raise SystemExit(f"{path} is not a JSON array")
    return data


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Prepare per-group work directories for concurrent refinement VC solving."
    )
    parser.add_argument("manifest", help="Path to manifest.json (after split_manual_goals.py)")
    parser.add_argument("task_local_scratch_lib", help="Path to task_local_scratch_lib")
    parser.add_argument("--chunk-size", type=int, default=DEFAULT_CHUNK_SIZE,
                        help=f"Fallback goal group size (default: {DEFAULT_CHUNK_SIZE})")
    parser.add_argument("--group-plan", default=None,
                        help="JSON group plan produced by vc-checking. If set, it must "
                             "cover exactly the current manifest witness set.")
    parser.add_argument("--no-rocq-mcp", action="store_true",
                        help="Disable rocq-mcp config and use plain coqc + Rocq vernacular.")
    args = parser.parse_args()

    manifest_path = Path(args.manifest).expanduser().resolve()
    lib_file = Path(args.task_local_scratch_lib).expanduser().resolve()
    if not lib_file.is_file():
        raise SystemExit(f"task_local_scratch_lib file not found: {lib_file}")

    prepare_groups(
        manifest_path=manifest_path,
        lib_file=lib_file,
        chunk_size=args.chunk_size,
        use_rocq_mcp=not args.no_rocq_mcp,
        group_plan_path=Path(args.group_plan).expanduser() if args.group_plan else None,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
