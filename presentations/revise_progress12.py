# -*- coding: utf-8 -*-
"""重排“研究进展1/2”7 页（2026年第二季度工作总结汇报.pptx）：

- 字体风格/字号与其他页对齐：正文统一 Microsoft YaHei 16pt、标签 18pt、
  图注 14pt、统计框注释 14pt，消除 10–13pt 的杂小字号；引用脚注显式 12pt。
- 信息密度向其他页看齐：每页只留 3–4 条宏观要点 + 一个图形/统计元素，
  删去案例枚举、分项目明细等细节。
- 进展量化：补充规约代码与证明代码行数（取自仓库实测）——
  QCP 16 个程序：规约(annotation+case_lib)约 1,400 行、证明脚本约 3,600 行；
  FloatTest 79 个程序：规约 spec.v 约 4,700 行、定理代码 tests.v 约 47.9 万行；
  两条路线合计 95 个程序，规约约 6,100 行 + 证明/定理代码约 48.2 万行。
- 案例全部来自 502 工程航天控制 IP（STSUseFlag/StructFilter/STSTransDataSave/
  WheelFriction）；第一部分主信息：Rocq 对浮点数的功能正确性支持不够
  （浮点库仅四则运算与开平方、缺超越函数与舍入分析），由此转向 FloatTest。
- 技术细节图形化：FloatTest 页为五步流程图 + 3 个关键设计框；三角函数页
  为 musl 双侧移植示意图 + 统计框；删除纯文字实例页（ModeConvert_SBM）。
"""
import copy
import math
from pptx import Presentation
from pptx.util import Emu, Inches, Pt
from pptx.oxml.ns import qn
from lxml import etree

DECK = "2026年第二季度工作总结汇报.pptx"
A = "http://schemas.openxmlformats.org/drawingml/2006/main"
P = "http://schemas.openxmlformats.org/presentationml/2006/main"

BLUE = "003CB4"
RED = "C00000"
ACCENT = "3C56E5"
TEAL = "07ACBD"
YAHEI = "Microsoft YaHei"


def esc(t):
    return t.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def run_xml(text, sz=1600, color=None, b=True, font=None):
    fill = ('<a:solidFill><a:srgbClr val="%s"/></a:solidFill>' % color) if color else ""
    bold = ' b="1"' if b else ""
    latin = font or YAHEI
    return (
        '<a:r><a:rPr kumimoji="1" lang="zh-CN" altLang="en-US"%s sz="%d" dirty="0">%s'
        '<a:latin typeface="%s" panose="020B0503020204020204" pitchFamily="34" charset="-122"/>'
        '<a:ea typeface="%s" panose="020B0503020204020204" pitchFamily="34" charset="-122"/>'
        '</a:rPr><a:t>%s</a:t></a:r>'
        % (bold, sz, fill, latin, YAHEI, esc(text))
    )


def para_xml(runs, bullet=True, algn=None, space_after=None):
    ppr = ""
    attrs = ""
    if bullet:
        attrs = ' marL="285750" indent="-285750"'
        ppr = '<a:buFont typeface="Wingdings" pitchFamily="2" charset="2"/><a:buChar char="l"/>'
    if algn:
        attrs += ' algn="%s"' % algn
    if space_after is not None:
        ppr = '<a:spcAft><a:spcPts val="%d"/></a:spcAft>' % space_after + ppr
    return "<a:p><a:pPr%s>%s</a:pPr>%s</a:p>" % (attrs, ppr, "".join(runs))


_shape_id = [300]


def next_id():
    _shape_id[0] += 1
    return _shape_id[0]


def add_textbox(slide, x_in, y_in, w_in, paras_xml, name="文本框"):
    h_in = 0.5
    xml = (
        '<p:sp xmlns:p="%s" xmlns:a="%s">'
        '<p:nvSpPr><p:cNvPr id="%d" name="%s %d"/><p:cNvSpPr txBox="1"/><p:nvPr/></p:nvSpPr>'
        '<p:spPr><a:xfrm><a:off x="%d" y="%d"/><a:ext cx="%d" cy="%d"/></a:xfrm>'
        '<a:prstGeom prst="rect"><a:avLst/></a:prstGeom><a:noFill/></p:spPr>'
        '<p:txBody><a:bodyPr wrap="square" rtlCol="0" lIns="0" tIns="0" rIns="0" bIns="0"><a:spAutoFit/></a:bodyPr>'
        "<a:lstStyle/>%s</p:txBody></p:sp>"
        % (P, A, next_id(), name, next_id(),
           Emu(Inches(x_in)), Emu(Inches(y_in)), Emu(Inches(w_in)), Emu(Inches(h_in)),
           "".join(paras_xml))
    )
    sp = etree.fromstring(xml)
    slide.shapes._spTree.append(sp)
    return sp


