#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""修正《智能与软件-大模型辅助的程序验证.pptx》的内容正确性问题：
1. 删除第4页的自留指令文本框
2. 删除第5页空白占位页
3. 微内核页规约行数占位文字处理
4. 错别字修正（符合执行/基准规/留意图/也需也需/人在环表述）
5. 第9页标题与内容对齐
6. 删除重复的研究三背景页
7. 补写总结页
"""
import copy
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.oxml.ns import qn

F = '智能与软件-大模型辅助的程序验证.pptx'
prs = Presentation(F)
slides = list(prs.slides)

DARK = RGBColor(0x44, 0x54, 0x6A)
BLUE = RGBColor(0x00, 0x3C, 0xB4)
RED = RGBColor(0xC0, 0x00, 0x00)

# ---------- 取样式原型（删除页之前） ----------
proto_label = None
for sh in slides[10].shapes:
    if sh.name == '矩形 8' and sh.text_frame.text.strip():
        proto_label = sh
        break
assert proto_label is not None, '未找到小节条原型'


def make_run(p, text, size, bold=False, color=DARK):
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
        e.set('typeface', '微软雅黑')
    return r


# ---------- 1. 删除第4页指令文本框 ----------
s4 = slides[3]
for sh in list(s4.shapes):
    if sh.has_text_frame and '加一页' in sh.text_frame.text:
        sh._element.getparent().remove(sh._element)
        print('1. 已删除第4页指令文本框')

# ---------- 3. 微内核页：规约行数占位 ----------
for sh in slides[7].shapes:
    if sh.has_text_frame and '人工构建规约' in sh.text_frame.text:
        for para in sh.text_frame.paragraphs:
            for r in para.runs:
                if r.text == '，人工构建规约':
                    r.text = '，人工构建形式规约'
                elif r.text == '多少行':
                    r.text = ''
        print('3. 微内核页规约行数占位已处理')

# ---------- 4. 错别字 ----------
def fix_runs(slide_idx, mapping, label):
    n = 0
    for sh in slides[slide_idx].shapes:
        if not sh.has_text_frame:
            continue
        for para in sh.text_frame.paragraphs:
            for r in para.runs:
                for old, new in mapping.items():
                    if old in r.text:
                        r.text = r.text.replace(old, new)
                        n += 1
    print(f'4. slide {slide_idx + 1} {label}: {n} 处')

fix_runs(11, {'符合执行': '符号执行'}, '符合执行→符号执行')
fix_runs(17, {'问题的基准规': '问题的基准规约'}, '基准规→基准规约')
fix_runs(22, {'也需也需': '也需'}, '也需也需')

# ---------- 5. 第9页标题 ----------
for sh in slides[8].shapes:
    if sh.has_text_frame and '已有研究工作' in sh.text_frame.text:
        for para in sh.text_frame.paragraphs:
            for r in para.runs:
                if '已有研究工作' in r.text:
                    r.text = '已有研究工作面临的挑战'
                    print('5. 第9页标题已改为“已有研究工作面临的挑战”')

# ---------- 6. CAV-Bench 页人在环表述 ----------
for sh in slides[21].shapes:
    if sh.has_text_frame and '人在环（硕士生' in sh.text_frame.text:
        for para in sh.text_frame.paragraphs:
            for r in para.runs:
                if r.text == '人在环（硕士生，':
                    r.text = '由不具备 Rocq 经验的硕士生担任人在环操作者，'
                elif r.text in ('不会写', 'Rocq', '证明', '）') :
                    # 只清理该短句的残留 run（“证明”run 也在后文出现，需按位置判断）
                    pass
        # 精确处理：定位目标段落后逐 run 改
        for para in sh.text_frame.paragraphs:
            texts = [r.text for r in para.runs]
            if texts and texts[0] == '由不具备 Rocq 经验的硕士生担任人在环操作者，':
                for r in para.runs[1:5]:
                    r.text = ''
        print('6. CAV-Bench 页人在环表述已修正')

# ---------- 7. 删除空白占位页（slide 5）与重复页（slide 21） ----------
def delete_slide(index):
    lst = prs.slides._sldIdLst
    ids = list(lst)
    rId = ids[index].get(qn('r:id'))
    prs.part.drop_rel(rId)
    lst.remove(ids[index])

# 先确认目标页身份
assert '研究背景' in slides[4].text_frame.text if hasattr(slides[4], 'text_frame') else True
# slide 5（空白占位）：只有标题和页码占位
s5_texts = [sh.text_frame.text for sh in slides[4].shapes if sh.has_text_frame and sh.text_frame.text.strip()]
assert len(s5_texts) <= 2 and '研究背景' in s5_texts[0], s5_texts
delete_slide(4)
print('7a. 已删除空白占位页（原第5页）')

# 删除后重复的研究三背景页：原 20、21 → 现 19、20
slides = list(prs.slides)
def slide_key_text(s):
    return ' '.join(sh.text_frame.text for sh in s.shapes if sh.has_text_frame)
assert slide_key_text(slides[18]) == slide_key_text(slides[19]) or '研究三' in slide_key_text(slides[19])
# 两页内容相同，删第二页
t19 = slide_key_text(slides[18])
t20 = slide_key_text(slides[19])
assert t19 == t20, '重复页内容不一致，需人工确认'
delete_slide(19)
print('7b. 已删除重复的研究三背景页（原第21页）')

# ---------- 8. 补写总结页 ----------
slides = list(prs.slides)
s_sum = None
for s in slides:
    texts = [sh.text_frame.text.strip() for sh in s.shapes if sh.has_text_frame and sh.text_frame.text.strip()]
    if texts and texts[0] == '总结':
        s_sum = s
        break
assert s_sum is not None

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

M = Inches(0.45)
items = [
    ('研究一：规约生成',
     'SESPEC 为 89.4%（353/395）的程序生成可靠规约；航天控制系统软件 IP 应用 13/14 个函数成功、96.2%（601/625）验证条件通过。自动定理证明（ATP）能力是主导限制，交互式定理证明（ITP）是出路。'),
    ('研究二：能力评估',
     'Coins 以实例化测试用例评估规约质量，有效区分 6 个 SOTA 模型（得分 28.05%–1.22%）；消融表明规约质量（+5.01%）比证明能力（+3.05%）影响更大。'),
    ('研究三：长周期验证',
     'CAV-Bench 端到端验证最强配置完成 57.1%（80/140）；即使短函数也需长周期验证，难度主要来自辅助标注与证明的交互。'),
]
y = Inches(1.3)
for head, body in items:
    lab = clone_shape(s_sum, proto_label)
    lab.left, lab.top, lab.width = M, y, Inches(2.6)
    set_shape_text(lab, head)
    tb = s_sum.shapes.add_textbox(Inches(3.35), y + Inches(0.02), Inches(9.5), Inches(1.5))
    tf = tb.text_frame
    tf.word_wrap = True
    make_run(tf.paragraphs[0], body, 14)
    y += Inches(1.62)

tb = s_sum.shapes.add_textbox(M, Inches(6.25), Inches(12.4), Inches(0.9))
p = tb.text_frame.paragraphs[0]
make_run(p, '大模型与形式化方法深度融合的程序验证：规约生成、质量评估、端到端验证，仍有大量提升空间。',
         16, bold=True, color=RED)
print('8. 总结页已补写')

prs.save(F)
print('done, total slides =', len(prs.slides._sldIdLst))
