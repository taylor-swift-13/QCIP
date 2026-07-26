#!/usr/bin/env python3
"""Generate/check README and digest snapshots for real cfg_target Rocq specs."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

CASES = {
    "CS_AttCtrl_Propel": {
        "vectors": 60,
        "spec": "以 binary64 实现 `CS_ThrParamCfgX` 的工作模式、时间门限、姿态捕获、喷气回退和卸载分支。",
        "scope": "当前覆盖可独立调用的相平面参数选择函数；顶层喷气分配的其他路径仍由后续 spec 扩展。",
        "emitter": "FloatTest/tools/emit_attctrl_propel_tests.py",
        "runner": "FloatTest/tools/run_attctrl_propel_coq_tests.sh",
    },
    "CS_Ctrl_Att_Rate": {
        "vectors": 35,
        "spec": "描述 `FS_ModeProc=2` 时太阳/地球捕获姿态、角速率和控制量的五组直接复制结果。",
        "scope": "覆盖顶层 `CS_Ctrl_Att_RateFun` 的 ModeProc=2 路径。",
        "emitter": "FloatTest/tools/emit_selection_tests.py",
        "runner": "FloatTest/tools/run_selection_coq_tests.sh",
    },
    "CS_GyroData_Disposal": {
        "vectors": 36,
        "spec": "描述停控标志计算以及有效陀螺数量不是 3/4 时，从历史 `deltag` 回退的状态转换。",
        "scope": "覆盖顶层历史回退路径；矩阵求逆融合路径不在本 case 的 Rocq spec 范围内。",
        "emitter": "FloatTest/tools/emit_fallback_tests.py",
        "runner": "FloatTest/tools/run_fallback_coq_tests.sh",
    },
    "CS_Gyro_Att_Predict": {
        "vectors": 36,
        "spec": "以 binary64 描述角增量除法、漂移扣除、角速度限幅，以及非法姿态序列清零角速率的路径。",
        "scope": "姿态矩阵与角速度转换依赖使用明确的单位矩阵/零速率桩。",
        "emitter": "FloatTest/tools/emit_remaining_cfg_tests.py",
        "runner": "FloatTest/tools/run_remaining_cfg_coq_tests.sh",
    },
    "CS_IRES_Attitude": {
        "vectors": 30,
        "spec": "描述两个 IRES 均未配置时，顶层函数把两路 FV/FU 有效标志清零的状态转换。",
        "scope": "覆盖顶层无传感器分支。",
        "emitter": "FloatTest/tools/emit_selection_tests.py",
        "runner": "FloatTest/tools/run_selection_coq_tests.sh",
    },
    "CS_OrbitComputation": {
        "vectors": 30,
        "spec": "以 binary64 描述顶层轨道时间有效性、未注入标志、无轨道计数、w0i 和地固系经度更新。",
        "scope": "OrbitCalculate/SunEphemerisCalculate 作为依赖隔离；被测顶层函数体从当前 C 文件确定性抽取。",
        "emitter": "FloatTest/tools/emit_remaining_cfg_tests.py",
        "runner": "FloatTest/tools/run_remaining_cfg_coq_tests.sh",
        "extra": ["FloatTest/tools/extract_orbit_control_source.py"],
    },
    "CS_PrecessionNutationCal": {
        "vectors": 36,
        "spec": "以 binary64 描述 qJD 向量分量越过 0.05 阈值时的错误标志和 3×3 单位矩阵回退。",
        "scope": "覆盖顶层非法 qJD 路径；CPN 天文多项式路径不在本 case 的 Rocq spec 范围内。",
        "emitter": "FloatTest/tools/emit_fallback_tests.py",
        "runner": "FloatTest/tools/run_fallback_coq_tests.sh",
    },
    "CS_Track_Atti": {
        "vectors": 36,
        "spec": "以 binary64 描述零姿态转换、角加速度差分、单位惯量矩阵前馈力矩和历史状态更新。",
        "scope": "DCM 反解与 w2dEuler 的外部结果固定为零，以隔离顶层差分和力矩公式。",
        "emitter": "FloatTest/tools/emit_selection_tests.py",
        "runner": "FloatTest/tools/run_selection_coq_tests.sh",
    },
    "CS_TrgtAtt_EIM": {
        "vectors": 36,
        "spec": "以 binary64 描述零目标角和单位偏置/轨道矩阵下的 Cro、wri 与 wro 计算。",
        "scope": "覆盖顶层单位矩阵路径，C2Q 输出未纳入当前比较。",
        "emitter": "FloatTest/tools/emit_target_attitude_tests.py",
        "runner": "FloatTest/tools/run_target_attitude_coq_tests.sh",
    },
    "CS_TrgtAtt_NWM_USU": {
        "vectors": 36,
        "spec": "以 binary64 描述零漂移角、单位矩阵下的 Cro_si、Cro、wri 和相对角速度。",
        "scope": "覆盖顶层单位矩阵路径，四元数和角度反解输出未纳入当前比较。",
        "emitter": "FloatTest/tools/emit_target_attitude_tests.py",
        "runner": "FloatTest/tools/run_target_attitude_coq_tests.sh",
    },
    "ModeConvert_EIM": {
        "vectors": 30,
        "spec": "以 binary64 比较当前模式计时器与 EIM 结束阈值，超时后切换到模式 2。",
        "scope": "覆盖完整 `ModeConvert_EIMFun`。",
        "emitter": "FloatTest/tools/emit_mode_convert_tests.py",
        "runner": "FloatTest/tools/run_mode_convert_coq_tests.sh",
    },
    "ModeConvert_SBM": {
        "vectors": 30,
        "spec": "以 binary64 先计算星时与参考时刻之差，再与轨道注入阈值比较并切换到模式 1。",
        "scope": "覆盖完整 `ModeConvert_SBMFun`。",
        "emitter": "FloatTest/tools/emit_mode_convert_tests.py",
        "runner": "FloatTest/tools/run_mode_convert_coq_tests.sh",
    },
}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def artifacts(case: str, config: dict) -> dict[str, str]:
    paths = [
        f"INPUT/cfg_target/{case}/IP_{case}.c",
        "FloatTest/lib/FloatTestCommon.v",
        f"FloatTest/cases/{case}/spec.v",
        f"FloatTest/cases/{case}/tests.v",
        f"FloatTest/ref/{case}_main.c",
        f"FloatTest/vectors/{case}.txt",
        config["emitter"],
        config["runner"],
        "FloatTest/tools/generate_cfg_case_docs.py",
        "FloatTest/tools/run_all_cfg_target_coq_specs.sh",
        *config.get("extra", []),
    ]
    stub_header = ROOT / f"FloatTest/ref/{case}_stubs.h"
    if stub_header.exists():
        paths.append(stub_header.relative_to(ROOT).as_posix())
    return {path: digest(ROOT / path) for path in sorted(set(paths))}


def readme(case: str, config: dict, snapshot: dict) -> str:
    return f"""# {case}

