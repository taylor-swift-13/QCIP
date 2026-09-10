#!/usr/bin/env python3
"""Finalize derived delivery reports only after the current suite audit passes."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path


def dump(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--audit', required=True)
    args = parser.parse_args()
    root = Path.cwd().resolve()
    reference = Path(__file__).resolve().parent
    audit_path = Path(args.audit).resolve()
    audit = json.loads(audit_path.read_text())
    inventory = json.loads((reference / 'migration_inventory.json').read_text())
    assert audit['status'] == 'passed' and audit['formal_files_unchanged']
    assert all(c['migration_status'] == 'passed' for c in inventory['case_inventory'])
    assert {c['case'] for c in audit['cases']} == {c['case'] for c in inventory['case_inventory']}
    for record in audit['source_files']:
        assert hashlib.sha256((root / record['relative_path']).read_bytes()).hexdigest() == record['sha256'], record
    audit_rel = str(audit_path.relative_to(root))
    evidence = dict(status='passed', audit=audit_rel, suite_source_version=audit['suite_source_version'],
                    note='Current dependency regression; original controller source_goal_version and acceptance are retained.')
    cases = []
    by_case = {c['case']: c for c in audit['cases']}
    for entry in inventory['case_inventory']:
        case = entry['case']
        output = root / 'OUTPUT/xizi' / case
        reports = output / 'reports'
        for name in ('checkpoint.json', 'vc_proving_round_checkpoint.json'):
            path = reports / name
            data = json.loads(path.read_text())
            data.update(suite_refresh_comparison='passed', suite_fixed_check='passed', current_dependency_audit=evidence)
            dump(path, data)
        checkpoint = json.loads((reports / 'checkpoint.json').read_text())
        for name in ('reuse_packet.json', 'partial_proof_packet.json', 'reuse_index.json'):
            path = reports / name
            data = json.loads(path.read_text())
            data['current_dependency_audit'] = evidence
            data['notes'] = [n for n in data.get('notes', []) if 'remaining suite is in progress' not in n]
            data['notes'].append('All storeA migration cases and the current-dependency suite audit passed; generated auto placeholders remain an explicit trust boundary.')
            dump(path, data)
        for path in (output / 'README.md', reports / 'verification_summary.md'):
            text = path.read_text().replace('完整单双链表套件仍在迁移中，旧套件检查不作为本版本证据。',
                '本次单双链表套件已全部完成，并通过当前公共库依赖下的整套回归。旧版套件报告仅供历史参考。')
            text += f'\n当前依赖回归证据：`{audit_rel}`；不替换本 case 原始 controller 接受记录。\n'
            path.write_text(text)
        cases.append(dict(case=case, manual_witness_count=checkpoint['manual_witness_count'],
                          generated_auto_admitted_count=by_case[case]['generated_auto_admitted_count'],
                          all_noncomment_tokens_unchanged=by_case[case]['executable_c_comparison']['all_noncomment_tokens_unchanged'],
                          run_id=entry['run_id'], status='passed'))
    result = dict(schema_version='qcp-storeA-migration-result/v1', status='complete',
                  generated_at=datetime.now(timezone.utc).isoformat(), reference_commit=inventory['reference_commit'],
                  case_count=len(cases), goal_check_count=len(cases),
                  manual_witness_count=sum(c['manual_witness_count'] for c in cases),
                  generated_auto_admitted_count=audit['generated_auto_admitted_count'],
                  executable_c_unchanged=True,
                  redundant_prototype_difference_cases=[c['case'] for c in cases if not c['all_noncomment_tokens_unchanged']],
                  proof_scope=audit['proof_scope'], current_dependency_audit=evidence, cases=cases)
    dump(reference / 'migration_result.json', result)
    inventory.update(status='complete', current_dependency_audit=evidence,
                     completed_at=result['generated_at'])
    dump(reference / 'migration_inventory.json', inventory)
    declarations = '、'.join(result['redundant_prototype_difference_cases']) or '无'
    table = '| 用例 | 手动目标 | 自动目标占位 |\n| --- | ---: | ---: |\n' + '\n'.join(
        f"| {c['case']} | {c['manual_witness_count']} | {c['generated_auto_admitted_count']} |" for c in cases)
    overview = f'''# storeA 迁移交付

全部 {len(cases)} 个用例完成 controller final-check，{result['manual_witness_count']} 个手动目标完成证明，{len(cases)} 个 goal_check 通过当前公共依赖下的整套固定检查。各用例的 canonical symbolic execution freshness、manual/lib 结构和 forbidden lemma 扫描通过。

参照 `crtosverify/master` 的 `dll.v` 与 `idnode.v`，commit `{inventory['reference_commit']}`。原 C 算法、节点布局、接口和边界语义保留。仅有同签名重复声明差异的用例：{declarations}；这些差异不改变可执行函数体，逐 case 比对见审计。

手动证明和维护库没有遗留 Admitted 或新增 Axiom。QCP 的 generated proof_auto 仍有 {audit['generated_auto_admitted_count']} 个 Admitted 占位；固定编译通过不等于这些自动目标已完成 Coq 内核证明。这是本次迁移明确保留的上游生成器信任边界。

与 idmanager 的定义、资源和 IDNode 实例对应见 [alignment.md](alignment.md)。当前整套审计：`{audit_rel}`。逐 case 的原始 controller 接受记录、目标版本、中文复现步骤和证明产物位于对应 OUTPUT 目录；本报告不改写原始接受记录。

迁移中必要的额外修正：单链表删除循环保留入口已建立的目标节点非空事实，修复原不变量遗漏；不加强输入规格、不改 C。QCP 的 NONE 宏兼容层扩展到直接包含的头文件，仅处理临时副本，4 项测试和重复生成比对通过。controller 增加共享 case_lib 绑定及隔离 freshness replay，group preparation 同步已接受依赖以避免丢失既有 Arch32 引理。归档比较器对同签名重复声明单列，6 项回归测试通过。详细修复过程和证据指针保存在各 run 报告及 `experience/xizi_link_storeA_migration.md`。

`next_rec_last` 第一轮证明虽通过固定 Coq 检查，但 final-check 检出两条派生证明使用禁用引理，已回滚并通过新的 VC checking/group proof 轮次修复，未改规格或目标陈述。原失败证据保留在 `reports/xizi_double_link_next_rec_last-20260910004243/final_check_forbidden_r1.json`；最终结论以修复后的 controller 验收及本次整套扫描为准。

整套审计只对 active case_lib、公共模型库和当前 manual 应用严格的库/禁用引理规则。既有 strategy 接口和实现另列为依赖：逐文件与 Git HEAD 基线字节比对相同，保留接口公理和旧策略证明的扫描结果，并随 goal_check 编译；不把这些接口声明误报为本次新增 Axiom，也不声称旧策略实现全部满足当前 helper 禁用清单。首轮脚本曾错误地把 strategy 接口套入 case_lib 规则，修正分类后重跑，原证据保留在 `suite_audits/20260909181010/audit.json`。

复现当前整套回归，在仓库根目录运行：

```sh
PYTHONDONTWRITEBYTECODE=1 python3 OUTPUT/xizi/xizi_double_link_common/reports/storeA_migration_reference/audit_completed_suite.py --cleanup
```

{table}

计时统计见 `migration_timing_summary.json`。未知计时项保留 null，不能把并行区间简单相加当作墙钟耗时。
'''
    (reference / 'README.md').write_text(overview)
    alignment = reference / 'alignment.md'
    text = alignment.read_text()
    marker = '## 已验证的 IDNode 实例'
    if marker not in text:
        text += '\n' + marker + '''

callpoint_specs 的唯一 active case_lib 提供 `xizi_call_store_idnode` 和 `xizi_call_store_idnodes`，按参照 idnode.v 的 existential 外围地址、纯 node_storeA、UShort id 字段及 map getData 定义。

已证明 `xizi_call_idnodes_nonempty_ownership`：非空 ID 列表可分解出哨兵 next/prev、外围对象的 id 字段、首个内嵌 link 的 next/prev，以及剩余泛型链段。证明保留实际字段所有权，不限定 payload 为 emp，也没有增加数值偏移假设。

active 文件为 `SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_callpoint_specs/source/xizi_double_link_callpoint_specs_lib.v`，交付副本在该 case 的 `OUTPUT/xizi/.../rocq/`。该结果验证泛型接口可表达 idmanager 的资源划分；不另行声称验证了整个 idmanager 算法或框架抽象 field_address 的具体数值实现。
'''
        alignment.write_text(text)
    for family, description in (
        ('double', '`XiziStoreADLL.DL_Node A`、dllseg、shift/shift_rev 与 store_dll 对齐 idmanager 的 dll.v；xizi_store_dll 为公开别名。原 AddrDLL 地址结构库和已证明资源转换桥继续复用。'),
        ('single', '`sll_payload_node A` 与 payload adapter 复用原 generic_sll 递归，公开谓词接收 storeA : addr -> A -> Assertion。保留 NULL 终止、单个 next 字段及原哨兵语义。')):
        name = f'xizi_{family}_link_common'
        link = 'reports/storeA_migration_reference' if family == 'double' else '../xizi_double_link_common/reports/storeA_migration_reference'
        count = sum(c['case'].startswith(f'xizi_{family}_link_') for c in cases)
        readme = f'''# {name}

本模块的 {count} 个用例已迁移至任意 A/storeA，全部通过 controller final-check 和当前共享依赖下的整套回归。源码算法及节点布局保持不变。

{description}

active source 位于 `QCIPLib/xizi/{name}/`，`rocq/` 保存接受库的交付副本。链表谓词持有结构指针，storeA 持有对应外围对象的附加资源；哨兵不要求 payload。

[迁移结果与复现步骤]({link}/README.md)、[idmanager 对齐说明]({link}/alignment.md)、[逐 case 状态]({link}/migration_inventory.json)。各用例保留其原始 controller 报告，最新公共库兼容性由整套审计单独记录。

手动 witnesses 和维护库无 Admitted 或新增 Axiom。generated proof_auto 的 Admitted 占位仍是上游生成器的信任边界，不能据固定编译通过声称整套证明无假设；数量见迁移结果。
'''
        (root / 'OUTPUT/xizi' / name / 'README.md').write_text(readme)
    print(json.dumps({'status': 'complete', 'result': str(reference / 'migration_result.json')}))


if __name__ == '__main__':
    main()
