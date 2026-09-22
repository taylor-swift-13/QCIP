# -*- coding: utf-8 -*-
"""补全 2026年第二季度工作总结汇报.pptx：

- 研究进展1（形式模型提取，共 4 页）：TSE/SESpec 论文、502 工程 2000+ 规约生成、
  QCP 全链路验证 16 个程序、代表案例与浮点建模三代演进。
- 研究进展2（LLM 规约生成能力，共 4 页）：ICML/COINS 论文、基于 COINS 思想的
  FloatTest 位级差分测试方法、测试实例与 PBT 设计、三角函数处理与覆盖结果。
  两条路线合计 95 个程序完成规约验证或测试（16 QCP + 79 FloatTest）。
- 填写“研究成果”页。
样式（字体/字号/颜色/形状风格）复刻现有页面。
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

BLUE = "003CB4"      # 小标题蓝（与现有页一致 RGB(0,60,180)）
RED = "C00000"       # 强调红
ACCENT = "3C56E5"    # 形状蓝（slide 6 圆角矩形）
TEAL = "07ACBD"      # 箭头色
YAHEI = "Microsoft YaHei"


def esc(t):
    return (t.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))


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


def text_units(s):
    """估算文本宽度单位：中文 1，ASCII 0.55。"""
    u = 0.0
    for ch in s:
        u += 0.55 if ord(ch) < 128 else 1.0
    return u


def est_height_in(paras, width_in):
    """paras: list of (total_text, sz)。估算文本框高度（英寸）。"""
    h = 0.12
    for text, sz in paras:
        units = max(text_units(text), 1.0)
        chars_per_line = max((width_in - 0.25) * 72.0 / sz, 4)
        lines = max(1, math.ceil(units / chars_per_line))
        h += lines * sz * 1.32 / 72.0
    return h


_shape_id = [100]


def next_id():
    _shape_id[0] += 1
    return _shape_id[0]


def add_textbox(slide, x_in, y_in, w_in, paras_xml, name="文本框"):
    """paras_xml: 已拼好的 <a:p> 列表。"""
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


def clone_shape(src_slide, shape_name):
    for sh in src_slide.shapes:
        if sh.name == shape_name:
            return copy.deepcopy(sh._element)
    raise KeyError(shape_name)


def bullet_paras(items, sz=1600):
    """items: list of (lead, lead_color, rest) 或 (None,None,text)。"""
    out = []
    for lead, color, rest in items:
        runs = []
        if lead:
            runs.append(run_xml(lead, sz=sz, color=color))
        if rest:
            runs.append(run_xml(rest, sz=sz))
        out.append(para_xml(runs, bullet=True, space_after=400))
    return out


def find_shape(slide, name):
    for sh in slide.shapes:
        if sh.name == name:
            return sh
    return None


def delete_shape(slide, name):
    sh = find_shape(slide, name)
    if sh is not None:
        sh._element.getparent().remove(sh._element)


def add_label(slide, text, x=0.55, y=1.02, w=8.6, h=0.5, sz=2000):
    add_round_rect(slide, x, y, w, h,
                   [para_xml([run_xml(text, sz=sz)], bullet=False, algn="ctr")],
                   name="矩形标签")


def new_content_slide(prs, ref_slide, title_shape_name="标题 1"):
    """以 ref_slide 的版式新建空白内容页，克隆标题与页码占位。"""
    slide = prs.slides.add_slide(ref_slide.slide_layout)
    # add_slide 可能带入版式占位符，清空
    for sh in list(slide.shapes):
        sh._element.getparent().remove(sh._element)
    slide.shapes._spTree.append(clone_shape(ref_slide, title_shape_name))
    slide.shapes._spTree.append(clone_shape(ref_slide, "灯片编号占位符 1"))
    return slide


# --------------------------------------------------------------------------
prs = Presentation(DECK)
slides = list(prs.slides)
s3, s4 = slides[2], slides[3]

# ============ Slide 3：研究进展1（1/4）TSE 论文 ============
delete_shape(s3, "文本框 8")
items = [
    ("要解决的问题：", BLUE, "海量存量 C 代码缺乏形式规约（前置/后置条件、循环不变式），人工编写成本高；无验证目标驱动时尤其困难"),
    ("基本方法：", BLUE, "符号执行与 LLM 融合——无循环片段由符号执行计算精确的路径敏感后置条件；在循环、递归数据结构等边界处，用符号事实引导 LLM 合成候选规约"),
    ("验证器闭环：", BLUE, "候选规约由 Frama-C/WP 形式验证器检查；失败时结合验证器反馈与符号信息定向修复，而非盲目重新采样"),
    ("目标无关生成：", BLUE, "不依赖外部断言，直接从符号状态推导功能关系，支持无验证目标的规约生成场景"),
    ("评估结果：", BLUE, "在数值、指针、结构体、链表等多族基准上超过 AutoSpec 等现有工具；目标无关基准 SESPEC-400（400 题）规约 Valid 率达 68–93%"),
]
add_textbox(s3, 0.55, 1.25, 6.35, bullet_paras(items, sz=1600))
pic = s3.shapes.add_picture("pptx_assets/sespec_workflow.png", Inches(7.35), Inches(1.30), width=Inches(5.30))
add_textbox(s3, 7.35, 1.30 + 5.30 * 1833 / 2200 + 0.06, 5.30,
            [para_xml([run_xml("SESpec 总体流程：符号执行在程序边界处暂停，以符号信息引导 LLM 补全规约", sz=1200, b=False)], bullet=False, algn="ctr")],
            name="图注")

# ============ 新页 A：研究进展1（2/4）规约生成落地 ============
sA = new_content_slide(prs, s3)
add_label(sA, "SESpec 工具落地：为知识库批量提取软件 IP 形式模型", w=9.2)
items = [
    ("批量提取：", BLUE, "TSE 工具（SESpec）已应用于 502 工程项目（航天控制软件）等存量代码，批量提取软件 IP 的形式模型"),
    ("知识库规模：", BLUE, "累计为软件 IP 知识库中 2000 余个软件 IP 生成形式规约，覆盖函数前置/后置条件与循环不变式"),
    ("规约现状：", RED, "这 2000 余个规约没有通过严格的形式化验证——生成环节的自动检查不等于对程序行为的完整证明，其正确性仍需下游工作确认"),
    ("后续工作：", BLUE, "先基于 QCP 对重点软件 IP 开展完整的形式化验证；受验证资源/时间消耗与浮点数支持限制，进一步转向基于 COINS 思想的规约测试路线"),
]
add_textbox(sA, 0.55, 1.75, 12.2, bullet_paras(items, sz=1700))
stats = [("2000+", "知识库软件 IP 形式模型（尚未严格验证）"), ("16", "个程序完成 QCP 全链路验证"),
         ("79", "个程序完成位级规约测试"), ("95", "个程序完成规约验证或测试（合计）")]
for i, (num, lab) in enumerate(stats):
    x = 0.49 + i * 3.17
    add_round_rect(sA, x, 5.15, 2.85, 1.30,
                   [para_xml([run_xml(num, sz=3200, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(lab, sz=1300)], bullet=False, algn="ctr")],
                   name="统计框")

# ============ 新页 B：研究进展1（3/4）QCP 全链路验证 ============
sB = new_content_slide(prs, s3)
add_label(sB, "QCP 全链路形式化验证：16 个程序完成证明", w=8.6)
stages = ["C 规约标注", "符号执行\n生成 VC", "VC 分类\nsafety / return", "Rocq\n人工证明", "final-check\n归档验收"]
bw, gap, x0, y0 = 2.28, 0.32, 0.35, 1.85
for i, st in enumerate(stages):
    x = x0 + i * (bw + gap)
    lines = st.split("\n")
    add_round_rect(sB, x, y0, bw, 0.85,
                   [para_xml([run_xml(t, sz=1400)], bullet=False, algn="ctr") for t in lines],
                   name="流水线")
    if i < 4:
        add_arrow(sB, x + bw + 0.02, y0 + 0.26, 0.28, 0.32, "right")
left = [
    ("航天控制 IP 4 个：", BLUE, "STSUseFlag（7 条分支全证）、StructFilter、STSTransDataSave；WheelFriction 为部分验证"),
    ("二叉树 4 个：", BLUE, "free / height / invert / size"),
    ("SAM 控制律 6 个：", BLUE, "B_TcProcess、CheckCal08、JetCtrlSend、SendUartData、ThrusterCtrlLogic、UartInit"),
]
right = [
    ("原生浮点案例 2 个：", BLUE, "float_clamp / float_store（fp32/fp64，基于 Flocq）"),
    ("证明规模：", BLUE, "人工完成约 350 条证明引理、约 3600 行证明脚本；结论为全称命题，由 Rocq 内核检查"),
    ("与规约测试互补：", BLUE, "证明可达的程序做全称证明；无法经济完成的浮点密集程序转入 FloatTest 测试路线"),
]
add_textbox(sB, 0.55, 3.15, 6.1, bullet_paras(left, sz=1500))
add_textbox(sB, 7.0, 3.15, 5.9, bullet_paras(right, sz=1500))

# ============ 新页 C：研究进展1（4/4）代表案例与浮点演进 ============
sC = new_content_slide(prs, s3)
add_label(sC, "代表验证案例", x=0.55, w=5.9, sz=1800)
items = [
    ("STSUseFlag 状态机：", BLUE, "7 条分支路径 → 7 个 return VC 全部证明；predicate-first 规约（描述输入/输出数学关系，不镜像 C 控制流）"),
    ("StructFilter：", BLUE, "结构滤波 + PID 控制，1 return + 30 safety VC 全证"),
    ("STSTransDataSave：", BLUE, "SRAM 248 字节分段拷贝，annotation 迭代 5 轮"),
    ("float_clamp：", BLUE, "首个原生浮点验证案例，2 函数 × 3 分支 = 6 个 return VC 全证；规约显式排除 NaN/±∞"),
    ("验证代价：", RED, "annotation 需多轮迭代、证明逐案人工完成——16 个案例累计约 3600 行人工证明脚本，资源与时间消耗大"),
]
add_textbox(sC, 0.55, 1.70, 6.05, bullet_paras(items, sz=1500))
add_label(sC, "浮点建模的三代演进", x=7.0, w=5.75, sz=1800)
gens = [
    ("第一代：整数替换", "WheelFriction；浮点抽象为未解释函数，137 个 safety VC 无法经济证明（全部 Admitted）"),
    ("第二代：不透明整数", "StructFilter；浮点视为 64 位不透明字，仅证明整数层规格"),
    ("第三代：原生浮点", "float_clamp / float_store；QCP 原生 fp32/fp64（Flocq），浮点比较、有限性、内存写入均在证明层表达"),
]
gy = [1.70, 3.28, 4.86]
for i, (t, d) in enumerate(gens):
    add_round_rect(sC, 7.0, gy[i], 5.75, 1.25,
                   [para_xml([run_xml(t, sz=1400, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(d, sz=1200)], bullet=False, algn="ctr")],
                   name="演进框")
    if i < 2:
        add_arrow(sC, 9.65, gy[i] + 1.27, 0.45, 0.24, "down")
add_round_rect(sC, 0.55, 6.28, 12.25, 0.62,
               [para_xml([run_xml("转向规约测试：", sz=1500, color=RED),
                          run_xml("验证资源/时间消耗大 + 浮点数支持受限 → 全称证明难以经济覆盖全部浮点密集 IP，后续转向基于 COINS 思想的规约测试路线（见研究进展 2）", sz=1500)], bullet=False, algn="ctr")],
               name="转向条", fill=TEAL, alpha=20000, line=TEAL)

# ============ Slide 4：研究进展2（1/3）ICML 论文 ============
delete_shape(s4, "文本框 8")
items = [
    ("要解决的问题：", BLUE, "如何度量 LLM 生成规约的质量？现有评估把规约质量与端到端等价证明的难度混为一谈，信号稀疏且难以解释"),
    ("COINS 框架：", BLUE, "基于 Coq，在实例化测试用例上评估规约的可证行为正确性，无需端到端等价证明；成功证明是可靠证据，证明失败本身不构成反证"),
    ("评估流水线：", BLUE, "Syntax Valid → Pass First → Pass All → Reject All（负例拒绝）；HumanEval 164 题，配人工编写的 Coq 规约作为参照"),
    ("关键发现：", BLUE, "语法正确性是当前模型的主要瓶颈（164 题中仅 128 题语法有效，46 题通过全部正例）；验证复杂度掩盖规约质量的真实差异；基于测试用例的形式化推理是更忠实、更有区分度的度量"),
]
add_textbox(s4, 0.55, 1.25, 5.95, bullet_paras(items, sz=1500))
s4.shapes.add_picture("pptx_assets/coins_main.png", Inches(6.75), Inches(1.30), width=Inches(6.15))
add_textbox(s4, 6.75, 1.30 + 6.15 * 1508 / 2400 + 0.06, 6.15,
            [para_xml([run_xml("COINS：准备阶段（HumanEval + 人工 Coq 规约）与评估阶段（逐级可证性检查）", sz=1200, b=False)], bullet=False, algn="ctr")],
            name="图注")

# ============ 新页 D：研究进展2（2/3）FloatTest 方法 ============
sD = new_content_slide(prs, s4)
add_label(sD, "FloatTest：基于 COINS 思想的规约位级差分测试", w=8.9)
add_textbox(sD, 0.55, 1.62, 12.2,
            [para_xml([run_xml("基本方法：", sz=1500, color=RED), run_xml("同一份输入，两边各算一遍，逐位比输出——原始 C 程序与人工翻译的 Rocq 规约", sz=1500)], bullet=False)])
steps = [
    ("① 写 spec", "人工将该题的 C 代码逐行翻译成 Rocq 程序"),
    ("② 写驱动程序", "固定种子随机 + 精选边界值（如恰好等于阈值），逐个喂给原始 C 程序，输出测试向量文件"),
    ("③ 浮点按整数打印", "按内存原始二进制（bit pattern）打印，浮点相等变成整数相等，无歧义"),
    ("④ Rocq 逐条核对", "每行向量变成一条定理，编译器用 vm_compute 算出 spec 结果并逐位比对"),
    ("⑤ 阴性自检", "故意改错一条期望输出，确认编译报错，证明整个链条真的在检查"),
]
bw, gap, x0, y0 = 2.38, 0.22, 0.30, 2.30
for i, (t, d) in enumerate(steps):
    x = x0 + i * (bw + gap)
    add_round_rect(sD, x, y0, bw, 2.05,
                   [para_xml([run_xml(t, sz=1400, color=BLUE)], bullet=False, algn="ctr"),
                    para_xml([run_xml(d, sz=1100)], bullet=False, algn="ctr")],
                   name="步骤框")
    if i < 4:
        add_arrow(sD, x + bw - 0.02, y0 + 0.85, 0.26, 0.30, "right")
items = [
    ("为什么这样算“验证”：", BLUE, "Rocq 是证明助手：编译通过 = 内核机械地逐步验算过每一条等式；每条测试向量都是一条机器检查过的定理，而不是一次程序运行的截图"),
    ("边界说明：", BLUE, "这是抽样检查，不是“对任意输入都成立”的数学证明；每题覆盖的分支与未覆盖边界（如辅助函数打桩隔离）在各题 README 置顶声明"),
    ("与证明路线的关系：", BLUE, "全链路证明资源/时间消耗大、浮点支持受限——对无法经济完成全称证明的浮点密集程序，用采样定理给出机器检查的一致性结论；规约可在后续证明中复用"),
]
add_textbox(sD, 0.55, 4.75, 12.2, bullet_paras(items, sz=1500))

# ============ 新页 F：研究进展2（3/4）FloatTest 实例与关键设计 ============
sF = new_content_slide(prs, s4)
add_label(sF, "实例：ModeConvert_SBM（工作模式切换判断）", x=0.55, w=6.30, sz=1700)
CODE = "Courier New"
ex = [
    ("① 被测 C 代码：", "if ((m_starTime - t0) >= dt_OrbitInject)\n      m_WorkMode = WKMD_EIM;   // 0x11"),
    ("② 测试向量（vectors.txt 真实一行）：", "4694428428020873060 13909875606412569204\n4661949024290739460 20 17"),
    ("③ 人工转写的 Rocq 规约（spec.v 核心）：", "Definition modeConvert_SBM_fun\n    (starTime t0 dt : fp64) (workMode : Z) : Z :=\n  if c_ge64 (fp64_sub starTime t0) dt\n  then WKMD_EIM_Z else workMode."),
    ("④ 每条向量变成一条定理（tests.v）：", "Example t_0002 : modeConvert_SBM_fun\n  (f64 4683088663683732336) (f64 4683088663683732336)\n  (f64 4607182418800017408) 3 = 3.\nProof. vm_compute. reflexivity. Qed."),
]
paras = []
for lead, code in ex:
    paras.append(para_xml([run_xml(lead, sz=1300, color=BLUE)], bullet=True, space_after=100))
    for ln in code.split("\n"):
        paras.append(para_xml([run_xml(ln, sz=1000, font=CODE)], bullet=False, space_after=60))
add_textbox(sF, 0.55, 1.62, 6.45, paras)
add_label(sF, "PBT 六个关键设计决策", x=7.30, w=5.45, sz=1700)
items_pbt = [
    ("被测性质：", BLUE, "采样输入上 C 输出 ≡ 规约输出（逐比特，约定 NaN==NaN），1 ulp 差异即判失败"),
    ("Oracle 真值：", BLUE, "原始 C + gcc -O0（关 FMA 收缩）+ musl 确定性移植——宿主 libm 不可信（sqrt 误舍入实证）"),
    ("输入生成：", BLUE, "固定种子随机 + 7–13 类定向边界（阈值恰等、NaN、±Inf、±0、饱和、计数器回绕）"),
    ("检查方式：", BLUE, "vm_compute + reflexivity——由 Rocq 内核计算检查，不依赖外部脚本的判断"),
    ("有效性验证：", BLUE, "每题 1 条阴性自检（故意改错期望值），预期编译报错——变异测试思想"),
    ("可复现性：", BLUE, "固定种子 + SHA-256 快照绑定源码/规约/向量/工具 + 固定 coqc 入口，重跑结论一致"),
]
add_textbox(sF, 7.30, 1.62, 5.45, bullet_paras(items_pbt, sz=1250))

# ============ 新页 E：研究进展2（4/4）三角函数与覆盖结果 ============
sE = new_content_slide(prs, s4)
add_label(sE, "三角函数单独处理", x=0.55, w=6.05, sz=1800)
items_l = [
    ("难点：", RED, "Rocq 浮点库只支持四则运算与开平方；sin/cos 在不同数学库之间可能差最后一位，“正确答案”不唯一，逐位比较无从下手"),
    ("对策：", BLUE, "把同一开源数学库（musl）的算法原样搬两份——C 侧编译链接时替换系统数学库（原始代码一行不改），Rocq 侧按同一算法、同样运算顺序、同样常数重写；两侧算的是同一个算法，逐位比较才有意义"),
    ("自测：", BLUE, "sin/cos 移植 3176 条向量逐位一致；sqrt 移植 2073 条向量（实证本机系统库 sqrt 存在 1-ulp 误舍入，故一并移植）"),
    ("共享规约层自测：", BLUE, "姿态类 case 共用的 Angle2C / 矩阵乘 / 四元数运算独立自测（4 个精确锚点 + 6 种转序 × 10000 条随机），抓出 6 处共享层错误，5 题重生成通过"),
    ("误差容忍扩展：", BLUE, "测试中 C 与 Rocq 两侧均使用自定义三角函数，行为可控；后续若换回系统库版本，只需在 spec 中将输出按位表示的尾数 ± 一定范围，即可自然容纳相对误差"),
]
add_textbox(sE, 0.55, 1.70, 6.05, bullet_paras(items_l, sz=1300))
add_label(sE, "覆盖规模与结果", x=7.0, w=5.75, sz=1800)
items_r = [
    ("iplib 24/24：", BLUE, "36,271 条定理（6 个模式切换 + 18 个姿态/轨道计算）"),
    ("orbiter-new 35/35：", BLUE, "35,035 条定理（各 1000 条定向向量）"),
    ("SAMCodeSynthesis 8/9：", BLUE, "7,000 条定理；cfg_target 试点 12 题：431 条"),
    ("合计：", RED, "79 个程序、约 78,700 条定理 100% 通过，零 Admitted / Axiom；每题 1 条阴性自检全部正确报错"),
    ("实际抓出的问题：", BLUE, "宿主 libm sqrt 1-ulp 误舍入；4 个 Angle2C 符号错误 + 2 个 C2Q 下标错误；驱动程序 UB（printf 格式串多 2 个 %u）；源码笔误（未初始化索引）"),
    ("两条路线合计：", RED, "95 个程序完成规约验证或测试"),
]
add_textbox(sE, 7.0, 1.70, 5.9, bullet_paras(items_r, sz=1300))

# ============ 研究成果（原第 12 页） ============
s12 = slides[11]
groups = [
    ("论文：", BLUE, "SESpec——Integrating Symbolic Execution with LLMs for Automated Generation of Program Specifications（IEEE TSE，2026，Major Revision）；COINS——How Powerful are LLMs in Generating Formal Program Specifications?（ICML 2026，in press）；MARS 2.0（ACM TECS，2026，Accepted）"),
    ("工具与系统：", BLUE, "SESpec 规约自动生成工具、QCP 全链路验证工具链、FloatTest 位级差分测试框架、Code Wiki 代码知识提取、MARS 2.0 工具链、FA-MAGen 序列图生成框架"),
    ("数据与知识库：", BLUE, "软件 IP 知识库 2000 余个形式模型（尚未严格验证）；约 78,700 条机器检查定理及完整测试向量与证据链；COINS 评估基准（HumanEval 164 题 + 人工 Coq 规约）"),
    ("验证成果：", BLUE, "合计 95 个程序完成规约验证或测试（QCP 全链路形式化验证 + FloatTest 位级规约测试）；Code Wiki 在 GitHub 多个大规模开源项目上测试通过"),
]
add_textbox(s12, 0.75, 1.40, 11.9, bullet_paras(groups, sz=1600))

# ============ 重排幻灯片顺序 ============
sldIdLst = prs.slides._sldIdLst
ids = list(sldIdLst)
# 当前顺序: 0..13 为原 14 页, 14=A, 15=B, 16=C, 17=D, 18=F, 19=E
new_order = [ids[0], ids[1], ids[2], ids[14], ids[15], ids[16], ids[3], ids[17], ids[18], ids[19]] + ids[4:14]
for el in ids:
    sldIdLst.remove(el)
for el in new_order:
    sldIdLst.append(el)

prs.save(DECK)
print("saved:", DECK, "slides:", len(prs.slides.__iter__.__self__._sldIdLst))