def add_round_rect(slide, x_in, y_in, w_in, h_in, paras_xml, name="圆角矩形",
                   fill=ACCENT, alpha=43000, line=ACCENT, geom="roundRect"):
    xml = (
        '<p:sp xmlns:p="%s" xmlns:a="%s">'
        '<p:nvSpPr><p:cNvPr id="%d" name="%s %d"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>'
        '<p:spPr><a:xfrm><a:off x="%d" y="%d"/><a:ext cx="%d" cy="%d"/></a:xfrm>'
        '<a:prstGeom prst="%s"><a:avLst/></a:prstGeom>'
        '<a:solidFill><a:srgbClr val="%s"><a:alpha val="%d"/></a:srgbClr></a:solidFill>'
        '<a:ln w="25400"><a:solidFill><a:srgbClr val="%s"/></a:solidFill></a:ln></p:spPr>'
        '<p:txBody><a:bodyPr rtlCol="0" anchor="ctr" wrap="square" lIns="45720" tIns="27432" rIns="45720" bIns="27432"/><a:lstStyle/>%s</p:txBody></p:sp>'
        % (P, A, next_id(), name, next_id(),
           Emu(Inches(x_in)), Emu(Inches(y_in)), Emu(Inches(w_in)), Emu(Inches(h_in)),
           geom, fill, alpha, line, "".join(paras_xml))
    )
    sp = etree.fromstring(xml)
    slide.shapes._spTree.append(sp)
    return sp


def add_arrow(slide, x_in, y_in, w_in, h_in, direction="right"):
    geom = "rightArrow" if direction == "right" else "downArrow"
    xml = (
        '<p:sp xmlns:p="%s" xmlns:a="%s">'
        '<p:nvSpPr><p:cNvPr id="%d" name="箭头 %d"/><p:cNvSpPr/><p:nvPr/></p:nvSpPr>'
        '<p:spPr><a:xfrm><a:off x="%d" y="%d"/><a:ext cx="%d" cy="%d"/></a:xfrm>'
        '<a:prstGeom prst="%s"><a:avLst/></a:prstGeom>'
        '<a:solidFill><a:srgbClr val="%s"><a:alpha val="43000"/></a:srgbClr></a:solidFill>'
        '<a:ln w="3175"><a:solidFill><a:schemeClr val="tx1"/></a:solidFill></a:ln></p:spPr>'
        '<p:txBody><a:bodyPr rtlCol="0" anchor="ctr"/><a:lstStyle/><a:p><a:pPr algn="ctr"/></a:p></p:txBody></p:sp>'
        % (P, A, next_id(), next_id(),
           Emu(Inches(x_in)), Emu(Inches(y_in)), Emu(Inches(w_in)), Emu(Inches(h_in)), geom, TEAL)
    )
    sp = etree.fromstring(xml)
    slide.shapes._spTree.append(sp)
    return sp


def bullet_paras(items, sz=1600):
    out = []
    for lead, color, rest in items:
        runs = []
        if lead:
            runs.append(run_xml(lead, sz=sz, color=color))
        if rest:
            runs.append(run_xml(rest, sz=sz))
        out.append(para_xml(runs, bullet=True, space_after=400))
    return out


def add_label(slide, text, x=0.55, y=1.02, w=8.6, h=0.5, sz=1800):
    add_round_rect(slide, x, y, w, h,
                   [para_xml([run_xml(text, sz=sz)], bullet=False, algn="ctr")],
                   name="矩形标签")


def find_shape(slide, name):
    for sh in slide.shapes:
        if sh.name == name:
            return sh
    return None


def delete_shape(slide, name):
    sh = find_shape(slide, name)
    if sh is not None:
        sh._element.getparent().remove(sh._element)


def delete_by_prefix(slide, prefixes):
    for sh in list(slide.shapes):
        if any(sh.name.startswith(p) for p in prefixes):
            sh._element.getparent().remove(sh._element)


def iter_runs(shape):
    if shape.has_text_frame:
        for para in shape.text_frame.paragraphs:
            for r in para.runs:
                yield r


def set_sz(shape, sz_pt, para_idx=None):
    """设置 shape 内 run 字号；para_idx 给定时只改该段。"""
    for i, para in enumerate(shape.text_frame.paragraphs):
        if para_idx is not None and i != para_idx:
            continue
        for r in para.runs:
            r.font.size = Pt(sz_pt)