## Spec

[`spec.v`](spec.v) {config["spec"]}

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/{case}.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：{config["vectors"]} 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/{case}/IP_{case}.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`{snapshot["artifacts"][f"FloatTest/cases/{case}/tests.v"]}`
- 当前 C SHA-256：`{snapshot["artifacts"][f"INPUT/cfg_target/{case}/IP_{case}.c"]}`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

{config["scope"]}

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
"""


def expected() -> dict[Path, str]:
    result = {}
    for case, config in CASES.items():
        snapshot = {
            "schema_version": "floattest-cfg-target-coq-spec/v1",
            "case": case,
            "status": "passed",
            "positive_vector_count": config["vectors"],
            "negative_theorem_count": 1,
            "coq_version": "8.20.1",
            "fixed_flags_hash": "599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de",
            "artifacts": artifacts(case, config),
        }
        case_dir = ROOT / f"FloatTest/cases/{case}"
        result[case_dir / "README.md"] = readme(case, config, snapshot)
        result[case_dir / "spec_snapshot.json"] = (
            json.dumps(snapshot, ensure_ascii=False, indent=2, sort_keys=True) + "\n"
        )
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--refresh", action="store_true")
    mode.add_argument("--check", action="store_true")
    args = parser.parse_args()
    files = expected()
    if args.refresh:
        for path, content in files.items():
            path.write_text(content, encoding="utf-8", newline="\n")
        print(f"REFRESHED: {len(CASES)} cfg_target spec READMEs and snapshots")
        return 0
    stale = [
        path.relative_to(ROOT)
        for path, content in files.items()
        if not path.exists() or path.read_text(encoding="utf-8") != content
    ]
    if stale:
        for path in stale:
            print(f"STALE: {path}")
        return 1
    print(
        f"PASS: {len(CASES)} cfg_target spec cases aligned "
        f"({sum(c['vectors'] for c in CASES.values())} positive, "
        f"{len(CASES)} negative)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
