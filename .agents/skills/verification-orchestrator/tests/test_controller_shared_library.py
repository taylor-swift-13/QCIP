import importlib.util
import tempfile
import unittest
from unittest.mock import patch
from pathlib import Path


SCRIPT = Path(__file__).resolve().parents[1] / "scripts" / "controller.py"
SPEC = importlib.util.spec_from_file_location("controller_shared_library", SCRIPT)
CONTROLLER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CONTROLLER)


class SharedLibraryTests(unittest.TestCase):
    def test_explicit_rules_are_replayed_without_changing_default_or_canonical_paths(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            files = CONTROLLER._target_files_for_rel("INPUT/example.c")
            state = {"main_worktree": str(root)}
            default = CONTROLLER._qcp_driver_payload(state, root, files)
            self.assertNotIn("--CRules", default["canonical_argv_template"])
            state["coq_rules"] = "CRules"
            explicit = CONTROLLER._qcp_driver_payload(state, root, files)
            argv = explicit["canonical_argv_template"]
            index = argv.index("--CRules")
            self.assertEqual(argv[index + 1], "CRules")
            self.assertEqual(explicit["include_args"], default["include_args"])
            self.assertEqual(explicit["slp_args"], default["slp_args"])
            self.assertEqual(argv[:index] + argv[index + 2:], default["canonical_argv_template"])

    def test_shared_library_is_versioned_and_is_the_only_writable_library(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            c_file = root / "INPUT/example.c"
            library = root / "QCIPLib/shared_lib.v"
            c_file.parent.mkdir()
            library.parent.mkdir()
            c_file.write_text("void example(void) {}\n")
            library.write_text("Definition seed := True.\n")
            state = {"main_worktree": str(root), "target_c_file": str(c_file),
                     "case_lib_file": "QCIPLib/shared_lib.v"}
            before = CONTROLLER._source_version_for_workspace(state, root, annotated=True)
            library.write_text("Definition seed := False.\n")
            after = CONTROLLER._source_version_for_workspace(state, root, annotated=True)
            self.assertNotEqual(before["digest"], after["digest"])
            files = CONTROLLER._target_files_for_state(state)
            allowed = CONTROLLER._allowed_write_paths("annotation", files)
            self.assertIn("QCIPLib/shared_lib.v", allowed)
            self.assertNotIn("SeparationLogic/examples/INPUT/example_lib.v", allowed)
            self.assertEqual(files["goal_file"], "SeparationLogic/examples/INPUT/example_goal.v")

    def test_legacy_case_paths_are_unchanged(self):
        state = {"main_worktree": "/tmp/workspace", "target_c_file": "/tmp/workspace/INPUT/example.c"}
        self.assertEqual(CONTROLLER._target_files_for_state(state),
                         CONTROLLER._target_files_for_rel("INPUT/example.c"))

    def test_external_and_generated_paths_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for value in ("../outside_lib.v", "example_goal.v", "example_proof_manual.v"):
                with self.subTest(value=value), self.assertRaises(ValueError):
                    CONTROLLER._case_lib_relative_path(value, root)

    def test_freshness_replay_preserves_proofs_and_detects_changed_sources(self):
        for change in (None, "goal_file", "proof_manual_file"):
            with self.subTest(change=change), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                files = CONTROLLER._target_files_for_rel("INPUT/example.c")
                state = {"main_worktree": str(root), "report_root": str(root / "reports/run")}
                content = {
                    "goal_file": "Definition witness := True.\n",
                    "proof_auto_file": "(* generated *)\n",
                    "goal_check_file": "(* check *)\n",
                    "proof_manual_file": "Lemma proof_of_witness : True.\nProof. exact I. Qed.\n",
                }
                for key, text in content.items():
                    p = root / files[key]
                    p.parent.mkdir(parents=True, exist_ok=True)
                    p.write_text(text)

                def replay(_state, workspace, outputs):
                    self.assertEqual(workspace, root)
                    self.assertEqual(outputs["c_file"], files["c_file"])
                    for key, text in content.items():
                        destination = Path(outputs[key])
                        self.assertTrue(destination.is_relative_to(root / "reports/run"))
                        if key == "proof_manual_file":
                            text = "Lemma proof_of_witness : True.\nProof.\nAdmitted.\n"
                        if key == change:
                            text = text.replace("True", "False")
                        destination.write_text(text)
                    return {"status": "passed"}

                with patch.object(CONTROLLER, "_run_canonical_symexec", side_effect=replay):
                    result = CONTROLLER._final_symexec_refresh_evidence(state, root, root / "worktrees/run", files)
                self.assertEqual(result["status"], "passed" if change is None else "failed")
                self.assertTrue(result["formal_files_unchanged"])
                for key, text in content.items():
                    self.assertEqual((root / files[key]).read_text(), text)


if __name__ == "__main__":
    unittest.main()