def fix_citation(shape):
    """引用脚注：显式 12pt Times New Roman（原为继承默认 18pt）。"""
    for r in iter_runs(shape):
        r.font.size = Pt(12)
        rPr = r._r.get_or_add_rPr()
        if rPr.find(qn("a:latin")) is None:
            etree.SubElement(rPr, qn("a:latin")).set("typeface", "Times New Roman")


def delete_slide(prs, idx):
    sldIdLst = prs.slides._sldIdLst
    sldIds = list(sldIdLst)
    rId = sldIds[idx].get(qn("r:id"))
    prs.part.drop_rel(rId)
    sldIdLst.remove(sldIds[idx])


# --------------------------------------------------------------------------
prs = Presentation(DECK)
slides = list(prs.slides)
s3, s4, s5, s6, s7, s8, s9, s10 = slides[2:10]

# ============ Slide 3：进展1(1/4) 删减为 4 条短要点 + 字号对齐 ============
delete_shape(s3, "文本框 102")
items = [
    ("要解决的问题：", BLUE, "海量存量 C 代码缺乏形式规约，人工编写成本高"),
    ("基本方法：", BLUE, "符号执行与 LLM 融合——在循环等边界处，用符号事实引导 LLM 合成规约"),
    ("验证器闭环：", BLUE, "候选规约由 Frama-C/WP 检查，失败时结合反馈定向修复"),
    ("评估结果：", BLUE, "多族基准上超过 AutoSpec；SESPEC-400（400 题）规约 Valid 率 68–93%"),
]
add_textbox(s3, 0.55, 1.25, 6.35, bullet_paras(items, sz=1600))
set_sz(find_shape(s3, "图注 104"), 14)
fix_citation(find_shape(s3, "文本框 4"))

# ============ Slide 4：进展1(2/4) 删减为短要点 + 字号对齐 ============
delete_shape(s4, "文本框 108")
items = [
    ("批量提取：", BLUE, "SESpec 已应用于 502 工程项目（航天控制软件）等存量代码"),
    ("知识库规模：", BLUE, "累计为 2000 余个软件 IP 生成形式模型（前置/后置条件、循环不变式）"),
    ("规约现状：", RED, "这 2000 余个规约尚未通过严格的形式化验证"),
    ("后续工作：", BLUE, "重点 IP 开展 QCP 全链路验证；Rocq 浮点功能正确性支持不足，浮点密集 IP 转向规约测试（见进展 2）"),
]
add_textbox(s4, 0.55, 1.75, 12.2, bullet_paras(items, sz=1600))
for name in ("统计框 110", "统计框 112", "统计框 114", "统计框 116"):
    set_sz(find_shape(s4, name), 14, para_idx=1)

