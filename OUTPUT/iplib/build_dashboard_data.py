#!/usr/bin/env python3
"""Build the dependency-free data snapshot used by the iplib dashboard."""

from __future__ import annotations

import json
import re
from datetime import datetime, timezone
from pathlib import Path


HERE = Path(__file__).resolve().parent
OUTPUT_COLUMNS = {
    "CS_AttCtrl_Propel": 12,
    "CS_Ctrl_Att_Rate": 27,
    "CS_GyroData_Disposal": 10,
    "CS_Gyro_Att_Predict": 21,
    "CS_IRES_Attitude": 15,
    "CS_ObtCtrl_OrbJetOut": 5,
    "CS_OrbitComputation": 11,
    "CS_PrecessionNutationCal": 11,
    "CS_Track_Atti": 19,
    "CS_Track_Plan": 5,
    "CS_TrgtAtt_AHM_USU": 44,
    "CS_TrgtAtt_AMM_2NoSAR": 41,
    "CS_TrgtAtt_AMM_Exp": 11,
    "CS_TrgtAtt_EIM": 19,
    "CS_TrgtAtt_NWM_USU": 31,
    "CS_TrgtAtt_OCM": 20,
    "CS_TrgtP2P_Ini": 14,
    "CS_TrgtP2P_Tar_Init": 11,
    "ModeConvert_AHM": 1,
    "ModeConvert_AMM": 1,
    "ModeConvert_EIM": 1,
    "ModeConvert_NWM": 1,
    "ModeConvert_OCM": 1,
    "ModeConvert_SBM": 1,
}

