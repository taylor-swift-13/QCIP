#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""重建第 5、6 页：
- 第 5 页：程序 + 非形式需求（不含规约）
- 第 6 页：形式规约 + 验证条件与证明
其他页不动。"""
import copy
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN
from pptx.enum.shapes import MSO_SHAPE
from pptx.oxml.ns import qn

F = '智能与软件-大模型辅助的程序验证.pptx'
prs = Presentation(F)
slides = list(prs.slides)

DARK = RGBColor(0x44, 0x54, 0x6A)
BLUE = RGBColor(0x00, 0x3C, 0xB4)
RED = RGBColor(0xC0, 0x00, 0x00)
WHITE = RGBColor(0xFF, 0xFF, 0xFF)
CODEBG = RGBColor(0xF5, 0xF5, 0xF5)
BORDER = RGBColor(0xB8, 0xC4, 0xD8)
ANN_C = BLUE
CODE_C = DARK

# 样式原型取自「相关工作」页（21 页版本中为 slide 8，index 7）
proto_title = proto_label = None
for sh in slides[7].shapes:
    if sh.name == '文本框 1':
        proto_title = sh
    if sh.name == '矩形 8' and sh.text_frame.text.strip():
        proto_label = sh
assert proto_title is not None and proto_label is not None


def clone_shape(slide, proto):
    el = copy.deepcopy(proto._element)
    slide.shapes._spTree.append(el)
    from pptx.shapes.autoshape import Shape
    return Shape(el, slide.shapes)


def set_shape_text(shape, text):
    tf = shape.text_frame
    for p in list(tf.paragraphs[1:]):
        p._p.getparent().remove(p._p)
    p0 = tf.paragraphs[0]
    for r in list(p0.runs[1:]):
        r._r.getparent().remove(r._r)
    p0.runs[0].text = text


def make_run(p, text, size, bold=False, color=DARK, mono=False):
    r = p.add_run()
    r.text = text
    r.font.size = Pt(size)
    r.font.bold = bold
    r.font.color.rgb = color
    rPr = r._r.get_or_add_rPr()
    for tag in ('a:latin', 'a:ea'):
        e = rPr.find(qn(tag))
        if e is None:
            e = rPr.makeelement(qn(tag), {})
            rPr.append(e)
        e.set('typeface', 'Consolas' if mono else '微软雅黑')
    return r


def add_text(slide, x, y, w, h, items):
    tb = slide.shapes.add_textbox(x, y, w, h)
    tf = tb.text_frame
    tf.word_wrap = True
    first = True
    for segments, size, level, bullet, spa in items:
        p = tf.paragraphs[0] if first else tf.add_paragraph()
        first = False
        p.level = level
        p.space_after = Pt(spa)
        if bullet:
            pPr = p._p.get_or_add_pPr()
            pPr.append(pPr.makeelement(qn('a:buChar'), {'char': '●'}))
        for text, opt in segments:
            make_run(p, text, size, bold=opt.get('bold', False),
                     color=opt.get('color', DARK), mono=opt.get('mono', False))
    return tb


def add_label(slide, x, y, text, w=Inches(3.4)):
    lab = clone_shape(slide, proto_label)
    lab.left, lab.top, lab.width = x, y, w
    lab.height = proto_label.height
    set_shape_text(lab, text)
    return lab


def add_code(slide, x, y, w, h, lines, size=10.5):
    box = slide.shapes.add_shape(MSO_SHAPE.RECTANGLE, x, y, w, h)
    box.fill.solid(); box.fill.fore_color.rgb = CODEBG
    box.line.color.rgb = BORDER; box.line.width = Pt(0.75)
    tf = box.text_frame
    tf.word_wrap = True
    tf.margin_left = Inches(0.12); tf.margin_right = Inches(0.08)
    tf.margin_top = Inches(0.06); tf.margin_bottom = Inches(0.05)
    first = True
    for ln, color in lines:
        p = tf.paragraphs[0] if first else tf.add_paragraph()
        first = False
        p.space_after = Pt(0)
        make_run(p, ln if ln else ' ', size, color=color, mono=True)
    return box


def clear_slide(slide):
    spTree = slide.shapes._spTree
    for el in list(spTree):
        if el.tag in (qn('p:sp'), qn('p:pic'), qn('p:graphicFrame'), qn('p:grpSp'), qn('p:cxnSp')):
            spTree.remove(el)


M = Inches(0.45)

# ============================================================
# 第 5 页：程序 + 非形式需求（不含规约）
# ============================================================
sA = slides[2]   # 第 3 页：程序 + 非形式需求（不含规约）
clear_slide(sA)
tA = clone_shape(sA, proto_title)
set_shape_text(tA, '研究背景：一个例子——单链表求长程序')

add_label(sA, M, Inches(1.2), '非形式需求', w=Inches(2.2))
add_text(sA, M, Inches(1.75), Inches(3.55), Inches(2.7), [
    ([('输入：单链表头指针 linklist', {})], 13, 0, True, 8),
    ([('输出：链表的结点个数', {})], 13, 0, True, 8),
    ([('约束：不修改链表内容', {})], 13, 0, True, 8),
    ([('空表返回 0', {})], 13, 0, True, 8),
])
add_label(sA, M, Inches(4.35), '案例来源', w=Inches(2.2))
add_text(sA, M, Inches(4.9), Inches(3.55), Inches(1.9), [
    ([('西子实时操作系统单链表模块', {})], 13, 0, True, 6),
    ([('已完成端到端验证的真实案例', {})], 13, 0, True, 6),
    ([('头结点为哨兵结点，不含数据', {})], 13, 0, True, 6),
])

codeA = [
    ('typedef struct SingleLinklistNode {', CODE_C),
    ('    struct SingleLinklistNode *node_next;', CODE_C),
    ('} SysSingleLinklistType;', CODE_C),
    ('', CODE_C),
    ('unsigned int SingleLinkListGetLen(', CODE_C),
    ('        const SysSingleLinklistType *linklist)', CODE_C),
    ('{', CODE_C),
    ('    unsigned int length = 0;', CODE_C),
    ('    const SysSingleLinklistType *tmp_list = linklist->node_next;', CODE_C),
    ('', CODE_C),
    ('    while (tmp_list != (void *)0) {', CODE_C),
    ('        tmp_list = tmp_list->node_next;', CODE_C),
    ('        length++;', CODE_C),
    ('    }', CODE_C),
    ('    return length;', CODE_C),
    ('}', CODE_C),
]
add_label(sA, Inches(4.3), Inches(1.2), 'C 程序（含循环）', w=Inches(3.0))
add_code(sA, Inches(4.3), Inches(1.75), Inches(8.55), Inches(3.7), codeA, size=12.5)

add_text(sA, Inches(4.3), Inches(5.75), Inches(8.55), Inches(1.2), [
    ([('问题：如何严格证明它对', {}), ('任意', {'bold': True, 'color': RED}),
      ('链表都正确（不越界、计数正确、不修改链表）？', {})], 14, 0, False, 6),
    ([('需要：形式规约 + 验证条件生成 + 证明（见下页）。', {'bold': True})], 14, 0, False, 4),
])

# ============================================================
# 第 6 页：形式规约 + 验证条件与证明
# ============================================================
sB = slides[3]   # 第 4 页：形式规约 + 证明
clear_slide(sB)
tB = clone_shape(sB, proto_title)
set_shape_text(tB, '研究背景：形式规约与证明')

LX, LW = M, Inches(7.6)
add_label(sB, LX, Inches(1.2), '① 功能规约（Require / Ensure）', w=Inches(4.2))
spec1 = [
    ('unsigned int SingleLinkListGetLen(const SysSingleLinklistType *linklist)', CODE_C),
    ('/*@ With (la : list Z)', ANN_C),
    ('    Require  sll_head(linklist, la)', ANN_C),
    ('             -- 前提：内存中是以 linklist 为哨兵头、地址序列为 la 的链表', ANN_C),
    ('    Ensure   __return == Zlength(la) &&', ANN_C),
    ('             sll_head(linklist@pre, la) */', ANN_C),
    ('             -- 保证：返回 la 的长度；链表保持原样', ANN_C),
    ('{', CODE_C),
]
add_code(sB, LX, Inches(1.75), LW, Inches(1.55), spec1, size=10)

spec2 = [
    ('    unsigned int length = 0;', CODE_C),
    ('    const SysSingleLinklistType *tmp_list = linklist->node_next;', CODE_C),
    ('    /*@ Inv exists first la1 la2,', ANN_C),
    ('          la == app(la1, la2) && length == Zlength(la1) &&', ANN_C),
    ('          linklist == linklist@pre && linklist->node_next == first &&', ANN_C),
    ('          sllseg(first, tmp_list, la1) * sll(tmp_list, la2) */', ANN_C),
    ('          -- 任意时刻：已扫描段 la1 已计数 length = |la1|，', ANN_C),
    ('             剩余段 la2 仍是链表，整体 la = la1 ++ la2 不变', ANN_C),
    ('    while (tmp_list != (void *)0) { ... }', CODE_C),
    ('    return length;', CODE_C),
    ('}', CODE_C),
]
add_label(sB, LX, Inches(3.6), '② 中间辅助断言（循环不变式 Inv）', w=Inches(5.2))
add_code(sB, LX, Inches(4.15), LW, Inches(2.3), spec2, size=10)
add_text(sB, LX, Inches(6.55), LW, Inches(0.28), [
    ([('循环与指针程序验证的关键在不变式，也是学术难点。', {'color': RED})], 12, 0, False, 2),
])

# 右栏：③ 验证条件（VC）与证明
RX = Inches(8.35)
RW = Inches(12.85) - RX
add_label(sB, RX, Inches(1.2), '③ 验证条件（VC）与证明', w=RW)
add_text(sB, RX, Inches(1.75), RW, Inches(2.7), [
    ([('VC：工具沿程序路径自动生成的数学命题，本例产生四类：', {'bold': True})], 12, 0, False, 4),
    ([('入口：', {'bold': True}), ('循环开始前不变式成立（la1 = 空，length = 0）', {})], 11.5, 1, False, 3),
    ([('保持：', {'bold': True}), ('不变式 ∧ 循环条件 ⟹ 执行循环体后不变式仍成立', {})], 11.5, 1, False, 3),
    ([('退出：', {'bold': True}), ('不变式 ∧ 循环结束 ⟹ 返回值 = |la| 且链表不变', {})], 11.5, 1, False, 3),
    ([('安全：', {'bold': True}), ('所有指针访问合法（无空解引用、不越界）', {})], 11.5, 1, False, 4),
    ([('全部 VC 得证 ⟹ 程序对任意输入链表都满足规约', {'bold': True, 'color': RED})], 12, 0, False, 2),
])
add_text(sB, RX, Inches(4.55), RW, Inches(0.4), [
    ([('“退出” VC 实例（取自真实验证条件，按本页记号简化）：', {'bold': True})], 11, 0, False, 2),
])
vc = [
    ('forall la la1 la2 length first,', CODE_C),
    ('  tmp_list = 0  /\\  la = la1 ++ la2  /\\  length = Zlength(la1)  /\\', CODE_C),
    ('  &(linklist->node_next) |-> first', CODE_C),
    ('  * sllseg(first, 0, la1) * sll(0, la2)', CODE_C),
    ('|--', CODE_C),
    ('  length = Zlength(la)  /\\  sll_head(linklist, la)', CODE_C),
]
add_code(sB, RX, Inches(4.95), RW, Inches(1.25), vc, size=9.5)
add_text(sB, RX, Inches(6.35), RW, Inches(0.4), [
    ([('证明由 Rocq 完成，或由 SMT 求解器自动完成。', {'color': DARK})], 11.5, 0, False, 2),
])

add_text(sB, M, Inches(6.85), Inches(12.4), Inches(0.6), [
    ([('① ② ③ 即 CAV-Bench 的三个任务阶段：I 规约生成、II 辅助标注生成、III 证明生成。', {'bold': True})], 13, 0, False, 2),
])

prs.save(F)
print('done, total slides =', len(prs.slides._sldIdLst))
