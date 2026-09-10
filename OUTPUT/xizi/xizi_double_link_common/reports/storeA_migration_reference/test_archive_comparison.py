import unittest
from archive_completed_run import executable_comparison


class ComparisonTests(unittest.TestCase):
    base = '#include "list.h"\nint empty(const Node *p)\n{ return p->next == p; }\n'

    def test_identical_extra_prototype(self):
        added = self.base.replace('int empty', 'int empty(const Node *p);\nint empty', 1)
        result = executable_comparison(self.base, added)
        self.assertTrue(result['unchanged'])
        self.assertFalse(result['all_noncomment_tokens_unchanged'])
        self.assertEqual(len(result['redundant_prototypes_after']), 1)

    def test_changed_body_rejected(self):
        self.assertFalse(executable_comparison(self.base, self.base.replace('==', '!='))['unchanged'])

    def test_conflicting_prototype_rejected(self):
        self.assertFalse(executable_comparison(self.base, 'void empty(Node *p);\n' + self.base)['unchanged'])

    def test_new_external_prototype_rejected(self):
        self.assertFalse(executable_comparison(self.base, 'int other(Node *p);\n' + self.base)['unchanged'])

    def test_global_initializer_rejected(self):
        self.assertFalse(executable_comparison(self.base, 'int x = side_effect();\n' + self.base)['unchanged'])

    def test_comment_and_literal(self):
        self.assertTrue(executable_comparison(self.base, self.base.replace('{', '/*@ test */\n{'))['unchanged'])
        first = 'const char *f(void) { return "/* actual string */"; }'
        self.assertFalse(executable_comparison(first, first.replace('actual', 'changed'))['unchanged'])


if __name__ == '__main__':
    unittest.main()