# ============ Slide 5：进展1(3/4) QCP 删减 + 代码规模统计框 ============
delete_shape(s5, "文本框 138")
delete_shape(s5, "文本框 140")
items = [
    ("与规约测试互补：", BLUE, "Rocq 浮点功能正确性支持不足，浮点密集 IP 难以经济完成全称证明，转入 FloatTest 路线"),
]
add_textbox(s5, 0.55, 3.25, 12.2, bullet_paras(items, sz=1600))
qcp_stats = [
    ("约 1,400 行", "规约代码（C annotation + case_lib）"),
    ("约 3,600 行", "人工证明脚本（约 350 条引理）"),
    ("全称命题", "结论由 Rocq 内核检查，零 Admitted"),
]
for i, (num, lab) in enumerate(qcp_stats):
    x = 0.55 + i * 4.17
    add_round_rect(s5, x, 5.15, 4.0, 1.20,
                   [para_xml([run_xml(num, sz=2800, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(lab, sz=1400)], bullet=False, algn="ctr")],
                   name="统计框")

# ============ Slide 6：进展1(4/4) 案例全部来自 IP + 浮点功能正确性支持不够 ============
for nm in ("文本框 144", "矩形标签 142", "矩形标签 146", "演进框 148", "演进框 152",
           "演进框 156", "箭头 150", "箭头 154", "转向条 158"):
    delete_shape(s6, nm)
add_label(s6, "代表验证案例（均来自航天控制软件 IP）", x=0.55, w=5.9)
items = [
    ("STSUseFlag 状态机：", BLUE, "7 条分支路径全证；predicate-first 规约（描述输入/输出数学关系）"),
    ("StructFilter：", BLUE, "结构滤波 + PID 控制，31 个 VC 全证"),
    ("STSTransDataSave：", BLUE, "SRAM 248 字节分段拷贝，annotation 迭代 5 轮"),
    ("WheelFriction：", BLUE, "浮点密集 IP，仅完成整数层部分验证"),
]
add_textbox(s6, 0.55, 1.70, 6.05, bullet_paras(items, sz=1600))
add_label(s6, "浮点建模：最终处理方法", x=7.0, w=5.75)
add_round_rect(s6, 7.0, 1.70, 5.75, 1.50,
               [para_xml([run_xml("原生浮点建模：QCP 原生 fp32/fp64（Flocq）", sz=1500, color=BLUE)], bullet=False, algn="ctr"),
                para_xml([run_xml("浮点比较、NaN/±∞ 有限性、内存写入均可在证明层表达；超越函数与舍入推理支持不够，功能正确性证明受限",
                                  sz=1300)], bullet=False, algn="ctr")],
               name="演进框")
add_round_rect(s6, 0.55, 6.22, 12.25, 0.70,
               [para_xml([run_xml("转向规约测试：", sz=1600, color=RED),
                          run_xml("Rocq 对浮点数的功能正确性支持不够，浮点密集 IP 难以经济完成全称证明 → "
                                  "转向基于 COINS 思想的位级规约测试（见研究进展 2）", sz=1600)],
                         bullet=False, algn="ctr")],
               name="转向条", fill=TEAL, alpha=20000, line=TEAL)

# ============ Slide 7：进展2(1/3) COINS 删减为 3 条 + 字号对齐 ============
delete_shape(s7, "文本框 160")
items = [
    ("要解决的问题：", BLUE, "如何度量 LLM 生成规约的质量？现有评估信号稀疏、难以解释"),
    ("COINS 框架：", BLUE, "基于 Coq，在实例化测试用例上评估规约的可证行为正确性，无需端到端等价证明"),
    ("关键发现：", BLUE, "语法正确性是当前模型的主要瓶颈；基于测试用例的形式化推理是更忠实、更有区分度的度量"),
]
add_textbox(s7, 0.55, 1.25, 5.95, bullet_paras(items, sz=1600))
set_sz(find_shape(s7, "图注 162"), 14)
fix_citation(find_shape(s7, "文本框 4"))

# ============ Slide 8：进展2(2/3) FloatTest 流程图 + 3 个关键设计 ============
delete_by_prefix(s8, ("矩形标签", "文本框 166", "文本框 186", "步骤框", "箭头"))
add_label(s8, "FloatTest：基于 COINS 思想的规约位级差分测试", w=8.9)
add_textbox(s8, 0.55, 1.62, 12.2,
            [para_xml([run_xml("基本方法：", sz=1600, color=RED),
                       run_xml("同一份输入，两边各算一遍，逐位比输出——原始 C 程序与人工翻译的 Rocq 规约", sz=1600)],
                      bullet=False)])
steps = [
    ("① 写规约 spec.v", "人工将该题 C 代码逐行翻译成 Rocq 程序"),
    ("② 写驱动程序", "固定种子随机 + 定向边界值，逐个喂给 C 程序"),
    ("③ 浮点按整数打印", "按内存 bit pattern 打印，浮点相等即整数相等"),
    ("④ Rocq 逐条核对", "每行向量一条定理，vm_compute 逐位比对"),
    ("⑤ 阴性自检", "故意改错一条期望值，确认编译报错"),
]
bw, gap, x0, y0 = 2.38, 0.22, 0.30, 2.15
for i, (t, d) in enumerate(steps):
    x = x0 + i * (bw + gap)
    add_round_rect(s8, x, y0, bw, 1.60,
                   [para_xml([run_xml(t, sz=1500, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(d, sz=1250)], bullet=False, algn="ctr")],
                   name="步骤框")
    if i < 4:
        add_arrow(s8, x + bw - 0.02, y0 + 0.65, 0.26, 0.30, "right")
decisions = [
    ("被测性质", "C 输出 ≡ 规约输出（逐比特），1 ulp 差异即判失败"),
    ("内核检查", "每条向量是一条 vm_compute 机器检查定理，而非程序运行截图"),
    ("阴性自检", "每题故意改错 1 条期望值，确认编译报错（变异测试思想）"),
]
dw, dgap, dx0 = 3.98, 0.155, 0.55
for i, (t, d) in enumerate(decisions):
    x = dx0 + i * (dw + dgap)
    add_round_rect(s8, x, 4.30, dw, 1.50,
                   [para_xml([run_xml(t, sz=1400, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(d, sz=1300)], bullet=False, algn="ctr")],
                   name="决策框")
add_round_rect(s8, 0.55, 6.20, 12.25, 0.58,
               [para_xml([run_xml("定位：", sz=1600, color=RED),
                          run_xml("抽样检查而非全称证明——为浮点密集 IP 给出机器检查的一致性结论；规约可在后续证明中复用",
                                  sz=1600)], bullet=False, algn="ctr")],
               name="定位条", fill=TEAL, alpha=20000, line=TEAL)

# ============ 删除实例页（Slide 9：ModeConvert_SBM 例子） ============
delete_slide(prs, 8)

# ============ Slide 10（删除后为第 9 页）：三角函数图示 + 规模统计（精简） ============
delete_by_prefix(s10, ("矩形标签", "文本框 198", "文本框 202"))
# 左栏：三角函数双侧移植示意图
add_label(s10, "三角函数单独处理", x=0.55, w=6.05)
add_textbox(s10, 0.55, 1.62, 6.05,
            [para_xml([run_xml("难点：", sz=1300, color=RED),
                       run_xml("Rocq 浮点库不支持 sin/cos；跨数学库结果可差最后 1 位", sz=1300)], bullet=False)])
add_round_rect(s10, 1.55, 2.10, 4.0, 0.55,
               [para_xml([run_xml("musl 开源数学库算法（sin/cos/sqrt）", sz=1300)], bullet=False, algn="ctr")],
               name="移植顶框")
add_arrow(s10, 2.35, 2.69, 0.28, 0.26, "down")
add_arrow(s10, 4.45, 2.69, 0.28, 0.26, "down")
add_round_rect(s10, 0.55, 3.00, 2.95, 1.05,
               [para_xml([run_xml("C 侧", sz=1400, color=BLUE)], bullet=False, algn="ctr"),
                para_xml([run_xml("编译链接时替换系统数学库，原始代码一行不改", sz=1250)], bullet=False, algn="ctr")],
               name="移植框")
add_round_rect(s10, 3.65, 3.00, 2.95, 1.05,
               [para_xml([run_xml("Rocq 侧", sz=1400, color=BLUE)], bullet=False, algn="ctr"),
                para_xml([run_xml("按同一算法、同样运算顺序、同样常数重写", sz=1250)], bullet=False, algn="ctr")],
               name="移植框")
add_arrow(s10, 1.99, 4.09, 0.28, 0.24, "down")
add_arrow(s10, 5.09, 4.09, 0.28, 0.24, "down")
add_round_rect(s10, 1.55, 4.40, 4.0, 0.55,
               [para_xml([run_xml("两侧算同一个算法，逐位比较才有意义", sz=1300)], bullet=False, algn="ctr")],
               name="移植底框", fill=TEAL, alpha=30000, line=TEAL)
items_l = [
    ("自测：", BLUE, "sin/cos 3176 条 + sqrt 2073 条向量逐位一致；实证系统库 sqrt 存在 1-ulp 误舍入"),
]
add_textbox(s10, 0.55, 5.20, 6.05, bullet_paras(items_l, sz=1300))
# 右栏：覆盖规模统计框 + 成效
add_label(s10, "覆盖规模与结果", x=7.0, w=5.75)
stats = [
    ("79", "个程序完成位级规约测试"),
    ("78,700+", "条机器检查定理，100% 通过"),
    ("4,700+", "行人工规约代码（spec.v + 共享层）"),
    ("47.9 万行", "定理代码 tests.v，零 Admitted/Axiom"),
]
for i, (num, lab) in enumerate(stats):
    x = 7.0 + (i % 2) * 2.93
    y = 1.70 + (i // 2) * 1.38
    add_round_rect(s10, x, y, 2.82, 1.28,
                   [para_xml([run_xml(num, sz=3200, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(lab, sz=1300)], bullet=False, algn="ctr")],
                   name="统计框")
items_r = [
    ("实际抓出的问题：", BLUE, "宿主 libm sqrt 1-ulp 误舍入、共享层 6 处符号/下标错误、驱动程序 UB 等"),
]
add_textbox(s10, 7.0, 4.70, 5.9, bullet_paras(items_r, sz=1300))
# 底部合计条
add_round_rect(s10, 0.55, 6.10, 12.25, 0.58,
               [para_xml([run_xml("两条路线合计：", sz=1600, color=RED),
                          run_xml("95 个程序完成规约验证或测试，累计规约代码约 6,100 行、证明与定理代码约 48.2 万行",
                                  sz=1600)], bullet=False, algn="ctr")],
               name="合计条", fill=TEAL, alpha=20000, line=TEAL)

prs.save(DECK)
print("saved:", DECK, "slides:", len(prs.slides._sldIdLst))
