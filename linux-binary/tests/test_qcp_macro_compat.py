import importlib.util
from pathlib import Path
import tempfile
import unittest


spec = importlib.util.spec_from_file_location('qcp_macro_compat', Path(__file__).parents[1] / 'qcp_macro_compat.py')
compat = importlib.util.module_from_spec(spec)
spec.loader.exec_module(compat)


class NullMacroCompatibility(unittest.TestCase):
    def test_direct_definition_keeps_lines_and_other_macros(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            original = '#define OTHER ((void *)0)\n#define NONE ((void *)0)\n\nvoid *f(void) { return NONE; }\n'
            source = root / 'source.c'
            source.write_text(original)
            output = root / 'out'
            output.mkdir()
            rewritten = compat.prepare_input(source, output, [])
            self.assertEqual(rewritten.read_text(), original.replace('#define NONE ((void *)0)', '#define NONE 0'))
            self.assertEqual(source.read_text(), original)

    def test_header_rewrite_preserves_local_include_resolution(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            headers = root / 'headers'
            headers.mkdir()
            dependency = headers / 'layout.h'
            dependency.write_text('struct node { struct node *next; };\n')
            header = headers / 'list.h'
            original_header = '#include "layout.h"\n#ifndef NONE\n#define NONE ((void *)0)\n#endif\n'
            header.write_text(original_header)
            local = root / 'local.h'
            local.write_text('typedef int local_type;\n')
            source = root / 'source.c'
            original_source = '#include "headers/list.h"\n#include "local.h"\nvoid *f(void) { return NONE; }\n'
            source.write_text(original_source)
            output = root / 'out'
            output.mkdir()
            rewritten = compat.prepare_input(source, output, [])
            copied = next(output.glob('header_*'))
            self.assertIn('#define NONE 0', copied.read_text())
            self.assertIn(str(dependency), copied.read_text())
            self.assertIn(str(local), rewritten.read_text())
            self.assertEqual(len(rewritten.read_text().splitlines()), len(original_source.splitlines()))
            self.assertEqual(len(copied.read_text().splitlines()), len(original_header.splitlines()))
            self.assertEqual(source.read_text(), original_source)
            self.assertEqual(header.read_text(), original_header)

    def test_unrelated_macros_leave_input_untouched(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            source = root / 'source.c'
            source.write_text('#define NONE 7\n#define NULL ((void *)0)\n')
            self.assertIsNone(compat.prepare_input(source, root, []))

    def test_header_found_using_declared_include_path(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            headers = root / 'include'
            headers.mkdir()
            (headers / 'list.h').write_text('#define NONE ((void *)0)\n')
            source = root / 'source.c'
            source.write_text('#include "list.h"\n')
            output = root / 'out'
            output.mkdir()
            self.assertIsNotNone(compat.prepare_input(source, output, ['-I', str(headers)]))


if __name__ == '__main__':
    unittest.main()