# (C-side field, Rocq parameter/result, vector column count, representation)
VARIABLE_GROUPS = {
    "CS_AttCtrl_Propel": {
        "in": [("kind", "kind", 1, "Z"), ("selector", "selector", 1, "Z"), ("timer", "timer", 1, "binary64"), ("start", "start", 1, "binary64"), ("flags[7]", "flags", 7, "list Z"), ("times[3]", "times", 3, "list fp64"), ("jets[3]", "jets", 3, "list Z"), ("states[3]", "states", 3, "list Z"), ("values[6]", "values", 6, "list fp64")],
        "out": [("mode", "result[0]", 1, "Z"), ("times'[3]", "result[1..3]", 3, "bits64"), ("jets'[3]", "result[4..6]", 3, "Z"), ("states'[3]", "result[7..9]", 3, "Z"), ("min_pos, max_pos", "result[10..11]", 2, "Z")],
    },
    "CS_Ctrl_Att_Rate": {
        "in": [("mode_proc", "mode_proc", 1, "Z"), ("fs_attd", "fs_attd", 1, "Z"), ("bmc", "bmc", 1, "Z"), ("seq", "sv", 1, "Z"), ("A[3]", "a", 3, "list fp64"), ("Rate[3]", "rate", 3, "list fp64"), ("wbo[3]", "wbo", 3, "list fp64"), ("w[3]", "w", 3, "list fp64"), ("Cbo[9]", "cbo", 9, "list fp64"), ("phi,theta,dphi,dtheta", "ires", 4, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64"), ("A_ref[3]", "aref", 3, "list fp64"), ("dA_ref[3]", "daref", 3, "list fp64")],
        "out": [("A_Clp[3]", "result[0..2]", 3, "bits64"), ("Rate_Clp[3]", "result[3..5]", 3, "bits64"), ("wbo_Clp[3]", "result[6..8]", 3, "bits64"), ("w_Clp[3]", "result[9..11]", 3, "bits64"), ("Cbo_Clp[9]", "result[12..20]", 9, "bits64"), ("A_c[3]", "result[21..23]", 3, "bits64"), ("Rate_c[3]", "result[24..26]", 3, "bits64")],
    },
    "CS_GyroData_Disposal": {
        "in": [("noUseGroup", "noUseGroup", 1, "Z"), ("fsAttD", "fsAttD", 1, "Z"), ("workMode", "workMode", 1, "Z"), ("fpModeStopCtrl[14]", "fpModeStopCtrl", 14, "list Z"), ("fuIng[9]", "fuIng", 9, "list Z"), ("dgm[9]", "dgm", 9, "list fp64"), ("vbs[9][3]", "vbs", 27, "list fp64"), ("lstIn[3]", "lstIn", 3, "list fp64"), ("wbiIn[3]", "wbiIn", 3, "list fp64"), ("deltaT", "deltaT", 1, "fp64"), ("mlfw", "mlfw", 1, "fp64")],
        "out": [("F_StopCtrl", "fst result", 1, "Z"), ("deltag[3]", "snd result", 3, "bits64"), ("wbi[3]", "third result", 3, "bits64"), ("deltag_Lst[3]", "fourth result", 3, "bits64")],
    },
    "CS_Gyro_Att_Predict": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("deltag[3]", "dg", 3, "list fp64"), ("D0_ESCorr[3]", "d0", 3, "list fp64"), ("De_ESCorr[3]", "de", 3, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64"), ("A_initial[3]", "a_initial", 3, "list fp64"), ("angle_bounds[3]", "angle_bounds", 3, "list fp64"), ("m_DeltaT", "dt", 1, "fp64"), ("Mlfw", "rate_bound", 1, "fp64")],
        "out": [("w_ESG[3]", "result[0..2]", 3, "bits64"), ("wbo_ESG[3]", "result[3..5]", 3, "bits64"), ("Rate_ESG[3]", "result[6..8]", 3, "bits64"), ("A_ESG[3]", "result[9..11]", 3, "bits64"), ("Cbo_ESG[9]", "result[12..20]", 9, "bits64")],
    },
    "CS_IRES_Attitude": {
        "in": [("kind", "kind", 1, "Z"), ("FS[0],FS[1]", "fs0,fs1", 2, "Z"), ("FV[2]", "fv", 2, "list Z"), ("FU[2]", "fu", 2, "list Z"), ("phi_i[2]", "phi_i", 2, "list fp64"), ("theta_i[2]", "theta_i", 2, "list fp64"), ("phi,theta,dPhi,dTheta", "state", 4, "list fp64"), ("phi_Lst[2],theta_Lst[2]", "history", 4, "list fp64"), ("dphi_Comps,dtheta_Comps", "comps", 2, "list fp64"), ("factor,limits,Ts", "params", 4, "list fp64")],
        "out": [("FV[2]", "result[0..1]", 2, "Z"), ("FU[2]", "result[2..3]", 2, "Z"), ("phi,theta,dPhi,dTheta", "result[4..7]", 4, "bits64"), ("Eb[3]", "result[8..10]", 3, "bits64"), ("phi_Lst[2],theta_Lst[2]", "result[11..14]", 4, "bits64")],
    },
    "CS_ObtCtrl_OrbJetOut": {
        "in": [("starTime", "starTime", 1, "fp64"), ("tpi", "tpi", 1, "fp64"), ("dto", "dto", 1, "fp64"), ("deltaT", "deltaT", 1, "fp64"), ("FS_OC[4]", "fs", 4, "list fp64"), ("t_OC[4]", "tIn", 4, "list fp64")],
        "out": [("t_OC'[4]", "fst result", 4, "bits64"), ("dto_OC'", "snd result", 1, "bits64")],
    },
    "CS_OrbitComputation": {
        "in": [("star_time", "star_time", 1, "fp64"), ("t0", "t0", 1, "fp64"), ("limit", "limit", 1, "fp64"), ("w0", "w0", 1, "fp64"), ("lmdG", "lmdg", 1, "fp64"), ("earth_rate", "earth_rate", 1, "fp64"), ("work_mode", "work_mode", 1, "Z"), ("abnormal", "abnormal", 1, "Z"), ("old_count", "old_no_orbit_count", 1, "Z")],
        "out": [("FV", "result[0]", 1, "Z"), ("FV_NoInsert", "result[1]", 1, "Z"), ("Cnt_NoOrb", "result[2]", 1, "Z"), ("w0i[3]", "result[3..5]", 3, "bits64"), ("lmdG'", "result[6]", 1, "bits64"), ("call counters[4]", "result[7..10]", 4, "Z")],
    },
    "CS_PrecessionNutationCal": {
        "in": [("FS", "fs", 1, "Z"), ("tmpT", "tmpT", 1, "fp64"), ("qd[4]", "qd", 4, "list fp64"), ("i_utc0", "i_utc0", 1, "fp64"), ("dt_utc2tdt", "dt_utc2tdt", 1, "fp64"), ("tgps0", "tgps0", 1, "fp64")],
        "out": [("F_qJDerr", "result[0]", 1, "Z"), ("CPN[9]", "result[1..9]", 9, "bits64"), ("qd'[3]", "result[10]", 1, "bits64")],
    },
    "CS_Track_Atti": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("angles[3]", "angles", 3, "list fp64"), ("wro[3]", "wro", 3, "list fp64"), ("wri[3]", "wri", 3, "list fp64"), ("dA_initial[3]", "da_initial", 3, "list fp64"), ("dA_previous[3]", "da_previous", 3, "list fp64"), ("wri_previous[3]", "wri_previous", 3, "list fp64"), ("deltaT", "dt", 1, "fp64"), ("inertia[9]", "inertia", 9, "list fp64"), ("Mdf", "mdf", 1, "fp64"), ("Mlf", "mlf", 1, "fp64")],
        "out": [("A_Ref[3]", "fst", 3, "bits64"), ("dA_Ref[3]", "snd", 3, "bits64"), ("ddA_Ref[3]", "third", 3, "bits64"), ("TorqRef[3]", "fourth", 3, "bits64"), ("dA_Ref_Lst[3]", "fifth", 3, "bits64"), ("wri_Lst[3]", "sixth", 3, "bits64"), ("C2Angle tag", "seventh", 1, "Z")],
    },
    "CS_Track_Plan": {
        "in": [("style", "style", 1, "Z"), ("t_sinacc_max", "t_sinacc_max", 1, "fp64"), ("dt_rate_ref", "dt_rate_ref", 1, "fp64"), ("dt_torq_ref", "dt_torq_ref", 1, "fp64")],
        "out": [("dispatch tag", "result[0]", 1, "Z"), ("pointer match", "result[1]", 1, "Z"), ("forwarded args[3]", "result[2..4]", 3, "bits64")],
    },
    "CS_TrgtAtt_AHM_USU": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("F_Mnv,F_Sun", "fmn,fs", 2, "Z"), ("psi_DA", "psi_DA", 1, "fp64"), ("dPsi_DA", "dPsi_DA", 1, "fp64"), ("Atr[3]", "atr", 3, "list fp64"), ("Cb[9]", "cb", 9, "list fp64"), ("Csib[9]", "csib", 9, "list fp64"), ("Cbsi[9]", "cbsi", 9, "list fp64"), ("Coi[9]", "coi", 9, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64"), ("wri_Lst[3]", "wri_lst", 3, "list fp64"), ("wri2_Lst[3]", "wri2_lst", 3, "list fp64"), ("dA_Lst[3]", "da_lst", 3, "list fp64"), ("dA_Init[3]", "da_init", 3, "list fp64"), ("deltaT", "deltaT", 1, "fp64"), ("A_Ref[3]", "a_ref_in", 3, "list fp64"), ("dChi_Init", "dchi_init", 1, "fp64"), ("MTrack[12]", "mtrack", 12, "list fp64"), ("E_xyz[3]", "e_xyz", 3, "list fp64"), ("Js[9]", "js", 9, "list fp64"), ("Mdf", "mdf", 1, "fp64"), ("Mlf", "mlf", 1, "fp64")],
        "out": [("Cro_si[9]", "result[0..8]", 9, "bits64"), ("wri_si[3]", "result[9..11]", 3, "bits64"), ("Cro[9]", "result[12..20]", 9, "bits64"), ("wri[3]", "result[21..23]", 3, "bits64"), ("qri[4]", "result[24..27]", 4, "bits64"), ("wro[3]", "result[28..30]", 3, "bits64"), ("dA_Ref[3]", "result[31..33]", 3, "bits64"), ("ddA_Ref[3]", "result[34..36]", 3, "bits64"), ("wri2[3]", "result[37..39]", 3, "bits64"), ("TorqRef[3]", "result[40..42]", 3, "bits64"), ("dChi_Ref2", "result[43]", 1, "bits64")],
    },
    "CS_TrgtAtt_AMM_2NoSAR": {
        "in": [("qbo[4]", "qbo", 4, "list fp64"), ("qrb[4]", "qrb", 4, "list fp64"), ("psi", "psi", 1, "fp64"), ("dpsi", "dpsi", 1, "fp64"), ("Cb[9]", "cb", 9, "list fp64"), ("Csib[9]", "csib", 9, "list fp64"), ("Coi[9]", "coi", 9, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64"), ("wrb0[3]", "wrb0", 3, "list fp64"), ("A_Ref[3]", "a_ref_in", 3, "list fp64")],
        "out": [("Cro_si[9]", "result[0..8]", 9, "bits64"), ("wri_si[3]", "result[9..11]", 3, "bits64"), ("Cro[9]", "result[12..20]", 9, "bits64"), ("wri[3]", "result[21..23]", 3, "bits64"), ("qro[4]", "result[24..27]", 4, "bits64"), ("qri[4]", "result[28..31]", 4, "bits64"), ("wro[3]", "result[32..34]", 3, "bits64"), ("A_Ref_si[3]", "result[35..37]", 3, "bits64"), ("call tags[3]", "result[38..40]", 3, "Z")],
    },
    "CS_TrgtAtt_AMM_Exp": {
        "in": [("F_Init", "fInit", 1, "Z"), ("e[3]", "e0,e1,e2", 3, "fp64"), ("chi", "chi", 1, "fp64"), ("dchi", "dchi", 1, "fp64"), ("tm1p,tm2p,tm3p", "tm1p,tm2p,tm3p", 3, "fp64"), ("tm_xin", "tmxin", 1, "fp64"), ("tm1,tm2,tm3", "tm1i,tm2i,tm3i", 3, "fp64"), ("tMnv", "tmnvi", 1, "fp64")],
        "out": [("qrb0[4]", "fst result", 4, "bits64"), ("wrb0[3]", "snd result", 3, "bits64"), ("tm1", "third", 1, "bits64"), ("tm2", "fourth", 1, "bits64"), ("tm3", "fifth", 1, "bits64"), ("tMnv", "sixth", 1, "bits64")],
    },
    "CS_TrgtAtt_EIM": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("Atr[3]", "atr", 3, "list fp64"), ("Cb[9]", "cb", 9, "list fp64"), ("Coi[9]", "coi", 9, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64")],
        "out": [("Cro[9]", "fst result", 9, "bits64"), ("wri[3]", "snd result", 3, "bits64"), ("qri[4]", "third result", 4, "bits64"), ("wro[3]", "fourth result", 3, "bits64")],
    },
    "CS_TrgtAtt_NWM_USU": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("psi_DA", "psi_DA", 1, "fp64"), ("dPsi_DA", "dPsi_DA", 1, "fp64"), ("Cb[9]", "cb", 9, "list fp64"), ("Csib[9]", "csib", 9, "list fp64"), ("Cbsi[9]", "cbsi", 9, "list fp64"), ("Coi[9]", "coi", 9, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64")],
        "out": [("Cro_si[9]", "result[0..8]", 9, "bits64"), ("wri_si[3]", "result[9..11]", 3, "bits64"), ("Cro[9]", "result[12..20]", 9, "bits64"), ("wri[3]", "result[21..23]", 3, "bits64"), ("qri[4]", "result[24..27]", 4, "bits64"), ("wro[3]", "result[28..30]", 3, "bits64")],
    },
    "CS_TrgtAtt_OCM": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("Atr[3]", "atr", 3, "list fp64"), ("Cb[9]", "cb", 9, "list fp64"), ("Coi[9]", "coi", 9, "list fp64"), ("w0i[3]", "w0i", 3, "list fp64")],
        "out": [("Cro[9]", "fst result", 9, "bits64"), ("wri[3]", "snd result", 3, "bits64"), ("qri[4]", "third result", 4, "bits64"), ("wro[3]", "fourth result", 3, "bits64"), ("Track_Atti call tag", "fifth result", 1, "Z")],
    },
    "CS_TrgtP2P_Ini": {
        "in": [("m_WorkMode", "wm", 1, "Z"), ("F_P2PType", "ftype", 1, "Z"), ("dChizr[18]", "dchizr", 18, "list fp64"), ("amaxzr[18]", "amaxzr", 18, "list fp64"), ("Cro[9]", "cro", 9, "list fp64")],
        "out": [("dChimax[3]", "result[0..2]", 3, "bits64"), ("amax[3]", "result[3..5]", 3, "bits64"), ("qro[4]", "result[6..9]", 4, "bits64"), ("qro0[4]", "result[10..13]", 4, "bits64")],
    },
    "CS_TrgtP2P_Tar_Init": {
        "in": [("next_mode", "next_mode", 1, "Z"), ("m_WorkMode", "wm", 1, "Z"), ("Seq_AttD[14]", "seq", 14, "list Z"), ("angles[3]", "angles", 3, "list fp64"), ("Cso[9]", "cso", 9, "list fp64"), ("Cro_initial[9]", "cro_initial", 9, "list fp64")],
        "out": [("Cro[9]", "fst result", 9, "bits64"), ("sub call count", "snd result", 1, "Z"), ("null call count", "third result", 1, "Z")],
    },
    "ModeConvert_AHM": {"in": [("arr[14]", "arr", 14, "list fp64"), ("limit", "lmt", 1, "fp64"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
    "ModeConvert_AMM": {"in": [("starTime", "starTime", 1, "fp64"), ("t0", "t0", 1, "fp64"), ("dt", "dt", 1, "fp64"), ("tm3", "tm3", 1, "fp64"), ("limit", "lmt", 1, "fp64"), ("F_Next", "fNext", 1, "Z"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
    "ModeConvert_EIM": {"in": [("arr[14]", "arr", 14, "list fp64"), ("dt", "dt", 1, "fp64"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
    "ModeConvert_NWM": {"in": [("starTime", "starTime", 1, "fp64"), ("tpi", "tpi", 1, "fp64"), ("ahead", "ahead", 1, "fp64"), ("tmXin", "tmXin", 1, "fp64"), ("F_Next", "fNext", 1, "Z"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
    "ModeConvert_OCM": {"in": [("starTime", "starTime", 1, "fp64"), ("tpi", "tpi", 1, "fp64"), ("dtp", "dtp", 1, "fp64"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
    "ModeConvert_SBM": {"in": [("starTime", "starTime", 1, "fp64"), ("t0", "t0", 1, "fp64"), ("dt", "dt", 1, "fp64"), ("m_WorkMode", "workMode", 1, "Z")], "out": [("m_WorkMode'", "result", 1, "Z")]},
}


def load_json(path: Path) -> dict:
    if not path.is_file():
        return {}
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, UnicodeDecodeError):
        return {}


def paragraph(markdown: str) -> str:
    chunks = re.split(r"\n\s*\n", markdown)
    for chunk in chunks:
        lines = [line.strip() for line in chunk.splitlines()]
        if not lines or lines[0].startswith(("#", "```", "- ", ">")):
            continue
        text = " ".join(lines)
        text = re.sub(r"[`*_]", "", text)
        if len(text) >= 35:
            return text
    return "可执行 Rocq 位模式规约与确定性 C 差分测试。"


def declarations(spec: str) -> list[dict]:
    matches = list(re.finditer(r"(?m)^(Definition|Fixpoint)\s+([A-Za-z0-9_']+)", spec))
    result = []
    names = [match.group(2) for match in matches]
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(spec)
        block = spec[match.start():end].strip()
        signature = block.split(":=", 1)[0].strip()
        signature = re.sub(r"\s+", " ", signature)
        deps = [name for name in names if name != match.group(2) and re.search(rf"\b{re.escape(name)}\b", block)]
        result.append({
            "kind": match.group(1),
            "name": match.group(2),
            "signature": signature,
            "lines": block.count("\n") + 1,
            "dependencies": deps,
        })
    return result


def evidence_state(coqc: dict, freshness: dict, timing: dict, negative: bool) -> str:
    complete = (
        coqc.get("status") == "passed"
        and coqc.get("returncode") == 0
        and freshness.get("status") == "passed"
        and timing.get("status") == "passed"
        and negative
    )
    return "evidence-complete" if complete else "archived"


def variable_mappings(name: str, input_count: int, output_count: int) -> list[dict]:
    configured = VARIABLE_GROUPS.get(name, {"in": [], "out": []})
    result = []
    for direction, expected in (("in", input_count), ("out", output_count)):
        cursor = 0 if direction == "in" else input_count
        start_cursor = cursor
        for c_name, rocq_name, count, representation in configured[direction]:
            result.append({
                "direction": direction,
                "cName": c_name,
                "rocqName": rocq_name,
                "columnStart": cursor,
                "columnEnd": cursor + count - 1,
                "count": count,
                "representation": representation,
            })
            cursor += count
        actual = cursor - start_cursor
        if actual != expected:
            raise ValueError(f"{name} {direction} mapping has {actual} columns, expected {expected}")
    return result


def source_for_case(case_dir: Path) -> tuple[str, str]:
    repo_root = HERE.parents[1]
    override = case_dir / "source" / f"{case_dir.name}_ip_source.txt"
    if override.is_file():
        path = repo_root / override.read_text(encoding="utf-8").strip()
    else:
        path = repo_root / "INPUT" / "iplib" / case_dir.name / "source" / f"IP_{case_dir.name}.c"
    raw = path.read_bytes()
    return str(path.relative_to(repo_root)), raw.decode("utf-8", errors="replace")


def sample_tests(tests: str, vector_lines: list[str], limit: int = 16) -> list[dict]:
    matches = list(re.finditer(r"(?m)^Example t_(\d+)\s*:", tests))
    result = []
    for position, match in enumerate(matches[:limit]):
        end = matches[position + 1].start() if position + 1 < len(matches) else len(tests)
        index = int(match.group(1))
        block = tests[match.start():end].strip()
        if "Example negative_control" in block:
            block = block.split("Example negative_control", 1)[0].rstrip()
        result.append({
            "index": index,
            "name": f"t_{index:04d}",
            "code": block,
            "vector": vector_lines[index].split() if index < len(vector_lines) else [],
        })
    return result


def build_case(case_dir: Path) -> dict:
    name = case_dir.name
    readme = (case_dir / "README.md").read_text(encoding="utf-8")
    spec = (case_dir / "rocq/spec.v").read_text(encoding="utf-8")
    tests = (case_dir / "rocq/tests.v").read_text(encoding="utf-8")
    vector_lines = [line for line in (case_dir / "reports/vectors.txt").read_text().splitlines() if line.strip()]
    sample = vector_lines[0].split() if vector_lines else []
    width = len(sample)
    output_count = OUTPUT_COLUMNS.get(name, 0)
    input_count = max(0, width - output_count)
    coqc = load_json(case_dir / "reports/coqc_check_evidence.json")
    freshness = load_json(case_dir / "reports/vector_freshness.json")
    timing = load_json(case_dir / "reports/timing_summary.json")
    decls = declarations(spec)
    main = next((item for item in reversed(decls) if item["name"].endswith("_fun")), decls[-1] if decls else None)
    negative = "negative_control_wrong_expected" in tests
    forbidden = bool(re.search(r"\b(?:Admitted|Axiom)\b", spec + "\n" + tests))
    unchecked = "- [ ]" in (case_dir / "reports/final_checklist.md").read_text(encoding="utf-8")
    command_match = re.search(r"bash FloatTest/tools/run_tests\.sh[^\n`]*", readme)
    source_files = sorted(path.name for path in (case_dir / "source").iterdir() if path.is_file())
    c_source_path, c_source = source_for_case(case_dir)

    return {
        "name": name,
        "family": "ModeConvert" if name.startswith("ModeConvert") else "ControlSystem",
        "summary": paragraph(readme),
        "state": evidence_state(coqc, freshness, timing, negative),
        "vectors": len(vector_lines),
        "positiveTheorems": tests.count("Example t_"),
        "negativeControl": negative,
        "columns": width,
        "inputColumns": input_count,
        "outputColumns": output_count,
        "sampleInputs": sample[:input_count],
        "sampleOutputs": sample[input_count:],
        "sampleTests": sample_tests(tests, vector_lines),
        "variableMappings": variable_mappings(name, input_count, output_count),
        "cSourcePath": c_source_path,
        "cSource": c_source,
        "specSource": spec,
        "seed": freshness.get("seed"),
        "directedCount": freshness.get("directed_count"),
        "randomCount": freshness.get("random_count"),
        "coqcStatus": coqc.get("status", "missing"),
        "coqcReturnCode": coqc.get("returncode"),
        "coqVersion": coqc.get("coq_version"),
        "sourceGoalVersion": coqc.get("source_goal_version"),
        "freshnessStatus": freshness.get("status", "missing"),
        "timingStatus": timing.get("status", "missing"),
        "seconds": timing.get("fixed_coqc_check_seconds"),
        "formalClean": not forbidden,
        "checklistComplete": not unchecked,
        "declarations": decls,
        "mainFunction": main,
        "sourceFiles": source_files,
        "reproduction": command_match.group(0) if command_match else f"bash FloatTest/tools/run_tests.sh {name} 1000",
        "links": {
            "readme": f"{name}/README.md",
            "spec": f"{name}/rocq/spec.v",
            "tests": f"{name}/rocq/tests.v",
            "vectors": f"{name}/reports/vectors.txt",
            "checklist": f"{name}/reports/final_checklist.md",
            "coqc": f"{name}/reports/coqc_check_evidence.json" if coqc else None,
            "freshness": f"{name}/reports/vector_freshness.json" if freshness else None,
        },
    }


def main() -> None:
    cases = [build_case(path) for path in sorted(HERE.iterdir()) if path.is_dir()]
    payload = {
        "schemaVersion": "iplib-dashboard/v1",
        "generatedAt": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "scope": "OUTPUT/iplib",
        "cases": cases,
        "summary": {
            "cases": len(cases),
            "vectors": sum(case["vectors"] for case in cases),
            "positiveTheorems": sum(case["positiveTheorems"] for case in cases),
            "evidenceComplete": sum(case["state"] == "evidence-complete" for case in cases),
            "archived": sum(case["state"] == "archived" for case in cases),
            "formalClean": sum(case["formalClean"] for case in cases),
        },
    }
    target = HERE / "dashboard-data.js"
    target.write_text(
        "window.IPLIB_DASHBOARD_DATA = "
        + json.dumps(payload, ensure_ascii=False, separators=(",", ":"))
        + ";\n",
        encoding="utf-8",
    )
    print(f"wrote {target} ({len(cases)} cases)")


if __name__ == "__main__":
    main()
