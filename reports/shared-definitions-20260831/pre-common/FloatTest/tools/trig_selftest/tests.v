(* 由 FloatTest/tools/trig_selftest/emit_trig_tests.py 自动生成，请勿手改。
 * ported_sin/ported_cos（Coq, FloatTrig.v）与 ported_trig.c（musl 移植，链接时
 * shadow libm）的逐比特差分：每条向量一对 out_eq64 比较，coqc 通过即测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.

Local Open Scope Z_scope.

Example t_0000 :
  out_eq64 (ported_sin (f64 (0))) (f64 (0)) &&
  out_eq64 (ported_cos (f64 (0))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0001 :
  out_eq64 (ported_sin (f64 (9223372036854775808))) (f64 (9223372036854775808)) &&
  out_eq64 (ported_cos (f64 (9223372036854775808))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0002 :
  out_eq64 (ported_sin (f64 (1))) (f64 (1)) &&
  out_eq64 (ported_cos (f64 (1))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0003 :
  out_eq64 (ported_sin (f64 (4503599627370495))) (f64 (4503599627370495)) &&
  out_eq64 (ported_cos (f64 (4503599627370495))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0004 :
  out_eq64 (ported_sin (f64 (4490088828488384512))) (f64 (4490088828488384512)) &&
  out_eq64 (ported_cos (f64 (4490088828488384512))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0005 :
  out_eq64 (ported_sin (f64 (4490088828488384513))) (f64 (4490088828488384513)) &&
  out_eq64 (ported_cos (f64 (4490088828488384513))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0006 :
  out_eq64 (ported_sin (f64 (4490088828488384511))) (f64 (4490088828488384511)) &&
  out_eq64 (ported_cos (f64 (4490088828488384511))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0007 :
  out_eq64 (ported_sin (f64 (13713460865343160320))) (f64 (13713460865343160320)) &&
  out_eq64 (ported_cos (f64 (13713460865343160320))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0008 :
  out_eq64 (ported_sin (f64 (13713460865343160321))) (f64 (13713460865343160321)) &&
  out_eq64 (ported_cos (f64 (13713460865343160321))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0009 :
  out_eq64 (ported_sin (f64 (13713460865343160319))) (f64 (13713460865343160319)) &&
  out_eq64 (ported_cos (f64 (13713460865343160319))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0010 :
  out_eq64 (ported_sin (f64 (4487450679186554880))) (f64 (4487450679186554880)) &&
  out_eq64 (ported_cos (f64 (4487450679186554880))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0011 :
  out_eq64 (ported_sin (f64 (4487450679186554881))) (f64 (4487450679186554881)) &&
  out_eq64 (ported_cos (f64 (4487450679186554881))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0012 :
  out_eq64 (ported_sin (f64 (4487450679186554879))) (f64 (4487450679186554879)) &&
  out_eq64 (ported_cos (f64 (4487450679186554879))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0013 :
  out_eq64 (ported_sin (f64 (13710822716041330688))) (f64 (13710822716041330688)) &&
  out_eq64 (ported_cos (f64 (13710822716041330688))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0014 :
  out_eq64 (ported_sin (f64 (13710822716041330689))) (f64 (13710822716041330689)) &&
  out_eq64 (ported_cos (f64 (13710822716041330689))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0015 :
  out_eq64 (ported_sin (f64 (13710822716041330687))) (f64 (13710822716041330687)) &&
  out_eq64 (ported_cos (f64 (13710822716041330687))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0016 :
  out_eq64 (ported_sin (f64 (4605249457297304856))) (f64 (4604544271217802188)) &&
  out_eq64 (ported_cos (f64 (4605249457297304856))) (f64 (4604544271217802189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0017 :
  out_eq64 (ported_sin (f64 (4605249457297304857))) (f64 (4604544271217802189)) &&
  out_eq64 (ported_cos (f64 (4605249457297304857))) (f64 (4604544271217802188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0018 :
  out_eq64 (ported_sin (f64 (4605249457297304855))) (f64 (4604544271217802188)) &&
  out_eq64 (ported_cos (f64 (4605249457297304855))) (f64 (4604544271217802190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0019 :
  out_eq64 (ported_sin (f64 (13828621494152080664))) (f64 (13827916308072577996)) &&
  out_eq64 (ported_cos (f64 (13828621494152080664))) (f64 (4604544271217802189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0020 :
  out_eq64 (ported_sin (f64 (13828621494152080665))) (f64 (13827916308072577997)) &&
  out_eq64 (ported_cos (f64 (13828621494152080665))) (f64 (4604544271217802188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0021 :
  out_eq64 (ported_sin (f64 (13828621494152080663))) (f64 (13827916308072577996)) &&
  out_eq64 (ported_cos (f64 (13828621494152080663))) (f64 (4604544271217802190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0022 :
  out_eq64 (ported_sin (f64 (4605249460178518015))) (f64 (4604544273255127226)) &&
  out_eq64 (ported_cos (f64 (4605249460178518015))) (f64 (4604544269180476500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0023 :
  out_eq64 (ported_sin (f64 (4605249460178518016))) (f64 (4604544273255127226)) &&
  out_eq64 (ported_cos (f64 (4605249460178518016))) (f64 (4604544269180476500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0024 :
  out_eq64 (ported_sin (f64 (4605249460178518017))) (f64 (4604544273255127227)) &&
  out_eq64 (ported_cos (f64 (4605249460178518017))) (f64 (4604544269180476499)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0025 :
  out_eq64 (ported_sin (f64 (4605249460178518015))) (f64 (4604544273255127226)) &&
  out_eq64 (ported_cos (f64 (4605249460178518015))) (f64 (4604544269180476500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0026 :
  out_eq64 (ported_sin (f64 (13828621497033293824))) (f64 (13827916310109903034)) &&
  out_eq64 (ported_cos (f64 (13828621497033293824))) (f64 (4604544269180476500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0027 :
  out_eq64 (ported_sin (f64 (13828621497033293825))) (f64 (13827916310109903035)) &&
  out_eq64 (ported_cos (f64 (13828621497033293825))) (f64 (4604544269180476499)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0028 :
  out_eq64 (ported_sin (f64 (13828621497033293823))) (f64 (13827916310109903034)) &&
  out_eq64 (ported_cos (f64 (13828621497033293823))) (f64 (4604544269180476500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0029 :
  out_eq64 (ported_sin (f64 (4605249457297304856))) (f64 (4604544271217802188)) &&
  out_eq64 (ported_cos (f64 (4605249457297304856))) (f64 (4604544271217802189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0030 :
  out_eq64 (ported_sin (f64 (4605249457297304857))) (f64 (4604544271217802189)) &&
  out_eq64 (ported_cos (f64 (4605249457297304857))) (f64 (4604544271217802188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0031 :
  out_eq64 (ported_sin (f64 (4605249457297304855))) (f64 (4604544271217802188)) &&
  out_eq64 (ported_cos (f64 (4605249457297304855))) (f64 (4604544271217802190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0032 :
  out_eq64 (ported_sin (f64 (13828621494152080664))) (f64 (13827916308072577996)) &&
  out_eq64 (ported_cos (f64 (13828621494152080664))) (f64 (4604544271217802189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0033 :
  out_eq64 (ported_sin (f64 (13828621494152080665))) (f64 (13827916308072577997)) &&
  out_eq64 (ported_cos (f64 (13828621494152080665))) (f64 (4604544271217802188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0034 :
  out_eq64 (ported_sin (f64 (13828621494152080663))) (f64 (13827916308072577996)) &&
  out_eq64 (ported_cos (f64 (13828621494152080663))) (f64 (4604544271217802190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0035 :
  out_eq64 (ported_sin (f64 (4609753056924675352))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4609753056924675352))) (f64 (4364452196894661639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0036 :
  out_eq64 (ported_sin (f64 (4609753056924675353))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4609753056924675353))) (f64 (13593883396231516669)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0037 :
  out_eq64 (ported_sin (f64 (4609753056924675351))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4609753056924675351))) (f64 (4374237177576756994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0038 :
  out_eq64 (ported_sin (f64 (13833125093779451160))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13833125093779451160))) (f64 (4364452196894661639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0039 :
  out_eq64 (ported_sin (f64 (13833125093779451161))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13833125093779451161))) (f64 (13593883396231516669)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0040 :
  out_eq64 (ported_sin (f64 (13833125093779451159))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13833125093779451159))) (f64 (4374237177576756994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0041 :
  out_eq64 (ported_sin (f64 (4612488097114038738))) (f64 (4604544271217802189)) &&
  out_eq64 (ported_cos (f64 (4612488097114038738))) (f64 (13827916308072577996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0042 :
  out_eq64 (ported_sin (f64 (4612488097114038739))) (f64 (4604544271217802186)) &&
  out_eq64 (ported_cos (f64 (4612488097114038739))) (f64 (13827916308072577999)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0043 :
  out_eq64 (ported_sin (f64 (4612488097114038737))) (f64 (4604544271217802192)) &&
  out_eq64 (ported_cos (f64 (4612488097114038737))) (f64 (13827916308072577993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0044 :
  out_eq64 (ported_sin (f64 (13835860133968814546))) (f64 (13827916308072577997)) &&
  out_eq64 (ported_cos (f64 (13835860133968814546))) (f64 (13827916308072577996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0045 :
  out_eq64 (ported_sin (f64 (13835860133968814547))) (f64 (13827916308072577994)) &&
  out_eq64 (ported_cos (f64 (13835860133968814547))) (f64 (13827916308072577999)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0046 :
  out_eq64 (ported_sin (f64 (13835860133968814545))) (f64 (13827916308072578000)) &&
  out_eq64 (ported_cos (f64 (13835860133968814545))) (f64 (13827916308072577993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0047 :
  out_eq64 (ported_sin (f64 (4614256656552045848))) (f64 (4368955796522032135)) &&
  out_eq64 (ported_cos (f64 (4614256656552045848))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0048 :
  out_eq64 (ported_sin (f64 (4614256656552045849))) (f64 (13598386995858887165)) &&
  out_eq64 (ported_cos (f64 (4614256656552045849))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0049 :
  out_eq64 (ported_sin (f64 (4614256656552045847))) (f64 (4378740777204127490)) &&
  out_eq64 (ported_cos (f64 (4614256656552045847))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0050 :
  out_eq64 (ported_sin (f64 (13837628693406821656))) (f64 (13592327833376807943)) &&
  out_eq64 (ported_cos (f64 (13837628693406821656))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0051 :
  out_eq64 (ported_sin (f64 (13837628693406821657))) (f64 (4375014959004111357)) &&
  out_eq64 (ported_cos (f64 (13837628693406821657))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0052 :
  out_eq64 (ported_sin (f64 (13837628693406821655))) (f64 (13602112814058903298)) &&
  out_eq64 (ported_cos (f64 (13837628693406821655))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0053 :
  out_eq64 (ported_sin (f64 (4616025215990052958))) (f64 (13827916308072577996)) &&
  out_eq64 (ported_cos (f64 (4616025215990052958))) (f64 (13827916308072577998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0054 :
  out_eq64 (ported_sin (f64 (4616025215990052959))) (f64 (13827916308072577998)) &&
  out_eq64 (ported_cos (f64 (4616025215990052959))) (f64 (13827916308072577995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0055 :
  out_eq64 (ported_sin (f64 (4616025215990052957))) (f64 (13827916308072577993)) &&
  out_eq64 (ported_cos (f64 (4616025215990052957))) (f64 (13827916308072578000)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0056 :
  out_eq64 (ported_sin (f64 (13839397252844828766))) (f64 (4604544271217802188)) &&
  out_eq64 (ported_cos (f64 (13839397252844828766))) (f64 (13827916308072577998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0057 :
  out_eq64 (ported_sin (f64 (13839397252844828767))) (f64 (4604544271217802190)) &&
  out_eq64 (ported_cos (f64 (13839397252844828767))) (f64 (13827916308072577995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0058 :
  out_eq64 (ported_sin (f64 (13839397252844828765))) (f64 (4604544271217802185)) &&
  out_eq64 (ported_cos (f64 (13839397252844828765))) (f64 (13827916308072578000)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0059 :
  out_eq64 (ported_sin (f64 (4616991696741409234))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409234))) (f64 (13594811712176818698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0060 :
  out_eq64 (ported_sin (f64 (4616991696741409235))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409235))) (f64 (4380139528331484541)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0061 :
  out_eq64 (ported_sin (f64 (4616991696741409233))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409233))) (f64 (13606305928836272449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0062 :
  out_eq64 (ported_sin (f64 (13840363733596185042))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185042))) (f64 (13594811712176818698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0063 :
  out_eq64 (ported_sin (f64 (13840363733596185043))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185043))) (f64 (4380139528331484541)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0064 :
  out_eq64 (ported_sin (f64 (13840363733596185041))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185041))) (f64 (13606305928836272449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0065 :
  out_eq64 (ported_sin (f64 (4617875976460412789))) (f64 (13827916308072577998)) &&
  out_eq64 (ported_cos (f64 (4617875976460412789))) (f64 (4604544271217802187)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0066 :
  out_eq64 (ported_sin (f64 (4617875976460412790))) (f64 (13827916308072577992)) &&
  out_eq64 (ported_cos (f64 (4617875976460412790))) (f64 (4604544271217802193)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0067 :
  out_eq64 (ported_sin (f64 (4617875976460412788))) (f64 (13827916308072578004)) &&
  out_eq64 (ported_cos (f64 (4617875976460412788))) (f64 (4604544271217802182)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0068 :
  out_eq64 (ported_sin (f64 (13841248013315188597))) (f64 (4604544271217802190)) &&
  out_eq64 (ported_cos (f64 (13841248013315188597))) (f64 (4604544271217802187)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0069 :
  out_eq64 (ported_sin (f64 (13841248013315188598))) (f64 (4604544271217802184)) &&
  out_eq64 (ported_cos (f64 (13841248013315188598))) (f64 (4604544271217802193)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0070 :
  out_eq64 (ported_sin (f64 (13841248013315188596))) (f64 (4604544271217802196)) &&
  out_eq64 (ported_cos (f64 (13841248013315188596))) (f64 (4604544271217802182)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0071 :
  out_eq64 (ported_sin (f64 (4618760256179416344))) (f64 (13596831433004178439)) &&
  out_eq64 (ported_cos (f64 (4618760256179416344))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0072 :
  out_eq64 (ported_sin (f64 (4618760256179416345))) (f64 (4379518558631481853)) &&
  out_eq64 (ported_cos (f64 (4618760256179416345))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0073 :
  out_eq64 (ported_sin (f64 (4618760256179416343))) (f64 (13606616413686273794)) &&
  out_eq64 (ported_cos (f64 (4618760256179416343))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0074 :
  out_eq64 (ported_sin (f64 (13842132293034192152))) (f64 (4373459396149402631)) &&
  out_eq64 (ported_cos (f64 (13842132293034192152))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0075 :
  out_eq64 (ported_sin (f64 (13842132293034192153))) (f64 (13602890595486257661)) &&
  out_eq64 (ported_cos (f64 (13842132293034192153))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0076 :
  out_eq64 (ported_sin (f64 (13842132293034192151))) (f64 (4383244376831497986)) &&
  out_eq64 (ported_cos (f64 (13842132293034192151))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0077 :
  out_eq64 (ported_sin (f64 (4609753055510921216))) (f64 (4607182418800016964)) &&
  out_eq64 (ported_cos (f64 (4609753055510921216))) (f64 (4509529341999293893)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0078 :
  out_eq64 (ported_sin (f64 (4609753055510921217))) (f64 (4607182418800016964)) &&
  out_eq64 (ported_cos (f64 (4609753055510921217))) (f64 (4509529341995099589)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0079 :
  out_eq64 (ported_sin (f64 (4609753055510921215))) (f64 (4607182418800016964)) &&
  out_eq64 (ported_cos (f64 (4609753055510921215))) (f64 (4509529342003488197)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0080 :
  out_eq64 (ported_sin (f64 (13833125092365697024))) (f64 (13830554455654792772)) &&
  out_eq64 (ported_cos (f64 (13833125092365697024))) (f64 (4509529341999293893)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0081 :
  out_eq64 (ported_sin (f64 (13833125092365697025))) (f64 (13830554455654792772)) &&
  out_eq64 (ported_cos (f64 (13833125092365697025))) (f64 (4509529341995099589)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0082 :
  out_eq64 (ported_sin (f64 (13833125092365697023))) (f64 (13830554455654792772)) &&
  out_eq64 (ported_cos (f64 (13833125092365697023))) (f64 (4509529342003488197)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0083 :
  out_eq64 (ported_sin (f64 (4614256655138291712))) (f64 (4514032941626664097)) &&
  out_eq64 (ported_cos (f64 (4614256655138291712))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0084 :
  out_eq64 (ported_sin (f64 (4614256655138291713))) (f64 (4514032941622469793)) &&
  out_eq64 (ported_cos (f64 (4614256655138291713))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0085 :
  out_eq64 (ported_sin (f64 (4614256655138291711))) (f64 (4514032941630858401)) &&
  out_eq64 (ported_cos (f64 (4614256655138291711))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0086 :
  out_eq64 (ported_sin (f64 (13837628691993067520))) (f64 (13737404978481439905)) &&
  out_eq64 (ported_cos (f64 (13837628691993067520))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0087 :
  out_eq64 (ported_sin (f64 (13837628691993067521))) (f64 (13737404978477245601)) &&
  out_eq64 (ported_cos (f64 (13837628691993067521))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0088 :
  out_eq64 (ported_sin (f64 (13837628691993067519))) (f64 (13737404978485634209)) &&
  out_eq64 (ported_cos (f64 (13837628691993067519))) (f64 (13830554455654791441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0089 :
  out_eq64 (ported_sin (f64 (4616991696741409234))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409234))) (f64 (13594811712176818698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0090 :
  out_eq64 (ported_sin (f64 (4616991696741409235))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409235))) (f64 (4380139528331484541)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0091 :
  out_eq64 (ported_sin (f64 (4616991696741409233))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (4616991696741409233))) (f64 (13606305928836272449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0092 :
  out_eq64 (ported_sin (f64 (13840363733596185042))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185042))) (f64 (13594811712176818698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0093 :
  out_eq64 (ported_sin (f64 (13840363733596185043))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185043))) (f64 (4380139528331484541)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0094 :
  out_eq64 (ported_sin (f64 (13840363733596185041))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (13840363733596185041))) (f64 (13606305928836272449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0095 :
  out_eq64 (ported_sin (f64 (4618760256179416344))) (f64 (13596831433004178439)) &&
  out_eq64 (ported_cos (f64 (4618760256179416344))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0096 :
  out_eq64 (ported_sin (f64 (4618760256179416345))) (f64 (4379518558631481853)) &&
  out_eq64 (ported_cos (f64 (4618760256179416345))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0097 :
  out_eq64 (ported_sin (f64 (4618760256179416343))) (f64 (13606616413686273794)) &&
  out_eq64 (ported_cos (f64 (4618760256179416343))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0098 :
  out_eq64 (ported_sin (f64 (13842132293034192152))) (f64 (4373459396149402631)) &&
  out_eq64 (ported_cos (f64 (13842132293034192152))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0099 :
  out_eq64 (ported_sin (f64 (13842132293034192153))) (f64 (13602890595486257661)) &&
  out_eq64 (ported_cos (f64 (13842132293034192153))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0100 :
  out_eq64 (ported_sin (f64 (13842132293034192151))) (f64 (4383244376831497986)) &&
  out_eq64 (ported_cos (f64 (13842132293034192151))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0101 :
  out_eq64 (ported_sin (f64 (4612488094979981312))) (f64 (4604544277253825238)) &&
  out_eq64 (ported_cos (f64 (4612488094979981312))) (f64 (13827916302036549226)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0102 :
  out_eq64 (ported_sin (f64 (4612488094979981313))) (f64 (4604544277253825235)) &&
  out_eq64 (ported_cos (f64 (4612488094979981313))) (f64 (13827916302036549229)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0103 :
  out_eq64 (ported_sin (f64 (4612488094979981311))) (f64 (4604544277253825241)) &&
  out_eq64 (ported_cos (f64 (4612488094979981311))) (f64 (13827916302036549224)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0104 :
  out_eq64 (ported_sin (f64 (13835860131834757120))) (f64 (13827916314108601046)) &&
  out_eq64 (ported_cos (f64 (13835860131834757120))) (f64 (13827916302036549226)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0105 :
  out_eq64 (ported_sin (f64 (13835860131834757121))) (f64 (13827916314108601043)) &&
  out_eq64 (ported_cos (f64 (13835860131834757121))) (f64 (13827916302036549229)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0106 :
  out_eq64 (ported_sin (f64 (13835860131834757119))) (f64 (13827916314108601049)) &&
  out_eq64 (ported_cos (f64 (13835860131834757119))) (f64 (13827916302036549224)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0107 :
  out_eq64 (ported_sin (f64 (4616025215296602112))) (f64 (13827916306111202511)) &&
  out_eq64 (ported_cos (f64 (4616025215296602112))) (f64 (13827916310033952878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0108 :
  out_eq64 (ported_sin (f64 (4616025215296602113))) (f64 (13827916306111202514)) &&
  out_eq64 (ported_cos (f64 (4616025215296602113))) (f64 (13827916310033952875)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0109 :
  out_eq64 (ported_sin (f64 (4616025215296602111))) (f64 (13827916306111202508)) &&
  out_eq64 (ported_cos (f64 (4616025215296602111))) (f64 (13827916310033952881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0110 :
  out_eq64 (ported_sin (f64 (13839397252151377920))) (f64 (4604544269256426703)) &&
  out_eq64 (ported_cos (f64 (13839397252151377920))) (f64 (13827916310033952878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0111 :
  out_eq64 (ported_sin (f64 (13839397252151377921))) (f64 (4604544269256426706)) &&
  out_eq64 (ported_cos (f64 (13839397252151377921))) (f64 (13827916310033952875)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0112 :
  out_eq64 (ported_sin (f64 (13839397252151377919))) (f64 (4604544269256426700)) &&
  out_eq64 (ported_cos (f64 (13839397252151377919))) (f64 (13827916310033952881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0113 :
  out_eq64 (ported_sin (f64 (4617875976833990656))) (f64 (13827916305959302103)) &&
  out_eq64 (ported_cos (f64 (4617875976833990656))) (f64 (4604544273331077381)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0114 :
  out_eq64 (ported_sin (f64 (4617875976833990657))) (f64 (13827916305959302097)) &&
  out_eq64 (ported_cos (f64 (4617875976833990657))) (f64 (4604544273331077387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0115 :
  out_eq64 (ported_sin (f64 (4617875976833990655))) (f64 (13827916305959302108)) &&
  out_eq64 (ported_cos (f64 (4617875976833990655))) (f64 (4604544273331077376)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0116 :
  out_eq64 (ported_sin (f64 (13841248013688766464))) (f64 (4604544269104526295)) &&
  out_eq64 (ported_cos (f64 (13841248013688766464))) (f64 (4604544273331077381)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0117 :
  out_eq64 (ported_sin (f64 (13841248013688766465))) (f64 (4604544269104526289)) &&
  out_eq64 (ported_cos (f64 (13841248013688766465))) (f64 (4604544273331077387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0118 :
  out_eq64 (ported_sin (f64 (13841248013688766463))) (f64 (4604544269104526300)) &&
  out_eq64 (ported_cos (f64 (13841248013688766463))) (f64 (4604544273331077376)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0119 :
  out_eq64 (ported_sin (f64 (4619644536992301056))) (f64 (4604544277405725452)) &&
  out_eq64 (ported_cos (f64 (4619644536992301056))) (f64 (4604544265029872913)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0120 :
  out_eq64 (ported_sin (f64 (4619644536992301057))) (f64 (4604544277405725458)) &&
  out_eq64 (ported_cos (f64 (4619644536992301057))) (f64 (4604544265029872907)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0121 :
  out_eq64 (ported_sin (f64 (4619644536992301055))) (f64 (4604544277405725447)) &&
  out_eq64 (ported_cos (f64 (4619644536992301055))) (f64 (4604544265029872919)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0122 :
  out_eq64 (ported_sin (f64 (13843016573847076864))) (f64 (13827916314260501260)) &&
  out_eq64 (ported_cos (f64 (13843016573847076864))) (f64 (4604544265029872913)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0123 :
  out_eq64 (ported_sin (f64 (13843016573847076865))) (f64 (13827916314260501266)) &&
  out_eq64 (ported_cos (f64 (13843016573847076865))) (f64 (4604544265029872907)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0124 :
  out_eq64 (ported_sin (f64 (13843016573847076863))) (f64 (13827916314260501255)) &&
  out_eq64 (ported_cos (f64 (13843016573847076863))) (f64 (4604544265029872919)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0125 :
  out_eq64 (ported_sin (f64 (4620528815617423454))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4620528815617423454))) (f64 (4374701335549408009)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0126 :
  out_eq64 (ported_sin (f64 (4620528815617423455))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4620528815617423455))) (f64 (13602269625786254972)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0127 :
  out_eq64 (ported_sin (f64 (4620528815617423453))) (f64 (4607182418800017408)) &&
  out_eq64 (ported_cos (f64 (4620528815617423453))) (f64 (4383554861681499330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0128 :
  out_eq64 (ported_sin (f64 (13843900852472199262))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13843900852472199262))) (f64 (4374701335549408009)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0129 :
  out_eq64 (ported_sin (f64 (13843900852472199263))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13843900852472199263))) (f64 (13602269625786254972)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0130 :
  out_eq64 (ported_sin (f64 (13843900852472199261))) (f64 (13830554455654793216)) &&
  out_eq64 (ported_cos (f64 (13843900852472199261))) (f64 (4383554861681499330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0131 :
  out_eq64 (ported_sin (f64 (4635227165180642107))) (f64 (13601347587050356949)) &&
  out_eq64 (ported_cos (f64 (4635227165180642107))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0132 :
  out_eq64 (ported_sin (f64 (4635227165180642108))) (f64 (13623544507546338823)) &&
  out_eq64 (ported_cos (f64 (4635227165180642108))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0133 :
  out_eq64 (ported_sin (f64 (4635227165180642106))) (f64 (4399705566439797747)) &&
  out_eq64 (ported_cos (f64 (4635227165180642106))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0134 :
  out_eq64 (ported_sin (f64 (13858599202035417915))) (f64 (4377975550195581141)) &&
  out_eq64 (ported_cos (f64 (13858599202035417915))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0135 :
  out_eq64 (ported_sin (f64 (13858599202035417916))) (f64 (4400172470691563015)) &&
  out_eq64 (ported_cos (f64 (13858599202035417916))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0136 :
  out_eq64 (ported_sin (f64 (13858599202035417914))) (f64 (13623077603294573555)) &&
  out_eq64 (ported_cos (f64 (13858599202035417914))) (f64 (13830554455654793216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0137 :
  out_eq64 (ported_sin (f64 (4650119651123696649))) (f64 (13634258784987705583)) &&
  out_eq64 (ported_cos (f64 (4650119651123696649))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0138 :
  out_eq64 (ported_sin (f64 (4650119651123696650))) (f64 (4405298609321287201)) &&
  out_eq64 (ported_cos (f64 (4650119651123696650))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0139 :
  out_eq64 (ported_sin (f64 (4650119651123696648))) (f64 (13640082827960154232)) &&
  out_eq64 (ported_cos (f64 (4650119651123696648))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0140 :
  out_eq64 (ported_sin (f64 (13873491687978472457))) (f64 (4410886748132929775)) &&
  out_eq64 (ported_cos (f64 (13873491687978472457))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0141 :
  out_eq64 (ported_sin (f64 (13873491687978472458))) (f64 (13628670646176063009)) &&
  out_eq64 (ported_cos (f64 (13873491687978472458))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0142 :
  out_eq64 (ported_sin (f64 (13873491687978472456))) (f64 (4416710791105378424)) &&
  out_eq64 (ported_cos (f64 (13873491687978472456))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0143 :
  out_eq64 (ported_sin (f64 (4665357558831986956))) (f64 (13637206037109191853)) &&
  out_eq64 (ported_cos (f64 (4665357558831986956))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0144 :
  out_eq64 (ported_sin (f64 (4665357558831986957))) (f64 (4425835942440522453)) &&
  out_eq64 (ported_cos (f64 (4665357558831986957))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0145 :
  out_eq64 (ported_sin (f64 (4665357558831986955))) (f64 (13651011716192310934)) &&
  out_eq64 (ported_cos (f64 (4665357558831986955))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0146 :
  out_eq64 (ported_sin (f64 (13888729595686762764))) (f64 (4413834000254416045)) &&
  out_eq64 (ported_cos (f64 (13888729595686762764))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0147 :
  out_eq64 (ported_sin (f64 (13888729595686762765))) (f64 (13649207979295298261)) &&
  out_eq64 (ported_cos (f64 (13888729595686762765))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0148 :
  out_eq64 (ported_sin (f64 (13888729595686762763))) (f64 (4427639679337535126)) &&
  out_eq64 (ported_cos (f64 (13888729595686762763))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0149 :
  out_eq64 (ported_sin (f64 (4680133628292383655))) (f64 (13664672826482506811)) &&
  out_eq64 (ported_cos (f64 (4680133628292383655))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0150 :
  out_eq64 (ported_sin (f64 (4680133628292383656))) (f64 (4439046118506465162)) &&
  out_eq64 (ported_cos (f64 (4680133628292383656))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0151 :
  out_eq64 (ported_sin (f64 (4680133628292383654))) (f64 (13671052447403351581)) &&
  out_eq64 (ported_cos (f64 (4680133628292383654))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0152 :
  out_eq64 (ported_sin (f64 (13903505665147159463))) (f64 (4441300789627731003)) &&
  out_eq64 (ported_cos (f64 (13903505665147159463))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0153 :
  out_eq64 (ported_sin (f64 (13903505665147159464))) (f64 (13662418155361240970)) &&
  out_eq64 (ported_cos (f64 (13903505665147159464))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0154 :
  out_eq64 (ported_sin (f64 (13903505665147159462))) (f64 (4447680410548575773)) &&
  out_eq64 (ported_cos (f64 (13903505665147159462))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0155 :
  out_eq64 (ported_sin (f64 (4690490131317576849))) (f64 (13672555561484195475)) &&
  out_eq64 (ported_cos (f64 (4690490131317576849))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0156 :
  out_eq64 (ported_sin (f64 (4690490131317576850))) (f64 (4449742885448365238)) &&
  out_eq64 (ported_cos (f64 (4690490131317576850))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0157 :
  out_eq64 (ported_sin (f64 (4690490131317576848))) (f64 (13679590641334724005)) &&
  out_eq64 (ported_cos (f64 (4690490131317576848))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0158 :
  out_eq64 (ported_sin (f64 (13913862168172352657))) (f64 (4449183524629419667)) &&
  out_eq64 (ported_cos (f64 (13913862168172352657))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0159 :
  out_eq64 (ported_sin (f64 (13913862168172352658))) (f64 (13673114922303141046)) &&
  out_eq64 (ported_cos (f64 (13913862168172352658))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0160 :
  out_eq64 (ported_sin (f64 (13913862168172352656))) (f64 (4456218604479948197)) &&
  out_eq64 (ported_cos (f64 (13913862168172352656))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0161 :
  out_eq64 (ported_sin (f64 (4694993730944947345))) (f64 (13677059161111565971)) &&
  out_eq64 (ported_cos (f64 (4694993730944947345))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0162 :
  out_eq64 (ported_sin (f64 (4694993730944947346))) (f64 (4454246485075735734)) &&
  out_eq64 (ported_cos (f64 (4694993730944947346))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0163 :
  out_eq64 (ported_sin (f64 (4694993730944947344))) (f64 (13684094240962094501)) &&
  out_eq64 (ported_cos (f64 (4694993730944947344))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0164 :
  out_eq64 (ported_sin (f64 (13918365767799723153))) (f64 (4453687124256790163)) &&
  out_eq64 (ported_cos (f64 (13918365767799723153))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0165 :
  out_eq64 (ported_sin (f64 (13918365767799723154))) (f64 (13677618521930511542)) &&
  out_eq64 (ported_cos (f64 (13918365767799723154))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0166 :
  out_eq64 (ported_sin (f64 (13918365767799723152))) (f64 (4460722204107318693)) &&
  out_eq64 (ported_cos (f64 (13918365767799723152))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0167 :
  out_eq64 (ported_sin (f64 (4699825048058331135))) (f64 (13822866869467852544)) &&
  out_eq64 (ported_cos (f64 (4699825048058331135))) (f64 (4606698844765293251)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0168 :
  out_eq64 (ported_sin (f64 (4699825048058331136))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (4699825048058331136))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0169 :
  out_eq64 (ported_sin (f64 (4699825048058331137))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (4699825048058331137))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0170 :
  out_eq64 (ported_sin (f64 (4699825048058331135))) (f64 (13822866869467852544)) &&
  out_eq64 (ported_cos (f64 (4699825048058331135))) (f64 (4606698844765293251)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0171 :
  out_eq64 (ported_sin (f64 (13923197084913106944))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (13923197084913106944))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0172 :
  out_eq64 (ported_sin (f64 (13923197084913106945))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (13923197084913106945))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0173 :
  out_eq64 (ported_sin (f64 (13923197084913106943))) (f64 (4599494832613076736)) &&
  out_eq64 (ported_cos (f64 (13923197084913106943))) (f64 (4606698844765293251)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0174 :
  out_eq64 (ported_sin (f64 (9094988921128908188))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (9094988921128908188))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0175 :
  out_eq64 (ported_sin (f64 (18318360957983683996))) (f64 (9221120237041090560)) &&
  out_eq64 (ported_cos (f64 (18318360957983683996))) (f64 (9221120237041090560)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0176 :
  out_eq64 (ported_sin (f64 (13844340436044288777))) (f64 (13828799558126360420)) &&
  out_eq64 (ported_cos (f64 (13844340436044288777))) (f64 (13826888956324719823)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0177 :
  out_eq64 (ported_sin (f64 (13826092695695767214))) (f64 (13825753561566652544)) &&
  out_eq64 (ported_cos (f64 (13826092695695767214))) (f64 (4606059636329959842)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0178 :
  out_eq64 (ported_sin (f64 (4622195580138162730))) (f64 (13830077621763294182)) &&
  out_eq64 (ported_cos (f64 (4622195580138162730))) (f64 (13822827256061777952)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0179 :
  out_eq64 (ported_sin (f64 (4625278147483512546))) (f64 (13826490794965775792)) &&
  out_eq64 (ported_cos (f64 (4625278147483512546))) (f64 (13829076603308238249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0180 :
  out_eq64 (ported_sin (f64 (4622879383825618025))) (f64 (13827231622763424611)) &&
  out_eq64 (ported_cos (f64 (4622879383825618025))) (f64 (4605162180076263210)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0181 :
  out_eq64 (ported_sin (f64 (4626662539366178902))) (f64 (4604534452852431396)) &&
  out_eq64 (ported_cos (f64 (4626662539366178902))) (f64 (13827926111325489659)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0182 :
  out_eq64 (ported_sin (f64 (13777814066185947105))) (f64 (13777814066090066353)) &&
  out_eq64 (ported_cos (f64 (13777814066185947105))) (f64 (4607182418353811744)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0183 :
  out_eq64 (ported_sin (f64 (13847011146582070266))) (f64 (13827116457388666239)) &&
  out_eq64 (ported_cos (f64 (13847011146582070266))) (f64 (4605254318270610550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0184 :
  out_eq64 (ported_sin (f64 (4635173695808289578))) (f64 (4604379463391365896)) &&
  out_eq64 (ported_cos (f64 (4635173695808289578))) (f64 (13828076957519771832)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0185 :
  out_eq64 (ported_sin (f64 (13840468375119204782))) (f64 (4607143545118400476)) &&
  out_eq64 (ported_cos (f64 (13840468375119204782))) (f64 (4591351840872749731)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0186 :
  out_eq64 (ported_sin (f64 (13898199565194993578))) (f64 (4606757457994676703)) &&
  out_eq64 (ported_cos (f64 (13898199565194993578))) (f64 (13822511680771254534)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0187 :
  out_eq64 (ported_sin (f64 (4603973940114010580))) (f64 (4603581601165706665)) &&
  out_eq64 (ported_cos (f64 (4603973940114010580))) (f64 (4605379431937264917)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0188 :
  out_eq64 (ported_sin (f64 (4609768785620548949))) (f64 (4607182363868042345)) &&
  out_eq64 (ported_cos (f64 (4609768785620548949))) (f64 (13793571535297300665)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0189 :
  out_eq64 (ported_sin (f64 (13849235895428658298))) (f64 (4601986287848937912)) &&
  out_eq64 (ported_cos (f64 (13849235895428658298))) (f64 (4606165602058884492)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0190 :
  out_eq64 (ported_sin (f64 (13850089135835225636))) (f64 (13826558683783968403)) &&
  out_eq64 (ported_cos (f64 (13850089135835225636))) (f64 (13829031588968180241)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0191 :
  out_eq64 (ported_sin (f64 (4626825098543426100))) (f64 (4596549263710064585)) &&
  out_eq64 (ported_cos (f64 (4626825098543426100))) (f64 (13830363404440067221)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0192 :
  out_eq64 (ported_sin (f64 (4626424830308431241))) (f64 (4607167494718079359)) &&
  out_eq64 (ported_cos (f64 (4626424830308431241))) (f64 (4588453478124256038)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0193 :
  out_eq64 (ported_sin (f64 (4621351635076206101))) (f64 (4598219046041617563)) &&
  out_eq64 (ported_cos (f64 (4621351635076206101))) (f64 (13830262752216524911)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0194 :
  out_eq64 (ported_sin (f64 (4627490943298048833))) (f64 (13829039573714324874)) &&
  out_eq64 (ported_cos (f64 (4627490943298048833))) (f64 (4603174701486123582)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0195 :
  out_eq64 (ported_sin (f64 (13903806793188826348))) (f64 (13826116358133843546)) &&
  out_eq64 (ported_cos (f64 (13903806793188826348))) (f64 (13829309533627829638)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0196 :
  out_eq64 (ported_sin (f64 (4558387785039251669))) (f64 (4558387784755988424)) &&
  out_eq64 (ported_cos (f64 (4558387785039251669))) (f64 (4607182417341670201)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0197 :
  out_eq64 (ported_sin (f64 (13848661061769501889))) (f64 (4603405961923741618)) &&
  out_eq64 (ported_cos (f64 (13848661061769501889))) (f64 (13828879989354738006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0198 :
  out_eq64 (ported_sin (f64 (4617254560822543290))) (f64 (13830310084983735144)) &&
  out_eq64 (ported_cos (f64 (4617254560822543290))) (f64 (4597503461373138094)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0199 :
  out_eq64 (ported_sin (f64 (4627207888208246790))) (f64 (13829781933738432956)) &&
  out_eq64 (ported_cos (f64 (4627207888208246790))) (f64 (13824342897157095849)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0200 :
  out_eq64 (ported_sin (f64 (13733522161942946755))) (f64 (13733522161942946624)) &&
  out_eq64 (ported_cos (f64 (13733522161942946755))) (f64 (4607182418800016866)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0201 :
  out_eq64 (ported_sin (f64 (4613614486153699103))) (f64 (4598739630330745668)) &&
  out_eq64 (ported_cos (f64 (4613614486153699103))) (f64 (13830190661749128689)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0202 :
  out_eq64 (ported_sin (f64 (13849502879244682900))) (f64 (13825182333486849891)) &&
  out_eq64 (ported_cos (f64 (13849502879244682900))) (f64 (4606210773275429112)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0203 :
  out_eq64 (ported_sin (f64 (4624549582127206733))) (f64 (4604987629407137176)) &&
  out_eq64 (ported_cos (f64 (4624549582127206733))) (f64 (13827439684616723934)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0204 :
  out_eq64 (ported_sin (f64 (4625952610143763217))) (f64 (13818437981548841245)) &&
  out_eq64 (ported_cos (f64 (4625952610143763217))) (f64 (4607060912759525207)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0205 :
  out_eq64 (ported_sin (f64 (4517367580740588954))) (f64 (4517367580740588148)) &&
  out_eq64 (ported_cos (f64 (4517367580740588954))) (f64 (4607182418800012831)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0206 :
  out_eq64 (ported_sin (f64 (13849216441043783028))) (f64 (4602874450232058005)) &&
  out_eq64 (ported_cos (f64 (13849216441043783028))) (f64 (4605859415623397856)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0207 :
  out_eq64 (ported_sin (f64 (13843501660928711026))) (f64 (13829994222803485551)) &&
  out_eq64 (ported_cos (f64 (13843501660928711026))) (f64 (4599925705620508763)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0208 :
  out_eq64 (ported_sin (f64 (4627623244264771168))) (f64 (13825874657143456374)) &&
  out_eq64 (ported_cos (f64 (4627623244264771168))) (f64 (4606025888085435986)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0209 :
  out_eq64 (ported_sin (f64 (13792799613238897837))) (f64 (13792799601138777576)) &&
  out_eq64 (ported_cos (f64 (13792799613238897837))) (f64 (4607182373894432344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0210 :
  out_eq64 (ported_sin (f64 (13850284086321089588))) (f64 (4592043144383764211)) &&
  out_eq64 (ported_cos (f64 (13850284086321089588))) (f64 (13830507107206906771)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0211 :
  out_eq64 (ported_sin (f64 (13850891149491054206))) (f64 (4605130547069480302)) &&
  out_eq64 (ported_cos (f64 (13850891149491054206))) (f64 (4603898248240439364)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0212 :
  out_eq64 (ported_sin (f64 (4627029290103156188))) (f64 (13825980620479051049)) &&
  out_eq64 (ported_cos (f64 (4627029290103156188))) (f64 (13829367889900118959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0213 :
  out_eq64 (ported_sin (f64 (13838339210387395516))) (f64 (4599261904446307842)) &&
  out_eq64 (ported_cos (f64 (13838339210387395516))) (f64 (13830109780451842339)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0214 :
  out_eq64 (ported_sin (f64 (13847136583814232410))) (f64 (13828543128573085536)) &&
  out_eq64 (ported_cos (f64 (13847136583814232410))) (f64 (4603848614556483097)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0215 :
  out_eq64 (ported_sin (f64 (13850297177691947471))) (f64 (4594519678401515636)) &&
  out_eq64 (ported_cos (f64 (13850297177691947471))) (f64 (13830454535621624624)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0216 :
  out_eq64 (ported_sin (f64 (4599877829759945336))) (f64 (4599755787313279821)) &&
  out_eq64 (ported_cos (f64 (4599877829759945336))) (f64 (4606653153561938375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0217 :
  out_eq64 (ported_sin (f64 (4493720322144520104))) (f64 (4493720322144520103)) &&
  out_eq64 (ported_cos (f64 (4493720322144520104))) (f64 (4607182418800017405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0218 :
  out_eq64 (ported_sin (f64 (13828933187334676878))) (f64 (13828132851364930488)) &&
  out_eq64 (ported_cos (f64 (13828933187334676878))) (f64 (4604320101755146410)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0219 :
  out_eq64 (ported_sin (f64 (4625364712293667568))) (f64 (13828538095709419379)) &&
  out_eq64 (ported_cos (f64 (4625364712293667568))) (f64 (13827226851822722192)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0220 :
  out_eq64 (ported_sin (f64 (4525775007155925112))) (f64 (4525775007155905666)) &&
  out_eq64 (ported_cos (f64 (4525775007155925112))) (f64 (4607182418799956763)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0221 :
  out_eq64 (ported_sin (f64 (13850080986158545246))) (f64 (13826773250489732910)) &&
  out_eq64 (ported_cos (f64 (13850080986158545246))) (f64 (13828883374187358343)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0222 :
  out_eq64 (ported_sin (f64 (13844925061363513158))) (f64 (4592040679025212117)) &&
  out_eq64 (ported_cos (f64 (13844925061363513158))) (f64 (13830507138925013800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0223 :
  out_eq64 (ported_sin (f64 (4623919323837005371))) (f64 (4606448598910299370)) &&
  out_eq64 (ported_cos (f64 (4623919323837005371))) (f64 (4600793651172265610)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0224 :
  out_eq64 (ported_sin (f64 (4530618209112730150))) (f64 (4530618209112642856)) &&
  out_eq64 (ported_cos (f64 (4530618209112730150))) (f64 (4607182418799755440)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0225 :
  out_eq64 (ported_sin (f64 (4629856205580262851))) (f64 (4607117405125396372)) &&
  out_eq64 (ported_cos (f64 (4629856205580262851))) (f64 (13816678514551962771)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0226 :
  out_eq64 (ported_sin (f64 (13840274243259460230))) (f64 (4607153981796047600)) &&
  out_eq64 (ported_cos (f64 (13840274243259460230))) (f64 (13813757810413796377)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0227 :
  out_eq64 (ported_sin (f64 (4622204248938561374))) (f64 (13830121139123469365)) &&
  out_eq64 (ported_cos (f64 (4622204248938561374))) (f64 (13822563864544023583)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0228 :
  out_eq64 (ported_sin (f64 (13850640017025460654))) (f64 (4606996199893124238)) &&
  out_eq64 (ported_cos (f64 (13850640017025460654))) (f64 (13819828342669344115)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0229 :
  out_eq64 (ported_sin (f64 (4623275452981086951))) (f64 (4581594554672146064)) &&
  out_eq64 (ported_cos (f64 (4623275452981086951))) (f64 (4607180507586496667)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0230 :
  out_eq64 (ported_sin (f64 (13747301617570979719))) (f64 (13747301617570970240)) &&
  out_eq64 (ported_cos (f64 (13747301617570979719))) (f64 (4607182418799979845)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0231 :
  out_eq64 (ported_sin (f64 (13847101515699646620))) (f64 (13828176372274588570)) &&
  out_eq64 (ported_cos (f64 (13847101515699646620))) (f64 (4604273125836502684)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0232 :
  out_eq64 (ported_sin (f64 (4627357417219793302))) (f64 (13830495941089600223)) &&
  out_eq64 (ported_cos (f64 (4627357417219793302))) (f64 (4592864638188693068)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0233 :
  out_eq64 (ported_sin (f64 (13849259849123250880))) (f64 (4600597866055518647)) &&
  out_eq64 (ported_cos (f64 (13849259849123250880))) (f64 (4606490050693586517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0234 :
  out_eq64 (ported_sin (f64 (13848921659067009743))) (f64 (4607179526029716276)) &&
  out_eq64 (ported_cos (f64 (13848921659067009743))) (f64 (13806333614802561490)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0235 :
  out_eq64 (ported_sin (f64 (13843892959435387263))) (f64 (13830554234321530508)) &&
  out_eq64 (ported_cos (f64 (13843892959435387263))) (f64 (4574732425645745344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0236 :
  out_eq64 (ported_sin (f64 (4621711000855949153))) (f64 (13823778533194606520)) &&
  out_eq64 (ported_cos (f64 (4621711000855949153))) (f64 (13829901297237273279)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0237 :
  out_eq64 (ported_sin (f64 (13846304901977799628))) (f64 (4603171177194537726)) &&
  out_eq64 (ported_cos (f64 (13846304901977799628))) (f64 (4605669887355219301)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0238 :
  out_eq64 (ported_sin (f64 (13846372674803602032))) (f64 (4601791022883930999)) &&
  out_eq64 (ported_cos (f64 (13846372674803602032))) (f64 (4606215646292870879)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0239 :
  out_eq64 (ported_sin (f64 (4613126977891015384))) (f64 (4602334699803321636)) &&
  out_eq64 (ported_cos (f64 (4613126977891015384))) (f64 (13829444559746089597)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0240 :
  out_eq64 (ported_sin (f64 (4626139101385877063))) (f64 (4602278281741418904)) &&
  out_eq64 (ported_cos (f64 (4626139101385877063))) (f64 (4606087929667511890)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0241 :
  out_eq64 (ported_sin (f64 (13844183874564711211))) (f64 (13829987396637256926)) &&
  out_eq64 (ported_cos (f64 (13844183874564711211))) (f64 (13823334498112574138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0242 :
  out_eq64 (ported_sin (f64 (4612774584313159454))) (f64 (4603684670692063361)) &&
  out_eq64 (ported_cos (f64 (4612774584313159454))) (f64 (13828672955416694359)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0243 :
  out_eq64 (ported_sin (f64 (13885098614395647997))) (f64 (13826211879435552680)) &&
  out_eq64 (ported_cos (f64 (13885098614395647997))) (f64 (13829252509825559084)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0244 :
  out_eq64 (ported_sin (f64 (13849612723191776622))) (f64 (13828367485047841688)) &&
  out_eq64 (ported_cos (f64 (13849612723191776622))) (f64 (4604058596093354787)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0245 :
  out_eq64 (ported_sin (f64 (4617613914747370256))) (f64 (13829213656050477369)) &&
  out_eq64 (ported_cos (f64 (4617613914747370256))) (f64 (4602903427960159150)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0246 :
  out_eq64 (ported_sin (f64 (4614201891986626002))) (f64 (4582666394770696470)) &&
  out_eq64 (ported_cos (f64 (4614201891986626002))) (f64 (13830551791999008234)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0247 :
  out_eq64 (ported_sin (f64 (13845521081922609098))) (f64 (4606437684480526216)) &&
  out_eq64 (ported_cos (f64 (13845521081922609098))) (f64 (13824216190943635313)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0248 :
  out_eq64 (ported_sin (f64 (4625474307956476607))) (f64 (13830170805883049638)) &&
  out_eq64 (ported_cos (f64 (4625474307956476607))) (f64 (13822245207591005705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0249 :
  out_eq64 (ported_sin (f64 (4609329258797811149))) (f64 (4607142567931856935)) &&
  out_eq64 (ported_cos (f64 (4609329258797811149))) (f64 (4591435187607248905)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0250 :
  out_eq64 (ported_sin (f64 (4647778220420814379))) (f64 (13828287508200736567)) &&
  out_eq64 (ported_cos (f64 (4647778220420814379))) (f64 (13827522090630219464)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0251 :
  out_eq64 (ported_sin (f64 (4626567964808410242))) (f64 (4606282030939076451)) &&
  out_eq64 (ported_cos (f64 (4626567964808410242))) (f64 (13824894579633074794)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0252 :
  out_eq64 (ported_sin (f64 (4624409377150510446))) (f64 (4606229848283752212)) &&
  out_eq64 (ported_cos (f64 (4624409377150510446))) (f64 (13825106558061901755)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0253 :
  out_eq64 (ported_sin (f64 (4486200698961429447))) (f64 (4486200698961429447)) &&
  out_eq64 (ported_cos (f64 (4486200698961429447))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0254 :
  out_eq64 (ported_sin (f64 (13851107681343812279))) (f64 (4592790698082788103)) &&
  out_eq64 (ported_cos (f64 (13851107681343812279))) (f64 (4607124958083561129)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0255 :
  out_eq64 (ported_sin (f64 (4625837816155690139))) (f64 (13826425035229179926)) &&
  out_eq64 (ported_cos (f64 (4625837816155690139))) (f64 (4605747333656191562)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0256 :
  out_eq64 (ported_sin (f64 (13872538736298681115))) (f64 (4607172521389019171)) &&
  out_eq64 (ported_cos (f64 (13872538736298681115))) (f64 (4586914980826665136)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0257 :
  out_eq64 (ported_sin (f64 (4626932577862656425))) (f64 (13818831116901661102)) &&
  out_eq64 (ported_cos (f64 (4626932577862656425))) (f64 (13830416080947926868)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0258 :
  out_eq64 (ported_sin (f64 (4681588518787442913))) (f64 (13821462734432745999)) &&
  out_eq64 (ported_cos (f64 (4681588518787442913))) (f64 (13830273868158983932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0259 :
  out_eq64 (ported_sin (f64 (13850835113017537313))) (f64 (4606125008083810087)) &&
  out_eq64 (ported_cos (f64 (13850835113017537313))) (f64 (4602140504285331269)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0260 :
  out_eq64 (ported_sin (f64 (13781123044508456400))) (f64 (13781123044316290523)) &&
  out_eq64 (ported_cos (f64 (13781123044508456400))) (f64 (4607182417674069495)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0261 :
  out_eq64 (ported_sin (f64 (4623228776081900445))) (f64 (13812507456695893424)) &&
  out_eq64 (ported_cos (f64 (4623228776081900445))) (f64 (4607164936763616160)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0262 :
  out_eq64 (ported_sin (f64 (13850510849779278762))) (f64 (4605276507086979321)) &&
  out_eq64 (ported_cos (f64 (13850510849779278762))) (f64 (13827088136624769394)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0263 :
  out_eq64 (ported_sin (f64 (4626469945947099325))) (f64 (4607134951197182987)) &&
  out_eq64 (ported_cos (f64 (4626469945947099325))) (f64 (13815424435386582101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0264 :
  out_eq64 (ported_sin (f64 (4627082912430120371))) (f64 (13827415770587615437)) &&
  out_eq64 (ported_cos (f64 (4627082912430120371))) (f64 (13828380277667762135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0265 :
  out_eq64 (ported_sin (f64 (13847075630947379361))) (f64 (13827889079494651123)) &&
  out_eq64 (ported_cos (f64 (13847075630947379361))) (f64 (4604571383884270430)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0266 :
  out_eq64 (ported_sin (f64 (4624684118030371514))) (f64 (4603399185615366417)) &&
  out_eq64 (ported_cos (f64 (4624684118030371514))) (f64 (13828884818455200726)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0267 :
  out_eq64 (ported_sin (f64 (13846936584414525241))) (f64 (13826132798569400837)) &&
  out_eq64 (ported_cos (f64 (13846936584414525241))) (f64 (4605927795983321532)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0268 :
  out_eq64 (ported_sin (f64 (13844211196001531208))) (f64 (13829824862981424228)) &&
  out_eq64 (ported_cos (f64 (13844211196001531208))) (f64 (13824146013479756798)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0269 :
  out_eq64 (ported_sin (f64 (4610262606358847150))) (f64 (4607124828474948354)) &&
  out_eq64 (ported_cos (f64 (4610262606358847150))) (f64 (13816171865246798046)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0270 :
  out_eq64 (ported_sin (f64 (4621228941550865525))) (f64 (4601880504671018405)) &&
  out_eq64 (ported_cos (f64 (4621228941550865525))) (f64 (13829564936313352332)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0271 :
  out_eq64 (ported_sin (f64 (4625631154571461275))) (f64 (13830241647631209177)) &&
  out_eq64 (ported_cos (f64 (4625631154571461275))) (f64 (4598377870881969682)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0272 :
  out_eq64 (ported_sin (f64 (4616973668207172077))) (f64 (13830553300947878306)) &&
  out_eq64 (ported_cos (f64 (4616973668207172077))) (f64 (13803644365801607259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0273 :
  out_eq64 (ported_sin (f64 (4617962170600352094))) (f64 (13827410541807794105)) &&
  out_eq64 (ported_cos (f64 (4617962170600352094))) (f64 (4605012728056566753)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0274 :
  out_eq64 (ported_sin (f64 (13786446767296339322))) (f64 (13786446766040348793)) &&
  out_eq64 (ported_cos (f64 (13786446767296339322))) (f64 (4607182412551960158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0275 :
  out_eq64 (ported_sin (f64 (4624050811729796051))) (f64 (4607048149624406302)) &&
  out_eq64 (ported_cos (f64 (4624050811729796051))) (f64 (4595365762105717860)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0276 :
  out_eq64 (ported_sin (f64 (4627378586944613952))) (f64 (13830393624115824946)) &&
  out_eq64 (ported_cos (f64 (4627378586944613952))) (f64 (4595946122269043319)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0277 :
  out_eq64 (ported_sin (f64 (4559446466759482743))) (f64 (4559446466267909680)) &&
  out_eq64 (ported_cos (f64 (4559446466759482743))) (f64 (4607182416694011923)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0278 :
  out_eq64 (ported_sin (f64 (4607908496237836656))) (f64 (4606437435591673104)) &&
  out_eq64 (ported_cos (f64 (4607908496237836656))) (f64 (4600845300818886048)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0279 :
  out_eq64 (ported_sin (f64 (13838823703861182298))) (f64 (4602734030011230392)) &&
  out_eq64 (ported_cos (f64 (13838823703861182298))) (f64 (13829315582188155808)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0280 :
  out_eq64 (ported_sin (f64 (4613901579439435578))) (f64 (4594825739510234739)) &&
  out_eq64 (ported_cos (f64 (4613901579439435578))) (f64 (13830442706177412950)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0281 :
  out_eq64 (ported_sin (f64 (4496671504505727956))) (f64 (4496671504505727954)) &&
  out_eq64 (ported_cos (f64 (4496671504505727956))) (f64 (4607182418800017399)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0282 :
  out_eq64 (ported_sin (f64 (13850345400096605278))) (f64 (4599345365642587488)) &&
  out_eq64 (ported_cos (f64 (13850345400096605278))) (f64 (13830096045248627272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0283 :
  out_eq64 (ported_sin (f64 (4625985638387088292))) (f64 (13810318244233869164)) &&
  out_eq64 (ported_cos (f64 (4625985638387088292))) (f64 (4607172429609007519)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0284 :
  out_eq64 (ported_sin (f64 (13840870769804421746))) (f64 (4606284398904134814)) &&
  out_eq64 (ported_cos (f64 (13840870769804421746))) (f64 (4601512754667537909)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0285 :
  out_eq64 (ported_sin (f64 (13846405231081174788))) (f64 (4600847986389502888)) &&
  out_eq64 (ported_cos (f64 (13846405231081174788))) (f64 (4606436852524351521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0286 :
  out_eq64 (ported_sin (f64 (13837919236850615911))) (f64 (4593803827528567878)) &&
  out_eq64 (ported_cos (f64 (13837919236850615911))) (f64 (13830479583595013487)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0287 :
  out_eq64 (ported_sin (f64 (13849762203843337025))) (f64 (13830407765160395045)) &&
  out_eq64 (ported_cos (f64 (13849762203843337025))) (f64 (4595643849716942282)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0288 :
  out_eq64 (ported_sin (f64 (4622362374758763034))) (f64 (13830550251192953268)) &&
  out_eq64 (ported_cos (f64 (4622362374758763034))) (f64 (13807834968329392602)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0289 :
  out_eq64 (ported_sin (f64 (4622400910382988964))) (f64 (13830547988327779516)) &&
  out_eq64 (ported_cos (f64 (4622400910382988964))) (f64 (4585621093375897249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0290 :
  out_eq64 (ported_sin (f64 (4626242360136423813))) (f64 (4605030313077194436)) &&
  out_eq64 (ported_cos (f64 (4626242360136423813))) (f64 (4604017935616014615)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0291 :
  out_eq64 (ported_sin (f64 (4536553732785713571))) (f64 (4536553732785314101)) &&
  out_eq64 (ported_cos (f64 (4536553732785713571))) (f64 (4607182418798197887)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0292 :
  out_eq64 (ported_sin (f64 (13849976162336564435))) (f64 (13829084349503046408)) &&
  out_eq64 (ported_cos (f64 (13849976162336564435))) (f64 (13826478976786631758)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0293 :
  out_eq64 (ported_sin (f64 (4555178793685921372))) (f64 (4555178793548715113)) &&
  out_eq64 (ported_cos (f64 (4555178793685921372))) (f64 (4607182418233391095)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0294 :
  out_eq64 (ported_sin (f64 (4627566889117028627))) (f64 (13827435884298875469)) &&
  out_eq64 (ported_cos (f64 (4627566889117028627))) (f64 (4604990914659041938)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0295 :
  out_eq64 (ported_sin (f64 (4609047987990729396))) (f64 (4607072260771092731)) &&
  out_eq64 (ported_cos (f64 (4609047987990729396))) (f64 (4594785558314590601)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0296 :
  out_eq64 (ported_sin (f64 (4602880906099046774))) (f64 (4602660675144021173)) &&
  out_eq64 (ported_cos (f64 (4602880906099046774))) (f64 (4605980913617559111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0297 :
  out_eq64 (ported_sin (f64 (13774761775327621330))) (f64 (13774761775280810219)) &&
  out_eq64 (ported_cos (f64 (13774761775327621330))) (f64 (4607182418625732375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0298 :
  out_eq64 (ported_sin (f64 (13844728763707000073))) (f64 (13821319221620850654)) &&
  out_eq64 (ported_cos (f64 (13844728763707000073))) (f64 (13830282960742523462)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0299 :
  out_eq64 (ported_sin (f64 (4518242704134529600))) (f64 (4518242704134528262)) &&
  out_eq64 (ported_cos (f64 (4518242704134529600))) (f64 (4607182418800010993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0300 :
  out_eq64 (ported_sin (f64 (13850411409813117890))) (f64 (4602920921666858468)) &&
  out_eq64 (ported_cos (f64 (13850411409813117890))) (f64 (13829202839316317862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0301 :
  out_eq64 (ported_sin (f64 (4620829859547359977))) (f64 (4606510357403397832)) &&
  out_eq64 (ported_cos (f64 (4620829859547359977))) (f64 (13823871574552127470)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0302 :
  out_eq64 (ported_sin (f64 (4623877821013952404))) (f64 (4606163831413680480)) &&
  out_eq64 (ported_cos (f64 (4623877821013952404))) (f64 (4601993090660653360)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0303 :
  out_eq64 (ported_sin (f64 (4618763079315825262))) (f64 (4567928199833143757)) &&
  out_eq64 (ported_cos (f64 (4618763079315825262))) (f64 (4607182390484551854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0304 :
  out_eq64 (ported_sin (f64 (13845801536052441394))) (f64 (4607147024052202851)) &&
  out_eq64 (ported_cos (f64 (13845801536052441394))) (f64 (4591046206264583676)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0305 :
  out_eq64 (ported_sin (f64 (13846613415470498900))) (f64 (4585913453183457234)) &&
  out_eq64 (ported_cos (f64 (13846613415470498900))) (f64 (4607175240087247979)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0306 :
  out_eq64 (ported_sin (f64 (13851084028127860952))) (f64 (4596221579322152631)) &&
  out_eq64 (ported_cos (f64 (13851084028127860952))) (f64 (4607008117992350564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0307 :
  out_eq64 (ported_sin (f64 (4625242067122235156))) (f64 (13824924628350458237)) &&
  out_eq64 (ported_cos (f64 (4625242067122235156))) (f64 (13829646775531591848)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0308 :
  out_eq64 (ported_sin (f64 (4626906315419992971))) (f64 (13813953551803391201)) &&
  out_eq64 (ported_cos (f64 (4626906315419992971))) (f64 (13830524036214655772)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0309 :
  out_eq64 (ported_sin (f64 (13837088147325721276))) (f64 (13821105970488551740)) &&
  out_eq64 (ported_cos (f64 (13837088147325721276))) (f64 (13830296182559979657)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0310 :
  out_eq64 (ported_sin (f64 (4555349100110893306))) (f64 (4555349099962692108)) &&
  out_eq64 (ported_cos (f64 (4555349100110893306))) (f64 (4607182418203510790)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0311 :
  out_eq64 (ported_sin (f64 (13843885102350000345))) (f64 (13830553574360452713)) &&
  out_eq64 (ported_cos (f64 (13843885102350000345))) (f64 (4579217421340280460)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0312 :
  out_eq64 (ported_sin (f64 (4615329454192113834))) (f64 (13825305039687305348)) &&
  out_eq64 (ported_cos (f64 (4615329454192113834))) (f64 (13829551444460005458)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0313 :
  out_eq64 (ported_sin (f64 (4679382651898367169))) (f64 (13830495189644595332)) &&
  out_eq64 (ported_cos (f64 (4679382651898367169))) (f64 (13816288988051761438)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0314 :
  out_eq64 (ported_sin (f64 (13844029481962740700))) (f64 (13830495737975395598)) &&
  out_eq64 (ported_cos (f64 (13844029481962740700))) (f64 (13816250848442543652)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0315 :
  out_eq64 (ported_sin (f64 (4621418929864955867))) (f64 (4594040500451188958)) &&
  out_eq64 (ported_cos (f64 (4621418929864955867))) (f64 (13830471707194491008)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0316 :
  out_eq64 (ported_sin (f64 (4615103336841733175))) (f64 (13823658621796429602)) &&
  out_eq64 (ported_cos (f64 (4615103336841733175))) (f64 (13829925215450337368)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0317 :
  out_eq64 (ported_sin (f64 (13846769893837793102))) (f64 (13821035374613187555)) &&
  out_eq64 (ported_cos (f64 (13846769893837793102))) (f64 (4606928446792104091)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0318 :
  out_eq64 (ported_sin (f64 (13840987912632079478))) (f64 (4605833372240343946)) &&
  out_eq64 (ported_cos (f64 (13840987912632079478))) (f64 (4602916773690663412)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0319 :
  out_eq64 (ported_sin (f64 (4623095367915737055))) (f64 (13822355134721403326)) &&
  out_eq64 (ported_cos (f64 (4623095367915737055))) (f64 (4606782001110685621)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0320 :
  out_eq64 (ported_sin (f64 (4616580822798525980))) (f64 (13829961322310219644)) &&
  out_eq64 (ported_cos (f64 (4616580822798525980))) (f64 (13823472695044138881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0321 :
  out_eq64 (ported_sin (f64 (13848773289870544271))) (f64 (4605842482157956915)) &&
  out_eq64 (ported_cos (f64 (13848773289870544271))) (f64 (13826274065306999753)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0322 :
  out_eq64 (ported_sin (f64 (4617306307223962137))) (f64 (13830205091060741379)) &&
  out_eq64 (ported_cos (f64 (4617306307223962137))) (f64 (4598640135753757178)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0323 :
  out_eq64 (ported_sin (f64 (13843821661867533457))) (f64 (13830532185231149354)) &&
  out_eq64 (ported_cos (f64 (13843821661867533457))) (f64 (4589728441609259004)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0324 :
  out_eq64 (ported_sin (f64 (4563756843278085440))) (f64 (4563756841487026429)) &&
  out_eq64 (ported_cos (f64 (4563756843278085440))) (f64 (4607182410884231995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0325 :
  out_eq64 (ported_sin (f64 (4616434462170158395))) (f64 (13829473636260189224)) &&
  out_eq64 (ported_cos (f64 (4616434462170158395))) (f64 (13825599857033877403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0326 :
  out_eq64 (ported_sin (f64 (4622769564297690679))) (f64 (13828478182478067620)) &&
  out_eq64 (ported_cos (f64 (4622769564297690679))) (f64 (4603927775682828904)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0327 :
  out_eq64 (ported_sin (f64 (4603044960666839398))) (f64 (4602811164506233456)) &&
  out_eq64 (ported_cos (f64 (4603044960666839398))) (f64 (4605897761402306633)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0328 :
  out_eq64 (ported_sin (f64 (4568309097946094012))) (f64 (4568309090609457424)) &&
  out_eq64 (ported_cos (f64 (4568309097946094012))) (f64 (4607182386630937892)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0329 :
  out_eq64 (ported_sin (f64 (4605864091687342833))) (f64 (4604963723344604056)) &&
  out_eq64 (ported_cos (f64 (4605864091687342833))) (f64 (4604095173479313477)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0330 :
  out_eq64 (ported_sin (f64 (4616503255522781029))) (f64 (13829720077671972954)) &&
  out_eq64 (ported_cos (f64 (4616503255522781029))) (f64 (13824615877285014080)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0331 :
  out_eq64 (ported_sin (f64 (13845207335678209751))) (f64 (4603290507500321445)) &&
  out_eq64 (ported_cos (f64 (13845207335678209751))) (f64 (13828960991460841618)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0332 :
  out_eq64 (ported_sin (f64 (13831691087538350288))) (f64 (13830101693744991064)) &&
  out_eq64 (ported_cos (f64 (13831691087538350288))) (f64 (4599311208600114013)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0333 :
  out_eq64 (ported_sin (f64 (13848657538596739352))) (f64 (4603313772044844235)) &&
  out_eq64 (ported_cos (f64 (13848657538596739352))) (f64 (13828944885521858210)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0334 :
  out_eq64 (ported_sin (f64 (13826753944178883860))) (f64 (13826468780018468944)) &&
  out_eq64 (ported_cos (f64 (13826753944178883860))) (f64 (4605718974822853564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0335 :
  out_eq64 (ported_sin (f64 (4605719998938419046))) (f64 (4604868154229746459)) &&
  out_eq64 (ported_cos (f64 (4605719998938419046))) (f64 (4604203010494208253)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0336 :
  out_eq64 (ported_sin (f64 (4623193993905261174))) (f64 (13816955845534165918)) &&
  out_eq64 (ported_cos (f64 (4623193993905261174))) (f64 (4607113149059388282)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0337 :
  out_eq64 (ported_sin (f64 (4624375421831300978))) (f64 (4606458217543667395)) &&
  out_eq64 (ported_cos (f64 (4624375421831300978))) (f64 (13824120826425376998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0338 :
  out_eq64 (ported_sin (f64 (4621304554285692589))) (f64 (4599659246995727796)) &&
  out_eq64 (ported_cos (f64 (4621304554285692589))) (f64 (13830042356099810918)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0339 :
  out_eq64 (ported_sin (f64 (13832732159450132330))) (f64 (13830520194290442671)) &&
  out_eq64 (ported_cos (f64 (13832732159450132330))) (f64 (4590943396527693736)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0340 :
  out_eq64 (ported_sin (f64 (13849704533283444763))) (f64 (13829893051200613380)) &&
  out_eq64 (ported_cos (f64 (13849704533283444763))) (f64 (4600447266768659893)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0341 :
  out_eq64 (ported_sin (f64 (13804743811413856623))) (f64 (13804743437038247692)) &&
  out_eq64 (ported_cos (f64 (13804743811413856623))) (f64 (4607180648566317654)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0342 :
  out_eq64 (ported_sin (f64 (13849602362658142704))) (f64 (13828146358961453404)) &&
  out_eq64 (ported_cos (f64 (13849602362658142704))) (f64 (4604305593416315202)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0343 :
  out_eq64 (ported_sin (f64 (4625938216649538490))) (f64 (13820246993978189397)) &&
  out_eq64 (ported_cos (f64 (4625938216649538490))) (f64 (4606973931593382281)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0344 :
  out_eq64 (ported_sin (f64 (13849040022588817088))) (f64 (4606488254871287922)) &&
  out_eq64 (ported_cos (f64 (13849040022588817088))) (f64 (4600606483170513416)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0345 :
  out_eq64 (ported_sin (f64 (13829273323106215076))) (f64 (13828360148263211358)) &&
  out_eq64 (ported_cos (f64 (13829273323106215076))) (f64 (4604067090459978023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0346 :
  out_eq64 (ported_sin (f64 (4627270029048211277))) (f64 (13830381265936897800)) &&
  out_eq64 (ported_cos (f64 (4627270029048211277))) (f64 (13819571317535913294)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0347 :
  out_eq64 (ported_sin (f64 (13813548126204943334))) (f64 (13813542753271021109)) &&
  out_eq64 (ported_cos (f64 (13813548126204943334))) (f64 (4607156082502850458)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0348 :
  out_eq64 (ported_sin (f64 (4625805171551786879))) (f64 (13827268490511438144)) &&
  out_eq64 (ported_cos (f64 (4625805171551786879))) (f64 (4605132023312619638)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0349 :
  out_eq64 (ported_sin (f64 (4535315440183525558))) (f64 (4535315440183327652)) &&
  out_eq64 (ported_cos (f64 (4535315440183525558))) (f64 (4607182418798878191)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0350 :
  out_eq64 (ported_sin (f64 (4625097765097679695))) (f64 (13816382464533908561)) &&
  out_eq64 (ported_cos (f64 (4625097765097679695))) (f64 (13830493834853419400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0351 :
  out_eq64 (ported_sin (f64 (4602748297845614766))) (f64 (4602429871019940905)) &&
  out_eq64 (ported_cos (f64 (4602748297845614766))) (f64 (4606046235859770525)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0352 :
  out_eq64 (ported_sin (f64 (4594850453738576231))) (f64 (4594826924269742100)) &&
  out_eq64 (ported_cos (f64 (4594850453738576231))) (f64 (4607070622221616544)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0353 :
  out_eq64 (ported_sin (f64 (13845948981185096240))) (f64 (4606634493144030465)) &&
  out_eq64 (ported_cos (f64 (13845948981185096240))) (f64 (4599858809456308440)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0354 :
  out_eq64 (ported_sin (f64 (13855097046243887553))) (f64 (13827609353658598292)) &&
  out_eq64 (ported_cos (f64 (13855097046243887553))) (f64 (13828209134156551132)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0355 :
  out_eq64 (ported_sin (f64 (4490997800724264432))) (f64 (4490997800724264432)) &&
  out_eq64 (ported_cos (f64 (4490997800724264432))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0356 :
  out_eq64 (ported_sin (f64 (4615600812693356309))) (f64 (13826610222000824393)) &&
  out_eq64 (ported_cos (f64 (4615600812693356309))) (f64 (13828996821336342422)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0357 :
  out_eq64 (ported_sin (f64 (13817885424180208277))) (f64 (13817865835560860944)) &&
  out_eq64 (ported_cos (f64 (13817885424180208277))) (f64 (4607083468176819304)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0358 :
  out_eq64 (ported_sin (f64 (4625880457807372155))) (f64 (13824401994091112277)) &&
  out_eq64 (ported_cos (f64 (4625880457807372155))) (f64 (4606396737433820767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0359 :
  out_eq64 (ported_sin (f64 (13852317076853301649))) (f64 (4605952297819925914)) &&
  out_eq64 (ported_cos (f64 (13852317076853301649))) (f64 (13826091119505888652)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0360 :
  out_eq64 (ported_sin (f64 (4612589246970628921))) (f64 (4604251847871899804)) &&
  out_eq64 (ported_cos (f64 (4612589246970628921))) (f64 (13828195882317840419)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0361 :
  out_eq64 (ported_sin (f64 (13846173562087197785))) (f64 (4604768558089179436)) &&
  out_eq64 (ported_cos (f64 (13846173562087197785))) (f64 (4604311792307013173)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0362 :
  out_eq64 (ported_sin (f64 (13730957388278390790))) (f64 (13730957388278390719)) &&
  out_eq64 (ported_cos (f64 (13730957388278390790))) (f64 (4607182418800017181)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0363 :
  out_eq64 (ported_sin (f64 (13840074382673128647))) (f64 (4606886605067812462)) &&
  out_eq64 (ported_cos (f64 (13840074382673128647))) (f64 (13821622477883996763)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0364 :
  out_eq64 (ported_sin (f64 (13844033209896073744))) (f64 (13830492289126872318)) &&
  out_eq64 (ported_cos (f64 (13844033209896073744))) (f64 (13816487835368110854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0365 :
  out_eq64 (ported_sin (f64 (13803030477469684871))) (f64 (13803030168938025194)) &&
  out_eq64 (ported_cos (f64 (13803030477469684871))) (f64 (4607181438537171293)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0366 :
  out_eq64 (ported_sin (f64 (4612780102789334591))) (f64 (4603667191244807204)) &&
  out_eq64 (ported_cos (f64 (4612780102789334591))) (f64 (13828686435993406042)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0367 :
  out_eq64 (ported_sin (f64 (4627719314812386397))) (f64 (13818672059649520090)) &&
  out_eq64 (ported_cos (f64 (4627719314812386397))) (f64 (4607051003876541468)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0368 :
  out_eq64 (ported_sin (f64 (4626224160277245377))) (f64 (4604638467932727512)) &&
  out_eq64 (ported_cos (f64 (4626224160277245377))) (f64 (4604448660283556924)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0369 :
  out_eq64 (ported_sin (f64 (13886528601273740283))) (f64 (13826619989239430080)) &&
  out_eq64 (ported_cos (f64 (13886528601273740283))) (f64 (13828990173835769495)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0370 :
  out_eq64 (ported_sin (f64 (4614555203172159902))) (f64 (13817302821239441301)) &&
  out_eq64 (ported_cos (f64 (4614555203172159902))) (f64 (13830475408129334482)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0371 :
  out_eq64 (ported_sin (f64 (13848974188740642783))) (f64 (4607065531047816937)) &&
  out_eq64 (ported_cos (f64 (13848974188740642783))) (f64 (4594953519131468509)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0372 :
  out_eq64 (ported_sin (f64 (4623369045040500534))) (f64 (4595861025118424079)) &&
  out_eq64 (ported_cos (f64 (4623369045040500534))) (f64 (4607025635852601901)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0373 :
  out_eq64 (ported_sin (f64 (4669247035778601953))) (f64 (4606910239760592633)) &&
  out_eq64 (ported_cos (f64 (4669247035778601953))) (f64 (4597958069439543609)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0374 :
  out_eq64 (ported_sin (f64 (4623981121323367328))) (f64 (4606788923797403389)) &&
  out_eq64 (ported_cos (f64 (4623981121323367328))) (f64 (4598938018106989760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0375 :
  out_eq64 (ported_sin (f64 (4621143446942339329))) (f64 (4603445381297663088)) &&
  out_eq64 (ported_cos (f64 (4621143446942339329))) (f64 (13828851709392459480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0376 :
  out_eq64 (ported_sin (f64 (13849486119746111362))) (f64 (13824211575319798123)) &&
  out_eq64 (ported_cos (f64 (13849486119746111362))) (f64 (4606438685787724731)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0377 :
  out_eq64 (ported_sin (f64 (4585973267988962386))) (f64 (4585971692298419893)) &&
  out_eq64 (ported_cos (f64 (4585973267988962386))) (f64 (4607175093938781102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0378 :
  out_eq64 (ported_sin (f64 (13850137131643133365))) (f64 (13824381117854167805)) &&
  out_eq64 (ported_cos (f64 (13850137131643133365))) (f64 (13829773437448024969)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0379 :
  out_eq64 (ported_sin (f64 (13848069359253813387))) (f64 (13826597693847696780)) &&
  out_eq64 (ported_cos (f64 (13848069359253813387))) (f64 (13829005320492163274)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0380 :
  out_eq64 (ported_sin (f64 (13830786211741878320))) (f64 (13829366846059162011)) &&
  out_eq64 (ported_cos (f64 (13830786211741878320))) (f64 (4602612236446479321)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0381 :
  out_eq64 (ported_sin (f64 (4623807902050112215))) (f64 (4605586854791593702)) &&
  out_eq64 (ported_cos (f64 (4623807902050112215))) (f64 (4603293549486786047)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0382 :
  out_eq64 (ported_sin (f64 (13821844528300900052))) (f64 (13821787900839829527)) &&
  out_eq64 (ported_cos (f64 (13821844528300900052))) (f64 (4606864447098542581)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0383 :
  out_eq64 (ported_sin (f64 (4626238865010645203))) (f64 (4604957236403353679)) &&
  out_eq64 (ported_cos (f64 (4626238865010645203))) (f64 (4604102603939034128)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0384 :
  out_eq64 (ported_sin (f64 (13836495079361223929))) (f64 (13825734327045255969)) &&
  out_eq64 (ported_cos (f64 (13836495079361223929))) (f64 (13829436977622500789)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0385 :
  out_eq64 (ported_sin (f64 (4612422990488591704))) (f64 (4604725732923704313)) &&
  out_eq64 (ported_cos (f64 (4612422990488591704))) (f64 (13827729522399962275)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0386 :
  out_eq64 (ported_sin (f64 (13841693794810286998))) (f64 (4600511564884155349)) &&
  out_eq64 (ported_cos (f64 (13841693794810286998))) (f64 (4606507891783476864)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0387 :
  out_eq64 (ported_sin (f64 (4617436404338801546))) (f64 (13829860940756606770)) &&
  out_eq64 (ported_cos (f64 (4617436404338801546))) (f64 (4600603370298347186)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0388 :
  out_eq64 (ported_sin (f64 (13849252282434440510))) (f64 (4601042352934062571)) &&
  out_eq64 (ported_cos (f64 (13849252282434440510))) (f64 (4606393961061819034)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0389 :
  out_eq64 (ported_sin (f64 (4619005794953378232))) (f64 (4596963127445083711)) &&
  out_eq64 (ported_cos (f64 (4619005794953378232))) (f64 (4606969075778049162)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0390 :
  out_eq64 (ported_sin (f64 (4621230465591501510))) (f64 (4601837063074344236)) &&
  out_eq64 (ported_cos (f64 (4621230465591501510))) (f64 (13829576018629023160)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0391 :
  out_eq64 (ported_sin (f64 (4640623375773524700))) (f64 (4597619717754126264)) &&
  out_eq64 (ported_cos (f64 (4640623375773524700))) (f64 (4606931085524070429)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0392 :
  out_eq64 (ported_sin (f64 (4626752814488320943))) (f64 (4601719661290719046)) &&
  out_eq64 (ported_cos (f64 (4626752814488320943))) (f64 (13829605599649751801)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0393 :
  out_eq64 (ported_sin (f64 (13830641682959646800))) (f64 (13829219383984047812)) &&
  out_eq64 (ported_cos (f64 (13830641682959646800))) (f64 (4602894127973027553)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0394 :
  out_eq64 (ported_sin (f64 (13745247446238855116))) (f64 (13745247446238851882)) &&
  out_eq64 (ported_cos (f64 (13745247446238855116))) (f64 (4607182418799999067)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0395 :
  out_eq64 (ported_sin (f64 (4616620721295776791))) (f64 (13830069928779702221)) &&
  out_eq64 (ported_cos (f64 (4616620721295776791))) (f64 (13822872445299899964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0396 :
  out_eq64 (ported_sin (f64 (13848970550597015010))) (f64 (4607083482718797430)) &&
  out_eq64 (ported_cos (f64 (13848970550597015010))) (f64 (4594493409509581846)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0397 :
  out_eq64 (ported_sin (f64 (4634903099532050643))) (f64 (13830502809197673879)) &&
  out_eq64 (ported_cos (f64 (4634903099532050643))) (f64 (4592369847337368492)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0398 :
  out_eq64 (ported_sin (f64 (4623053454162850003))) (f64 (13823620850910263978)) &&
  out_eq64 (ported_cos (f64 (4623053454162850003))) (f64 (4606560609681325251)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0399 :
  out_eq64 (ported_sin (f64 (13829332103477820127))) (f64 (13828398452867895135)) &&
  out_eq64 (ported_cos (f64 (13829332103477820127))) (f64 (4604022504844765701)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0400 :
  out_eq64 (ported_sin (f64 (4626878582938471319))) (f64 (4580360016047180944)) &&
  out_eq64 (ported_cos (f64 (4626878582938471319))) (f64 (13830553256649188588)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0401 :
  out_eq64 (ported_sin (f64 (13858837250811746998))) (f64 (13821149122063422330)) &&
  out_eq64 (ported_cos (f64 (13858837250811746998))) (f64 (4606921498096285467)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0402 :
  out_eq64 (ported_sin (f64 (4600313238780723319))) (f64 (4600163794618437292)) &&
  out_eq64 (ported_cos (f64 (4600313238780723319))) (f64 (4606577157139013457)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0403 :
  out_eq64 (ported_sin (f64 (13822516011006583805))) (f64 (13822432233435672003)) &&
  out_eq64 (ported_cos (f64 (13822516011006583805))) (f64 (4606770011503280742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0404 :
  out_eq64 (ported_sin (f64 (13847551063355557801))) (f64 (13830540898315861226)) &&
  out_eq64 (ported_cos (f64 (13847551063355557801))) (f64 (13811436979425021534)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0405 :
  out_eq64 (ported_sin (f64 (4613118842015230877))) (f64 (4602391709911722354)) &&
  out_eq64 (ported_cos (f64 (4613118842015230877))) (f64 (13829428858143323848)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0406 :
  out_eq64 (ported_sin (f64 (4625307202944844769))) (f64 (13827240323092020659)) &&
  out_eq64 (ported_cos (f64 (4625307202944844769))) (f64 (13828527129612038690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0407 :
  out_eq64 (ported_sin (f64 (4627146506611162275))) (f64 (13828797323958107420)) &&
  out_eq64 (ported_cos (f64 (4627146506611162275))) (f64 (13826891988275295570)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0408 :
  out_eq64 (ported_sin (f64 (4625855157103775570))) (f64 (13825848300001243281)) &&
  out_eq64 (ported_cos (f64 (4625855157103775570))) (f64 (4606033285644453934)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0409 :
  out_eq64 (ported_sin (f64 (13921954463578888868))) (f64 (13829874029569522243)) &&
  out_eq64 (ported_cos (f64 (13921954463578888868))) (f64 (4600540240448638679)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0410 :
  out_eq64 (ported_sin (f64 (13845246656866073813))) (f64 (4603795451335073582)) &&
  out_eq64 (ported_cos (f64 (13845246656866073813))) (f64 (13828585909186172593)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0411 :
  out_eq64 (ported_sin (f64 (4623804408355059926))) (f64 (4605554947659288121)) &&
  out_eq64 (ported_cos (f64 (4623804408355059926))) (f64 (4603339447597741946)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0412 :
  out_eq64 (ported_sin (f64 (4681251662345408645))) (f64 (4604455727712227533)) &&
  out_eq64 (ported_cos (f64 (4681251662345408645))) (f64 (13828003637397133096)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0413 :
  out_eq64 (ported_sin (f64 (4621173557370052608))) (f64 (4603047338510745939)) &&
  out_eq64 (ported_cos (f64 (4621173557370052608))) (f64 (13829123013471191640)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0414 :
  out_eq64 (ported_sin (f64 (13844615219434640484))) (f64 (13824844309418514802)) &&
  out_eq64 (ported_cos (f64 (13844615219434640484))) (f64 (13829666190627484483)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0415 :
  out_eq64 (ported_sin (f64 (13920678899828800508))) (f64 (4606882842870836735)) &&
  out_eq64 (ported_cos (f64 (13920678899828800508))) (f64 (13821651013687340946)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0416 :
  out_eq64 (ported_sin (f64 (13738065580433952348))) (f64 (13738065580433951813)) &&
  out_eq64 (ported_cos (f64 (13738065580433952348))) (f64 (4607182418800015215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0417 :
  out_eq64 (ported_sin (f64 (4609582470367660758))) (f64 (4607175958124820738)) &&
  out_eq64 (ported_cos (f64 (4609582470367660758))) (f64 (4585618285644121384)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0418 :
  out_eq64 (ported_sin (f64 (13849768135837237037))) (f64 (13830439914047325678)) &&
  out_eq64 (ported_cos (f64 (13849768135837237037))) (f64 (4594895537564881284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0419 :
  out_eq64 (ported_sin (f64 (13847421613523222370))) (f64 (13830416765806714892)) &&
  out_eq64 (ported_cos (f64 (13847421613523222370))) (f64 (4595443612756244628)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0420 :
  out_eq64 (ported_sin (f64 (4627743089011311763))) (f64 (13814266473841904100)) &&
  out_eq64 (ported_cos (f64 (4627743089011311763))) (f64 (4607148690650374537)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0421 :
  out_eq64 (ported_sin (f64 (13850470164524703445))) (f64 (4604404343746009777)) &&
  out_eq64 (ported_cos (f64 (13850470164524703445))) (f64 (13828053226743240445)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0422 :
  out_eq64 (ported_sin (f64 (4625980815869022517))) (f64 (13812661787888242485)) &&
  out_eq64 (ported_cos (f64 (4625980815869022517))) (f64 (4607163843586165190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0423 :
  out_eq64 (ported_sin (f64 (4624559192270975041))) (f64 (4604886051773720075)) &&
  out_eq64 (ported_cos (f64 (4624559192270975041))) (f64 (13827555115354479217)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0424 :
  out_eq64 (ported_sin (f64 (4627726877879316073))) (f64 (13817716012617948182)) &&
  out_eq64 (ported_cos (f64 (4627726877879316073))) (f64 (4607088985933492267)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0425 :
  out_eq64 (ported_sin (f64 (13899153993325066414))) (f64 (4601022811642128304)) &&
  out_eq64 (ported_cos (f64 (13899153993325066414))) (f64 (4606398335346056420)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0426 :
  out_eq64 (ported_sin (f64 (13849996303977807727))) (f64 (13828712460581624193)) &&
  out_eq64 (ported_cos (f64 (13849996303977807727))) (f64 (13827005231065712578)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0427 :
  out_eq64 (ported_sin (f64 (4622207972919184221))) (f64 (13830139209809462742)) &&
  out_eq64 (ported_cos (f64 (4622207972919184221))) (f64 (13822450310090631997)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0428 :
  out_eq64 (ported_sin (f64 (4625253948476895624))) (f64 (13825601183738011604)) &&
  out_eq64 (ported_cos (f64 (4625253948476895624))) (f64 (13829473278193740385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0429 :
  out_eq64 (ported_sin (f64 (4679378856164614298))) (f64 (13823593248797567220)) &&
  out_eq64 (ported_cos (f64 (4679378856164614298))) (f64 (4606566009108332790)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0430 :
  out_eq64 (ported_sin (f64 (13851009857078611616))) (f64 (4601678064331772091)) &&
  out_eq64 (ported_cos (f64 (13851009857078611616))) (f64 (4606243915250068144)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0431 :
  out_eq64 (ported_sin (f64 (13733460458325939878))) (f64 (13733460458325939750)) &&
  out_eq64 (ported_cos (f64 (13733460458325939878))) (f64 (4607182418800016877)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0432 :
  out_eq64 (ported_sin (f64 (13840005909106099707))) (f64 (4606731351052405858)) &&
  out_eq64 (ported_cos (f64 (13840005909106099707))) (f64 (13822672955857759211)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0433 :
  out_eq64 (ported_sin (f64 (4619900585611280141))) (f64 (4605816262670302584)) &&
  out_eq64 (ported_cos (f64 (4619900585611280141))) (f64 (4602944296853949135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0434 :
  out_eq64 (ported_sin (f64 (13847983227565960007))) (f64 (13827675337347807942)) &&
  out_eq64 (ported_cos (f64 (13847983227565960007))) (f64 (13828148488278448866)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0435 :
  out_eq64 (ported_sin (f64 (4625316862243028962))) (f64 (13827476450587441839)) &&
  out_eq64 (ported_cos (f64 (4625316862243028962))) (f64 (13828327691098715126)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0436 :
  out_eq64 (ported_sin (f64 (4610383182197004284))) (f64 (4607094397979985012)) &&
  out_eq64 (ported_cos (f64 (4610383182197004284))) (f64 (13817564627916130643)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0437 :
  out_eq64 (ported_sin (f64 (4668248782986834862))) (f64 (4606970875236710513)) &&
  out_eq64 (ported_cos (f64 (4668248782986834862))) (f64 (4596930575923675483)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0438 :
  out_eq64 (ported_sin (f64 (13844640722224071576))) (f64 (13824100949026431588)) &&
  out_eq64 (ported_cos (f64 (13844640722224071576))) (f64 (13829834493269232279)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0439 :
  out_eq64 (ported_sin (f64 (4626776729139133025))) (f64 (4600322973641464904)) &&
  out_eq64 (ported_cos (f64 (4626776729139133025))) (f64 (13829918009760749885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0440 :
  out_eq64 (ported_sin (f64 (13849138826744680020))) (f64 (4604789032474123088)) &&
  out_eq64 (ported_cos (f64 (13849138826744680020))) (f64 (4604289720093712673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0441 :
  out_eq64 (ported_sin (f64 (4559675669797516428))) (f64 (4559675669250381522)) &&
  out_eq64 (ported_cos (f64 (4559675669797516428))) (f64 (4607182416538167785)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0442 :
  out_eq64 (ported_sin (f64 (13850220954412645758))) (f64 (13816784909658783593)) &&
  out_eq64 (ported_cos (f64 (13850220954412645758))) (f64 (13830487825316928237)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0443 :
  out_eq64 (ported_sin (f64 (4623577534758070112))) (f64 (4602938376797353252)) &&
  out_eq64 (ported_cos (f64 (4623577534758070112))) (f64 (4605819954426656838)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0444 :
  out_eq64 (ported_sin (f64 (13840865843056665465))) (f64 (4606301476953041899)) &&
  out_eq64 (ported_cos (f64 (13840865843056665465))) (f64 (4601441711026083043)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0445 :
  out_eq64 (ported_sin (f64 (13847865096912524347))) (f64 (13828915983822483746)) &&
  out_eq64 (ported_cos (f64 (13847865096912524347))) (f64 (13826727169004383728)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0446 :
  out_eq64 (ported_sin (f64 (4607667601202652541))) (f64 (4606233852189222640)) &&
  out_eq64 (ported_cos (f64 (4607667601202652541))) (f64 (4601718502127689030)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0447 :
  out_eq64 (ported_sin (f64 (4681381084101771639))) (f64 (4604307206191458883)) &&
  out_eq64 (ported_cos (f64 (4681381084101771639))) (f64 (4604772823518359870)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0448 :
  out_eq64 (ported_sin (f64 (13843266063056650065))) (f64 (13829160385717802447)) &&
  out_eq64 (ported_cos (f64 (13843266063056650065))) (f64 (4602988731818639672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0449 :
  out_eq64 (ported_sin (f64 (13838901280426220250))) (f64 (4602998897930067429)) &&
  out_eq64 (ported_cos (f64 (13838901280426220250))) (f64 (13829153948536237745)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0450 :
  out_eq64 (ported_sin (f64 (4627526805033120762))) (f64 (13828343602214309061)) &&
  out_eq64 (ported_cos (f64 (4627526805033120762))) (f64 (4604086168875768114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0451 :
  out_eq64 (ported_sin (f64 (13837958851918709232))) (f64 (4594431650036930974)) &&
  out_eq64 (ported_cos (f64 (13837958851918709232))) (f64 (13830457813399079301)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0452 :
  out_eq64 (ported_sin (f64 (4626751444121944915))) (f64 (4601798030002055497)) &&
  out_eq64 (ported_cos (f64 (4626751444121944915))) (f64 (13829585913203316355)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0453 :
  out_eq64 (ported_sin (f64 (4625872480458561860))) (f64 (13824864992664149143)) &&
  out_eq64 (ported_cos (f64 (4625872480458561860))) (f64 (4606289177558035515)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0454 :
  out_eq64 (ported_sin (f64 (4615035535706925861))) (f64 (13823151183152407588)) &&
  out_eq64 (ported_cos (f64 (4615035535706925861))) (f64 (13830020990452690698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0455 :
  out_eq64 (ported_sin (f64 (13894095607818548666))) (f64 (4607176530094446136)) &&
  out_eq64 (ported_cos (f64 (13894095607818548666))) (f64 (13808743230609985389)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0456 :
  out_eq64 (ported_sin (f64 (4624240075137976013))) (f64 (4607062562737759009)) &&
  out_eq64 (ported_cos (f64 (4624240075137976013))) (f64 (13818398069632344690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0457 :
  out_eq64 (ported_sin (f64 (4609358955863760116))) (f64 (4607147953800554489)) &&
  out_eq64 (ported_cos (f64 (4609358955863760116))) (f64 (4590961993014558110)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0458 :
  out_eq64 (ported_sin (f64 (4616169718469910093))) (f64 (13828311632826767473)) &&
  out_eq64 (ported_cos (f64 (4616169718469910093))) (f64 (13827494764279181576)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0459 :
  out_eq64 (ported_sin (f64 (4612898409100933850))) (f64 (4603284703586429266)) &&
  out_eq64 (ported_cos (f64 (4612898409100933850))) (f64 (13828964992661730111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0460 :
  out_eq64 (ported_sin (f64 (4549882539802456344))) (f64 (4549882539779171694)) &&
  out_eq64 (ported_cos (f64 (4549882539802456344))) (f64 (4607182418690603146)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0461 :
  out_eq64 (ported_sin (f64 (4658662938603553442))) (f64 (4601925398351373987)) &&
  out_eq64 (ported_cos (f64 (4658662938603553442))) (f64 (13829553405524781980)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0462 :
  out_eq64 (ported_sin (f64 (4508052942222630224))) (f64 (4508052942222630140)) &&
  out_eq64 (ported_cos (f64 (4508052942222630224))) (f64 (4607182418800017155)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0463 :
  out_eq64 (ported_sin (f64 (4626079974354767330))) (f64 (4598789175019846591)) &&
  out_eq64 (ported_cos (f64 (4626079974354767330))) (f64 (4606811323751413402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0464 :
  out_eq64 (ported_sin (f64 (4621128312240817224))) (f64 (4603639830684372855)) &&
  out_eq64 (ported_cos (f64 (4621128312240817224))) (f64 (13828707400498676902)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0465 :
  out_eq64 (ported_sin (f64 (4614954994563616107))) (f64 (13822541238331204467)) &&
  out_eq64 (ported_cos (f64 (4614954994563616107))) (f64 (13830124772804376634)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0466 :
  out_eq64 (ported_sin (f64 (4608818414392933220))) (f64 (4606989145437463239)) &&
  out_eq64 (ported_cos (f64 (4608818414392933220))) (f64 (4596591603017650837)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0467 :
  out_eq64 (ported_sin (f64 (13848703324586542048))) (f64 (4604443971529467423)) &&
  out_eq64 (ported_cos (f64 (13848703324586542048))) (f64 (13828015052545209243)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0468 :
  out_eq64 (ported_sin (f64 (4522299396209617679))) (f64 (4522299396209613502)) &&
  out_eq64 (ported_cos (f64 (4522299396209617679))) (f64 (4607182418799995658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0469 :
  out_eq64 (ported_sin (f64 (4601926694073863169))) (f64 (4601640796081853836)) &&
  out_eq64 (ported_cos (f64 (4601926694073863169))) (f64 (4606253133646800260)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0470 :
  out_eq64 (ported_sin (f64 (13732614704083321814))) (f64 (13732614704083321730)) &&
  out_eq64 (ported_cos (f64 (13732614704083321814))) (f64 (4607182418800017006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0471 :
  out_eq64 (ported_sin (f64 (4613364761899376763))) (f64 (4600621674496427096)) &&
  out_eq64 (ported_cos (f64 (4613364761899376763))) (f64 (13829857119440650480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0472 :
  out_eq64 (ported_sin (f64 (4625819315871757408))) (f64 (13826911831302287842)) &&
  out_eq64 (ported_cos (f64 (4625819315871757408))) (f64 (4605410616875963266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0473 :
  out_eq64 (ported_sin (f64 (4605639092652103446))) (f64 (4604813740912162437)) &&
  out_eq64 (ported_cos (f64 (4605639092652103446))) (f64 (4604262885146802540)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0474 :
  out_eq64 (ported_sin (f64 (4621778937117283942))) (f64 (13825740976010547136)) &&
  out_eq64 (ported_cos (f64 (4621778937117283942))) (f64 (13829435145720603746)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0475 :
  out_eq64 (ported_sin (f64 (4617492562221471131))) (f64 (13829677801342647531)) &&
  out_eq64 (ported_cos (f64 (4617492562221471131))) (f64 (4601423749264361528)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0476 :
  out_eq64 (ported_sin (f64 (4626322423193192236))) (f64 (4606394455303309898)) &&
  out_eq64 (ported_cos (f64 (4626322423193192236))) (f64 (4601040148120598896)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0477 :
  out_eq64 (ported_sin (f64 (13850377764644386194))) (f64 (4601269485278858796)) &&
  out_eq64 (ported_cos (f64 (13850377764644386194))) (f64 (13829714125378051981)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0478 :
  out_eq64 (ported_sin (f64 (13846624624742975906))) (f64 (4581426010511301902)) &&
  out_eq64 (ported_cos (f64 (13846624624742975906))) (f64 (4607180614565027714)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0479 :
  out_eq64 (ported_sin (f64 (13899148412745891352))) (f64 (13819121226001814268)) &&
  out_eq64 (ported_cos (f64 (13899148412745891352))) (f64 (13830402912894335629)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0480 :
  out_eq64 (ported_sin (f64 (4622927057704070075))) (f64 (13826620262199013072)) &&
  out_eq64 (ported_cos (f64 (4622927057704070075))) (f64 (4605617950937602508)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0481 :
  out_eq64 (ported_sin (f64 (4616696516811344521))) (f64 (13830246672496219361)) &&
  out_eq64 (ported_cos (f64 (4616696516811344521))) (f64 (13821712617256710182)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0482 :
  out_eq64 (ported_sin (f64 (13849275509440327360))) (f64 (4599662407957046535)) &&
  out_eq64 (ported_cos (f64 (13849275509440327360))) (f64 (4606669762092237324)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0483 :
  out_eq64 (ported_sin (f64 (13848720378664379279))) (f64 (4604824101726538229)) &&
  out_eq64 (ported_cos (f64 (13848720378664379279))) (f64 (13827623604329055783)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0484 :
  out_eq64 (ported_sin (f64 (13850771087221408196))) (f64 (4606875134647215858)) &&
  out_eq64 (ported_cos (f64 (13850771087221408196))) (f64 (4598336859733243479)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0485 :
  out_eq64 (ported_sin (f64 (4624226900171246973))) (f64 (4607094400241640183)) &&
  out_eq64 (ported_cos (f64 (4624226900171246973))) (f64 (13817564563680633677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0486 :
  out_eq64 (ported_sin (f64 (13850145004141833464))) (f64 (13823918156430314678)) &&
  out_eq64 (ported_cos (f64 (13850145004141833464))) (f64 (13829872816563122802)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0487 :
  out_eq64 (ported_sin (f64 (13842981386302376548))) (f64 (13827714185844709994)) &&
  out_eq64 (ported_cos (f64 (13842981386302376548))) (f64 (4604740173439952272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0488 :
  out_eq64 (ported_sin (f64 (13842199656453435434))) (f64 (13812150232112394686)) &&
  out_eq64 (ported_cos (f64 (13842199656453435434))) (f64 (4607166301997068482)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0489 :
  out_eq64 (ported_sin (f64 (13844757796545755257))) (f64 (13819506253001585433)) &&
  out_eq64 (ported_cos (f64 (13844757796545755257))) (f64 (13830384487053393713)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0490 :
  out_eq64 (ported_sin (f64 (13850531393493593378))) (f64 (4605661648768551067)) &&
  out_eq64 (ported_cos (f64 (13850531393493593378))) (f64 (13826555551109781872)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0491 :
  out_eq64 (ported_sin (f64 (13849114188443345902))) (f64 (4605298247467554561)) &&
  out_eq64 (ported_cos (f64 (13849114188443345902))) (f64 (4603688123646841450)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0492 :
  out_eq64 (ported_sin (f64 (13847899506768642645))) (f64 (13828585801906210867)) &&
  out_eq64 (ported_cos (f64 (13847899506768642645))) (f64 (13827167622542248002)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0493 :
  out_eq64 (ported_sin (f64 (4622829062543036169))) (f64 (13827832650849402383)) &&
  out_eq64 (ported_cos (f64 (4622829062543036169))) (f64 (4604626843761757479)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0494 :
  out_eq64 (ported_sin (f64 (4625557331495051793))) (f64 (13830554436837508303)) &&
  out_eq64 (ported_cos (f64 (4625557331495051793))) (f64 (4566859755284238306)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0495 :
  out_eq64 (ported_sin (f64 (13849046086901877300))) (f64 (4606411626355353861)) &&
  out_eq64 (ported_cos (f64 (13849046086901877300))) (f64 (4600963050853879069)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0496 :
  out_eq64 (ported_sin (f64 (4620402313856713357))) (f64 (4607125625588668457)) &&
  out_eq64 (ported_cos (f64 (4620402313856713357))) (f64 (4592743510009938270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0497 :
  out_eq64 (ported_sin (f64 (4623061568318362828))) (f64 (13823378448160137913)) &&
  out_eq64 (ported_cos (f64 (4623061568318362828))) (f64 (4606607137650545194)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0498 :
  out_eq64 (ported_sin (f64 (4624662297861328452))) (f64 (4603679597623426770)) &&
  out_eq64 (ported_cos (f64 (4624662297861328452))) (f64 (13828676874930337312)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0499 :
  out_eq64 (ported_sin (f64 (4625458011148082757))) (f64 (13830005860829475457)) &&
  out_eq64 (ported_cos (f64 (4625458011148082757))) (f64 (13823234504702052421)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0500 :
  out_eq64 (ported_sin (f64 (13849790186042775908))) (f64 (13830524697497600354)) &&
  out_eq64 (ported_cos (f64 (13849790186042775908))) (f64 (4590516953815422385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0501 :
  out_eq64 (ported_sin (f64 (13845824851009517383))) (f64 (4607106301860995077)) &&
  out_eq64 (ported_cos (f64 (13845824851009517383))) (f64 (4593842045681076780)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0502 :
  out_eq64 (ported_sin (f64 (13848507871060176786))) (f64 (4595749666832076524)) &&
  out_eq64 (ported_cos (f64 (13848507871060176786))) (f64 (13830402890706229588)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0503 :
  out_eq64 (ported_sin (f64 (13850531289696666897))) (f64 (4605659801397007668)) &&
  out_eq64 (ported_cos (f64 (13850531289696666897))) (f64 (13826558311470528088)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0504 :
  out_eq64 (ported_sin (f64 (13742136438652035424))) (f64 (13742136438652033679)) &&
  out_eq64 (ported_cos (f64 (13742136438652035424))) (f64 (4607182418800009751)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0505 :
  out_eq64 (ported_sin (f64 (13842998911952158211))) (f64 (13827815624059373929)) &&
  out_eq64 (ported_cos (f64 (13842998911952158211))) (f64 (4604643388165695677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0506 :
  out_eq64 (ported_sin (f64 (13837490713047398096))) (f64 (13812358075802505043)) &&
  out_eq64 (ported_cos (f64 (13837490713047398096))) (f64 (13830537551289487637)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0507 :
  out_eq64 (ported_sin (f64 (4587575877740348904))) (f64 (4587572606479416181)) &&
  out_eq64 (ported_cos (f64 (4587575877740348904))) (f64 (4607170498878131074)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0508 :
  out_eq64 (ported_sin (f64 (4617766984293161596))) (f64 (13828502079121551811)) &&
  out_eq64 (ported_cos (f64 (4617766984293161596))) (f64 (4603898861683558627)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0509 :
  out_eq64 (ported_sin (f64 (13746039934150613180))) (f64 (13746039934150608049)) &&
  out_eq64 (ported_cos (f64 (13746039934150613180))) (f64 (4607182418799992459)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0510 :
  out_eq64 (ported_sin (f64 (4626208003042754897))) (f64 (4604267912183302368)) &&
  out_eq64 (ported_cos (f64 (4626208003042754897))) (f64 (4604809127506135615)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0511 :
  out_eq64 (ported_sin (f64 (4626531961600428525))) (f64 (4606716538798489478)) &&
  out_eq64 (ported_cos (f64 (4626531961600428525))) (f64 (13822762224365811514)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0512 :
  out_eq64 (ported_sin (f64 (13850737508431916576))) (f64 (4607090913884782138)) &&
  out_eq64 (ported_cos (f64 (13850737508431916576))) (f64 (4594290570997536480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0513 :
  out_eq64 (ported_sin (f64 (4622801869162649243))) (f64 (13828136844618687104)) &&
  out_eq64 (ported_cos (f64 (4622801869162649243))) (f64 (4604315819314308353)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0514 :
  out_eq64 (ported_sin (f64 (4622370500498916567))) (f64 (13830553285184432787)) &&
  out_eq64 (ported_cos (f64 (4622370500498916567))) (f64 (13803675758484206617)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0515 :
  out_eq64 (ported_sin (f64 (13848491513001925103))) (f64 (4594717734070979589)) &&
  out_eq64 (ported_cos (f64 (13848491513001925103))) (f64 (13830446957559321755)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0516 :
  out_eq64 (ported_sin (f64 (4623591750608459707))) (f64 (4603129885744207964)) &&
  out_eq64 (ported_cos (f64 (4623591750608459707))) (f64 (4605697248611410892)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0517 :
  out_eq64 (ported_sin (f64 (4626249135293340101))) (f64 (4605168949062746471)) &&
  out_eq64 (ported_cos (f64 (4626249135293340101))) (f64 (4603851255649026528)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0518 :
  out_eq64 (ported_sin (f64 (4664089304749908863))) (f64 (4602400742778466205)) &&
  out_eq64 (ported_cos (f64 (4664089304749908863))) (f64 (13829426357994518286)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0519 :
  out_eq64 (ported_sin (f64 (13835084339837959407))) (f64 (13829693169600564221)) &&
  out_eq64 (ported_cos (f64 (13835084339837959407))) (f64 (13824730980505771436)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0520 :
  out_eq64 (ported_sin (f64 (13836976668922863241))) (f64 (13822187267110365836)) &&
  out_eq64 (ported_cos (f64 (13836976668922863241))) (f64 (13830179489980541342)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0521 :
  out_eq64 (ported_sin (f64 (4619341990507085346))) (f64 (4602570725845175934)) &&
  out_eq64 (ported_cos (f64 (4619341990507085346))) (f64 (4606006638116545200)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0522 :
  out_eq64 (ported_sin (f64 (4621502823048664736))) (f64 (13802232749214969666)) &&
  out_eq64 (ported_cos (f64 (4621502823048664736))) (f64 (13830553650608932947)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0523 :
  out_eq64 (ported_sin (f64 (13849378876646268366))) (f64 (13807162624912035834)) &&
  out_eq64 (ported_cos (f64 (13849378876646268366))) (f64 (4607178831997560805)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0524 :
  out_eq64 (ported_sin (f64 (4657500072289620140))) (f64 (4607159053996146781)) &&
  out_eq64 (ported_cos (f64 (4657500072289620140))) (f64 (13813223252899824724)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0525 :
  out_eq64 (ported_sin (f64 (4613695616154910705))) (f64 (4598052081033835263)) &&
  out_eq64 (ported_cos (f64 (4613695616154910705))) (f64 (13830276330231733429)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0526 :
  out_eq64 (ported_sin (f64 (4626595825471848423))) (f64 (4605854439394930683)) &&
  out_eq64 (ported_cos (f64 (4626595825471848423))) (f64 (13826254614567356107)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0527 :
  out_eq64 (ported_sin (f64 (4621628623778299275))) (f64 (13820993463334832573)) &&
  out_eq64 (ported_cos (f64 (4621628623778299275))) (f64 (13830303019282393878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0528 :
  out_eq64 (ported_sin (f64 (13848597484704548953))) (f64 (4600582965849907907)) &&
  out_eq64 (ported_cos (f64 (13848597484704548953))) (f64 (13829865186597322250)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0529 :
  out_eq64 (ported_sin (f64 (13831634711075788750))) (f64 (13830065725986979342)) &&
  out_eq64 (ported_cos (f64 (13831634711075788750))) (f64 (4599524931565581758)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0530 :
  out_eq64 (ported_sin (f64 (13844366032236838155))) (f64 (13828549270358744616)) &&
  out_eq64 (ported_cos (f64 (13844366032236838155))) (f64 (13827213069575306380)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0531 :
  out_eq64 (ported_sin (f64 (13829351091470301521))) (f64 (13828410764242689217)) &&
  out_eq64 (ported_cos (f64 (13829351091470301521))) (f64 (4604008048919488143)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0532 :
  out_eq64 (ported_sin (f64 (13841455257342636128))) (f64 (4603270938269091488)) &&
  out_eq64 (ported_cos (f64 (13841455257342636128))) (f64 (4605602418822417644)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0533 :
  out_eq64 (ported_sin (f64 (4627407476833387359))) (f64 (13830173452502036016)) &&
  out_eq64 (ported_cos (f64 (4627407476833387359))) (f64 (4598855587211292836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0534 :
  out_eq64 (ported_sin (f64 (4490912417154367110))) (f64 (4490912417154367110)) &&
  out_eq64 (ported_cos (f64 (4490912417154367110))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0535 :
  out_eq64 (ported_sin (f64 (4617187988810496775))) (f64 (13830417913927097051)) &&
  out_eq64 (ported_cos (f64 (4617187988810496775))) (f64 (4595417594295204388)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0536 :
  out_eq64 (ported_sin (f64 (13845669452397556998))) (f64 (4607086660638461572)) &&
  out_eq64 (ported_cos (f64 (13845669452397556998))) (f64 (13817779684700468376)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0537 :
  out_eq64 (ported_sin (f64 (13764755978389095722))) (f64 (13764755978387219136)) &&
  out_eq64 (ported_cos (f64 (13764755978389095722))) (f64 (4607182418791915889)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0538 :
  out_eq64 (ported_sin (f64 (13840028524550568093))) (f64 (4606786157837757998)) &&
  out_eq64 (ported_cos (f64 (13840028524550568093))) (f64 (13822328117062127023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0539 :
  out_eq64 (ported_sin (f64 (13782860660558353936))) (f64 (13782860660056857978)) &&
  out_eq64 (ported_cos (f64 (13782860660558353936))) (f64 (4607182416665765206)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0540 :
  out_eq64 (ported_sin (f64 (4625393484466559282))) (f64 (13829081158336581026)) &&
  out_eq64 (ported_cos (f64 (4625393484466559282))) (f64 (13826483850370126555)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0541 :
  out_eq64 (ported_sin (f64 (13848453350595287751))) (f64 (4590915560523521958)) &&
  out_eq64 (ported_cos (f64 (13848453350595287751))) (f64 (13830520497966110135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0542 :
  out_eq64 (ported_sin (f64 (13835514924342146703))) (f64 (13828814191759103624)) &&
  out_eq64 (ported_cos (f64 (13835514924342146703))) (f64 (13826869031376690674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0543 :
  out_eq64 (ported_sin (f64 (4625379855306553680))) (f64 (13828833389304154709)) &&
  out_eq64 (ported_cos (f64 (4625379855306553680))) (f64 (13826842717259917187)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0544 :
  out_eq64 (ported_sin (f64 (4618956480205938749))) (f64 (4595415449928726012)) &&
  out_eq64 (ported_cos (f64 (4618956480205938749))) (f64 (4607045971477714150)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0545 :
  out_eq64 (ported_sin (f64 (4620629785329050936))) (f64 (4607146223568549612)) &&
  out_eq64 (ported_cos (f64 (4620629785329050936))) (f64 (13814489860857068094)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0546 :
  out_eq64 (ported_sin (f64 (4624555079010115031))) (f64 (4604929769386149289)) &&
  out_eq64 (ported_cos (f64 (4624555079010115031))) (f64 (13827505921926977773)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0547 :
  out_eq64 (ported_sin (f64 (13846431182316875603))) (f64 (4600078931955595665)) &&
  out_eq64 (ported_cos (f64 (13846431182316875603))) (f64 (4606593427580691418)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0548 :
  out_eq64 (ported_sin (f64 (13913117765042663388))) (f64 (4606278980242375167)) &&
  out_eq64 (ported_cos (f64 (13913117765042663388))) (f64 (4601535130833206856)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0549 :
  out_eq64 (ported_sin (f64 (4627536724832207721))) (f64 (13828131110301482847)) &&
  out_eq64 (ported_cos (f64 (4627536724832207721))) (f64 (4604321967158382346)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0550 :
  out_eq64 (ported_sin (f64 (13851120035195578767))) (f64 (4589641470684723828)) &&
  out_eq64 (ported_cos (f64 (13851120035195578767))) (f64 (4607160907672461056)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0551 :
  out_eq64 (ported_sin (f64 (4596809278382031206))) (f64 (4596752121697631314)) &&
  out_eq64 (ported_cos (f64 (4596809278382031206))) (f64 (4606980600075386234)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0552 :
  out_eq64 (ported_sin (f64 (4614251424025936162))) (f64 (4567504524440675190)) &&
  out_eq64 (ported_cos (f64 (4614251424025936162))) (f64 (13830554431337074561)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0553 :
  out_eq64 (ported_sin (f64 (4682865613148350832))) (f64 (4606702828337775925)) &&
  out_eq64 (ported_cos (f64 (4682865613148350832))) (f64 (13822843493562348052)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0554 :
  out_eq64 (ported_sin (f64 (13845143880603203210))) (f64 (4602169473592900066)) &&
  out_eq64 (ported_cos (f64 (13845143880603203210))) (f64 (13829489312754939402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0555 :
  out_eq64 (ported_sin (f64 (13847182729205632365))) (f64 (13828984169859363709)) &&
  out_eq64 (ported_cos (f64 (13847182729205632365))) (f64 (4603256750477320259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0556 :
  out_eq64 (ported_sin (f64 (4627176180344628423))) (f64 (13829319483853527307)) &&
  out_eq64 (ported_cos (f64 (4627176180344628423))) (f64 (13826099411804479330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0557 :
  out_eq64 (ported_sin (f64 (13848871105396381417))) (f64 (4606993913150981298)) &&
  out_eq64 (ported_cos (f64 (13848871105396381417))) (f64 (13819872485396095840)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0558 :
  out_eq64 (ported_sin (f64 (13838918369610506883))) (f64 (4603056486584529403)) &&
  out_eq64 (ported_cos (f64 (13838918369610506883))) (f64 (13829117122350391705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0559 :
  out_eq64 (ported_sin (f64 (13841504207467976833))) (f64 (4602943316557304224)) &&
  out_eq64 (ported_cos (f64 (13841504207467976833))) (f64 (4605816874424849176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0560 :
  out_eq64 (ported_sin (f64 (4627034586263371395))) (f64 (13826162089614169861)) &&
  out_eq64 (ported_cos (f64 (4627034586263371395))) (f64 (13829282432727744009)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0561 :
  out_eq64 (ported_sin (f64 (4617340651268287200))) (f64 (13830125296281115764)) &&
  out_eq64 (ported_cos (f64 (4617340651268287200))) (f64 (4599165933419514685)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0562 :
  out_eq64 (ported_sin (f64 (4597855434688944219))) (f64 (4597771496761589776)) &&
  out_eq64 (ported_cos (f64 (4597855434688944219))) (f64 (4606921841776335533)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0563 :
  out_eq64 (ported_sin (f64 (4690240837847029868))) (f64 (13820636789438354620)) &&
  out_eq64 (ported_cos (f64 (4690240837847029868))) (f64 (13830324062271240840)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0564 :
  out_eq64 (ported_sin (f64 (4626147830699960009))) (f64 (4602721836765057745)) &&
  out_eq64 (ported_cos (f64 (4626147830699960009))) (f64 (4605950688037360644)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0565 :
  out_eq64 (ported_sin (f64 (13907161947790611278))) (f64 (13830299899642787914)) &&
  out_eq64 (ported_cos (f64 (13907161947790611278))) (f64 (4597672959730648990)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0566 :
  out_eq64 (ported_sin (f64 (4529243307325421524))) (f64 (4529243307325368423)) &&
  out_eq64 (ported_cos (f64 (4529243307325421524))) (f64 (4607182418799829334)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0567 :
  out_eq64 (ported_sin (f64 (4627440539721125731))) (f64 (13829810248257678882)) &&
  out_eq64 (ported_cos (f64 (4627440539721125731))) (f64 (4600841725628535920)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0568 :
  out_eq64 (ported_sin (f64 (13836664600297605549))) (f64 (13824522918898921947)) &&
  out_eq64 (ported_cos (f64 (13836664600297605549))) (f64 (13829741449339344894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0569 :
  out_eq64 (ported_sin (f64 (4540942417346550742))) (f64 (4540942417345043929)) &&
  out_eq64 (ported_cos (f64 (4540942417346550742))) (f64 (4607182418793018554)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0570 :
  out_eq64 (ported_sin (f64 (13840854073703771088))) (f64 (4606341643724044085)) &&
  out_eq64 (ported_cos (f64 (13840854073703771088))) (f64 (4601271397427029589)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0571 :
  out_eq64 (ported_sin (f64 (4622063853010107626))) (f64 (13829174645431784733)) &&
  out_eq64 (ported_cos (f64 (4622063853010107626))) (f64 (13826338140971111445)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0572 :
  out_eq64 (ported_sin (f64 (4625652810097870159))) (f64 (13830035067459059695)) &&
  out_eq64 (ported_cos (f64 (4625652810097870159))) (f64 (4599700451261109066)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0573 :
  out_eq64 (ported_sin (f64 (13843653919650122262))) (f64 (13830338692988541730)) &&
  out_eq64 (ported_cos (f64 (13843653919650122262))) (f64 (4597006674384370330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0574 :
  out_eq64 (ported_sin (f64 (13845493242639983860))) (f64 (4606250305808840374)) &&
  out_eq64 (ported_cos (f64 (13845493242639983860))) (f64 (13825024288389441734)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0575 :
  out_eq64 (ported_sin (f64 (13740344098940237514))) (f64 (13740344098940236211)) &&
  out_eq64 (ported_cos (f64 (13740344098940237514))) (f64 (4607182418800013437)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0576 :
  out_eq64 (ported_sin (f64 (4667332237656230540))) (f64 (13827936023248210431)) &&
  out_eq64 (ported_cos (f64 (4667332237656230540))) (f64 (4604524494824745824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0577 :
  out_eq64 (ported_sin (f64 (13870059482126525607))) (f64 (13829979057812282105)) &&
  out_eq64 (ported_cos (f64 (13870059482126525607))) (f64 (4600007032567236623)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0578 :
  out_eq64 (ported_sin (f64 (13913987551886239167))) (f64 (4600235718917113293)) &&
  out_eq64 (ported_cos (f64 (13913987551886239167))) (f64 (13829935211424774154)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0579 :
  out_eq64 (ported_sin (f64 (13830413964060060339))) (f64 (13829049726414332377)) &&
  out_eq64 (ported_cos (f64 (13830413964060060339))) (f64 (4603159452896498431)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0580 :
  out_eq64 (ported_sin (f64 (4641101611003873785))) (f64 (4606758239477477992)) &&
  out_eq64 (ported_cos (f64 (4641101611003873785))) (f64 (4599134735240883145)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0581 :
  out_eq64 (ported_sin (f64 (13831213290505377403))) (f64 (13829754998913754357)) &&
  out_eq64 (ported_cos (f64 (13831213290505377403))) (f64 (4601091215929380740)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0582 :
  out_eq64 (ported_sin (f64 (13847702268436453956))) (f64 (13830087332668371631)) &&
  out_eq64 (ported_cos (f64 (13847702268436453956))) (f64 (13822769645157543977)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0583 :
  out_eq64 (ported_sin (f64 (4626538098305986981))) (f64 (4606652175879796943)) &&
  out_eq64 (ported_cos (f64 (4626538098305986981))) (f64 (13823133270789099842)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0584 :
  out_eq64 (ported_sin (f64 (13840451461552954328))) (f64 (4607155090255582674)) &&
  out_eq64 (ported_cos (f64 (13840451461552954328))) (f64 (4590273330379909289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0585 :
  out_eq64 (ported_sin (f64 (4568132115243666041))) (f64 (4568132108521141653)) &&
  out_eq64 (ported_cos (f64 (4568132115243666041))) (f64 (4607182388452099840)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0586 :
  out_eq64 (ported_sin (f64 (13849132620693797185))) (f64 (4604922228511304928)) &&
  out_eq64 (ported_cos (f64 (13849132620693797185))) (f64 (4604142422275780681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0587 :
  out_eq64 (ported_sin (f64 (13844019320967102837))) (f64 (13830504640071212178)) &&
  out_eq64 (ported_cos (f64 (13844019320967102837))) (f64 (13815604458288527188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0588 :
  out_eq64 (ported_sin (f64 (13718645578991312964))) (f64 (13718645578991312963)) &&
  out_eq64 (ported_cos (f64 (13718645578991312964))) (f64 (4607182418800017403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0589 :
  out_eq64 (ported_sin (f64 (4623953827349161269))) (f64 (4606651184152534103)) &&
  out_eq64 (ported_cos (f64 (4623953827349161269))) (f64 (4599766753186710375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0590 :
  out_eq64 (ported_sin (f64 (13755602023273253845))) (f64 (13755602023273144616)) &&
  out_eq64 (ported_cos (f64 (13755602023273253845))) (f64 (4607182418799534529)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0591 :
  out_eq64 (ported_sin (f64 (13841559086306866127))) (f64 (4602451840920089927)) &&
  out_eq64 (ported_cos (f64 (13841559086306866127))) (f64 (4606040114217349806)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0592 :
  out_eq64 (ported_sin (f64 (13847909753214872152))) (f64 (13828482343468216358)) &&
  out_eq64 (ported_cos (f64 (13847909753214872152))) (f64 (13827294795505755575)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0593 :
  out_eq64 (ported_sin (f64 (4498546145179297557))) (f64 (4498546145179297553)) &&
  out_eq64 (ported_cos (f64 (4498546145179297557))) (f64 (4607182418800017394)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0594 :
  out_eq64 (ported_sin (f64 (4624452967544434103))) (f64 (4605893861840741966)) &&
  out_eq64 (ported_cos (f64 (4624452967544434103))) (f64 (13826189691055408936)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0595 :
  out_eq64 (ported_sin (f64 (13741974099752919709))) (f64 (13741974099752918099)) &&
  out_eq64 (ported_cos (f64 (13741974099752919709))) (f64 (4607182418800010149)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0596 :
  out_eq64 (ported_sin (f64 (13818567626316423752))) (f64 (13818539548195163898)) &&
  out_eq64 (ported_cos (f64 (13818567626316423752))) (f64 (4607056662001940074)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0597 :
  out_eq64 (ported_sin (f64 (13841367751952673036))) (f64 (4603832219699997279)) &&
  out_eq64 (ported_cos (f64 (13841367751952673036))) (f64 (4605184355559372220)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0598 :
  out_eq64 (ported_sin (f64 (13840628882944410778))) (f64 (4606933800418283835)) &&
  out_eq64 (ported_cos (f64 (13840628882944410778))) (f64 (4597574588680165305)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0599 :
  out_eq64 (ported_sin (f64 (4676511816227122895))) (f64 (4604092239994346218)) &&
  out_eq64 (ported_cos (f64 (4676511816227122895))) (f64 (4604966280391705086)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0600 :
  out_eq64 (ported_sin (f64 (13849402301987748466))) (f64 (13816050343580126074)) &&
  out_eq64 (ported_cos (f64 (13849402301987748466))) (f64 (4607126541452470085)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0601 :
  out_eq64 (ported_sin (f64 (4627553480692774764))) (f64 (13827753755942447887)) &&
  out_eq64 (ported_cos (f64 (4627553480692774764))) (f64 (4604702776656849558)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0602 :
  out_eq64 (ported_sin (f64 (13849445459712791870))) (f64 (13821757841131572476)) &&
  out_eq64 (ported_cos (f64 (13849445459712791870))) (f64 (4606868536223748686)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0603 :
  out_eq64 (ported_sin (f64 (4624645226189794388))) (f64 (4603893242082977624)) &&
  out_eq64 (ported_cos (f64 (4624645226189794388))) (f64 (13828506700104325412)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0604 :
  out_eq64 (ported_sin (f64 (4508126124904573338))) (f64 (4508126124904573295)) &&
  out_eq64 (ported_cos (f64 (4508126124904573338))) (f64 (4607182418800017149)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0605 :
  out_eq64 (ported_sin (f64 (13864726871032978167))) (f64 (13828951933118240529)) &&
  out_eq64 (ported_cos (f64 (13864726871032978167))) (f64 (13826675648069350382)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0606 :
  out_eq64 (ported_sin (f64 (13812543714016687130))) (f64 (13812540775412489263)) &&
  out_eq64 (ported_cos (f64 (13812543714016687130))) (f64 (4607164803777562688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0607 :
  out_eq64 (ported_sin (f64 (13849584776209804252))) (f64 (13827750708435044886)) &&
  out_eq64 (ported_cos (f64 (13849584776209804252))) (f64 (4604705672918829595)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0608 :
  out_eq64 (ported_sin (f64 (4625311839523164821))) (f64 (13827354521037738091)) &&
  out_eq64 (ported_cos (f64 (4625311839523164821))) (f64 (13828432408238791143)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0609 :
  out_eq64 (ported_sin (f64 (13836182727456261035))) (f64 (13826941747809995600)) &&
  out_eq64 (ported_cos (f64 (13836182727456261035))) (f64 (13828760376449147054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0610 :
  out_eq64 (ported_sin (f64 (13777307500018394349))) (f64 (13777307499945482609)) &&
  out_eq64 (ported_cos (f64 (13777307500018394349))) (f64 (4607182418428271870)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0611 :
  out_eq64 (ported_sin (f64 (13916582887327610925))) (f64 (4605744303291450810)) &&
  out_eq64 (ported_cos (f64 (13916582887327610925))) (f64 (13826429736267701990)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0612 :
  out_eq64 (ported_sin (f64 (13728245775685619694))) (f64 (13728245775685619671)) &&
  out_eq64 (ported_cos (f64 (13728245775685619694))) (f64 (4607182418800017303)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0613 :
  out_eq64 (ported_sin (f64 (13844663567339643982))) (f64 (13823422713361938918)) &&
  out_eq64 (ported_cos (f64 (13844663567339643982))) (f64 (13829970827357334550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0614 :
  out_eq64 (ported_sin (f64 (13785948728936245980))) (f64 (13785948727995023799)) &&
  out_eq64 (ported_cos (f64 (13785948728936245980))) (f64 (4607182413645173353)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0615 :
  out_eq64 (ported_sin (f64 (13817048007698208310))) (f64 (13817028852733787270)) &&
  out_eq64 (ported_cos (f64 (13817048007698208310))) (f64 (4607112005956314404)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0616 :
  out_eq64 (ported_sin (f64 (4649239238599546703))) (f64 (4601338944422943521)) &&
  out_eq64 (ported_cos (f64 (4649239238599546703))) (f64 (4606325843579558647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0617 :
  out_eq64 (ported_sin (f64 (13895387512580813030))) (f64 (4607164337194875247)) &&
  out_eq64 (ported_cos (f64 (13895387512580813030))) (f64 (4589227944188003782)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0618 :
  out_eq64 (ported_sin (f64 (4608896759310816521))) (f64 (4607020095478245907)) &&
  out_eq64 (ported_cos (f64 (4608896759310816521))) (f64 (4595977200147151052)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0619 :
  out_eq64 (ported_sin (f64 (13850194691648471170))) (f64 (13820227183717976367)) &&
  out_eq64 (ported_cos (f64 (13850194691648471170))) (f64 (13830347051495995980)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0620 :
  out_eq64 (ported_sin (f64 (4627050567261025201))) (f64 (13826593589405470605)) &&
  out_eq64 (ported_cos (f64 (4627050567261025201))) (f64 (13829008098283716009)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0621 :
  out_eq64 (ported_sin (f64 (4626623308718642949))) (f64 (4605358966212267054)) &&
  out_eq64 (ported_cos (f64 (4626623308718642949))) (f64 (13826980802409713647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0622 :
  out_eq64 (ported_sin (f64 (4677388710280460923))) (f64 (13823826034179533261)) &&
  out_eq64 (ported_cos (f64 (4677388710280460923))) (f64 (13829891684336847181)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0623 :
  out_eq64 (ported_sin (f64 (4622167108193402174))) (f64 (13829920519619562251)) &&
  out_eq64 (ported_cos (f64 (4622167108193402174))) (f64 (13823682361908898355)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0624 :
  out_eq64 (ported_sin (f64 (4609209170212338398))) (f64 (4607116814966015384)) &&
  out_eq64 (ported_cos (f64 (4609209170212338398))) (f64 (4593345470356105427)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0625 :
  out_eq64 (ported_sin (f64 (13844316858817299105))) (f64 (13829016851922606397)) &&
  out_eq64 (ported_cos (f64 (13844316858817299105))) (f64 (13826580623180254650)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0626 :
  out_eq64 (ported_sin (f64 (13846151259974498238))) (f64 (4605006430760926912)) &&
  out_eq64 (ported_cos (f64 (13846151259974498238))) (f64 (4604045840614786656)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0627 :
  out_eq64 (ported_sin (f64 (4626744392424343577))) (f64 (4602198217302385265)) &&
  out_eq64 (ported_cos (f64 (4626744392424343577))) (f64 (13829481607203700509)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0628 :
  out_eq64 (ported_sin (f64 (13846987411760527828))) (f64 (13826813131142345359)) &&
  out_eq64 (ported_cos (f64 (13846987411760527828))) (f64 (4605482763702726708)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0629 :
  out_eq64 (ported_sin (f64 (4617709626978920950))) (f64 (13828784512768023195)) &&
  out_eq64 (ported_cos (f64 (4617709626978920950))) (f64 (4603537286187800576)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0630 :
  out_eq64 (ported_sin (f64 (4627032846923634073))) (f64 (13826114203247110677)) &&
  out_eq64 (ported_cos (f64 (4627032846923634073))) (f64 (13829310801654042152)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0631 :
  out_eq64 (ported_sin (f64 (4613568566710490140))) (f64 (4599091070512249372)) &&
  out_eq64 (ported_cos (f64 (4613568566710490140))) (f64 (13830137193956779530)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0632 :
  out_eq64 (ported_sin (f64 (13713973432619576276))) (f64 (13713973432619576276)) &&
  out_eq64 (ported_cos (f64 (13713973432619576276))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0633 :
  out_eq64 (ported_sin (f64 (4624613731718447835))) (f64 (4604273441952595822)) &&
  out_eq64 (ported_cos (f64 (4624613731718447835))) (f64 (13828176081475846138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0634 :
  out_eq64 (ported_sin (f64 (13909080032367109945))) (f64 (4606435386231232061)) &&
  out_eq64 (ported_cos (f64 (13909080032367109945))) (f64 (4600854734767282957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0635 :
  out_eq64 (ported_sin (f64 (13848234373937089673))) (f64 (13822403739878236778)) &&
  out_eq64 (ported_cos (f64 (13848234373937089673))) (f64 (13830146501465172331)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0636 :
  out_eq64 (ported_sin (f64 (4621156516568527912))) (f64 (4603274393775976317)) &&
  out_eq64 (ported_cos (f64 (4621156516568527912))) (f64 (13828972083709799755)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0637 :
  out_eq64 (ported_sin (f64 (4625422288732550603))) (f64 (13829546041587525019)) &&
  out_eq64 (ported_cos (f64 (4625422288732550603))) (f64 (13825325944847669821)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0638 :
  out_eq64 (ported_sin (f64 (4623122790225125806))) (f64 (13821474067855463422)) &&
  out_eq64 (ported_cos (f64 (4623122790225125806))) (f64 (4606901106560591080)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0639 :
  out_eq64 (ported_sin (f64 (4598102505306940114))) (f64 (4598011215485553349)) &&
  out_eq64 (ported_cos (f64 (4598102505306940114))) (f64 (4606906886458645960)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0640 :
  out_eq64 (ported_sin (f64 (13841692981800529040))) (f64 (4600523597107133211)) &&
  out_eq64 (ported_cos (f64 (13841692981800529040))) (f64 (4606505420056919812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0641 :
  out_eq64 (ported_sin (f64 (13708972061183867399))) (f64 (13708972061183867399)) &&
  out_eq64 (ported_cos (f64 (13708972061183867399))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0642 :
  out_eq64 (ported_sin (f64 (13845471001435947664))) (f64 (4606086394755708365)) &&
  out_eq64 (ported_cos (f64 (13845471001435947664))) (f64 (13825655960809222399)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0643 :
  out_eq64 (ported_sin (f64 (4625770043168128546))) (f64 (13828089957959195037)) &&
  out_eq64 (ported_cos (f64 (4625770043168128546))) (f64 (4604365752214005084)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0644 :
  out_eq64 (ported_sin (f64 (4690387377127379026))) (f64 (4602487086847330443)) &&
  out_eq64 (ported_cos (f64 (4690387377127379026))) (f64 (4606030251315973612)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0645 :
  out_eq64 (ported_sin (f64 (13848314022214712199))) (f64 (13818302711858736276)) &&
  out_eq64 (ported_cos (f64 (13848314022214712199))) (f64 (13830438495154043239)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0646 :
  out_eq64 (ported_sin (f64 (4618418518236291086))) (f64 (13822427894317539157)) &&
  out_eq64 (ported_cos (f64 (4618418518236291086))) (f64 (4606770691314164008)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0647 :
  out_eq64 (ported_sin (f64 (4627391705923574348))) (f64 (13830305067545104173)) &&
  out_eq64 (ported_cos (f64 (4627391705923574348))) (f64 (4597587409686172670)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0648 :
  out_eq64 (ported_sin (f64 (13850794590117351468))) (f64 (4606650278634768837)) &&
  out_eq64 (ported_cos (f64 (13850794590117351468))) (f64 (4599771787733374140)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0649 :
  out_eq64 (ported_sin (f64 (4624227466317564804))) (f64 (4607093132472702444)) &&
  out_eq64 (ported_cos (f64 (4624227466317564804))) (f64 (13817600440424794183)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0650 :
  out_eq64 (ported_sin (f64 (4557500989494854605))) (f64 (4557500989153583682)) &&
  out_eq64 (ported_cos (f64 (4557500989494854605))) (f64 (4607182417759825080)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0651 :
  out_eq64 (ported_sin (f64 (4616207321200698503))) (f64 (13828455653218952723)) &&
  out_eq64 (ported_cos (f64 (4616207321200698503))) (f64 (13827326849102588636)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0652 :
  out_eq64 (ported_sin (f64 (4625225070459492164))) (f64 (13823932691809571342)) &&
  out_eq64 (ported_cos (f64 (4625225070459492164))) (f64 (13829869812346378660)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0653 :
  out_eq64 (ported_sin (f64 (4626188423234780108))) (f64 (4603792085276747520)) &&
  out_eq64 (ported_cos (f64 (4626188423234780108))) (f64 (4605216558748100852)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0654 :
  out_eq64 (ported_sin (f64 (4619432077735030584))) (f64 (4603236487771910756)) &&
  out_eq64 (ported_cos (f64 (4619432077735030584))) (f64 (4605625937789356537)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0655 :
  out_eq64 (ported_sin (f64 (4624577286235259953))) (f64 (4604689518332628117)) &&
  out_eq64 (ported_cos (f64 (4624577286235259953))) (f64 (13827767670351206507)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0656 :
  out_eq64 (ported_sin (f64 (13846851978965123299))) (f64 (13823789863770044469)) &&
  out_eq64 (ported_cos (f64 (13846851978965123299))) (f64 (4606526974522632384)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0657 :
  out_eq64 (ported_sin (f64 (4523377503794827215))) (f64 (4523377503794819857)) &&
  out_eq64 (ported_cos (f64 (4523377503794827215))) (f64 (4607182418799985681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0658 :
  out_eq64 (ported_sin (f64 (4627316594500986198))) (f64 (13830550132653573707)) &&
  out_eq64 (ported_cos (f64 (4627316594500986198))) (f64 (13807958208944378392)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0659 :
  out_eq64 (ported_sin (f64 (4621404352452040373))) (f64 (4594963147101539429)) &&
  out_eq64 (ported_cos (f64 (4621404352452040373))) (f64 (13830437175971813298)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0660 :
  out_eq64 (ported_sin (f64 (13845287779169312673))) (f64 (4604294164802158739)) &&
  out_eq64 (ported_cos (f64 (13845287779169312673))) (f64 (13828156957403719788)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0661 :
  out_eq64 (ported_sin (f64 (13769768600061338467))) (f64 (13769768600051847792)) &&
  out_eq64 (ported_cos (f64 (13769768600061338467))) (f64 (4607182418762126164)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0662 :
  out_eq64 (ported_sin (f64 (13846352001847092737))) (f64 (4602375945999121833)) &&
  out_eq64 (ported_cos (f64 (13846352001847092737))) (f64 (4606061176385290999)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0663 :
  out_eq64 (ported_sin (f64 (13739965789768503454))) (f64 (13739965789768502310)) &&
  out_eq64 (ported_cos (f64 (13739965789768503454))) (f64 (4607182418800013768)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0664 :
  out_eq64 (ported_sin (f64 (4627130596651040778))) (f64 (13828483803096846808)) &&
  out_eq64 (ported_cos (f64 (4627130596651040778))) (f64 (13827293033835508181)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0665 :
  out_eq64 (ported_sin (f64 (13842763605250272160))) (f64 (13826337233567985727)) &&
  out_eq64 (ported_cos (f64 (13842763605250272160))) (f64 (4605803178456104556)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0666 :
  out_eq64 (ported_sin (f64 (13837867612806778153))) (f64 (4592295504769657521)) &&
  out_eq64 (ported_cos (f64 (13837867612806778153))) (f64 (13830503803772901931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0667 :
  out_eq64 (ported_sin (f64 (4625465760348986347))) (f64 (13830087863878015802)) &&
  out_eq64 (ported_cos (f64 (4625465760348986347))) (f64 (13822766475072072087)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0668 :
  out_eq64 (ported_sin (f64 (4526629939419750058))) (f64 (4526629939419734968)) &&
  out_eq64 (ported_cos (f64 (4526629939419750058))) (f64 (4607182418799936114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0669 :
  out_eq64 (ported_sin (f64 (4626256084797833733))) (f64 (4605306942387035162)) &&
  out_eq64 (ported_cos (f64 (4626256084797833733))) (f64 (4603676870908543924)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0670 :
  out_eq64 (ported_sin (f64 (13851051042421440702))) (f64 (4599239707916448820)) &&
  out_eq64 (ported_cos (f64 (13851051042421440702))) (f64 (4606741358548627185)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0671 :
  out_eq64 (ported_sin (f64 (4626465291742248397))) (f64 (4607148995777204029)) &&
  out_eq64 (ported_cos (f64 (4626465291742248397))) (f64 (13814238282043792332)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0672 :
  out_eq64 (ported_sin (f64 (4622373521869089131))) (f64 (13830553934781340771)) &&
  out_eq64 (ported_cos (f64 (4622373521869089131))) (f64 (13800725059075058182)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0673 :
  out_eq64 (ported_sin (f64 (13847682519454828512))) (f64 (13830182494882298402)) &&
  out_eq64 (ported_cos (f64 (13847682519454828512))) (f64 (13822167052041189288)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0674 :
  out_eq64 (ported_sin (f64 (4619596182408436546))) (f64 (4604264953997781171)) &&
  out_eq64 (ported_cos (f64 (4619596182408436546))) (f64 (4604811843138081970)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0675 :
  out_eq64 (ported_sin (f64 (13838877948466659535))) (f64 (4602919823883723375)) &&
  out_eq64 (ported_cos (f64 (13838877948466659535))) (f64 (13829203519724037168)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0676 :
  out_eq64 (ported_sin (f64 (13846211843783959256))) (f64 (4604336341892826239)) &&
  out_eq64 (ported_cos (f64 (13846211843783959256))) (f64 (4604745623629739475)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0677 :
  out_eq64 (ported_sin (f64 (13849390726715768771))) (f64 (13813099511561310501)) &&
  out_eq64 (ported_cos (f64 (13849390726715768771))) (f64 (4607160156890537185)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0678 :
  out_eq64 (ported_sin (f64 (13793205630235720602))) (f64 (13793205615996420648)) &&
  out_eq64 (ported_cos (f64 (13793205630235720602))) (f64 (4607182368746688228)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0679 :
  out_eq64 (ported_sin (f64 (4621297672151654714))) (f64 (4599866501717228533)) &&
  out_eq64 (ported_cos (f64 (4621297672151654714))) (f64 (13830005122459982000)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0680 :
  out_eq64 (ported_sin (f64 (13848918882457776340))) (f64 (4607176836291362762)) &&
  out_eq64 (ported_cos (f64 (13848918882457776340))) (f64 (13808606002775475848)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0681 :
  out_eq64 (ported_sin (f64 (13845660537248798334))) (f64 (4607064799738293140)) &&
  out_eq64 (ported_cos (f64 (13845660537248798334))) (f64 (13818343507714111041)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0682 :
  out_eq64 (ported_sin (f64 (13848727897215912832))) (f64 (4604984017521885794)) &&
  out_eq64 (ported_cos (f64 (13848727897215912832))) (f64 (13827443857838874991)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0683 :
  out_eq64 (ported_sin (f64 (4620868580804804769))) (f64 (4606256011682354468)) &&
  out_eq64 (ported_cos (f64 (4620868580804804769))) (f64 (13825001153075400119)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0684 :
  out_eq64 (ported_sin (f64 (4614028609546801308))) (f64 (4591949457038205050)) &&
  out_eq64 (ported_cos (f64 (4614028609546801308))) (f64 (13830508305012963315)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0685 :
  out_eq64 (ported_sin (f64 (13777419070053367954))) (f64 (13777419069975753874)) &&
  out_eq64 (ported_cos (f64 (13777419070053367954))) (f64 (4607182418412455456)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0686 :
  out_eq64 (ported_sin (f64 (13845443097345737106))) (f64 (4605863319748135198)) &&
  out_eq64 (ported_cos (f64 (13845443097345737106))) (f64 (13826240097084052634)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0687 :
  out_eq64 (ported_sin (f64 (4626844519130787159))) (f64 (4594100523483726306)) &&
  out_eq64 (ported_cos (f64 (4626844519130787159))) (f64 (13830469646168504356)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0688 :
  out_eq64 (ported_sin (f64 (13787284264301669103))) (f64 (13787284262370554131)) &&
  out_eq64 (ported_cos (f64 (13787284264301669103))) (f64 (4607182410476769419)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0689 :
  out_eq64 (ported_sin (f64 (13850895577247046570))) (f64 (4605039663866571343)) &&
  out_eq64 (ported_cos (f64 (13850895577247046570))) (f64 (4604006946782934957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0690 :
  out_eq64 (ported_sin (f64 (13876162433813510951))) (f64 (4606157574315383069)) &&
  out_eq64 (ported_cos (f64 (13876162433813510951))) (f64 (13825389110801975101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0691 :
  out_eq64 (ported_sin (f64 (4625533654251135167))) (f64 (13830524135512139898)) &&
  out_eq64 (ported_cos (f64 (4625533654251135167))) (f64 (13813943902700126007)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0692 :
  out_eq64 (ported_sin (f64 (4625991551324771854))) (f64 (13806549348317697824)) &&
  out_eq64 (ported_cos (f64 (4625991551324771854))) (f64 (4607179352601374783)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0693 :
  out_eq64 (ported_sin (f64 (4624666951221242074))) (f64 (4603620476621889765)) &&
  out_eq64 (ported_cos (f64 (4624666951221242074))) (f64 (13828722130181813052)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0694 :
  out_eq64 (ported_sin (f64 (13847384607056018685))) (f64 (13830294548837885985)) &&
  out_eq64 (ported_cos (f64 (13847384607056018685))) (f64 (4597760587703478289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0695 :
  out_eq64 (ported_sin (f64 (13850516647820048588))) (f64 (4605389127862267044)) &&
  out_eq64 (ported_cos (f64 (13850516647820048588))) (f64 (13826940693635124133)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0696 :
  out_eq64 (ported_sin (f64 (13834709184389000808))) (f64 (13830002990524321943)) &&
  out_eq64 (ported_cos (f64 (13834709184389000808))) (f64 (13823250169105471308)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0697 :
  out_eq64 (ported_sin (f64 (13849746380639316840))) (f64 (13830302806259595871)) &&
  out_eq64 (ported_cos (f64 (13849746380639316840))) (f64 (4597624955973537307)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0698 :
  out_eq64 (ported_sin (f64 (13846829112605286466))) (f64 (13823106009069401158)) &&
  out_eq64 (ported_cos (f64 (13846829112605286466))) (f64 (4606657059532697886)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0699 :
  out_eq64 (ported_sin (f64 (13844197566486420459))) (f64 (13829908405832936449)) &&
  out_eq64 (ported_cos (f64 (13844197566486420459))) (f64 (13823743154836144836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0700 :
  out_eq64 (ported_sin (f64 (4603434319896860527))) (f64 (4603140556438144967)) &&
  out_eq64 (ported_cos (f64 (4603434319896860527))) (f64 (4605690209096495044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0701 :
  out_eq64 (ported_sin (f64 (4621877667495320361))) (f64 (13827205508830535728)) &&
  out_eq64 (ported_cos (f64 (4621877667495320361))) (f64 (13828555381530751176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0702 :
  out_eq64 (ported_sin (f64 (13822549077454450631))) (f64 (13822463776794182735)) &&
  out_eq64 (ported_cos (f64 (13822549077454450631))) (f64 (4606765051508285801)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0703 :
  out_eq64 (ported_sin (f64 (4614485760682905349))) (f64 (13815355147782312304)) &&
  out_eq64 (ported_cos (f64 (4614485760682905349))) (f64 (13830507876523114491)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0704 :
  out_eq64 (ported_sin (f64 (4625925209048798435))) (f64 (13821705938927883071)) &&
  out_eq64 (ported_cos (f64 (4625925209048798435))) (f64 (4606875531016191090)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0705 :
  out_eq64 (ported_sin (f64 (4617079550970641955))) (f64 (13830527048422243673)) &&
  out_eq64 (ported_cos (f64 (4617079550970641955))) (f64 (4590281387262565691)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0706 :
  out_eq64 (ported_sin (f64 (4594747492780349357))) (f64 (4594725218285210942)) &&
  out_eq64 (ported_cos (f64 (4594747492780349357))) (f64 (4607074628813177577)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0707 :
  out_eq64 (ported_sin (f64 (4625287309510997528))) (f64 (13826733213762825616)) &&
  out_eq64 (ported_cos (f64 (4625287309510997528))) (f64 (13828911730899030622)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0708 :
  out_eq64 (ported_sin (f64 (4624828163747053080))) (f64 (4600065206871602230)) &&
  out_eq64 (ported_cos (f64 (4624828163747053080))) (f64 (13829968072861713633)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0709 :
  out_eq64 (ported_sin (f64 (13907403368916442684))) (f64 (13817237897783905457)) &&
  out_eq64 (ported_cos (f64 (13907403368916442684))) (f64 (13830477557724643963)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0710 :
  out_eq64 (ported_sin (f64 (13841140380956323085))) (f64 (4605123124453185070)) &&
  out_eq64 (ported_cos (f64 (13841140380956323085))) (f64 (4603907257211348187)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0711 :
  out_eq64 (ported_sin (f64 (4525881475919354055))) (f64 (4525881475919333883)) &&
  out_eq64 (ported_cos (f64 (4525881475919354055))) (f64 (4607182418799955263)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0712 :
  out_eq64 (ported_sin (f64 (4617717557163354544))) (f64 (13828746566281464431)) &&
  out_eq64 (ported_cos (f64 (4617717557163354544))) (f64 (4603588127788172026)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0713 :
  out_eq64 (ported_sin (f64 (13877768099870797028))) (f64 (4607037268869335475)) &&
  out_eq64 (ported_cos (f64 (13877768099870797028))) (f64 (4595610032637684176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0714 :
  out_eq64 (ported_sin (f64 (13817314628065962204))) (f64 (13817300665317483707)) &&
  out_eq64 (ported_cos (f64 (13817314628065962204))) (f64 (4607103443138413349)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0715 :
  out_eq64 (ported_sin (f64 (4625622515582477828))) (f64 (13830309763384549628)) &&
  out_eq64 (ported_cos (f64 (4625622515582477828))) (f64 (4597508868939195476)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0716 :
  out_eq64 (ported_sin (f64 (4613673756051851844))) (f64 (4598282919148629242)) &&
  out_eq64 (ported_cos (f64 (4613673756051851844))) (f64 (13830254357999654086)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0717 :
  out_eq64 (ported_sin (f64 (4625053248988480676))) (f64 (13808865078907862992)) &&
  out_eq64 (ported_cos (f64 (4625053248988480676))) (f64 (13830548288210081798)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0718 :
  out_eq64 (ported_sin (f64 (13845729772409503805))) (f64 (4607175640946285494)) &&
  out_eq64 (ported_cos (f64 (13845729772409503805))) (f64 (13809122631842109071)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0719 :
  out_eq64 (ported_sin (f64 (4517665618903193083))) (f64 (4517665618903192115)) &&
  out_eq64 (ported_cos (f64 (4517665618903193083))) (f64 (4607182418800012240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0720 :
  out_eq64 (ported_sin (f64 (4609561090895894837))) (f64 (4607174237482832558)) &&
  out_eq64 (ported_cos (f64 (4609561090895894837))) (f64 (4586301873957099272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0721 :
  out_eq64 (ported_sin (f64 (13830877649413900249))) (f64 (13829455989926442330)) &&
  out_eq64 (ported_cos (f64 (13830877649413900249))) (f64 (4602292889528157024)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0722 :
  out_eq64 (ported_sin (f64 (13845525135292416717))) (f64 (4606463292033581927)) &&
  out_eq64 (ported_cos (f64 (13845525135292416717))) (f64 (13824097022733185969)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0723 :
  out_eq64 (ported_sin (f64 (4613188293865119785))) (f64 (4601901458095735810)) &&
  out_eq64 (ported_cos (f64 (4613188293865119785))) (f64 (13829559564388783691)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0724 :
  out_eq64 (ported_sin (f64 (4627454223509376987))) (f64 (13829626268693347621)) &&
  out_eq64 (ported_cos (f64 (4627454223509376987))) (f64 (4601636341828779778)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0725 :
  out_eq64 (ported_sin (f64 (13849606169549761458))) (f64 (13828228664944262710)) &&
  out_eq64 (ported_cos (f64 (13849606169549761458))) (f64 (4604215783946055353)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0726 :
  out_eq64 (ported_sin (f64 (4627614048635833714))) (f64 (13826216831779600392)) &&
  out_eq64 (ported_cos (f64 (4627614048635833714))) (f64 (4605877472734397393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0727 :
  out_eq64 (ported_sin (f64 (4625732669669491631))) (f64 (13828851918721097098)) &&
  out_eq64 (ported_cos (f64 (4625732669669491631))) (f64 (4603445091155677754)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0728 :
  out_eq64 (ported_sin (f64 (4623684372290187406))) (f64 (4604294992949825830)) &&
  out_eq64 (ported_cos (f64 (4623684372290187406))) (f64 (4604784153793063751)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0729 :
  out_eq64 (ported_sin (f64 (13831400518499405729))) (f64 (13829902090051951098)) &&
  out_eq64 (ported_cos (f64 (13831400518499405729))) (f64 (4600402561327160588)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0730 :
  out_eq64 (ported_sin (f64 (13824040413141553514))) (f64 (13823865821617706592)) &&
  out_eq64 (ported_cos (f64 (13824040413141553514))) (f64 (4606511534985651342)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0731 :
  out_eq64 (ported_sin (f64 (13820417367194220237))) (f64 (13820354757013937826)) &&
  out_eq64 (ported_cos (f64 (13820417367194220237))) (f64 (4606967988877933343)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0732 :
  out_eq64 (ported_sin (f64 (13845705119890902416))) (f64 (4607151718018046042)) &&
  out_eq64 (ported_cos (f64 (13845705119890902416))) (f64 (13813980805195370135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0733 :
  out_eq64 (ported_sin (f64 (4627076455029189738))) (f64 (13827257481729124991)) &&
  out_eq64 (ported_cos (f64 (4627076455029189738))) (f64 (13828513099142019810)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0734 :
  out_eq64 (ported_sin (f64 (13793901435758892414))) (f64 (13793901417292429477)) &&
  out_eq64 (ported_cos (f64 (13793901435758892414))) (f64 (4607182359275441496)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0735 :
  out_eq64 (ported_sin (f64 (13835383201258007053))) (f64 (13829112891326058402)) &&
  out_eq64 (ported_cos (f64 (13835383201258007053))) (f64 (13826435078673928616)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0736 :
  out_eq64 (ported_sin (f64 (4644506063385768158))) (f64 (4598366561790730748)) &&
  out_eq64 (ported_cos (f64 (4644506063385768158))) (f64 (13830243176053389972)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0737 :
  out_eq64 (ported_sin (f64 (4586449194394279524))) (f64 (4586447199118837842)) &&
  out_eq64 (ported_cos (f64 (4586449194394279524))) (f64 (4607173845500443201)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0738 :
  out_eq64 (ported_sin (f64 (4609162040034667504))) (f64 (4607104969652759738)) &&
  out_eq64 (ported_cos (f64 (4609162040034667504))) (f64 (4593882595872720161)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0739 :
  out_eq64 (ported_sin (f64 (13785897505728025876))) (f64 (13785897504815815577)) &&
  out_eq64 (ported_cos (f64 (13785897505728025876))) (f64 (4607182413751652447)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0740 :
  out_eq64 (ported_sin (f64 (13848038227236404700))) (f64 (13827002205504955218)) &&
  out_eq64 (ported_cos (f64 (13848038227236404700))) (f64 (13828714764242916765)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0741 :
  out_eq64 (ported_sin (f64 (4612518379248073778))) (f64 (4604458047084072904)) &&
  out_eq64 (ported_cos (f64 (4612518379248073778))) (f64 (13828001380394239750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0742 :
  out_eq64 (ported_sin (f64 (4555623671062983400))) (f64 (4555623670895844773)) &&
  out_eq64 (ported_cos (f64 (4555623671062983400))) (f64 (4607182418153720600)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0743 :
  out_eq64 (ported_sin (f64 (13849561337282769908))) (f64 (13827186038564861990)) &&
  out_eq64 (ported_cos (f64 (13849561337282769908))) (f64 (4605199020091450116)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0744 :
  out_eq64 (ported_sin (f64 (4604208925974270672))) (f64 (4603767688436916688)) &&
  out_eq64 (ported_cos (f64 (4604208925974270672))) (f64 (4605235951101612665)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0745 :
  out_eq64 (ported_sin (f64 (4625467229688577304))) (f64 (13830102684409680676)) &&
  out_eq64 (ported_cos (f64 (4625467229688577304))) (f64 (13822677231121768326)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0746 :
  out_eq64 (ported_sin (f64 (13836054305072043835))) (f64 (13827344125753861260)) &&
  out_eq64 (ported_cos (f64 (13836054305072043835))) (f64 (13828441162702684737)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0747 :
  out_eq64 (ported_sin (f64 (4620990625871065090))) (f64 (4605211020339571108)) &&
  out_eq64 (ported_cos (f64 (4620990625871065090))) (f64 (13827171058103313894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0748 :
  out_eq64 (ported_sin (f64 (4623639699286508549))) (f64 (4603751831188794117)) &&
  out_eq64 (ported_cos (f64 (4623639699286508549))) (f64 (4605248481946176688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0749 :
  out_eq64 (ported_sin (f64 (4616934971574532103))) (f64 (13830543026347631267)) &&
  out_eq64 (ported_cos (f64 (4616934971574532103))) (f64 (13810790607886205738)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0750 :
  out_eq64 (ported_sin (f64 (4515487695623509718))) (f64 (4515487695623508966)) &&
  out_eq64 (ported_cos (f64 (4515487695623509718))) (f64 (4607182418800014655)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0751 :
  out_eq64 (ported_sin (f64 (4626124394261763906))) (f64 (4601440030763589886)) &&
  out_eq64 (ported_cos (f64 (4626124394261763906))) (f64 (4606301878554227857)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0752 :
  out_eq64 (ported_sin (f64 (4625909439028773147))) (f64 (13822673007220714298)) &&
  out_eq64 (ported_cos (f64 (4625909439028773147))) (f64 (4606731342604110689)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0753 :
  out_eq64 (ported_sin (f64 (13850930876890225573))) (f64 (4604256315552800902)) &&
  out_eq64 (ported_cos (f64 (13850930876890225573))) (f64 (4604819759391035220)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0754 :
  out_eq64 (ported_sin (f64 (4600104629065616110))) (f64 (4599968772016572821)) &&
  out_eq64 (ported_cos (f64 (4600104629065616110))) (f64 (4606614183182842965)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0755 :
  out_eq64 (ported_sin (f64 (4627267049042007876))) (f64 (13830362161021236015)) &&
  out_eq64 (ported_cos (f64 (4627267049042007876))) (f64 (13819945022975389662)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0756 :
  out_eq64 (ported_sin (f64 (13847277733924433279))) (f64 (13829732022539001607)) &&
  out_eq64 (ported_cos (f64 (13847277733924433279))) (f64 (4601192056518347223)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0757 :
  out_eq64 (ported_sin (f64 (13840251397521130974))) (f64 (4607137622887440020)) &&
  out_eq64 (ported_cos (f64 (13840251397521130974))) (f64 (13815214043728276773)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0758 :
  out_eq64 (ported_sin (f64 (4697668230173849455))) (f64 (13826142944178197029)) &&
  out_eq64 (ported_cos (f64 (4697668230173849455))) (f64 (13829293822882076189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0759 :
  out_eq64 (ported_sin (f64 (4616320085453317742))) (f64 (13828998919731728460)) &&
  out_eq64 (ported_cos (f64 (4616320085453317742))) (f64 (13826607133078980131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0760 :
  out_eq64 (ported_sin (f64 (13840132465853019408))) (f64 (4606993069887765439)) &&
  out_eq64 (ported_cos (f64 (13840132465853019408))) (f64 (13819888693755810247)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0761 :
  out_eq64 (ported_sin (f64 (4671722655165577715))) (f64 (4606981315907431421)) &&
  out_eq64 (ported_cos (f64 (4671722655165577715))) (f64 (4596738811821198057)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0762 :
  out_eq64 (ported_sin (f64 (4611745359752287153))) (f64 (4606263831487881564)) &&
  out_eq64 (ported_cos (f64 (4611745359752287153))) (f64 (13824969310122797933)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0763 :
  out_eq64 (ported_sin (f64 (4618544700669259820))) (f64 (13819395772374100080)) &&
  out_eq64 (ported_cos (f64 (4618544700669259820))) (f64 (4607017848478940105)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0764 :
  out_eq64 (ported_sin (f64 (4495224527630676917))) (f64 (4495224527630676916)) &&
  out_eq64 (ported_cos (f64 (4495224527630676917))) (f64 (4607182418800017403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0765 :
  out_eq64 (ported_sin (f64 (13765500645470566392))) (f64 (13765500645467937168)) &&
  out_eq64 (ported_cos (f64 (13765500645470566392))) (f64 (4607182418789873488)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0766 :
  out_eq64 (ported_sin (f64 (4602650677003550684))) (f64 (4602283475020452239)) &&
  out_eq64 (ported_cos (f64 (4602650677003550684))) (f64 (4606086516931786002)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0767 :
  out_eq64 (ported_sin (f64 (13917285214666196080))) (f64 (13824542660177110422)) &&
  out_eq64 (ported_cos (f64 (13917285214666196080))) (f64 (13829736937431673565)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0768 :
  out_eq64 (ported_sin (f64 (13850202956578806778))) (f64 (13819190467510906704)) &&
  out_eq64 (ported_cos (f64 (13850202956578806778))) (f64 (13830399679290859037)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0769 :
  out_eq64 (ported_sin (f64 (4644141125386440736))) (f64 (4605671486836671873)) &&
  out_eq64 (ported_cos (f64 (4644141125386440736))) (f64 (4603168776905571910)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0770 :
  out_eq64 (ported_sin (f64 (13849468126817094724))) (f64 (13823141191638062357)) &&
  out_eq64 (ported_cos (f64 (13849468126817094724))) (f64 (4606650752304694764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0771 :
  out_eq64 (ported_sin (f64 (13767663241257929280))) (f64 (13767663241254825978)) &&
  out_eq64 (ported_cos (f64 (13767663241257929280))) (f64 (4607182418782033246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0772 :
  out_eq64 (ported_sin (f64 (4627584465303156664))) (f64 (13826999090715502629)) &&
  out_eq64 (ported_cos (f64 (4627584465303156664))) (f64 (4605345096881150726)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0773 :
  out_eq64 (ported_sin (f64 (13845196304196991321))) (f64 (4603144256282361405)) &&
  out_eq64 (ported_cos (f64 (13845196304196991321))) (f64 (13829059800065157036)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0774 :
  out_eq64 (ported_sin (f64 (4623970552907108772))) (f64 (4606737975076009910)) &&
  out_eq64 (ported_cos (f64 (4623970552907108772))) (f64 (4599260486041011625)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0775 :
  out_eq64 (ported_sin (f64 (13846914563133881510))) (f64 (13825601354741386953)) &&
  out_eq64 (ported_cos (f64 (13846914563133881510))) (f64 (4606101195181354999)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0776 :
  out_eq64 (ported_sin (f64 (4643813430281505494))) (f64 (4606587798965400103)) &&
  out_eq64 (ported_cos (f64 (4643813430281505494))) (f64 (4600108434631634472)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0777 :
  out_eq64 (ported_sin (f64 (4618497834821933996))) (f64 (13820861714790389810)) &&
  out_eq64 (ported_cos (f64 (4618497834821933996))) (f64 (4606938866862004096)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0778 :
  out_eq64 (ported_sin (f64 (13848225665133246165))) (f64 (13822669147560358782)) &&
  out_eq64 (ported_cos (f64 (13848225665133246165))) (f64 (13830104014066601326)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0779 :
  out_eq64 (ported_sin (f64 (13850087018000227271))) (f64 (13826614853978648639)) &&
  out_eq64 (ported_cos (f64 (13850087018000227271))) (f64 (13828993671188123759)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0780 :
  out_eq64 (ported_sin (f64 (4611067693251030903))) (f64 (4606801383309151811)) &&
  out_eq64 (ported_cos (f64 (4611067693251030903))) (f64 (13822227839305505883)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0781 :
  out_eq64 (ported_sin (f64 (4500235209100788584))) (f64 (4500235209100788579)) &&
  out_eq64 (ported_cos (f64 (4500235209100788584))) (f64 (4607182418800017383)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0782 :
  out_eq64 (ported_sin (f64 (13844184206145773107))) (f64 (13829985542500751674)) &&
  out_eq64 (ported_cos (f64 (13844184206145773107))) (f64 (13823344439612091179)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0783 :
  out_eq64 (ported_sin (f64 (13883270824088398541))) (f64 (4604773913890239091)) &&
  out_eq64 (ported_cos (f64 (13883270824088398541))) (f64 (4604306032815664310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0784 :
  out_eq64 (ported_sin (f64 (13846652910110903302))) (f64 (13807740865411872090)) &&
  out_eq64 (ported_cos (f64 (13846652910110903302))) (f64 (4607178303741071035)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0785 :
  out_eq64 (ported_sin (f64 (4627030297933757077))) (f64 (13826036567153966536)) &&
  out_eq64 (ported_cos (f64 (4627030297933757077))) (f64 (13829351840253990348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0786 :
  out_eq64 (ported_sin (f64 (13840585940559898461))) (f64 (4607007568892855085)) &&
  out_eq64 (ported_cos (f64 (13840585940559898461))) (f64 (4596232572270026653)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0787 :
  out_eq64 (ported_sin (f64 (4626507191721293613))) (f64 (4606934781098452996)) &&
  out_eq64 (ported_cos (f64 (4626507191721293613))) (f64 (13820930260776420431)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0788 :
  out_eq64 (ported_sin (f64 (4624777101098750231))) (f64 (4601564457909276799)) &&
  out_eq64 (ported_cos (f64 (4624777101098750231))) (f64 (13829643886286931073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0789 :
  out_eq64 (ported_sin (f64 (13831103153681255849))) (f64 (13829661829536012337)) &&
  out_eq64 (ported_cos (f64 (13831103153681255849))) (f64 (4601490402747927772)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0790 :
  out_eq64 (ported_sin (f64 (4636587141553801384))) (f64 (13825312288668868144)) &&
  out_eq64 (ported_cos (f64 (4636587141553801384))) (f64 (13829549572943150781)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0791 :
  out_eq64 (ported_sin (f64 (13803600439985218564))) (f64 (13803600248361505858)) &&
  out_eq64 (ported_cos (f64 (13803600439985218564))) (f64 (4607181286065466694)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0792 :
  out_eq64 (ported_sin (f64 (4622011540538340374))) (f64 (13828697181763448956)) &&
  out_eq64 (ported_cos (f64 (4622011540538340374))) (f64 (13827025230999524441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0793 :
  out_eq64 (ported_sin (f64 (4625122962253958947))) (f64 (13818310111185189757)) &&
  out_eq64 (ported_cos (f64 (4625122962253958947))) (f64 (13830438195224954900)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0794 :
  out_eq64 (ported_sin (f64 (4485938477953328875))) (f64 (4485938477953328875)) &&
  out_eq64 (ported_cos (f64 (4485938477953328875))) (f64 (4607182418800017408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0795 :
  out_eq64 (ported_sin (f64 (13848688489538805908))) (f64 (4604094541616206055)) &&
  out_eq64 (ported_cos (f64 (13848688489538805908))) (f64 (13828336311167485753)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0796 :
  out_eq64 (ported_sin (f64 (13835353013456934648))) (f64 (13829177736035013574)) &&
  out_eq64 (ported_cos (f64 (13835353013456934648))) (f64 (13826333217009485484)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0797 :
  out_eq64 (ported_sin (f64 (13847708559552294753))) (f64 (13830054805345868617)) &&
  out_eq64 (ported_cos (f64 (13847708559552294753))) (f64 (13822960158897804328)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0798 :
  out_eq64 (ported_sin (f64 (13847197081706858105))) (f64 (13829111293409217815)) &&
  out_eq64 (ported_cos (f64 (13847197081706858105))) (f64 (4603065514274490591)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0799 :
  out_eq64 (ported_sin (f64 (4625535099930075479))) (f64 (13830527809734950517)) &&
  out_eq64 (ported_cos (f64 (4625535099930075479))) (f64 (13813574978410186715)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0800 :
  out_eq64 (ported_sin (f64 (4623683587531991370))) (f64 (4604285774082316199)) &&
  out_eq64 (ported_cos (f64 (4623683587531991370))) (f64 (4604792678397771776)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0801 :
  out_eq64 (ported_sin (f64 (4603933194606780782))) (f64 (4603548956552576127)) &&
  out_eq64 (ported_cos (f64 (4603933194606780782))) (f64 (4605403814774709603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0802 :
  out_eq64 (ported_sin (f64 (4559448446778201793))) (f64 (4559448446286165629)) &&
  out_eq64 (ported_cos (f64 (4559448446778201793))) (f64 (4607182416692689448)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0803 :
  out_eq64 (ported_sin (f64 (4625677464087729572))) (f64 (13829738839171410437)) &&
  out_eq64 (ported_cos (f64 (4625677464087729572))) (f64 (4601162310170371037)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0804 :
  out_eq64 (ported_sin (f64 (4626761689430092292))) (f64 (4601207584167520627)) &&
  out_eq64 (ported_cos (f64 (4626761689430092292))) (f64 (13829728451246878630)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0805 :
  out_eq64 (ported_sin (f64 (13825828616968555752))) (f64 (13825484534091438728)) &&
  out_eq64 (ported_cos (f64 (13825828616968555752))) (f64 (4606132451220741828)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0806 :
  out_eq64 (ported_sin (f64 (13844639913067422249))) (f64 (13824124765063668771)) &&
  out_eq64 (ported_cos (f64 (13844639913067422249))) (f64 (13829829412807500427)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0807 :
  out_eq64 (ported_sin (f64 (13899874964877587432))) (f64 (4606288937630367973)) &&
  out_eq64 (ported_cos (f64 (13899874964877587432))) (f64 (4601493951347924693)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0808 :
  out_eq64 (ported_sin (f64 (13850102968266395877))) (f64 (13826184981654146643)) &&
  out_eq64 (ported_cos (f64 (13850102968266395877))) (f64 (13829268729244150138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0809 :
  out_eq64 (ported_sin (f64 (13843600872552398749))) (f64 (13830236641002752007)) &&
  out_eq64 (ported_cos (f64 (13843600872552398749))) (f64 (4598414713271813520)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0810 :
  out_eq64 (ported_sin (f64 (4653534646730186280))) (f64 (13827111765806553061)) &&
  out_eq64 (ported_cos (f64 (4653534646730186280))) (f64 (13828630043526570314)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0811 :
  out_eq64 (ported_sin (f64 (13839244410248490301))) (f64 (4604097633090344964)) &&
  out_eq64 (ported_cos (f64 (13839244410248490301))) (f64 (13828333614496689571)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0812 :
  out_eq64 (ported_sin (f64 (4623702080654553549))) (f64 (4604499824255968729)) &&
  out_eq64 (ported_cos (f64 (4623702080654553549))) (f64 (4604588410144977573)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0813 :
  out_eq64 (ported_sin (f64 (4627346021491578008))) (f64 (13830530095879864184)) &&
  out_eq64 (ported_cos (f64 (4627346021491578008))) (f64 (4589960355977200606)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0814 :
  out_eq64 (ported_sin (f64 (13921881581503033479))) (f64 (13821659135128408351)) &&
  out_eq64 (ported_cos (f64 (13921881581503033479))) (f64 (13830253804412988318)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0815 :
  out_eq64 (ported_sin (f64 (4625144042257666026))) (f64 (13819637461623932151)) &&
  out_eq64 (ported_cos (f64 (4625144042257666026))) (f64 (13830377959459196774)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0816 :
  out_eq64 (ported_sin (f64 (4491180828107976710))) (f64 (4491180828107976710)) &&
  out_eq64 (ported_cos (f64 (4491180828107976710))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0817 :
  out_eq64 (ported_sin (f64 (4624210080311490202))) (f64 (4607127944524347796)) &&
  out_eq64 (ported_cos (f64 (4624210080311490202))) (f64 (13815949399276727728)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0818 :
  out_eq64 (ported_sin (f64 (4624202562597777816))) (f64 (4607140354678614944)) &&
  out_eq64 (ported_cos (f64 (4624202562597777816))) (f64 (13814992274447496498)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0819 :
  out_eq64 (ported_sin (f64 (13902622436677348235))) (f64 (13824228892913633012)) &&
  out_eq64 (ported_cos (f64 (13902622436677348235))) (f64 (13829806961831500646)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0820 :
  out_eq64 (ported_sin (f64 (4621164694347299934))) (f64 (4603166001663843655)) &&
  out_eq64 (ported_cos (f64 (4621164694347299934))) (f64 (13829045371647205750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0821 :
  out_eq64 (ported_sin (f64 (4621892191117369692))) (f64 (13827384409394158031)) &&
  out_eq64 (ported_cos (f64 (4621892191117369692))) (f64 (13828407087545059242)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0822 :
  out_eq64 (ported_sin (f64 (4608876135082847348))) (f64 (4607012207101818491)) &&
  out_eq64 (ported_cos (f64 (4608876135082847348))) (f64 (4596139148566649363)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0823 :
  out_eq64 (ported_sin (f64 (4623098207656324562))) (f64 (13822268235541408574)) &&
  out_eq64 (ported_cos (f64 (4623098207656324562))) (f64 (4606795288140534162)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0824 :
  out_eq64 (ported_sin (f64 (13831399670665183615))) (f64 (13829901456330435692)) &&
  out_eq64 (ported_cos (f64 (13831399670665183615))) (f64 (4600405706919953796)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0825 :
  out_eq64 (ported_sin (f64 (13855421386311557376))) (f64 (4607182326922404983)) &&
  out_eq64 (ported_cos (f64 (13855421386311557376))) (f64 (13795229490864428885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0826 :
  out_eq64 (ported_sin (f64 (4626126497694861469))) (f64 (4601561272071613514)) &&
  out_eq64 (ported_cos (f64 (4626126497694861469))) (f64 (4606272625650812989)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0827 :
  out_eq64 (ported_sin (f64 (13847046881607299668))) (f64 (13827554307085035538)) &&
  out_eq64 (ported_cos (f64 (13847046881607299668))) (f64 (4604886775287624696)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0828 :
  out_eq64 (ported_sin (f64 (13848086976963660611))) (f64 (13826361856304967815)) &&
  out_eq64 (ported_cos (f64 (13848086976963660611))) (f64 (13829159697938099887)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0829 :
  out_eq64 (ported_sin (f64 (13845080004426029956))) (f64 (4600316372590931347)) &&
  out_eq64 (ported_cos (f64 (13845080004426029956))) (f64 (13829919320296917025)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0830 :
  out_eq64 (ported_sin (f64 (4622446827613290246))) (f64 (13830490259661744032)) &&
  out_eq64 (ported_cos (f64 (4622446827613290246))) (f64 (4593252155455442072)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0831 :
  out_eq64 (ported_sin (f64 (4622164009739044032))) (f64 (13829902123298334050)) &&
  out_eq64 (ported_cos (f64 (4622164009739044032))) (f64 (13823774433110252690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0832 :
  out_eq64 (ported_sin (f64 (13844495129321304084))) (f64 (13827078021841560851)) &&
  out_eq64 (ported_cos (f64 (13844495129321304084))) (f64 (13828656424568383914)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0833 :
  out_eq64 (ported_sin (f64 (13851061443850866750))) (f64 (4598602956465311476)) &&
  out_eq64 (ported_cos (f64 (13851061443850866750))) (f64 (4606838366685817332)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0834 :
  out_eq64 (ported_sin (f64 (13849689185018744098))) (f64 (13829696007319948231)) &&
  out_eq64 (ported_cos (f64 (13849689185018744098))) (f64 (4601346904110716156)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0835 :
  out_eq64 (ported_sin (f64 (13841773543284494951))) (f64 (4599314979883323922)) &&
  out_eq64 (ported_cos (f64 (13841773543284494951))) (f64 (4606729035096817495)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0836 :
  out_eq64 (ported_sin (f64 (13893766861626136159))) (f64 (13826867171080001118)) &&
  out_eq64 (ported_cos (f64 (13893766861626136159))) (f64 (13828815553739365671)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0837 :
  out_eq64 (ported_sin (f64 (13786040924923627316))) (f64 (13786040923928649018)) &&
  out_eq64 (ported_cos (f64 (13786040924923627316))) (f64 (4607182413450723006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0838 :
  out_eq64 (ported_sin (f64 (4526371346097811686))) (f64 (4526371346097798811)) &&
  out_eq64 (ported_cos (f64 (4526371346097811686))) (f64 (4607182418799944280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0839 :
  out_eq64 (ported_sin (f64 (13836282360736853144))) (f64 (13826617420182156657)) &&
  out_eq64 (ported_cos (f64 (13836282360736853144))) (f64 (13828991924131874992)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0840 :
  out_eq64 (ported_sin (f64 (4622337496668306093))) (f64 (13830529304527265066)) &&
  out_eq64 (ported_cos (f64 (4622337496668306093))) (f64 (13813417608948860796)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0841 :
  out_eq64 (ported_sin (f64 (4627686652865771713))) (f64 (13822144286046673938)) &&
  out_eq64 (ported_cos (f64 (4627686652865771713))) (f64 (4606813826705399517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0842 :
  out_eq64 (ported_sin (f64 (4626473281464579169))) (f64 (4607123378801804366)) &&
  out_eq64 (ported_cos (f64 (4626473281464579169))) (f64 (13816273289275532378)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0843 :
  out_eq64 (ported_sin (f64 (13835685444887564591))) (f64 (13828390752217866845)) &&
  out_eq64 (ported_cos (f64 (13835685444887564591))) (f64 (13827403552448422770)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0844 :
  out_eq64 (ported_sin (f64 (4664882950198407891))) (f64 (4606739365325150695)) &&
  out_eq64 (ported_cos (f64 (4664882950198407891))) (f64 (13822623995642559884)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0845 :
  out_eq64 (ported_sin (f64 (4622783819047938873))) (f64 (13828330312695289185)) &&
  out_eq64 (ported_cos (f64 (4622783819047938873))) (f64 (4604101414421438767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0846 :
  out_eq64 (ported_sin (f64 (4622197956419770740))) (f64 (13830089752375741523)) &&
  out_eq64 (ported_cos (f64 (4622197956419770740))) (f64 (13822755189288544285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0847 :
  out_eq64 (ported_sin (f64 (13845564803744743694))) (f64 (4606691027168214343)) &&
  out_eq64 (ported_cos (f64 (13845564803744743694))) (f64 (13822912441636252374)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0848 :
  out_eq64 (ported_sin (f64 (13850531120532211762))) (f64 (4605656788437114635)) &&
  out_eq64 (ported_cos (f64 (13850531120532211762))) (f64 (13826562808745635442)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0849 :
  out_eq64 (ported_sin (f64 (13849883426049307620))) (f64 (13830274565592336546)) &&
  out_eq64 (ported_cos (f64 (13849883426049307620))) (f64 (13821451813584421319)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0850 :
  out_eq64 (ported_sin (f64 (13827755008641763142))) (f64 (13827275107066216746)) &&
  out_eq64 (ported_cos (f64 (13827755008641763142))) (f64 (4605126576618591333)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0851 :
  out_eq64 (ported_sin (f64 (13822895730276209433))) (f64 (13822793342839292681)) &&
  out_eq64 (ported_cos (f64 (13822895730276209433))) (f64 (4606711314433951310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0852 :
  out_eq64 (ported_sin (f64 (13835584602420224101))) (f64 (13828646066129801321)) &&
  out_eq64 (ported_cos (f64 (13835584602420224101))) (f64 (13827091310768060012)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0853 :
  out_eq64 (ported_sin (f64 (4626141719359720329))) (f64 (4602425098186775258)) &&
  out_eq64 (ported_cos (f64 (4626141719359720329))) (f64 (4606047563094926339)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0854 :
  out_eq64 (ported_sin (f64 (13848609364095224908))) (f64 (4601278704243669445)) &&
  out_eq64 (ported_cos (f64 (13848609364095224908))) (f64 (13829711979630498398)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0855 :
  out_eq64 (ported_sin (f64 (13850128491000483706))) (f64 (13824882631735172508)) &&
  out_eq64 (ported_cos (f64 (13850128491000483706))) (f64 (13829656957769336259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0856 :
  out_eq64 (ported_sin (f64 (13846373597398201806))) (f64 (4601764657768997466)) &&
  out_eq64 (ported_cos (f64 (13846373597398201806))) (f64 (4606222288763308939)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0857 :
  out_eq64 (ported_sin (f64 (13849284805000643234))) (f64 (4599098187974666586)) &&
  out_eq64 (ported_cos (f64 (13849284805000643234))) (f64 (4606764033677387023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0858 :
  out_eq64 (ported_sin (f64 (13877071340604935331))) (f64 (4600777615198721638)) &&
  out_eq64 (ported_cos (f64 (13877071340604935331))) (f64 (13829824082251902852)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0859 :
  out_eq64 (ported_sin (f64 (13884843962304653459))) (f64 (4599487944065617948)) &&
  out_eq64 (ported_cos (f64 (13884843962304653459))) (f64 (13830072057381118713)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0860 :
  out_eq64 (ported_sin (f64 (4622950818693129884))) (f64 (13826301694546303185)) &&
  out_eq64 (ported_cos (f64 (4622950818693129884))) (f64 (4605825380087910826)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0861 :
  out_eq64 (ported_sin (f64 (13836180125143317320))) (f64 (13826950080113656126)) &&
  out_eq64 (ported_cos (f64 (13836180125143317320))) (f64 (13828754137440719263)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0862 :
  out_eq64 (ported_sin (f64 (4623519850516382867))) (f64 (4601584028552688601)) &&
  out_eq64 (ported_cos (f64 (4623519850516382867))) (f64 (4606267072597183674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0863 :
  out_eq64 (ported_sin (f64 (13848901361592528531))) (f64 (4607139679014041220)) &&
  out_eq64 (ported_cos (f64 (13848901361592528531))) (f64 (13815047784798755885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0864 :
  out_eq64 (ported_sin (f64 (13844305982709714055))) (f64 (13829112695760538821)) &&
  out_eq64 (ported_cos (f64 (13844305982709714055))) (f64 (13826435381367502098)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0865 :
  out_eq64 (ported_sin (f64 (4624462221399569301))) (f64 (4605816509431297278)) &&
  out_eq64 (ported_cos (f64 (4624462221399569301))) (f64 (13826315938324064556)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0866 :
  out_eq64 (ported_sin (f64 (13849530809687870365))) (f64 (13826392628114620846)) &&
  out_eq64 (ported_cos (f64 (13849530809687870365))) (f64 (4605768111705860880)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0867 :
  out_eq64 (ported_sin (f64 (13847060686415417346))) (f64 (13827717067087162434)) &&
  out_eq64 (ported_cos (f64 (13847060686415417346))) (f64 (4604737465692734413)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0868 :
  out_eq64 (ported_sin (f64 (4624910709743410563))) (f64 (4596896637623410280)) &&
  out_eq64 (ported_cos (f64 (4624910709743410563))) (f64 (13830344779804239952)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0869 :
  out_eq64 (ported_sin (f64 (4622533939741278544))) (f64 (13830217953822467431)) &&
  out_eq64 (ported_cos (f64 (4622533939741278544))) (f64 (4598549588603139136)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0870 :
  out_eq64 (ported_sin (f64 (13850298714237927712))) (f64 (4594714093765318659)) &&
  out_eq64 (ported_cos (f64 (13850298714237927712))) (f64 (13830447099388997355)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0871 :
  out_eq64 (ported_sin (f64 (4623054648045663711))) (f64 (13823585269314173622)) &&
  out_eq64 (ported_cos (f64 (4623054648045663711))) (f64 (4606567565150281948)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0872 :
  out_eq64 (ported_sin (f64 (4657324680469798688))) (f64 (13824449874712656125)) &&
  out_eq64 (ported_cos (f64 (4657324680469798688))) (f64 (13829758018993807266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0873 :
  out_eq64 (ported_sin (f64 (4614446577601264226))) (f64 (13814106728249031925)) &&
  out_eq64 (ported_cos (f64 (4614446577601264226))) (f64 (13830522438041481972)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0874 :
  out_eq64 (ported_sin (f64 (13805162992676130464))) (f64 (13805162529725882774)) &&
  out_eq64 (ported_cos (f64 (13805162992676130464))) (f64 (4607180379346448779)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0875 :
  out_eq64 (ported_sin (f64 (4626632347321676311))) (f64 (4605180813058839731)) &&
  out_eq64 (ported_cos (f64 (4626632347321676311))) (f64 (13827208642973792467)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0876 :
  out_eq64 (ported_sin (f64 (13849581057191978063))) (f64 (13827663885171762263)) &&
  out_eq64 (ported_cos (f64 (13849581057191978063))) (f64 (4604787064286624750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0877 :
  out_eq64 (ported_sin (f64 (13818544835608847893))) (f64 (13818517074488269573)) &&
  out_eq64 (ported_cos (f64 (13818544835608847893))) (f64 (4607057608998274417)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0878 :
  out_eq64 (ported_sin (f64 (13850356206097504357))) (f64 (4599997410567190538)) &&
  out_eq64 (ported_cos (f64 (13850356206097504357))) (f64 (13829980863669777469)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0879 :
  out_eq64 (ported_sin (f64 (4627396322625552745))) (f64 (13830269367779590505)) &&
  out_eq64 (ported_cos (f64 (4627396322625552745))) (f64 (4598160827636440707)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0880 :
  out_eq64 (ported_sin (f64 (4627032958692747777))) (f64 (13826117285663939235)) &&
  out_eq64 (ported_cos (f64 (4627032958692747777))) (f64 (13829308987582064586)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0881 :
  out_eq64 (ported_sin (f64 (13842707151383174340))) (f64 (13825846942893533592)) &&
  out_eq64 (ported_cos (f64 (13842707151383174340))) (f64 (4606033665751951812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0882 :
  out_eq64 (ported_sin (f64 (4622737876952155976))) (f64 (13828790834714018528)) &&
  out_eq64 (ported_cos (f64 (4622737876952155976))) (f64 (4603528742835974212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0883 :
  out_eq64 (ported_sin (f64 (13722502463276321466))) (f64 (13722502463276321463)) &&
  out_eq64 (ported_cos (f64 (13722502463276321466))) (f64 (4607182418800017392)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0884 :
  out_eq64 (ported_sin (f64 (4621986055142344888))) (f64 (13828441946658743032)) &&
  out_eq64 (ported_cos (f64 (4621986055142344888))) (f64 (13827343193308898003)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0885 :
  out_eq64 (ported_sin (f64 (4625473611509588498))) (f64 (13830164344455575895)) &&
  out_eq64 (ported_cos (f64 (4625473611509588498))) (f64 (13822287865715108779)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0886 :
  out_eq64 (ported_sin (f64 (13835427311722599186))) (f64 (13829015698462708388)) &&
  out_eq64 (ported_cos (f64 (13835427311722599186))) (f64 (13826582334509809293)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0887 :
  out_eq64 (ported_sin (f64 (13835455353375574997))) (f64 (13828952419193515763)) &&
  out_eq64 (ported_cos (f64 (13835455353375574997))) (f64 (13826674946173908473)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0888 :
  out_eq64 (ported_sin (f64 (4611846993315931936))) (f64 (4606076795223803328)) &&
  out_eq64 (ported_cos (f64 (4611846993315931936))) (f64 (13825691139692264433)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0889 :
  out_eq64 (ported_sin (f64 (4621264239850242386))) (f64 (4600859576537669110)) &&
  out_eq64 (ported_cos (f64 (4621264239850242386))) (f64 (13829806370052418761)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0890 :
  out_eq64 (ported_sin (f64 (13841218509512846814))) (f64 (4604708964191806672)) &&
  out_eq64 (ported_cos (f64 (13841218509512846814))) (f64 (4604375204973367670)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0891 :
  out_eq64 (ported_sin (f64 (4630937060329537711))) (f64 (4587914033301726060)) &&
  out_eq64 (ported_cos (f64 (4630937060329537711))) (f64 (13830541411432127812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0892 :
  out_eq64 (ported_sin (f64 (4621177733754298221))) (f64 (4602991002313406410)) &&
  out_eq64 (ported_cos (f64 (4621177733754298221))) (f64 (13829158949690299073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0893 :
  out_eq64 (ported_sin (f64 (13845367095225330241))) (f64 (4605161718235027880)) &&
  out_eq64 (ported_cos (f64 (13845367095225330241))) (f64 (13827232190390232564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0894 :
  out_eq64 (ported_sin (f64 (4626425169136921515))) (f64 (4607168112101221338)) &&
  out_eq64 (ported_cos (f64 (4626425169136921515))) (f64 (4588280279411221518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0895 :
  out_eq64 (ported_sin (f64 (4614391996972899311))) (f64 (13812189430798006340)) &&
  out_eq64 (ported_cos (f64 (4614391996972899311))) (f64 (13830538191761317991)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0896 :
  out_eq64 (ported_sin (f64 (4626183460709453638))) (f64 (4603667076930084166)) &&
  out_eq64 (ported_cos (f64 (4626183460709453638))) (f64 (4605314487076300818)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0897 :
  out_eq64 (ported_sin (f64 (4626111079670979464))) (f64 (4600662798354680063)) &&
  out_eq64 (ported_cos (f64 (4626111079670979464))) (f64 (4606476454057739170)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0898 :
  out_eq64 (ported_sin (f64 (4639905516356834719))) (f64 (13830264670294544499)) &&
  out_eq64 (ported_cos (f64 (4639905516356834719))) (f64 (4598204315983922133)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0899 :
  out_eq64 (ported_sin (f64 (13848686920558639303))) (f64 (4604056606729358227)) &&
  out_eq64 (ported_cos (f64 (13848686920558639303))) (f64 (13828369200639455307)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0900 :
  out_eq64 (ported_sin (f64 (13847292934141545274))) (f64 (13829830556504079220)) &&
  out_eq64 (ported_cos (f64 (13847292934141545274))) (f64 (4600747375086432608)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0901 :
  out_eq64 (ported_sin (f64 (13850973204492480090))) (f64 (4603192257586422130)) &&
  out_eq64 (ported_cos (f64 (13850973204492480090))) (f64 (4605655792231127645)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0902 :
  out_eq64 (ported_sin (f64 (4519457090727408221))) (f64 (4519457090727405819)) &&
  out_eq64 (ported_cos (f64 (4519457090727408221))) (f64 (4607182418800007931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0903 :
  out_eq64 (ported_sin (f64 (4620988784842787116))) (f64 (4605229374331859855)) &&
  out_eq64 (ported_cos (f64 (4620988784842787116))) (f64 (13827148018728657915)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0904 :
  out_eq64 (ported_sin (f64 (13848709488482164064))) (f64 (4604584092587759539)) &&
  out_eq64 (ported_cos (f64 (13848709488482164064))) (f64 (13827876236155110681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0905 :
  out_eq64 (ported_sin (f64 (4613737921735783961))) (f64 (4597394563551796677)) &&
  out_eq64 (ported_cos (f64 (4613737921735783961))) (f64 (13830316514495111862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0906 :
  out_eq64 (ported_sin (f64 (4626999273561902437))) (f64 (13824265024627473930)) &&
  out_eq64 (ported_cos (f64 (4626999273561902437))) (f64 (13829799080440290246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0907 :
  out_eq64 (ported_sin (f64 (4624075586753197240))) (f64 (4607107725923192360)) &&
  out_eq64 (ported_cos (f64 (4624075586753197240))) (f64 (4593798300149200836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0908 :
  out_eq64 (ported_sin (f64 (4620714260107917880))) (f64 (4607031366386412658)) &&
  out_eq64 (ported_cos (f64 (4620714260107917880))) (f64 (13819110660213936502)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0909 :
  out_eq64 (ported_sin (f64 (4616576535289311949))) (f64 (13829949020207884987)) &&
  out_eq64 (ported_cos (f64 (4616576535289311949))) (f64 (13823536731031304738)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0910 :
  out_eq64 (ported_sin (f64 (4624048298610970524))) (f64 (4607041144249752949)) &&
  out_eq64 (ported_cos (f64 (4624048298610970524))) (f64 (4595524141811286128)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0911 :
  out_eq64 (ported_sin (f64 (4617326717033821887))) (f64 (13830158637532220935)) &&
  out_eq64 (ported_cos (f64 (4617326717033821887))) (f64 (4598953192945379990)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0912 :
  out_eq64 (ported_sin (f64 (13848904991435931359))) (f64 (4607150235388844133)) &&
  out_eq64 (ported_cos (f64 (13848904991435931359))) (f64 (13814122396839702749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0913 :
  out_eq64 (ported_sin (f64 (13850913385448140883))) (f64 (4604657217698823109)) &&
  out_eq64 (ported_cos (f64 (13850913385448140883))) (f64 (4604429285291015258)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0914 :
  out_eq64 (ported_sin (f64 (13841061763792316778))) (f64 (4605506113943077971)) &&
  out_eq64 (ported_cos (f64 (13841061763792316778))) (f64 (4603408538352963223)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0915 :
  out_eq64 (ported_sin (f64 (13845216124470520781))) (f64 (4603405622886605259)) &&
  out_eq64 (ported_cos (f64 (13845216124470520781))) (f64 (13828880231192155546)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0916 :
  out_eq64 (ported_sin (f64 (13850223459717158403))) (f64 (13816147957995544545)) &&
  out_eq64 (ported_cos (f64 (13850223459717158403))) (f64 (13830497204390942189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0917 :
  out_eq64 (ported_sin (f64 (13843861523421219489))) (f64 (13830548960967501288)) &&
  out_eq64 (ported_cos (f64 (13843861523421219489))) (f64 (4585193915860370634)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0918 :
  out_eq64 (ported_sin (f64 (4622550487897814196))) (f64 (13830142523283489840)) &&
  out_eq64 (ported_cos (f64 (4622550487897814196))) (f64 (4599057165616193996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0919 :
  out_eq64 (ported_sin (f64 (13840655408108253992))) (f64 (4606881861722158804)) &&
  out_eq64 (ported_cos (f64 (13840655408108253992))) (f64 (4598286387698992808)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0920 :
  out_eq64 (ported_sin (f64 (4617092327142969891))) (f64 (13830518503121996328)) &&
  out_eq64 (ported_cos (f64 (4617092327142969891))) (f64 (4591096195129926543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0921 :
  out_eq64 (ported_sin (f64 (13835678346549395681))) (f64 (13828409178960555647)) &&
  out_eq64 (ported_cos (f64 (13835678346549395681))) (f64 (13827381950666957803)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0922 :
  out_eq64 (ported_sin (f64 (13844282489028720936))) (f64 (13829310046213095428)) &&
  out_eq64 (ported_cos (f64 (13844282489028720936))) (f64 (13826115487210017866)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0923 :
  out_eq64 (ported_sin (f64 (13848529506216915322))) (f64 (4597105822190908682)) &&
  out_eq64 (ported_cos (f64 (13848529506216915322))) (f64 (13830333131127505866)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0924 :
  out_eq64 (ported_sin (f64 (4625675575432014715))) (f64 (13829763785297492988)) &&
  out_eq64 (ported_cos (f64 (4625675575432014715))) (f64 (4601052213740120374)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0925 :
  out_eq64 (ported_sin (f64 (4587446817496548348))) (f64 (4587443714076159303)) &&
  out_eq64 (ported_cos (f64 (4587446817496548348))) (f64 (4607170910115779709)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0926 :
  out_eq64 (ported_sin (f64 (13850717117583863583))) (f64 (4607160221397653177)) &&
  out_eq64 (ported_cos (f64 (13850717117583863583))) (f64 (4589720142980810865)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0927 :
  out_eq64 (ported_sin (f64 (13847472253001277289))) (f64 (13830521843438102594)) &&
  out_eq64 (ported_cos (f64 (13847472253001277289))) (f64 (4590790696718662088)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0928 :
  out_eq64 (ported_sin (f64 (4610073423095616055))) (f64 (4607159638975118381)) &&
  out_eq64 (ported_cos (f64 (4610073423095616055))) (f64 (13813157994307834105)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0929 :
  out_eq64 (ported_sin (f64 (4620494933201418754))) (f64 (4607178340528155732)) &&
  out_eq64 (ported_cos (f64 (4620494933201418754))) (f64 (4584329810746028836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0930 :
  out_eq64 (ported_sin (f64 (13840023855434259284))) (f64 (4606775126474739601)) &&
  out_eq64 (ported_cos (f64 (13840023855434259284))) (f64 (13822399490683167666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0931 :
  out_eq64 (ported_sin (f64 (13817148982248275623))) (f64 (13817136422156186679)) &&
  out_eq64 (ported_cos (f64 (13817148982248275623))) (f64 (4607108820594547179)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0932 :
  out_eq64 (ported_sin (f64 (13864178918440913608))) (f64 (4604827067762999111)) &&
  out_eq64 (ported_cos (f64 (13864178918440913608))) (f64 (4604248320376234691)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0933 :
  out_eq64 (ported_sin (f64 (4616203034997435598))) (f64 (13828433600803898244)) &&
  out_eq64 (ported_cos (f64 (4616203034997435598))) (f64 (13827353106825805998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0934 :
  out_eq64 (ported_sin (f64 (4625153408572992392))) (f64 (13820224150243363827)) &&
  out_eq64 (ported_cos (f64 (4625153408572992392))) (f64 (13830347217081406741)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0935 :
  out_eq64 (ported_sin (f64 (13845000584328201046))) (f64 (4597616679213933868)) &&
  out_eq64 (ported_cos (f64 (13845000584328201046))) (f64 (13830303305655530500)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0936 :
  out_eq64 (ported_sin (f64 (13850932605021247504))) (f64 (4604215406682653032)) &&
  out_eq64 (ported_cos (f64 (13850932605021247504))) (f64 (4604856969148492386)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0937 :
  out_eq64 (ported_sin (f64 (13848925333110633922))) (f64 (4607181738348802908)) &&
  out_eq64 (ported_cos (f64 (13848925333110633922))) (f64 (13801611316059763977)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0938 :
  out_eq64 (ported_sin (f64 (4623707439027530510))) (f64 (4604560580034124467)) &&
  out_eq64 (ported_cos (f64 (4623707439027530510))) (f64 (4604527920533207838)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0939 :
  out_eq64 (ported_sin (f64 (13845905043394733324))) (f64 (4606849948153264513)) &&
  out_eq64 (ported_cos (f64 (13845905043394733324))) (f64 (4598520835108989762)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0940 :
  out_eq64 (ported_sin (f64 (4625954745620628708))) (f64 (13818168160697484594)) &&
  out_eq64 (ported_cos (f64 (4625954745620628708))) (f64 (4607071843431053679)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0941 :
  out_eq64 (ported_sin (f64 (13848701226261154912))) (f64 (4604395581990459793)) &&
  out_eq64 (ported_cos (f64 (13848701226261154912))) (f64 (13828061604369354982)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0942 :
  out_eq64 (ported_sin (f64 (13847188239029174457))) (f64 (13829033547904917940)) &&
  out_eq64 (ported_cos (f64 (13847188239029174457))) (f64 (4603183720111192536)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0943 :
  out_eq64 (ported_sin (f64 (13847744028064600790))) (f64 (13829851664626844680)) &&
  out_eq64 (ported_cos (f64 (13847744028064600790))) (f64 (13824019742327601035)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0944 :
  out_eq64 (ported_sin (f64 (4696671579489372567))) (f64 (4606708492526649589)) &&
  out_eq64 (ported_cos (f64 (4696671579489372567))) (f64 (13822810073559551466)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0945 :
  out_eq64 (ported_sin (f64 (4621455259844705185))) (f64 (4589784776792398857)) &&
  out_eq64 (ported_cos (f64 (4621455259844705185))) (f64 (13830531686344792601)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0946 :
  out_eq64 (ported_sin (f64 (4619175638973464577))) (f64 (4600167997475755891)) &&
  out_eq64 (ported_cos (f64 (4619175638973464577))) (f64 (4606576344950308321)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0947 :
  out_eq64 (ported_sin (f64 (4619207424601709626))) (f64 (4600639695347242349)) &&
  out_eq64 (ported_cos (f64 (4619207424601709626))) (f64 (4606481308854775572)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0948 :
  out_eq64 (ported_sin (f64 (13826558469240389510))) (f64 (13826303918781190729)) &&
  out_eq64 (ported_cos (f64 (13826558469240389510))) (f64 (4605823997317343562)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0949 :
  out_eq64 (ported_sin (f64 (4626590943110855379))) (f64 (4605934932198862571)) &&
  out_eq64 (ported_cos (f64 (4626590943110855379))) (f64 (13826120712199377456)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0950 :
  out_eq64 (ported_sin (f64 (4596844986465367823))) (f64 (4596787025961546708)) &&
  out_eq64 (ported_cos (f64 (4596844986465367823))) (f64 (4606978716603330976)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0951 :
  out_eq64 (ported_sin (f64 (4612970021251507892))) (f64 (4603046259545429972)) &&
  out_eq64 (ported_cos (f64 (4612970021251507892))) (f64 (13829123707266487690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0952 :
  out_eq64 (ported_sin (f64 (13823770381715749994))) (f64 (13823615145888206506)) &&
  out_eq64 (ported_cos (f64 (13823770381715749994))) (f64 (4606561727824396012)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0953 :
  out_eq64 (ported_sin (f64 (13842329353005994825))) (f64 (13818813830076685804)) &&
  out_eq64 (ported_cos (f64 (13842329353005994825))) (f64 (4607044809402758760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0954 :
  out_eq64 (ported_sin (f64 (13850654815108510006))) (f64 (4607079760572578189)) &&
  out_eq64 (ported_cos (f64 (13850654815108510006))) (f64 (13817964133114847297)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0955 :
  out_eq64 (ported_sin (f64 (13850790051653835818))) (f64 (4606698353989667971)) &&
  out_eq64 (ported_cos (f64 (13850790051653835818))) (f64 (4599497705278568922)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0956 :
  out_eq64 (ported_sin (f64 (4603781530078862584))) (f64 (4603426484397401432)) &&
  out_eq64 (ported_cos (f64 (4603781530078862584))) (f64 (4605493269549713603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0957 :
  out_eq64 (ported_sin (f64 (13844360835707691844))) (f64 (13828601271798344440)) &&
  out_eq64 (ported_cos (f64 (13844360835707691844))) (f64 (13827148194283591283)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0958 :
  out_eq64 (ported_sin (f64 (4503729636297548985))) (f64 (4503729636297548973)) &&
  out_eq64 (ported_cos (f64 (4503729636297548985))) (f64 (4607182418800017340)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0959 :
  out_eq64 (ported_sin (f64 (4520501276357133166))) (f64 (4520501276357129489)) &&
  out_eq64 (ported_cos (f64 (4520501276357133166))) (f64 (4607182418800004822)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0960 :
  out_eq64 (ported_sin (f64 (13848651436739064072))) (f64 (4603152210303073277)) &&
  out_eq64 (ported_cos (f64 (13848651436739064072))) (f64 (13829054532964253872)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0961 :
  out_eq64 (ported_sin (f64 (13749935589159545982))) (f64 (13749935589159531483)) &&
  out_eq64 (ported_cos (f64 (13749935589159545982))) (f64 (4607182418799938251)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0962 :
  out_eq64 (ported_sin (f64 (13848831922016801011))) (f64 (4606654245173758804)) &&
  out_eq64 (ported_cos (f64 (13848831922016801011))) (f64 (13823121736339829735)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0963 :
  out_eq64 (ported_sin (f64 (13769801505715817353))) (f64 (13769801505706187577)) &&
  out_eq64 (ported_cos (f64 (13769801505715817353))) (f64 (4607182418761756826)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0964 :
  out_eq64 (ported_sin (f64 (4626806578006811372))) (f64 (4598513591168478336)) &&
  out_eq64 (ported_cos (f64 (4626806578006811372))) (f64 (13830222996542355025)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0965 :
  out_eq64 (ported_sin (f64 (13849261962231771847))) (f64 (4600472828693282666)) &&
  out_eq64 (ported_cos (f64 (13849261962231771847))) (f64 (4606515814740647144)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0966 :
  out_eq64 (ported_sin (f64 (13835515891701144445))) (f64 (13828811904887649546)) &&
  out_eq64 (ported_cos (f64 (13835515891701144445))) (f64 (13826872152715123215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0967 :
  out_eq64 (ported_sin (f64 (13845729670094261560))) (f64 (4607175577301860119)) &&
  out_eq64 (ported_cos (f64 (13845729670094261560))) (f64 (13809148804741834661)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0968 :
  out_eq64 (ported_sin (f64 (4622866412092697427))) (f64 (13827391096041193134)) &&
  out_eq64 (ported_cos (f64 (4622866412092697427))) (f64 (4605029355279505550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0969 :
  out_eq64 (ported_sin (f64 (13849688136281577156))) (f64 (13829681652264167058)) &&
  out_eq64 (ported_cos (f64 (13849688136281577156))) (f64 (4601407572953047268)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0970 :
  out_eq64 (ported_sin (f64 (13835883717856178866))) (f64 (13827849254674523159)) &&
  out_eq64 (ported_cos (f64 (13835883717856178866))) (f64 (13827982662849001043)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0971 :
  out_eq64 (ported_sin (f64 (4619138115591268381))) (f64 (4599604517326919817)) &&
  out_eq64 (ported_cos (f64 (4619138115591268381))) (f64 (4606679913572584849)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0972 :
  out_eq64 (ported_sin (f64 (13850459746728031174))) (f64 (4604159337342277796)) &&
  out_eq64 (ported_cos (f64 (13850459746728031174))) (f64 (13828279267437343981)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0973 :
  out_eq64 (ported_sin (f64 (4626308489759182957))) (f64 (4606202085025472262)) &&
  out_eq64 (ported_cos (f64 (4626308489759182957))) (f64 (4601844518786103666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0974 :
  out_eq64 (ported_sin (f64 (4616174524715824970))) (f64 (13828324311781414590)) &&
  out_eq64 (ported_cos (f64 (4616174524715824970))) (f64 (13827480312844462143)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0975 :
  out_eq64 (ported_sin (f64 (4603269052388095148))) (f64 (4603001840496691528)) &&
  out_eq64 (ported_cos (f64 (4603269052388095148))) (f64 (4605780044895405593)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0976 :
  out_eq64 (ported_sin (f64 (4618416492853743991))) (f64 (13822458810395768691)) &&
  out_eq64 (ported_cos (f64 (4618416492853743991))) (f64 (4606765834553772532)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0977 :
  out_eq64 (ported_sin (f64 (13847623151601874222))) (f64 (13830404173291203521)) &&
  out_eq64 (ported_cos (f64 (13847623151601874222))) (f64 (13819094031936651863)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0978 :
  out_eq64 (ported_sin (f64 (13850022847907365123))) (f64 (13828166683174734845)) &&
  out_eq64 (ported_cos (f64 (13850022847907365123))) (f64 (13827655679076097286)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0979 :
  out_eq64 (ported_sin (f64 (13830312889736343885))) (f64 (13828993324634322344)) &&
  out_eq64 (ported_cos (f64 (13830312889736343885))) (f64 (4603243326318539992)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0980 :
  out_eq64 (ported_sin (f64 (4624397982663675771))) (f64 (4606309792119353069)) &&
  out_eq64 (ported_cos (f64 (4624397982663675771))) (f64 (13824778866518173215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0981 :
  out_eq64 (ported_sin (f64 (13851037721088511688))) (f64 (4600043987930630217)) &&
  out_eq64 (ported_cos (f64 (13851037721088511688))) (f64 (4606600056035808961)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0982 :
  out_eq64 (ported_sin (f64 (4490342295699199636))) (f64 (4490342295699199636)) &&
  out_eq64 (ported_cos (f64 (4490342295699199636))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0983 :
  out_eq64 (ported_sin (f64 (13845744186438412809))) (f64 (4607181635040627944)) &&
  out_eq64 (ported_cos (f64 (13845744186438412809))) (f64 (13802130178305431877)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0984 :
  out_eq64 (ported_sin (f64 (13850575885783106930))) (f64 (4606356677267353732)) &&
  out_eq64 (ported_cos (f64 (13850575885783106930))) (f64 (13824578479386776406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0985 :
  out_eq64 (ported_sin (f64 (4602800663328880217))) (f64 (4602521242522428097)) &&
  out_eq64 (ported_cos (f64 (4602800663328880217))) (f64 (4606020643903078179)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0986 :
  out_eq64 (ported_sin (f64 (13842045898919693008))) (f64 (4590188219565312426)) &&
  out_eq64 (ported_cos (f64 (13842045898919693008))) (f64 (4607155914556159014)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0987 :
  out_eq64 (ported_sin (f64 (13840975658966728431))) (f64 (4605884522100089879)) &&
  out_eq64 (ported_cos (f64 (13840975658966728431))) (f64 (4602833147467964066)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0988 :
  out_eq64 (ported_sin (f64 (4603482900857902545))) (f64 (4603181016642814943)) &&
  out_eq64 (ported_cos (f64 (4603482900857902545))) (f64 (4605663319025977881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0989 :
  out_eq64 (ported_sin (f64 (4625122861341950916))) (f64 (13818303736085401948)) &&
  out_eq64 (ported_cos (f64 (4625122861341950916))) (f64 (13830438453660929347)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0990 :
  out_eq64 (ported_sin (f64 (13844882392148184166))) (f64 (4583366471331529818)) &&
  out_eq64 (ported_cos (f64 (13844882392148184166))) (f64 (13830551233234221348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0991 :
  out_eq64 (ported_sin (f64 (13847193922430698632))) (f64 (13829083730097674385)) &&
  out_eq64 (ported_cos (f64 (13847193922430698632))) (f64 (4603107886432433507)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0992 :
  out_eq64 (ported_sin (f64 (4627209719736386236))) (f64 (13829805506940305003)) &&
  out_eq64 (ported_cos (f64 (4627209719736386236))) (f64 (13824235579027273016)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0993 :
  out_eq64 (ported_sin (f64 (4626492919005036547))) (f64 (4607029836952663375)) &&
  out_eq64 (ported_cos (f64 (4626492919005036547))) (f64 (13819143558014888249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0994 :
  out_eq64 (ported_sin (f64 (4696839893930381830))) (f64 (13829020293390981537)) &&
  out_eq64 (ported_cos (f64 (4696839893930381830))) (f64 (4603203475360845950)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0995 :
  out_eq64 (ported_sin (f64 (13917058996119238230))) (f64 (13820996349190467696)) &&
  out_eq64 (ported_cos (f64 (13917058996119238230))) (f64 (4606930808258638051)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0996 :
  out_eq64 (ported_sin (f64 (4616181459942564957))) (f64 (13828342552590000328)) &&
  out_eq64 (ported_cos (f64 (4616181459942564957))) (f64 (13827459412360908083)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0997 :
  out_eq64 (ported_sin (f64 (4532184226622172546))) (f64 (4532184226622065752)) &&
  out_eq64 (ported_cos (f64 (4532184226622172546))) (f64 (4607182418799541732)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0998 :
  out_eq64 (ported_sin (f64 (4627059311216101475))) (f64 (13826822886748501786)) &&
  out_eq64 (ported_cos (f64 (4627059311216101475))) (f64 (13828847760686820682)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_0999 :
  out_eq64 (ported_sin (f64 (4623007489663490479))) (f64 (13824966741674187008)) &&
  out_eq64 (ported_cos (f64 (4623007489663490479))) (f64 (4606264460537204611)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1000 :
  out_eq64 (ported_sin (f64 (4619613434515365287))) (f64 (4604365927764860622)) &&
  out_eq64 (ported_cos (f64 (4619613434515365287))) (f64 (4604717754998338878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1001 :
  out_eq64 (ported_sin (f64 (13719799868765131615))) (f64 (13719799868765131613)) &&
  out_eq64 (ported_cos (f64 (13719799868765131615))) (f64 (4607182418800017400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1002 :
  out_eq64 (ported_sin (f64 (4518618343016787340))) (f64 (4518618343016785716)) &&
  out_eq64 (ported_cos (f64 (4518618343016787340))) (f64 (4607182418800010110)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1003 :
  out_eq64 (ported_sin (f64 (4634941327071474725))) (f64 (13828715641859640238)) &&
  out_eq64 (ported_cos (f64 (4634941327071474725))) (f64 (4603629015316789484)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1004 :
  out_eq64 (ported_sin (f64 (13834013627263299789))) (f64 (13830379721169712585)) &&
  out_eq64 (ported_cos (f64 (13834013627263299789))) (f64 (13819602299856875579)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1005 :
  out_eq64 (ported_sin (f64 (13846603626569417703))) (f64 (4588416418766974460)) &&
  out_eq64 (ported_cos (f64 (13846603626569417703))) (f64 (4607167627919027769)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1006 :
  out_eq64 (ported_sin (f64 (13834660592408534259))) (f64 (13830035980544218654)) &&
  out_eq64 (ported_cos (f64 (13834660592408534259))) (f64 (13823067343623391213)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1007 :
  out_eq64 (ported_sin (f64 (13848571577744812599))) (f64 (4599024708414155681)) &&
  out_eq64 (ported_cos (f64 (13848571577744812599))) (f64 (13830147590655326044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1008 :
  out_eq64 (ported_sin (f64 (13844255851850781167))) (f64 (13829517432672181576)) &&
  out_eq64 (ported_cos (f64 (13844255851850781167))) (f64 (13825435540615012471)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1009 :
  out_eq64 (ported_sin (f64 (4625116855930125271))) (f64 (13817924018894520165)) &&
  out_eq64 (ported_cos (f64 (4625116855930125271))) (f64 (13830453318838486935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1010 :
  out_eq64 (ported_sin (f64 (4623557465204686308))) (f64 (4602646916559346737)) &&
  out_eq64 (ported_cos (f64 (4623557465204686308))) (f64 (4605984870687558123)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1011 :
  out_eq64 (ported_sin (f64 (13786211916417668651))) (f64 (13786211915317646031)) &&
  out_eq64 (ported_cos (f64 (13786211916417668651))) (f64 (4607182413080555522)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1012 :
  out_eq64 (ported_sin (f64 (13844888217959654076))) (f64 (4585506087150192901)) &&
  out_eq64 (ported_cos (f64 (13844888217959654076))) (f64 (13830548257985879695)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1013 :
  out_eq64 (ported_sin (f64 (4530766236210332271))) (f64 (4530766236210284223)) &&
  out_eq64 (ported_cos (f64 (4530766236210332271))) (f64 (4607182418799738111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1014 :
  out_eq64 (ported_sin (f64 (13831112369224301730))) (f64 (13829669812179409405)) &&
  out_eq64 (ported_cos (f64 (13831112369224301730))) (f64 (4601457177322700503)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1015 :
  out_eq64 (ported_sin (f64 (13755328894065495302))) (f64 (13755328894065400071)) &&
  out_eq64 (ported_cos (f64 (13755328894065495302))) (f64 (4607182418799576719)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1016 :
  out_eq64 (ported_sin (f64 (4598814230062415941))) (f64 (4598744665152818258)) &&
  out_eq64 (ported_cos (f64 (4598814230062415941))) (f64 (4606817886461555209)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1017 :
  out_eq64 (ported_sin (f64 (4625312850482880191))) (f64 (13827379212586312798)) &&
  out_eq64 (ported_cos (f64 (4625312850482880191))) (f64 (13828411506210202180)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1018 :
  out_eq64 (ported_sin (f64 (13845103180999955465))) (f64 (4600999900868438013)) &&
  out_eq64 (ported_cos (f64 (13845103180999955465))) (f64 (13829775483000731364)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1019 :
  out_eq64 (ported_sin (f64 (4625749820100138494))) (f64 (13828517465875395872)) &&
  out_eq64 (ported_cos (f64 (4625749820100138494))) (f64 (4603880113784825148)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1020 :
  out_eq64 (ported_sin (f64 (4625838700441203510))) (f64 (13826401222543201348)) &&
  out_eq64 (ported_cos (f64 (4625838700441203510))) (f64 (4605762620358187824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1021 :
  out_eq64 (ported_sin (f64 (4626727656031243485))) (f64 (4602902479614174533)) &&
  out_eq64 (ported_cos (f64 (4626727656031243485))) (f64 (13829214240856512799)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1022 :
  out_eq64 (ported_sin (f64 (13904529517239398492))) (f64 (13830554309692464382)) &&
  out_eq64 (ported_cos (f64 (13904529517239398492))) (f64 (13796585604279818489)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1023 :
  out_eq64 (ported_sin (f64 (13849226317268135016))) (f64 (4602525170298155651)) &&
  out_eq64 (ported_cos (f64 (13849226317268135016))) (f64 (4606019535948297245)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1024 :
  out_eq64 (ported_sin (f64 (13850444174737200528))) (f64 (4603777938220495890)) &&
  out_eq64 (ported_cos (f64 (13850444174737200528))) (f64 (13828599857470646932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1025 :
  out_eq64 (ported_sin (f64 (4626258441384109688))) (f64 (4605352753246599672)) &&
  out_eq64 (ported_cos (f64 (4626258441384109688))) (f64 (4603616970033949666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1026 :
  out_eq64 (ported_sin (f64 (4583108763807434167))) (f64 (4583107933778427017)) &&
  out_eq64 (ported_cos (f64 (4583108763807434167))) (f64 (4607179408925138146)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1027 :
  out_eq64 (ported_sin (f64 (13884421422896749869))) (f64 (13828632092214748303)) &&
  out_eq64 (ported_cos (f64 (13884421422896749869))) (f64 (4603737120289932547)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1028 :
  out_eq64 (ported_sin (f64 (4599914408966673914))) (f64 (4599790204550226456)) &&
  out_eq64 (ported_cos (f64 (4599914408966673914))) (f64 (4606646958973451094)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1029 :
  out_eq64 (ported_sin (f64 (4612017678145004589))) (f64 (4605726683920226976)) &&
  out_eq64 (ported_cos (f64 (4612017678145004589))) (f64 (13826456943173000090)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1030 :
  out_eq64 (ported_sin (f64 (13840652867301887057))) (f64 (4606887046596551154)) &&
  out_eq64 (ported_cos (f64 (13840652867301887057))) (f64 (4598247079607722624)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1031 :
  out_eq64 (ported_sin (f64 (4627114175071759939))) (f64 (13828136976265389351)) &&
  out_eq64 (ported_cos (f64 (4627114175071759939))) (f64 (13827687714893600399)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1032 :
  out_eq64 (ported_sin (f64 (13831206029155217008))) (f64 (13829749006778537093)) &&
  out_eq64 (ported_cos (f64 (13831206029155217008))) (f64 (4601117673676409141)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1033 :
  out_eq64 (ported_sin (f64 (13751083135467142386))) (f64 (13751083135467115283)) &&
  out_eq64 (ported_cos (f64 (13751083135467142386))) (f64 (4607182418799897291)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1034 :
  out_eq64 (ported_sin (f64 (4620181360902016534))) (f64 (4606756911302440241)) &&
  out_eq64 (ported_cos (f64 (4620181360902016534))) (f64 (4599143074934492696)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1035 :
  out_eq64 (ported_sin (f64 (4627332162418414302))) (f64 (13830551791008236675)) &&
  out_eq64 (ported_cos (f64 (4627332162418414302))) (f64 (4582667698020319748)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1036 :
  out_eq64 (ported_sin (f64 (13846246456816237064))) (f64 (4603920972313671317)) &&
  out_eq64 (ported_cos (f64 (13846246456816237064))) (f64 (4605111786674562272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1037 :
  out_eq64 (ported_sin (f64 (4627298634185544883))) (f64 (13830514019314101228)) &&
  out_eq64 (ported_cos (f64 (4627298634185544883))) (f64 (13814856668695161980)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1038 :
  out_eq64 (ported_sin (f64 (13889095660830192696))) (f64 (4590028668640601923)) &&
  out_eq64 (ported_cos (f64 (13889095660830192696))) (f64 (4607157425654937226)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1039 :
  out_eq64 (ported_sin (f64 (13755340315322478759))) (f64 (13755340315322382969)) &&
  out_eq64 (ported_cos (f64 (13755340315322478759))) (f64 (4607182418799574994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1040 :
  out_eq64 (ported_sin (f64 (4621237495655954459))) (f64 (4601635906794327502)) &&
  out_eq64 (ported_cos (f64 (4621237495655954459))) (f64 (13829626375909758800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1041 :
  out_eq64 (ported_sin (f64 (4653093300199401302))) (f64 (13828292173502931439)) &&
  out_eq64 (ported_cos (f64 (4653093300199401302))) (f64 (13827516823527566089)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1042 :
  out_eq64 (ported_sin (f64 (4652792419037666726))) (f64 (13830552293956031399)) &&
  out_eq64 (ported_cos (f64 (4652792419037666726))) (f64 (13805343648077865764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1043 :
  out_eq64 (ported_sin (f64 (4625745416475767507))) (f64 (13828605861260472670)) &&
  out_eq64 (ported_cos (f64 (4625745416475767507))) (f64 (4603770372433183550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1044 :
  out_eq64 (ported_sin (f64 (4618066746298449690))) (f64 (13826751100694120982)) &&
  out_eq64 (ported_cos (f64 (4618066746298449690))) (f64 (4605527065774469102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1045 :
  out_eq64 (ported_sin (f64 (13849143610486256382))) (f64 (4604684164784179528)) &&
  out_eq64 (ported_cos (f64 (13849143610486256382))) (f64 (4604401235148498688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1046 :
  out_eq64 (ported_sin (f64 (13777398183017258926))) (f64 (13777398182940540109)) &&
  out_eq64 (ported_cos (f64 (13777398183017258926))) (f64 (4607182418415441516)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1047 :
  out_eq64 (ported_sin (f64 (4579443442003791706))) (f64 (4579443156284142910)) &&
  out_eq64 (ported_cos (f64 (4579443442003791706))) (f64 (4607181487471231629)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1048 :
  out_eq64 (ported_sin (f64 (13848548400327708348))) (f64 (4598227930026156793)) &&
  out_eq64 (ported_cos (f64 (13848548400327708348))) (f64 (13830261592173016760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1049 :
  out_eq64 (ported_sin (f64 (13840903786286280515))) (f64 (4606165960193516007)) &&
  out_eq64 (ported_cos (f64 (13840903786286280515))) (f64 (4601984911036873954)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1050 :
  out_eq64 (ported_sin (f64 (13795670727119424228))) (f64 (13795670704520543821)) &&
  out_eq64 (ported_cos (f64 (13795670727119424228))) (f64 (4607182310693583172)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1051 :
  out_eq64 (ported_sin (f64 (13846370567182215778))) (f64 (4601851170748787756)) &&
  out_eq64 (ported_cos (f64 (13846370567182215778))) (f64 (4606200390912036240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1052 :
  out_eq64 (ported_sin (f64 (4625663728877649081))) (f64 (13829911778406549439)) &&
  out_eq64 (ported_cos (f64 (4625663728877649081))) (f64 (4600354257127101249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1053 :
  out_eq64 (ported_sin (f64 (13845873796072378413))) (f64 (4606971100469022068)) &&
  out_eq64 (ported_cos (f64 (13845873796072378413))) (f64 (4596926491469724284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1054 :
  out_eq64 (ported_sin (f64 (4681877710818485871))) (f64 (4606523689530787543)) &&
  out_eq64 (ported_cos (f64 (4681877710818485871))) (f64 (13823806108196722135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1055 :
  out_eq64 (ported_sin (f64 (13839352617787687636))) (f64 (4604416781288801232)) &&
  out_eq64 (ported_cos (f64 (13839352617787687636))) (f64 (13828041295622013710)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1056 :
  out_eq64 (ported_sin (f64 (13849481077531015034))) (f64 (13823914385134670615)) &&
  out_eq64 (ported_cos (f64 (13849481077531015034))) (f64 (4606501557957720812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1057 :
  out_eq64 (ported_sin (f64 (13851097824095951432))) (f64 (4594482090138245488)) &&
  out_eq64 (ported_cos (f64 (13851097824095951432))) (f64 (4607083905181662984)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1058 :
  out_eq64 (ported_sin (f64 (4625507142885463853))) (f64 (13830414898894288204)) &&
  out_eq64 (ported_cos (f64 (4625507142885463853))) (f64 (13818857721282033885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1059 :
  out_eq64 (ported_sin (f64 (13843639333877035927))) (f64 (13830312569004923164)) &&
  out_eq64 (ported_cos (f64 (13843639333877035927))) (f64 (4597461568002820974)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1060 :
  out_eq64 (ported_sin (f64 (4625078608521903572))) (f64 (13813942563999299125)) &&
  out_eq64 (ported_cos (f64 (4625078608521903572))) (f64 (13830524149275622469)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1061 :
  out_eq64 (ported_sin (f64 (13848755998287219177))) (f64 (4605537824053465645)) &&
  out_eq64 (ported_cos (f64 (13848755998287219177))) (f64 (13826735868282877757)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1062 :
  out_eq64 (ported_sin (f64 (13849738517025399966))) (f64 (13830240331665665640)) &&
  out_eq64 (ported_cos (f64 (13849738517025399966))) (f64 (4598387584651017023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1063 :
  out_eq64 (ported_sin (f64 (4621951551279254080))) (f64 (13828073982989815124)) &&
  out_eq64 (ported_cos (f64 (4621951551279254080))) (f64 (13827754629309511477)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1064 :
  out_eq64 (ported_sin (f64 (13840597541789713151))) (f64 (4606988902127829994)) &&
  out_eq64 (ported_cos (f64 (13840597541789713151))) (f64 (4596596223571112366)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1065 :
  out_eq64 (ported_sin (f64 (13848977842108748722))) (f64 (4607046009702660690)) &&
  out_eq64 (ported_cos (f64 (13848977842108748722))) (f64 (4595414581454261862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1066 :
  out_eq64 (ported_sin (f64 (4611533816169643499))) (f64 (4606487418732978534)) &&
  out_eq64 (ported_cos (f64 (4611533816169643499))) (f64 (13823982527885066200)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1067 :
  out_eq64 (ported_sin (f64 (13846377221259969392))) (f64 (4601660888462699385)) &&
  out_eq64 (ported_cos (f64 (13846377221259969392))) (f64 (4606248170396384089)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1068 :
  out_eq64 (ported_sin (f64 (13847903982744242442))) (f64 (13828540892762304690)) &&
  out_eq64 (ported_cos (f64 (13847903982744242442))) (f64 (13827223407283105526)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1069 :
  out_eq64 (ported_sin (f64 (4612751851769743702))) (f64 (4603756324632875797)) &&
  out_eq64 (ported_cos (f64 (4612751851769743702))) (f64 (13828616973821263554)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1070 :
  out_eq64 (ported_sin (f64 (4619155985126453517))) (f64 (4599873720467392216)) &&
  out_eq64 (ported_cos (f64 (4619155985126453517))) (f64 (4606631762905782653)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1071 :
  out_eq64 (ported_sin (f64 (4619761923583355727))) (f64 (4605172528102151014)) &&
  out_eq64 (ported_cos (f64 (4619761923583355727))) (f64 (4603846842890888871)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1072 :
  out_eq64 (ported_sin (f64 (13759481260747590714))) (f64 (13759481260747274478)) &&
  out_eq64 (ported_cos (f64 (13759481260747590714))) (f64 (4607182418798460337)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1073 :
  out_eq64 (ported_sin (f64 (13855236467906070602))) (f64 (4598163882643887085)) &&
  out_eq64 (ported_cos (f64 (13855236467906070602))) (f64 (13830269170880089194)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1074 :
  out_eq64 (ported_sin (f64 (13836776549934173571))) (f64 (13823699254501459136)) &&
  out_eq64 (ported_cos (f64 (13836776549934173571))) (f64 (13829917166383605209)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1075 :
  out_eq64 (ported_sin (f64 (13893747011662959726))) (f64 (4603178632531487650)) &&
  out_eq64 (ported_cos (f64 (13893747011662959726))) (f64 (4605664912256197169)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1076 :
  out_eq64 (ported_sin (f64 (4617944388486375792))) (f64 (13827517795551773087)) &&
  out_eq64 (ported_cos (f64 (4617944388486375792))) (f64 (4604919276236347081)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1077 :
  out_eq64 (ported_sin (f64 (4626112783411639524))) (f64 (4600763162801710149)) &&
  out_eq64 (ported_cos (f64 (4626112783411639524))) (f64 (4606455143657029982)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1078 :
  out_eq64 (ported_sin (f64 (13759187251765519618))) (f64 (13759187251765251533)) &&
  out_eq64 (ported_cos (f64 (13759187251765519618))) (f64 (4607182418798622702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1079 :
  out_eq64 (ported_sin (f64 (13846630072594508983))) (f64 (4577113264276706143)) &&
  out_eq64 (ported_cos (f64 (13846630072594508983))) (f64 (4607181937437458006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1080 :
  out_eq64 (ported_sin (f64 (4622996989357127088))) (f64 (13825267111718806689)) &&
  out_eq64 (ported_cos (f64 (4622996989357127088))) (f64 (4606189165864155144)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1081 :
  out_eq64 (ported_sin (f64 (4617843377268590853))) (f64 (13828098021693117741)) &&
  out_eq64 (ported_cos (f64 (4617843377268590853))) (f64 (4604357218614329640)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1082 :
  out_eq64 (ported_sin (f64 (4560064519463164430))) (f64 (4560064518812459133)) &&
  out_eq64 (ported_cos (f64 (4560064519463164430))) (f64 (4607182416261050702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1083 :
  out_eq64 (ported_sin (f64 (4639824608197955209))) (f64 (4601900732992774259)) &&
  out_eq64 (ported_cos (f64 (4639824608197955209))) (f64 (13829559750575704673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1084 :
  out_eq64 (ported_sin (f64 (4531656515712824688))) (f64 (4531656515712743409)) &&
  out_eq64 (ported_cos (f64 (4531656515712824688))) (f64 (4607182418799620887)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1085 :
  out_eq64 (ported_sin (f64 (4617310736840279350))) (f64 (13830195250290170291)) &&
  out_eq64 (ported_cos (f64 (4617310736840279350))) (f64 (4598708221983222286)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1086 :
  out_eq64 (ported_sin (f64 (4626300082748225514))) (f64 (4606076470278551260)) &&
  out_eq64 (ported_cos (f64 (4626300082748225514))) (f64 (4602320290397125351)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1087 :
  out_eq64 (ported_sin (f64 (4617937480977878804))) (f64 (13827559058390734205)) &&
  out_eq64 (ported_cos (f64 (4617937480977878804))) (f64 (4604882519690598590)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1088 :
  out_eq64 (ported_sin (f64 (4514136822087247743))) (f64 (4514136822087247333)) &&
  out_eq64 (ported_cos (f64 (4514136822087247743))) (f64 (4607182418800015570)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1089 :
  out_eq64 (ported_sin (f64 (4627403425743389617))) (f64 (13830209862583129680)) &&
  out_eq64 (ported_cos (f64 (4627403425743389617))) (f64 (4598606756200326053)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1090 :
  out_eq64 (ported_sin (f64 (4622950937159674622))) (f64 (13826300084550000732)) &&
  out_eq64 (ported_cos (f64 (4622950937159674622))) (f64 (4605826380437040732)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1091 :
  out_eq64 (ported_sin (f64 (4624633041271763135))) (f64 (4604042526444909918)) &&
  out_eq64 (ported_cos (f64 (4624633041271763135))) (f64 (13828381314357087692)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1092 :
  out_eq64 (ported_sin (f64 (13846476201287205437))) (f64 (4598713485510454090)) &&
  out_eq64 (ported_cos (f64 (13846476201287205437))) (f64 (4606822446629797581)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1093 :
  out_eq64 (ported_sin (f64 (4627650695638264952))) (f64 (13824303816512156841)) &&
  out_eq64 (ported_cos (f64 (4627650695638264952))) (f64 (4606418529472358671)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1094 :
  out_eq64 (ported_sin (f64 (13848889563085279254))) (f64 (4607095079117118722)) &&
  out_eq64 (ported_cos (f64 (13848889563085279254))) (f64 (13817545244267839014)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1095 :
  out_eq64 (ported_sin (f64 (13841112388789793600))) (f64 (4605263472699656294)) &&
  out_eq64 (ported_cos (f64 (13841112388789793600))) (f64 (4603732764473932449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1096 :
  out_eq64 (ported_sin (f64 (13848632481967880182))) (f64 (4602592711202769262)) &&
  out_eq64 (ported_cos (f64 (13848632481967880182))) (f64 (13829372419081197614)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1097 :
  out_eq64 (ported_sin (f64 (4668006692353695056))) (f64 (4604738104132978112)) &&
  out_eq64 (ported_cos (f64 (4668006692353695056))) (f64 (4604344351113261834)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1098 :
  out_eq64 (ported_sin (f64 (13839730762110569519))) (f64 (4605796111054615882)) &&
  out_eq64 (ported_cos (f64 (13839730762110569519))) (f64 (13826348469894314307)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1099 :
  out_eq64 (ported_sin (f64 (4626981607688760420))) (f64 (13823215688053084651)) &&
  out_eq64 (ported_cos (f64 (4626981607688760420))) (f64 (13830009297872595280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1100 :
  out_eq64 (ported_sin (f64 (4625365196126836502))) (f64 (13828547848150977452)) &&
  out_eq64 (ported_cos (f64 (4625365196126836502))) (f64 (13827214826739402618)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1101 :
  out_eq64 (ported_sin (f64 (4580524644355469784))) (f64 (4580524413010364309)) &&
  out_eq64 (ported_cos (f64 (4580524644355469784))) (f64 (4607181134495154672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1102 :
  out_eq64 (ported_sin (f64 (4498779026262295559))) (f64 (4498779026262295554)) &&
  out_eq64 (ported_cos (f64 (4498779026262295559))) (f64 (4607182418800017393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1103 :
  out_eq64 (ported_sin (f64 (4627398837777304459))) (f64 (13830248930776008496)) &&
  out_eq64 (ported_cos (f64 (4627398837777304459))) (f64 (4598323716851303891)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1104 :
  out_eq64 (ported_sin (f64 (13801070897454596193))) (f64 (13801070756822984420)) &&
  out_eq64 (ported_cos (f64 (13801070897454596193))) (f64 (4607181838213942316)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1105 :
  out_eq64 (ported_sin (f64 (4569377801416746769))) (f64 (4569377789563088126)) &&
  out_eq64 (ported_cos (f64 (4569377801416746769))) (f64 (4607182374506294769)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1106 :
  out_eq64 (ported_sin (f64 (13846768511205937870))) (f64 (13820949355707635861)) &&
  out_eq64 (ported_cos (f64 (13846768511205937870))) (f64 (4606933636612316098)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1107 :
  out_eq64 (ported_sin (f64 (4623727659063777719))) (f64 (4604784588844921589)) &&
  out_eq64 (ported_cos (f64 (4623727659063777719))) (f64 (4604294523090249043)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1108 :
  out_eq64 (ported_sin (f64 (13846874465433596767))) (f64 (13824451510082920817)) &&
  out_eq64 (ported_cos (f64 (13846874465433596767))) (f64 (4606385613308556081)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1109 :
  out_eq64 (ported_sin (f64 (4567638325297977666))) (f64 (4567638320105702796)) &&
  out_eq64 (ported_cos (f64 (4567638325297977666))) (f64 (4607182393252672106)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1110 :
  out_eq64 (ported_sin (f64 (13848704930368496974))) (f64 (4604480767342767296)) &&
  out_eq64 (ported_cos (f64 (13848704930368496974))) (f64 (13827979184990153687)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1111 :
  out_eq64 (ported_sin (f64 (13789496545927855000))) (f64 (13789496541146226715)) &&
  out_eq64 (ported_cos (f64 (13789496545927855000))) (f64 (4607182403566345828)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1112 :
  out_eq64 (ported_sin (f64 (13847132764058782710))) (f64 (13828504472429283347)) &&
  out_eq64 (ported_cos (f64 (13847132764058782710))) (f64 (4603895952325018554)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1113 :
  out_eq64 (ported_sin (f64 (13850141980096530899))) (f64 (13824096648679510332)) &&
  out_eq64 (ported_cos (f64 (13850141980096530899))) (f64 (13829835408468225155)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1114 :
  out_eq64 (ported_sin (f64 (13843123664578844489))) (f64 (13828492408613758946)) &&
  out_eq64 (ported_cos (f64 (13843123664578844489))) (f64 (4603910592169879921)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1115 :
  out_eq64 (ported_sin (f64 (13850363240131918327))) (f64 (4600416901763219921)) &&
  out_eq64 (ported_cos (f64 (13850363240131918327))) (f64 (13829899198187530512)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1116 :
  out_eq64 (ported_sin (f64 (13850408547157167670))) (f64 (4602842818794238438)) &&
  out_eq64 (ported_cos (f64 (13850408547157167670))) (f64 (13829250707293365937)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1117 :
  out_eq64 (ported_sin (f64 (13848711659549265071))) (f64 (4604632718021387225)) &&
  out_eq64 (ported_cos (f64 (13848711659549265071))) (f64 (13827826615590736674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1118 :
  out_eq64 (ported_sin (f64 (13850812206749516104))) (f64 (4606442914624615545)) &&
  out_eq64 (ported_cos (f64 (13850812206749516104))) (f64 (4600820006166473700)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1119 :
  out_eq64 (ported_sin (f64 (13818144516672510863))) (f64 (13818121941816745431)) &&
  out_eq64 (ported_cos (f64 (13818144516672510863))) (f64 (4607073663152687893)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1120 :
  out_eq64 (ported_sin (f64 (13851065802334998796))) (f64 (4598334087938064656)) &&
  out_eq64 (ported_cos (f64 (13851065802334998796))) (f64 (4606875506115548452)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1121 :
  out_eq64 (ported_sin (f64 (4630068397403068556))) (f64 (13811763016133666876)) &&
  out_eq64 (ported_cos (f64 (4630068397403068556))) (f64 (13830539755863457672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1122 :
  out_eq64 (ported_sin (f64 (13834783203164371812))) (f64 (13829950847322238732)) &&
  out_eq64 (ported_cos (f64 (13834783203164371812))) (f64 (13823527266269605861)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1123 :
  out_eq64 (ported_sin (f64 (4531712990915592772))) (f64 (4531712990915508982)) &&
  out_eq64 (ported_cos (f64 (4531712990915592772))) (f64 (4607182418799612760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1124 :
  out_eq64 (ported_sin (f64 (13834777925447968577))) (f64 (13829954640584503146)) &&
  out_eq64 (ported_cos (f64 (13834777925447968577))) (f64 (13823507565679728976)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1125 :
  out_eq64 (ported_sin (f64 (4626409518537948840))) (f64 (4607126012854072355)) &&
  out_eq64 (ported_cos (f64 (4626409518537948840))) (f64 (4592716004588114995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1126 :
  out_eq64 (ported_sin (f64 (4621889188600522225))) (f64 (13827347739351076329)) &&
  out_eq64 (ported_cos (f64 (4621889188600522225))) (f64 (13828438122524820966)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1127 :
  out_eq64 (ported_sin (f64 (4627149831203621089))) (f64 (13828859945142921312)) &&
  out_eq64 (ported_cos (f64 (4627149831203621089))) (f64 (13826805984550900336)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1128 :
  out_eq64 (ported_sin (f64 (13848192091038248923))) (f64 (13823679183740139764)) &&
  out_eq64 (ported_cos (f64 (13848192091038248923))) (f64 (13829921149394391295)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1129 :
  out_eq64 (ported_sin (f64 (13852133011159046259))) (f64 (4600488739737545761)) &&
  out_eq64 (ported_cos (f64 (13852133011159046259))) (f64 (13829884603565414543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1130 :
  out_eq64 (ported_sin (f64 (13850404145294840205))) (f64 (4602721782099808529)) &&
  out_eq64 (ported_cos (f64 (13850404145294840205))) (f64 (13829322756856764519)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1131 :
  out_eq64 (ported_sin (f64 (4626917202857917731))) (f64 (13816726204485135329)) &&
  out_eq64 (ported_cos (f64 (4626917202857917731))) (f64 (13830488719818605559)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1132 :
  out_eq64 (ported_sin (f64 (4689656827693917738))) (f64 (4607176905978885420)) &&
  out_eq64 (ported_cos (f64 (4689656827693917738))) (f64 (4585202211715962800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1133 :
  out_eq64 (ported_sin (f64 (4622685566739088792))) (f64 (13829256327550414629)) &&
  out_eq64 (ported_cos (f64 (4622685566739088792))) (f64 (4602833530442292280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1134 :
  out_eq64 (ported_sin (f64 (13844255322104533353))) (f64 (13829521377601170655)) &&
  out_eq64 (ported_cos (f64 (13844255322104533353))) (f64 (13825420536737079029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1135 :
  out_eq64 (ported_sin (f64 (13854142690771549336))) (f64 (13830054982514180661)) &&
  out_eq64 (ported_cos (f64 (13854142690771549336))) (f64 (13822959139772939180)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1136 :
  out_eq64 (ported_sin (f64 (13847980781968606517))) (f64 (13827703956856727401)) &&
  out_eq64 (ported_cos (f64 (13847980781968606517))) (f64 (13828121804133652030)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1137 :
  out_eq64 (ported_sin (f64 (13837681819726100498))) (f64 (4582456759440421795)) &&
  out_eq64 (ported_cos (f64 (13837681819726100498))) (f64 (13830551948971145964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1138 :
  out_eq64 (ported_sin (f64 (13831556415704465667))) (f64 (13830013561168084625)) &&
  out_eq64 (ported_cos (f64 (13831556415704465667))) (f64 (4599820220405626198)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1139 :
  out_eq64 (ported_sin (f64 (4551941596242943543))) (f64 (4551941596184621725)) &&
  out_eq64 (ported_cos (f64 (4551941596242943543))) (f64 (4607182418598220351)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1140 :
  out_eq64 (ported_sin (f64 (13844580264089235734))) (f64 (13825836889200890781)) &&
  out_eq64 (ported_cos (f64 (13844580264089235734))) (f64 (13829408516113385696)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1141 :
  out_eq64 (ported_sin (f64 (13847792809751020245))) (f64 (13829518632177665058)) &&
  out_eq64 (ported_cos (f64 (13847792809751020245))) (f64 (13825430982121490861)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1142 :
  out_eq64 (ported_sin (f64 (13829946674917823027))) (f64 (13828781168650682354)) &&
  out_eq64 (ported_cos (f64 (13829946674917823027))) (f64 (4603541796849740594)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1143 :
  out_eq64 (ported_sin (f64 (4627246905619129292))) (f64 (13830207229570605186)) &&
  out_eq64 (ported_cos (f64 (4627246905619129292))) (f64 (13821997242584963396)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1144 :
  out_eq64 (ported_sin (f64 (4697148554004796788))) (f64 (13830404709421528373)) &&
  out_eq64 (ported_cos (f64 (4697148554004796788))) (f64 (13819082429053969091)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1145 :
  out_eq64 (ported_sin (f64 (13843636063867402726))) (f64 (13830306510199120337)) &&
  out_eq64 (ported_cos (f64 (13843636063867402726))) (f64 (4597563363092939639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1146 :
  out_eq64 (ported_sin (f64 (13849008018109214991))) (f64 (4606827983523434415)) &&
  out_eq64 (ported_cos (f64 (13849008018109214991))) (f64 (4598675344112102894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1147 :
  out_eq64 (ported_sin (f64 (4614560843429647450))) (f64 (13817392258339286876)) &&
  out_eq64 (ported_cos (f64 (4614560843429647450))) (f64 (13830472397709181762)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1148 :
  out_eq64 (ported_sin (f64 (4618217822558159737))) (f64 (13825390725183747428)) &&
  out_eq64 (ported_cos (f64 (4618217822558159737))) (f64 (4606157152309328865)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1149 :
  out_eq64 (ported_sin (f64 (13849653863649390967))) (f64 (13829151622422389391)) &&
  out_eq64 (ported_cos (f64 (13849653863649390967))) (f64 (4603002564137589118)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1150 :
  out_eq64 (ported_sin (f64 (4539786551437061892))) (f64 (4539786551436286592)) &&
  out_eq64 (ported_cos (f64 (4539786551437061892))) (f64 (4607182418795523399)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1151 :
  out_eq64 (ported_sin (f64 (4622680751429531781))) (f64 (13829295890877086200)) &&
  out_eq64 (ported_cos (f64 (4622680751429531781))) (f64 (4602767419688554917)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1152 :
  out_eq64 (ported_sin (f64 (4627743289888661287))) (f64 (13814215240221640741)) &&
  out_eq64 (ported_cos (f64 (4627743289888661287))) (f64 (4607149244129140744)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1153 :
  out_eq64 (ported_sin (f64 (4619634976969607072))) (f64 (4604489968858917196)) &&
  out_eq64 (ported_cos (f64 (4619634976969607072))) (f64 (4604598114493855287)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1154 :
  out_eq64 (ported_sin (f64 (13842271112360397365))) (f64 (13816898401319591964)) &&
  out_eq64 (ported_cos (f64 (13842271112360397365))) (f64 (4607114041834341545)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1155 :
  out_eq64 (ported_sin (f64 (4562594313514115601))) (f64 (4562594312562772566)) &&
  out_eq64 (ported_cos (f64 (4562594313514115601))) (f64 (4607182413608286303)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1156 :
  out_eq64 (ported_sin (f64 (13880664487052136198))) (f64 (13830513177856068685)) &&
  out_eq64 (ported_cos (f64 (13880664487052136198))) (f64 (4591555067583855449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1157 :
  out_eq64 (ported_sin (f64 (4623355636780082255))) (f64 (4595016014757540700)) &&
  out_eq64 (ported_cos (f64 (4623355636780082255))) (f64 (4607062975080799651)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1158 :
  out_eq64 (ported_sin (f64 (4618718384782578351))) (f64 (13808891161360157235)) &&
  out_eq64 (ported_cos (f64 (4618718384782578351))) (f64 (4607176190850950860)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1159 :
  out_eq64 (ported_sin (f64 (13847962849929446391))) (f64 (13827910221907465787)) &&
  out_eq64 (ported_cos (f64 (13847962849929446391))) (f64 (13827922388427396594)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1160 :
  out_eq64 (ported_sin (f64 (4641386656989086133))) (f64 (4588889344038931178)) &&
  out_eq64 (ported_cos (f64 (4641386656989086133))) (f64 (13830537920029688348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1161 :
  out_eq64 (ported_sin (f64 (4619165644266513687))) (f64 (4600018588495216931)) &&
  out_eq64 (ported_cos (f64 (4619165644266513687))) (f64 (4606604847999974959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1162 :
  out_eq64 (ported_sin (f64 (4612606026827695616))) (f64 (4604202135696546776)) &&
  out_eq64 (ported_cos (f64 (4612606026827695616))) (f64 (13828240978841277521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1163 :
  out_eq64 (ported_sin (f64 (13728845004533878582))) (f64 (13728845004533878552)) &&
  out_eq64 (ported_cos (f64 (13728845004533878582))) (f64 (4607182418800017280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1164 :
  out_eq64 (ported_sin (f64 (13847304575391540828))) (f64 (13829901940114336258)) &&
  out_eq64 (ported_cos (f64 (13847304575391540828))) (f64 (4600403305724264925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1165 :
  out_eq64 (ported_sin (f64 (4532345708155911349))) (f64 (4532345708155795798)) &&
  out_eq64 (ported_cos (f64 (4532345708155911349))) (f64 (4607182418799516072)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1166 :
  out_eq64 (ported_sin (f64 (4626459370208673321))) (f64 (4607163317724913466)) &&
  out_eq64 (ported_cos (f64 (4626459370208673321))) (f64 (13812726733605758712)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1167 :
  out_eq64 (ported_sin (f64 (13848333472721130404))) (f64 (13817070710830659811)) &&
  out_eq64 (ported_cos (f64 (13848333472721130404))) (f64 (13830482955140977385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1168 :
  out_eq64 (ported_sin (f64 (4582307522209373346))) (f64 (4582306932169228710)) &&
  out_eq64 (ported_cos (f64 (4582307522209373346))) (f64 (4607180021382967724)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1169 :
  out_eq64 (ported_sin (f64 (4618388637325108200))) (f64 (13822882185109327493)) &&
  out_eq64 (ported_cos (f64 (4618388637325108200))) (f64 (4606696225068696336)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1170 :
  out_eq64 (ported_sin (f64 (13717014098999434469))) (f64 (13717014098999434468)) &&
  out_eq64 (ported_cos (f64 (13717014098999434469))) (f64 (4607182418800017405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1171 :
  out_eq64 (ported_sin (f64 (4611748447541423229))) (f64 (4606258389843641206)) &&
  out_eq64 (ported_cos (f64 (4611748447541423229))) (f64 (13824991485744731880)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1172 :
  out_eq64 (ported_sin (f64 (4609778143816506457))) (f64 (4607182279056131084)) &&
  out_eq64 (ported_cos (f64 (4609778143816506457))) (f64 (13796444270104148274)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1173 :
  out_eq64 (ported_sin (f64 (4626238889131242828))) (f64 (4604957744317223248)) &&
  out_eq64 (ported_cos (f64 (4626238889131242828))) (f64 (4604102022741986616)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1174 :
  out_eq64 (ported_sin (f64 (4627226500324968866))) (f64 (13830005087893517611)) &&
  out_eq64 (ported_cos (f64 (4627226500324968866))) (f64 (13823238727342982518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1175 :
  out_eq64 (ported_sin (f64 (4550524271489280882))) (f64 (4550524271457298555)) &&
  out_eq64 (ported_cos (f64 (4550524271489280882))) (f64 (4607182418664820270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1176 :
  out_eq64 (ported_sin (f64 (4622507089067726240))) (f64 (13830324379630193743)) &&
  out_eq64 (ported_cos (f64 (4622507089067726240))) (f64 (4597259246370695878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1177 :
  out_eq64 (ported_sin (f64 (4517577129612670448))) (f64 (4517577129612669530)) &&
  out_eq64 (ported_cos (f64 (4517577129612670448))) (f64 (4607182418800012419)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1178 :
  out_eq64 (ported_sin (f64 (13850476216230542285))) (f64 (4604542771541874525)) &&
  out_eq64 (ported_cos (f64 (13850476216230542285))) (f64 (13827917807395470605)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1179 :
  out_eq64 (ported_sin (f64 (13835109713661817359))) (f64 (13829649342056274060)) &&
  out_eq64 (ported_cos (f64 (13835109713661817359))) (f64 (13824914068816241088)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1180 :
  out_eq64 (ported_sin (f64 (4623201662580347767))) (f64 (13815981006595314418)) &&
  out_eq64 (ported_cos (f64 (4623201662580347767))) (f64 (4607127507135688039)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1181 :
  out_eq64 (ported_sin (f64 (4695913030447838582))) (f64 (13828862584964757595)) &&
  out_eq64 (ported_cos (f64 (4695913030447838582))) (f64 (4603430274864206212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1182 :
  out_eq64 (ported_sin (f64 (13809672546447611368))) (f64 (13809670689375120682)) &&
  out_eq64 (ported_cos (f64 (13809672546447611368))) (f64 (4607174246067890580)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1183 :
  out_eq64 (ported_sin (f64 (4617876929515365047))) (f64 (13827910914498446803)) &&
  out_eq64 (ported_cos (f64 (4617876929515365047))) (f64 (4604549660228296673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1184 :
  out_eq64 (ported_sin (f64 (13847023206375844784))) (f64 (13827266819892371908)) &&
  out_eq64 (ported_cos (f64 (13847023206375844784))) (f64 (4605133396883626635)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1185 :
  out_eq64 (ported_sin (f64 (13850925707705356515))) (f64 (4604377307809195532)) &&
  out_eq64 (ported_cos (f64 (13850925707705356515))) (f64 (4604706968130545405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1186 :
  out_eq64 (ported_sin (f64 (4624729541779023504))) (f64 (4602790772316786137)) &&
  out_eq64 (ported_cos (f64 (4624729541779023504))) (f64 (13829282003391907589)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1187 :
  out_eq64 (ported_sin (f64 (13847796253788453964))) (f64 (13829492827007056191)) &&
  out_eq64 (ported_cos (f64 (13847796253788453964))) (f64 (13825528359747735433)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1188 :
  out_eq64 (ported_sin (f64 (4625126291533400011))) (f64 (13818520332687840342)) &&
  out_eq64 (ported_cos (f64 (4625126291533400011))) (f64 (13830429508785670465)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1189 :
  out_eq64 (ported_sin (f64 (4621809917299563679))) (f64 (13826323198849611251)) &&
  out_eq64 (ported_cos (f64 (4621809917299563679))) (f64 (13829184010431255979)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1190 :
  out_eq64 (ported_sin (f64 (13844808029716494690))) (f64 (13815613274430786466)) &&
  out_eq64 (ported_cos (f64 (13844808029716494690))) (f64 (13830504523617237562)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1191 :
  out_eq64 (ported_sin (f64 (13849050240232388198))) (f64 (4606356936979611675)) &&
  out_eq64 (ported_cos (f64 (13849050240232388198))) (f64 (4601205314427056432)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1192 :
  out_eq64 (ported_sin (f64 (4627124072022669316))) (f64 (13828348763634095058)) &&
  out_eq64 (ported_cos (f64 (4627124072022669316))) (f64 (13827452265947874283)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1193 :
  out_eq64 (ported_sin (f64 (4555305966753463522))) (f64 (4555305966608100540)) &&
  out_eq64 (ported_cos (f64 (4555305966753463522))) (f64 (4607182418211151147)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1194 :
  out_eq64 (ported_sin (f64 (4684238409618829342))) (f64 (13829336184481662504)) &&
  out_eq64 (ported_cos (f64 (4684238409618829342))) (f64 (13826070776904494476)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1195 :
  out_eq64 (ported_sin (f64 (13863400940011205746))) (f64 (13828880010683686936)) &&
  out_eq64 (ported_cos (f64 (13863400940011205746))) (f64 (13826777968878333119)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1196 :
  out_eq64 (ported_sin (f64 (4626470083794092787))) (f64 (4607134497857635742)) &&
  out_eq64 (ported_cos (f64 (4626470083794092787))) (f64 (13815459537358737825)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1197 :
  out_eq64 (ported_sin (f64 (4627313322064441090))) (f64 (13830546280290746042)) &&
  out_eq64 (ported_cos (f64 (4627313322064441090))) (f64 (13809671677150665406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1198 :
  out_eq64 (ported_sin (f64 (13818295800677879253))) (f64 (13818271349525983957)) &&
  out_eq64 (ported_cos (f64 (13818295800677879253))) (f64 (4607067725176006112)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1199 :
  out_eq64 (ported_sin (f64 (4622373038111775156))) (f64 (13830553848216784625)) &&
  out_eq64 (ported_cos (f64 (4622373038111775156))) (f64 (13801220395568267937)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1200 :
  out_eq64 (ported_sin (f64 (13840360395014581697))) (f64 (4607182379201048131)) &&
  out_eq64 (ported_cos (f64 (13840360395014581697))) (f64 (13792355864484803589)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1201 :
  out_eq64 (ported_sin (f64 (13846096876462805058))) (f64 (4605540826474199372)) &&
  out_eq64 (ported_cos (f64 (13846096876462805058))) (f64 (4603359568393802026)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1202 :
  out_eq64 (ported_sin (f64 (4627227514157879862))) (f64 (13830016189888521029)) &&
  out_eq64 (ported_cos (f64 (4627227514157879862))) (f64 (13823177759472343114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1203 :
  out_eq64 (ported_sin (f64 (4618069572716028403))) (f64 (13826732628512921949)) &&
  out_eq64 (ported_cos (f64 (4618069572716028403))) (f64 (4605540106134062400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1204 :
  out_eq64 (ported_sin (f64 (4621404088335741278))) (f64 (4594979829812277196)) &&
  out_eq64 (ported_cos (f64 (4621404088335741278))) (f64 (13830436495276063694)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1205 :
  out_eq64 (ported_sin (f64 (13847410914227777938))) (f64 (13830385347620172436)) &&
  out_eq64 (ported_cos (f64 (13847410914227777938))) (f64 (4596116726068667881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1206 :
  out_eq64 (ported_sin (f64 (4622456489463583351))) (f64 (13830470519653438616)) &&
  out_eq64 (ported_cos (f64 (4622456489463583351))) (f64 (4594075176412560959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1207 :
  out_eq64 (ported_sin (f64 (13844094543306298367))) (f64 (13830378391669994152)) &&
  out_eq64 (ported_cos (f64 (13844094543306298367))) (f64 (13819628851975006202)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1208 :
  out_eq64 (ported_sin (f64 (4618019487170694329))) (f64 (13827055016876877787)) &&
  out_eq64 (ported_cos (f64 (4618019487170694329))) (f64 (4605302225434464731)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1209 :
  out_eq64 (ported_sin (f64 (4622633582882416050))) (f64 (13829653029303505272)) &&
  out_eq64 (ported_cos (f64 (4622633582882416050))) (f64 (4601526830685861935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1210 :
  out_eq64 (ported_sin (f64 (4623265703826689782))) (f64 (4569715898453460944)) &&
  out_eq64 (ported_cos (f64 (4623265703826689782))) (f64 (4607182370267468836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1211 :
  out_eq64 (ported_sin (f64 (4671098873010036758))) (f64 (4598697081391336263)) &&
  out_eq64 (ported_cos (f64 (4671098873010036758))) (f64 (4606824833563218113)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1212 :
  out_eq64 (ported_sin (f64 (13846237607196936759))) (f64 (4604029301291670553)) &&
  out_eq64 (ported_cos (f64 (13846237607196936759))) (f64 (4605020609623361203)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1213 :
  out_eq64 (ported_sin (f64 (4520435641837181356))) (f64 (4520435641837177770)) &&
  out_eq64 (ported_cos (f64 (4520435641837181356))) (f64 (4607182418800005031)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1214 :
  out_eq64 (ported_sin (f64 (4622471696928194557))) (f64 (13830434127670387826)) &&
  out_eq64 (ported_cos (f64 (4622471696928194557))) (f64 (4595037476741131661)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1215 :
  out_eq64 (ported_sin (f64 (13847925929262335174))) (f64 (13828314351077949883)) &&
  out_eq64 (ported_cos (f64 (13847925929262335174))) (f64 (13827491671260656745)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1216 :
  out_eq64 (ported_sin (f64 (4595106502765652374))) (f64 (4595079650204896435)) &&
  out_eq64 (ported_cos (f64 (4595106502765652374))) (f64 (4607060343511734829)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1217 :
  out_eq64 (ported_sin (f64 (4623296223161455750))) (f64 (4588442299270455107)) &&
  out_eq64 (ported_cos (f64 (4623296223161455750))) (f64 (4607167534960827976)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1218 :
  out_eq64 (ported_sin (f64 (4615090545721502517))) (f64 (13823563335294634069)) &&
  out_eq64 (ported_cos (f64 (4615090545721502517))) (f64 (13829943868002788474)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1219 :
  out_eq64 (ported_sin (f64 (4605859683136894614))) (f64 (4604960825025409791)) &&
  out_eq64 (ported_cos (f64 (4605859683136894614))) (f64 (4604098495385771319)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1220 :
  out_eq64 (ported_sin (f64 (4623729191783384848))) (f64 (4604801225091553850)) &&
  out_eq64 (ported_cos (f64 (4623729191783384848))) (f64 (4604276505386417394)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1221 :
  out_eq64 (ported_sin (f64 (4568810763445785147))) (f64 (4568810754167649575)) &&
  out_eq64 (ported_cos (f64 (4568810763445785147))) (f64 (4607182381180396707)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1222 :
  out_eq64 (ported_sin (f64 (4623043527214048732))) (f64 (13823915545660126168)) &&
  out_eq64 (ported_cos (f64 (4623043527214048732))) (f64 (4606501318523445069)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1223 :
  out_eq64 (ported_sin (f64 (4551421194733021047))) (f64 (4551421194685598631)) &&
  out_eq64 (ported_cos (f64 (4551421194733021047))) (f64 (4607182418624218335)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1224 :
  out_eq64 (ported_sin (f64 (13745985140909614516))) (f64 (13745985140909609535)) &&
  out_eq64 (ported_cos (f64 (13745985140909614516))) (f64 (4607182418799992948)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1225 :
  out_eq64 (ported_sin (f64 (13850850588416207758))) (f64 (4605880305022238002)) &&
  out_eq64 (ported_cos (f64 (13850850588416207758))) (f64 (4602840119995159814)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1226 :
  out_eq64 (ported_sin (f64 (13845975212414996831))) (f64 (4606481214401207100)) &&
  out_eq64 (ported_cos (f64 (13845975212414996831))) (f64 (4600640145692518425)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1227 :
  out_eq64 (ported_sin (f64 (13789477500637554016))) (f64 (13789477495888064324)) &&
  out_eq64 (ported_cos (f64 (13789477500637554016))) (f64 (4607182403634682212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1228 :
  out_eq64 (ported_sin (f64 (4523122759409465058))) (f64 (4523122759409458561)) &&
  out_eq64 (ported_cos (f64 (4523122759409465058))) (f64 (4607182418799988208)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1229 :
  out_eq64 (ported_sin (f64 (13843491255724230492))) (f64 (13829964963372229117)) &&
  out_eq64 (ported_cos (f64 (13843491255724230492))) (f64 (4600081564611948517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1230 :
  out_eq64 (ported_sin (f64 (4625593603544325770))) (f64 (13830477387710823627)) &&
  out_eq64 (ported_cos (f64 (4625593603544325770))) (f64 (4593871029007494213)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1231 :
  out_eq64 (ported_sin (f64 (13848673636885066932))) (f64 (4603728229341491190)) &&
  out_eq64 (ported_cos (f64 (13848673636885066932))) (f64 (13828639062983550496)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1232 :
  out_eq64 (ported_sin (f64 (4626236990002030595))) (f64 (4604917601730691006)) &&
  out_eq64 (ported_cos (f64 (4626236990002030595))) (f64 (4604147649610200631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1233 :
  out_eq64 (ported_sin (f64 (4623400659483957648))) (f64 (4597837534493422243)) &&
  out_eq64 (ported_cos (f64 (4623400659483957648))) (f64 (4606917765434917383)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1234 :
  out_eq64 (ported_sin (f64 (4625824523089952831))) (f64 (13826777067894544235)) &&
  out_eq64 (ported_cos (f64 (4625824523089952831))) (f64 (4605508616448941587)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1235 :
  out_eq64 (ported_sin (f64 (13845580870227997177))) (f64 (4606771294879613434)) &&
  out_eq64 (ported_cos (f64 (13845580870227997177))) (f64 (13822424038640545537)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1236 :
  out_eq64 (ported_sin (f64 (4508310304948413689))) (f64 (4508310304948413640)) &&
  out_eq64 (ported_cos (f64 (4508310304948413689))) (f64 (4607182418800017128)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1237 :
  out_eq64 (ported_sin (f64 (13845979586233335367))) (f64 (4606453893132515560)) &&
  out_eq64 (ported_cos (f64 (13845979586233335367))) (f64 (4600769000293947672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1238 :
  out_eq64 (ported_sin (f64 (13849697879892078922))) (f64 (13829810647222325665)) &&
  out_eq64 (ported_cos (f64 (13849697879892078922))) (f64 (4600839886244703147)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1239 :
  out_eq64 (ported_sin (f64 (4626370635156618606))) (f64 (4606902153747528829)) &&
  out_eq64 (ported_cos (f64 (4626370635156618606))) (f64 (4598085650329207101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1240 :
  out_eq64 (ported_sin (f64 (13849815929923068838))) (f64 (13830553991608201334)) &&
  out_eq64 (ported_cos (f64 (13849815929923068838))) (f64 (13800377129634252353)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1241 :
  out_eq64 (ported_sin (f64 (4625837497742659469))) (f64 (13826433597911491544)) &&
  out_eq64 (ported_cos (f64 (4625837497742659469))) (f64 (4605741810921067208)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1242 :
  out_eq64 (ported_sin (f64 (4652280856286199014))) (f64 (4607138418240954537)) &&
  out_eq64 (ported_cos (f64 (4652280856286199014))) (f64 (4591778159736932354)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1243 :
  out_eq64 (ported_sin (f64 (13846064911545776816))) (f64 (4605823170832024807)) &&
  out_eq64 (ported_cos (f64 (13846064911545776816))) (f64 (4602933210668652994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1244 :
  out_eq64 (ported_sin (f64 (13849362166836396382))) (f64 (4584632169329527465)) &&
  out_eq64 (ported_cos (f64 (13849362166836396382))) (f64 (4607178051133603719)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1245 :
  out_eq64 (ported_sin (f64 (13846700541857807766))) (f64 (13816293377639694387)) &&
  out_eq64 (ported_cos (f64 (13846700541857807766))) (f64 (4607123089515831740)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1246 :
  out_eq64 (ported_sin (f64 (4620266442787588868))) (f64 (4606938956522241281)) &&
  out_eq64 (ported_cos (f64 (4620266442787588868))) (f64 (4597488167032688875)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1247 :
  out_eq64 (ported_sin (f64 (4619436326485116396))) (f64 (4603264568056949204)) &&
  out_eq64 (ported_cos (f64 (4619436326485116396))) (f64 (4605606785338656749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1248 :
  out_eq64 (ported_sin (f64 (13850167113709780193))) (f64 (13822590376006881406)) &&
  out_eq64 (ported_cos (f64 (13850167113709780193))) (f64 (13830116860524447149)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1249 :
  out_eq64 (ported_sin (f64 (4622090304727284266))) (f64 (13829391256709046602)) &&
  out_eq64 (ported_cos (f64 (4622090304727284266))) (f64 (13825898327306835506)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1250 :
  out_eq64 (ported_sin (f64 (4623632205263522066))) (f64 (4603657180172553646)) &&
  out_eq64 (ported_cos (f64 (4623632205263522066))) (f64 (4605322089216369413)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1251 :
  out_eq64 (ported_sin (f64 (13847195252068504391))) (f64 (13829095359586490082)) &&
  out_eq64 (ported_cos (f64 (13847195252068504391))) (f64 (4603090072208530254)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1252 :
  out_eq64 (ported_sin (f64 (13876418805548930190))) (f64 (4599149172074644041)) &&
  out_eq64 (ported_cos (f64 (13876418805548930190))) (f64 (4606755938862860465)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1253 :
  out_eq64 (ported_sin (f64 (13845577674793768625))) (f64 (4606755886334538677)) &&
  out_eq64 (ported_cos (f64 (13845577674793768625))) (f64 (13822521538066122965)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1254 :
  out_eq64 (ported_sin (f64 (13848377169982752633))) (f64 (13810514346212331481)) &&
  out_eq64 (ported_cos (f64 (13848377169982752633))) (f64 (13830543880388160647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1255 :
  out_eq64 (ported_sin (f64 (13846182435764747694))) (f64 (4604671013321741127)) &&
  out_eq64 (ported_cos (f64 (13846182435764747694))) (f64 (4604414955247070925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1256 :
  out_eq64 (ported_sin (f64 (13833944261563772067))) (f64 (13830405866110276654)) &&
  out_eq64 (ported_cos (f64 (13833944261563772067))) (f64 (13819057323340917032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1257 :
  out_eq64 (ported_sin (f64 (13841752575670633222))) (f64 (4599632578002624038)) &&
  out_eq64 (ported_cos (f64 (13841752575670633222))) (f64 (4606675006783358620)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1258 :
  out_eq64 (ported_sin (f64 (4602073067223562384))) (f64 (4601771803201870988)) &&
  out_eq64 (ported_cos (f64 (4602073067223562384))) (f64 (4606220491206702766)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1259 :
  out_eq64 (ported_sin (f64 (4499988427900798058))) (f64 (4499988427900798053)) &&
  out_eq64 (ported_cos (f64 (4499988427900798058))) (f64 (4607182418800017385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1260 :
  out_eq64 (ported_sin (f64 (13800566801795620002))) (f64 (13800566691218758542)) &&
  out_eq64 (ported_cos (f64 (13800566801795620002))) (f64 (4607181924199499759)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1261 :
  out_eq64 (ported_sin (f64 (13840328859141495668))) (f64 (4607178098237080266)) &&
  out_eq64 (ported_cos (f64 (13840328859141495668))) (f64 (13807955691116102445)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1262 :
  out_eq64 (ported_sin (f64 (4625053412150848451))) (f64 (13808906819648844064)) &&
  out_eq64 (ported_cos (f64 (4625053412150848451))) (f64 (13830548191240641336)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1263 :
  out_eq64 (ported_sin (f64 (13846865592449744512))) (f64 (13824191783013116593)) &&
  out_eq64 (ported_cos (f64 (13846865592449744512))) (f64 (4606442970825238115)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1264 :
  out_eq64 (ported_sin (f64 (4624506583866924495))) (f64 (4605417395140955066)) &&
  out_eq64 (ported_cos (f64 (4624506583866924495))) (f64 (13826902677117041999)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1265 :
  out_eq64 (ported_sin (f64 (4620822157400421498))) (f64 (4606556284799559537)) &&
  out_eq64 (ported_cos (f64 (4620822157400421498))) (f64 (13823642863882041123)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1266 :
  out_eq64 (ported_sin (f64 (4623354938499322141))) (f64 (4594971912931345643)) &&
  out_eq64 (ported_cos (f64 (4623354938499322141))) (f64 (4607064781700016012)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1267 :
  out_eq64 (ported_sin (f64 (13845486507673203736))) (f64 (4606201990101693239)) &&
  out_eq64 (ported_cos (f64 (13845486507673203736))) (f64 (13825216928540889767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1268 :
  out_eq64 (ported_sin (f64 (4614054077771666253))) (f64 (4591138200954119266)) &&
  out_eq64 (ported_cos (f64 (4614054077771666253))) (f64 (13830518031021077921)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1269 :
  out_eq64 (ported_sin (f64 (13791457685967865588))) (f64 (13791457679400687139)) &&
  out_eq64 (ported_cos (f64 (13791457685967865588))) (f64 (4607182388921444387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1270 :
  out_eq64 (ported_sin (f64 (13844931391077971262))) (f64 (4592846143061220535)) &&
  out_eq64 (ported_cos (f64 (13844931391077971262))) (f64 (13830496205602626218)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1271 :
  out_eq64 (ported_sin (f64 (4624245568349315109))) (f64 (4607047849376049684)) &&
  out_eq64 (ported_cos (f64 (4624245568349315109))) (f64 (13818744672589548215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1272 :
  out_eq64 (ported_sin (f64 (13850875793220000388))) (f64 (4605432271877965939)) &&
  out_eq64 (ported_cos (f64 (13850875793220000388))) (f64 (4603510463668576889)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1273 :
  out_eq64 (ported_sin (f64 (4626698301784337848))) (f64 (4603674916537542169)) &&
  out_eq64 (ported_cos (f64 (4626698301784337848))) (f64 (13828680486482411107)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1274 :
  out_eq64 (ported_sin (f64 (13845380931922538577))) (f64 (4605299323411482554)) &&
  out_eq64 (ported_cos (f64 (13845380931922538577))) (f64 (13827058770032269188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1275 :
  out_eq64 (ported_sin (f64 (13847261801632853322))) (f64 (13829622339508377951)) &&
  out_eq64 (ported_cos (f64 (13847261801632853322))) (f64 (4601652264304981238)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1276 :
  out_eq64 (ported_sin (f64 (4603013832426067948))) (f64 (4602784448318745333)) &&
  out_eq64 (ported_cos (f64 (4603013832426067948))) (f64 (4605913736750040705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1277 :
  out_eq64 (ported_sin (f64 (4594038021603416781))) (f64 (4594023205305345426)) &&
  out_eq64 (ported_cos (f64 (4594038021603416781))) (f64 (4607100259437013845)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1278 :
  out_eq64 (ported_sin (f64 (4622513146258150853))) (f64 (13830302107127953651)) &&
  out_eq64 (ported_cos (f64 (4622513146258150853))) (f64 (4597636528680348158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1279 :
  out_eq64 (ported_sin (f64 (4622211433117786673))) (f64 (13830155663528742569)) &&
  out_eq64 (ported_cos (f64 (4622211433117786673))) (f64 (13822344586925520916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1280 :
  out_eq64 (ported_sin (f64 (4590515238222940656))) (f64 (4590508811408800765)) &&
  out_eq64 (ported_cos (f64 (4590515238222940656))) (f64 (4607152743524765375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1281 :
  out_eq64 (ported_sin (f64 (13850756524304888694))) (f64 (4606984124202935044)) &&
  out_eq64 (ported_cos (f64 (13850756524304888694))) (f64 (4596686357497005275)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1282 :
  out_eq64 (ported_sin (f64 (13714980191789907819))) (f64 (13714980191789907819)) &&
  out_eq64 (ported_cos (f64 (13714980191789907819))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1283 :
  out_eq64 (ported_sin (f64 (4585667855295876869))) (f64 (4585666515153714925)) &&
  out_eq64 (ported_cos (f64 (4585667855295876869))) (f64 (4607175843387895605)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1284 :
  out_eq64 (ported_sin (f64 (4625940984062427014))) (f64 (13819900597450952472)) &&
  out_eq64 (ported_cos (f64 (4625940984062427014))) (f64 (4606992449343527741)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1285 :
  out_eq64 (ported_sin (f64 (13840905661360727494))) (f64 (4606159026635067245)) &&
  out_eq64 (ported_cos (f64 (13840905661360727494))) (f64 (4602011515065355288)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1286 :
  out_eq64 (ported_sin (f64 (13886532696119726644))) (f64 (4580139625789425388)) &&
  out_eq64 (ported_cos (f64 (13886532696119726644))) (f64 (4607181324390434510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1287 :
  out_eq64 (ported_sin (f64 (13850787411121245349))) (f64 (4606725305972967613)) &&
  out_eq64 (ported_cos (f64 (13850787411121245349))) (f64 (4599337539258531050)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1288 :
  out_eq64 (ported_sin (f64 (13849212047662972796))) (f64 (4602993811144939578)) &&
  out_eq64 (ported_cos (f64 (13849212047662972796))) (f64 (4605785135011972632)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1289 :
  out_eq64 (ported_sin (f64 (4625008600468293753))) (f64 (4586255585585698863)) &&
  out_eq64 (ported_cos (f64 (4625008600468293753))) (f64 (13830546397261654249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1290 :
  out_eq64 (ported_sin (f64 (4623072341414145276))) (f64 (13823054587018216706)) &&
  out_eq64 (ported_cos (f64 (4623072341414145276))) (f64 (4606666204047113343)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1291 :
  out_eq64 (ported_sin (f64 (4581336947916950209))) (f64 (4581336580344382160)) &&
  out_eq64 (ported_cos (f64 (4581336947916950209))) (f64 (4607180670076816166)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1292 :
  out_eq64 (ported_sin (f64 (4627466457040807117))) (f64 (13829445611585791192)) &&
  out_eq64 (ported_cos (f64 (4627466457040807117))) (f64 (4602330863250788310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1293 :
  out_eq64 (ported_sin (f64 (4626239419829838352))) (f64 (4604968906769544907)) &&
  out_eq64 (ported_cos (f64 (4626239419829838352))) (f64 (4604089224306300689)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1294 :
  out_eq64 (ported_sin (f64 (13845468756903206794))) (f64 (4606069162899393682)) &&
  out_eq64 (ported_cos (f64 (13845468756903206794))) (f64 (13825718977340037040)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1295 :
  out_eq64 (ported_sin (f64 (13846958677937682687))) (f64 (13826433446956888085)) &&
  out_eq64 (ported_cos (f64 (13846958677937682687))) (f64 (4605741908402160564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1296 :
  out_eq64 (ported_sin (f64 (13848802616656491467))) (f64 (4606292497985869048)) &&
  out_eq64 (ported_cos (f64 (13848802616656491467))) (f64 (13824851199057548775)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1297 :
  out_eq64 (ported_sin (f64 (13794573983474563604))) (f64 (13794573971648667153)) &&
  out_eq64 (ported_cos (f64 (13794573983474563604))) (f64 (4607182348597962553)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1298 :
  out_eq64 (ported_sin (f64 (13827354670647979149))) (f64 (13826960588951311269)) &&
  out_eq64 (ported_cos (f64 (13827354670647979149))) (f64 (4605374210384559789)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1299 :
  out_eq64 (ported_sin (f64 (4666985039963735547))) (f64 (4605101889993397627)) &&
  out_eq64 (ported_cos (f64 (4666985039963735547))) (f64 (13827304936047074189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1300 :
  out_eq64 (ported_sin (f64 (13849251316415226088))) (f64 (4601098722687161938)) &&
  out_eq64 (ported_cos (f64 (13849251316415226088))) (f64 (4606381264544442219)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1301 :
  out_eq64 (ported_sin (f64 (4612067099722572824))) (f64 (4605617118097268881)) &&
  out_eq64 (ported_cos (f64 (4612067099722572824))) (f64 (13826621483864056881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1302 :
  out_eq64 (ported_sin (f64 (13849437382742779027))) (f64 (13820966856826850531)) &&
  out_eq64 (ported_cos (f64 (13849437382742779027))) (f64 (4606932585237084498)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1303 :
  out_eq64 (ported_sin (f64 (13788994751903687171))) (f64 (13788994747921512665)) &&
  out_eq64 (ported_cos (f64 (13788994751903687171))) (f64 (4607182405315536043)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1304 :
  out_eq64 (ported_sin (f64 (13850980168752915935))) (f64 (4603005656409821855)) &&
  out_eq64 (ported_cos (f64 (13850980168752915935))) (f64 (4605777621673041502)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1305 :
  out_eq64 (ported_sin (f64 (4618859811219808871))) (f64 (4591027643801659119)) &&
  out_eq64 (ported_cos (f64 (4618859811219808871))) (f64 (4607147230058729281)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1306 :
  out_eq64 (ported_sin (f64 (13838396709977300556))) (f64 (4599697321702751213)) &&
  out_eq64 (ported_cos (f64 (13838396709977300556))) (f64 (13830035623022355642)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1307 :
  out_eq64 (ported_sin (f64 (13898087153324666772))) (f64 (4605175845663434342)) &&
  out_eq64 (ported_cos (f64 (13898087153324666772))) (f64 (4603842747433904029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1308 :
  out_eq64 (ported_sin (f64 (4618499077837776946))) (f64 (13820823008764504105)) &&
  out_eq64 (ported_cos (f64 (4618499077837776946))) (f64 (4606941158339509385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1309 :
  out_eq64 (ported_sin (f64 (4624864302536860746))) (f64 (4598971624552174532)) &&
  out_eq64 (ported_cos (f64 (4624864302536860746))) (f64 (13830155805995297029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1310 :
  out_eq64 (ported_sin (f64 (13832834648010697290))) (f64 (13830535730742095334)) &&
  out_eq64 (ported_cos (f64 (13832834648010697290))) (f64 (4589308332235376339)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1311 :
  out_eq64 (ported_sin (f64 (4514226163495997098))) (f64 (4514226163495996669)) &&
  out_eq64 (ported_cos (f64 (4514226163495997098))) (f64 (4607182418800015515)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1312 :
  out_eq64 (ported_sin (f64 (4624882735547931600))) (f64 (4598405134454101508)) &&
  out_eq64 (ported_cos (f64 (4624882735547931600))) (f64 (13830237946732155477)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1313 :
  out_eq64 (ported_sin (f64 (13891729992174184003))) (f64 (4606302023816095946)) &&
  out_eq64 (ported_cos (f64 (13891729992174184003))) (f64 (4601439422891307375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1314 :
  out_eq64 (ported_sin (f64 (4609319798561129725))) (f64 (4607140770319481941)) &&
  out_eq64 (ported_cos (f64 (4609319798561129725))) (f64 (4591585866661217751)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1315 :
  out_eq64 (ported_sin (f64 (13882044010015392843))) (f64 (13825536085927250268)) &&
  out_eq64 (ported_cos (f64 (13882044010015392843))) (f64 (4606118726338769152)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1316 :
  out_eq64 (ported_sin (f64 (13850513933004132871))) (f64 (4605336773627285962)) &&
  out_eq64 (ported_cos (f64 (13850513933004132871))) (f64 (13827010019578614799)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1317 :
  out_eq64 (ported_sin (f64 (4529867812734039605))) (f64 (4529867812733972368)) &&
  out_eq64 (ported_cos (f64 (4529867812734039605))) (f64 (4607182418799797284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1318 :
  out_eq64 (ported_sin (f64 (13844077848880801772))) (f64 (13830427056058296313)) &&
  out_eq64 (ported_cos (f64 (13844077848880801772))) (f64 (13818578330334301401)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1319 :
  out_eq64 (ported_sin (f64 (4615230526314185400))) (f64 (13824594001736377688)) &&
  out_eq64 (ported_cos (f64 (4615230526314185400))) (f64 (13829725135779628842)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1320 :
  out_eq64 (ported_sin (f64 (13859465884125311970))) (f64 (13821456424361238523)) &&
  out_eq64 (ported_cos (f64 (13859465884125311970))) (f64 (13830274271247296827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1321 :
  out_eq64 (ported_sin (f64 (4622006305040254374))) (f64 (13828645927512180639)) &&
  out_eq64 (ported_cos (f64 (4622006305040254374))) (f64 (13827091488254551116)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1322 :
  out_eq64 (ported_sin (f64 (4640032513642761152))) (f64 (4604933586153685201)) &&
  out_eq64 (ported_cos (f64 (4640032513642761152))) (f64 (13827501592568001748)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1323 :
  out_eq64 (ported_sin (f64 (4612426240516900906))) (f64 (4604716803224046779)) &&
  out_eq64 (ported_cos (f64 (4612426240516900906))) (f64 (13827738970329833854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1324 :
  out_eq64 (ported_sin (f64 (13850867895348639604))) (f64 (4605579096633661112)) &&
  out_eq64 (ported_cos (f64 (13850867895348639604))) (f64 (4603304765575355378)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1325 :
  out_eq64 (ported_sin (f64 (13850051804671779984))) (f64 (13827504389710113710)) &&
  out_eq64 (ported_cos (f64 (13850051804671779984))) (f64 (13828303157608681800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1326 :
  out_eq64 (ported_sin (f64 (4621036996270809023))) (f64 (4604724454292764685)) &&
  out_eq64 (ported_cos (f64 (4621036996270809023))) (f64 (13827730876912090373)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1327 :
  out_eq64 (ported_sin (f64 (13847311925748024177))) (f64 (13829945174042447196)) &&
  out_eq64 (ported_cos (f64 (13847311925748024177))) (f64 (4600184566312943408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1328 :
  out_eq64 (ported_sin (f64 (13837197300847732310))) (f64 (13819400194637113334)) &&
  out_eq64 (ported_cos (f64 (13837197300847732310))) (f64 (13830389670974940968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1329 :
  out_eq64 (ported_sin (f64 (13850206566791324992))) (f64 (13818735766425168718)) &&
  out_eq64 (ported_cos (f64 (13850206566791324992))) (f64 (13830420275197061203)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1330 :
  out_eq64 (ported_sin (f64 (13839693463311974031))) (f64 (4605632904159754611)) &&
  out_eq64 (ported_cos (f64 (13839693463311974031))) (f64 (13826598254183221595)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1331 :
  out_eq64 (ported_sin (f64 (4622234788666565955))) (f64 (13830258186431514409)) &&
  out_eq64 (ported_cos (f64 (4622234788666565955))) (f64 (13821625942840389372)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1332 :
  out_eq64 (ported_sin (f64 (4621740218439369575))) (f64 (13824636238816222150)) &&
  out_eq64 (ported_cos (f64 (4621740218439369575))) (f64 (13829715353662734248)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1333 :
  out_eq64 (ported_sin (f64 (4625004171104756581))) (f64 (4587388287835514342)) &&
  out_eq64 (ported_cos (f64 (4625004171104756581))) (f64 (13830543121586911654)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1334 :
  out_eq64 (ported_sin (f64 (4627225431574618782))) (f64 (13829993265723916151)) &&
  out_eq64 (ported_cos (f64 (4627225431574618782))) (f64 (13823302910694934854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1335 :
  out_eq64 (ported_sin (f64 (13917588911149127167))) (f64 (13829073917184098232)) &&
  out_eq64 (ported_cos (f64 (13917588911149127167))) (f64 (13826494883695687033)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1336 :
  out_eq64 (ported_sin (f64 (4694074268397710805))) (f64 (4604739548983977336)) &&
  out_eq64 (ported_cos (f64 (4694074268397710805))) (f64 (4604342813681956548)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1337 :
  out_eq64 (ported_sin (f64 (13838360791244940398))) (f64 (4599425768683638029)) &&
  out_eq64 (ported_cos (f64 (13838360791244940398))) (f64 (13830082599475175953)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1338 :
  out_eq64 (ported_sin (f64 (13844359353701832562))) (f64 (13828615992205655000)) &&
  out_eq64 (ported_cos (f64 (13844359353701832562))) (f64 (13827129604698501180)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1339 :
  out_eq64 (ported_sin (f64 (13837722726701253452))) (f64 (4586177202934018018)) &&
  out_eq64 (ported_cos (f64 (13837722726701253452))) (f64 (13830546603291067175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1340 :
  out_eq64 (ported_sin (f64 (4624116773749558748))) (f64 (4607168445171996913)) &&
  out_eq64 (ported_cos (f64 (4624116773749558748))) (f64 (4588185283499107829)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1341 :
  out_eq64 (ported_sin (f64 (13847669707360645392))) (f64 (13830238554864079707)) &&
  out_eq64 (ported_cos (f64 (13847669707360645392))) (f64 (13821772702944501242)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1342 :
  out_eq64 (ported_sin (f64 (13895040644856399670))) (f64 (4602063800755409248)) &&
  out_eq64 (ported_cos (f64 (13895040644856399670))) (f64 (4606145317638290527)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1343 :
  out_eq64 (ported_sin (f64 (13840042946104902009))) (f64 (4606819294628073951)) &&
  out_eq64 (ported_cos (f64 (13840042946104902009))) (f64 (13822107096069272717)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1344 :
  out_eq64 (ported_sin (f64 (4615781597998586274))) (f64 (13827191358265500875)) &&
  out_eq64 (ported_cos (f64 (4615781597998586274))) (f64 (13828566782918774533)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1345 :
  out_eq64 (ported_sin (f64 (4625363713158638933))) (f64 (13828517891186716783)) &&
  out_eq64 (ported_cos (f64 (4625363713158638933))) (f64 (13827251630956964543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1346 :
  out_eq64 (ported_sin (f64 (4657429789239788252))) (f64 (4606193230109529024)) &&
  out_eq64 (ported_cos (f64 (4657429789239788252))) (f64 (4601879212745560141)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1347 :
  out_eq64 (ported_sin (f64 (4627385509038206731))) (f64 (13830349281272537151)) &&
  out_eq64 (ported_cos (f64 (4627385509038206731))) (f64 (4596814192204651285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1348 :
  out_eq64 (ported_sin (f64 (4627381941140606282))) (f64 (13830372803686479127)) &&
  out_eq64 (ported_cos (f64 (4627381941140606282))) (f64 (4596367301932087628)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1349 :
  out_eq64 (ported_sin (f64 (4624545343428686207))) (f64 (4605031802573859761)) &&
  out_eq64 (ported_cos (f64 (4624545343428686207))) (f64 (13827388224435125650)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1350 :
  out_eq64 (ported_sin (f64 (13850832458775986354))) (f64 (4606164583820214594)) &&
  out_eq64 (ported_cos (f64 (13850832458775986354))) (f64 (4601990200781718747)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1351 :
  out_eq64 (ported_sin (f64 (4501189929029824158))) (f64 (4501189929029824150)) &&
  out_eq64 (ported_cos (f64 (4501189929029824158))) (f64 (4607182418800017374)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1352 :
  out_eq64 (ported_sin (f64 (4580241415531628403))) (f64 (4580241222266829173)) &&
  out_eq64 (ported_cos (f64 (4580241415531628403))) (f64 (4607181279607502365)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1353 :
  out_eq64 (ported_sin (f64 (4613820060769054296))) (f64 (4596109867908904420)) &&
  out_eq64 (ported_cos (f64 (4613820060769054296))) (f64 (13830385684449898855)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1354 :
  out_eq64 (ported_sin (f64 (13804109966662576737))) (f64 (13804109703553812401)) &&
  out_eq64 (ported_cos (f64 (13804109966662576737))) (f64 (4607181019478308198)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1355 :
  out_eq64 (ported_sin (f64 (13841996271288181177))) (f64 (4593348651356004642)) &&
  out_eq64 (ported_cos (f64 (13841996271288181177))) (f64 (4607116766702200980)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1356 :
  out_eq64 (ported_sin (f64 (4627642874664477931))) (f64 (13824759047121362129)) &&
  out_eq64 (ported_cos (f64 (4627642874664477931))) (f64 (4606314496316370947)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1357 :
  out_eq64 (ported_sin (f64 (4620008125593625626))) (f64 (4606236258973768917)) &&
  out_eq64 (ported_cos (f64 (4620008125593625626))) (f64 (4601708853707437236)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1358 :
  out_eq64 (ported_sin (f64 (4685569004647076264))) (f64 (4586515641277239763)) &&
  out_eq64 (ported_cos (f64 (4685569004647076264))) (f64 (4607173657711372551)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1359 :
  out_eq64 (ported_sin (f64 (4620864488165169616))) (f64 (4606284723335464331)) &&
  out_eq64 (ported_cos (f64 (4620864488165169616))) (f64 (13824883449293286981)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1360 :
  out_eq64 (ported_sin (f64 (4526329252618431194))) (f64 (4526329252618418658)) &&
  out_eq64 (ported_cos (f64 (4526329252618431194))) (f64 (4607182418799945568)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1361 :
  out_eq64 (ported_sin (f64 (13841583848949769210))) (f64 (4602103789906450745)) &&
  out_eq64 (ported_cos (f64 (13841583848949769210))) (f64 (4606134758836948873)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1362 :
  out_eq64 (ported_sin (f64 (13849382133429918951))) (f64 (13809266041031003935)) &&
  out_eq64 (ported_cos (f64 (13849382133429918951))) (f64 (4607175288565241268)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1363 :
  out_eq64 (ported_sin (f64 (13850444760740441622))) (f64 (4603792608890293423)) &&
  out_eq64 (ported_cos (f64 (13850444760740441622))) (f64 (13828588177885276731)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1364 :
  out_eq64 (ported_sin (f64 (13756207509903450796))) (f64 (13756207509903305785)) &&
  out_eq64 (ported_cos (f64 (13756207509903450796))) (f64 (4607182418799434123)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1365 :
  out_eq64 (ported_sin (f64 (4667533766774498636))) (f64 (4606994344715440993)) &&
  out_eq64 (ported_cos (f64 (4667533766774498636))) (f64 (4596492138965244404)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1366 :
  out_eq64 (ported_sin (f64 (13841420687809848213))) (f64 (4603496544765092495)) &&
  out_eq64 (ported_cos (f64 (13841420687809848213))) (f64 (4605442484252135252)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1367 :
  out_eq64 (ported_sin (f64 (4627204120735196928))) (f64 (13829732348315177324)) &&
  out_eq64 (ported_cos (f64 (4627204120735196928))) (f64 (13824562674994646721)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1368 :
  out_eq64 (ported_sin (f64 (4622576920955819469))) (f64 (13830006658442069135)) &&
  out_eq64 (ported_cos (f64 (4622576920955819469))) (f64 (4599858106968284928)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1369 :
  out_eq64 (ported_sin (f64 (13850869539286661703))) (f64 (4605549011716981706)) &&
  out_eq64 (ported_cos (f64 (13850869539286661703))) (f64 (4603347919751465101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1370 :
  out_eq64 (ported_sin (f64 (13751144403638956831))) (f64 (13751144403638928903)) &&
  out_eq64 (ported_cos (f64 (13751144403638956831))) (f64 (4607182418799894865)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1371 :
  out_eq64 (ported_sin (f64 (13850170898214911965))) (f64 (13822359440437937312)) &&
  out_eq64 (ported_cos (f64 (13850170898214911965))) (f64 (13830153373376985384)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1372 :
  out_eq64 (ported_sin (f64 (13767729468290474536))) (f64 (13767729468287237115)) &&
  out_eq64 (ported_cos (f64 (13767729468290474536))) (f64 (4607182418781518748)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1373 :
  out_eq64 (ported_sin (f64 (4626178019968675470))) (f64 (4603528061889883635)) &&
  out_eq64 (ported_cos (f64 (4626178019968675470))) (f64 (4605419301077699044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1374 :
  out_eq64 (ported_sin (f64 (4521295702561086755))) (f64 (4521295702561081852)) &&
  out_eq64 (ported_cos (f64 (4521295702561086755))) (f64 (4607182418800002162)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1375 :
  out_eq64 (ported_sin (f64 (13836791912013503286))) (f64 (13823584899217683707)) &&
  out_eq64 (ported_cos (f64 (13836791912013503286))) (f64 (13829939674122826324)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1376 :
  out_eq64 (ported_sin (f64 (13847177917763123995))) (f64 (13828940467736493361)) &&
  out_eq64 (ported_cos (f64 (13847177917763123995))) (f64 (4603320126206171727)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1377 :
  out_eq64 (ported_sin (f64 (13845130576553487928))) (f64 (4601791750491002877)) &&
  out_eq64 (ported_cos (f64 (13845130576553487928))) (f64 (13829587499448839412)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1378 :
  out_eq64 (ported_sin (f64 (13772038289571941285))) (f64 (13772038289560526714)) &&
  out_eq64 (ported_cos (f64 (13772038289571941285))) (f64 (4607182418731992623)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1379 :
  out_eq64 (ported_sin (f64 (4625578354035233785))) (f64 (13830527952956436576)) &&
  out_eq64 (ported_cos (f64 (4625578354035233785))) (f64 (4590188058749805596)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1380 :
  out_eq64 (ported_sin (f64 (4618016688684281539))) (f64 (13827072714412047096)) &&
  out_eq64 (ported_cos (f64 (4618016688684281539))) (f64 (4605288513590392810)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1381 :
  out_eq64 (ported_sin (f64 (4625571878073563200))) (f64 (13830541460227164916)) &&
  out_eq64 (ported_cos (f64 (4625571878073563200))) (f64 (4587899528830075664)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1382 :
  out_eq64 (ported_sin (f64 (13848780018844342010))) (f64 (4605953280217663202)) &&
  out_eq64 (ported_cos (f64 (13848780018844342010))) (f64 (13826089437659235602)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1383 :
  out_eq64 (ported_sin (f64 (4625978994072465888))) (f64 (13813127105879829273)) &&
  out_eq64 (ported_cos (f64 (4625978994072465888))) (f64 (4607159913263788776)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1384 :
  out_eq64 (ported_sin (f64 (4622030171931569325))) (f64 (13828874532268859636)) &&
  out_eq64 (ported_cos (f64 (4622030171931569325))) (f64 (13826785640383400453)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1385 :
  out_eq64 (ported_sin (f64 (13838357950255519234))) (f64 (4599404226831639735)) &&
  out_eq64 (ported_cos (f64 (13838357950255519234))) (f64 (13830086222549871504)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1386 :
  out_eq64 (ported_sin (f64 (4626358111899137366))) (f64 (4606794360627992968)) &&
  out_eq64 (ported_cos (f64 (4626358111899137366))) (f64 (4598902316013392420)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1387 :
  out_eq64 (ported_sin (f64 (4627006252303862184))) (f64 (13824671946011409265)) &&
  out_eq64 (ported_cos (f64 (4627006252303862184))) (f64 (13829707032085522082)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1388 :
  out_eq64 (ported_sin (f64 (13845817516872221009))) (f64 (4607120766858193852)) &&
  out_eq64 (ported_cos (f64 (13845817516872221009))) (f64 (4593080868130213549)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1389 :
  out_eq64 (ported_sin (f64 (13850545546174379664))) (f64 (4605903900546132652)) &&
  out_eq64 (ported_cos (f64 (13850545546174379664))) (f64 (13826172959417066020)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1390 :
  out_eq64 (ported_sin (f64 (13844470702054941671))) (f64 (13827381196898557725)) &&
  out_eq64 (ported_cos (f64 (13844470702054941671))) (f64 (13828409819818666588)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1391 :
  out_eq64 (ported_sin (f64 (4627633252750117091))) (f64 (13825310895878963046)) &&
  out_eq64 (ported_cos (f64 (4627633252750117091))) (f64 (4606177895835399608)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1392 :
  out_eq64 (ported_sin (f64 (4622534401866904781))) (f64 (13830215948738913486)) &&
  out_eq64 (ported_cos (f64 (4622534401866904781))) (f64 (4598563822509285284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1393 :
  out_eq64 (ported_sin (f64 (4613698852375853668))) (f64 (4598001891196136795)) &&
  out_eq64 (ported_cos (f64 (4613698852375853668))) (f64 (13830279513194034796)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1394 :
  out_eq64 (ported_sin (f64 (4625901680026104713))) (f64 (13823142516743112321)) &&
  out_eq64 (ported_cos (f64 (4625901680026104713))) (f64 (4606650513946055454)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1395 :
  out_eq64 (ported_sin (f64 (4607536187615804009))) (f64 (4606113035600728663)) &&
  out_eq64 (ported_cos (f64 (4607536187615804009))) (f64 (4602185306471781677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1396 :
  out_eq64 (ported_sin (f64 (4623523894110626119))) (f64 (4601700068836302423)) &&
  out_eq64 (ported_cos (f64 (4623523894110626119))) (f64 (4606238447212022605)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1397 :
  out_eq64 (ported_sin (f64 (4607012776017752107))) (f64 (4605661519163360493)) &&
  out_eq64 (ported_cos (f64 (4607012776017752107))) (f64 (4603183707984204960)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1398 :
  out_eq64 (ported_sin (f64 (4626093566511921469))) (f64 (4599616943839839737)) &&
  out_eq64 (ported_cos (f64 (4626093566511921469))) (f64 (4606677743834005444)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1399 :
  out_eq64 (ported_sin (f64 (4623083439411975024))) (f64 (13822718658080056369)) &&
  out_eq64 (ported_cos (f64 (4623083439411975024))) (f64 (4606723800038839702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1400 :
  out_eq64 (ported_sin (f64 (4618256936041670643))) (f64 (13824831219672604582)) &&
  out_eq64 (ported_cos (f64 (4618256936041670643))) (f64 (4606297294676333932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1401 :
  out_eq64 (ported_sin (f64 (4623402429012807191))) (f64 (4597947413774338835)) &&
  out_eq64 (ported_cos (f64 (4623402429012807191))) (f64 (4606910909503324439)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1402 :
  out_eq64 (ported_sin (f64 (13841000767156360019))) (f64 (4605778739449830279)) &&
  out_eq64 (ported_cos (f64 (13841000767156360019))) (f64 (4603003896742569676)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1403 :
  out_eq64 (ported_sin (f64 (13907444346607212046))) (f64 (13830290718600080508)) &&
  out_eq64 (ported_cos (f64 (13907444346607212046))) (f64 (13821194773474604284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1404 :
  out_eq64 (ported_sin (f64 (13805238015273790676))) (f64 (13805237535127954696)) &&
  out_eq64 (ported_cos (f64 (13805238015273790676))) (f64 (4607180329153579175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1405 :
  out_eq64 (ported_sin (f64 (13851135547307000630))) (f64 (4579232680276265248)) &&
  out_eq64 (ported_cos (f64 (13851135547307000630))) (f64 (4607181534167052677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1406 :
  out_eq64 (ported_sin (f64 (4491050191088116402))) (f64 (4491050191088116402)) &&
  out_eq64 (ported_cos (f64 (4491050191088116402))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1407 :
  out_eq64 (ported_sin (f64 (4585391629856499871))) (f64 (4585390481419491690)) &&
  out_eq64 (ported_cos (f64 (4585391629856499871))) (f64 (4607176486401949481)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1408 :
  out_eq64 (ported_sin (f64 (13845854803761591624))) (f64 (4607031519945138712)) &&
  out_eq64 (ported_cos (f64 (13845854803761591624))) (f64 (4595735310924586104)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1409 :
  out_eq64 (ported_sin (f64 (13848541205783229492))) (f64 (4597834428886092024)) &&
  out_eq64 (ported_cos (f64 (13848541205783229492))) (f64 (13830289994732121622)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1410 :
  out_eq64 (ported_sin (f64 (4620576005154046853))) (f64 (4607174508589228800)) &&
  out_eq64 (ported_cos (f64 (4620576005154046853))) (f64 (13809571350269413440)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1411 :
  out_eq64 (ported_sin (f64 (13922080287088212034))) (f64 (4607046383161436425)) &&
  out_eq64 (ported_cos (f64 (13922080287088212034))) (f64 (13818778126731233545)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1412 :
  out_eq64 (ported_sin (f64 (4624069331236941756))) (f64 (4607094311762068941)) &&
  out_eq64 (ported_cos (f64 (4624069331236941756))) (f64 (4594195039197136321)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1413 :
  out_eq64 (ported_sin (f64 (13907343832048711604))) (f64 (4606797715663777401)) &&
  out_eq64 (ported_cos (f64 (13907343832048711604))) (f64 (13822252187890393182)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1414 :
  out_eq64 (ported_sin (f64 (13849758429710504758))) (f64 (13830385261677648032)) &&
  out_eq64 (ported_cos (f64 (13849758429710504758))) (f64 (4596118474811264639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1415 :
  out_eq64 (ported_sin (f64 (4620040475846952097))) (f64 (4606348381927939603)) &&
  out_eq64 (ported_cos (f64 (4620040475846952097))) (f64 (4601242367590685958)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1416 :
  out_eq64 (ported_sin (f64 (4618094590794495909))) (f64 (13826567710299533873)) &&
  out_eq64 (ported_cos (f64 (4618094590794495909))) (f64 (4605653500167036086)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1417 :
  out_eq64 (ported_sin (f64 (13845259837228878120))) (f64 (4603958692101002354)) &&
  out_eq64 (ported_cos (f64 (13845259837228878120))) (f64 (13828452405465189889)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1418 :
  out_eq64 (ported_sin (f64 (13764888622988980276))) (f64 (13764888622986981837)) &&
  out_eq64 (ported_cos (f64 (13764888622988980276))) (f64 (4607182418791568872)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1419 :
  out_eq64 (ported_sin (f64 (13848227988771896901))) (f64 (13822598461898620924)) &&
  out_eq64 (ported_cos (f64 (13848227988771896901))) (f64 (13830115551062224889)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1420 :
  out_eq64 (ported_sin (f64 (4656390153921950487))) (f64 (13823668506009746353)) &&
  out_eq64 (ported_cos (f64 (4656390153921950487))) (f64 (4606551225846679713)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1421 :
  out_eq64 (ported_sin (f64 (4609153452517027421))) (f64 (4607102705967866553)) &&
  out_eq64 (ported_cos (f64 (4609153452517027421))) (f64 (4593950696677790468)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1422 :
  out_eq64 (ported_sin (f64 (13747095290714556664))) (f64 (13747095290714548019)) &&
  out_eq64 (ported_cos (f64 (13747095290714556664))) (f64 (4607182418799982084)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1423 :
  out_eq64 (ported_sin (f64 (4627052881664733478))) (f64 (13826654764257336106)) &&
  out_eq64 (ported_cos (f64 (4627052881664733478))) (f64 (13828966353508352539)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1424 :
  out_eq64 (ported_sin (f64 (13843001580658507499))) (f64 (13827830937854863474)) &&
  out_eq64 (ported_cos (f64 (13843001580658507499))) (f64 (4604628512176876803)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1425 :
  out_eq64 (ported_sin (f64 (4620797746433275811))) (f64 (4606691441032829453)) &&
  out_eq64 (ported_cos (f64 (4620797746433275811))) (f64 (13822910038959190417)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1426 :
  out_eq64 (ported_sin (f64 (4626895679323468590))) (f64 (13809932600104136033)) &&
  out_eq64 (ported_cos (f64 (4626895679323468590))) (f64 (13830545570203408318)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1427 :
  out_eq64 (ported_sin (f64 (13844699034647317311))) (f64 (13822349345660659611)) &&
  out_eq64 (ported_cos (f64 (13844699034647317311))) (f64 (13830154930578981378)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1428 :
  out_eq64 (ported_sin (f64 (4615244891884813940))) (f64 (13824698190497822253)) &&
  out_eq64 (ported_cos (f64 (4615244891884813940))) (f64 (13829700885455710708)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1429 :
  out_eq64 (ported_sin (f64 (13840081416773522604))) (f64 (4606900738140449285)) &&
  out_eq64 (ported_cos (f64 (13840081416773522604))) (f64 (13821479823280864592)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1430 :
  out_eq64 (ported_sin (f64 (4679779962006620180))) (f64 (13826581262791146732)) &&
  out_eq64 (ported_cos (f64 (4679779962006620180))) (f64 (4605644384027936195)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1431 :
  out_eq64 (ported_sin (f64 (13847776843282785386))) (f64 (13829634351583737161)) &&
  out_eq64 (ported_cos (f64 (13847776843282785386))) (f64 (13824975498905408924)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1432 :
  out_eq64 (ported_sin (f64 (4625370905526022081))) (f64 (13828661360379788395)) &&
  out_eq64 (ported_cos (f64 (4625370905526022081))) (f64 (13827071671570919512)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1433 :
  out_eq64 (ported_sin (f64 (4680940328344989555))) (f64 (4606206445705112144)) &&
  out_eq64 (ported_cos (f64 (4680940328344989555))) (f64 (13825199401934020929)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1434 :
  out_eq64 (ported_sin (f64 (4624115953574778226))) (f64 (4607167704938599033)) &&
  out_eq64 (ported_cos (f64 (4624115953574778226))) (f64 (4588394913916278055)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1435 :
  out_eq64 (ported_sin (f64 (4625258441387536201))) (f64 (13825853113563898900)) &&
  out_eq64 (ported_cos (f64 (4625258441387536201))) (f64 (13829403973664630738)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1436 :
  out_eq64 (ported_sin (f64 (13867256351006723938))) (f64 (4605981537343128625)) &&
  out_eq64 (ported_cos (f64 (13867256351006723938))) (f64 (4602658508334603329)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1437 :
  out_eq64 (ported_sin (f64 (13853906772731701354))) (f64 (13820721563285269332)) &&
  out_eq64 (ported_cos (f64 (13853906772731701354))) (f64 (4606947110632420677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1438 :
  out_eq64 (ported_sin (f64 (4595897832880592156))) (f64 (4595858766743502292)) &&
  out_eq64 (ported_cos (f64 (4595897832880592156))) (f64 (4607025742575498338)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1439 :
  out_eq64 (ported_sin (f64 (13844927268311804058))) (f64 (4592321627027294849)) &&
  out_eq64 (ported_cos (f64 (13844927268311804058))) (f64 (13830503455413542786)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1440 :
  out_eq64 (ported_sin (f64 (13733491679131861401))) (f64 (13733491679131861272)) &&
  out_eq64 (ported_cos (f64 (13733491679131861401))) (f64 (4607182418800016871)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1441 :
  out_eq64 (ported_sin (f64 (4625232044462965775))) (f64 (13824342945101502439)) &&
  out_eq64 (ported_cos (f64 (4625232044462965775))) (f64 (13829781923113878116)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1442 :
  out_eq64 (ported_sin (f64 (4698678662753823631))) (f64 (4606218972456411742)) &&
  out_eq64 (ported_cos (f64 (4698678662753823631))) (f64 (13825149871060302960)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1443 :
  out_eq64 (ported_sin (f64 (4594386273991324788))) (f64 (4594368048918727555)) &&
  out_eq64 (ported_cos (f64 (4594386273991324788))) (f64 (4607088110199055950)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1444 :
  out_eq64 (ported_sin (f64 (4622295559424324122))) (f64 (13830454330131092769)) &&
  out_eq64 (ported_cos (f64 (4622295559424324122))) (f64 (13817897184680719215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1445 :
  out_eq64 (ported_sin (f64 (13849664498520880667))) (f64 (13829328541838182040)) &&
  out_eq64 (ported_cos (f64 (13849664498520880667))) (f64 (4602711874187736603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1446 :
  out_eq64 (ported_sin (f64 (13850013653187212836))) (f64 (13828362655276562206)) &&
  out_eq64 (ported_cos (f64 (13850013653187212836))) (f64 (13827436227156362120)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1447 :
  out_eq64 (ported_sin (f64 (13844183996270876544))) (f64 (13829986716420264884)) &&
  out_eq64 (ported_cos (f64 (13844183996270876544))) (f64 (13823338147373783240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1448 :
  out_eq64 (ported_sin (f64 (4611974489730404339))) (f64 (4605819454654424726)) &&
  out_eq64 (ported_cos (f64 (4611974489730404339))) (f64 (13826311215678915868)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1449 :
  out_eq64 (ported_sin (f64 (13800783829872796983))) (f64 (13800783706945302856)) &&
  out_eq64 (ported_cos (f64 (13800783829872796983))) (f64 (4607181888024472096)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1450 :
  out_eq64 (ported_sin (f64 (13921057078458907885))) (f64 (4599460160495225899)) &&
  out_eq64 (ported_cos (f64 (13921057078458907885))) (f64 (13830076783814322413)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1451 :
  out_eq64 (ported_sin (f64 (13895542195594148050))) (f64 (13829650645113784495)) &&
  out_eq64 (ported_cos (f64 (13895542195594148050))) (f64 (13824908700896846101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1452 :
  out_eq64 (ported_sin (f64 (4493002330925196792))) (f64 (4493002330925196791)) &&
  out_eq64 (ported_cos (f64 (4493002330925196792))) (f64 (4607182418800017405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1453 :
  out_eq64 (ported_sin (f64 (4619680206532058158))) (f64 (4604742824863672672)) &&
  out_eq64 (ported_cos (f64 (4619680206532058158))) (f64 (4604339325222207977)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1454 :
  out_eq64 (ported_sin (f64 (4644865077959570648))) (f64 (13830212573105107321)) &&
  out_eq64 (ported_cos (f64 (4644865077959570648))) (f64 (13821959722197673450)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1455 :
  out_eq64 (ported_sin (f64 (4626769347868353764))) (f64 (4600759658074016506)) &&
  out_eq64 (ported_cos (f64 (4626769347868353764))) (f64 (13829827930719755106)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1456 :
  out_eq64 (ported_sin (f64 (13841861174462016574))) (f64 (4597760212393080823)) &&
  out_eq64 (ported_cos (f64 (13841861174462016574))) (f64 (4606922535024562987)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1457 :
  out_eq64 (ported_sin (f64 (4626792617899394613))) (f64 (4599367853121604100)) &&
  out_eq64 (ported_cos (f64 (4626792617899394613))) (f64 (13830092305857889099)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1458 :
  out_eq64 (ported_sin (f64 (13842265726404918307))) (f64 (13816556216830194377)) &&
  out_eq64 (ported_cos (f64 (13842265726404918307))) (f64 (4607119238636088666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1459 :
  out_eq64 (ported_sin (f64 (13840212007299115362))) (f64 (4607100755940253045)) &&
  out_eq64 (ported_cos (f64 (13840212007299115362))) (f64 (13817380616578359097)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1460 :
  out_eq64 (ported_sin (f64 (4622986480745662018))) (f64 (13825564854992808072)) &&
  out_eq64 (ported_cos (f64 (4622986480745662018))) (f64 (4606111020301213752)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1461 :
  out_eq64 (ported_sin (f64 (4620701433939528072))) (f64 (4607066490529589835)) &&
  out_eq64 (ported_cos (f64 (4620701433939528072))) (f64 (13818301916148255276)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1462 :
  out_eq64 (ported_sin (f64 (4627296800214916750))) (f64 (13830508274324913118)) &&
  out_eq64 (ported_cos (f64 (4627296800214916750))) (f64 (13815323909374071240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1463 :
  out_eq64 (ported_sin (f64 (4617349398396771876))) (f64 (13830103694932133165)) &&
  out_eq64 (ported_cos (f64 (4617349398396771876))) (f64 (4599299052036137906)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1464 :
  out_eq64 (ported_sin (f64 (13849187912084348340))) (f64 (4603627834193821819)) &&
  out_eq64 (ported_cos (f64 (13849187912084348340))) (f64 (4605344503464125967)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1465 :
  out_eq64 (ported_sin (f64 (13827208662332820163))) (f64 (13826843185914611907)) &&
  out_eq64 (ported_cos (f64 (13827208662332820163))) (f64 (4605461011814578521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1466 :
  out_eq64 (ported_sin (f64 (4662419432378319240))) (f64 (13830188860613051253)) &&
  out_eq64 (ported_cos (f64 (4662419432378319240))) (f64 (13822123938276883678)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1467 :
  out_eq64 (ported_sin (f64 (4611610960873043699))) (f64 (4606426772255498486)) &&
  out_eq64 (ported_cos (f64 (4611610960873043699))) (f64 (13824266264690887862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1468 :
  out_eq64 (ported_sin (f64 (13839931651509574596))) (f64 (4606527245687643497)) &&
  out_eq64 (ported_cos (f64 (13839931651509574596))) (f64 (13823788520813364398)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1469 :
  out_eq64 (ported_sin (f64 (13835672792601593685))) (f64 (13828423549045880833)) &&
  out_eq64 (ported_cos (f64 (13835672792601593685))) (f64 (13827365008359660856)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1470 :
  out_eq64 (ported_sin (f64 (4625654432403858333))) (f64 (13830017552725507905)) &&
  out_eq64 (ported_cos (f64 (4625654432403858333))) (f64 (4599798191087354186)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1471 :
  out_eq64 (ported_sin (f64 (13848746810634719037))) (f64 (4605364570270098221)) &&
  out_eq64 (ported_cos (f64 (13848746810634719037))) (f64 (13826973385275236711)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1472 :
  out_eq64 (ported_sin (f64 (13848056640300960084))) (f64 (13826764893556784920)) &&
  out_eq64 (ported_cos (f64 (13848056640300960084))) (f64 (13828889320204956744)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1473 :
  out_eq64 (ported_sin (f64 (4601843667843622163))) (f64 (4601566251406122017)) &&
  out_eq64 (ported_cos (f64 (4601843667843622163))) (f64 (4606271412282046175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1474 :
  out_eq64 (ported_sin (f64 (4618771751459601494))) (f64 (4577039102982966506)) &&
  out_eq64 (ported_cos (f64 (4618771751459601494))) (f64 (4607181949343299796)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1475 :
  out_eq64 (ported_sin (f64 (13841665404648017447))) (f64 (4600929571456973569)) &&
  out_eq64 (ported_cos (f64 (13841665404648017447))) (f64 (4606419015593138291)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1476 :
  out_eq64 (ported_sin (f64 (4613310563074028854))) (f64 (4601019644884354742)) &&
  out_eq64 (ported_cos (f64 (4613310563074028854))) (f64 (13829771079761951352)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1477 :
  out_eq64 (ported_sin (f64 (13850603491017424409))) (f64 (4606686253653258864)) &&
  out_eq64 (ported_cos (f64 (13850603491017424409))) (f64 (13822940074948953180)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1478 :
  out_eq64 (ported_sin (f64 (4625792412377607115))) (f64 (13827577855368011715)) &&
  out_eq64 (ported_cos (f64 (4625792412377607115))) (f64 (4604865624204357405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1479 :
  out_eq64 (ported_sin (f64 (4656948908306445851))) (f64 (4604709577572262991)) &&
  out_eq64 (ported_cos (f64 (4656948908306445851))) (f64 (13827746595363987233)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1480 :
  out_eq64 (ported_sin (f64 (13842154484743089322))) (f64 (13804709967905957774)) &&
  out_eq64 (ported_cos (f64 (13842154484743089322))) (f64 (4607180669244848090)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1481 :
  out_eq64 (ported_sin (f64 (13722315136684975241))) (f64 (13722315136684975236)) &&
  out_eq64 (ported_cos (f64 (13722315136684975241))) (f64 (4607182418800017393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1482 :
  out_eq64 (ported_sin (f64 (4614889354581202090))) (f64 (13822038904260684892)) &&
  out_eq64 (ported_cos (f64 (4614889354581202090))) (f64 (13830201244731914372)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1483 :
  out_eq64 (ported_sin (f64 (4627291376243553674))) (f64 (13830489058250697378)) &&
  out_eq64 (ported_cos (f64 (4627291376243553674))) (f64 (13816703888337852536)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1484 :
  out_eq64 (ported_sin (f64 (4626819806327143389))) (f64 (4597210955342893946)) &&
  out_eq64 (ported_cos (f64 (4626819806327143389))) (f64 (13830327153218841047)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1485 :
  out_eq64 (ported_sin (f64 (13741512219183230198))) (f64 (13741512219183228932)) &&
  out_eq64 (ported_cos (f64 (13741512219183230198))) (f64 (4607182418800011225)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1486 :
  out_eq64 (ported_sin (f64 (13809928989063730301))) (f64 (13809926889454099750)) &&
  out_eq64 (ported_cos (f64 (13809928989063730301))) (f64 (4607173549206790316)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1487 :
  out_eq64 (ported_sin (f64 (13812094998618646842))) (f64 (13812089962456773949)) &&
  out_eq64 (ported_cos (f64 (13812094998618646842))) (f64 (4607166526848110282)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1488 :
  out_eq64 (ported_sin (f64 (13850202614744318863))) (f64 (13819233465544094728)) &&
  out_eq64 (ported_cos (f64 (13850202614744318863))) (f64 (13830397653632100630)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1489 :
  out_eq64 (ported_sin (f64 (4625966714142809239))) (f64 (13816257074617315891)) &&
  out_eq64 (ported_cos (f64 (4625966714142809239))) (f64 (4607123611783061621)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1490 :
  out_eq64 (ported_sin (f64 (4622949956258720384))) (f64 (13826313408941496307)) &&
  out_eq64 (ported_cos (f64 (4622949956258720384))) (f64 (4605818087355613894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1491 :
  out_eq64 (ported_sin (f64 (4579136386436020296))) (f64 (4579136131303937542)) &&
  out_eq64 (ported_cos (f64 (4579136386436020296))) (f64 (4607181555185374235)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1492 :
  out_eq64 (ported_sin (f64 (13843891381776600096))) (f64 (13830554136999304497)) &&
  out_eq64 (ported_cos (f64 (13843891381776600096))) (f64 (4576002560745313022)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1493 :
  out_eq64 (ported_sin (f64 (4633081005873008658))) (f64 (13826086222642335248)) &&
  out_eq64 (ported_cos (f64 (4633081005873008658))) (f64 (4605955156811477334)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1494 :
  out_eq64 (ported_sin (f64 (4567496850039891313))) (f64 (4567496845238638045)) &&
  out_eq64 (ported_cos (f64 (4567496850039891313))) (f64 (4607182394551952936)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1495 :
  out_eq64 (ported_sin (f64 (4616261414718644082))) (f64 (13828725253406710370)) &&
  out_eq64 (ported_cos (f64 (4616261414718644082))) (f64 (13826988395746458764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1496 :
  out_eq64 (ported_sin (f64 (4517348021258127814))) (f64 (4517348021258127017)) &&
  out_eq64 (ported_cos (f64 (4517348021258127814))) (f64 (4607182418800012868)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1497 :
  out_eq64 (ported_sin (f64 (4627148906959325381))) (f64 (13828842638321628304)) &&
  out_eq64 (ported_cos (f64 (4627148906959325381))) (f64 (13826829967922835537)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1498 :
  out_eq64 (ported_sin (f64 (4621515816583062552))) (f64 (13808784869515986430)) &&
  out_eq64 (ported_cos (f64 (4621515816583062552))) (f64 (13830548472422073959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1499 :
  out_eq64 (ported_sin (f64 (4624016374702342846))) (f64 (4606936829585707734)) &&
  out_eq64 (ported_cos (f64 (4624016374702342846))) (f64 (4597523931169925949)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1500 :
  out_eq64 (ported_sin (f64 (4621085432353636195))) (f64 (4604168846690549016)) &&
  out_eq64 (ported_cos (f64 (4621085432353636195))) (f64 (13828270802492558626)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1501 :
  out_eq64 (ported_sin (f64 (4624809679224140771))) (f64 (4600614658061030613)) &&
  out_eq64 (ported_cos (f64 (4624809679224140771))) (f64 (13829858585640936957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1502 :
  out_eq64 (ported_sin (f64 (13849082980319182549))) (f64 (4605864494416395862)) &&
  out_eq64 (ported_cos (f64 (13849082980319182549))) (f64 (4602866135273679316)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1503 :
  out_eq64 (ported_sin (f64 (4622553759980401705))) (f64 (13830126726745517238)) &&
  out_eq64 (ported_cos (f64 (4622553759980401705))) (f64 (4599156992104327958)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1504 :
  out_eq64 (ported_sin (f64 (4692794138369776744))) (f64 (13830322819573395507)) &&
  out_eq64 (ported_cos (f64 (4692794138369776744))) (f64 (4597286275674808922)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1505 :
  out_eq64 (ported_sin (f64 (13845380164523093349))) (f64 (4605291803635648495)) &&
  out_eq64 (ported_cos (f64 (13845380164523093349))) (f64 (13827068476310476884)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1506 :
  out_eq64 (ported_sin (f64 (4620520651712220762))) (f64 (4607182182015003980)) &&
  out_eq64 (ported_cos (f64 (4620520651712220762))) (f64 (4575009787825466535)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1507 :
  out_eq64 (ported_sin (f64 (4621028961588286821))) (f64 (4604812039754250153)) &&
  out_eq64 (ported_cos (f64 (4621028961588286821))) (f64 (13827636776572312472)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1508 :
  out_eq64 (ported_sin (f64 (13843452312640097520))) (f64 (13829849095793766921)) &&
  out_eq64 (ported_cos (f64 (13843452312640097520))) (f64 (4600659924746853633)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1509 :
  out_eq64 (ported_sin (f64 (4618809865896430179))) (f64 (4586508810261065960)) &&
  out_eq64 (ported_cos (f64 (4618809865896430179))) (f64 (4607173676545588493)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1510 :
  out_eq64 (ported_sin (f64 (4617581120290564881))) (f64 (13829348104797148158)) &&
  out_eq64 (ported_cos (f64 (4617581120290564881))) (f64 (4602677485273357882)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1511 :
  out_eq64 (ported_sin (f64 (13850092782890009750))) (f64 (13826461291779502885)) &&
  out_eq64 (ported_cos (f64 (13850092782890009750))) (f64 (13829095891687580287)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1512 :
  out_eq64 (ported_sin (f64 (13839970373208682318))) (f64 (4606638267878678609)) &&
  out_eq64 (ported_cos (f64 (13839970373208682318))) (f64 (13823210163505380572)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1513 :
  out_eq64 (ported_sin (f64 (4605206474931281162))) (f64 (4604513805692795770)) &&
  out_eq64 (ported_cos (f64 (4605206474931281162))) (f64 (4604574591707065605)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1514 :
  out_eq64 (ported_sin (f64 (13844862832520664212))) (f64 (13799134329300245867)) &&
  out_eq64 (ported_cos (f64 (13844862832520664212))) (f64 (13830554167796613308)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1515 :
  out_eq64 (ported_sin (f64 (4625656629079349068))) (f64 (13829993388660254577)) &&
  out_eq64 (ported_cos (f64 (4625656629079349068))) (f64 (4599930210256880272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1516 :
  out_eq64 (ported_sin (f64 (13845166734062768376))) (f64 (4602742972058897181)) &&
  out_eq64 (ported_cos (f64 (13845166734062768376))) (f64 (13829310327660121776)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1517 :
  out_eq64 (ported_sin (f64 (13846295728979881627))) (f64 (4603292630559998163)) &&
  out_eq64 (ported_cos (f64 (13846295728979881627))) (f64 (4605587489300284744)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1518 :
  out_eq64 (ported_sin (f64 (4625898633725692549))) (f64 (13823325605991694633)) &&
  out_eq64 (ported_cos (f64 (4625898633725692549))) (f64 (4606617015380111707)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1519 :
  out_eq64 (ported_sin (f64 (4625492241102890288))) (f64 (13830318896526395518)) &&
  out_eq64 (ported_cos (f64 (4625492241102890288))) (f64 (13820725867217411252)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1520 :
  out_eq64 (ported_sin (f64 (4488535092680876465))) (f64 (4488535092680876465)) &&
  out_eq64 (ported_cos (f64 (4488535092680876465))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1521 :
  out_eq64 (ported_sin (f64 (13842224420777692465))) (f64 (13813926055689635002)) &&
  out_eq64 (ported_cos (f64 (13842224420777692465))) (f64 (4607152281888331983)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1522 :
  out_eq64 (ported_sin (f64 (13836706612082435652))) (f64 (13824215877179896384)) &&
  out_eq64 (ported_cos (f64 (13836706612082435652))) (f64 (13829809789427047643)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1523 :
  out_eq64 (ported_sin (f64 (4627412177326770415))) (f64 (13830128966883464959)) &&
  out_eq64 (ported_cos (f64 (4627412177326770415))) (f64 (4599142957448525154)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1524 :
  out_eq64 (ported_sin (f64 (4620829483489551270))) (f64 (4606512636111930978)) &&
  out_eq64 (ported_cos (f64 (4620829483489551270))) (f64 (13823860437070940057)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1525 :
  out_eq64 (ported_sin (f64 (13731658290331555788))) (f64 (13731658290331555740)) &&
  out_eq64 (ported_cos (f64 (13731658290331555788))) (f64 (4607182418800017131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1526 :
  out_eq64 (ported_sin (f64 (4625402972207921045))) (f64 (13829243246210846681)) &&
  out_eq64 (ported_cos (f64 (4625402972207921045))) (f64 (13826227147343947667)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1527 :
  out_eq64 (ported_sin (f64 (13827935045306275084))) (f64 (13827412897963177624)) &&
  out_eq64 (ported_cos (f64 (13827935045306275084))) (f64 (4605010706906653255)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1528 :
  out_eq64 (ported_sin (f64 (4626094534264136466))) (f64 (4599675374434084114)) &&
  out_eq64 (ported_cos (f64 (4626094534264136466))) (f64 (4606667473153240215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1529 :
  out_eq64 (ported_sin (f64 (4622193332511023878))) (f64 (13830066008039717611)) &&
  out_eq64 (ported_cos (f64 (4622193332511023878))) (f64 (13822895326249439607)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1530 :
  out_eq64 (ported_sin (f64 (4697980755033915330))) (f64 (13822893528930571600)) &&
  out_eq64 (ported_cos (f64 (4697980755033915330))) (f64 (13830066316638640334)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1531 :
  out_eq64 (ported_sin (f64 (13879137524065755422))) (f64 (13829304541110493237)) &&
  out_eq64 (ported_cos (f64 (13879137524065755422))) (f64 (13826124829155974818)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1532 :
  out_eq64 (ported_sin (f64 (13814481174940115598))) (f64 (13814472586245281707)) &&
  out_eq64 (ported_cos (f64 (13814481174940115598))) (f64 (4607146417473873316)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1533 :
  out_eq64 (ported_sin (f64 (13814735878723489278))) (f64 (13814726231254708601)) &&
  out_eq64 (ported_cos (f64 (13814735878723489278))) (f64 (4607143517692331058)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1534 :
  out_eq64 (ported_sin (f64 (13846054397290177521))) (f64 (4605910697108239891)) &&
  out_eq64 (ported_cos (f64 (13846054397290177521))) (f64 (4602789547804892905)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1535 :
  out_eq64 (ported_sin (f64 (4603762022695110995))) (f64 (4603410622993392313)) &&
  out_eq64 (ported_cos (f64 (4603762022695110995))) (f64 (4605504625329517240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1536 :
  out_eq64 (ported_sin (f64 (13851228841944996818))) (f64 (13822666482830030232)) &&
  out_eq64 (ported_cos (f64 (13851228841944996818))) (f64 (4606732415066988383)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1537 :
  out_eq64 (ported_sin (f64 (4623001228404884090))) (f64 (13825146188701128745)) &&
  out_eq64 (ported_cos (f64 (4623001228404884090))) (f64 (4606219899930582649)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1538 :
  out_eq64 (ported_sin (f64 (4626345611279063484))) (f64 (4606669749683960165)) &&
  out_eq64 (ported_cos (f64 (4626345611279063484))) (f64 (4599662478333058171)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1539 :
  out_eq64 (ported_sin (f64 (4623407417576560157))) (f64 (4598215964380299969)) &&
  out_eq64 (ported_cos (f64 (4623407417576560157))) (f64 (4606891117190750680)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1540 :
  out_eq64 (ported_sin (f64 (4610717635272274012))) (f64 (4606976614513885695)) &&
  out_eq64 (ported_cos (f64 (4610717635272274012))) (f64 (13820197821854306612)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1541 :
  out_eq64 (ported_sin (f64 (4621941535184312806))) (f64 (13827962513226432488)) &&
  out_eq64 (ported_cos (f64 (4621941535184312806))) (f64 (13827869765258582048)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1542 :
  out_eq64 (ported_sin (f64 (13795398749700263868))) (f64 (13795398730211066332)) &&
  out_eq64 (ported_cos (f64 (13795398749700263868))) (f64 (4607182320853361191)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1543 :
  out_eq64 (ported_sin (f64 (4617219148522711416))) (f64 (13830371282685930567)) &&
  out_eq64 (ported_cos (f64 (4617219148522711416))) (f64 (4596397071150209592)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1544 :
  out_eq64 (ported_sin (f64 (13816049666463297937))) (f64 (13816033160529702679)) &&
  out_eq64 (ported_cos (f64 (13816049666463297937))) (f64 (4607126781559350853)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1545 :
  out_eq64 (ported_sin (f64 (4644772511886490877))) (f64 (13828168273879973221)) &&
  out_eq64 (ported_cos (f64 (4644772511886490877))) (f64 (4604281917994126440)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1546 :
  out_eq64 (ported_sin (f64 (4623116211760560310))) (f64 (13821714288697459682)) &&
  out_eq64 (ported_cos (f64 (4623116211760560310))) (f64 (4606874411333621925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1547 :
  out_eq64 (ported_sin (f64 (13737558398278589621))) (f64 (13737558398278589200)) &&
  out_eq64 (ported_cos (f64 (13737558398278589621))) (f64 (4607182418800015540)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1548 :
  out_eq64 (ported_sin (f64 (4581983049029355802))) (f64 (4581982541208126197)) &&
  out_eq64 (ported_cos (f64 (4581983049029355802))) (f64 (4607180249610228566)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1549 :
  out_eq64 (ported_sin (f64 (13845374387171352058))) (f64 (4605234767585234485)) &&
  out_eq64 (ported_cos (f64 (13845374387171352058))) (f64 (13827141219207055044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1550 :
  out_eq64 (ported_sin (f64 (4626939079270776714))) (f64 (13819648761698528727)) &&
  out_eq64 (ported_cos (f64 (4626939079270776714))) (f64 (13830377391358706493)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1551 :
  out_eq64 (ported_sin (f64 (4615296732852996726))) (f64 (13825071554857351852)) &&
  out_eq64 (ported_cos (f64 (4615296732852996726))) (f64 (13829610621175389138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1552 :
  out_eq64 (ported_sin (f64 (13849032564886306298))) (f64 (4606577196346889072)) &&
  out_eq64 (ported_cos (f64 (13849032564886306298))) (f64 (4600163591649135024)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1553 :
  out_eq64 (ported_sin (f64 (13831491661845570183))) (f64 (13829968484527804315)) &&
  out_eq64 (ported_cos (f64 (13831491661845570183))) (f64 (4600063037674542921)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1554 :
  out_eq64 (ported_sin (f64 (13845896530611531713))) (f64 (4606885619249869366)) &&
  out_eq64 (ported_cos (f64 (13845896530611531713))) (f64 (4598257936697559824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1555 :
  out_eq64 (ported_sin (f64 (13715210319563644672))) (f64 (13715210319563644672)) &&
  out_eq64 (ported_cos (f64 (13715210319563644672))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1556 :
  out_eq64 (ported_sin (f64 (4626867640339602088))) (f64 (4588110895579217345)) &&
  out_eq64 (ported_cos (f64 (4626867640339602088))) (f64 (13830540740097658762)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1557 :
  out_eq64 (ported_sin (f64 (4625578111695014611))) (f64 (13830528544085508647)) &&
  out_eq64 (ported_cos (f64 (4625578111695014611))) (f64 (4590126200157361986)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1558 :
  out_eq64 (ported_sin (f64 (4652817565603976346))) (f64 (13829044572367926250)) &&
  out_eq64 (ported_cos (f64 (4652817565603976346))) (f64 (13826539239141655788)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1559 :
  out_eq64 (ported_sin (f64 (13841544395030525028))) (f64 (4602656337391111592)) &&
  out_eq64 (ported_cos (f64 (13841544395030525028))) (f64 (4605982162057955426)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1560 :
  out_eq64 (ported_sin (f64 (4508644871142805754))) (f64 (4508644871142805694)) &&
  out_eq64 (ported_cos (f64 (4508644871142805754))) (f64 (4607182418800017087)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1561 :
  out_eq64 (ported_sin (f64 (13847488032391400755))) (f64 (13830539780128568664)) &&
  out_eq64 (ported_cos (f64 (13847488032391400755))) (f64 (4588384189208807215)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1562 :
  out_eq64 (ported_sin (f64 (13749555466020553532))) (f64 (13749555466020542124)) &&
  out_eq64 (ported_cos (f64 (13749555466020553532))) (f64 (4607182418799949943)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1563 :
  out_eq64 (ported_sin (f64 (4625601202411814620))) (f64 (13830442396238842530)) &&
  out_eq64 (ported_cos (f64 (4625601202411814620))) (f64 (4594833530912496702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1564 :
  out_eq64 (ported_sin (f64 (4625658339781725365))) (f64 (13829974214071514579)) &&
  out_eq64 (ported_cos (f64 (4625658339781725365))) (f64 (4600032759066828369)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1565 :
  out_eq64 (ported_sin (f64 (13911018378888980236))) (f64 (13830467076545147740)) &&
  out_eq64 (ported_cos (f64 (13911018378888980236))) (f64 (13817546368352185843)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1566 :
  out_eq64 (ported_sin (f64 (4627080109975048925))) (f64 (13827347449096527331)) &&
  out_eq64 (ported_cos (f64 (4627080109975048925))) (f64 (13828438366840203616)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1567 :
  out_eq64 (ported_sin (f64 (13921950633476729372))) (f64 (13830540347838571848)) &&
  out_eq64 (ported_cos (f64 (13921950633476729372))) (f64 (13811595727542010631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1568 :
  out_eq64 (ported_sin (f64 (13849577670250794206))) (f64 (13827583885067743984)) &&
  out_eq64 (ported_cos (f64 (13849577670250794206))) (f64 (4604860184223044631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1569 :
  out_eq64 (ported_sin (f64 (13846270151689736293))) (f64 (4603624005706261773)) &&
  out_eq64 (ported_cos (f64 (13846270151689736293))) (f64 (4605347413615884178)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1570 :
  out_eq64 (ported_sin (f64 (13836952481909188527))) (f64 (13822372407782977859)) &&
  out_eq64 (ported_cos (f64 (13836952481909188527))) (f64 (13830151368299729824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1571 :
  out_eq64 (ported_sin (f64 (13895358657543399491))) (f64 (13822927317099489071)) &&
  out_eq64 (ported_cos (f64 (13895358657543399491))) (f64 (4606688460626339198)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1572 :
  out_eq64 (ported_sin (f64 (4613563899142139485))) (f64 (4599126669576969916)) &&
  out_eq64 (ported_cos (f64 (4613563899142139485))) (f64 (13830131558743218681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1573 :
  out_eq64 (ported_sin (f64 (13847804483444522534))) (f64 (13829429962096515653)) &&
  out_eq64 (ported_cos (f64 (13847804483444522534))) (f64 (13825759754366800254)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1574 :
  out_eq64 (ported_sin (f64 (13749290190220251145))) (f64 (13749290190220230719)) &&
  out_eq64 (ported_cos (f64 (13749290190220251145))) (f64 (4607182418799954743)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1575 :
  out_eq64 (ported_sin (f64 (13822163553701087962))) (f64 (13822094903996486742)) &&
  out_eq64 (ported_cos (f64 (13822163553701087962))) (f64 (4606821077732038862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1576 :
  out_eq64 (ported_sin (f64 (4624256173375748855))) (f64 (4607017055663529409)) &&
  out_eq64 (ported_cos (f64 (4624256173375748855))) (f64 (13819412113574140699)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1577 :
  out_eq64 (ported_sin (f64 (4627098055989216038))) (f64 (13827774723581613383)) &&
  out_eq64 (ported_cos (f64 (4627098055989216038))) (f64 (13828054812847535826)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1578 :
  out_eq64 (ported_sin (f64 (13850730781550244875))) (f64 (4607118970561918501)) &&
  out_eq64 (ported_cos (f64 (13850730781550244875))) (f64 (4593202171812203109)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1579 :
  out_eq64 (ported_sin (f64 (4680595720505796885))) (f64 (4606897128528339719)) &&
  out_eq64 (ported_cos (f64 (4680595720505796885))) (f64 (4598163967916675843)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1580 :
  out_eq64 (ported_sin (f64 (13912500738916011918))) (f64 (4606042262519718727)) &&
  out_eq64 (ported_cos (f64 (13912500738916011918))) (f64 (13825816175966820789)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1581 :
  out_eq64 (ported_sin (f64 (4622702079880961254))) (f64 (13829116387475359642)) &&
  out_eq64 (ported_cos (f64 (4622702079880961254))) (f64 (4603057626039969606)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1582 :
  out_eq64 (ported_sin (f64 (13830916646998089415))) (f64 (13829493019618878342)) &&
  out_eq64 (ported_cos (f64 (13830916646998089415))) (f64 (4602155601361769809)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1583 :
  out_eq64 (ported_sin (f64 (4618998528497250418))) (f64 (4596735947667201253)) &&
  out_eq64 (ported_cos (f64 (4618998528497250418))) (f64 (4606981469775422683)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1584 :
  out_eq64 (ported_sin (f64 (4616465045858888103))) (f64 (13829586907166172631)) &&
  out_eq64 (ported_cos (f64 (4616465045858888103))) (f64 (13825166132743326699)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1585 :
  out_eq64 (ported_sin (f64 (4609413898575660198))) (f64 (4607156889436449418)) &&
  out_eq64 (ported_cos (f64 (4609413898575660198))) (f64 (4590085826418003289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1586 :
  out_eq64 (ported_sin (f64 (13848833327362507806))) (f64 (4606669312718752621)) &&
  out_eq64 (ported_cos (f64 (13848833327362507806))) (f64 (13823036992930419458)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1587 :
  out_eq64 (ported_sin (f64 (4620817850715477995))) (f64 (4606581281958320413)) &&
  out_eq64 (ported_cos (f64 (4620817850715477995))) (f64 (13823514438216252705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1588 :
  out_eq64 (ported_sin (f64 (4658697454146398909))) (f64 (13825490759560269354)) &&
  out_eq64 (ported_cos (f64 (4658697454146398909))) (f64 (4606130799476280128)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1589 :
  out_eq64 (ported_sin (f64 (13854700656733395075))) (f64 (4600905479227997106)) &&
  out_eq64 (ported_cos (f64 (13854700656733395075))) (f64 (4606424307875816855)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1590 :
  out_eq64 (ported_sin (f64 (4626263036872426852))) (f64 (4605440637214133445)) &&
  out_eq64 (ported_cos (f64 (4626263036872426852))) (f64 (4603499066322905048)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1591 :
  out_eq64 (ported_sin (f64 (13850233294204710599))) (f64 (13813641890073009866)) &&
  out_eq64 (ported_cos (f64 (13850233294204710599))) (f64 (13830527161035199212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1592 :
  out_eq64 (ported_sin (f64 (13850271430877502000))) (f64 (4588460000590712585)) &&
  out_eq64 (ported_cos (f64 (13850271430877502000))) (f64 (13830539508067471961)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1593 :
  out_eq64 (ported_sin (f64 (13850137183962263081))) (f64 (13824378059646473994)) &&
  out_eq64 (ported_cos (f64 (13850137183962263081))) (f64 (13829774119230793576)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1594 :
  out_eq64 (ported_sin (f64 (4617187246848396070))) (f64 (13830418941609951751)) &&
  out_eq64 (ported_cos (f64 (4617187246848396070))) (f64 (4595394210073774170)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1595 :
  out_eq64 (ported_sin (f64 (4624692874095711479))) (f64 (4603284430647997379)) &&
  out_eq64 (ported_cos (f64 (4624692874095711479))) (f64 (13828965180659738320)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1596 :
  out_eq64 (ported_sin (f64 (13768492480421415488))) (f64 (13768492480416344583)) &&
  out_eq64 (ported_cos (f64 (13768492480421415488))) (f64 (4607182418775067759)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1597 :
  out_eq64 (ported_sin (f64 (13838663423574993015))) (f64 (4601661207979065126)) &&
  out_eq64 (ported_cos (f64 (13838663423574993015))) (f64 (13829620128198108493)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1598 :
  out_eq64 (ported_sin (f64 (13832689139703418185))) (f64 (13830512287698311950)) &&
  out_eq64 (ported_cos (f64 (13832689139703418185))) (f64 (4591628797382809932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1599 :
  out_eq64 (ported_sin (f64 (4608191695795602822))) (f64 (4606646507917068056)) &&
  out_eq64 (ported_cos (f64 (4608191695795602822))) (f64 (4599792702089076121)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1600 :
  out_eq64 (ported_sin (f64 (4615189355767849779))) (f64 (13824293717653238289)) &&
  out_eq64 (ported_cos (f64 (4615189355767849779))) (f64 (13829792788082221818)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1601 :
  out_eq64 (ported_sin (f64 (13845128774344917523))) (f64 (4601740229454674736)) &&
  out_eq64 (ported_cos (f64 (13845128774344917523))) (f64 (13829600455978505344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1602 :
  out_eq64 (ported_sin (f64 (13850340050154436720))) (f64 (4599019389936538230)) &&
  out_eq64 (ported_cos (f64 (13850340050154436720))) (f64 (13830148417796721922)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1603 :
  out_eq64 (ported_sin (f64 (4629145111195592848))) (f64 (13830405644928976566)) &&
  out_eq64 (ported_cos (f64 (4629145111195592848))) (f64 (4595690094911670405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1604 :
  out_eq64 (ported_sin (f64 (13838501506095479730))) (f64 (4600480589514457532)) &&
  out_eq64 (ported_cos (f64 (13838501506095479730))) (f64 (13829886268432236590)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1605 :
  out_eq64 (ported_sin (f64 (13835272983321541444))) (f64 (13829342977124295638)) &&
  out_eq64 (ported_cos (f64 (13835272983321541444))) (f64 (13826059060562935230)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1606 :
  out_eq64 (ported_sin (f64 (4581906581072175960))) (f64 (4581906091444898888)) &&
  out_eq64 (ported_cos (f64 (4581906581072175960))) (f64 (4607180301734474003)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1607 :
  out_eq64 (ported_sin (f64 (13829361852009673089))) (f64 (13828417727590296059)) &&
  out_eq64 (ported_cos (f64 (13829361852009673089))) (f64 (4603999845201800288)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1608 :
  out_eq64 (ported_sin (f64 (13849912340976641880))) (f64 (13830000091650514819)) &&
  out_eq64 (ported_cos (f64 (13849912340976641880))) (f64 (13823265944018749253)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1609 :
  out_eq64 (ported_sin (f64 (13850382774908043969))) (f64 (4601559007361646525)) &&
  out_eq64 (ported_cos (f64 (13850382774908043969))) (f64 (13829645214058788619)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1610 :
  out_eq64 (ported_sin (f64 (4625589023236049300))) (f64 (13830495337020751631)) &&
  out_eq64 (ported_cos (f64 (4625589023236049300))) (f64 (4592906717896612957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1611 :
  out_eq64 (ported_sin (f64 (4616386300668432431))) (f64 (13829283441337978576)) &&
  out_eq64 (ported_cos (f64 (4616386300668432431))) (f64 (13826160398606922518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1612 :
  out_eq64 (ported_sin (f64 (13842948910218896329))) (f64 (13827522283627883852)) &&
  out_eq64 (ported_cos (f64 (13842948910218896329))) (f64 (4604915300260021409)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1613 :
  out_eq64 (ported_sin (f64 (4624494481666011189))) (f64 (4605530842738082041)) &&
  out_eq64 (ported_cos (f64 (4624494481666011189))) (f64 (13826745760594536120)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1614 :
  out_eq64 (ported_sin (f64 (13836908572101270196))) (f64 (13822706931594057846)) &&
  out_eq64 (ported_cos (f64 (13836908572101270196))) (f64 (13830097780827770006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1615 :
  out_eq64 (ported_sin (f64 (4626620677196173996))) (f64 (4605409449998979649)) &&
  out_eq64 (ported_cos (f64 (4626620677196173996))) (f64 (13826913404754069227)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1616 :
  out_eq64 (ported_sin (f64 (13846397671915008794))) (f64 (4601069203486496927)) &&
  out_eq64 (ported_cos (f64 (13846397671915008794))) (f64 (4606387927853199861)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1617 :
  out_eq64 (ported_sin (f64 (4624228552940783830))) (f64 (4607090673934441060)) &&
  out_eq64 (ported_cos (f64 (4624228552940783830))) (f64 (13817669285468295602)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1618 :
  out_eq64 (ported_sin (f64 (13843961321012722457))) (f64 (13830541468476945506)) &&
  out_eq64 (ported_cos (f64 (13843961321012722457))) (f64 (13811269110717441356)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1619 :
  out_eq64 (ported_sin (f64 (13846426413824763411))) (f64 (4600221313984896211)) &&
  out_eq64 (ported_cos (f64 (13846426413824763411))) (f64 (4606565989195422625)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1620 :
  out_eq64 (ported_sin (f64 (4626875948676935160))) (f64 (4583056895459456103)) &&
  out_eq64 (ported_cos (f64 (4626875948676935160))) (f64 (13830551486881497271)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1621 :
  out_eq64 (ported_sin (f64 (4617332757596394279))) (f64 (13830144345587684575)) &&
  out_eq64 (ported_cos (f64 (4617332757596394279))) (f64 (4599045518284827869)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1622 :
  out_eq64 (ported_sin (f64 (13846707298568511571))) (f64 (13817097790657977821)) &&
  out_eq64 (ported_cos (f64 (13846707298568511571))) (f64 (4607110057539964760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1623 :
  out_eq64 (ported_sin (f64 (4627079469901641261))) (f64 (13827331763745189382)) &&
  out_eq64 (ported_cos (f64 (4627079469901641261))) (f64 (13828451538635640580)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1624 :
  out_eq64 (ported_sin (f64 (13849151115050207017))) (f64 (4604515875847792331)) &&
  out_eq64 (ported_cos (f64 (13849151115050207017))) (f64 (4604572540552383367)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1625 :
  out_eq64 (ported_sin (f64 (4589794378304825940))) (f64 (4589790045984963782)) &&
  out_eq64 (ported_cos (f64 (4589794378304825940))) (f64 (4607159602544051431)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1626 :
  out_eq64 (ported_sin (f64 (13904339048969304898))) (f64 (13827901588367846048)) &&
  out_eq64 (ported_cos (f64 (13904339048969304898))) (f64 (4604558956981737925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1627 :
  out_eq64 (ported_sin (f64 (13845066351208879495))) (f64 (4599908363159486113)) &&
  out_eq64 (ported_cos (f64 (13845066351208879495))) (f64 (13829997427809512368)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1628 :
  out_eq64 (ported_sin (f64 (13874609283989342406))) (f64 (13830411267632598198)) &&
  out_eq64 (ported_cos (f64 (13874609283989342406))) (f64 (4595566699259079467)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1629 :
  out_eq64 (ported_sin (f64 (13849116977553442563))) (f64 (4605243271803463445)) &&
  out_eq64 (ported_cos (f64 (13849116977553442563))) (f64 (4603758433287391607)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1630 :
  out_eq64 (ported_sin (f64 (13848973050531517472))) (f64 (4607071307096289735)) &&
  out_eq64 (ported_cos (f64 (13848973050531517472))) (f64 (4594809672104410543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1631 :
  out_eq64 (ported_sin (f64 (4635329531626516392))) (f64 (13830493838005418738)) &&
  out_eq64 (ported_cos (f64 (4635329531626516392))) (f64 (13816382248286942158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1632 :
  out_eq64 (ported_sin (f64 (4603013183241549944))) (f64 (4602783890561195344)) &&
  out_eq64 (ported_cos (f64 (4603013183241549944))) (f64 (4605914068935310794)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1633 :
  out_eq64 (ported_sin (f64 (4545308711176327881))) (f64 (4545308711170717400)) &&
  out_eq64 (ported_cos (f64 (4545308711176327881))) (f64 (4607182418773327881)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1634 :
  out_eq64 (ported_sin (f64 (4614160754325155886))) (f64 (4586296708249448422)) &&
  out_eq64 (ported_cos (f64 (4614160754325155886))) (f64 (13830546288101921734)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1635 :
  out_eq64 (ported_sin (f64 (4618370160742916932))) (f64 (13823161054352415373)) &&
  out_eq64 (ported_cos (f64 (4618370160742916932))) (f64 (4606647173282607252)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1636 :
  out_eq64 (ported_sin (f64 (13826237540772957090))) (f64 (13826006003620931247)) &&
  out_eq64 (ported_cos (f64 (13826237540772957090))) (f64 (4605988587779112875)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1637 :
  out_eq64 (ported_sin (f64 (13849823143388560774))) (f64 (13830548691292161458)) &&
  out_eq64 (ported_cos (f64 (13849823143388560774))) (f64 (13808687945107836944)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1638 :
  out_eq64 (ported_sin (f64 (4620821245020508013))) (f64 (4606561621497978107)) &&
  out_eq64 (ported_cos (f64 (4620821245020508013))) (f64 (13823615688635759675)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1639 :
  out_eq64 (ported_sin (f64 (4623824329582712534))) (f64 (4605733036971025129)) &&
  out_eq64 (ported_cos (f64 (4623824329582712534))) (f64 (4603075120990576697)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1640 :
  out_eq64 (ported_sin (f64 (4684125209861378624))) (f64 (4606254161855859152)) &&
  out_eq64 (ported_cos (f64 (4684125209861378624))) (f64 (13825008662625004188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1641 :
  out_eq64 (ported_sin (f64 (4624511672551976133))) (f64 (4605368690561366197)) &&
  out_eq64 (ported_cos (f64 (4624511672551976133))) (f64 (13826967921779439051)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1642 :
  out_eq64 (ported_sin (f64 (13776569870557251720))) (f64 (13776569870510742920)) &&
  out_eq64 (ported_cos (f64 (13776569870557251720))) (f64 (4607182418524549581)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1643 :
  out_eq64 (ported_sin (f64 (13758429409036758031))) (f64 (13758429409036416300)) &&
  out_eq64 (ported_cos (f64 (13758429409036758031))) (f64 (4607182418798984478)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1644 :
  out_eq64 (ported_sin (f64 (4544882557368701696))) (f64 (4544882557364261599)) &&
  out_eq64 (ported_cos (f64 (4544882557368701696))) (f64 (4607182418777182332)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1645 :
  out_eq64 (ported_sin (f64 (4623091283026990573))) (f64 (13822479899196157518)) &&
  out_eq64 (ported_cos (f64 (4623091283026990573))) (f64 (4606762504069088772)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1646 :
  out_eq64 (ported_sin (f64 (4625449824629664517))) (f64 (13829912267795430094)) &&
  out_eq64 (ported_cos (f64 (4625449824629664517))) (f64 (13823723843228104976)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1647 :
  out_eq64 (ported_sin (f64 (13828087865635998021))) (f64 (13827528022231103600)) &&
  out_eq64 (ported_cos (f64 (13828087865635998021))) (f64 (4604910208668410545)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1648 :
  out_eq64 (ported_sin (f64 (13850431274292686945))) (f64 (4603448936157003888)) &&
  out_eq64 (ported_cos (f64 (13850431274292686945))) (f64 (13828849143246189762)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1649 :
  out_eq64 (ported_sin (f64 (4619053764251496022))) (f64 (4598314739595713127)) &&
  out_eq64 (ported_cos (f64 (4619053764251496022))) (f64 (4606878092538087270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1650 :
  out_eq64 (ported_sin (f64 (13843356996492262760))) (f64 (13829523910335796117)) &&
  out_eq64 (ported_cos (f64 (13843356996492262760))) (f64 (4602038848946440552)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1651 :
  out_eq64 (ported_sin (f64 (13850702868509560503))) (f64 (4607180689272706511)) &&
  out_eq64 (ported_cos (f64 (13850702868509560503))) (f64 (4581305325923882499)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1652 :
  out_eq64 (ported_sin (f64 (4613074773677870608))) (f64 (4602688664882873761)) &&
  out_eq64 (ported_cos (f64 (4613074773677870608))) (f64 (13829342027057302344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1653 :
  out_eq64 (ported_sin (f64 (13912959408551328057))) (f64 (4606714878512845049)) &&
  out_eq64 (ported_cos (f64 (13912959408551328057))) (f64 (4599400097248656671)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1654 :
  out_eq64 (ported_sin (f64 (4626205903387871908))) (f64 (4604218257678114175)) &&
  out_eq64 (ported_cos (f64 (4626205903387871908))) (f64 (4604854390791746701)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1655 :
  out_eq64 (ported_sin (f64 (4539619425625473972))) (f64 (4539619425624080057)) &&
  out_eq64 (ported_cos (f64 (4539619425625473972))) (f64 (4607182418795831481)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1656 :
  out_eq64 (ported_sin (f64 (4610959014898503500))) (f64 (4606861416638219504)) &&
  out_eq64 (ported_cos (f64 (4610959014898503500))) (f64 (13821810046801688475)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1657 :
  out_eq64 (ported_sin (f64 (4622921353795551734))) (f64 (13826695411582149398)) &&
  out_eq64 (ported_cos (f64 (4622921353795551734))) (f64 (4605566169188972596)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1658 :
  out_eq64 (ported_sin (f64 (4648406470978881528))) (f64 (4578481054041205426)) &&
  out_eq64 (ported_cos (f64 (4648406470978881528))) (f64 (4607181691118316112)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1659 :
  out_eq64 (ported_sin (f64 (4529688552211928345))) (f64 (4529688552211865394)) &&
  out_eq64 (ported_cos (f64 (4529688552211928345))) (f64 (4607182418799806742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1660 :
  out_eq64 (ported_sin (f64 (4619568626362764671))) (f64 (4604100717125364027)) &&
  out_eq64 (ported_cos (f64 (4619568626362764671))) (f64 (4604958884988308122)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1661 :
  out_eq64 (ported_sin (f64 (4658112318712085016))) (f64 (13825017416727271942)) &&
  out_eq64 (ported_cos (f64 (4658112318712085016))) (f64 (13829624039575379518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1662 :
  out_eq64 (ported_sin (f64 (13849884160517616338))) (f64 (13830268722402567144)) &&
  out_eq64 (ported_cos (f64 (13849884160517616338))) (f64 (13821542873754869023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1663 :
  out_eq64 (ported_sin (f64 (13850899206279136736))) (f64 (4604963907483120880)) &&
  out_eq64 (ported_cos (f64 (13850899206279136736))) (f64 (4604094962318165434)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1664 :
  out_eq64 (ported_sin (f64 (13837946567956105286))) (f64 (4594237138081573456)) &&
  out_eq64 (ported_cos (f64 (13837946567956105286))) (f64 (13830464859285126948)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1665 :
  out_eq64 (ported_sin (f64 (13838911446719818105))) (f64 (4603033190900309960)) &&
  out_eq64 (ported_cos (f64 (13838911446719818105))) (f64 (13829132093427192638)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1666 :
  out_eq64 (ported_sin (f64 (4622964401277210256))) (f64 (13826115749282193683)) &&
  out_eq64 (ported_cos (f64 (4622964401277210256))) (f64 (4605937855128661064)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1667 :
  out_eq64 (ported_sin (f64 (13848798009088970158))) (f64 (4606227511059311954)) &&
  out_eq64 (ported_cos (f64 (13848798009088970158))) (f64 (13825115890611613289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1668 :
  out_eq64 (ported_sin (f64 (13743655316361428134))) (f64 (13743655316361424753)) &&
  out_eq64 (ported_cos (f64 (13743655316361428134))) (f64 (4607182418800005508)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1669 :
  out_eq64 (ported_sin (f64 (4621694463093416913))) (f64 (13823284865105324969)) &&
  out_eq64 (ported_cos (f64 (4621694463093416913))) (f64 (13829996603596832744)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1670 :
  out_eq64 (ported_sin (f64 (13849081123527141966))) (f64 (4605895271221608132)) &&
  out_eq64 (ported_cos (f64 (13849081123527141966))) (f64 (4602815310118678463)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1671 :
  out_eq64 (ported_sin (f64 (4612768498970136480))) (f64 (4603703907290113378)) &&
  out_eq64 (ported_cos (f64 (4612768498970136480))) (f64 (13828658040480214992)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1672 :
  out_eq64 (ported_sin (f64 (13827145470693627901))) (f64 (13826791941205772310)) &&
  out_eq64 (ported_cos (f64 (13827145470693627901))) (f64 (4605497986761517524)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1673 :
  out_eq64 (ported_sin (f64 (13837911898083032704))) (f64 (4593687358886118132)) &&
  out_eq64 (ported_cos (f64 (13837911898083032704))) (f64 (13830483313253092130)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1674 :
  out_eq64 (ported_sin (f64 (4621342953722134521))) (f64 (4598487301186215073)) &&
  out_eq64 (ported_cos (f64 (4621342953722134521))) (f64 (13830226653953749184)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1675 :
  out_eq64 (ported_sin (f64 (4665543331233385985))) (f64 (13827259727380148390)) &&
  out_eq64 (ported_cos (f64 (4665543331233385985))) (f64 (4605139220817258338)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1676 :
  out_eq64 (ported_sin (f64 (4663717087305460788))) (f64 (13821611211793823543)) &&
  out_eq64 (ported_cos (f64 (4663717087305460788))) (f64 (13830260120377919503)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1677 :
  out_eq64 (ported_sin (f64 (13848780876468223058))) (f64 (4605967083628430358)) &&
  out_eq64 (ported_cos (f64 (13848780876468223058))) (f64 (13826065717700568392)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1678 :
  out_eq64 (ported_sin (f64 (4627195193328532702))) (f64 (13829609013259338626)) &&
  out_eq64 (ported_cos (f64 (4627195193328532702))) (f64 (13825078011695475550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1679 :
  out_eq64 (ported_sin (f64 (4636801588845198692))) (f64 (4600399632776743282)) &&
  out_eq64 (ported_cos (f64 (4636801588845198692))) (f64 (4606530642883290861)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1680 :
  out_eq64 (ported_sin (f64 (13719682739705339848))) (f64 (13719682739705339846)) &&
  out_eq64 (ported_cos (f64 (13719682739705339848))) (f64 (4607182418800017400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1681 :
  out_eq64 (ported_sin (f64 (4627200516789713813))) (f64 (13829683542768370162)) &&
  out_eq64 (ported_cos (f64 (4627200516789713813))) (f64 (13824771653291141186)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1682 :
  out_eq64 (ported_sin (f64 (13787243895602203760))) (f64 (13787243893708152456)) &&
  out_eq64 (ported_cos (f64 (13787243895602203760))) (f64 (4607182410583611112)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1683 :
  out_eq64 (ported_sin (f64 (13846014360466479822))) (f64 (4606219035290066578)) &&
  out_eq64 (ported_cos (f64 (13846014360466479822))) (f64 (4601777584802723167)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1684 :
  out_eq64 (ported_sin (f64 (13849834676144660264))) (f64 (13830527939375823473)) &&
  out_eq64 (ported_cos (f64 (13849834676144660264))) (f64 (13813561508559437584)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1685 :
  out_eq64 (ported_sin (f64 (13830394029433960538))) (f64 (13829038677003157885)) &&
  out_eq64 (ported_cos (f64 (13830394029433960538))) (f64 (4603176045053327131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1686 :
  out_eq64 (ported_sin (f64 (13839875926350882866))) (f64 (4606350171409809567)) &&
  out_eq64 (ported_cos (f64 (13839875926350882866))) (f64 (13824606672157347461)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1687 :
  out_eq64 (ported_sin (f64 (13848531422260993680))) (f64 (4597225389622745814)) &&
  out_eq64 (ported_cos (f64 (13848531422260993680))) (f64 (13830326326019315925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1688 :
  out_eq64 (ported_sin (f64 (13844148235930091600))) (f64 (13830169483175636372)) &&
  out_eq64 (ported_cos (f64 (13844148235930091600))) (f64 (13822253971099094856)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1689 :
  out_eq64 (ported_sin (f64 (4625858370381282373))) (f64 (13825668317100535168)) &&
  out_eq64 (ported_cos (f64 (4625858370381282373))) (f64 (4606083028785002323)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1690 :
  out_eq64 (ported_sin (f64 (13832967753661228045))) (f64 (13830548959297002763)) &&
  out_eq64 (ported_cos (f64 (13832967753661228045))) (f64 (4585194680651196032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1691 :
  out_eq64 (ported_sin (f64 (13830346665411447009))) (f64 (13829012276895264979)) &&
  out_eq64 (ported_cos (f64 (13830346665411447009))) (f64 (4603215369088758256)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1692 :
  out_eq64 (ported_sin (f64 (4619285758148935662))) (f64 (4601777683704259231)) &&
  out_eq64 (ported_cos (f64 (4619285758148935662))) (f64 (4606219010373455599)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1693 :
  out_eq64 (ported_sin (f64 (13849872330461004532))) (f64 (13830355587205922497)) &&
  out_eq64 (ported_cos (f64 (13849872330461004532))) (f64 (13820069144026428686)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1694 :
  out_eq64 (ported_sin (f64 (13848813861618455281))) (f64 (4606441935890789869)) &&
  out_eq64 (ported_cos (f64 (13848813861618455281))) (f64 (13824196569264087555)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1695 :
  out_eq64 (ported_sin (f64 (13849447394796268941))) (f64 (13821877258371795866)) &&
  out_eq64 (ported_cos (f64 (13849447394796268941))) (f64 (4606852126385266517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1696 :
  out_eq64 (ported_sin (f64 (4625855169714886654))) (f64 (13825847595852055202)) &&
  out_eq64 (ported_cos (f64 (4625855169714886654))) (f64 (4606033482876717837)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1697 :
  out_eq64 (ported_sin (f64 (13849519670425038042))) (f64 (13826088426991870639)) &&
  out_eq64 (ported_cos (f64 (13849519670425038042))) (f64 (4605953870332566604)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1698 :
  out_eq64 (ported_sin (f64 (4622115002274476608))) (f64 (13829577881390441000)) &&
  out_eq64 (ported_cos (f64 (4622115002274476608))) (f64 (13825201769465786662)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1699 :
  out_eq64 (ported_sin (f64 (4626527787346836923))) (f64 (4606758001001488120)) &&
  out_eq64 (ported_cos (f64 (4626527787346836923))) (f64 (13822508270533786967)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1700 :
  out_eq64 (ported_sin (f64 (4607967930607562454))) (f64 (4606484050566618027)) &&
  out_eq64 (ported_cos (f64 (4607967930607562454))) (f64 (4600626608192057935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1701 :
  out_eq64 (ported_sin (f64 (4627701558357847845))) (f64 (13820898042917079663)) &&
  out_eq64 (ported_cos (f64 (4627701558357847845))) (f64 (4606936705893467513)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1702 :
  out_eq64 (ported_sin (f64 (13880207671768125364))) (f64 (13829510661888153538)) &&
  out_eq64 (ported_cos (f64 (13880207671768125364))) (f64 (4602089175726258974)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1703 :
  out_eq64 (ported_sin (f64 (4626576020847356707))) (f64 (4606166376310093786)) &&
  out_eq64 (ported_cos (f64 (4626576020847356707))) (f64 (13825355347809942503)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1704 :
  out_eq64 (ported_sin (f64 (13840755262724498652))) (f64 (4606643271547191805)) &&
  out_eq64 (ported_cos (f64 (13840755262724498652))) (f64 (4599810588465622531)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1705 :
  out_eq64 (ported_sin (f64 (4622885876315445597))) (f64 (13827150666049238874)) &&
  out_eq64 (ported_cos (f64 (4622885876315445597))) (f64 (4605227271637966077)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1706 :
  out_eq64 (ported_sin (f64 (4624229349868882578))) (f64 (4607088849731064815)) &&
  out_eq64 (ported_cos (f64 (4624229349868882578))) (f64 (13817719764203604871)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1707 :
  out_eq64 (ported_sin (f64 (4625454357418908331))) (f64 (13829964968715285359)) &&
  out_eq64 (ported_cos (f64 (4625454357418908331))) (f64 (13823453573400089327)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1708 :
  out_eq64 (ported_sin (f64 (13848330007833762673))) (f64 (13817290616109946480)) &&
  out_eq64 (ported_cos (f64 (13848330007833762673))) (f64 (13830475814528878340)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1709 :
  out_eq64 (ported_sin (f64 (4621363604182106262))) (f64 (4597519658126579783)) &&
  out_eq64 (ported_cos (f64 (4621363604182106262))) (f64 (13830309121070633407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1710 :
  out_eq64 (ported_sin (f64 (13841984119853091729))) (f64 (4593895886942755975)) &&
  out_eq64 (ported_cos (f64 (13841984119853091729))) (f64 (4607104530449373830)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1711 :
  out_eq64 (ported_sin (f64 (13833970633913561747))) (f64 (13830396173266916282)) &&
  out_eq64 (ported_cos (f64 (13833970633913561747))) (f64 (13819264708747213555)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1712 :
  out_eq64 (ported_sin (f64 (4627019486363419873))) (f64 (13825430526904351522)) &&
  out_eq64 (ported_cos (f64 (4627019486363419873))) (f64 (13829518751916154140)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1713 :
  out_eq64 (ported_sin (f64 (13849284117995557779))) (f64 (4599140097762791383)) &&
  out_eq64 (ported_cos (f64 (13849284117995557779))) (f64 (4606757385701300540)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1714 :
  out_eq64 (ported_sin (f64 (13731819824499096390))) (f64 (13731819824499096337)) &&
  out_eq64 (ported_cos (f64 (13731819824499096390))) (f64 (4607182418800017111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1715 :
  out_eq64 (ported_sin (f64 (13716986342190588442))) (f64 (13716986342190588441)) &&
  out_eq64 (ported_cos (f64 (13716986342190588442))) (f64 (4607182418800017405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1716 :
  out_eq64 (ported_sin (f64 (4620043573576549282))) (f64 (4606358765817499115)) &&
  out_eq64 (ported_cos (f64 (4620043573576549282))) (f64 (4601197364751474659)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1717 :
  out_eq64 (ported_sin (f64 (4622054634187350486))) (f64 (13829095171102973119)) &&
  out_eq64 (ported_cos (f64 (4622054634187350486))) (f64 (13826462398519262741)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1718 :
  out_eq64 (ported_sin (f64 (4623648243012025788))) (f64 (4603858533661721441)) &&
  out_eq64 (ported_cos (f64 (4623648243012025788))) (f64 (4605163036018855512)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1719 :
  out_eq64 (ported_sin (f64 (4621042451551360002))) (f64 (4604664225197250493)) &&
  out_eq64 (ported_cos (f64 (4621042451551360002))) (f64 (13827794051103198403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1720 :
  out_eq64 (ported_sin (f64 (13900783881912337912))) (f64 (13828780149614164671)) &&
  out_eq64 (ported_cos (f64 (13900783881912337912))) (f64 (13826915207048842952)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1721 :
  out_eq64 (ported_sin (f64 (13846229186749188273))) (f64 (4604131034036822329)) &&
  out_eq64 (ported_cos (f64 (13846229186749188273))) (f64 (4604932283416285657)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1722 :
  out_eq64 (ported_sin (f64 (13810722473595934611))) (f64 (13810719491701722325)) &&
  out_eq64 (ported_cos (f64 (13810722473595934611))) (f64 (4607171212517975887)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1723 :
  out_eq64 (ported_sin (f64 (13844619065886617653))) (f64 (13824733180176822227)) &&
  out_eq64 (ported_cos (f64 (13844619065886617653))) (f64 (13829692650550668912)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1724 :
  out_eq64 (ported_sin (f64 (13721916342705839263))) (f64 (13721916342705839259)) &&
  out_eq64 (ported_cos (f64 (13721916342705839263))) (f64 (4607182418800017394)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1725 :
  out_eq64 (ported_sin (f64 (4624411790144591986))) (f64 (4606212494181877525)) &&
  out_eq64 (ported_cos (f64 (4624411790144591986))) (f64 (13825175533513128595)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1726 :
  out_eq64 (ported_sin (f64 (4615149705248472719))) (f64 (13824002228020799614)) &&
  out_eq64 (ported_cos (f64 (4615149705248472719))) (f64 (13829855337403558597)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1727 :
  out_eq64 (ported_sin (f64 (13843810050216044022))) (f64 (13830525179227327459)) &&
  out_eq64 (ported_cos (f64 (13843810050216044022))) (f64 (4590469467416999327)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1728 :
  out_eq64 (ported_sin (f64 (13844521837641720533))) (f64 (13826734641089363226)) &&
  out_eq64 (ported_cos (f64 (13844521837641720533))) (f64 (13828910725589212214)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1729 :
  out_eq64 (ported_sin (f64 (13724214325711298976))) (f64 (13724214325711298969)) &&
  out_eq64 (ported_cos (f64 (13724214325711298976))) (f64 (4607182418800017377)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1730 :
  out_eq64 (ported_sin (f64 (13847571264012337649))) (f64 (13830517385736807898)) &&
  out_eq64 (ported_cos (f64 (13847571264012337649))) (f64 (13814567212311595213)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1731 :
  out_eq64 (ported_sin (f64 (4606618999880975370))) (f64 (4605435475156787619)) &&
  out_eq64 (ported_cos (f64 (4606618999880975370))) (f64 (4603506103793703385)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1732 :
  out_eq64 (ported_sin (f64 (13766777840792007062))) (f64 (13766777840787661215)) &&
  out_eq64 (ported_cos (f64 (13766777840792007062))) (f64 (4607182418785836510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1733 :
  out_eq64 (ported_sin (f64 (13848719120116586915))) (f64 (4604796866423217748)) &&
  out_eq64 (ported_cos (f64 (13848719120116586915))) (f64 (13827653272371080837)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1734 :
  out_eq64 (ported_sin (f64 (13849042035151132804))) (f64 (4606463250252345565)) &&
  out_eq64 (ported_cos (f64 (13849042035151132804))) (f64 (4600725182255699651)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1735 :
  out_eq64 (ported_sin (f64 (13848820550099102130))) (f64 (4606524578795094280)) &&
  out_eq64 (ported_cos (f64 (13848820550099102130))) (f64 (13823801715231170395)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1736 :
  out_eq64 (ported_sin (f64 (4625648307278834841))) (f64 (13830082201653352385)) &&
  out_eq64 (ported_cos (f64 (4625648307278834841))) (f64 (4599428128560399470)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1737 :
  out_eq64 (ported_sin (f64 (4627388388655904991))) (f64 (13830329265039197083)) &&
  out_eq64 (ported_cos (f64 (4627388388655904991))) (f64 (4597173980746687322)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1738 :
  out_eq64 (ported_sin (f64 (13847287153107046780))) (f64 (13829793789282034940)) &&
  out_eq64 (ported_cos (f64 (13847287153107046780))) (f64 (4600917124411309956)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1739 :
  out_eq64 (ported_sin (f64 (4624881494137500625))) (f64 (4598443452124339171)) &&
  out_eq64 (ported_cos (f64 (4624881494137500625))) (f64 (13830232706461103653)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1740 :
  out_eq64 (ported_sin (f64 (13847003531839671000))) (f64 (13827020195401574815)) &&
  out_eq64 (ported_cos (f64 (13847003531839671000))) (f64 (4605329000161161948)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1741 :
  out_eq64 (ported_sin (f64 (13848519349338320514))) (f64 (4596470497191121654)) &&
  out_eq64 (ported_cos (f64 (13848519349338320514))) (f64 (13830367503157336397)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1742 :
  out_eq64 (ported_sin (f64 (13812726995981788482))) (f64 (13812723684172432777)) &&
  out_eq64 (ported_cos (f64 (13812726995981788482))) (f64 (4607163342580725967)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1743 :
  out_eq64 (ported_sin (f64 (13816002935479817750))) (f64 (13815986716523940903)) &&
  out_eq64 (ported_cos (f64 (13816002935479817750))) (f64 (4607127427932275421)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1744 :
  out_eq64 (ported_sin (f64 (4573385696428949185))) (f64 (4573385658111926091)) &&
  out_eq64 (ported_cos (f64 (4573385696428949185))) (f64 (4607182265083260146)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1745 :
  out_eq64 (ported_sin (f64 (13847760492694620622))) (f64 (13829746112677667470)) &&
  out_eq64 (ported_cos (f64 (13847760492694620622))) (f64 (13824502448673148119)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1746 :
  out_eq64 (ported_sin (f64 (13841271743077775885))) (f64 (4604408630805134077)) &&
  out_eq64 (ported_cos (f64 (13841271743077775885))) (f64 (4604677082545992934)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1747 :
  out_eq64 (ported_sin (f64 (13733641282348267750))) (f64 (13733641282348267611)) &&
  out_eq64 (ported_cos (f64 (13733641282348267750))) (f64 (4607182418800016847)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1748 :
  out_eq64 (ported_sin (f64 (4545682919035505236))) (f64 (4545682919028711275)) &&
  out_eq64 (ported_cos (f64 (4545682919035505236))) (f64 (4607182418769695527)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1749 :
  out_eq64 (ported_sin (f64 (4618420347202753791))) (f64 (13822399961422595949)) &&
  out_eq64 (ported_cos (f64 (4618420347202753791))) (f64 (4606775053179651764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1750 :
  out_eq64 (ported_sin (f64 (4626666029527190924))) (f64 (4604454871139202634)) &&
  out_eq64 (ported_cos (f64 (4626666029527190924))) (f64 (13828004470526400102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1751 :
  out_eq64 (ported_sin (f64 (13833558405386066763))) (f64 (13830512796945173299)) &&
  out_eq64 (ported_cos (f64 (13833558405386066763))) (f64 (13814958751465570658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1752 :
  out_eq64 (ported_sin (f64 (4528868854723127711))) (f64 (4528868854723082052)) &&
  out_eq64 (ported_cos (f64 (4528868854723127711))) (f64 (4607182418799847343)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1753 :
  out_eq64 (ported_sin (f64 (13824559004676709858))) (f64 (13824342893915104406)) &&
  out_eq64 (ported_cos (f64 (13824559004676709858))) (f64 (4606409897602084465)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1754 :
  out_eq64 (ported_sin (f64 (13846282995087246515))) (f64 (4603458972203885465)) &&
  out_eq64 (ported_cos (f64 (13846282995087246515))) (f64 (4605469847449237556)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1755 :
  out_eq64 (ported_sin (f64 (13844365555813900024))) (f64 (13828554062812197208)) &&
  out_eq64 (ported_cos (f64 (13844365555813900024))) (f64 (13827207141762613079)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1756 :
  out_eq64 (ported_sin (f64 (13847666087470478130))) (f64 (13830253579473111965)) &&
  out_eq64 (ported_cos (f64 (13847666087470478130))) (f64 (13821660832083243054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1757 :
  out_eq64 (ported_sin (f64 (4494736937363985617))) (f64 (4494736937363985616)) &&
  out_eq64 (ported_cos (f64 (4494736937363985617))) (f64 (4607182418800017404)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1758 :
  out_eq64 (ported_sin (f64 (13849492684594594291))) (f64 (13824595049012558786)) &&
  out_eq64 (ported_cos (f64 (13849492684594594291))) (f64 (4606352857176309465)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1759 :
  out_eq64 (ported_sin (f64 (13835196384218884225))) (f64 (13829491914869449031)) &&
  out_eq64 (ported_cos (f64 (13835196384218884225))) (f64 (13825531775579401687)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1760 :
  out_eq64 (ported_sin (f64 (4619150068484762142))) (f64 (4599784756403231940)) &&
  out_eq64 (ported_cos (f64 (4619150068484762142))) (f64 (4606647942188709909)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1761 :
  out_eq64 (ported_sin (f64 (13718978961582467411))) (f64 (13718978961582467410)) &&
  out_eq64 (ported_cos (f64 (13718978961582467411))) (f64 (4607182418800017402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1762 :
  out_eq64 (ported_sin (f64 (13829496767665511751))) (f64 (13828504198623547914)) &&
  out_eq64 (ported_cos (f64 (13829496767665511751))) (f64 (4603896285295077717)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1763 :
  out_eq64 (ported_sin (f64 (13822648224767055276))) (f64 (13822558247340824317)) &&
  out_eq64 (ported_cos (f64 (13822648224767055276))) (f64 (4606750005905941321)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1764 :
  out_eq64 (ported_sin (f64 (4620125595654547108))) (f64 (4606610943485483440)) &&
  out_eq64 (ported_cos (f64 (4620125595654547108))) (f64 (4599986111194081623)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1765 :
  out_eq64 (ported_sin (f64 (13838260608892906458))) (f64 (4598660852254789073)) &&
  out_eq64 (ported_cos (f64 (13838260608892906458))) (f64 (13830202112180870097)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1766 :
  out_eq64 (ported_sin (f64 (4613595423181905269))) (f64 (4598885791241512073)) &&
  out_eq64 (ported_cos (f64 (4613595423181905269))) (f64 (13830168900255293955)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1767 :
  out_eq64 (ported_sin (f64 (4674211343824394169))) (f64 (4606143079049808967)) &&
  out_eq64 (ported_cos (f64 (4674211343824394169))) (f64 (4602072299254873134)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1768 :
  out_eq64 (ported_sin (f64 (13916903625254328078))) (f64 (13829817319566307198)) &&
  out_eq64 (ported_cos (f64 (13916903625254328078))) (f64 (13824181077494695932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1769 :
  out_eq64 (ported_sin (f64 (4625281107336749240))) (f64 (13826569695121714887)) &&
  out_eq64 (ported_cos (f64 (4625281107336749240))) (f64 (13829024204153096256)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1770 :
  out_eq64 (ported_sin (f64 (13844306087643473070))) (f64 (13829111784483595133)) &&
  out_eq64 (ported_cos (f64 (13844306087643473070))) (f64 (13826436791478962827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1771 :
  out_eq64 (ported_sin (f64 (13850728410336476548))) (f64 (4607127643609855287)) &&
  out_eq64 (ported_cos (f64 (13850728410336476548))) (f64 (4592599121292903343)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1772 :
  out_eq64 (ported_sin (f64 (13850291338486439362))) (f64 (4593779452966432210)) &&
  out_eq64 (ported_cos (f64 (13850291338486439362))) (f64 (13830480372119488312)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1773 :
  out_eq64 (ported_sin (f64 (13835672606324367316))) (f64 (13828424030288356587)) &&
  out_eq64 (ported_cos (f64 (13835672606324367316))) (f64 (13827364439507342382)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1774 :
  out_eq64 (ported_sin (f64 (13840787514496223862))) (f64 (4606551883175933898)) &&
  out_eq64 (ported_cos (f64 (13840787514496223862))) (f64 (4600293143861357880)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1775 :
  out_eq64 (ported_sin (f64 (13741526907999823921))) (f64 (13741526907999822645)) &&
  out_eq64 (ported_cos (f64 (13741526907999823921))) (f64 (4607182418800011192)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1776 :
  out_eq64 (ported_sin (f64 (13846186621954484068))) (f64 (4604624434437339440)) &&
  out_eq64 (ported_cos (f64 (13846186621954484068))) (f64 (4604463086090504550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1777 :
  out_eq64 (ported_sin (f64 (13847331347101458633))) (f64 (13830052500555172195)) &&
  out_eq64 (ported_cos (f64 (13847331347101458633))) (f64 (4599601361995401114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1778 :
  out_eq64 (ported_sin (f64 (13881531743496929561))) (f64 (13803905739738553398)) &&
  out_eq64 (ported_cos (f64 (13881531743496929561))) (f64 (4607181129587490632)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1779 :
  out_eq64 (ported_sin (f64 (4621515215000548208))) (f64 (13808630963724146762)) &&
  out_eq64 (ported_cos (f64 (4621515215000548208))) (f64 (13830548818059496935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1780 :
  out_eq64 (ported_sin (f64 (13832450166868704886))) (f64 (13830453497654957796)) &&
  out_eq64 (ported_cos (f64 (13832450166868704886))) (f64 (4594547247185210473)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1781 :
  out_eq64 (ported_sin (f64 (4651464449166114074))) (f64 (4605998128576010365)) &&
  out_eq64 (ported_cos (f64 (4651464449166114074))) (f64 (13825972650604344490)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1782 :
  out_eq64 (ported_sin (f64 (13847283240791927004))) (f64 (13829768413416117915)) &&
  out_eq64 (ported_cos (f64 (13847283240791927004))) (f64 (4601031569844855301)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1783 :
  out_eq64 (ported_sin (f64 (13839739689212010237))) (f64 (4605833939250565666)) &&
  out_eq64 (ported_cos (f64 (13839739689212010237))) (f64 (13826287894636663496)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1784 :
  out_eq64 (ported_sin (f64 (4621661688883712542))) (f64 (13822291026858207161)) &&
  out_eq64 (ported_cos (f64 (4621661688883712542))) (f64 (13830163863343100623)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1785 :
  out_eq64 (ported_sin (f64 (13834775926923746151))) (f64 (13829956073973672412)) &&
  out_eq64 (ported_cos (f64 (13834775926923746151))) (f64 (13823500103296330157)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1786 :
  out_eq64 (ported_sin (f64 (4627459703737882097))) (f64 (13829547207085940507)) &&
  out_eq64 (ported_cos (f64 (4627459703737882097))) (f64 (4601949404026702735)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1787 :
  out_eq64 (ported_sin (f64 (4626498478050568292))) (f64 (4606995507968677730)) &&
  out_eq64 (ported_cos (f64 (4626498478050568292))) (f64 (13819841728781444362)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1788 :
  out_eq64 (ported_sin (f64 (4576190077477931382))) (f64 (4576190013403810264)) &&
  out_eq64 (ported_cos (f64 (4576190077477931382))) (f64 (4607182075030345484)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1789 :
  out_eq64 (ported_sin (f64 (13842129640569651285))) (f64 (4567578664881104555)) &&
  out_eq64 (ported_cos (f64 (13842129640569651285))) (f64 (4607182393804669797)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1790 :
  out_eq64 (ported_sin (f64 (13843952877761818832))) (f64 (13830544841481497344)) &&
  out_eq64 (ported_cos (f64 (13843952877761818832))) (f64 (13810189725464084281)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1791 :
  out_eq64 (ported_sin (f64 (4523816738232542793))) (f64 (4523816738232533776)) &&
  out_eq64 (ported_cos (f64 (4523816738232542793))) (f64 (4607182418799981078)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1792 :
  out_eq64 (ported_sin (f64 (13847535381774981322))) (f64 (13830551168519141466)) &&
  out_eq64 (ported_cos (f64 (13847535381774981322))) (f64 (13806815520878623665)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1793 :
  out_eq64 (ported_sin (f64 (13821834847731522182))) (f64 (13821778561328867553)) &&
  out_eq64 (ported_cos (f64 (13821834847731522182))) (f64 (4606865720573730377)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1794 :
  out_eq64 (ported_sin (f64 (13817604446516571020))) (f64 (13817587785502490992)) &&
  out_eq64 (ported_cos (f64 (13817604446516571020))) (f64 (4607093580707318150)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1795 :
  out_eq64 (ported_sin (f64 (4622361022918520515))) (f64 (13830549564435855998)) &&
  out_eq64 (ported_cos (f64 (4622361022918520515))) (f64 (13808281609456616472)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1796 :
  out_eq64 (ported_sin (f64 (13850601950648102987))) (f64 (4606669992241035651)) &&
  out_eq64 (ported_cos (f64 (13850601950648102987))) (f64 (13823033139308590839)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1797 :
  out_eq64 (ported_sin (f64 (13849668993614128207))) (f64 (13829399995907466265)) &&
  out_eq64 (ported_cos (f64 (13849668993614128207))) (f64 (4602495251969007184)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1798 :
  out_eq64 (ported_sin (f64 (4626501850937733834))) (f64 (4606973001442755844)) &&
  out_eq64 (ported_cos (f64 (4626501850937733834))) (f64 (13820263965067072032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1799 :
  out_eq64 (ported_sin (f64 (13844620566740868021))) (f64 (13824689720800009404)) &&
  out_eq64 (ported_cos (f64 (13844620566740868021))) (f64 (13829702871927840921)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1800 :
  out_eq64 (ported_sin (f64 (4617303897885559279))) (f64 (13830210387352524276)) &&
  out_eq64 (ported_cos (f64 (4617303897885559279))) (f64 (4598603070217737549)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1801 :
  out_eq64 (ported_sin (f64 (13850005902045845092))) (f64 (13828522218861225598)) &&
  out_eq64 (ported_cos (f64 (13850005902045845092))) (f64 (13827246338526134367)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1802 :
  out_eq64 (ported_sin (f64 (4680443901182003879))) (f64 (13826604402098698172)) &&
  out_eq64 (ported_cos (f64 (4680443901182003879))) (f64 (13829000773408637733)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1803 :
  out_eq64 (ported_sin (f64 (13836020332130199597))) (f64 (13827447470565479281)) &&
  out_eq64 (ported_cos (f64 (13836020332130199597))) (f64 (13828352923980583951)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1804 :
  out_eq64 (ported_sin (f64 (13839720292504684090))) (f64 (4605751136315880669)) &&
  out_eq64 (ported_cos (f64 (13839720292504684090))) (f64 (13826419127036623346)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1805 :
  out_eq64 (ported_sin (f64 (13862185975595174368))) (f64 (4605368679824495371)) &&
  out_eq64 (ported_cos (f64 (13862185975595174368))) (f64 (4603595899172952806)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1806 :
  out_eq64 (ported_sin (f64 (13850492496887624949))) (f64 (4604900393624232217)) &&
  out_eq64 (ported_cos (f64 (13850492496887624949))) (f64 (13827539056799126585)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1807 :
  out_eq64 (ported_sin (f64 (13723827363403775215))) (f64 (13723827363403775209)) &&
  out_eq64 (ported_cos (f64 (13723827363403775215))) (f64 (4607182418800017381)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1808 :
  out_eq64 (ported_sin (f64 (4625656102378173940))) (f64 (13829999229464868368)) &&
  out_eq64 (ported_cos (f64 (4625656102378173940))) (f64 (4599898590200869885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1809 :
  out_eq64 (ported_sin (f64 (13850720177873281432))) (f64 (4607152819553985656)) &&
  out_eq64 (ported_cos (f64 (13850720177873281432))) (f64 (4590501332165556788)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1810 :
  out_eq64 (ported_sin (f64 (13849023878593146701))) (f64 (4606673350860728554)) &&
  out_eq64 (ported_cos (f64 (13849023878593146701))) (f64 (4599642014397314596)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1811 :
  out_eq64 (ported_sin (f64 (4653126523371082202))) (f64 (13829243025668864730)) &&
  out_eq64 (ported_cos (f64 (4653126523371082202))) (f64 (4602855473146931749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1812 :
  out_eq64 (ported_sin (f64 (4626465105990435215))) (f64 (4607149505413971158)) &&
  out_eq64 (ported_cos (f64 (4626465105990435215))) (f64 (13814190904685588123)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1813 :
  out_eq64 (ported_sin (f64 (13781101083033948294))) (f64 (13781101082844514665)) &&
  out_eq64 (ported_cos (f64 (13781101083033948294))) (f64 (4607182417684767566)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1814 :
  out_eq64 (ported_sin (f64 (4611959466348380437))) (f64 (4605851068100878440)) &&
  out_eq64 (ported_cos (f64 (4611959466348380437))) (f64 (13826260109820865246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1815 :
  out_eq64 (ported_sin (f64 (4590268231448562375))) (f64 (4590262584572014960)) &&
  out_eq64 (ported_cos (f64 (4590268231448562375))) (f64 (4607155195028421258)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1816 :
  out_eq64 (ported_sin (f64 (4623398778415657629))) (f64 (4597720635243343924)) &&
  out_eq64 (ported_cos (f64 (4623398778415657629))) (f64 (4606924958798901004)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1817 :
  out_eq64 (ported_sin (f64 (13851091366682662562))) (f64 (4595298128843697321)) &&
  out_eq64 (ported_cos (f64 (13851091366682662562))) (f64 (4607051085643016393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1818 :
  out_eq64 (ported_sin (f64 (4625267678549110350))) (f64 (13826207400699060599)) &&
  out_eq64 (ported_cos (f64 (4625267678549110350))) (f64 (13829255219394710827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1819 :
  out_eq64 (ported_sin (f64 (4626445224399495444))) (f64 (4607181421563190206)) &&
  out_eq64 (ported_cos (f64 (4626445224399495444))) (f64 (13803103479847171381)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1820 :
  out_eq64 (ported_sin (f64 (13898514937966333170))) (f64 (4603282740367586888)) &&
  out_eq64 (ported_cos (f64 (13898514937966333170))) (f64 (4605594307728083764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1821 :
  out_eq64 (ported_sin (f64 (13840407620896138069))) (f64 (4607175576802007876)) &&
  out_eq64 (ported_cos (f64 (13840407620896138069))) (f64 (4585776972960987947)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1822 :
  out_eq64 (ported_sin (f64 (4505135386751448305))) (f64 (4505135386751448279)) &&
  out_eq64 (ported_cos (f64 (4505135386751448305))) (f64 (4607182418800017293)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1823 :
  out_eq64 (ported_sin (f64 (13849171407198512783))) (f64 (4604038608377878388)) &&
  out_eq64 (ported_cos (f64 (13849171407198512783))) (f64 (4605012639366548557)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1824 :
  out_eq64 (ported_sin (f64 (13814031100324954004))) (f64 (13814024187924678429)) &&
  out_eq64 (ported_cos (f64 (13814031100324954004))) (f64 (4607151267484715591)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1825 :
  out_eq64 (ported_sin (f64 (13846293809630340959))) (f64 (4603317872528556851)) &&
  out_eq64 (ported_cos (f64 (13846293809630340959))) (f64 (4605569998697364971)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1826 :
  out_eq64 (ported_sin (f64 (13850100136154477479))) (f64 (13826262436599636830)) &&
  out_eq64 (ported_cos (f64 (13850100136154477479))) (f64 (13829221675863441748)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1827 :
  out_eq64 (ported_sin (f64 (13779286320274968109))) (f64 (13779286320086097857)) &&
  out_eq64 (ported_cos (f64 (13779286320274968109))) (f64 (4607182418098847671)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1828 :
  out_eq64 (ported_sin (f64 (13813004446768839762))) (f64 (13813000511920853968)) &&
  out_eq64 (ported_cos (f64 (13813004446768839762))) (f64 (4607161019995170044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1829 :
  out_eq64 (ported_sin (f64 (4624887529947881172))) (f64 (4598256934918581048)) &&
  out_eq64 (ported_cos (f64 (4624887529947881172))) (f64 (13830257787956780125)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1830 :
  out_eq64 (ported_sin (f64 (13756501603751182742))) (f64 (13756501603751017841)) &&
  out_eq64 (ported_cos (f64 (13756501603751182742))) (f64 (4607182418799381935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1831 :
  out_eq64 (ported_sin (f64 (13850865329760498012))) (f64 (4605625543219486771)) &&
  out_eq64 (ported_cos (f64 (13850865329760498012))) (f64 (4603237068571482886)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1832 :
  out_eq64 (ported_sin (f64 (4631427418441825121))) (f64 (4598801927352415858)) &&
  out_eq64 (ported_cos (f64 (4631427418441825121))) (f64 (4606809432006263214)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1833 :
  out_eq64 (ported_sin (f64 (13883174854007253279))) (f64 (4602021919777471116)) &&
  out_eq64 (ported_cos (f64 (13883174854007253279))) (f64 (4606156307283075259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1834 :
  out_eq64 (ported_sin (f64 (4538323184719663444))) (f64 (4538323184718789320)) &&
  out_eq64 (ported_cos (f64 (4538323184719663444))) (f64 (4607182418796950626)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1835 :
  out_eq64 (ported_sin (f64 (13844380860096241614))) (f64 (13828397623770905673)) &&
  out_eq64 (ported_cos (f64 (13844380860096241614))) (f64 (13827395513003430114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1836 :
  out_eq64 (ported_sin (f64 (13912457473703945442))) (f64 (4605168229106298116)) &&
  out_eq64 (ported_cos (f64 (13912457473703945442))) (f64 (4603852142628608246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1837 :
  out_eq64 (ported_sin (f64 (13736526341133320775))) (f64 (13736526341133320534)) &&
  out_eq64 (ported_cos (f64 (13736526341133320775))) (f64 (4607182418800016120)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1838 :
  out_eq64 (ported_sin (f64 (13765826718978935976))) (f64 (13765826718975922166)) &&
  out_eq64 (ported_cos (f64 (13765826718978935976))) (f64 (4607182418788906964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1839 :
  out_eq64 (ported_sin (f64 (4624344207902884139))) (f64 (4606641591931560790)) &&
  out_eq64 (ported_cos (f64 (4624344207902884139))) (f64 (13823191884820296137)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1840 :
  out_eq64 (ported_sin (f64 (4626891245017937653))) (f64 (13807291092540929917)) &&
  out_eq64 (ported_cos (f64 (4626891245017937653))) (f64 (13830550754625944051)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1841 :
  out_eq64 (ported_sin (f64 (13895651621468321900))) (f64 (4606318955574306945)) &&
  out_eq64 (ported_cos (f64 (13895651621468321900))) (f64 (13824740201946739178)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1842 :
  out_eq64 (ported_sin (f64 (13858005417094999510))) (f64 (13829060594777609527)) &&
  out_eq64 (ported_cos (f64 (13858005417094999510))) (f64 (4603143054570610015)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1843 :
  out_eq64 (ported_sin (f64 (13714475578070100730))) (f64 (13714475578070100730)) &&
  out_eq64 (ported_cos (f64 (13714475578070100730))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1844 :
  out_eq64 (ported_sin (f64 (13849082592262326094))) (f64 (4605870954260851165)) &&
  out_eq64 (ported_cos (f64 (13849082592262326094))) (f64 (4602855529962556911)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1845 :
  out_eq64 (ported_sin (f64 (13748168835126499031))) (f64 (13748168835126485456)) &&
  out_eq64 (ported_cos (f64 (13748168835126499031))) (f64 (4607182418799969683)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1846 :
  out_eq64 (ported_sin (f64 (4546507019948481288))) (f64 (4546507019938518322)) &&
  out_eq64 (ported_cos (f64 (4546507019948481288))) (f64 (4607182418760879294)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1847 :
  out_eq64 (ported_sin (f64 (4616163024119018064))) (f64 (13828293921680081445)) &&
  out_eq64 (ported_cos (f64 (4616163024119018064))) (f64 (13827514847707594565)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1848 :
  out_eq64 (ported_sin (f64 (13733213532184342279))) (f64 (13733213532184342165)) &&
  out_eq64 (ported_cos (f64 (13733213532184342279))) (f64 (4607182418800016916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1849 :
  out_eq64 (ported_sin (f64 (4674341939426800944))) (f64 (13830299696819135027)) &&
  out_eq64 (ported_cos (f64 (4674341939426800944))) (f64 (4597676298729808395)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1850 :
  out_eq64 (ported_sin (f64 (4615458013478952686))) (f64 (13826127942980087303)) &&
  out_eq64 (ported_cos (f64 (4615458013478952686))) (f64 (13829302702800491931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1851 :
  out_eq64 (ported_sin (f64 (4622306277550058288))) (f64 (13830478213146027653)) &&
  out_eq64 (ported_cos (f64 (4622306277550058288))) (f64 (13817217919932734828)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1852 :
  out_eq64 (ported_sin (f64 (13844140285948957992))) (f64 (13830205412235740166)) &&
  out_eq64 (ported_cos (f64 (13844140285948957992))) (f64 (13822009933422063842)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1853 :
  out_eq64 (ported_sin (f64 (4614594205671422032))) (f64 (13817920639297379764)) &&
  out_eq64 (ported_cos (f64 (4614594205671422032))) (f64 (13830453446488757904)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1854 :
  out_eq64 (ported_sin (f64 (4618720512014015709))) (f64 (13808619054603844415)) &&
  out_eq64 (ported_cos (f64 (4618720512014015709))) (f64 (4607176807520881138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1855 :
  out_eq64 (ported_sin (f64 (4604796656942401661))) (f64 (4604216181722052722)) &&
  out_eq64 (ported_cos (f64 (4604796656942401661))) (f64 (4604856268444466179)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1856 :
  out_eq64 (ported_sin (f64 (13824669534457837116))) (f64 (13824443805852210445)) &&
  out_eq64 (ported_cos (f64 (13824669534457837116))) (f64 (4606387350012749169)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1857 :
  out_eq64 (ported_sin (f64 (13843017506316738564))) (f64 (13827921586915427920)) &&
  out_eq64 (ported_cos (f64 (13843017506316738564))) (f64 (4604538987996073232)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1858 :
  out_eq64 (ported_sin (f64 (13846468596548820970))) (f64 (4598946644472887351)) &&
  out_eq64 (ported_cos (f64 (13846468596548820970))) (f64 (4606787604081552790)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1859 :
  out_eq64 (ported_sin (f64 (4627656766239302846))) (f64 (13823946586945892796)) &&
  out_eq64 (ported_cos (f64 (4627656766239302846))) (f64 (4606494896652625579)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1860 :
  out_eq64 (ported_sin (f64 (4622159550720952261))) (f64 (13829875204898534349)) &&
  out_eq64 (ported_cos (f64 (4622159550720952261))) (f64 (13823906575166844959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1861 :
  out_eq64 (ported_sin (f64 (13838692239184814747))) (f64 (4601867160438926802)) &&
  out_eq64 (ported_cos (f64 (13838692239184814747))) (f64 (13829568348427119541)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1862 :
  out_eq64 (ported_sin (f64 (4627748852624428783))) (f64 (13812795310638010975)) &&
  out_eq64 (ported_cos (f64 (4627748852624428783))) (f64 (4607162754468293080)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1863 :
  out_eq64 (ported_sin (f64 (13891908403516108286))) (f64 (13819014280636153945)) &&
  out_eq64 (ported_cos (f64 (13891908403516108286))) (f64 (13830407838508555054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1864 :
  out_eq64 (ported_sin (f64 (13844173667128511837))) (f64 (13830043039034697762)) &&
  out_eq64 (ported_cos (f64 (13844173667128511837))) (f64 (13823027406713801262)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1865 :
  out_eq64 (ported_sin (f64 (4624075658244292904))) (f64 (4607107872855251965)) &&
  out_eq64 (ported_cos (f64 (4624075658244292904))) (f64 (4593793762623851543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1866 :
  out_eq64 (ported_sin (f64 (13843996169462103860))) (f64 (13830522197357062960)) &&
  out_eq64 (ported_cos (f64 (13843996169462103860))) (f64 (13814129460627884569)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1867 :
  out_eq64 (ported_sin (f64 (13839729205573503171))) (f64 (4605789466179718253)) &&
  out_eq64 (ported_cos (f64 (13839729205573503171))) (f64 (13826359001052929998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1868 :
  out_eq64 (ported_sin (f64 (13848259830357183382))) (f64 (13821620815306289167)) &&
  out_eq64 (ported_cos (f64 (13848259830357183382))) (f64 (13830258860348474284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1869 :
  out_eq64 (ported_sin (f64 (4622614854214418384))) (f64 (13829779186535825121)) &&
  out_eq64 (ported_cos (f64 (4622614854214418384))) (f64 (4600983244813744246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1870 :
  out_eq64 (ported_sin (f64 (13844029057966651285))) (f64 (13830496124017074519)) &&
  out_eq64 (ported_cos (f64 (13844029057966651285))) (f64 (13816223889008185344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1871 :
  out_eq64 (ported_sin (f64 (13834531495103581836))) (f64 (13830118816931603000)) &&
  out_eq64 (ported_cos (f64 (13834531495103581836))) (f64 (13822578270930350771)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1872 :
  out_eq64 (ported_sin (f64 (4616883710801219224))) (f64 (13830513059338950874)) &&
  out_eq64 (ported_cos (f64 (4616883710801219224))) (f64 (13814936966834531293)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1873 :
  out_eq64 (ported_sin (f64 (4624903478841002329))) (f64 (4597347992540477933)) &&
  out_eq64 (ported_cos (f64 (4624903478841002329))) (f64 (13830319236894159147)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1874 :
  out_eq64 (ported_sin (f64 (4625324101999504656))) (f64 (13827648868294162301)) &&
  out_eq64 (ported_cos (f64 (4625324101999504656))) (f64 (13828172961698981623)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1875 :
  out_eq64 (ported_sin (f64 (13715248615814603208))) (f64 (13715248615814603208)) &&
  out_eq64 (ported_cos (f64 (13715248615814603208))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1876 :
  out_eq64 (ported_sin (f64 (13853107250849568328))) (f64 (13828201978129134484)) &&
  out_eq64 (ported_cos (f64 (13853107250849568328))) (f64 (4604245171532161246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1877 :
  out_eq64 (ported_sin (f64 (13846202269596493968))) (f64 (4604447189495308568)) &&
  out_eq64 (ported_cos (f64 (13846202269596493968))) (f64 (4604639895203072433)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1878 :
  out_eq64 (ported_sin (f64 (13841802140154754782))) (f64 (4598878687562216962)) &&
  out_eq64 (ported_cos (f64 (13841802140154754782))) (f64 (4606797936637440518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1879 :
  out_eq64 (ported_sin (f64 (4598414966843123783))) (f64 (4598360346018800265)) &&
  out_eq64 (ported_cos (f64 (4598414966843123783))) (f64 (4606871977579297180)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1880 :
  out_eq64 (ported_sin (f64 (4585123414464495450))) (f64 (4585122433779379982)) &&
  out_eq64 (ported_cos (f64 (4585123414464495450))) (f64 (4607177079125975996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1881 :
  out_eq64 (ported_sin (f64 (13848785219547534925))) (f64 (4606035871932281222)) &&
  out_eq64 (ported_cos (f64 (13848785219547534925))) (f64 (13825839060678195638)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1882 :
  out_eq64 (ported_sin (f64 (4554898677888865906))) (f64 (4554898677768537595)) &&
  out_eq64 (ported_cos (f64 (4554898677888865906))) (f64 (4607182418280867631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1883 :
  out_eq64 (ported_sin (f64 (13835835683485394228))) (f64 (13827985087670940492)) &&
  out_eq64 (ported_cos (f64 (13835835683485394228))) (f64 (13827846777567742656)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1884 :
  out_eq64 (ported_sin (f64 (13832315356793005738))) (f64 (13830409258567951800)) &&
  out_eq64 (ported_cos (f64 (13832315356793005738))) (f64 (4595611070488384141)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1885 :
  out_eq64 (ported_sin (f64 (4555371718256237918))) (f64 (4555371718106533769)) &&
  out_eq64 (ported_cos (f64 (4555371718256237918))) (f64 (4607182418199484679)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1886 :
  out_eq64 (ported_sin (f64 (13850785735417171590))) (f64 (4606742019808506383)) &&
  out_eq64 (ported_cos (f64 (13850785735417171590))) (f64 (4599235637051067770)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1887 :
  out_eq64 (ported_sin (f64 (4625829861978293768))) (f64 (13826637038993422247)) &&
  out_eq64 (ported_cos (f64 (4625829861978293768))) (f64 (4605606488048488651)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1888 :
  out_eq64 (ported_sin (f64 (13847020776673765750))) (f64 (13827236735095664127)) &&
  out_eq64 (ported_cos (f64 (13847020776673765750))) (f64 (4605158017737031994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1889 :
  out_eq64 (ported_sin (f64 (13849194822294017341))) (f64 (4603450202909413282)) &&
  out_eq64 (ported_cos (f64 (13849194822294017341))) (f64 (4605476191324614150)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1890 :
  out_eq64 (ported_sin (f64 (13853909805493822398))) (f64 (13821475709663629838)) &&
  out_eq64 (ported_cos (f64 (13853909805493822398))) (f64 (4606901001489841518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1891 :
  out_eq64 (ported_sin (f64 (4626804689282919975))) (f64 (4598629911374026873)) &&
  out_eq64 (ported_cos (f64 (4626804689282919975))) (f64 (13830206556306721710)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1892 :
  out_eq64 (ported_sin (f64 (13845187952070728143))) (f64 (4603032254718563806)) &&
  out_eq64 (ported_cos (f64 (13845187952070728143))) (f64 (13829132692955719658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1893 :
  out_eq64 (ported_sin (f64 (4616935420539559207))) (f64 (13830543206514165886)) &&
  out_eq64 (ported_cos (f64 (4616935420539559207))) (f64 (13810733212708228800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1894 :
  out_eq64 (ported_sin (f64 (13819413294999262783))) (f64 (13819371680656642873)) &&
  out_eq64 (ported_cos (f64 (13819413294999262783))) (f64 (4607019013749523283)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1895 :
  out_eq64 (ported_sin (f64 (4526156780781058735))) (f64 (4526156780781047525)) &&
  out_eq64 (ported_cos (f64 (4526156780781058735))) (f64 (4607182418799950727)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1896 :
  out_eq64 (ported_sin (f64 (4609360651553247386))) (f64 (4607148249558752831)) &&
  out_eq64 (ported_cos (f64 (4609360651553247386))) (f64 (4590934965350743491)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1897 :
  out_eq64 (ported_sin (f64 (13845188605562877450))) (f64 (4603041056886197909)) &&
  out_eq64 (ported_cos (f64 (13845188605562877450))) (f64 (13829127049628518337)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1898 :
  out_eq64 (ported_sin (f64 (4680000980448937977))) (f64 (13830320308243509998)) &&
  out_eq64 (ported_cos (f64 (4680000980448937977))) (f64 (4597329588538472913)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1899 :
  out_eq64 (ported_sin (f64 (13845747602825057593))) (f64 (4607182190275626869)) &&
  out_eq64 (ported_cos (f64 (13845747602825057593))) (f64 (13798234710195603048)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1900 :
  out_eq64 (ported_sin (f64 (13842385163247500038))) (f64 (13820564046639554580)) &&
  out_eq64 (ported_cos (f64 (13842385163247500038))) (f64 (4606956199727002924)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1901 :
  out_eq64 (ported_sin (f64 (4632113473960609661))) (f64 (13829653388431883531)) &&
  out_eq64 (ported_cos (f64 (4632113473960609661))) (f64 (4601525348178324696)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1902 :
  out_eq64 (ported_sin (f64 (13780740956576505846))) (f64 (13780740956250260856)) &&
  out_eq64 (ported_cos (f64 (13780740956576505846))) (f64 (4607182417790586289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1903 :
  out_eq64 (ported_sin (f64 (13713617192406809400))) (f64 (13713617192406809400)) &&
  out_eq64 (ported_cos (f64 (13713617192406809400))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1904 :
  out_eq64 (ported_sin (f64 (4554989152132981508))) (f64 (4554989152007362822)) &&
  out_eq64 (ported_cos (f64 (4554989152132981508))) (f64 (4607182418265760325)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1905 :
  out_eq64 (ported_sin (f64 (4626538723371840490))) (f64 (4606645393441597062)) &&
  out_eq64 (ported_cos (f64 (4626538723371840490))) (f64 (13823170904957860786)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1906 :
  out_eq64 (ported_sin (f64 (13835265291673161079))) (f64 (13829358342937563717)) &&
  out_eq64 (ported_cos (f64 (13835265291673161079))) (f64 (13826013955656913714)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1907 :
  out_eq64 (ported_sin (f64 (4607628275947615214))) (f64 (4606198412884114092)) &&
  out_eq64 (ported_cos (f64 (4607628275947615214))) (f64 (4601858928892712580)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1908 :
  out_eq64 (ported_sin (f64 (4618468099008084498))) (f64 (13821665888987561949)) &&
  out_eq64 (ported_cos (f64 (4618468099008084498))) (f64 (4606880871775439160)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1909 :
  out_eq64 (ported_sin (f64 (13922468275869437327))) (f64 (13826465980117067147)) &&
  out_eq64 (ported_cos (f64 (13922468275869437327))) (f64 (4605720800729670470)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1910 :
  out_eq64 (ported_sin (f64 (13838639737573160290))) (f64 (4601490936920637284)) &&
  out_eq64 (ported_cos (f64 (13838639737573160290))) (f64 (13829661700855300268)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1911 :
  out_eq64 (ported_sin (f64 (4622612767280101938))) (f64 (13829792682548331572)) &&
  out_eq64 (ported_cos (f64 (4622612767280101938))) (f64 (4600922160876449047)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1912 :
  out_eq64 (ported_sin (f64 (13846559894691066858))) (f64 (4594017129959806051)) &&
  out_eq64 (ported_cos (f64 (13846559894691066858))) (f64 (4607100465865578636)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1913 :
  out_eq64 (ported_sin (f64 (13846498273896435589))) (f64 (4597888158264911109)) &&
  out_eq64 (ported_cos (f64 (13846498273896435589))) (f64 (4606914618152809281)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1914 :
  out_eq64 (ported_sin (f64 (4625694558935404685))) (f64 (13829496409842277428)) &&
  out_eq64 (ported_cos (f64 (4625694558935404685))) (f64 (4602142888528112039)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1915 :
  out_eq64 (ported_sin (f64 (13809614771421583034))) (f64 (13809612966279902581)) &&
  out_eq64 (ported_cos (f64 (13809614771421583034))) (f64 (4607174399133775998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1916 :
  out_eq64 (ported_sin (f64 (13792964822638371999))) (f64 (13792964809695766666)) &&
  out_eq64 (ported_cos (f64 (13792964822638371999))) (f64 (4607182371833499436)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1917 :
  out_eq64 (ported_sin (f64 (13912272966934582561))) (f64 (4602448753335544969)) &&
  out_eq64 (ported_cos (f64 (13912272966934582561))) (f64 (13829413012603803243)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1918 :
  out_eq64 (ported_sin (f64 (4626298472548347485))) (f64 (4606051603427578291)) &&
  out_eq64 (ported_cos (f64 (4626298472548347485))) (f64 (4602410547850603827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1919 :
  out_eq64 (ported_sin (f64 (4624120558207748666))) (f64 (4607171613485724715)) &&
  out_eq64 (ported_cos (f64 (4624120558207748666))) (f64 (4587217791179927461)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1920 :
  out_eq64 (ported_sin (f64 (13759772618565058212))) (f64 (13759772618564688888)) &&
  out_eq64 (ported_cos (f64 (13759772618565058212))) (f64 (4607182418798290619)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1921 :
  out_eq64 (ported_sin (f64 (4665844428588078212))) (f64 (4605530205840108667)) &&
  out_eq64 (ported_cos (f64 (4665844428588078212))) (f64 (4603374624801402970)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1922 :
  out_eq64 (ported_sin (f64 (13805760421098758891))) (f64 (13805759809273080720)) &&
  out_eq64 (ported_cos (f64 (13805760421098758891))) (f64 (4607179962730058941)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1923 :
  out_eq64 (ported_sin (f64 (4622846138085349529))) (f64 (13827634097332273401)) &&
  out_eq64 (ported_cos (f64 (4622846138085349529))) (f64 (4604814497057208231)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1924 :
  out_eq64 (ported_sin (f64 (13749781981728793771))) (f64 (13749781981728780580)) &&
  out_eq64 (ported_cos (f64 (13749781981728793771))) (f64 (4607182418799943088)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1925 :
  out_eq64 (ported_sin (f64 (4526442590170682906))) (f64 (4526442590170669444)) &&
  out_eq64 (ported_cos (f64 (4526442590170682906))) (f64 (4607182418799942073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1926 :
  out_eq64 (ported_sin (f64 (13839694714437763740))) (f64 (4605638512338703971)) &&
  out_eq64 (ported_cos (f64 (13839694714437763740))) (f64 (13826589963916275925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1927 :
  out_eq64 (ported_sin (f64 (4621945105462988055))) (f64 (13828002481854062018)) &&
  out_eq64 (ported_cos (f64 (4621945105462988055))) (f64 (13827828952250100261)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1928 :
  out_eq64 (ported_sin (f64 (4623615499188246300))) (f64 (4603442707446181436)) &&
  out_eq64 (ported_cos (f64 (4623615499188246300))) (f64 (4605481600977177293)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1929 :
  out_eq64 (ported_sin (f64 (4624455019128176579))) (f64 (4605876891988989347)) &&
  out_eq64 (ported_cos (f64 (4624455019128176579))) (f64 (13826217789558521348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1930 :
  out_eq64 (ported_sin (f64 (4524019011626163399))) (f64 (4524019011626153542)) &&
  out_eq64 (ported_cos (f64 (4524019011626163399))) (f64 (4607182418799978853)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1931 :
  out_eq64 (ported_sin (f64 (13849742429406686078))) (f64 (13830272265823382396)) &&
  out_eq64 (ported_cos (f64 (13849742429406686078))) (f64 (4598115734168309014)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1932 :
  out_eq64 (ported_sin (f64 (4627474285383616870))) (f64 (13829322157784149023)) &&
  out_eq64 (ported_cos (f64 (4627474285383616870))) (f64 (4602722806474866257)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1933 :
  out_eq64 (ported_sin (f64 (4556553903156245452))) (f64 (4556553902913080049)) &&
  out_eq64 (ported_cos (f64 (4556553903156245452))) (f64 (4607182417970201074)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1934 :
  out_eq64 (ported_sin (f64 (4543736240022127031))) (f64 (4543736240017239912)) &&
  out_eq64 (ported_cos (f64 (4543736240022127031))) (f64 (4607182418784682209)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1935 :
  out_eq64 (ported_sin (f64 (4625933518285657817))) (f64 (13820833363417939884)) &&
  out_eq64 (ported_cos (f64 (4625933518285657817))) (f64 (4606940546427736666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1936 :
  out_eq64 (ported_sin (f64 (4693154325076897961))) (f64 (4605391464691606651)) &&
  out_eq64 (ported_cos (f64 (4693154325076897961))) (f64 (13826937566632559441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1937 :
  out_eq64 (ported_sin (f64 (4624044293195110764))) (f64 (4607029613905021048)) &&
  out_eq64 (ported_cos (f64 (4624044293195110764))) (f64 (4595776304711447256)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1938 :
  out_eq64 (ported_sin (f64 (4624787257898545765))) (f64 (4601271028741515817)) &&
  out_eq64 (ported_cos (f64 (4624787257898545765))) (f64 (13829713766352138041)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1939 :
  out_eq64 (ported_sin (f64 (13844130154262093416))) (f64 (13830248697891021550)) &&
  out_eq64 (ported_cos (f64 (13844130154262093416))) (f64 (13821697495787449728)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1940 :
  out_eq64 (ported_sin (f64 (13837845361257252448))) (f64 (4591587098335639591)) &&
  out_eq64 (ported_cos (f64 (13837845361257252448))) (f64 (13830512792315763224)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1941 :
  out_eq64 (ported_sin (f64 (13715144203670949100))) (f64 (13715144203670949100)) &&
  out_eq64 (ported_cos (f64 (13715144203670949100))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1942 :
  out_eq64 (ported_sin (f64 (4591338867512596058))) (f64 (4591329327504023155)) &&
  out_eq64 (ported_cos (f64 (4591338867512596058))) (f64 (4607143806978766072)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1943 :
  out_eq64 (ported_sin (f64 (4627524707271069792))) (f64 (13828387465876530280)) &&
  out_eq64 (ported_cos (f64 (4627524707271069792))) (f64 (4604035353735933357)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1944 :
  out_eq64 (ported_sin (f64 (4621353040015984839))) (f64 (4598175529845887882)) &&
  out_eq64 (ported_cos (f64 (4621353040015984839))) (f64 (13830268399516339392)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1945 :
  out_eq64 (ported_sin (f64 (13848785755683605050))) (f64 (4606044234137694662)) &&
  out_eq64 (ported_cos (f64 (13848785755683605050))) (f64 (13825809099775500327)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1946 :
  out_eq64 (ported_sin (f64 (13809881599621898590))) (f64 (13809879546332887234)) &&
  out_eq64 (ported_cos (f64 (13809881599621898590))) (f64 (4607173680129757022)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1947 :
  out_eq64 (ported_sin (f64 (13846838832529568408))) (f64 (13823397986709316468)) &&
  out_eq64 (ported_cos (f64 (13846838832529568408))) (f64 (4606603461424737610)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1948 :
  out_eq64 (ported_sin (f64 (4630557739880196408))) (f64 (4600562685078454479)) &&
  out_eq64 (ported_cos (f64 (4630557739880196408))) (f64 (4606497355307980312)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1949 :
  out_eq64 (ported_sin (f64 (13845740120676412258))) (f64 (4607180542006618855)) &&
  out_eq64 (ported_cos (f64 (13845740120676412258))) (f64 (13804912889846872402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1950 :
  out_eq64 (ported_sin (f64 (4625629606567757303))) (f64 (13830254457363786822)) &&
  out_eq64 (ported_cos (f64 (4625629606567757303))) (f64 (4598282168601846246)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1951 :
  out_eq64 (ported_sin (f64 (4623674154070633000))) (f64 (4604174031320221132)) &&
  out_eq64 (ported_cos (f64 (4623674154070633000))) (f64 (4604894140269871349)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1952 :
  out_eq64 (ported_sin (f64 (4591608670508635952))) (f64 (4591597926568630411)) &&
  out_eq64 (ported_cos (f64 (4591608670508635952))) (f64 (4607140624718072658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1953 :
  out_eq64 (ported_sin (f64 (13903438400429344430))) (f64 (13830328705655136568)) &&
  out_eq64 (ported_cos (f64 (13903438400429344430))) (f64 (4597183792138571316)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1954 :
  out_eq64 (ported_sin (f64 (13804633098209321397))) (f64 (13804632745173956471)) &&
  out_eq64 (ported_cos (f64 (13804633098209321397))) (f64 (4607180716492399695)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1955 :
  out_eq64 (ported_sin (f64 (13850197637150154118))) (f64 (13819858426878030703)) &&
  out_eq64 (ported_cos (f64 (13850197637150154118))) (f64 (13830366679847367681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1956 :
  out_eq64 (ported_sin (f64 (13851092920580883149))) (f64 (4595102037582941913)) &&
  out_eq64 (ported_cos (f64 (13851092920580883149))) (f64 (4607059410748641272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1957 :
  out_eq64 (ported_sin (f64 (13841840224533541385))) (f64 (4598292480884460073)) &&
  out_eq64 (ported_cos (f64 (13841840224533541385))) (f64 (4606881053761280689)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1958 :
  out_eq64 (ported_sin (f64 (13857705440789532832))) (f64 (13817379923178706750)) &&
  out_eq64 (ported_cos (f64 (13857705440789532832))) (f64 (13830472816296399383)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1959 :
  out_eq64 (ported_sin (f64 (4625316735067110650))) (f64 (13827473386448890164)) &&
  out_eq64 (ported_cos (f64 (4625316735067110650))) (f64 (13828330369332833656)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1960 :
  out_eq64 (ported_sin (f64 (13849274957884730788))) (f64 (4599695686871232569)) &&
  out_eq64 (ported_cos (f64 (13849274957884730788))) (f64 (4606663876255855901)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1961 :
  out_eq64 (ported_sin (f64 (13726056208394075395))) (f64 (13726056208394075380)) &&
  out_eq64 (ported_cos (f64 (13726056208394075395))) (f64 (4607182418800017356)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1962 :
  out_eq64 (ported_sin (f64 (13851050190015257801))) (f64 (4599291564926457837)) &&
  out_eq64 (ported_cos (f64 (13851050190015257801))) (f64 (4606732888207933307)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1963 :
  out_eq64 (ported_sin (f64 (13822470322818976902))) (f64 (13822388619862241769)) &&
  out_eq64 (ported_cos (f64 (13822470322818976902))) (f64 (4606776817118251850)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1964 :
  out_eq64 (ported_sin (f64 (13847084567247662606))) (f64 (13827989809307409060)) &&
  out_eq64 (ported_cos (f64 (13847084567247662606))) (f64 (4604469911789581507)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1965 :
  out_eq64 (ported_sin (f64 (4624553423772307344))) (f64 (4604947260385834616)) &&
  out_eq64 (ported_cos (f64 (4624553423772307344))) (f64 (13827486035842700222)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1966 :
  out_eq64 (ported_sin (f64 (13849126963654372348))) (f64 (4605040785740665346)) &&
  out_eq64 (ported_cos (f64 (13849126963654372348))) (f64 (4604005625983196456)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1967 :
  out_eq64 (ported_sin (f64 (4618897729492348408))) (f64 (4593440867260133348)) &&
  out_eq64 (ported_cos (f64 (4618897729492348408))) (f64 (4607115359752916993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1968 :
  out_eq64 (ported_sin (f64 (13826741251348678426))) (f64 (13826458144571751129)) &&
  out_eq64 (ported_cos (f64 (13826741251348678426))) (f64 (4605725902678587896)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1969 :
  out_eq64 (ported_sin (f64 (4623585046727996011))) (f64 (4603039960587846531)) &&
  out_eq64 (ported_cos (f64 (4623585046727996011))) (f64 (4605755716428947071)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1970 :
  out_eq64 (ported_sin (f64 (13840538075014509083))) (f64 (4607074649908902017)) &&
  out_eq64 (ported_cos (f64 (13840538075014509083))) (f64 (4594724677728363160)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1971 :
  out_eq64 (ported_sin (f64 (13849361051411241137))) (f64 (4585219079016914947)) &&
  out_eq64 (ported_cos (f64 (13849361051411241137))) (f64 (4607176869016592020)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1972 :
  out_eq64 (ported_sin (f64 (4547246312598333644))) (f64 (4547246312584800674)) &&
  out_eq64 (ported_cos (f64 (4547246312598333644))) (f64 (4607182418752014280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1973 :
  out_eq64 (ported_sin (f64 (4535839647860275951))) (f64 (4535839647860004065)) &&
  out_eq64 (ported_cos (f64 (4535839647860275951))) (f64 (4607182418798609550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1974 :
  out_eq64 (ported_sin (f64 (13854045534232755864))) (f64 (13829990456527916189)) &&
  out_eq64 (ported_cos (f64 (13854045534232755864))) (f64 (4599946015511250222)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1975 :
  out_eq64 (ported_sin (f64 (4684795560343496050))) (f64 (4603528280955020832)) &&
  out_eq64 (ported_cos (f64 (4684795560343496050))) (f64 (13828791176054363128)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1976 :
  out_eq64 (ported_sin (f64 (4675929154852274903))) (f64 (4603938102638189972)) &&
  out_eq64 (ported_cos (f64 (4675929154852274903))) (f64 (13828469598263324925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1977 :
  out_eq64 (ported_sin (f64 (4590883413319590293))) (f64 (4590875695624451113)) &&
  out_eq64 (ported_cos (f64 (4590883413319590293))) (f64 (4607148893648147170)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1978 :
  out_eq64 (ported_sin (f64 (13848606111713264651))) (f64 (4601089517433577240)) &&
  out_eq64 (ported_cos (f64 (13848606111713264651))) (f64 (13829755382710383711)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1979 :
  out_eq64 (ported_sin (f64 (4626423932211509581))) (f64 (4607165795246658858)) &&
  out_eq64 (ported_cos (f64 (4626423932211509581))) (f64 (4588912498869986284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1980 :
  out_eq64 (ported_sin (f64 (4673186013010803175))) (f64 (13806051864784581044)) &&
  out_eq64 (ported_cos (f64 (4673186013010803175))) (f64 (13830551781777855055)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1981 :
  out_eq64 (ported_sin (f64 (13867037277633645378))) (f64 (4605422445774802011)) &&
  out_eq64 (ported_cos (f64 (13867037277633645378))) (f64 (4603523803506726671)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1982 :
  out_eq64 (ported_sin (f64 (13848991003361028791))) (f64 (4606963321427716649)) &&
  out_eq64 (ported_cos (f64 (13848991003361028791))) (f64 (4597066277028279130)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1983 :
  out_eq64 (ported_sin (f64 (4625865591070367405))) (f64 (13825259805194588422)) &&
  out_eq64 (ported_cos (f64 (4625865591070367405))) (f64 (4606191039197183931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1984 :
  out_eq64 (ported_sin (f64 (4626133427795627357))) (f64 (4601957567673788356)) &&
  out_eq64 (ported_cos (f64 (4626133427795627357))) (f64 (4606173057119352510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1985 :
  out_eq64 (ported_sin (f64 (4698277642255908469))) (f64 (4599176706640733074)) &&
  out_eq64 (ported_cos (f64 (4698277642255908469))) (f64 (4606751532474393726)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1986 :
  out_eq64 (ported_sin (f64 (4620664926149561435))) (f64 (4607116681071850943)) &&
  out_eq64 (ported_cos (f64 (4620664926149561435))) (f64 (13816726329078397135)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1987 :
  out_eq64 (ported_sin (f64 (4624434018266393081))) (f64 (4606045727480953286)) &&
  out_eq64 (ported_cos (f64 (4624434018266393081))) (f64 (13825803735139695142)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1988 :
  out_eq64 (ported_sin (f64 (13849918606335232020))) (f64 (13829928752392566414)) &&
  out_eq64 (ported_cos (f64 (13849918606335232020))) (f64 (13823640675293824520)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1989 :
  out_eq64 (ported_sin (f64 (13813629482432185046))) (f64 (13813623868092674502)) &&
  out_eq64 (ported_cos (f64 (13813629482432185046))) (f64 (4607155299672288943)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1990 :
  out_eq64 (ported_sin (f64 (4626091083003153729))) (f64 (4599466675500664068)) &&
  out_eq64 (ported_cos (f64 (4626091083003153729))) (f64 (4606703640918121017)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1991 :
  out_eq64 (ported_sin (f64 (4626013536893908554))) (f64 (4587653580946438471)) &&
  out_eq64 (ported_cos (f64 (4626013536893908554))) (f64 (4607170236825489449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1992 :
  out_eq64 (ported_sin (f64 (13848767619248262494))) (f64 (4605745705961921063)) &&
  out_eq64 (ported_cos (f64 (13848767619248262494))) (f64 (13826427561086237870)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1993 :
  out_eq64 (ported_sin (f64 (4627129821622115674))) (f64 (13828467956077502260)) &&
  out_eq64 (ported_cos (f64 (4627129821622115674))) (f64 (13827312111505703158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1994 :
  out_eq64 (ported_sin (f64 (13848251077685391949))) (f64 (13821891144914426893)) &&
  out_eq64 (ported_cos (f64 (13848251077685391949))) (f64 (13830222226318934749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1995 :
  out_eq64 (ported_sin (f64 (4618914459597570491))) (f64 (4594087117145272984)) &&
  out_eq64 (ported_cos (f64 (4618914459597570491))) (f64 (4607098071880598548)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1996 :
  out_eq64 (ported_sin (f64 (4633207334975683673))) (f64 (4600177230602093969)) &&
  out_eq64 (ported_cos (f64 (4633207334975683673))) (f64 (4606574558556237413)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1997 :
  out_eq64 (ported_sin (f64 (13870462522751155440))) (f64 (4605808112970493613)) &&
  out_eq64 (ported_cos (f64 (13870462522751155440))) (f64 (4602957329578920850)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1998 :
  out_eq64 (ported_sin (f64 (4530755128847134418))) (f64 (4530755128847086713)) &&
  out_eq64 (ported_cos (f64 (4530755128847134418))) (f64 (4607182418799739444)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_1999 :
  out_eq64 (ported_sin (f64 (4625961739301627528))) (f64 (13817282313000053167)) &&
  out_eq64 (ported_cos (f64 (4625961739301627528))) (f64 (4607104053539847994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2000 :
  out_eq64 (ported_sin (f64 (13848343284950131166))) (f64 (13815850456305663364)) &&
  out_eq64 (ported_cos (f64 (13848343284950131166))) (f64 (13830501339164251449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2001 :
  out_eq64 (ported_sin (f64 (13844533002564960237))) (f64 (13826587591626719316)) &&
  out_eq64 (ported_cos (f64 (13844533002564960237))) (f64 (13829012151524394258)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2002 :
  out_eq64 (ported_sin (f64 (4623650014281570918))) (f64 (4603880492006482461)) &&
  out_eq64 (ported_cos (f64 (4623650014281570918))) (f64 (4605145119441114993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2003 :
  out_eq64 (ported_sin (f64 (13810575360318649644))) (f64 (13810572557736153988)) &&
  out_eq64 (ported_cos (f64 (13810575360318649644))) (f64 (4607171666339580690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2004 :
  out_eq64 (ported_sin (f64 (4623393743589471057))) (f64 (4597407279012220939)) &&
  out_eq64 (ported_cos (f64 (4623393743589471057))) (f64 (4606943731499817349)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2005 :
  out_eq64 (ported_sin (f64 (13777669604841068506))) (f64 (13777669604752167620)) &&
  out_eq64 (ported_cos (f64 (13777669604841068506))) (f64 (4607182418375738426)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2006 :
  out_eq64 (ported_sin (f64 (4611029958264127729))) (f64 (4606822799000893270)) &&
  out_eq64 (ported_cos (f64 (4611029958264127729))) (f64 (13822083104350899005)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2007 :
  out_eq64 (ported_sin (f64 (13725441206079355842))) (f64 (13725441206079355830)) &&
  out_eq64 (ported_cos (f64 (13725441206079355842))) (f64 (4607182418800017364)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2008 :
  out_eq64 (ported_sin (f64 (13749554238730093522))) (f64 (13749554238730082123)) &&
  out_eq64 (ported_cos (f64 (13749554238730093522))) (f64 (4607182418799949979)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2009 :
  out_eq64 (ported_sin (f64 (13841408610715227211))) (f64 (4603574190285874897)) &&
  out_eq64 (ported_cos (f64 (13841408610715227211))) (f64 (4605384987458099142)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2010 :
  out_eq64 (ported_sin (f64 (4618764014962175567))) (f64 (4569844395317709809)) &&
  out_eq64 (ported_cos (f64 (4618764014962175567))) (f64 (4607182368605734158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2011 :
  out_eq64 (ported_sin (f64 (4634540369943574604))) (f64 (13822969117059455804)) &&
  out_eq64 (ported_cos (f64 (4634540369943574604))) (f64 (4606681209699989299)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2012 :
  out_eq64 (ported_sin (f64 (4625337301030727804))) (f64 (13827952742351530977)) &&
  out_eq64 (ported_cos (f64 (4625337301030727804))) (f64 (13827879664168035506)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2013 :
  out_eq64 (ported_sin (f64 (4532124658573102136))) (f64 (4532124658572998457)) &&
  out_eq64 (ported_cos (f64 (4532124658573102136))) (f64 (4607182418799551027)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2014 :
  out_eq64 (ported_sin (f64 (13845867766634739788))) (f64 (4606991369720118648)) &&
  out_eq64 (ported_cos (f64 (13845867766634739788))) (f64 (4596549222912586616)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2015 :
  out_eq64 (ported_sin (f64 (4622221028902454274))) (f64 (13830199589385843756)) &&
  out_eq64 (ported_cos (f64 (4622221028902454274))) (f64 (13822050361204776948)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2016 :
  out_eq64 (ported_sin (f64 (4509563471516006926))) (f64 (4509563471516006827)) &&
  out_eq64 (ported_cos (f64 (4509563471516006926))) (f64 (4607182418800016959)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2017 :
  out_eq64 (ported_sin (f64 (13850736498445058669))) (f64 (4607095451656178338)) &&
  out_eq64 (ported_cos (f64 (13850736498445058669))) (f64 (4594162573327179929)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2018 :
  out_eq64 (ported_sin (f64 (4620834611706232082))) (f64 (4606481241732762327)) &&
  out_eq64 (ported_cos (f64 (4620834611706232082))) (f64 (13824012052236660058)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2019 :
  out_eq64 (ported_sin (f64 (13800422854916042312))) (f64 (13800422752056701318)) &&
  out_eq64 (ported_cos (f64 (13800422854916042312))) (f64 (4607181947488921301)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2020 :
  out_eq64 (ported_sin (f64 (13787373598392584642))) (f64 (13787373596377737192)) &&
  out_eq64 (ported_cos (f64 (13787373598392584642))) (f64 (4607182410237880010)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2021 :
  out_eq64 (ported_sin (f64 (4623008249434305462))) (f64 (13824944899596004894)) &&
  out_eq64 (ported_cos (f64 (4623008249434305462))) (f64 (4606269799761465994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2022 :
  out_eq64 (ported_sin (f64 (4626991089971032147))) (f64 (13823782214020748940)) &&
  out_eq64 (ported_cos (f64 (4626991089971032147))) (f64 (13829900555147746867)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2023 :
  out_eq64 (ported_sin (f64 (13765147128346779333))) (f64 (13765147128344528483)) &&
  out_eq64 (ported_cos (f64 (13765147128346779333))) (f64 (4607182418790871676)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2024 :
  out_eq64 (ported_sin (f64 (13842461055835980653))) (f64 (13822229428603164001)) &&
  out_eq64 (ported_cos (f64 (13842461055835980653))) (f64 (4606801144483806244)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2025 :
  out_eq64 (ported_sin (f64 (13911665116758940740))) (f64 (13824249660685986544)) &&
  out_eq64 (ported_cos (f64 (13911665116758940740))) (f64 (13829802437519504759)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2026 :
  out_eq64 (ported_sin (f64 (4627226497320222446))) (f64 (13830005054826835049)) &&
  out_eq64 (ported_cos (f64 (4627226497320222446))) (f64 (13823238907917394636)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2027 :
  out_eq64 (ported_sin (f64 (4607922760005666935))) (f64 (4606448754347982382)) &&
  out_eq64 (ported_cos (f64 (4607922760005666935))) (f64 (4600792928865850766)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2028 :
  out_eq64 (ported_sin (f64 (13791269049966625681))) (f64 (13791269044005524539)) &&
  out_eq64 (ported_cos (f64 (13791269049966625681))) (f64 (4607182390789251990)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2029 :
  out_eq64 (ported_sin (f64 (13848307818699388644))) (f64 (13818694267643695663)) &&
  out_eq64 (ported_cos (f64 (13848307818699388644))) (f64 (13830422080017226546)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2030 :
  out_eq64 (ported_sin (f64 (13844625821378019945))) (f64 (13824537139093800065)) &&
  out_eq64 (ported_cos (f64 (13844625821378019945))) (f64 (13829738200734521749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2031 :
  out_eq64 (ported_sin (f64 (13849814710419327315))) (f64 (13830554303196033037)) &&
  out_eq64 (ported_cos (f64 (13849814710419327315))) (f64 (13796730076813210164)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2032 :
  out_eq64 (ported_sin (f64 (4623555950243629225))) (f64 (4602604850827202091)) &&
  out_eq64 (ported_cos (f64 (4623555950243629225))) (f64 (4605996919155649187)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2033 :
  out_eq64 (ported_sin (f64 (4625915188110721546))) (f64 (13822322342428085621)) &&
  out_eq64 (ported_cos (f64 (4625915188110721546))) (f64 (4606787043269230882)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2034 :
  out_eq64 (ported_sin (f64 (13767620648886777102))) (f64 (13767620648883758067)) &&
  out_eq64 (ported_cos (f64 (13767620648886777102))) (f64 (4607182418782360300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2035 :
  out_eq64 (ported_sin (f64 (4621267193769286368))) (f64 (4600772803303231989)) &&
  out_eq64 (ported_cos (f64 (4621267193769286368))) (f64 (13829825114640358042)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2036 :
  out_eq64 (ported_sin (f64 (4626690013616671503))) (f64 (4603882543570422092)) &&
  out_eq64 (ported_cos (f64 (4626690013616671503))) (f64 (13828515476465937173)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2037 :
  out_eq64 (ported_sin (f64 (13845078202046179637))) (f64 (4600262729458046780)) &&
  out_eq64 (ported_cos (f64 (13845078202046179637))) (f64 (13829929914520963080)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2038 :
  out_eq64 (ported_sin (f64 (13849017033982376109))) (f64 (4606743422169148994)) &&
  out_eq64 (ported_cos (f64 (13849017033982376109))) (f64 (4599226992888596455)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2039 :
  out_eq64 (ported_sin (f64 (4523777963168987761))) (f64 (4523777963168978900)) &&
  out_eq64 (ported_cos (f64 (4523777963168987761))) (f64 (4607182418799981497)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2040 :
  out_eq64 (ported_sin (f64 (4504705988178498008))) (f64 (4504705988178497987)) &&
  out_eq64 (ported_cos (f64 (4504705988178498008))) (f64 (4607182418800017309)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2041 :
  out_eq64 (ported_sin (f64 (13848738676215129467))) (f64 (4605204779020065069)) &&
  out_eq64 (ported_cos (f64 (13848738676215129467))) (f64 (13827178857593763988)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2042 :
  out_eq64 (ported_sin (f64 (4626335661909986094))) (f64 (4606558585414378414)) &&
  out_eq64 (ported_cos (f64 (4626335661909986094))) (f64 (4600259127828909104)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2043 :
  out_eq64 (ported_sin (f64 (13805083811218203393))) (f64 (13805083365966164317)) &&
  out_eq64 (ported_cos (f64 (13805083811218203393))) (f64 (4607180431659987301)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2044 :
  out_eq64 (ported_sin (f64 (4621433233348133094))) (f64 (4592592404791761024)) &&
  out_eq64 (ported_cos (f64 (4621433233348133094))) (f64 (13830499773439787086)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2045 :
  out_eq64 (ported_sin (f64 (4616113174628367779))) (f64 (13828160171080174250)) &&
  out_eq64 (ported_cos (f64 (4616113174628367779))) (f64 (13827662728405386995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2046 :
  out_eq64 (ported_sin (f64 (4510735713294581073))) (f64 (4510735713294580903)) &&
  out_eq64 (ported_cos (f64 (4510735713294581073))) (f64 (4607182418800016765)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2047 :
  out_eq64 (ported_sin (f64 (13833183906337712322))) (f64 (13830553687631847271)) &&
  out_eq64 (ported_cos (f64 (13833183906337712322))) (f64 (13802053452126808529)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2048 :
  out_eq64 (ported_sin (f64 (13786070128301089369))) (f64 (13786070127288666481)) &&
  out_eq64 (ported_cos (f64 (13786070128301089369))) (f64 (4607182413388379489)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2049 :
  out_eq64 (ported_sin (f64 (13843497684720509509))) (f64 (13829983126741664790)) &&
  out_eq64 (ported_cos (f64 (13843497684720509509))) (f64 (4599985328810184108)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2050 :
  out_eq64 (ported_sin (f64 (4613718683800069412))) (f64 (4597693935388373454)) &&
  out_eq64 (ported_cos (f64 (4613718683800069412))) (f64 (13830298624101653801)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2051 :
  out_eq64 (ported_sin (f64 (13851021655071110606))) (f64 (4600994833331744346)) &&
  out_eq64 (ported_cos (f64 (13851021655071110606))) (f64 (4606404573999816026)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2052 :
  out_eq64 (ported_sin (f64 (4627346164898933467))) (f64 (13830529757438886017)) &&
  out_eq64 (ported_cos (f64 (4627346164898933467))) (f64 (4589996968283694590)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2053 :
  out_eq64 (ported_sin (f64 (4612150279405149180))) (f64 (4605424646145763122)) &&
  out_eq64 (ported_cos (f64 (4612150279405149180))) (f64 (13826892857617760335)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2054 :
  out_eq64 (ported_sin (f64 (13851112357045615501))) (f64 (4591600288000399784)) &&
  out_eq64 (ported_cos (f64 (13851112357045615501))) (f64 (4607140596178133846)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2055 :
  out_eq64 (ported_sin (f64 (4662372931374619359))) (f64 (13818522064824104514)) &&
  out_eq64 (ported_cos (f64 (4662372931374619359))) (f64 (4607057399031347688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2056 :
  out_eq64 (ported_sin (f64 (4620947793076266927))) (f64 (4605618146266714060)) &&
  out_eq64 (ported_cos (f64 (4620947793076266927))) (f64 (13826619975615021270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2057 :
  out_eq64 (ported_sin (f64 (4625313671054722356))) (f64 (13827399198826889238)) &&
  out_eq64 (ported_cos (f64 (4625313671054722356))) (f64 (13828394475415652032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2058 :
  out_eq64 (ported_sin (f64 (13850771623854874388))) (f64 (4606870671687209019)) &&
  out_eq64 (ported_cos (f64 (13850771623854874388))) (f64 (4598370024098887538)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2059 :
  out_eq64 (ported_sin (f64 (4510169016779304770))) (f64 (4510169016779304638)) &&
  out_eq64 (ported_cos (f64 (4510169016779304770))) (f64 (4607182418800016863)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2060 :
  out_eq64 (ported_sin (f64 (4617881963708632392))) (f64 (13827882349188561206)) &&
  out_eq64 (ported_cos (f64 (4617881963708632392))) (f64 (4604578049995599786)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2061 :
  out_eq64 (ported_sin (f64 (13832757275448937984))) (f64 (13830524431862804914)) &&
  out_eq64 (ported_cos (f64 (13832757275448937984))) (f64 (4590542973549351601)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2062 :
  out_eq64 (ported_sin (f64 (13848493757722111681))) (f64 (4594859637105884059)) &&
  out_eq64 (ported_cos (f64 (13848493757722111681))) (f64 (13830441354557893143)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2063 :
  out_eq64 (ported_sin (f64 (13742469442027896151))) (f64 (13742469442027894107)) &&
  out_eq64 (ported_cos (f64 (13742469442027896151))) (f64 (4607182418800008900)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2064 :
  out_eq64 (ported_sin (f64 (13849647503265713462))) (f64 (13829040608683760868)) &&
  out_eq64 (ported_cos (f64 (13849647503265713462))) (f64 (4603173150113706226)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2065 :
  out_eq64 (ported_sin (f64 (4625596168931761224))) (f64 (13830466301056310408)) &&
  out_eq64 (ported_cos (f64 (4625596168931761224))) (f64 (4594196389146184773)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2066 :
  out_eq64 (ported_sin (f64 (13873094586771866540))) (f64 (4606443384457504545)) &&
  out_eq64 (ported_cos (f64 (13873094586771866540))) (f64 (4600817832173025775)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2067 :
  out_eq64 (ported_sin (f64 (13862556367657057059))) (f64 (4595525161308287371)) &&
  out_eq64 (ported_cos (f64 (13862556367657057059))) (f64 (13830413135419903141)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2068 :
  out_eq64 (ported_sin (f64 (4613860284147127044))) (f64 (4595477278858989292)) &&
  out_eq64 (ported_cos (f64 (4613860284147127044))) (f64 (13830415272916409258)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2069 :
  out_eq64 (ported_sin (f64 (4626331391771461728))) (f64 (4606507654492049076)) &&
  out_eq64 (ported_cos (f64 (4626331391771461728))) (f64 (4600512721078511099)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2070 :
  out_eq64 (ported_sin (f64 (13715803159410000547))) (f64 (13715803159410000546)) &&
  out_eq64 (ported_cos (f64 (13715803159410000547))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2071 :
  out_eq64 (ported_sin (f64 (4634894961293023233))) (f64 (13830554129336790189)) &&
  out_eq64 (ported_cos (f64 (4634894961293023233))) (f64 (13799432549973303016)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2072 :
  out_eq64 (ported_sin (f64 (4627337237472109706))) (f64 (13830546377614253524)) &&
  out_eq64 (ported_cos (f64 (4627337237472109706))) (f64 (4586263007643889243)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2073 :
  out_eq64 (ported_sin (f64 (4626774681618521338))) (f64 (4600444578571128633)) &&
  out_eq64 (ported_cos (f64 (4626774681618521338))) (f64 (13829893596686970831)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2074 :
  out_eq64 (ported_sin (f64 (13741017367273035565))) (f64 (13741017367273034609)) &&
  out_eq64 (ported_cos (f64 (13741017367273035565))) (f64 (4607182418800012281)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2075 :
  out_eq64 (ported_sin (f64 (4608305557293565274))) (f64 (4606721170024077106)) &&
  out_eq64 (ported_cos (f64 (4608305557293565274))) (f64 (4599362443699571608)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2076 :
  out_eq64 (ported_sin (f64 (13718821586696680472))) (f64 (13718821586696680471)) &&
  out_eq64 (ported_cos (f64 (13718821586696680472))) (f64 (4607182418800017402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2077 :
  out_eq64 (ported_sin (f64 (13850900717980491758))) (f64 (4604932016910775164)) &&
  out_eq64 (ported_cos (f64 (13850900717980491758))) (f64 (4604131336382293287)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2078 :
  out_eq64 (ported_sin (f64 (13755942368508170245))) (f64 (13755942368508041736)) &&
  out_eq64 (ported_cos (f64 (13755942368508170245))) (f64 (4607182418799479257)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2079 :
  out_eq64 (ported_sin (f64 (4609598388297055042))) (f64 (4607177107485704179)) &&
  out_eq64 (ported_cos (f64 (4609598388297055042))) (f64 (4585109244237431676)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2080 :
  out_eq64 (ported_sin (f64 (13802649748028810478))) (f64 (13802649479105140810)) &&
  out_eq64 (ported_cos (f64 (13802649748028810478))) (f64 (4607181524336801869)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2081 :
  out_eq64 (ported_sin (f64 (13847645462991781334))) (f64 (13830332296689567632)) &&
  out_eq64 (ported_cos (f64 (13847645462991781334))) (f64 (13820492622040938526)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2082 :
  out_eq64 (ported_sin (f64 (13848863393474549321))) (f64 (4606940385777021932)) &&
  out_eq64 (ported_cos (f64 (13848863393474549321))) (f64 (13820836079656828219)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2083 :
  out_eq64 (ported_sin (f64 (13847479632198153222))) (f64 (13830531110116024594)) &&
  out_eq64 (ported_cos (f64 (13847479632198153222))) (f64 (4589849080032441883)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2084 :
  out_eq64 (ported_sin (f64 (13841941087510917753))) (f64 (4595257229048339513)) &&
  out_eq64 (ported_cos (f64 (13841941087510917753))) (f64 (4607052845041916793)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2085 :
  out_eq64 (ported_sin (f64 (13850566827137715648))) (f64 (4606231215922936948)) &&
  out_eq64 (ported_cos (f64 (13850566827137715648))) (f64 (13825101090800392304)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2086 :
  out_eq64 (ported_sin (f64 (13839818846875492707))) (f64 (4606148040116402434)) &&
  out_eq64 (ported_cos (f64 (13839818846875492707))) (f64 (13825425487254202212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2087 :
  out_eq64 (ported_sin (f64 (13851062115997402196))) (f64 (4598561568220940965)) &&
  out_eq64 (ported_cos (f64 (13851062115997402196))) (f64 (4606844229858629253)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2088 :
  out_eq64 (ported_sin (f64 (13849577203568350867))) (f64 (13827572793177125198)) &&
  out_eq64 (ported_cos (f64 (13849577203568350867))) (f64 (4604870183694750834)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2089 :
  out_eq64 (ported_sin (f64 (4621320903651013078))) (f64 (4599163356801175201)) &&
  out_eq64 (ported_cos (f64 (4621320903651013078))) (f64 (13830125708761395827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2090 :
  out_eq64 (ported_sin (f64 (4626476283046771202))) (f64 (4607111890789267623)) &&
  out_eq64 (ported_cos (f64 (4626476283046771202))) (f64 (13817036174816353461)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2091 :
  out_eq64 (ported_sin (f64 (4610171770601683211))) (f64 (4607143517719874405)) &&
  out_eq64 (ported_cos (f64 (4610171770601683211))) (f64 (13814726228891536349)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2092 :
  out_eq64 (ported_sin (f64 (13846050446311391788))) (f64 (4605942891291512073)) &&
  out_eq64 (ported_cos (f64 (13846050446311391788))) (f64 (4602735144331645044)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2093 :
  out_eq64 (ported_sin (f64 (4625232973487285360))) (f64 (13824397263225244346)) &&
  out_eq64 (ported_cos (f64 (4625232973487285360))) (f64 (13829769832422796802)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2094 :
  out_eq64 (ported_sin (f64 (13718515516099158120))) (f64 (13718515516099158119)) &&
  out_eq64 (ported_cos (f64 (13718515516099158120))) (f64 (4607182418800017403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2095 :
  out_eq64 (ported_sin (f64 (4626368768342054581))) (f64 (4606887175916512360)) &&
  out_eq64 (ported_cos (f64 (4626368768342054581))) (f64 (4598246094576394310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2096 :
  out_eq64 (ported_sin (f64 (13768900184017538650))) (f64 (13768900184011252509)) &&
  out_eq64 (ported_cos (f64 (13768900184017538650))) (f64 (4607182418771225957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2097 :
  out_eq64 (ported_sin (f64 (4626308952408193698))) (f64 (4606208790911001167)) &&
  out_eq64 (ported_cos (f64 (4626308952408193698))) (f64 (4601818120891063424)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2098 :
  out_eq64 (ported_sin (f64 (13871516025631883623))) (f64 (13830553143383849879)) &&
  out_eq64 (ported_cos (f64 (13871516025631883623))) (f64 (13803949152861943156)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2099 :
  out_eq64 (ported_sin (f64 (4636487531859076411))) (f64 (4605441974665958125)) &&
  out_eq64 (ported_cos (f64 (4636487531859076411))) (f64 (13826869277485190167)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2100 :
  out_eq64 (ported_sin (f64 (4602683914385648819))) (f64 (4602317124183792675)) &&
  out_eq64 (ported_cos (f64 (4602683914385648819))) (f64 (4606077336502885950)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2101 :
  out_eq64 (ported_sin (f64 (4623501906344865568))) (f64 (4601064236907486258)) &&
  out_eq64 (ported_cos (f64 (4623501906344865568))) (f64 (4606389045811149631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2102 :
  out_eq64 (ported_sin (f64 (13715066659020451364))) (f64 (13715066659020451364)) &&
  out_eq64 (ported_cos (f64 (13715066659020451364))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2103 :
  out_eq64 (ported_sin (f64 (4621380557044005453))) (f64 (4596460600178808686)) &&
  out_eq64 (ported_cos (f64 (4621380557044005453))) (f64 (13830368014917630443)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2104 :
  out_eq64 (ported_sin (f64 (13846381423208619792))) (f64 (4601540151429718593)) &&
  out_eq64 (ported_cos (f64 (13846381423208619792))) (f64 (4606277761823876968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2105 :
  out_eq64 (ported_sin (f64 (4624250085072732429))) (f64 (4607035118537577767)) &&
  out_eq64 (ported_cos (f64 (4624250085072732429))) (f64 (13819029221357533552)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2106 :
  out_eq64 (ported_sin (f64 (4617210422419997628))) (f64 (13830385024420999816)) &&
  out_eq64 (ported_cos (f64 (4617210422419997628))) (f64 (4596123300095141718)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2107 :
  out_eq64 (ported_sin (f64 (4673079721196785388))) (f64 (13821352570256332736)) &&
  out_eq64 (ported_cos (f64 (4673079721196785388))) (f64 (4606908824998144167)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2108 :
  out_eq64 (ported_sin (f64 (13776744149729089592))) (f64 (13776744149677044598)) &&
  out_eq64 (ported_cos (f64 (13776744149729089592))) (f64 (4607182418503101521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2109 :
  out_eq64 (ported_sin (f64 (4625474612543046479))) (f64 (13830173615155734163)) &&
  out_eq64 (ported_cos (f64 (4625474612543046479))) (f64 (13822226541310417925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2110 :
  out_eq64 (ported_sin (f64 (4618198077018173175))) (f64 (13825669394517290672)) &&
  out_eq64 (ported_cos (f64 (4618198077018173175))) (f64 (4606082734989770586)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2111 :
  out_eq64 (ported_sin (f64 (4622322835953595776))) (f64 (13830508743338580548)) &&
  out_eq64 (ported_cos (f64 (4622322835953595776))) (f64 (13815286904191928984)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2112 :
  out_eq64 (ported_sin (f64 (4613896375775669826))) (f64 (4594907949987170969)) &&
  out_eq64 (ported_cos (f64 (4613896375775669826))) (f64 (13830439413835509705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2113 :
  out_eq64 (ported_sin (f64 (13839241243500998449))) (f64 (4604088083456817823)) &&
  out_eq64 (ported_cos (f64 (13839241243500998449))) (f64 (13828341936582238722)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2114 :
  out_eq64 (ported_sin (f64 (13902946485782807368))) (f64 (4600781793557492184)) &&
  out_eq64 (ported_cos (f64 (13902946485782807368))) (f64 (4606451148261640510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2115 :
  out_eq64 (ported_sin (f64 (13907623371141933614))) (f64 (4596709556231723113)) &&
  out_eq64 (ported_cos (f64 (13907623371141933614))) (f64 (13830354921564134733)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2116 :
  out_eq64 (ported_sin (f64 (13827937353582740341))) (f64 (13827414649502040939)) &&
  out_eq64 (ported_cos (f64 (13827937353582740341))) (f64 (4605009203493263266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2117 :
  out_eq64 (ported_sin (f64 (4593948743088275167))) (f64 (4593934726330342704)) &&
  out_eq64 (ported_cos (f64 (4593948743088275167))) (f64 (4607103239791122397)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2118 :
  out_eq64 (ported_sin (f64 (13838509863997617305))) (f64 (4600542445528250590)) &&
  out_eq64 (ported_cos (f64 (13838509863997617305))) (f64 (13829873574750479658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2119 :
  out_eq64 (ported_sin (f64 (4626490233205358856))) (f64 (4607045186070329608)) &&
  out_eq64 (ported_cos (f64 (4626490233205358856))) (f64 (13818805303839949824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2120 :
  out_eq64 (ported_sin (f64 (13844999456095239674))) (f64 (4597546468747378389)) &&
  out_eq64 (ported_cos (f64 (13844999456095239674))) (f64 (13830307521150937798)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2121 :
  out_eq64 (ported_sin (f64 (13782841057987235384))) (f64 (13782841057490369922)) &&
  out_eq64 (ported_cos (f64 (13782841057987235384))) (f64 (4607182416678923062)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2122 :
  out_eq64 (ported_sin (f64 (13787051854256794895))) (f64 (13787051852532579211)) &&
  out_eq64 (ported_cos (f64 (13787051854256794895))) (f64 (4607182411082425485)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2123 :
  out_eq64 (ported_sin (f64 (4627442010388107853))) (f64 (13829791404162223097)) &&
  out_eq64 (ported_cos (f64 (4627442010388107853))) (f64 (4600927973296869673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2124 :
  out_eq64 (ported_sin (f64 (13848077034853399315))) (f64 (13826495539812164007)) &&
  out_eq64 (ported_cos (f64 (13848077034853399315))) (f64 (13829073485846994833)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2125 :
  out_eq64 (ported_sin (f64 (4626805070584678657))) (f64 (4598606446087045173)) &&
  out_eq64 (ported_cos (f64 (4626805070584678657))) (f64 (13830209906749956766)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2126 :
  out_eq64 (ported_sin (f64 (13831891406140228055))) (f64 (13830218615071132642)) &&
  out_eq64 (ported_cos (f64 (13831891406140228055))) (f64 (4598544884619144767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2127 :
  out_eq64 (ported_sin (f64 (4624909134240026850))) (f64 (4596995092201831094)) &&
  out_eq64 (ported_cos (f64 (4624909134240026850))) (f64 (13830339337922397747)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2128 :
  out_eq64 (ported_sin (f64 (13846041698305986718))) (f64 (4606012809908147944)) &&
  out_eq64 (ported_cos (f64 (13846041698305986718))) (f64 (4602548965403675872)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2129 :
  out_eq64 (ported_sin (f64 (13844513981887644019))) (f64 (13826836887121795831)) &&
  out_eq64 (ported_cos (f64 (13844513981887644019))) (f64 (13828837623005525017)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2130 :
  out_eq64 (ported_sin (f64 (4627373179457448213))) (f64 (13830424543648166671)) &&
  out_eq64 (ported_cos (f64 (4627373179457448213))) (f64 (4595265114062582976)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2131 :
  out_eq64 (ported_sin (f64 (4604389745875363807))) (f64 (4603908296532161175)) &&
  out_eq64 (ported_cos (f64 (4604389745875363807))) (f64 (4605122266880444002)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2132 :
  out_eq64 (ported_sin (f64 (4621796044855756246))) (f64 (13826133579849631710)) &&
  out_eq64 (ported_cos (f64 (4621796044855756246))) (f64 (13829299370668459521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2133 :
  out_eq64 (ported_sin (f64 (13844643810170034811))) (f64 (13824009927450911132)) &&
  out_eq64 (ported_cos (f64 (13844643810170034811))) (f64 (13829853724158613440)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2134 :
  out_eq64 (ported_sin (f64 (4623921928913604890))) (f64 (4606464989030153354)) &&
  out_eq64 (ported_cos (f64 (4623921928913604890))) (f64 (4600717004308330568)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2135 :
  out_eq64 (ported_sin (f64 (4627627513532677478))) (f64 (13825635500678459955)) &&
  out_eq64 (ported_cos (f64 (4627627513532677478))) (f64 (4606091954540796480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2136 :
  out_eq64 (ported_sin (f64 (13850056273440590295))) (f64 (13827396385049905463)) &&
  out_eq64 (ported_cos (f64 (13850056273440590295))) (f64 (13828396879196387268)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2137 :
  out_eq64 (ported_sin (f64 (4609433903729758451))) (f64 (4607159811075245248)) &&
  out_eq64 (ported_cos (f64 (4609433903729758451))) (f64 (4589766598734343631)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2138 :
  out_eq64 (ported_sin (f64 (13821690880595877956))) (f64 (13821639506432856181)) &&
  out_eq64 (ported_cos (f64 (13821690880595877956))) (f64 (4606884363010042355)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2139 :
  out_eq64 (ported_sin (f64 (13849208608654452914))) (f64 (4603086425709905989)) &&
  out_eq64 (ported_cos (f64 (13849208608654452914))) (f64 (4605725695849663521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2140 :
  out_eq64 (ported_sin (f64 (4621332453880512708))) (f64 (4598810211773873045)) &&
  out_eq64 (ported_cos (f64 (4621332453880512708))) (f64 (13830180237162746750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2141 :
  out_eq64 (ported_sin (f64 (13880663571660220206))) (f64 (13829399230096438652)) &&
  out_eq64 (ported_cos (f64 (13880663571660220206))) (f64 (4602497977600633794)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2142 :
  out_eq64 (ported_sin (f64 (4620644601259173656))) (f64 (4607134831962851098)) &&
  out_eq64 (ported_cos (f64 (4620644601259173656))) (f64 (13815433683988225919)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2143 :
  out_eq64 (ported_sin (f64 (4615601340396859162))) (f64 (13826611967648192107)) &&
  out_eq64 (ported_cos (f64 (4615601340396859162))) (f64 (13828995634638808096)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2144 :
  out_eq64 (ported_sin (f64 (4626155162117412431))) (f64 (4602922794877091875)) &&
  out_eq64 (ported_cos (f64 (4626155162117412431))) (f64 (4605829640939695723)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2145 :
  out_eq64 (ported_sin (f64 (13841453493733269890))) (f64 (4603282565976199224)) &&
  out_eq64 (ported_cos (f64 (13841453493733269890))) (f64 (4605594427781277528)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2146 :
  out_eq64 (ported_sin (f64 (13848549448355233341))) (f64 (4598260368561723825)) &&
  out_eq64 (ported_cos (f64 (13848549448355233341))) (f64 (13830257335899435196)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2147 :
  out_eq64 (ported_sin (f64 (13847018443723931461))) (f64 (13827207748550174959)) &&
  out_eq64 (ported_cos (f64 (13847018443723931461))) (f64 (4605181535769441978)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2148 :
  out_eq64 (ported_sin (f64 (4620725596463296256))) (f64 (4606996494294889137)) &&
  out_eq64 (ported_cos (f64 (4620725596463296256))) (f64 (13819822639331818114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2149 :
  out_eq64 (ported_sin (f64 (13805655253714252237))) (f64 (13805654670119769954)) &&
  out_eq64 (ported_cos (f64 (13805655253714252237))) (f64 (4607180038874211655)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2150 :
  out_eq64 (ported_sin (f64 (4554950695402208934))) (f64 (4554950695278857509)) &&
  out_eq64 (ported_cos (f64 (4554950695402208934))) (f64 (4607182418272208270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2151 :
  out_eq64 (ported_sin (f64 (4621998240973124229))) (f64 (13828565782690849241)) &&
  out_eq64 (ported_cos (f64 (4621998240973124229))) (f64 (13827192602015689742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2152 :
  out_eq64 (ported_sin (f64 (4627714638007882350))) (f64 (13819261083055120641)) &&
  out_eq64 (ported_cos (f64 (4627714638007882350))) (f64 (4607024308570966354)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2153 :
  out_eq64 (ported_sin (f64 (13848578924948959520))) (f64 (4599471814562607067)) &&
  out_eq64 (ported_cos (f64 (13848578924948959520))) (f64 (13830074804343951555)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2154 :
  out_eq64 (ported_sin (f64 (4561540857499437739))) (f64 (4561540856337559578)) &&
  out_eq64 (ported_cos (f64 (4561540857499437739))) (f64 (4607182415063148771)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2155 :
  out_eq64 (ported_sin (f64 (4620891288464553454))) (f64 (4606088991707327056)) &&
  out_eq64 (ported_cos (f64 (4620891288464553454))) (f64 (13825646411815517486)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2156 :
  out_eq64 (ported_sin (f64 (4553777502298692167))) (f64 (4553777502232107417)) &&
  out_eq64 (ported_cos (f64 (4553777502298692167))) (f64 (4607182418450101269)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2157 :
  out_eq64 (ported_sin (f64 (13845548033378801516))) (f64 (4606599845682796526)) &&
  out_eq64 (ported_cos (f64 (13845548033378801516))) (f64 (13823417137095902214)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2158 :
  out_eq64 (ported_sin (f64 (13764401805711266664))) (f64 (13764401805709690953)) &&
  out_eq64 (ported_cos (f64 (13764401805711266664))) (f64 (4607182418792806799)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2159 :
  out_eq64 (ported_sin (f64 (4616321588218891255))) (f64 (13829005666630798570)) &&
  out_eq64 (ported_cos (f64 (4616321588218891255))) (f64 (13826597182661346038)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2160 :
  out_eq64 (ported_sin (f64 (4623357173924227647))) (f64 (4595113065489536866)) &&
  out_eq64 (ported_cos (f64 (4623357173924227647))) (f64 (4607058949942101336)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2161 :
  out_eq64 (ported_sin (f64 (4627143831335870746))) (f64 (13828746198321683830)) &&
  out_eq64 (ported_cos (f64 (4627143831335870746))) (f64 (13826960654004476059)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2162 :
  out_eq64 (ported_sin (f64 (4620894006677851876))) (f64 (4606068130261541243)) &&
  out_eq64 (ported_cos (f64 (4620894006677851876))) (f64 (13825722734797375029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2163 :
  out_eq64 (ported_sin (f64 (4622085537601906505))) (f64 (13829353484728562404)) &&
  out_eq64 (ported_cos (f64 (4622085537601906505))) (f64 (13826030856046709614)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2164 :
  out_eq64 (ported_sin (f64 (13758678180195643054))) (f64 (13758678180195446322)) &&
  out_eq64 (ported_cos (f64 (13758678180195643054))) (f64 (4607182418798882699)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2165 :
  out_eq64 (ported_sin (f64 (4553285963338234952))) (f64 (4553285963288978476)) &&
  out_eq64 (ported_cos (f64 (4553285963338234952))) (f64 (4607182418513804192)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2166 :
  out_eq64 (ported_sin (f64 (4574167834256200454))) (f64 (4574167780981287672)) &&
  out_eq64 (ported_cos (f64 (4574167834256200454))) (f64 (4607182227311961550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2167 :
  out_eq64 (ported_sin (f64 (4564175902531012978))) (f64 (4564175900345853696)) &&
  out_eq64 (ported_cos (f64 (4564175902531012978))) (f64 (4607182409761938196)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2168 :
  out_eq64 (ported_sin (f64 (13844371301791788254))) (f64 (13828495928906353640)) &&
  out_eq64 (ported_cos (f64 (13844371301791788254))) (f64 (13827278363519516794)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2169 :
  out_eq64 (ported_sin (f64 (4563691202269202277))) (f64 (4563691200535213348)) &&
  out_eq64 (ported_cos (f64 (4563691202269202277))) (f64 (4607182411053289598)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2170 :
  out_eq64 (ported_sin (f64 (13759863652783055670))) (f64 (13759863652782668617)) &&
  out_eq64 (ported_cos (f64 (13759863652783055670))) (f64 (4607182418798235791)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2171 :
  out_eq64 (ported_sin (f64 (13840459713924807382))) (f64 (4607149710223051922)) &&
  out_eq64 (ported_cos (f64 (13840459713924807382))) (f64 (4590799724347917828)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2172 :
  out_eq64 (ported_sin (f64 (4624095876104110990))) (f64 (4607143636149018093)) &&
  out_eq64 (ported_cos (f64 (4624095876104110990))) (f64 (4591344023220621915)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2173 :
  out_eq64 (ported_sin (f64 (4621467516787149870))) (f64 (4587269508085619736)) &&
  out_eq64 (ported_cos (f64 (4621467516787149870))) (f64 (13830543491290134139)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2174 :
  out_eq64 (ported_sin (f64 (4658560039450550154))) (f64 (13817752017375434506)) &&
  out_eq64 (ported_cos (f64 (4658560039450550154))) (f64 (4607087674612460907)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2175 :
  out_eq64 (ported_sin (f64 (4585857987331179962))) (f64 (4585856503542691332)) &&
  out_eq64 (ported_cos (f64 (4585857987331179962))) (f64 (4607175381573965456)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2176 :
  out_eq64 (ported_sin (f64 (13850989504055306041))) (f64 (4602750907571509298)) &&
  out_eq64 (ported_cos (f64 (13850989504055306041))) (f64 (4605933616125833233)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2177 :
  out_eq64 (ported_sin (f64 (13826989115688858386))) (f64 (13826664042286146838)) &&
  out_eq64 (ported_cos (f64 (13826989115688858386))) (f64 (4605587920848476865)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2178 :
  out_eq64 (ported_sin (f64 (13751960465750241232))) (f64 (13751960465750200665)) &&
  out_eq64 (ported_cos (f64 (13751960465750241232))) (f64 (4607182418799860236)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2179 :
  out_eq64 (ported_sin (f64 (13840801168382644767))) (f64 (4606511118306014621)) &&
  out_eq64 (ported_cos (f64 (13840801168382644767))) (f64 (4600495821047805285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2180 :
  out_eq64 (ported_sin (f64 (13848848656119125658))) (f64 (4606819834104878102)) &&
  out_eq64 (ported_cos (f64 (13848848656119125658))) (f64 (13822103410731335933)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2181 :
  out_eq64 (ported_sin (f64 (4626320411980373295))) (f64 (4606367920675493133)) &&
  out_eq64 (ported_cos (f64 (4626320411980373295))) (f64 (4601157416229736054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2182 :
  out_eq64 (ported_sin (f64 (13849546498968860155))) (f64 (13826808108104500548)) &&
  out_eq64 (ported_cos (f64 (13849546498968860155))) (f64 (4605486380722436297)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2183 :
  out_eq64 (ported_sin (f64 (4621447818505243974))) (f64 (4590734385443223904)) &&
  out_eq64 (ported_cos (f64 (4621447818505243974))) (f64 (13830522441274631124)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2184 :
  out_eq64 (ported_sin (f64 (13848118454015657258))) (f64 (13825806960146348318)) &&
  out_eq64 (ported_cos (f64 (13848118454015657258))) (f64 (13829416866740461565)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2185 :
  out_eq64 (ported_sin (f64 (13919496151021950898))) (f64 (4606228768287016978)) &&
  out_eq64 (ported_cos (f64 (13919496151021950898))) (f64 (4601738835318281862)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2186 :
  out_eq64 (ported_sin (f64 (4622104016586650541))) (f64 (13829496756644695158)) &&
  out_eq64 (ported_cos (f64 (4622104016586650541))) (f64 (13825513623543579618)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2187 :
  out_eq64 (ported_sin (f64 (13845942423966100642))) (f64 (4606669952550403435)) &&
  out_eq64 (ported_cos (f64 (13845942423966100642))) (f64 (4599661327619025352)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2188 :
  out_eq64 (ported_sin (f64 (13850334864969226094))) (f64 (4598701608281442630)) &&
  out_eq64 (ported_cos (f64 (13850334864969226094))) (f64 (13830196212561363137)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2189 :
  out_eq64 (ported_sin (f64 (4622091850006528226))) (f64 (13829403380032909599)) &&
  out_eq64 (ported_cos (f64 (4622091850006528226))) (f64 (13825855230952104272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2190 :
  out_eq64 (ported_sin (f64 (4625401843811593836))) (f64 (13829224423349894020)) &&
  out_eq64 (ported_cos (f64 (4625401843811593836))) (f64 (13826257961871514380)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2191 :
  out_eq64 (ported_sin (f64 (13847882299400938453))) (f64 (13828754281835004084)) &&
  out_eq64 (ported_cos (f64 (13847882299400938453))) (f64 (13826949887499300407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2192 :
  out_eq64 (ported_sin (f64 (4573117336561088362))) (f64 (4573117302643847894)) &&
  out_eq64 (ported_cos (f64 (4573117336561088362))) (f64 (4607182277087861457)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2193 :
  out_eq64 (ported_sin (f64 (13846207646164797897))) (f64 (4604385162181409907)) &&
  out_eq64 (ported_cos (f64 (13846207646164797897))) (f64 (4604699501181635940)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2194 :
  out_eq64 (ported_sin (f64 (4634406458808552660))) (f64 (13828622009765831349)) &&
  out_eq64 (ported_cos (f64 (4634406458808552660))) (f64 (13827121976413470263)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2195 :
  out_eq64 (ported_sin (f64 (4622354857329930056))) (f64 (13830545773976134864)) &&
  out_eq64 (ported_cos (f64 (4622354857329930056))) (f64 (13809858826667749864)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2196 :
  out_eq64 (ported_sin (f64 (13845493863474945599))) (f64 (4606254701515159769)) &&
  out_eq64 (ported_cos (f64 (13845493863474945599))) (f64 (13825006472735125290)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2197 :
  out_eq64 (ported_sin (f64 (13755371032830522690))) (f64 (13755371032830425383)) &&
  out_eq64 (ported_cos (f64 (13755371032830522690))) (f64 (4607182418799570336)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2198 :
  out_eq64 (ported_sin (f64 (4624461076800893724))) (f64 (4605826189389094169)) &&
  out_eq64 (ported_cos (f64 (4624461076800893724))) (f64 (13826300392087532441)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2199 :
  out_eq64 (ported_sin (f64 (4618102558407920566))) (f64 (13826514663765188810)) &&
  out_eq64 (ported_cos (f64 (4618102558407920566))) (f64 (4605688840675157366)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2200 :
  out_eq64 (ported_sin (f64 (4627133931862406171))) (f64 (13828551396573915867)) &&
  out_eq64 (ported_cos (f64 (4627133931862406171))) (f64 (13827210440914040450)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2201 :
  out_eq64 (ported_sin (f64 (13844409678966894988))) (f64 (13828089392713726319)) &&
  out_eq64 (ported_cos (f64 (13844409678966894988))) (f64 (13827738386415478600)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2202 :
  out_eq64 (ported_sin (f64 (4622606533756331680))) (f64 (13829832318729643269)) &&
  out_eq64 (ported_cos (f64 (4622606533756331680))) (f64 (4600739117525800270)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2203 :
  out_eq64 (ported_sin (f64 (13848651949760329361))) (f64 (4603165884923774435)) &&
  out_eq64 (ported_cos (f64 (13848651949760329361))) (f64 (13829045449348654434)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2204 :
  out_eq64 (ported_sin (f64 (13843112386449763021))) (f64 (13828434609963602610)) &&
  out_eq64 (ported_cos (f64 (13843112386449763021))) (f64 (4603979872791186673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2205 :
  out_eq64 (ported_sin (f64 (4621224786654989760))) (f64 (4601998630235807168)) &&
  out_eq64 (ported_cos (f64 (4621224786654989760))) (f64 (13829534425060221998)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2206 :
  out_eq64 (ported_sin (f64 (4674885284140101732))) (f64 (13825959155492394263)) &&
  out_eq64 (ported_cos (f64 (4674885284140101732))) (f64 (13829374012372951067)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2207 :
  out_eq64 (ported_sin (f64 (13849267553571079278))) (f64 (4600140146366710485)) &&
  out_eq64 (ported_cos (f64 (13849267553571079278))) (f64 (4606581715831475895)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2208 :
  out_eq64 (ported_sin (f64 (13849638938251950277))) (f64 (13828885081035897138)) &&
  out_eq64 (ported_cos (f64 (13849638938251950277))) (f64 (4603398816775939796)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2209 :
  out_eq64 (ported_sin (f64 (13843234772133461996))) (f64 (13829023686210488436)) &&
  out_eq64 (ported_cos (f64 (13843234772133461996))) (f64 (4603198429246675256)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2210 :
  out_eq64 (ported_sin (f64 (13842364216216637358))) (f64 (13819909225650765416)) &&
  out_eq64 (ported_cos (f64 (13842364216216637358))) (f64 (4606991998896930032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2211 :
  out_eq64 (ported_sin (f64 (13846407280835258283))) (f64 (4600787776176034387)) &&
  out_eq64 (ported_cos (f64 (13846407280835258283))) (f64 (4606449862645862776)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2212 :
  out_eq64 (ported_sin (f64 (4690313780649483061))) (f64 (4607013269294725270)) &&
  out_eq64 (ported_cos (f64 (4690313780649483061))) (f64 (13819489606818058359)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2213 :
  out_eq64 (ported_sin (f64 (13835731118844185183))) (f64 (13828270567584453679)) &&
  out_eq64 (ported_cos (f64 (13835731118844185183))) (f64 (13827541147050732214)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2214 :
  out_eq64 (ported_sin (f64 (4620822461268381236))) (f64 (4606554502525519781)) &&
  out_eq64 (ported_cos (f64 (4620822461268381236))) (f64 (13823651910748312677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2215 :
  out_eq64 (ported_sin (f64 (4620880152388909880))) (f64 (4606172526145250004)) &&
  out_eq64 (ported_cos (f64 (4620880152388909880))) (f64 (13825331654253527285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2216 :
  out_eq64 (ported_sin (f64 (13840576080946554432))) (f64 (4607022696274978280)) &&
  out_eq64 (ported_cos (f64 (13840576080946554432))) (f64 (4595922922429859957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2217 :
  out_eq64 (ported_sin (f64 (4620376705227210127))) (f64 (4607100342589856121)) &&
  out_eq64 (ported_cos (f64 (4620376705227210127))) (f64 (4594020758987344017)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2218 :
  out_eq64 (ported_sin (f64 (4614722717865196512))) (f64 (13819943912037925761)) &&
  out_eq64 (ported_cos (f64 (4614722717865196512))) (f64 (13830362219344397250)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2219 :
  out_eq64 (ported_sin (f64 (4626351743385528457))) (f64 (4606732986071872407)) &&
  out_eq64 (ported_cos (f64 (4626351743385528457))) (f64 (4599290968809327369)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2220 :
  out_eq64 (ported_sin (f64 (13912689662636778908))) (f64 (4604917287715523899)) &&
  out_eq64 (ported_cos (f64 (13912689662636778908))) (f64 (4604148004088715300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2221 :
  out_eq64 (ported_sin (f64 (13846185365821858381))) (f64 (4604638448737537913)) &&
  out_eq64 (ported_cos (f64 (13846185365821858381))) (f64 (4604448680059450828)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2222 :
  out_eq64 (ported_sin (f64 (4624528324813015422))) (f64 (4605205221817234556)) &&
  out_eq64 (ported_cos (f64 (4624528324813015422))) (f64 (13827178304834479873)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2223 :
  out_eq64 (ported_sin (f64 (13777515596971246219))) (f64 (13777515596889404250)) &&
  out_eq64 (ported_cos (f64 (13777515596971246219))) (f64 (4607182418398505739)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2224 :
  out_eq64 (ported_sin (f64 (4625593928339540386))) (f64 (13830476025060296100)) &&
  out_eq64 (ported_cos (f64 (4625593928339540386))) (f64 (4593912243938642172)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2225 :
  out_eq64 (ported_sin (f64 (13843960602088522025))) (f64 (13830541775384121152)) &&
  out_eq64 (ported_cos (f64 (13843960602088522025))) (f64 (13811177219532758949)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2226 :
  out_eq64 (ported_sin (f64 (13748912935622891914))) (f64 (13748912935622874002)) &&
  out_eq64 (ported_cos (f64 (13748912935622891914))) (f64 (4607182418799959996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2227 :
  out_eq64 (ported_sin (f64 (13823281699600971645))) (f64 (13823157777125447060)) &&
  out_eq64 (ported_cos (f64 (13823281699600971645))) (f64 (4606647764705532681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2228 :
  out_eq64 (ported_sin (f64 (13758075319421305726))) (f64 (13758075319421003014)) &&
  out_eq64 (ported_cos (f64 (13758075319421305726))) (f64 (4607182418799064683)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2229 :
  out_eq64 (ported_sin (f64 (13847740662188838479))) (f64 (13829872371063702531)) &&
  out_eq64 (ported_cos (f64 (13847740662188838479))) (f64 (13823920314173390684)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2230 :
  out_eq64 (ported_sin (f64 (4608352531100362662))) (f64 (4606750383073791455)) &&
  out_eq64 (ported_cos (f64 (4608352531100362662))) (f64 (4599183864061204432)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2231 :
  out_eq64 (ported_sin (f64 (4491254972869155612))) (f64 (4491254972869155612)) &&
  out_eq64 (ported_cos (f64 (4491254972869155612))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2232 :
  out_eq64 (ported_sin (f64 (4607264475862388980))) (f64 (4605841924652434397)) &&
  out_eq64 (ported_cos (f64 (4607264475862388980))) (f64 (4602902932651471039)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2233 :
  out_eq64 (ported_sin (f64 (4585827599066720973))) (f64 (4585826138893853621)) &&
  out_eq64 (ported_cos (f64 (4585827599066720973))) (f64 (4607175456436192309)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2234 :
  out_eq64 (ported_sin (f64 (13849437993160639974))) (f64 (13821042803241783488)) &&
  out_eq64 (ported_cos (f64 (13849437993160639974))) (f64 (4606927995974261081)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2235 :
  out_eq64 (ported_sin (f64 (13848285598604137945))) (f64 (13820090296700705166)) &&
  out_eq64 (ported_cos (f64 (13848285598604137945))) (f64 (13830354455505364706)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2236 :
  out_eq64 (ported_sin (f64 (13782499424570939694))) (f64 (13782499424150261073)) &&
  out_eq64 (ported_cos (f64 (13782499424570939694))) (f64 (4607182416901704757)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2237 :
  out_eq64 (ported_sin (f64 (13846323485426237081))) (f64 (4602921095039198600)) &&
  out_eq64 (ported_cos (f64 (13846323485426237081))) (f64 (4605830694985168804)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2238 :
  out_eq64 (ported_sin (f64 (4624382980657900381))) (f64 (4606409959124113482)) &&
  out_eq64 (ported_cos (f64 (4624382980657900381))) (f64 (13824342616283006751)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2239 :
  out_eq64 (ported_sin (f64 (13738232924237197495))) (f64 (13738232924237196918)) &&
  out_eq64 (ported_cos (f64 (13738232924237197495))) (f64 (4607182418800015102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2240 :
  out_eq64 (ported_sin (f64 (13814273855765104361))) (f64 (13814266069360805151)) &&
  out_eq64 (ported_cos (f64 (13814273855765104361))) (f64 (4607148695038032545)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2241 :
  out_eq64 (ported_sin (f64 (4617028970376495371))) (f64 (13830549520235653089)) &&
  out_eq64 (ported_cos (f64 (4617028970376495371))) (f64 (4584930974880578452)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2242 :
  out_eq64 (ported_sin (f64 (13841503921667026788))) (f64 (4602945256178427719)) &&
  out_eq64 (ported_cos (f64 (13841503921667026788))) (f64 (4605815663834256034)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2243 :
  out_eq64 (ported_sin (f64 (13849766728188142669))) (f64 (13830432642084346004)) &&
  out_eq64 (ported_cos (f64 (13849766728188142669))) (f64 (4595073353007263714)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2244 :
  out_eq64 (ported_sin (f64 (13850593225127473430))) (f64 (4606573091075154497)) &&
  out_eq64 (ported_cos (f64 (13850593225127473430))) (f64 (13823556840996168689)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2245 :
  out_eq64 (ported_sin (f64 (4504897642269504162))) (f64 (4504897642269504139)) &&
  out_eq64 (ported_cos (f64 (4504897642269504162))) (f64 (4607182418800017302)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2246 :
  out_eq64 (ported_sin (f64 (4618005732285026548))) (f64 (13827141672852392928)) &&
  out_eq64 (ported_cos (f64 (4618005732285026548))) (f64 (4605234408094421873)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2247 :
  out_eq64 (ported_sin (f64 (13835476007610417958))) (f64 (13828905075525452454)) &&
  out_eq64 (ported_cos (f64 (13835476007610417958))) (f64 (13826742652066649839)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2248 :
  out_eq64 (ported_sin (f64 (13835620032858081632))) (f64 (13828557959353297894)) &&
  out_eq64 (ported_cos (f64 (13835620032858081632))) (f64 (13827202314535558801)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2249 :
  out_eq64 (ported_sin (f64 (13849007962423676128))) (f64 (4606828478309429296)) &&
  out_eq64 (ported_cos (f64 (13849007962423676128))) (f64 (4598671920378965455)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2250 :
  out_eq64 (ported_sin (f64 (4680066858518744072))) (f64 (4605094152394814307)) &&
  out_eq64 (ported_cos (f64 (4680066858518744072))) (f64 (13827314231919177666)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2251 :
  out_eq64 (ported_sin (f64 (13838586352381581966))) (f64 (4601104024554806965)) &&
  out_eq64 (ported_cos (f64 (13838586352381581966))) (f64 (13829752101233621573)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2252 :
  out_eq64 (ported_sin (f64 (4519091384120241511))) (f64 (4519091384120239473)) &&
  out_eq64 (ported_cos (f64 (4519091384120241511))) (f64 (4607182418800008916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2253 :
  out_eq64 (ported_sin (f64 (13850120148300047142))) (f64 (13825359848941429626)) &&
  out_eq64 (ported_cos (f64 (13850120148300047142))) (f64 (13829537242342951042)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2254 :
  out_eq64 (ported_sin (f64 (4553247752363751573))) (f64 (4553247752315699341)) &&
  out_eq64 (ported_cos (f64 (4553247752363751573))) (f64 (4607182418518488389)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2255 :
  out_eq64 (ported_sin (f64 (4612626126487501049))) (f64 (4604142147948675454)) &&
  out_eq64 (ported_cos (f64 (4612626126487501049))) (f64 (13828294507977051298)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2256 :
  out_eq64 (ported_sin (f64 (13848978849223996367))) (f64 (4607040365395943414)) &&
  out_eq64 (ported_cos (f64 (13848978849223996367))) (f64 (4595541499668091639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2257 :
  out_eq64 (ported_sin (f64 (4622451905417124751))) (f64 (13830480213331096494)) &&
  out_eq64 (ported_cos (f64 (4622451905417124751))) (f64 (4593784371893634687)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2258 :
  out_eq64 (ported_sin (f64 (4621390621740082773))) (f64 (4595828660880512443)) &&
  out_eq64 (ported_cos (f64 (4621390621740082773))) (f64 (13830399198565351520)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2259 :
  out_eq64 (ported_sin (f64 (13727284956259759664))) (f64 (13727284956259759651)) &&
  out_eq64 (ported_cos (f64 (13727284956259759664))) (f64 (4607182418800017335)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2260 :
  out_eq64 (ported_sin (f64 (13790237218317084393))) (f64 (13790237215023471441)) &&
  out_eq64 (ported_cos (f64 (13790237218317084393))) (f64 (4607182399939407410)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2261 :
  out_eq64 (ported_sin (f64 (13828283511667295903))) (f64 (13827672891095200180)) &&
  out_eq64 (ported_cos (f64 (13828283511667295903))) (f64 (4604778721494712510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2262 :
  out_eq64 (ported_sin (f64 (13839755257531437063))) (f64 (4605898755922620235)) &&
  out_eq64 (ported_cos (f64 (13839755257531437063))) (f64 (13826181544289518458)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2263 :
  out_eq64 (ported_sin (f64 (13845759477492538859))) (f64 (4607181539856657433)) &&
  out_eq64 (ported_cos (f64 (13845759477492538859))) (f64 (4579206659005435471)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2264 :
  out_eq64 (ported_sin (f64 (4612442773249354894))) (f64 (4604671167707173297)) &&
  out_eq64 (ported_cos (f64 (4612442773249354894))) (f64 (13827786831376968137)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2265 :
  out_eq64 (ported_sin (f64 (4621390814710087457))) (f64 (4595816523287464255)) &&
  out_eq64 (ported_cos (f64 (4621390814710087457))) (f64 (13830399768834855462)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2266 :
  out_eq64 (ported_sin (f64 (13846609287813910730))) (f64 (4586969127005466609)) &&
  out_eq64 (ported_cos (f64 (13846609287813910730))) (f64 (4607172361974430189)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2267 :
  out_eq64 (ported_sin (f64 (13851002375761667446))) (f64 (4602104101310825091)) &&
  out_eq64 (ported_cos (f64 (13851002375761667446))) (f64 (4606134676361173131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2268 :
  out_eq64 (ported_sin (f64 (4623656482946457054))) (f64 (4603960202329628640)) &&
  out_eq64 (ported_cos (f64 (4623656482946457054))) (f64 (4605079103423163925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2269 :
  out_eq64 (ported_sin (f64 (13839003833352411464))) (f64 (4603340205477847972)) &&
  out_eq64 (ported_cos (f64 (13839003833352411464))) (f64 (13828926454102441327)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2270 :
  out_eq64 (ported_sin (f64 (4652565950451065680))) (f64 (13822733885741860886)) &&
  out_eq64 (ported_cos (f64 (4652565950451065680))) (f64 (13830093305895824247)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2271 :
  out_eq64 (ported_sin (f64 (4676193602830865420))) (f64 (13827774217054783300)) &&
  out_eq64 (ported_cos (f64 (4676193602830865420))) (f64 (13828055297535373805)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2272 :
  out_eq64 (ported_sin (f64 (13766348781829910191))) (f64 (13766348781826205458)) &&
  out_eq64 (ported_cos (f64 (13766348781829910191))) (f64 (4607182418787267939)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2273 :
  out_eq64 (ported_sin (f64 (4491189301358753826))) (f64 (4491189301358753826)) &&
  out_eq64 (ported_cos (f64 (4491189301358753826))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2274 :
  out_eq64 (ported_sin (f64 (4624684454533567576))) (f64 (4603394798656441651)) &&
  out_eq64 (ported_cos (f64 (4624684454533567576))) (f64 (13828887939768574137)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2275 :
  out_eq64 (ported_sin (f64 (4604168088164358158))) (f64 (4603735618361347286)) &&
  out_eq64 (ported_cos (f64 (4604168088164358158))) (f64 (4605261234181222658)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2276 :
  out_eq64 (ported_sin (f64 (13848694012869531041))) (f64 (4604226613821368562)) &&
  out_eq64 (ported_cos (f64 (13848694012869531041))) (f64 (13828218857836730369)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2277 :
  out_eq64 (ported_sin (f64 (4623119766653327840))) (f64 (13821604329721202520)) &&
  out_eq64 (ported_cos (f64 (4623119766653327840))) (f64 (4606888984746311176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2278 :
  out_eq64 (ported_sin (f64 (4571493079300845258))) (f64 (4571493065057642137)) &&
  out_eq64 (ported_cos (f64 (4571493079300845258))) (f64 (4607182339330816954)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2279 :
  out_eq64 (ported_sin (f64 (4625819048715892942))) (f64 (13826918696205258333)) &&
  out_eq64 (ported_cos (f64 (4625819048715892942))) (f64 (4605405521947918648)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2280 :
  out_eq64 (ported_sin (f64 (4577195878751210737))) (f64 (4577195768113176793)) &&
  out_eq64 (ported_cos (f64 (4577195878751210737))) (f64 (4607181924017104835)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2281 :
  out_eq64 (ported_sin (f64 (13862523570197289977))) (f64 (13827718378411778479)) &&
  out_eq64 (ported_cos (f64 (13862523570197289977))) (f64 (13828108269395847491)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2282 :
  out_eq64 (ported_sin (f64 (13827216763965537304))) (f64 (13826849737064129299)) &&
  out_eq64 (ported_cos (f64 (13827216763965537304))) (f64 (4605456245381083856)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2283 :
  out_eq64 (ported_sin (f64 (13840719025799338382))) (f64 (4606737659898170252)) &&
  out_eq64 (ported_cos (f64 (13840719025799338382))) (f64 (4599262417219809096)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2284 :
  out_eq64 (ported_sin (f64 (13850485519782101795))) (f64 (4604749820170858688)) &&
  out_eq64 (ported_cos (f64 (13850485519782101795))) (f64 (13827703900374548384)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2285 :
  out_eq64 (ported_sin (f64 (13839170994109938880))) (f64 (4603873267103084084)) &&
  out_eq64 (ported_cos (f64 (13839170994109938880))) (f64 (13828523064055339800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2286 :
  out_eq64 (ported_sin (f64 (13842806073378217067))) (f64 (13826621479374422878)) &&
  out_eq64 (ported_cos (f64 (13842806073378217067))) (f64 (4605617121158505102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2287 :
  out_eq64 (ported_sin (f64 (13848940659319064302))) (f64 (4607174415878844692)) &&
  out_eq64 (ported_cos (f64 (13848940659319064302))) (f64 (4586234581297072524)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2288 :
  out_eq64 (ported_sin (f64 (13833195436523245576))) (f64 (13830553356977863707)) &&
  out_eq64 (ported_cos (f64 (13833195436523245576))) (f64 (13803529163748210075)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2289 :
  out_eq64 (ported_sin (f64 (13849266376688481695))) (f64 (4600210386876718404)) &&
  out_eq64 (ported_cos (f64 (13849266376688481695))) (f64 (4606568119525568819)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2290 :
  out_eq64 (ported_sin (f64 (13845523373060277378))) (f64 (4606452211680728564)) &&
  out_eq64 (ported_cos (f64 (13845523373060277378))) (f64 (13824148877277147433)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2291 :
  out_eq64 (ported_sin (f64 (13730120339584054068))) (f64 (13730120339584054016)) &&
  out_eq64 (ported_cos (f64 (13730120339584054068))) (f64 (4607182418800017223)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2292 :
  out_eq64 (ported_sin (f64 (4622941370601706602))) (f64 (13826429412966229389)) &&
  out_eq64 (ported_cos (f64 (4622941370601706602))) (f64 (4605744511829099249)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2293 :
  out_eq64 (ported_sin (f64 (13838024960505230126))) (f64 (4595475619983718374)) &&
  out_eq64 (ported_cos (f64 (13838024960505230126))) (f64 (13830415346670596192)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2294 :
  out_eq64 (ported_sin (f64 (13790342120895524890))) (f64 (13790342117377331905)) &&
  out_eq64 (ported_cos (f64 (13790342120895524890))) (f64 (4607182399091507274)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2295 :
  out_eq64 (ported_sin (f64 (13835132863809624157))) (f64 (13829608457810173471)) &&
  out_eq64 (ported_cos (f64 (13835132863809624157))) (f64 (13825080240683788712)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2296 :
  out_eq64 (ported_sin (f64 (4622000849814834908))) (f64 (13828591869083527715)) &&
  out_eq64 (ported_cos (f64 (4622000849814834908))) (f64 (13827160016020276746)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2297 :
  out_eq64 (ported_sin (f64 (13778521060603339374))) (f64 (13778521060467997380)) &&
  out_eq64 (ported_cos (f64 (13778521060603339374))) (f64 (4607182418238535407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2298 :
  out_eq64 (ported_sin (f64 (13850447762294959182))) (f64 (4603867370102722825)) &&
  out_eq64 (ported_cos (f64 (13850447762294959182))) (f64 (13828527876748271228)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2299 :
  out_eq64 (ported_sin (f64 (4617706202687861266))) (f64 (13828800787360463223)) &&
  out_eq64 (ported_cos (f64 (4617706202687861266))) (f64 (4603515250165129244)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2300 :
  out_eq64 (ported_sin (f64 (13849120166715539992))) (f64 (4605179560672714118)) &&
  out_eq64 (ported_cos (f64 (13849120166715539992))) (f64 (4603838155513931847)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2301 :
  out_eq64 (ported_sin (f64 (13794982988145742846))) (f64 (13794982972837056025)) &&
  out_eq64 (ported_cos (f64 (13794982988145742846))) (f64 (4607182335415451566)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2302 :
  out_eq64 (ported_sin (f64 (13798701517049679043))) (f64 (13798701435066290756)) &&
  out_eq64 (ported_cos (f64 (13798701517049679043))) (f64 (4607182163563118276)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2303 :
  out_eq64 (ported_sin (f64 (4613500736950776755))) (f64 (4599606033913956354)) &&
  out_eq64 (ported_cos (f64 (4613500736950776755))) (f64 (13830051685895643146)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2304 :
  out_eq64 (ported_sin (f64 (4604052628996367944))) (f64 (4603644331645560812)) &&
  out_eq64 (ported_cos (f64 (4604052628996367944))) (f64 (4605331926277365519)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2305 :
  out_eq64 (ported_sin (f64 (4611607484702054448))) (f64 (4606429557236365752)) &&
  out_eq64 (ported_cos (f64 (4611607484702054448))) (f64 (13824253524370930299)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2306 :
  out_eq64 (ported_sin (f64 (4614695439731380705))) (f64 (13819516244047756827)) &&
  out_eq64 (ported_cos (f64 (4614695439731380705))) (f64 (13830383994453966170)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2307 :
  out_eq64 (ported_sin (f64 (13850875138547234073))) (f64 (4605444661294735967)) &&
  out_eq64 (ported_cos (f64 (13850875138547234073))) (f64 (4603493570329666361)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2308 :
  out_eq64 (ported_sin (f64 (13841565237931276660))) (f64 (4602365766812462853)) &&
  out_eq64 (ported_cos (f64 (13841565237931276660))) (f64 (4606063983127649334)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2309 :
  out_eq64 (ported_sin (f64 (13780283444872848808))) (f64 (13780283444595237725)) &&
  out_eq64 (ported_cos (f64 (13780283444872848808))) (f64 (4607182417893578257)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2310 :
  out_eq64 (ported_sin (f64 (4624598166394794358))) (f64 (4604454371864285662)) &&
  out_eq64 (ported_cos (f64 (4624598166394794358))) (f64 (13828004956034541854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2311 :
  out_eq64 (ported_sin (f64 (4622403316454958047))) (f64 (13830546447532469300)) &&
  out_eq64 (ported_cos (f64 (4622403316454958047))) (f64 (4586236553787416244)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2312 :
  out_eq64 (ported_sin (f64 (4618202604131163269))) (f64 (13825605734554758261)) &&
  out_eq64 (ported_cos (f64 (4618202604131163269))) (f64 (4606100012566423690)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2313 :
  out_eq64 (ported_sin (f64 (4623358990318472817))) (f64 (4595227690055364017)) &&
  out_eq64 (ported_cos (f64 (4623358990318472817))) (f64 (4607054108189748373)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2314 :
  out_eq64 (ported_sin (f64 (13839785474093598662))) (f64 (4606020333295550689)) &&
  out_eq64 (ported_cos (f64 (13839785474093598662))) (f64 (13825894380734000197)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2315 :
  out_eq64 (ported_sin (f64 (4494939813203456726))) (f64 (4494939813203456725)) &&
  out_eq64 (ported_cos (f64 (4494939813203456726))) (f64 (4607182418800017403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2316 :
  out_eq64 (ported_sin (f64 (4614895907398474537))) (f64 (13822089249864539467)) &&
  out_eq64 (ported_cos (f64 (4614895907398474537))) (f64 (13830193939926263649)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2317 :
  out_eq64 (ported_sin (f64 (4536474124100634448))) (f64 (4536474124100250845)) &&
  out_eq64 (ported_cos (f64 (4536474124100634448))) (f64 (4607182418798246392)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2318 :
  out_eq64 (ported_sin (f64 (4614673478605746084))) (f64 (13819171189561617453)) &&
  out_eq64 (ported_cos (f64 (4614673478605746084))) (f64 (13830400583096523160)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2319 :
  out_eq64 (ported_sin (f64 (4663404737712550715))) (f64 (4606121787435229526)) &&
  out_eq64 (ported_cos (f64 (4663404737712550715))) (f64 (13825524623034841451)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2320 :
  out_eq64 (ported_sin (f64 (4625871717311267281))) (f64 (13824908961700793416)) &&
  out_eq64 (ported_cos (f64 (4625871717311267281))) (f64 (4606278544974479058)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2321 :
  out_eq64 (ported_sin (f64 (13822482831442594140))) (f64 (13822400563922633983)) &&
  out_eq64 (ported_cos (f64 (13822482831442594140))) (f64 (4606774959358858236)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2322 :
  out_eq64 (ported_sin (f64 (4620056055487923721))) (f64 (4606399977898725437)) &&
  out_eq64 (ported_cos (f64 (4620056055487923721))) (f64 (4601015457727110920)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2323 :
  out_eq64 (ported_sin (f64 (13850962134493788662))) (f64 (4603482502210394191)) &&
  out_eq64 (ported_cos (f64 (13850962134493788662))) (f64 (4605452745850769722)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2324 :
  out_eq64 (ported_sin (f64 (13850741138240898217))) (f64 (4607073658336663319)) &&
  out_eq64 (ported_cos (f64 (13850741138240898217))) (f64 (4594750027801168097)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2325 :
  out_eq64 (ported_sin (f64 (4608139229207825585))) (f64 (4606610278798256575)) &&
  out_eq64 (ported_cos (f64 (4608139229207825585))) (f64 (4599989661960602529)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2326 :
  out_eq64 (ported_sin (f64 (13871404204190436050))) (f64 (13830479400250095314)) &&
  out_eq64 (ported_cos (f64 (13871404204190436050))) (f64 (4593809476366801300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2327 :
  out_eq64 (ported_sin (f64 (13731611067389374790))) (f64 (13731611067389374743)) &&
  out_eq64 (ported_cos (f64 (13731611067389374790))) (f64 (4607182418800017136)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2328 :
  out_eq64 (ported_sin (f64 (13846037040883751809))) (f64 (4606049263484629263)) &&
  out_eq64 (ported_cos (f64 (13846037040883751809))) (f64 (4602418978480522954)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2329 :
  out_eq64 (ported_sin (f64 (4644183869183268470))) (f64 (13821870706755103240)) &&
  out_eq64 (ported_cos (f64 (4644183869183268470))) (f64 (13830225074992959534)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2330 :
  out_eq64 (ported_sin (f64 (4517171786626495690))) (f64 (4517171786626494979)) &&
  out_eq64 (ported_cos (f64 (4517171786626495690))) (f64 (4607182418800013200)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2331 :
  out_eq64 (ported_sin (f64 (4618372650747048938))) (f64 (13823123566820307419)) &&
  out_eq64 (ported_cos (f64 (4618372650747048938))) (f64 (4606653917078966465)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2332 :
  out_eq64 (ported_sin (f64 (4623225708081321110))) (f64 (13812915630218331276)) &&
  out_eq64 (ported_cos (f64 (4623225708081321110))) (f64 (4607161746380884430)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2333 :
  out_eq64 (ported_sin (f64 (4627175233416207640))) (f64 (13829304125696531280)) &&
  out_eq64 (ported_cos (f64 (4627175233416207640))) (f64 (13826125533055295679)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2334 :
  out_eq64 (ported_sin (f64 (4523302689624250365))) (f64 (4523302689624243267)) &&
  out_eq64 (ported_cos (f64 (4523302689624250365))) (f64 (4607182418799986434)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2335 :
  out_eq64 (ported_sin (f64 (13845322583508460425))) (f64 (4604690858234873096)) &&
  out_eq64 (ported_cos (f64 (13845322583508460425))) (f64 (13827766266842336233)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2336 :
  out_eq64 (ported_sin (f64 (4528817394552832098))) (f64 (4528817394552787403)) &&
  out_eq64 (ported_cos (f64 (4528817394552832098))) (f64 (4607182418799849747)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2337 :
  out_eq64 (ported_sin (f64 (4626098376129374145))) (f64 (4599906630346044989)) &&
  out_eq64 (ported_cos (f64 (4626098376129374145))) (f64 (4606625710634843693)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2338 :
  out_eq64 (ported_sin (f64 (13839299636879221354))) (f64 (4604262274491102145)) &&
  out_eq64 (ported_cos (f64 (13839299636879221354))) (f64 (13828186337699532237)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2339 :
  out_eq64 (ported_sin (f64 (13907973009648459136))) (f64 (13824258865709214156)) &&
  out_eq64 (ported_cos (f64 (13907973009648459136))) (f64 (4606428390355041129)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2340 :
  out_eq64 (ported_sin (f64 (4616850460240284735))) (f64 (13830483679896848670)) &&
  out_eq64 (ported_cos (f64 (4616850460240284735))) (f64 (13817047781183911751)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2341 :
  out_eq64 (ported_sin (f64 (4683847753180280323))) (f64 (4605057944697061502)) &&
  out_eq64 (ported_cos (f64 (4683847753180280323))) (f64 (4603985360068498867)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2342 :
  out_eq64 (ported_sin (f64 (4621481322259226467))) (f64 (4582811230752077450)) &&
  out_eq64 (ported_cos (f64 (4621481322259226467))) (f64 (13830551680762144711)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2343 :
  out_eq64 (ported_sin (f64 (4603161553229505646))) (f64 (4602910736803822564)) &&
  out_eq64 (ported_cos (f64 (4603161553229505646))) (f64 (4605837106695882216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2344 :
  out_eq64 (ported_sin (f64 (13728719243748153468))) (f64 (13728719243748153439)) &&
  out_eq64 (ported_cos (f64 (13728719243748153468))) (f64 (4607182418800017285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2345 :
  out_eq64 (ported_sin (f64 (13769582835196920283))) (f64 (13769582835188189826)) &&
  out_eq64 (ported_cos (f64 (13769582835196920283))) (f64 (4607182418764177619)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2346 :
  out_eq64 (ported_sin (f64 (13844109056500987176))) (f64 (13830329773762190308)) &&
  out_eq64 (ported_cos (f64 (13844109056500987176))) (f64 (13820537083791108826)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2347 :
  out_eq64 (ported_sin (f64 (4618207400241170819))) (f64 (13825538140986800963)) &&
  out_eq64 (ported_cos (f64 (4618207400241170819))) (f64 (4606118176985589594)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2348 :
  out_eq64 (ported_sin (f64 (4626089814121174461))) (f64 (4599389725068281056)) &&
  out_eq64 (ported_cos (f64 (4626089814121174461))) (f64 (4606716616198454397)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2349 :
  out_eq64 (ported_sin (f64 (13836249883983897432))) (f64 (13826724260427688661)) &&
  out_eq64 (ported_cos (f64 (13836249883983897432))) (f64 (13828918027574932285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2350 :
  out_eq64 (ported_sin (f64 (4532185598628732396))) (f64 (4532185598628625530)) &&
  out_eq64 (ported_cos (f64 (4532185598628732396))) (f64 (4607182418799541517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2351 :
  out_eq64 (ported_sin (f64 (4622951284649357076))) (f64 (13826295360845861613)) &&
  out_eq64 (ported_cos (f64 (4622951284649357076))) (f64 (4605829312736915240)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2352 :
  out_eq64 (ported_sin (f64 (13850057564785460778))) (f64 (13827364899052077293)) &&
  out_eq64 (ported_cos (f64 (13850057564785460778))) (f64 (13828423641525097607)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2353 :
  out_eq64 (ported_sin (f64 (13849041621221954912))) (f64 (4606468427673822992)) &&
  out_eq64 (ported_cos (f64 (13849041621221954912))) (f64 (4600700798348196527)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2354 :
  out_eq64 (ported_sin (f64 (4626056506526217713))) (f64 (4596490790393462826)) &&
  out_eq64 (ported_cos (f64 (4626056506526217713))) (f64 (4606994414706448223)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2355 :
  out_eq64 (ported_sin (f64 (4587055779127131258))) (f64 (4587053149013988628)) &&
  out_eq64 (ported_cos (f64 (4587055779127131258))) (f64 (4607172112075039712)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2356 :
  out_eq64 (ported_sin (f64 (13844547714888609359))) (f64 (13826390802565465249)) &&
  out_eq64 (ported_cos (f64 (13844547714888609359))) (f64 (13829141313218256803)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2357 :
  out_eq64 (ported_sin (f64 (13921835903926817094))) (f64 (4606232670105215729)) &&
  out_eq64 (ported_cos (f64 (13921835903926817094))) (f64 (4601723235628740694)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2358 :
  out_eq64 (ported_sin (f64 (4618752586157401186))) (f64 (13797876100803144445)) &&
  out_eq64 (ported_cos (f64 (4618752586157401186))) (f64 (4607182209797388158)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2359 :
  out_eq64 (ported_sin (f64 (4620565177062135834))) (f64 (4607177721971318220)) &&
  out_eq64 (ported_cos (f64 (4620565177062135834))) (f64 (13808186313792567772)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2360 :
  out_eq64 (ported_sin (f64 (4620869185433505132))) (f64 (4606251733702310034)) &&
  out_eq64 (ported_cos (f64 (4620869185433505132))) (f64 (13825018506610977677)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2361 :
  out_eq64 (ported_sin (f64 (13836307054606732616))) (f64 (13826535476634794524)) &&
  out_eq64 (ported_cos (f64 (13836307054606732616))) (f64 (13829047076218175467)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2362 :
  out_eq64 (ported_sin (f64 (4595192795607971952))) (f64 (4595164756475928861)) &&
  out_eq64 (ported_cos (f64 (4595192795607971952))) (f64 (4607056778282895688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2363 :
  out_eq64 (ported_sin (f64 (13845969086872870143))) (f64 (4606518634727952952)) &&
  out_eq64 (ported_cos (f64 (13845969086872870143))) (f64 (4600458979199420151)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2364 :
  out_eq64 (ported_sin (f64 (4624328415799899303))) (f64 (4606724485893584090)) &&
  out_eq64 (ported_cos (f64 (4624328415799899303))) (f64 (13822714523838766298)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2365 :
  out_eq64 (ported_sin (f64 (4622964460465423230))) (f64 (13826114933098198278)) &&
  out_eq64 (ported_cos (f64 (4622964460465423230))) (f64 (4605938335414295778)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2366 :
  out_eq64 (ported_sin (f64 (13825109727907160219))) (f64 (13824842894118059906)) &&
  out_eq64 (ported_cos (f64 (13825109727907160219))) (f64 (4606294493689079005)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2367 :
  out_eq64 (ported_sin (f64 (4623498439418520353))) (f64 (4600962927686571530)) &&
  out_eq64 (ported_cos (f64 (4623498439418520353))) (f64 (4606411653614110805)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2368 :
  out_eq64 (ported_sin (f64 (13850244688142871344))) (f64 (13808920109080702860)) &&
  out_eq64 (ported_cos (f64 (13850244688142871344))) (f64 (13830548160208566774)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2369 :
  out_eq64 (ported_sin (f64 (4625553942931884907))) (f64 (13830554005792840686)) &&
  out_eq64 (ported_cos (f64 (4625553942931884907))) (f64 (13800287006073371185)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2370 :
  out_eq64 (ported_sin (f64 (13749852901704524794))) (f64 (13749852901704511010)) &&
  out_eq64 (ported_cos (f64 (13749852901704524794))) (f64 (4607182418799940874)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2371 :
  out_eq64 (ported_sin (f64 (13848513381446109264))) (f64 (4596096076373267937)) &&
  out_eq64 (ported_cos (f64 (13848513381446109264))) (f64 (13830386360757777827)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2372 :
  out_eq64 (ported_sin (f64 (4627719663509508369))) (f64 (13818628072922120725)) &&
  out_eq64 (ported_cos (f64 (4627719663509508369))) (f64 (4607052896178745282)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2373 :
  out_eq64 (ported_sin (f64 (4520969735427175218))) (f64 (4520969735427170847)) &&
  out_eq64 (ported_cos (f64 (4520969735427175218))) (f64 (4607182418800003284)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2374 :
  out_eq64 (ported_sin (f64 (13847811559264934605))) (f64 (13829374563766588600)) &&
  out_eq64 (ported_cos (f64 (13847811559264934605))) (f64 (13825957218979649727)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2375 :
  out_eq64 (ported_sin (f64 (4624334630133410687))) (f64 (4606692665648671747)) &&
  out_eq64 (ported_cos (f64 (4624334630133410687))) (f64 (13822902923037449824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2376 :
  out_eq64 (ported_sin (f64 (13840708121518065441))) (f64 (4606764331195950395)) &&
  out_eq64 (ported_cos (f64 (13840708121518065441))) (f64 (4599096304043959046)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2377 :
  out_eq64 (ported_sin (f64 (4625612809759513660))) (f64 (13830376442609541738)) &&
  out_eq64 (ported_cos (f64 (4625612809759513660))) (f64 (4596295554835121647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2378 :
  out_eq64 (ported_sin (f64 (4626646684053685678))) (f64 (4604883493587204165)) &&
  out_eq64 (ported_cos (f64 (4626646684053685678))) (f64 (13827557971648090932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2379 :
  out_eq64 (ported_sin (f64 (4627283582255437652))) (f64 (13830455634412425994)) &&
  out_eq64 (ported_cos (f64 (4627283582255437652))) (f64 (13817862371834635410)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2380 :
  out_eq64 (ported_sin (f64 (4626824294138111467))) (f64 (4596650013350055564)) &&
  out_eq64 (ported_cos (f64 (4626824294138111467))) (f64 (13830358094876365784)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2381 :
  out_eq64 (ported_sin (f64 (13847656678151447194))) (f64 (13830290948015959734)) &&
  out_eq64 (ported_cos (f64 (13847656678151447194))) (f64 (13821191064338016968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2382 :
  out_eq64 (ported_sin (f64 (13840501252554618910))) (f64 (4607115315269446212)) &&
  out_eq64 (ported_cos (f64 (13840501252554618910))) (f64 (4593443766815721315)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2383 :
  out_eq64 (ported_sin (f64 (4525433753466716045))) (f64 (4525433753466698807)) &&
  out_eq64 (ported_cos (f64 (4525433753466716045))) (f64 (4607182418799961446)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2384 :
  out_eq64 (ported_sin (f64 (4624032074098809274))) (f64 (4606991672038953622)) &&
  out_eq64 (ported_cos (f64 (4624032074098809274))) (f64 (4596543443089360894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2385 :
  out_eq64 (ported_sin (f64 (13849248955127994126))) (f64 (4601236140385736485)) &&
  out_eq64 (ported_cos (f64 (13849248955127994126))) (f64 (4606349823262738798)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2386 :
  out_eq64 (ported_sin (f64 (4672247701786696120))) (f64 (4607017658336072614)) &&
  out_eq64 (ported_cos (f64 (4672247701786696120))) (f64 (4596027658351692118)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2387 :
  out_eq64 (ported_sin (f64 (4617644809363612064))) (f64 (13829081044590579135)) &&
  out_eq64 (ported_cos (f64 (4617644809363612064))) (f64 (4603111987102583923)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2388 :
  out_eq64 (ported_sin (f64 (13836718802870461225))) (f64 (13824126309151141899)) &&
  out_eq64 (ported_cos (f64 (13836718802870461225))) (f64 (13829829082722553789)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2389 :
  out_eq64 (ported_sin (f64 (13849653580619659709))) (f64 (13829146764570003174)) &&
  out_eq64 (ported_cos (f64 (13849653580619659709))) (f64 (4603010208065371934)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2390 :
  out_eq64 (ported_sin (f64 (4616831373776400833))) (f64 (13830463292839816172)) &&
  out_eq64 (ported_cos (f64 (4616831373776400833))) (f64 (13817653072098401989)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2391 :
  out_eq64 (ported_sin (f64 (13837853790083489164))) (f64 (4591855524033615297)) &&
  out_eq64 (ported_cos (f64 (13837853790083489164))) (f64 (13830509490436247459)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2392 :
  out_eq64 (ported_sin (f64 (13848385934818314771))) (f64 (13808272427106016808)) &&
  out_eq64 (ported_cos (f64 (13848385934818314771))) (f64 (13830549583338342805)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2393 :
  out_eq64 (ported_sin (f64 (13750356565990958078))) (f64 (13750356565990939556)) &&
  out_eq64 (ported_cos (f64 (13750356565990958078))) (f64 (4607182418799924213)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2394 :
  out_eq64 (ported_sin (f64 (4575265723961471609))) (f64 (4575265643771504430)) &&
  out_eq64 (ported_cos (f64 (4575265723961471609))) (f64 (4607182167299088920)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2395 :
  out_eq64 (ported_sin (f64 (4616518236925230001))) (f64 (13829769731263911416)) &&
  out_eq64 (ported_cos (f64 (4616518236925230001))) (f64 (13824397715659530662)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2396 :
  out_eq64 (ported_sin (f64 (4623853438629587550))) (f64 (4605976186949020669)) &&
  out_eq64 (ported_cos (f64 (4623853438629587550))) (f64 (4602677072928238344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2397 :
  out_eq64 (ported_sin (f64 (4606026732903555678))) (f64 (4605069506314318673)) &&
  out_eq64 (ported_cos (f64 (4606026732903555678))) (f64 (4603971636400611750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2398 :
  out_eq64 (ported_sin (f64 (4532654262951675608))) (f64 (4532654262951542018)) &&
  out_eq64 (ported_cos (f64 (4532654262951675608))) (f64 (4607182418799465166)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2399 :
  out_eq64 (ported_sin (f64 (13850281902740933893))) (f64 (4591486869909068903)) &&
  out_eq64 (ported_cos (f64 (13850281902740933893))) (f64 (13830513992711294016)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2400 :
  out_eq64 (ported_sin (f64 (4627148795844738041))) (f64 (13828840552358951769)) &&
  out_eq64 (ported_cos (f64 (4627148795844738041))) (f64 (13826832847423817328)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2401 :
  out_eq64 (ported_sin (f64 (13846728115883238296))) (f64 (13818415978365612594)) &&
  out_eq64 (ported_cos (f64 (13846728115883238296))) (f64 (4607061823805504697)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2402 :
  out_eq64 (ported_sin (f64 (4603485157742929011))) (f64 (4603182892738098531)) &&
  out_eq64 (ported_cos (f64 (4603485157742929011))) (f64 (4605662064515522390)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2403 :
  out_eq64 (ported_sin (f64 (13847985839545847792))) (f64 (13827644643044993264)) &&
  out_eq64 (ported_cos (f64 (13847985839545847792))) (f64 (13828176850242566359)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2404 :
  out_eq64 (ported_sin (f64 (13849929690312994306))) (f64 (13829792399090553897)) &&
  out_eq64 (ported_cos (f64 (13849929690312994306))) (f64 (13824295487004526241)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2405 :
  out_eq64 (ported_sin (f64 (4625883956064885907))) (f64 (13824197071962661300)) &&
  out_eq64 (ported_cos (f64 (4625883956064885907))) (f64 (4606441827144198060)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2406 :
  out_eq64 (ported_sin (f64 (13845604881133512829))) (f64 (4606878184193618136)) &&
  out_eq64 (ported_cos (f64 (13845604881133512829))) (f64 (13821686089214547072)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2407 :
  out_eq64 (ported_sin (f64 (13837998678278012594))) (f64 (4595061178646431331)) &&
  out_eq64 (ported_cos (f64 (13837998678278012594))) (f64 (13830433147250249945)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2408 :
  out_eq64 (ported_sin (f64 (4622871964449622187))) (f64 (13827323210784735876)) &&
  out_eq64 (ported_cos (f64 (4622871964449622187))) (f64 (4605086658567698619)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2409 :
  out_eq64 (ported_sin (f64 (13845421747042830281))) (f64 (4605679854401315416)) &&
  out_eq64 (ported_cos (f64 (13845421747042830281))) (f64 (13826528229607381408)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2410 :
  out_eq64 (ported_sin (f64 (4627069217242266272))) (f64 (13827076495594561957)) &&
  out_eq64 (ported_cos (f64 (4627069217242266272))) (f64 (13828657611689663569)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2411 :
  out_eq64 (ported_sin (f64 (13848259453409263710))) (f64 (13821632480755052273)) &&
  out_eq64 (ported_cos (f64 (13848259453409263710))) (f64 (13830257325976657908)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2412 :
  out_eq64 (ported_sin (f64 (13850926396064471115))) (f64 (4604361315607774185)) &&
  out_eq64 (ported_cos (f64 (13850926396064471115))) (f64 (4604722116055849672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2413 :
  out_eq64 (ported_sin (f64 (13849272434803107163))) (f64 (4599847623834120672)) &&
  out_eq64 (ported_cos (f64 (13849272434803107163))) (f64 (4606636536364857851)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2414 :
  out_eq64 (ported_sin (f64 (4620421815065384205))) (f64 (4607141773966426781)) &&
  out_eq64 (ported_cos (f64 (4620421815065384205))) (f64 (4591502152343916521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2415 :
  out_eq64 (ported_sin (f64 (13835237369559835700))) (f64 (13829413356458536817)) &&
  out_eq64 (ported_cos (f64 (13835237369559835700))) (f64 (13825819557475063304)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2416 :
  out_eq64 (ported_sin (f64 (13848524870102597010))) (f64 (4596816135748105462)) &&
  out_eq64 (ported_cos (f64 (13848524870102597010))) (f64 (13830349175738261168)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2417 :
  out_eq64 (ported_sin (f64 (4622505906473391326))) (f64 (13830328609589382676)) &&
  out_eq64 (ported_cos (f64 (4622505906473391326))) (f64 (4597185475825895839)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2418 :
  out_eq64 (ported_sin (f64 (13850121143636282986))) (f64 (13825303289572835909)) &&
  out_eq64 (ported_cos (f64 (13850121143636282986))) (f64 (13829551895986958119)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2419 :
  out_eq64 (ported_sin (f64 (13848910125594001820))) (f64 (4607162617734939059)) &&
  out_eq64 (ported_cos (f64 (13848910125594001820))) (f64 (13812811808864547737)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2420 :
  out_eq64 (ported_sin (f64 (13850243854268281672))) (f64 (13809346730199991714)) &&
  out_eq64 (ported_cos (f64 (13850243854268281672))) (f64 (13830547123222614849)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2421 :
  out_eq64 (ported_sin (f64 (13848504449395820194))) (f64 (4595534244971303567)) &&
  out_eq64 (ported_cos (f64 (13848504449395820194))) (f64 (13830412728038477917)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2422 :
  out_eq64 (ported_sin (f64 (13842169717766679781))) (f64 (13808322341562285320)) &&
  out_eq64 (ported_cos (f64 (13842169717766679781))) (f64 (4607177443289713833)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2423 :
  out_eq64 (ported_sin (f64 (4622445812186090255))) (f64 (13830492181390118793)) &&
  out_eq64 (ported_cos (f64 (4622445812186090255))) (f64 (4593123093227350925)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2424 :
  out_eq64 (ported_sin (f64 (4616708912382767904))) (f64 (13830271846171483943)) &&
  out_eq64 (ported_cos (f64 (4616708912382767904))) (f64 (13821494315783376769)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2425 :
  out_eq64 (ported_sin (f64 (13849928149658413871))) (f64 (13829812121945682698)) &&
  out_eq64 (ported_cos (f64 (13849928149658413871))) (f64 (13824205119172850276)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2426 :
  out_eq64 (ported_sin (f64 (13842380134980667961))) (f64 (13820407103778502459)) &&
  out_eq64 (ported_cos (f64 (13842380134980667961))) (f64 (4606965070908869338)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2427 :
  out_eq64 (ported_sin (f64 (4491245902786755204))) (f64 (4491245902786755204)) &&
  out_eq64 (ported_cos (f64 (4491245902786755204))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2428 :
  out_eq64 (ported_sin (f64 (13828050109705393067))) (f64 (13827499738377525206)) &&
  out_eq64 (ported_cos (f64 (13828050109705393067))) (f64 (4604935219302855259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2429 :
  out_eq64 (ported_sin (f64 (13846690832563025434))) (f64 (13815057607172521896)) &&
  out_eq64 (ported_cos (f64 (13846690832563025434))) (f64 (4607139558892851411)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2430 :
  out_eq64 (ported_sin (f64 (13843795466668830066))) (f64 (13830515027420651696)) &&
  out_eq64 (ported_cos (f64 (13843795466668830066))) (f64 (4591399267769743564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2431 :
  out_eq64 (ported_sin (f64 (4625570061174483562))) (f64 (13830544394877095927)) &&
  out_eq64 (ported_cos (f64 (4625570061174483562))) (f64 (4586970463883524092)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2432 :
  out_eq64 (ported_sin (f64 (4616436445608125287))) (f64 (13829481160458333750)) &&
  out_eq64 (ported_cos (f64 (4616436445608125287))) (f64 (13825571916808255366)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2433 :
  out_eq64 (ported_sin (f64 (13851062958789466647))) (f64 (4598509632896563182)) &&
  out_eq64 (ported_cos (f64 (13851062958789466647))) (f64 (4606851511726801463)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2434 :
  out_eq64 (ported_sin (f64 (13841027528210642817))) (f64 (4605661831715541225)) &&
  out_eq64 (ported_cos (f64 (13841027528210642817))) (f64 (4603183240773930457)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2435 :
  out_eq64 (ported_sin (f64 (13842313215840771053))) (f64 (13818304703059766555)) &&
  out_eq64 (ported_cos (f64 (13842313215840771053))) (f64 (4607066377625479820)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2436 :
  out_eq64 (ported_sin (f64 (4609632682947156085))) (f64 (4607179201588665808)) &&
  out_eq64 (ported_cos (f64 (4609632682947156085))) (f64 (4583360238711685202)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2437 :
  out_eq64 (ported_sin (f64 (13886516382457390435))) (f64 (4604972883164407948)) &&
  out_eq64 (ported_cos (f64 (13886516382457390435))) (f64 (13827456690191520090)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2438 :
  out_eq64 (ported_sin (f64 (4610298214107083508))) (f64 (4607116508493601858)) &&
  out_eq64 (ported_cos (f64 (4610298214107083508))) (f64 (13816737686331059011)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2439 :
  out_eq64 (ported_sin (f64 (4620308390145746662))) (f64 (4607010352365012943)) &&
  out_eq64 (ported_cos (f64 (4620308390145746662))) (f64 (4596176662352699716)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2440 :
  out_eq64 (ported_sin (f64 (4616750517837355850))) (f64 (13830348593012874465)) &&
  out_eq64 (ported_cos (f64 (4616750517837355850))) (f64 (13820198894908211199)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2441 :
  out_eq64 (ported_sin (f64 (13835873725157572705))) (f64 (13827877750608141431)) &&
  out_eq64 (ported_cos (f64 (13835873725157572705))) (f64 (13827954633515218435)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2442 :
  out_eq64 (ported_sin (f64 (4554068419443641110))) (f64 (4554068419365103181)) &&
  out_eq64 (ported_cos (f64 (4554068419443641110))) (f64 (4607182418409386062)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2443 :
  out_eq64 (ported_sin (f64 (13849738792216782589))) (f64 (13830242632853872184)) &&
  out_eq64 (ported_cos (f64 (13849738792216782589))) (f64 (4598370584374447427)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2444 :
  out_eq64 (ported_sin (f64 (13723974403457763124))) (f64 (13723974403457763118)) &&
  out_eq64 (ported_cos (f64 (13723974403457763124))) (f64 (4607182418800017380)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2445 :
  out_eq64 (ported_sin (f64 (13848224869933666169))) (f64 (13822693315776621969)) &&
  out_eq64 (ported_cos (f64 (13848224869933666169))) (f64 (13830100032364580111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2446 :
  out_eq64 (ported_sin (f64 (13849659557403754690))) (f64 (13829247708899808920)) &&
  out_eq64 (ported_cos (f64 (13849659557403754690))) (f64 (4602847763789432648)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2447 :
  out_eq64 (ported_sin (f64 (13838478659340144306))) (f64 (4600311026767807489)) &&
  out_eq64 (ported_cos (f64 (13838478659340144306))) (f64 (13829920380523399298)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2448 :
  out_eq64 (ported_sin (f64 (13839668886319897803))) (f64 (4605520879225406941)) &&
  out_eq64 (ported_cos (f64 (13839668886319897803))) (f64 (13826759829879468260)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2449 :
  out_eq64 (ported_sin (f64 (4626615571397161222))) (f64 (4605505593457178769)) &&
  out_eq64 (ported_cos (f64 (4626615571397161222))) (f64 (13826781304233833272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2450 :
  out_eq64 (ported_sin (f64 (13850630124944042136))) (f64 (4606926731927290245)) &&
  out_eq64 (ported_cos (f64 (13850630124944042136))) (f64 (13821063595792671559)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2451 :
  out_eq64 (ported_sin (f64 (13898243585882246260))) (f64 (4606253335728422835)) &&
  out_eq64 (ported_cos (f64 (13898243585882246260))) (f64 (13825012013528298185)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2452 :
  out_eq64 (ported_sin (f64 (13839643057511274985))) (f64 (4605399377382486699)) &&
  out_eq64 (ported_cos (f64 (13839643057511274985))) (f64 (13826926957317173912)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2453 :
  out_eq64 (ported_sin (f64 (4618802975562521041))) (f64 (4585627590166920447)) &&
  out_eq64 (ported_cos (f64 (4618802975562521041))) (f64 (4607175936068274364)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2454 :
  out_eq64 (ported_sin (f64 (13912590374034558842))) (f64 (13822836165892621167)) &&
  out_eq64 (ported_cos (f64 (13912590374034558842))) (f64 (4606704073391981804)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2455 :
  out_eq64 (ported_sin (f64 (4615056460455334631))) (f64 (13823308400780790157)) &&
  out_eq64 (ported_cos (f64 (4615056460455334631))) (f64 (13829992248054448578)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2456 :
  out_eq64 (ported_sin (f64 (4518631889632431529))) (f64 (4518631889632429894)) &&
  out_eq64 (ported_cos (f64 (4518631889632431529))) (f64 (4607182418800010077)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2457 :
  out_eq64 (ported_sin (f64 (4627436830335038483))) (f64 (13829856774597017407)) &&
  out_eq64 (ported_cos (f64 (4627436830335038483))) (f64 (4600623323521746112)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2458 :
  out_eq64 (ported_sin (f64 (13845936449995702584))) (f64 (4606701254750975723)) &&
  out_eq64 (ported_cos (f64 (13845936449995702584))) (f64 (4599480703179758054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2459 :
  out_eq64 (ported_sin (f64 (13847239840224886943))) (f64 (13829460567465002642)) &&
  out_eq64 (ported_cos (f64 (13847239840224886943))) (f64 (4602276071417900549)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2460 :
  out_eq64 (ported_sin (f64 (13846914307109357512))) (f64 (13825594144533208884)) &&
  out_eq64 (ported_cos (f64 (13846914307109357512))) (f64 (4606103140343245800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2461 :
  out_eq64 (ported_sin (f64 (4509359162575915762))) (f64 (4509359162575915673)) &&
  out_eq64 (ported_cos (f64 (4509359162575915762))) (f64 (4607182418800016989)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2462 :
  out_eq64 (ported_sin (f64 (4594305798982318774))) (f64 (4594288403606357210)) &&
  out_eq64 (ported_cos (f64 (4594305798982318774))) (f64 (4607090991698225231)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2463 :
  out_eq64 (ported_sin (f64 (4540746535517823414))) (f64 (4540746535516463740)) &&
  out_eq64 (ported_cos (f64 (4540746535517823414))) (f64 (4607182418793481930)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2464 :
  out_eq64 (ported_sin (f64 (4620278676495937310))) (f64 (4606961039830024382)) &&
  out_eq64 (ported_cos (f64 (4620278676495937310))) (f64 (4597106786278992675)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2465 :
  out_eq64 (ported_sin (f64 (4681102779096352625))) (f64 (13823907863150668125)) &&
  out_eq64 (ported_cos (f64 (4681102779096352625))) (f64 (13829874939518105492)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2466 :
  out_eq64 (ported_sin (f64 (4620280404173809685))) (f64 (4606964074966792989)) &&
  out_eq64 (ported_cos (f64 (4620280404173809685))) (f64 (4597052850073642145)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2467 :
  out_eq64 (ported_sin (f64 (13882213513709550308))) (f64 (13828964695340140927)) &&
  out_eq64 (ported_cos (f64 (13882213513709550308))) (f64 (13826657172053432665)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2468 :
  out_eq64 (ported_sin (f64 (13760296092779802948))) (f64 (13760296092779323903)) &&
  out_eq64 (ported_cos (f64 (13760296092779802948))) (f64 (4607182418797963639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2469 :
  out_eq64 (ported_sin (f64 (4626386157995326453))) (f64 (4607011771895985492)) &&
  out_eq64 (ported_cos (f64 (4626386157995326453))) (f64 (4596147969823630451)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2470 :
  out_eq64 (ported_sin (f64 (13849549352675917703))) (f64 (13826881959969235004)) &&
  out_eq64 (ported_cos (f64 (13849549352675917703))) (f64 (4605432669251857592)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2471 :
  out_eq64 (ported_sin (f64 (13807480036316714373))) (f64 (13807478825605198717)) &&
  out_eq64 (ported_cos (f64 (13807480036316714373))) (f64 (4607178547627217266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2472 :
  out_eq64 (ported_sin (f64 (4625559248827788492))) (f64 (13830554102460000031)) &&
  out_eq64 (ported_cos (f64 (4625559248827788492))) (f64 (4576258586508673830)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2473 :
  out_eq64 (ported_sin (f64 (13845784242566418199))) (f64 (4607167292847114563)) &&
  out_eq64 (ported_cos (f64 (13845784242566418199))) (f64 (4588509328335781115)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2474 :
  out_eq64 (ported_sin (f64 (13851100283012794029))) (f64 (4594170592364244820)) &&
  out_eq64 (ported_cos (f64 (13851100283012794029))) (f64 (4607095170803835266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2475 :
  out_eq64 (ported_sin (f64 (4625976337846126200))) (f64 (13813805164043243258)) &&
  out_eq64 (ported_cos (f64 (4625976337846126200))) (f64 (4607153508360837054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2476 :
  out_eq64 (ported_sin (f64 (4618169237691695927))) (f64 (13826061235159944013)) &&
  out_eq64 (ported_cos (f64 (4618169237691695927))) (f64 (4605969681307954610)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2477 :
  out_eq64 (ported_sin (f64 (13835503308051075432))) (f64 (13828841548222561757)) &&
  out_eq64 (ported_cos (f64 (13835503308051075432))) (f64 (13826831473013957945)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2478 :
  out_eq64 (ported_sin (f64 (13855101174011660686))) (f64 (13827411384576669733)) &&
  out_eq64 (ported_cos (f64 (13855101174011660686))) (f64 (13828384042131871475)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2479 :
  out_eq64 (ported_sin (f64 (13841994857478556614))) (f64 (4593438468778938139)) &&
  out_eq64 (ported_cos (f64 (13841994857478556614))) (f64 (4607115396537893897)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2480 :
  out_eq64 (ported_sin (f64 (13844598517711430557))) (f64 (13825322554578339155)) &&
  out_eq64 (ported_cos (f64 (13844598517711430557))) (f64 (13829546918967653238)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2481 :
  out_eq64 (ported_sin (f64 (13840347208088684013))) (f64 (4607181448598336753)) &&
  out_eq64 (ported_cos (f64 (13840347208088684013))) (f64 (13802986414682572490)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2482 :
  out_eq64 (ported_sin (f64 (4627663009665229261))) (f64 (13823575839895850322)) &&
  out_eq64 (ported_cos (f64 (4627663009665229261))) (f64 (4606569401120984350)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2483 :
  out_eq64 (ported_sin (f64 (13850217067391274487))) (f64 (13817407708655877271)) &&
  out_eq64 (ported_cos (f64 (13850217067391274487))) (f64 (13830471871879883102)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2484 :
  out_eq64 (ported_sin (f64 (4491515974120371219))) (f64 (4491515974120371219)) &&
  out_eq64 (ported_cos (f64 (4491515974120371219))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2485 :
  out_eq64 (ported_sin (f64 (13848113094892966488))) (f64 (13825956393682571118)) &&
  out_eq64 (ported_cos (f64 (13848113094892966488))) (f64 (13829374798709639603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2486 :
  out_eq64 (ported_sin (f64 (13903817406605415051))) (f64 (4582723369083152751)) &&
  out_eq64 (ported_cos (f64 (13903817406605415051))) (f64 (4607179711658460952)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2487 :
  out_eq64 (ported_sin (f64 (13828004093799256185))) (f64 (13827465125417101332)) &&
  out_eq64 (ported_cos (f64 (13828004093799256185))) (f64 (4604965540945008310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2488 :
  out_eq64 (ported_sin (f64 (4626549157238112584))) (f64 (4606526036709346071)) &&
  out_eq64 (ported_cos (f64 (4626549157238112584))) (f64 (13823794505936123711)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2489 :
  out_eq64 (ported_sin (f64 (13844122129436248792))) (f64 (13830280982831152444)) &&
  out_eq64 (ported_cos (f64 (13844122129436248792))) (f64 (13821350651714404148)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2490 :
  out_eq64 (ported_sin (f64 (4622653152201214123))) (f64 (13829511627987143462)) &&
  out_eq64 (ported_cos (f64 (4622653152201214123))) (f64 (4602085518808988573)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2491 :
  out_eq64 (ported_sin (f64 (4622653926937610933))) (f64 (13829505830808181414)) &&
  out_eq64 (ported_cos (f64 (4622653926937610933))) (f64 (4602107432102841710)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2492 :
  out_eq64 (ported_sin (f64 (4624650837596770789))) (f64 (4603823588399106478)) &&
  out_eq64 (ported_cos (f64 (4624650837596770789))) (f64 (13828563349879025345)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2493 :
  out_eq64 (ported_sin (f64 (4608755558348241779))) (f64 (4606962385394917917)) &&
  out_eq64 (ported_cos (f64 (4608755558348241779))) (f64 (4597082922433203618)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2494 :
  out_eq64 (ported_sin (f64 (13721552432023887993))) (f64 (13721552432023887989)) &&
  out_eq64 (ported_cos (f64 (13721552432023887993))) (f64 (4607182418800017395)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2495 :
  out_eq64 (ported_sin (f64 (4615536555625653001))) (f64 (13826395609794204232)) &&
  out_eq64 (ported_cos (f64 (4615536555625653001))) (f64 (13829138244990481101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2496 :
  out_eq64 (ported_sin (f64 (13840505060009500127))) (f64 (4607111553019045319)) &&
  out_eq64 (ported_cos (f64 (13840505060009500127))) (f64 (4593678598896797091)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2497 :
  out_eq64 (ported_sin (f64 (4626876009245023240))) (f64 (4582994894008790030)) &&
  out_eq64 (ported_cos (f64 (4626876009245023240))) (f64 (13830551536431467703)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2498 :
  out_eq64 (ported_sin (f64 (13841262929040397014))) (f64 (4604459338710689409)) &&
  out_eq64 (ported_cos (f64 (13841262929040397014))) (f64 (4604628085941653749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2499 :
  out_eq64 (ported_sin (f64 (13833907933195765718))) (f64 (13830418720671601762)) &&
  out_eq64 (ported_cos (f64 (13833907933195765718))) (f64 (13818771281863745598)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2500 :
  out_eq64 (ported_sin (f64 (4683786323753606732))) (f64 (13826665035672291187)) &&
  out_eq64 (ported_cos (f64 (4683786323753606732))) (f64 (13828959271897556794)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2501 :
  out_eq64 (ported_sin (f64 (13832010409769726839))) (f64 (13830279966287728421)) &&
  out_eq64 (ported_cos (f64 (13832010409769726839))) (f64 (4597994721991432815)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2502 :
  out_eq64 (ported_sin (f64 (13848503963783594239))) (f64 (4595503652452682003)) &&
  out_eq64 (ported_cos (f64 (13848503963783594239))) (f64 (13830414097648982423)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2503 :
  out_eq64 (ported_sin (f64 (4618401289456160758))) (f64 (13822690313465958799)) &&
  out_eq64 (ported_cos (f64 (4618401289456160758))) (f64 (4606728491168560339)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2504 :
  out_eq64 (ported_sin (f64 (13885623343012273396))) (f64 (13828185155945674549)) &&
  out_eq64 (ported_cos (f64 (13885623343012273396))) (f64 (13827635600020186818)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2505 :
  out_eq64 (ported_sin (f64 (13751613069786039175))) (f64 (13751613069786004373)) &&
  out_eq64 (ported_cos (f64 (13751613069786039175))) (f64 (4607182418799875504)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2506 :
  out_eq64 (ported_sin (f64 (4546223956504273405))) (f64 (4546223956495490487)) &&
  out_eq64 (ported_cos (f64 (4546223956504273405))) (f64 (4607182418764034188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2507 :
  out_eq64 (ported_sin (f64 (4616199680020561379))) (f64 (13828416269878568287)) &&
  out_eq64 (ported_cos (f64 (4616199680020561379))) (f64 (13827373601072878518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2508 :
  out_eq64 (ported_sin (f64 (4615738406137652939))) (f64 (13827055686471391168)) &&
  out_eq64 (ported_cos (f64 (4615738406137652939))) (f64 (13828673744775386567)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2509 :
  out_eq64 (ported_sin (f64 (13834987049444099005))) (f64 (13829795556819340028)) &&
  out_eq64 (ported_cos (f64 (13834987049444099005))) (f64 (13824281108978474403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2510 :
  out_eq64 (ported_sin (f64 (4619482099430558195))) (f64 (4603562406507070791)) &&
  out_eq64 (ported_cos (f64 (4619482099430558195))) (f64 (4605393796624817742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2511 :
  out_eq64 (ported_sin (f64 (4540651986426506727))) (f64 (4540651986425214509)) &&
  out_eq64 (ported_cos (f64 (4540651986426506727))) (f64 (4607182418793699916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2512 :
  out_eq64 (ported_sin (f64 (13845020379702118213))) (f64 (4598509000365617395)) &&
  out_eq64 (ported_cos (f64 (13845020379702118213))) (f64 (13830223636752228549)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2513 :
  out_eq64 (ported_sin (f64 (4627109489814034378))) (f64 (13828033857843737647)) &&
  out_eq64 (ported_cos (f64 (4627109489814034378))) (f64 (13827796547569887797)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2514 :
  out_eq64 (ported_sin (f64 (4627075444624961578))) (f64 (13827232439867574767)) &&
  out_eq64 (ported_cos (f64 (4627075444624961578))) (f64 (13828533552081972296)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2515 :
  out_eq64 (ported_sin (f64 (13849391956877800286))) (f64 (13813413605337946206)) &&
  out_eq64 (ported_cos (f64 (13849391956877800286))) (f64 (4607157305136065449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2516 :
  out_eq64 (ported_sin (f64 (4618015748754413533))) (f64 (13827078650844641969)) &&
  out_eq64 (ported_cos (f64 (4618015748754413533))) (f64 (4605283898319350287)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2517 :
  out_eq64 (ported_sin (f64 (4612425229856087580))) (f64 (4604719581552177662)) &&
  out_eq64 (ported_cos (f64 (4612425229856087580))) (f64 (13827736033689407059)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2518 :
  out_eq64 (ported_sin (f64 (4625974072508462173))) (f64 (13814383036029028744)) &&
  out_eq64 (ported_cos (f64 (4625974072508462173))) (f64 (4607147414266797859)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2519 :
  out_eq64 (ported_sin (f64 (4627560837261194983))) (f64 (13827581052915236187)) &&
  out_eq64 (ported_cos (f64 (4627560837261194983))) (f64 (4604862740612754300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2520 :
  out_eq64 (ported_sin (f64 (4654035037033485270))) (f64 (13830324139701825612)) &&
  out_eq64 (ported_cos (f64 (4654035037033485270))) (f64 (13820635446372922857)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2521 :
  out_eq64 (ported_sin (f64 (13848981974188336971))) (f64 (4607022129663603648)) &&
  out_eq64 (ported_cos (f64 (13848981974188336971))) (f64 (4595934785866904599)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2522 :
  out_eq64 (ported_sin (f64 (13782389502426114391))) (f64 (13782389502028179758)) &&
  out_eq64 (ported_cos (f64 (13782389502426114391))) (f64 (4607182416970758101)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2523 :
  out_eq64 (ported_sin (f64 (4568067709181859576))) (f64 (4568067702674011677)) &&
  out_eq64 (ported_cos (f64 (4568067709181859576))) (f64 (4607182389101673142)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2524 :
  out_eq64 (ported_sin (f64 (13844831817038129109))) (f64 (13812579514083537046)) &&
  out_eq64 (ported_cos (f64 (13844831817038129109))) (f64 (13830536536035728527)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2525 :
  out_eq64 (ported_sin (f64 (4643231978812811832))) (f64 (13824559195756613789)) &&
  out_eq64 (ported_cos (f64 (4643231978812811832))) (f64 (4606361110264059317)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2526 :
  out_eq64 (ported_sin (f64 (4612455390931390409))) (f64 (4604636103223614094)) &&
  out_eq64 (ported_cos (f64 (4612455390931390409))) (f64 (13827823132475119073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2527 :
  out_eq64 (ported_sin (f64 (13867561421653265658))) (f64 (4603147459741182960)) &&
  out_eq64 (ported_cos (f64 (13867561421653265658))) (f64 (13829057680212915113)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2528 :
  out_eq64 (ported_sin (f64 (13849832394776542723))) (f64 (13830533241937835835)) &&
  out_eq64 (ported_cos (f64 (13849832394776542723))) (f64 (13812979022548208985)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2529 :
  out_eq64 (ported_sin (f64 (13813364777735291160))) (f64 (13813359923269433891)) &&
  out_eq64 (ported_cos (f64 (13813364777735291160))) (f64 (4607157804754766070)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2530 :
  out_eq64 (ported_sin (f64 (4634433045637270132))) (f64 (13830179525645727975)) &&
  out_eq64 (ported_cos (f64 (4634433045637270132))) (f64 (13822187027684746029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2531 :
  out_eq64 (ported_sin (f64 (4624056246401755643))) (f64 (4607062694045938243)) &&
  out_eq64 (ported_cos (f64 (4624056246401755643))) (f64 (4595022844509509018)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2532 :
  out_eq64 (ported_sin (f64 (13836382049909464032))) (f64 (13826282978070214174)) &&
  out_eq64 (ported_cos (f64 (13836382049909464032))) (f64 (13829209017207945224)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2533 :
  out_eq64 (ported_sin (f64 (13847686606267079945))) (f64 (13830163670503406079)) &&
  out_eq64 (ported_cos (f64 (13847686606267079945))) (f64 (13822292293324827996)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2534 :
  out_eq64 (ported_sin (f64 (13835286057839447599))) (f64 (13829316649191566687)) &&
  out_eq64 (ported_cos (f64 (13835286057839447599))) (f64 (13826104248178163063)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2535 :
  out_eq64 (ported_sin (f64 (13767207624975654997))) (f64 (13767207624970596774)) &&
  out_eq64 (ported_cos (f64 (13767207624975654997))) (f64 (4607182418784326330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2536 :
  out_eq64 (ported_sin (f64 (13849450496463799748))) (f64 (13822068188558214072)) &&
  out_eq64 (ported_cos (f64 (13849450496463799748))) (f64 (4606824968587800741)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2537 :
  out_eq64 (ported_sin (f64 (4626919311790395352))) (f64 (13817152779440859661)) &&
  out_eq64 (ported_cos (f64 (4626919311790395352))) (f64 (13830480330505790745)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2538 :
  out_eq64 (ported_sin (f64 (4581162054514129450))) (f64 (4581161719861838911)) &&
  out_eq64 (ported_cos (f64 (4581162054514129450))) (f64 (4607180776110863567)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2539 :
  out_eq64 (ported_sin (f64 (13848597543714712285))) (f64 (4600586453343156192)) &&
  out_eq64 (ported_cos (f64 (13848597543714712285))) (f64 (13829864461945778930)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2540 :
  out_eq64 (ported_sin (f64 (13849633463437523438))) (f64 (13828782098156331911)) &&
  out_eq64 (ported_cos (f64 (13849633463437523438))) (f64 (4603540543689836420)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2541 :
  out_eq64 (ported_sin (f64 (4605732219380839931))) (f64 (4604876326222301728)) &&
  out_eq64 (ported_cos (f64 (4605732219380839931))) (f64 (4604193924365894674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2542 :
  out_eq64 (ported_sin (f64 (13913404395640730992))) (f64 (13829656960675870719)) &&
  out_eq64 (ported_cos (f64 (13913404395640730992))) (f64 (4601510582852727823)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2543 :
  out_eq64 (ported_sin (f64 (4597117269267010764))) (f64 (4597052930847762934)) &&
  out_eq64 (ported_cos (f64 (4597117269267010764))) (f64 (4606964070437664983)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2544 :
  out_eq64 (ported_sin (f64 (13893197386219907450))) (f64 (4604864801733164149)) &&
  out_eq64 (ported_cos (f64 (13893197386219907450))) (f64 (13827578767700389964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2545 :
  out_eq64 (ported_sin (f64 (13850091444486794350))) (f64 (13826497129576570526)) &&
  out_eq64 (ported_cos (f64 (13850091444486794350))) (f64 (13829072440381257687)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2546 :
  out_eq64 (ported_sin (f64 (13839901046633065761))) (f64 (4606432500098813277)) &&
  out_eq64 (ported_cos (f64 (13839901046633065761))) (f64 (13824240032603553453)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2547 :
  out_eq64 (ported_sin (f64 (4626978314422363498))) (f64 (13823017257806734511)) &&
  out_eq64 (ported_cos (f64 (4626978314422363498))) (f64 (13830044824351301426)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2548 :
  out_eq64 (ported_sin (f64 (4625918352449615302))) (f64 (13822128384870159818)) &&
  out_eq64 (ported_cos (f64 (4625918352449615302))) (f64 (4606816169924620455)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2549 :
  out_eq64 (ported_sin (f64 (13842137439475573624))) (f64 (13795291996631661455)) &&
  out_eq64 (ported_cos (f64 (13842137439475573624))) (f64 (4607182324703508060)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2550 :
  out_eq64 (ported_sin (f64 (13846287613596577533))) (f64 (4603398949050552545)) &&
  out_eq64 (ported_cos (f64 (13846287613596577533))) (f64 (4605512950016635683)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2551 :
  out_eq64 (ported_sin (f64 (4627140445476163146))) (f64 (13828680561360939518)) &&
  out_eq64 (ported_cos (f64 (4627140445476163146))) (f64 (13827046856271823569)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2552 :
  out_eq64 (ported_sin (f64 (13841932675384853538))) (f64 (4595522372231082051)) &&
  out_eq64 (ported_cos (f64 (13841932675384853538))) (f64 (4607041223528361814)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2553 :
  out_eq64 (ported_sin (f64 (13844487071817843001))) (f64 (13827179205388985731)) &&
  out_eq64 (ported_cos (f64 (13844487071817843001))) (f64 (13828576537231023308)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2554 :
  out_eq64 (ported_sin (f64 (13839026326348507281))) (f64 (4603413656622866294)) &&
  out_eq64 (ported_cos (f64 (13839026326348507281))) (f64 (13828874494310666175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2555 :
  out_eq64 (ported_sin (f64 (4615024022395327842))) (f64 (13823064452353886802)) &&
  out_eq64 (ported_cos (f64 (4615024022395327842))) (f64 (13830036493324354787)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2556 :
  out_eq64 (ported_sin (f64 (4625671432653520331))) (f64 (13829817207590009706)) &&
  out_eq64 (ported_cos (f64 (4625671432653520331))) (f64 (4600809559601127546)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2557 :
  out_eq64 (ported_sin (f64 (4509057719596923689))) (f64 (4509057719596923613)) &&
  out_eq64 (ported_cos (f64 (4509057719596923689))) (f64 (4607182418800017032)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2558 :
  out_eq64 (ported_sin (f64 (4620877611302437596))) (f64 (4606191150106833063)) &&
  out_eq64 (ported_cos (f64 (4620877611302437596))) (f64 (13825259372358535176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2559 :
  out_eq64 (ported_sin (f64 (13896507072772145781))) (f64 (4590081784060163310)) &&
  out_eq64 (ported_cos (f64 (13896507072772145781))) (f64 (4607156927547133310)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2560 :
  out_eq64 (ported_sin (f64 (13849202232861794540))) (f64 (4603256179807898959)) &&
  out_eq64 (ported_cos (f64 (13849202232861794540))) (f64 (4605612522902290795)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2561 :
  out_eq64 (ported_sin (f64 (4625056599900361327))) (f64 (13809722225444690940)) &&
  out_eq64 (ported_cos (f64 (4625056599900361327))) (f64 (13830546145038773490)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2562 :
  out_eq64 (ported_sin (f64 (4604581007100444664))) (f64 (4604054508411048011)) &&
  out_eq64 (ported_cos (f64 (4604581007100444664))) (f64 (4604998972240635535)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2563 :
  out_eq64 (ported_sin (f64 (4623764054406675435))) (f64 (4605166125107007651)) &&
  out_eq64 (ported_cos (f64 (4623764054406675435))) (f64 (4603854733418977400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2564 :
  out_eq64 (ported_sin (f64 (13740658645911816808))) (f64 (13740658645911816042)) &&
  out_eq64 (ported_cos (f64 (13740658645911816808))) (f64 (4607182418800012985)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2565 :
  out_eq64 (ported_sin (f64 (4612585572096482108))) (f64 (4604262690146089297)) &&
  out_eq64 (ported_cos (f64 (4612585572096482108))) (f64 (13828185956581476713)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2566 :
  out_eq64 (ported_sin (f64 (13846965996209432497))) (f64 (13826531397229310568)) &&
  out_eq64 (ported_cos (f64 (13846965996209432497))) (f64 (4605677751025298784)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2567 :
  out_eq64 (ported_sin (f64 (4609633758869807719))) (f64 (4607179258840233527)) &&
  out_eq64 (ported_cos (f64 (4609633758869807719))) (f64 (4583291404038039931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2568 :
  out_eq64 (ported_sin (f64 (13849098612212379399))) (f64 (4605592260685679773)) &&
  out_eq64 (ported_cos (f64 (13849098612212379399))) (f64 (4603285712587652146)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2569 :
  out_eq64 (ported_sin (f64 (13849407299469623553))) (f64 (13817182044602461447)) &&
  out_eq64 (ported_cos (f64 (13849407299469623553))) (f64 (4607107346136552731)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2570 :
  out_eq64 (ported_sin (f64 (4622221623997642526))) (f64 (13830202230848170358)) &&
  out_eq64 (ported_cos (f64 (4622221623997642526))) (f64 (13822032065624020556)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2571 :
  out_eq64 (ported_sin (f64 (4626047747456488230))) (f64 (4595389662977983289)) &&
  out_eq64 (ported_cos (f64 (4626047747456488230))) (f64 (4607047104128411196)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2572 :
  out_eq64 (ported_sin (f64 (4606333011431789881))) (f64 (4605262582835953896)) &&
  out_eq64 (ported_cos (f64 (4606333011431789881))) (f64 (4603733899244680220)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2573 :
  out_eq64 (ported_sin (f64 (4662582598777748603))) (f64 (4606253207247926205)) &&
  out_eq64 (ported_cos (f64 (4662582598777748603))) (f64 (13825012534508083487)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2574 :
  out_eq64 (ported_sin (f64 (13849616414209303247))) (f64 (13828444045934393279)) &&
  out_eq64 (ported_cos (f64 (13849616414209303247))) (f64 (4603968658293861783)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2575 :
  out_eq64 (ported_sin (f64 (4685301659265261706))) (f64 (13829099411956974533)) &&
  out_eq64 (ported_cos (f64 (4685301659265261706))) (f64 (13826455879919803375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2576 :
  out_eq64 (ported_sin (f64 (13850594135187005774))) (f64 (4606583576315019948)) &&
  out_eq64 (ported_cos (f64 (13850594135187005774))) (f64 (13823502503371669756)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2577 :
  out_eq64 (ported_sin (f64 (4624488879392959140))) (f64 (4605582211276651953)) &&
  out_eq64 (ported_cos (f64 (4624488879392959140))) (f64 (13826672303902850720)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2578 :
  out_eq64 (ported_sin (f64 (13843541438845473553))) (f64 (13830099406685795869)) &&
  out_eq64 (ported_cos (f64 (13843541438845473553))) (f64 (4599325066266695859)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2579 :
  out_eq64 (ported_sin (f64 (13842958944573962523))) (f64 (13827582115144229668)) &&
  out_eq64 (ported_cos (f64 (13842958944573962523))) (f64 (4604861782066664496)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2580 :
  out_eq64 (ported_sin (f64 (4638576237955083624))) (f64 (4601818798175777866)) &&
  out_eq64 (ported_cos (f64 (4638576237955083624))) (f64 (4606208619200666489)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2581 :
  out_eq64 (ported_sin (f64 (13836153417014914147))) (f64 (13827035177398095744)) &&
  out_eq64 (ported_cos (f64 (13836153417014914147))) (f64 (13828689550256639175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2582 :
  out_eq64 (ported_sin (f64 (13918499546385321705))) (f64 (4605765748499070246)) &&
  out_eq64 (ported_cos (f64 (13918499546385321705))) (f64 (13826396329364673835)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2583 :
  out_eq64 (ported_sin (f64 (13851077318833918108))) (f64 (4597061666828736927)) &&
  out_eq64 (ported_cos (f64 (13851077318833918108))) (f64 (4606963580310244357)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2584 :
  out_eq64 (ported_sin (f64 (13886064441380353750))) (f64 (13830365874228997339)) &&
  out_eq64 (ported_cos (f64 (13886064441380353750))) (f64 (4596501906574483954)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2585 :
  out_eq64 (ported_sin (f64 (13850487714050718409))) (f64 (4604797614695377854)) &&
  out_eq64 (ported_cos (f64 (13850487714050718409))) (f64 (13827652460810268121)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2586 :
  out_eq64 (ported_sin (f64 (4627348764745591358))) (f64 (13830523217599805275)) &&
  out_eq64 (ported_cos (f64 (4627348764745591358))) (f64 (4590660467121340937)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2587 :
  out_eq64 (ported_sin (f64 (4622901041760630157))) (f64 (13826958678948932076)) &&
  out_eq64 (ported_cos (f64 (4622901041760630157))) (f64 (4605375646227916922)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2588 :
  out_eq64 (ported_sin (f64 (13763203309618699014))) (f64 (13763203309617901186)) &&
  out_eq64 (ported_cos (f64 (13763203309618699014))) (f64 (4607182418795436760)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2589 :
  out_eq64 (ported_sin (f64 (4625701830440606048))) (f64 (13829384348051760155)) &&
  out_eq64 (ported_cos (f64 (4625701830440606048))) (f64 (4602550726372349754)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2590 :
  out_eq64 (ported_sin (f64 (4622584242290123404))) (f64 (13829965715616456549)) &&
  out_eq64 (ported_cos (f64 (4622584242290123404))) (f64 (4600077611749416092)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2591 :
  out_eq64 (ported_sin (f64 (4627681030664536587))) (f64 (13822488341961184547)) &&
  out_eq64 (ported_cos (f64 (4627681030664536587))) (f64 (4606761166739042005)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2592 :
  out_eq64 (ported_sin (f64 (4627231620551473062))) (f64 (13830060031801198974)) &&
  out_eq64 (ported_cos (f64 (4627231620551473062))) (f64 (13822930011632605640)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2593 :
  out_eq64 (ported_sin (f64 (13837576937211532705))) (f64 (13805653467983363809)) &&
  out_eq64 (ported_cos (f64 (13837576937211532705))) (f64 (13830552076592666239)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2594 :
  out_eq64 (ported_sin (f64 (4622386355117936653))) (f64 (13830553802599306264)) &&
  out_eq64 (ported_cos (f64 (4622386355117936653))) (f64 (4578095180890275039)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2595 :
  out_eq64 (ported_sin (f64 (4627397977193711653))) (f64 (13830256001771575053)) &&
  out_eq64 (ported_cos (f64 (4627397977193711653))) (f64 (4598270486068855035)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2596 :
  out_eq64 (ported_sin (f64 (4606493705207767476))) (f64 (4605360619840388982)) &&
  out_eq64 (ported_cos (f64 (4606493705207767476))) (f64 (4603606578584559580)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2597 :
  out_eq64 (ported_sin (f64 (13844499795088487167))) (f64 (13827018911292105950)) &&
  out_eq64 (ported_cos (f64 (13844499795088487167))) (f64 (13828702019230284349)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2598 :
  out_eq64 (ported_sin (f64 (4620270056912665844))) (f64 (4606945588252533921)) &&
  out_eq64 (ported_cos (f64 (4620270056912665844))) (f64 (4597375598401881055)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2599 :
  out_eq64 (ported_sin (f64 (4621723385522817828))) (f64 (13824144444740468211)) &&
  out_eq64 (ported_cos (f64 (4621723385522817828))) (f64 (13829825199440067742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2600 :
  out_eq64 (ported_sin (f64 (13848335391056474646))) (f64 (13816854115014548653)) &&
  out_eq64 (ported_cos (f64 (13848335391056474646))) (f64 (13830486762970963435)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2601 :
  out_eq64 (ported_sin (f64 (4626621640994702889))) (f64 (4605391033396450072)) &&
  out_eq64 (ported_cos (f64 (4626621640994702889))) (f64 (13826938143978161889)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2602 :
  out_eq64 (ported_sin (f64 (4620945745332192002))) (f64 (4605636549124095894)) &&
  out_eq64 (ported_cos (f64 (4620945745332192002))) (f64 (13826592868288697667)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2603 :
  out_eq64 (ported_sin (f64 (13847631491491874868))) (f64 (13830378928607320246)) &&
  out_eq64 (ported_cos (f64 (13847631491491874868))) (f64 (13819618140996723289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2604 :
  out_eq64 (ported_sin (f64 (13848676342862602543))) (f64 (4603796149219300458)) &&
  out_eq64 (ported_cos (f64 (13848676342862602543))) (f64 (13828585351882090150)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2605 :
  out_eq64 (ported_sin (f64 (4617429362311034191))) (f64 (13829882455584812442)) &&
  out_eq64 (ported_cos (f64 (4617429362311034191))) (f64 (4600499238233242323)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2606 :
  out_eq64 (ported_sin (f64 (4626427844022207236))) (f64 (4607172528464738266)) &&
  out_eq64 (ported_cos (f64 (4626427844022207236))) (f64 (4586912567426840369)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2607 :
  out_eq64 (ported_sin (f64 (13849272325580502597))) (f64 (4599854189970906794)) &&
  out_eq64 (ported_cos (f64 (13849272325580502597))) (f64 (4606635337469959314)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2608 :
  out_eq64 (ported_sin (f64 (4623205221217670279))) (f64 (13815528122253816420)) &&
  out_eq64 (ported_cos (f64 (4623205221217670279))) (f64 (4607133605820525073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2609 :
  out_eq64 (ported_sin (f64 (13844061877913555988))) (f64 (13830462493570832657)) &&
  out_eq64 (ported_cos (f64 (13844061877913555988))) (f64 (13817675322830109362)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2610 :
  out_eq64 (ported_sin (f64 (4594313506069715335))) (f64 (4594296032346157731)) &&
  out_eq64 (ported_cos (f64 (4594313506069715335))) (f64 (4607090717662989397)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2611 :
  out_eq64 (ported_sin (f64 (13843574826065752774))) (f64 (13830179457625072562)) &&
  out_eq64 (ported_cos (f64 (13843574826065752774))) (f64 (4598815447452092523)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2612 :
  out_eq64 (ported_sin (f64 (13849907727615812814))) (f64 (13830049945537256963)) &&
  out_eq64 (ported_cos (f64 (13849907727615812814))) (f64 (13822988037598526324)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2613 :
  out_eq64 (ported_sin (f64 (13850961757439798595))) (f64 (4603492246164260934)) &&
  out_eq64 (ported_cos (f64 (13850961757439798595))) (f64 (4605445629873972916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2614 :
  out_eq64 (ported_sin (f64 (13848520863064104437))) (f64 (4596565338328423097)) &&
  out_eq64 (ported_cos (f64 (13848520863064104437))) (f64 (13830362562338021878)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2615 :
  out_eq64 (ported_sin (f64 (4550469468838491277))) (f64 (4550469468807324501)) &&
  out_eq64 (ported_cos (f64 (4550469468838491277))) (f64 (4607182418667128504)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2616 :
  out_eq64 (ported_sin (f64 (4625443556198706166))) (f64 (13829835816037564466)) &&
  out_eq64 (ported_cos (f64 (4625443556198706166))) (f64 (13824094732591309583)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2617 :
  out_eq64 (ported_sin (f64 (4626964947977653464))) (f64 (13822203776451164423)) &&
  out_eq64 (ported_cos (f64 (4626964947977653464))) (f64 (13830177026364572750)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2618 :
  out_eq64 (ported_sin (f64 (4622082687368522189))) (f64 (13829330633535615203)) &&
  out_eq64 (ported_cos (f64 (4622082687368522189))) (f64 (13826080321453655813)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2619 :
  out_eq64 (ported_sin (f64 (4613715916941367450))) (f64 (4597736941286882739)) &&
  out_eq64 (ported_cos (f64 (4613715916941367450))) (f64 (13830295998479603093)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2620 :
  out_eq64 (ported_sin (f64 (13902991007693357602))) (f64 (13822457498058750849)) &&
  out_eq64 (ported_cos (f64 (13902991007693357602))) (f64 (4606766041336404436)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2621 :
  out_eq64 (ported_sin (f64 (13842956408464893363))) (f64 (13827567038248976479)) &&
  out_eq64 (ported_cos (f64 (13842956408464893363))) (f64 (4604875358715918229)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2622 :
  out_eq64 (ported_sin (f64 (13850175905178592788))) (f64 (13822052439061146544)) &&
  out_eq64 (ported_cos (f64 (13850175905178592788))) (f64 (13830199288728430163)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2623 :
  out_eq64 (ported_sin (f64 (4622845114918776769))) (f64 (13827646154218412773)) &&
  out_eq64 (ported_cos (f64 (4622845114918776769))) (f64 (4604803423209603850)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2624 :
  out_eq64 (ported_sin (f64 (4526571104279201530))) (f64 (4526571104279186964)) &&
  out_eq64 (ported_cos (f64 (4526571104279201530))) (f64 (4607182418799938010)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2625 :
  out_eq64 (ported_sin (f64 (13844856265796099911))) (f64 (13804695416105411305)) &&
  out_eq64 (ported_cos (f64 (13844856265796099911))) (f64 (13830552715052388043)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2626 :
  out_eq64 (ported_sin (f64 (13849910911042308213))) (f64 (13830015787575593113)) &&
  out_eq64 (ported_cos (f64 (13849910911042308213))) (f64 (13823179980800468633)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2627 :
  out_eq64 (ported_sin (f64 (13885245932922489144))) (f64 (4607155981947109173)) &&
  out_eq64 (ported_cos (f64 (13885245932922489144))) (f64 (13813553239747806659)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2628 :
  out_eq64 (ported_sin (f64 (13834284572114153044))) (f64 (13830257586351179871)) &&
  out_eq64 (ported_cos (f64 (13834284572114153044))) (f64 (13821630503426798401)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2629 :
  out_eq64 (ported_sin (f64 (13781511144266205294))) (f64 (13781511144021327665)) &&
  out_eq64 (ported_cos (f64 (13781511144266205294))) (f64 (4607182417476589795)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2630 :
  out_eq64 (ported_sin (f64 (4656889741607922352))) (f64 (4602934760120786103)) &&
  out_eq64 (ported_cos (f64 (4656889741607922352))) (f64 (4605822206659472673)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2631 :
  out_eq64 (ported_sin (f64 (4626455159928549760))) (f64 (4607171081517647692)) &&
  out_eq64 (ported_cos (f64 (4626455159928549760))) (f64 (13810761348873802603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2632 :
  out_eq64 (ported_sin (f64 (4697268697388665550))) (f64 (4600380577726912344)) &&
  out_eq64 (ported_cos (f64 (4697268697388665550))) (f64 (13829906509338793198)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2633 :
  out_eq64 (ported_sin (f64 (13921745651650841330))) (f64 (13825516695377968607)) &&
  out_eq64 (ported_cos (f64 (13921745651650841330))) (f64 (13829495938216110546)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2634 :
  out_eq64 (ported_sin (f64 (13841554242120126694))) (f64 (4602519436895822107)) &&
  out_eq64 (ported_cos (f64 (13841554242120126694))) (f64 (4606021153020391483)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2635 :
  out_eq64 (ported_sin (f64 (4627184525952977925))) (f64 (13829451017452432386)) &&
  out_eq64 (ported_cos (f64 (4627184525952977925))) (f64 (13825683147415418746)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2636 :
  out_eq64 (ported_sin (f64 (13844838334602702859))) (f64 (13810953222186632191)) &&
  out_eq64 (ported_cos (f64 (13844838334602702859))) (f64 (13830542508104913013)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2637 :
  out_eq64 (ported_sin (f64 (4626517097320560497))) (f64 (4606855556207222197)) &&
  out_eq64 (ported_cos (f64 (4626517097320560497))) (f64 (13821852562614923454)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2638 :
  out_eq64 (ported_sin (f64 (13845538684295203167))) (f64 (4606545763197611571)) &&
  out_eq64 (ported_cos (f64 (13845538684295203167))) (f64 (13823696066074268131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2639 :
  out_eq64 (ported_sin (f64 (13847923849372977764))) (f64 (13828336267229567373)) &&
  out_eq64 (ported_cos (f64 (13847923849372977764))) (f64 (13827466628864370778)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2640 :
  out_eq64 (ported_sin (f64 (13741143347643786264))) (f64 (13741143347643785235)) &&
  out_eq64 (ported_cos (f64 (13741143347643786264))) (f64 (4607182418800012022)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2641 :
  out_eq64 (ported_sin (f64 (13899658864056205161))) (f64 (4601924486097264911)) &&
  out_eq64 (ported_cos (f64 (13899658864056205161))) (f64 (13829553640625843840)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2642 :
  out_eq64 (ported_sin (f64 (13888882208941270478))) (f64 (13826414422554577790)) &&
  out_eq64 (ported_cos (f64 (13888882208941270478))) (f64 (4605754159579268471)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2643 :
  out_eq64 (ported_sin (f64 (4491006806971004965))) (f64 (4491006806971004965)) &&
  out_eq64 (ported_cos (f64 (4491006806971004965))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2644 :
  out_eq64 (ported_sin (f64 (4621430982076215205))) (f64 (4592878754019123314)) &&
  out_eq64 (ported_cos (f64 (4621430982076215205))) (f64 (13830495738801111231)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2645 :
  out_eq64 (ported_sin (f64 (4621751992401531677))) (f64 (13824976220926201711)) &&
  out_eq64 (ported_cos (f64 (4621751992401531677))) (f64 (13829634174533814871)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2646 :
  out_eq64 (ported_sin (f64 (13849955325440022958))) (f64 (13829428456725625606)) &&
  out_eq64 (ported_cos (f64 (13849955325440022958))) (f64 (13825765197884845035)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2647 :
  out_eq64 (ported_sin (f64 (13850370859004571144))) (f64 (4600866510970423474)) &&
  out_eq64 (ported_cos (f64 (13850370859004571144))) (f64 (13829804860416969443)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2648 :
  out_eq64 (ported_sin (f64 (13850214865254590943))) (f64 (13817686845936300623)) &&
  out_eq64 (ported_cos (f64 (13850214865254590943))) (f64 (13830462078256708464)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2649 :
  out_eq64 (ported_sin (f64 (4674981969154426874))) (f64 (13821970813909596363)) &&
  out_eq64 (ported_cos (f64 (4674981969154426874))) (f64 (13830210998031220854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2650 :
  out_eq64 (ported_sin (f64 (4630222802552115099))) (f64 (13829784279967709799)) &&
  out_eq64 (ported_cos (f64 (4630222802552115099))) (f64 (13824332300311903648)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2651 :
  out_eq64 (ported_sin (f64 (4622007573070800971))) (f64 (13828658397735740428)) &&
  out_eq64 (ported_cos (f64 (4622007573070800971))) (f64 (13827075484626027818)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2652 :
  out_eq64 (ported_sin (f64 (13850264264723133813))) (f64 (4584794724613268044)) &&
  out_eq64 (ported_cos (f64 (13850264264723133813))) (f64 (13830549798222490048)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2653 :
  out_eq64 (ported_sin (f64 (4498858947432328695))) (f64 (4498858947432328690)) &&
  out_eq64 (ported_cos (f64 (4498858947432328695))) (f64 (4607182418800017393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2654 :
  out_eq64 (ported_sin (f64 (4539560819986179665))) (f64 (4539560819984812809)) &&
  out_eq64 (ported_cos (f64 (4539560819986179665))) (f64 (4607182418795885829)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2655 :
  out_eq64 (ported_sin (f64 (13837798706026972226))) (f64 (4590099657265179169)) &&
  out_eq64 (ported_cos (f64 (13837798706026972226))) (f64 (13830528795680027212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2656 :
  out_eq64 (ported_sin (f64 (13849364123304981698))) (f64 (4582629516295754369)) &&
  out_eq64 (ported_cos (f64 (13849364123304981698))) (f64 (4607179783104014879)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2657 :
  out_eq64 (ported_sin (f64 (13845120284791991024))) (f64 (4601496429037500874)) &&
  out_eq64 (ported_cos (f64 (13845120284791991024))) (f64 (13829660377191405117)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2658 :
  out_eq64 (ported_sin (f64 (13850131557276656163))) (f64 (13824705482399851487)) &&
  out_eq64 (ported_cos (f64 (13850131557276656163))) (f64 (13829699173072180188)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2659 :
  out_eq64 (ported_sin (f64 (4626723464659867546))) (f64 (4603016118397823559)) &&
  out_eq64 (ported_cos (f64 (4626723464659867546))) (f64 (13829143001045181788)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2660 :
  out_eq64 (ported_sin (f64 (4612259145162169493))) (f64 (4605157837237392842)) &&
  out_eq64 (ported_cos (f64 (4612259145162169493))) (f64 (13827236956618899379)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2661 :
  out_eq64 (ported_sin (f64 (4585589655765936919))) (f64 (4585588371904093344)) &&
  out_eq64 (ported_cos (f64 (4585589655765936919))) (f64 (4607176028780967944)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2662 :
  out_eq64 (ported_sin (f64 (13840192156369741036))) (f64 (4607078033616129399)) &&
  out_eq64 (ported_cos (f64 (13840192156369741036))) (f64 (13818009302116133184)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2663 :
  out_eq64 (ported_sin (f64 (13850434443491173472))) (f64 (4603530813951430503)) &&
  out_eq64 (ported_cos (f64 (13850434443491173472))) (f64 (13828789303553404495)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2664 :
  out_eq64 (ported_sin (f64 (4626290415394974196))) (f64 (4605923319011557227)) &&
  out_eq64 (ported_cos (f64 (4626290415394974196))) (f64 (4602768322317393070)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2665 :
  out_eq64 (ported_sin (f64 (4625519376656552551))) (f64 (13830475149231938312)) &&
  out_eq64 (ported_cos (f64 (4625519376656552551))) (f64 (13817310579962720133)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2666 :
  out_eq64 (ported_sin (f64 (4645173587256406336))) (f64 (4580971569025716883)) &&
  out_eq64 (ported_cos (f64 (4645173587256406336))) (f64 (13830552924507011037)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2667 :
  out_eq64 (ported_sin (f64 (13845820070502528632))) (f64 (4607115902547002569)) &&
  out_eq64 (ported_cos (f64 (13845820070502528632))) (f64 (4593405407801017766)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2668 :
  out_eq64 (ported_sin (f64 (4609341915024234283))) (f64 (4607144910959754582)) &&
  out_eq64 (ported_cos (f64 (4609341915024234283))) (f64 (4591233557440031053)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2669 :
  out_eq64 (ported_sin (f64 (4626106171760552839))) (f64 (4600372262993551450)) &&
  out_eq64 (ported_cos (f64 (4626106171760552839))) (f64 (4606536139590810136)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2670 :
  out_eq64 (ported_sin (f64 (4522819617105161736))) (f64 (4522819617105156173)) &&
  out_eq64 (ported_cos (f64 (4522819617105161736))) (f64 (4607182418799991078)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2671 :
  out_eq64 (ported_sin (f64 (13891348878201785717))) (f64 (13813455487239432721)) &&
  out_eq64 (ported_cos (f64 (13891348878201785717))) (f64 (13830528948695539694)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2672 :
  out_eq64 (ported_sin (f64 (4626584857819381557))) (f64 (4606031986050624122)) &&
  out_eq64 (ported_cos (f64 (4626584857819381557))) (f64 (13825852937900004904)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2673 :
  out_eq64 (ported_sin (f64 (4510000578310171298))) (f64 (4510000578310171175)) &&
  out_eq64 (ported_cos (f64 (4510000578310171298))) (f64 (4607182418800016891)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2674 :
  out_eq64 (ported_sin (f64 (13850204808867454243))) (f64 (13818957306365516859)) &&
  out_eq64 (ported_cos (f64 (13850204808867454243))) (f64 (13830410428543391612)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2675 :
  out_eq64 (ported_sin (f64 (4626991729944466383))) (f64 (13823820181398702352)) &&
  out_eq64 (ported_cos (f64 (4626991729944466383))) (f64 (13829892873028728663)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2676 :
  out_eq64 (ported_sin (f64 (4490572341336935045))) (f64 (4490572341336935045)) &&
  out_eq64 (ported_cos (f64 (4490572341336935045))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2677 :
  out_eq64 (ported_sin (f64 (13845479108256198654))) (f64 (4606147583523844486)) &&
  out_eq64 (ported_cos (f64 (13845479108256198654))) (f64 (13825427224272937684)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2678 :
  out_eq64 (ported_sin (f64 (13849768068254709136))) (f64 (13830439569994816086)) &&
  out_eq64 (ported_cos (f64 (13849768068254709136))) (f64 (4594904077956890576)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2679 :
  out_eq64 (ported_sin (f64 (4608850808878231431))) (f64 (4607002266805102725)) &&
  out_eq64 (ported_cos (f64 (4608850808878231431))) (f64 (4596337818153682787)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2680 :
  out_eq64 (ported_sin (f64 (4627715381136994573))) (f64 (13819167608936733916)) &&
  out_eq64 (ported_cos (f64 (4627715381136994573))) (f64 (4607028713812674871)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2681 :
  out_eq64 (ported_sin (f64 (13841702306395755932))) (f64 (4600385383851372803)) &&
  out_eq64 (ported_cos (f64 (13841702306395755932))) (f64 (4606533507759739142)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2682 :
  out_eq64 (ported_sin (f64 (13848957497662288024))) (f64 (4607135622779865934)) &&
  out_eq64 (ported_cos (f64 (13848957497662288024))) (f64 (4592000086034657831)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2683 :
  out_eq64 (ported_sin (f64 (4625081357358683256))) (f64 (13814293159436732189)) &&
  out_eq64 (ported_cos (f64 (4625081357358683256))) (f64 (13830520437395762980)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2684 :
  out_eq64 (ported_sin (f64 (13840085425114372355))) (f64 (4606908639492218294)) &&
  out_eq64 (ported_cos (f64 (13840085425114372355))) (f64 (13821355511252697331)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2685 :
  out_eq64 (ported_sin (f64 (4694332900354104616))) (f64 (4602544261629899118)) &&
  out_eq64 (ported_cos (f64 (4694332900354104616))) (f64 (4606014141389334838)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2686 :
  out_eq64 (ported_sin (f64 (13849803480393684223))) (f64 (13830549225853582819)) &&
  out_eq64 (ported_cos (f64 (13849803480393684223))) (f64 (4585071136637773705)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2687 :
  out_eq64 (ported_sin (f64 (4626878306946987744))) (f64 (4580642591399691448)) &&
  out_eq64 (ported_cos (f64 (4626878306946987744))) (f64 (13830553108220633387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2688 :
  out_eq64 (ported_sin (f64 (4622315473561420152))) (f64 (13830496124418597019)) &&
  out_eq64 (ported_cos (f64 (4622315473561420152))) (f64 (13816223860920818929)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2689 :
  out_eq64 (ported_sin (f64 (4689265083727053106))) (f64 (4604082530350227710)) &&
  out_eq64 (ported_cos (f64 (4689265083727053106))) (f64 (4604974728164898306)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2690 :
  out_eq64 (ported_sin (f64 (4662910197543976434))) (f64 (13830545844853079184)) &&
  out_eq64 (ported_cos (f64 (4662910197543976434))) (f64 (13809832963645243977)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2691 :
  out_eq64 (ported_sin (f64 (13876504043540269262))) (f64 (13820485649414233367)) &&
  out_eq64 (ported_cos (f64 (13876504043540269262))) (f64 (4606960654146541710)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2692 :
  out_eq64 (ported_sin (f64 (13834102347255580990))) (f64 (13830343228430150336)) &&
  out_eq64 (ported_cos (f64 (13834102347255580990))) (f64 (13820296875524351319)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2693 :
  out_eq64 (ported_sin (f64 (4577007574857197710))) (f64 (4577007474244050819)) &&
  out_eq64 (ported_cos (f64 (4577007574857197710))) (f64 (4607181954375618339)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2694 :
  out_eq64 (ported_sin (f64 (13847489077690567649))) (f64 (13830540718960206710)) &&
  out_eq64 (ported_cos (f64 (13847489077690567649))) (f64 (4588117014597340386)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2695 :
  out_eq64 (ported_sin (f64 (13850619510885721397))) (f64 (4606840176701354554)) &&
  out_eq64 (ported_cos (f64 (13850619510885721397))) (f64 (13821962256531937183)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2696 :
  out_eq64 (ported_sin (f64 (4619651729027744428))) (f64 (4604584831444302749)) &&
  out_eq64 (ported_cos (f64 (4619651729027744428))) (f64 (4604503451029543306)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2697 :
  out_eq64 (ported_sin (f64 (13832552621646912188))) (f64 (13830481784164247854)) &&
  out_eq64 (ported_cos (f64 (13832552621646912188))) (f64 (4593735473927605621)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2698 :
  out_eq64 (ported_sin (f64 (13844861438015728287))) (f64 (13800562241118268985)) &&
  out_eq64 (ported_cos (f64 (13844861438015728287))) (f64 (13830553961782717804)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2699 :
  out_eq64 (ported_sin (f64 (4626331544434847079))) (f64 (4606509508468019979)) &&
  out_eq64 (ported_cos (f64 (4626331544434847079))) (f64 (4600503681558974629)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2700 :
  out_eq64 (ported_sin (f64 (13844047325343879734))) (f64 (13830478342101419438)) &&
  out_eq64 (ported_cos (f64 (13844047325343879734))) (f64 (13817213979026456920)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2701 :
  out_eq64 (ported_sin (f64 (13745345995862314406))) (f64 (13745345995862310967)) &&
  out_eq64 (ported_cos (f64 (13745345995862314406))) (f64 (4607182418799998300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2702 :
  out_eq64 (ported_sin (f64 (13760856681619069698))) (f64 (13760856681618451125)) &&
  out_eq64 (ported_cos (f64 (13760856681619069698))) (f64 (4607182418797582058)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2703 :
  out_eq64 (ported_sin (f64 (13846176707535168157))) (f64 (4604734167627676390)) &&
  out_eq64 (ported_cos (f64 (13846176707535168157))) (f64 (4604348536195747894)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2704 :
  out_eq64 (ported_sin (f64 (4620786973160599090))) (f64 (4606746011195759965)) &&
  out_eq64 (ported_cos (f64 (4620786973160599090))) (f64 (13822583031791077994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2705 :
  out_eq64 (ported_sin (f64 (4626675214134231156))) (f64 (4604240865042193876)) &&
  out_eq64 (ported_cos (f64 (4626675214134231156))) (f64 (13828205903644074964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2706 :
  out_eq64 (ported_sin (f64 (4624522294545442835))) (f64 (4605265136606304963)) &&
  out_eq64 (ported_cos (f64 (4624522294545442835))) (f64 (13827102678479637448)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2707 :
  out_eq64 (ported_sin (f64 (4495372042588793854))) (f64 (4495372042588793853)) &&
  out_eq64 (ported_cos (f64 (4495372042588793854))) (f64 (4607182418800017402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2708 :
  out_eq64 (ported_sin (f64 (4616960782285098926))) (f64 (13830551060526820604)) &&
  out_eq64 (ported_cos (f64 (4616960782285098926))) (f64 (13806942364686650715)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2709 :
  out_eq64 (ported_sin (f64 (13849628312788995601))) (f64 (13828682713509315591)) &&
  out_eq64 (ported_cos (f64 (13849628312788995601))) (f64 (4603672026823730843)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2710 :
  out_eq64 (ported_sin (f64 (4616098895141274967))) (f64 (13828121257931106944)) &&
  out_eq64 (ported_cos (f64 (4616098895141274967))) (f64 (13827704540077478242)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2711 :
  out_eq64 (ported_sin (f64 (4618450488366759034))) (f64 (13821937649503773478)) &&
  out_eq64 (ported_cos (f64 (4618450488366759034))) (f64 (4606843659266564899)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2712 :
  out_eq64 (ported_sin (f64 (4568421641775432614))) (f64 (4568421634029462263)) &&
  out_eq64 (ported_cos (f64 (4568421641775432614))) (f64 (4607182385445255584)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2713 :
  out_eq64 (ported_sin (f64 (4626673921372242256))) (f64 (4604271382883596572)) &&
  out_eq64 (ported_cos (f64 (4626673921372242256))) (f64 (13828177975136895759)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2714 :
  out_eq64 (ported_sin (f64 (13875667939217454531))) (f64 (4607035918463556984)) &&
  out_eq64 (ported_cos (f64 (13875667939217454531))) (f64 (4595639685416838866)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2715 :
  out_eq64 (ported_sin (f64 (13737649909445006144))) (f64 (13737649909445005704)) &&
  out_eq64 (ported_cos (f64 (13737649909445006144))) (f64 (4607182418800015483)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2716 :
  out_eq64 (ported_sin (f64 (4645377782220126633))) (f64 (4605643962700239499)) &&
  out_eq64 (ported_cos (f64 (4645377782220126633))) (f64 (13826581887876118648)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2717 :
  out_eq64 (ported_sin (f64 (13850015196998971143))) (f64 (13828330253565311420)) &&
  out_eq64 (ported_cos (f64 (13850015196998971143))) (f64 (13827473518955043557)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2718 :
  out_eq64 (ported_sin (f64 (13822140934365277900))) (f64 (13822073188102521619)) &&
  out_eq64 (ported_cos (f64 (13822140934365277900))) (f64 (4606824242152782216)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2719 :
  out_eq64 (ported_sin (f64 (4625161479496049276))) (f64 (13820727997746640558)) &&
  out_eq64 (ported_cos (f64 (4625161479496049276))) (f64 (13830318772244473050)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2720 :
  out_eq64 (ported_sin (f64 (13849198175897394659))) (f64 (4603362843928545715)) &&
  out_eq64 (ported_cos (f64 (13849198175897394659))) (f64 (4605538519870043599)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2721 :
  out_eq64 (ported_sin (f64 (13729136050815223306))) (f64 (13729136050815223271)) &&
  out_eq64 (ported_cos (f64 (13729136050815223306))) (f64 (4607182418800017268)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2722 :
  out_eq64 (ported_sin (f64 (4624404677076939347))) (f64 (4606263225779662365)) &&
  out_eq64 (ported_cos (f64 (4624404677076939347))) (f64 (13824971782293166553)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2723 :
  out_eq64 (ported_sin (f64 (4618998435316847900))) (f64 (4596733032391232648)) &&
  out_eq64 (ported_cos (f64 (4618998435316847900))) (f64 (4606981626327237815)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2724 :
  out_eq64 (ported_sin (f64 (13839104066602803700))) (f64 (4603663447582925869)) &&
  out_eq64 (ported_cos (f64 (13839104066602803700))) (f64 (13828689314326264046)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2725 :
  out_eq64 (ported_sin (f64 (13848157888800584684))) (f64 (13824683833142349846)) &&
  out_eq64 (ported_cos (f64 (13848157888800584684))) (f64 (13829704251231158708)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2726 :
  out_eq64 (ported_sin (f64 (13844712124419334276))) (f64 (13821947654401033940)) &&
  out_eq64 (ported_cos (f64 (13844712124419334276))) (f64 (13830214282431505323)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2727 :
  out_eq64 (ported_sin (f64 (13849586325576417151))) (f64 (13827786560867439341)) &&
  out_eq64 (ported_cos (f64 (13849586325576417151))) (f64 (4604671427529773975)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2728 :
  out_eq64 (ported_sin (f64 (13830720621698294320))) (f64 (13829300913887043489)) &&
  out_eq64 (ported_cos (f64 (13830720621698294320))) (f64 (4602758933540393365)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2729 :
  out_eq64 (ported_sin (f64 (4621815650275739424))) (f64 (13826400721114016204)) &&
  out_eq64 (ported_cos (f64 (4621815650275739424))) (f64 (13829134977974076486)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2730 :
  out_eq64 (ported_sin (f64 (13862551339014040673))) (f64 (4585124910259326272)) &&
  out_eq64 (ported_cos (f64 (13862551339014040673))) (f64 (13830549110647476778)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2731 :
  out_eq64 (ported_sin (f64 (13779250516188926768))) (f64 (13779250516002830014)) &&
  out_eq64 (ported_cos (f64 (13779250516188926768))) (f64 (4607182418105728882)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2732 :
  out_eq64 (ported_sin (f64 (13844888000094834238))) (f64 (4585450351733943804)) &&
  out_eq64 (ported_cos (f64 (13844888000094834238))) (f64 (13830548386602337207)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2733 :
  out_eq64 (ported_sin (f64 (4613644542651951475))) (f64 (4598508445409539754)) &&
  out_eq64 (ported_cos (f64 (4613644542651951475))) (f64 (13830223714099221682)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2734 :
  out_eq64 (ported_sin (f64 (13845866806868960830))) (f64 (4606994502934105643)) &&
  out_eq64 (ported_cos (f64 (13845866806868960830))) (f64 (4596489090072612409)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2735 :
  out_eq64 (ported_sin (f64 (13849869892551251323))) (f64 (13830371559342976831)) &&
  out_eq64 (ported_cos (f64 (13849869892551251323))) (f64 (13819763702746915789)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2736 :
  out_eq64 (ported_sin (f64 (4603137825466471145))) (f64 (4602890536603177728)) &&
  out_eq64 (ported_cos (f64 (4603137825466471145))) (f64 (4605849554920934141)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2737 :
  out_eq64 (ported_sin (f64 (13876595358106855898))) (f64 (13829156857617321870)) &&
  out_eq64 (ported_cos (f64 (13876595358106855898))) (f64 (13826366344252409245)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2738 :
  out_eq64 (ported_sin (f64 (13844682913775405192))) (f64 (13822840088947458141)) &&
  out_eq64 (ported_cos (f64 (13844682913775405192))) (f64 (13830075443893617951)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2739 :
  out_eq64 (ported_sin (f64 (13729042295148115272))) (f64 (13729042295148115239)) &&
  out_eq64 (ported_cos (f64 (13729042295148115272))) (f64 (4607182418800017272)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2740 :
  out_eq64 (ported_sin (f64 (13906438746525640349))) (f64 (13821914358164496040)) &&
  out_eq64 (ported_cos (f64 (13906438746525640349))) (f64 (4606846938256267404)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2741 :
  out_eq64 (ported_sin (f64 (4622608048345868439))) (f64 (13829822781375590163)) &&
  out_eq64 (ported_cos (f64 (4622608048345868439))) (f64 (4600783673009342874)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2742 :
  out_eq64 (ported_sin (f64 (4623933237734581690))) (f64 (4606534077274850256)) &&
  out_eq64 (ported_cos (f64 (4623933237734581690))) (f64 (4600382547088230554)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2743 :
  out_eq64 (ported_sin (f64 (13750586134094590226))) (f64 (13750586134094569225)) &&
  out_eq64 (ported_cos (f64 (13750586134094590226))) (f64 (4607182418799916076)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2744 :
  out_eq64 (ported_sin (f64 (13850739582693441547))) (f64 (4607081234535116415)) &&
  out_eq64 (ported_cos (f64 (13850739582693441547))) (f64 (4594553237709138950)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2745 :
  out_eq64 (ported_sin (f64 (13841358520405031266))) (f64 (4603889498641390408)) &&
  out_eq64 (ported_cos (f64 (13841358520405031266))) (f64 (4605137737252709650)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2746 :
  out_eq64 (ported_sin (f64 (4627692025010181098))) (f64 (13821813629534287267)) &&
  out_eq64 (ported_cos (f64 (4627692025010181098))) (f64 (4606860924950020005)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2747 :
  out_eq64 (ported_sin (f64 (13851045965114478831))) (f64 (4599547821081400899)) &&
  out_eq64 (ported_cos (f64 (13851045965114478831))) (f64 (4606689748503835530)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2748 :
  out_eq64 (ported_sin (f64 (4624405122798952895))) (f64 (4606260084653189775)) &&
  out_eq64 (ported_cos (f64 (4624405122798952895))) (f64 (13824984587348238169)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2749 :
  out_eq64 (ported_sin (f64 (4624389948073349638))) (f64 (4606364161374179764)) &&
  out_eq64 (ported_cos (f64 (4624389948073349638))) (f64 (13824545888477299702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2750 :
  out_eq64 (ported_sin (f64 (4627356040313634274))) (f64 (13830500848182345445)) &&
  out_eq64 (ported_cos (f64 (4627356040313634274))) (f64 (4592514343406868295)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2751 :
  out_eq64 (ported_sin (f64 (4627302302180543916))) (f64 (13830524367219742574)) &&
  out_eq64 (ported_cos (f64 (4627302302180543916))) (f64 (13813921324867229786)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2752 :
  out_eq64 (ported_sin (f64 (13916310802437189864))) (f64 (13822625573044718456)) &&
  out_eq64 (ported_cos (f64 (13916310802437189864))) (f64 (13830111145183636442)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2753 :
  out_eq64 (ported_sin (f64 (4677624854754464801))) (f64 (4592719078415613593)) &&
  out_eq64 (ported_cos (f64 (4677624854754464801))) (f64 (4607125969642183227)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2754 :
  out_eq64 (ported_sin (f64 (13840129901643444234))) (f64 (4606988862937601230)) &&
  out_eq64 (ported_cos (f64 (13840129901643444234))) (f64 (13819969004384360201)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2755 :
  out_eq64 (ported_sin (f64 (4552943507738590581))) (f64 (4552943507654819052)) &&
  out_eq64 (ported_cos (f64 (4552943507738590581))) (f64 (4607182418543120769)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2756 :
  out_eq64 (ported_sin (f64 (4607666155681636991))) (f64 (4606232560369671246)) &&
  out_eq64 (ported_cos (f64 (4607666155681636991))) (f64 (4601723674874039073)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2757 :
  out_eq64 (ported_sin (f64 (4620300724402029607))) (f64 (4606998218006596755)) &&
  out_eq64 (ported_cos (f64 (4620300724402029607))) (f64 (4596417115755373069)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2758 :
  out_eq64 (ported_sin (f64 (4585452189473256814))) (f64 (4585451000686446161)) &&
  out_eq64 (ported_cos (f64 (4585452189473256814))) (f64 (4607176348257789698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2759 :
  out_eq64 (ported_sin (f64 (4622752757846328314))) (f64 (13828646806788495989)) &&
  out_eq64 (ported_cos (f64 (4622752757846328314))) (f64 (4603718325416225902)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2760 :
  out_eq64 (ported_sin (f64 (4627421439371794429))) (f64 (13830034319300141091)) &&
  out_eq64 (ported_cos (f64 (4627421439371794429))) (f64 (4599704662846492400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2761 :
  out_eq64 (ported_sin (f64 (4622631540084950129))) (f64 (13829667228152915227)) &&
  out_eq64 (ported_cos (f64 (4622631540084950129))) (f64 (4601467951657208348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2762 :
  out_eq64 (ported_sin (f64 (13842617136698714756))) (f64 (13824563609978733687)) &&
  out_eq64 (ported_cos (f64 (13842617136698714756))) (f64 (4606360096719633029)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2763 :
  out_eq64 (ported_sin (f64 (4608902003019733850))) (f64 (4607022071527861964)) &&
  out_eq64 (ported_cos (f64 (4608902003019733850))) (f64 (4595936001865958148)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2764 :
  out_eq64 (ported_sin (f64 (4625619639852086808))) (f64 (13830330609579193239)) &&
  out_eq64 (ported_cos (f64 (4625619639852086808))) (f64 (4597150346112079022)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2765 :
  out_eq64 (ported_sin (f64 (13848572712910143987))) (f64 (4599094033569063667)) &&
  out_eq64 (ported_cos (f64 (13848572712910143987))) (f64 (13830136726463073645)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2766 :
  out_eq64 (ported_sin (f64 (4627750725831658156))) (f64 (13812093372179254746)) &&
  out_eq64 (ported_cos (f64 (4627750725831658156))) (f64 (4607166514169551484)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2767 :
  out_eq64 (ported_sin (f64 (13840896937007488353))) (f64 (4606191098640384078)) &&
  out_eq64 (ported_cos (f64 (13840896937007488353))) (f64 (4601887536360329770)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2768 :
  out_eq64 (ported_sin (f64 (4534456151668152251))) (f64 (4534456151667874934)) &&
  out_eq64 (ported_cos (f64 (4534456151668152251))) (f64 (4607182418799118741)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2769 :
  out_eq64 (ported_sin (f64 (13845426711305160529))) (f64 (4605723485767308877)) &&
  out_eq64 (ported_cos (f64 (13845426711305160529))) (f64 (13826461858668387931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2770 :
  out_eq64 (ported_sin (f64 (13849224020972353128))) (f64 (4602652863403231893)) &&
  out_eq64 (ported_cos (f64 (13849224020972353128))) (f64 (4605983161321373951)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2771 :
  out_eq64 (ported_sin (f64 (13849916241498720955))) (f64 (13829956168969952457)) &&
  out_eq64 (ported_cos (f64 (13849916241498720955))) (f64 (13823499608385381608)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2772 :
  out_eq64 (ported_sin (f64 (13845292936020197208))) (f64 (4604354454781030236)) &&
  out_eq64 (ported_cos (f64 (13845292936020197208))) (f64 (13828100628838409830)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2773 :
  out_eq64 (ported_sin (f64 (13885988633103738532))) (f64 (13830548232017140886)) &&
  out_eq64 (ported_cos (f64 (13885988633103738532))) (f64 (4585517270132594077)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2774 :
  out_eq64 (ported_sin (f64 (13848270980634110918))) (f64 (13821002425273082515)) &&
  out_eq64 (ported_cos (f64 (13848270980634110918))) (f64 (13830302478200154534)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2775 :
  out_eq64 (ported_sin (f64 (4625391849808639620))) (f64 (13829052362322126250)) &&
  out_eq64 (ported_cos (f64 (4625391849808639620))) (f64 (13826527519798011820)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2776 :
  out_eq64 (ported_sin (f64 (4621192330246568440))) (f64 (4602792045323249628)) &&
  out_eq64 (ported_cos (f64 (4621192330246568440))) (f64 (13829281243609147461)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2777 :
  out_eq64 (ported_sin (f64 (13846882300164668501))) (f64 (13824679317968268274)) &&
  out_eq64 (ported_cos (f64 (13846882300164668501))) (f64 (4606333271269870968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2778 :
  out_eq64 (ported_sin (f64 (4615239756476903323))) (f64 (13824660980629963277)) &&
  out_eq64 (ported_cos (f64 (4615239756476903323))) (f64 (13829709592629829151)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2779 :
  out_eq64 (ported_sin (f64 (4617606580586959303))) (f64 (13829244292932944054)) &&
  out_eq64 (ported_cos (f64 (4617606580586959303))) (f64 (4602853388741226387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2780 :
  out_eq64 (ported_sin (f64 (4589585014274230427))) (f64 (4589581190955787666)) &&
  out_eq64 (ported_cos (f64 (4589585014274230427))) (f64 (4607161426187632879)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2781 :
  out_eq64 (ported_sin (f64 (13844938894679782643))) (f64 (4593735628806038087)) &&
  out_eq64 (ported_cos (f64 (13844938894679782643))) (f64 (13830481779215663358)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2782 :
  out_eq64 (ported_sin (f64 (4626488597642879003))) (f64 (4607054137620535300)) &&
  out_eq64 (ported_cos (f64 (4626488597642879003))) (f64 (13818599036897642824)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2783 :
  out_eq64 (ported_sin (f64 (4617149077514568723))) (f64 (13830466602714812793)) &&
  out_eq64 (ported_cos (f64 (4617149077514568723))) (f64 (4594187820656245183)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2784 :
  out_eq64 (ported_sin (f64 (4620948369827973841))) (f64 (4605612945275189964)) &&
  out_eq64 (ported_cos (f64 (4620948369827973841))) (f64 (13826627598355195466)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2785 :
  out_eq64 (ported_sin (f64 (13862610236139007660))) (f64 (4607097267429231788)) &&
  out_eq64 (ported_cos (f64 (13862610236139007660))) (f64 (4594110408330362558)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2786 :
  out_eq64 (ported_sin (f64 (4685169401242259918))) (f64 (4597394741467177807)) &&
  out_eq64 (ported_cos (f64 (4685169401242259918))) (f64 (4606944467208686212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2787 :
  out_eq64 (ported_sin (f64 (4658799295035794252))) (f64 (4606854347830262431)) &&
  out_eq64 (ported_cos (f64 (4658799295035794252))) (f64 (13821861278853070517)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2788 :
  out_eq64 (ported_sin (f64 (4623779079632153636))) (f64 (4605315204366168189)) &&
  out_eq64 (ported_cos (f64 (4623779079632153636))) (f64 (4603666144346440767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2789 :
  out_eq64 (ported_sin (f64 (13849318960808913316))) (f64 (4595782706339502481)) &&
  out_eq64 (ported_cos (f64 (13849318960808913316))) (f64 (4607029315148115066)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2790 :
  out_eq64 (ported_sin (f64 (13845711081499678621))) (f64 (4607159083321340100)) &&
  out_eq64 (ported_cos (f64 (13845711081499678621))) (f64 (13813220001125859622)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2791 :
  out_eq64 (ported_sin (f64 (4547870322346314162))) (f64 (4547870322329175733)) &&
  out_eq64 (ported_cos (f64 (4547870322346314162))) (f64 (4607182418743827954)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2792 :
  out_eq64 (ported_sin (f64 (4623484327634469218))) (f64 (4600547745507717655)) &&
  out_eq64 (ported_cos (f64 (4623484327634469218))) (f64 (4606500444024705829)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2793 :
  out_eq64 (ported_sin (f64 (4520958203833689053))) (f64 (4520958203833684700)) &&
  out_eq64 (ported_cos (f64 (4520958203833689053))) (f64 (4607182418800003323)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2794 :
  out_eq64 (ported_sin (f64 (13760144655856743131))) (f64 (13760144655856297793)) &&
  out_eq64 (ported_cos (f64 (13760144655856743131))) (f64 (4607182418798061144)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2795 :
  out_eq64 (ported_sin (f64 (4664454420471462916))) (f64 (4607109963303302533)) &&
  out_eq64 (ported_cos (f64 (4664454420471462916))) (f64 (13817100745502162685)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2796 :
  out_eq64 (ported_sin (f64 (13838288646557071481))) (f64 (4598875987041271097)) &&
  out_eq64 (ported_cos (f64 (13838288646557071481))) (f64 (13830170381073041453)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2797 :
  out_eq64 (ported_sin (f64 (13847701241925131451))) (f64 (13830092538995657498)) &&
  out_eq64 (ported_cos (f64 (13847701241925131451))) (f64 (13822738490844312711)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2798 :
  out_eq64 (ported_sin (f64 (13845337958385407613))) (f64 (4604858256306370447)) &&
  out_eq64 (ported_cos (f64 (13845337958385407613))) (f64 (13827586019358181354)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2799 :
  out_eq64 (ported_sin (f64 (4623171657539210015))) (f64 (13818414402680158201)) &&
  out_eq64 (ported_cos (f64 (4623171657539210015))) (f64 (4607061888912828196)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2800 :
  out_eq64 (ported_sin (f64 (4627081595085084504))) (f64 (13827383726870461651)) &&
  out_eq64 (ported_cos (f64 (4627081595085084504))) (f64 (13828407668258143941)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2801 :
  out_eq64 (ported_sin (f64 (4626221616055987589))) (f64 (4604581499739389675)) &&
  out_eq64 (ported_cos (f64 (4626221616055987589))) (f64 (4604506823804002546)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2802 :
  out_eq64 (ported_sin (f64 (13847716384281060431))) (f64 (13830012866627607514)) &&
  out_eq64 (ported_cos (f64 (13847716384281060431))) (f64 (13823196081299555003)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2803 :
  out_eq64 (ported_sin (f64 (4627242047097663685))) (f64 (13830163189886722117)) &&
  out_eq64 (ported_cos (f64 (4627242047097663685))) (f64 (13822295448302393110)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2804 :
  out_eq64 (ported_sin (f64 (13846956549767959878))) (f64 (13826404807083829497)) &&
  out_eq64 (ported_cos (f64 (13846956549767959878))) (f64 (4605760325989430093)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2805 :
  out_eq64 (ported_sin (f64 (13849723029503307633))) (f64 (13830097498663519048)) &&
  out_eq64 (ported_cos (f64 (13849723029503307633))) (f64 (4599336598523560988)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2806 :
  out_eq64 (ported_sin (f64 (4612111283341088396))) (f64 (4605516128165844273)) &&
  out_eq64 (ported_cos (f64 (4612111283341088396))) (f64 (13826766518707991844)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2807 :
  out_eq64 (ported_sin (f64 (13851053995987915768))) (f64 (4599059632667544650)) &&
  out_eq64 (ported_cos (f64 (13851053995987915768))) (f64 (4606770099885748836)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2808 :
  out_eq64 (ported_sin (f64 (4627407265982699548))) (f64 (13830175391716139066)) &&
  out_eq64 (ported_cos (f64 (4627407265982699548))) (f64 (4598842662126939488)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2809 :
  out_eq64 (ported_sin (f64 (4625926707751074212))) (f64 (13821613224356100046)) &&
  out_eq64 (ported_cos (f64 (4625926707751074212))) (f64 (4606887819699062299)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2810 :
  out_eq64 (ported_sin (f64 (13839844625729574682))) (f64 (4606241898125518189)) &&
  out_eq64 (ported_cos (f64 (13839844625729574682))) (f64 (13825058227278373285)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2811 :
  out_eq64 (ported_sin (f64 (4674944187290641506))) (f64 (13830234920406456507)) &&
  out_eq64 (ported_cos (f64 (4674944187290641506))) (f64 (4598427303896655628)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2812 :
  out_eq64 (ported_sin (f64 (13837780694852369192))) (f64 (4589524773886057416)) &&
  out_eq64 (ported_cos (f64 (13837780694852369192))) (f64 (13830533942581116433)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2813 :
  out_eq64 (ported_sin (f64 (4622805877319916907))) (f64 (13828092957400816281)) &&
  out_eq64 (ported_cos (f64 (4622805877319916907))) (f64 (4604362580600136808)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2814 :
  out_eq64 (ported_sin (f64 (4623963946649372190))) (f64 (4606704593368092704)) &&
  out_eq64 (ported_cos (f64 (4623963946649372190))) (f64 (4599461065696307493)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2815 :
  out_eq64 (ported_sin (f64 (13849240696061648136))) (f64 (4601712535462369522)) &&
  out_eq64 (ported_cos (f64 (13849240696061648136))) (f64 (4606235340990782531)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2816 :
  out_eq64 (ported_sin (f64 (13848991239613045827))) (f64 (4606961661010015243)) &&
  out_eq64 (ported_cos (f64 (13848991239613045827))) (f64 (4597095778915846768)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2817 :
  out_eq64 (ported_sin (f64 (4620244201132910150))) (f64 (4606896159054057976)) &&
  out_eq64 (ported_cos (f64 (4620244201132910150))) (f64 (4598177106572543582)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2818 :
  out_eq64 (ported_sin (f64 (13845154415353173447))) (f64 (4602465215286917643)) &&
  out_eq64 (ported_cos (f64 (13845154415353173447))) (f64 (13829408414618542078)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2819 :
  out_eq64 (ported_sin (f64 (13849021677860755230))) (f64 (4606696430858342377)) &&
  out_eq64 (ported_cos (f64 (13849021677860755230))) (f64 (4599508946762509834)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2820 :
  out_eq64 (ported_sin (f64 (13850367670285247460))) (f64 (4600678958993281414)) &&
  out_eq64 (ported_cos (f64 (13850367670285247460))) (f64 (13829845083717204926)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2821 :
  out_eq64 (ported_sin (f64 (4608320940149065926))) (f64 (4606730839169671907)) &&
  out_eq64 (ported_cos (f64 (4608320940149065926))) (f64 (4599304030150573791)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2822 :
  out_eq64 (ported_sin (f64 (4514377411266305787))) (f64 (4514377411266305326)) &&
  out_eq64 (ported_cos (f64 (4514377411266305787))) (f64 (4607182418800015421)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2823 :
  out_eq64 (ported_sin (f64 (4615290279603270257))) (f64 (13825025305673357638)) &&
  out_eq64 (ported_cos (f64 (4615290279603270257))) (f64 (13829622091297509350)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2824 :
  out_eq64 (ported_sin (f64 (13846696698234640725))) (f64 (13815804445851856162)) &&
  out_eq64 (ported_cos (f64 (13846696698234640725))) (f64 (4607129927817830390)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2825 :
  out_eq64 (ported_sin (f64 (13847812782781063484))) (f64 (13829364858913808660)) &&
  out_eq64 (ported_cos (f64 (13847812782781063484))) (f64 (13825991221659625155)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2826 :
  out_eq64 (ported_sin (f64 (13777591625042632575))) (f64 (13777591624957354525)) &&
  out_eq64 (ported_cos (f64 (13777591625042632575))) (f64 (4607182418387344812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2827 :
  out_eq64 (ported_sin (f64 (13822972688588598527))) (f64 (13822866223305337685)) &&
  out_eq64 (ported_cos (f64 (13822972688588598527))) (f64 (4606698955120586421)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2828 :
  out_eq64 (ported_sin (f64 (13848053672488580510))) (f64 (13826803527451905764)) &&
  out_eq64 (ported_cos (f64 (13848053672488580510))) (f64 (13828861711475042647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2829 :
  out_eq64 (ported_sin (f64 (13846624737606994654))) (f64 (4581368235593359833)) &&
  out_eq64 (ported_cos (f64 (13846624737606994654))) (f64 (4607180650526726273)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2830 :
  out_eq64 (ported_sin (f64 (13844317590802644541))) (f64 (13829010300888446045)) &&
  out_eq64 (ported_cos (f64 (13844317590802644541))) (f64 (13826590331392441421)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2831 :
  out_eq64 (ported_sin (f64 (4625743397309180965))) (f64 (13828645816246580603)) &&
  out_eq64 (ported_cos (f64 (4625743397309180965))) (f64 (4603719593858024580)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2832 :
  out_eq64 (ported_sin (f64 (13846921914156265627))) (f64 (13825807614668707737)) &&
  out_eq64 (ported_cos (f64 (13846921914156265627))) (f64 (4606044647663874204)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2833 :
  out_eq64 (ported_sin (f64 (13845053468431717270))) (f64 (4599520009544737946)) &&
  out_eq64 (ported_cos (f64 (13845053468431717270))) (f64 (13830066571108865226)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2834 :
  out_eq64 (ported_sin (f64 (4626278378808653607))) (f64 (4605719882959524237)) &&
  out_eq64 (ported_cos (f64 (4626278378808653607))) (f64 (4603095350882986528)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2835 :
  out_eq64 (ported_sin (f64 (13844292869149576168))) (f64 (13829224498702507825)) &&
  out_eq64 (ported_cos (f64 (13844292869149576168))) (f64 (13826257839065072859)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2836 :
  out_eq64 (ported_sin (f64 (4618342831381632303))) (f64 (13823570497260865149)) &&
  out_eq64 (ported_cos (f64 (4618342831381632303))) (f64 (4606570440014392107)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2837 :
  out_eq64 (ported_sin (f64 (13845042958393623799))) (f64 (4599200904794310240)) &&
  out_eq64 (ported_cos (f64 (13845042958393623799))) (f64 (13830119676746926163)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2838 :
  out_eq64 (ported_sin (f64 (4617853680932193693))) (f64 (13828041173659175719)) &&
  out_eq64 (ported_cos (f64 (4617853680932193693))) (f64 (4604416908182677730)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2839 :
  out_eq64 (ported_sin (f64 (4607830075442311582))) (f64 (4606373728841662453)) &&
  out_eq64 (ported_cos (f64 (4607830075442311582))) (f64 (4601131937265493328)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2840 :
  out_eq64 (ported_sin (f64 (13842036074089308417))) (f64 (4590814940194319038)) &&
  out_eq64 (ported_cos (f64 (13842036074089308417))) (f64 (4607149547486715575)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2841 :
  out_eq64 (ported_sin (f64 (13918182696280384744))) (f64 (13820919327646973062)) &&
  out_eq64 (ported_cos (f64 (13918182696280384744))) (f64 (4606935435155114762)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2842 :
  out_eq64 (ported_sin (f64 (4623135385575362817))) (f64 (13820690970690197815)) &&
  out_eq64 (ported_cos (f64 (4623135385575362817))) (f64 (4606948890466766075)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2843 :
  out_eq64 (ported_sin (f64 (4626781401592197809))) (f64 (4600044162879234037)) &&
  out_eq64 (ported_cos (f64 (4626781401592197809))) (f64 (13829972059808210396)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2844 :
  out_eq64 (ported_sin (f64 (13838910043832058665))) (f64 (4603028464548870638)) &&
  out_eq64 (ported_cos (f64 (13838910043832058665))) (f64 (13829135118506712730)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2845 :
  out_eq64 (ported_sin (f64 (13845651666523574004))) (f64 (4607040834986260137)) &&
  out_eq64 (ported_cos (f64 (13845651666523574004))) (f64 (13818903076890303643)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2846 :
  out_eq64 (ported_sin (f64 (13836612913518069369))) (f64 (13824897087162024208)) &&
  out_eq64 (ported_cos (f64 (13836612913518069369))) (f64 (13829653460579231569)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2847 :
  out_eq64 (ported_sin (f64 (13800882972401867828))) (f64 (13800882843539068876)) &&
  out_eq64 (ported_cos (f64 (13800882972401867828))) (f64 (4607181871074243324)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2848 :
  out_eq64 (ported_sin (f64 (13839335778643663611))) (f64 (4604368044263942859)) &&
  out_eq64 (ported_cos (f64 (13839335778643663611))) (f64 (13828087788520490176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2849 :
  out_eq64 (ported_sin (f64 (4693187159138877024))) (f64 (13830181411625792026)) &&
  out_eq64 (ported_cos (f64 (4693187159138877024))) (f64 (13822174349494892540)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2850 :
  out_eq64 (ported_sin (f64 (4624500284534917989))) (f64 (4605476866903894272)) &&
  out_eq64 (ported_cos (f64 (4624500284534917989))) (f64 (13826821304585743702)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2851 :
  out_eq64 (ported_sin (f64 (13837216775004784789))) (f64 (13819094055800608274)) &&
  out_eq64 (ported_cos (f64 (13837216775004784789))) (f64 (13830404172187517659)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2852 :
  out_eq64 (ported_sin (f64 (4626818889878644949))) (f64 (4597325257641123673)) &&
  out_eq64 (ported_cos (f64 (4626818889878644949))) (f64 (13830320559987640663)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2853 :
  out_eq64 (ported_sin (f64 (13850624208539873039))) (f64 (4606880012358515785)) &&
  out_eq64 (ported_cos (f64 (13850624208539873039))) (f64 (13821672358747612895)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2854 :
  out_eq64 (ported_sin (f64 (4657742297702221175))) (f64 (13830233718186872406)) &&
  out_eq64 (ported_cos (f64 (4657742297702221175))) (f64 (4598436080030329749)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2855 :
  out_eq64 (ported_sin (f64 (4625796792648890500))) (f64 (13827473014294610112)) &&
  out_eq64 (ported_cos (f64 (4625796792648890500))) (f64 (4604958657596124345)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2856 :
  out_eq64 (ported_sin (f64 (4626792077839130728))) (f64 (4599400633038846993)) &&
  out_eq64 (ported_cos (f64 (4626792077839130728))) (f64 (13830086825509768940)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2857 :
  out_eq64 (ported_sin (f64 (4653134867922453305))) (f64 (4605076684449960478)) &&
  out_eq64 (ported_cos (f64 (4653134867922453305))) (f64 (4603963087942538131)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2858 :
  out_eq64 (ported_sin (f64 (4627302300313126009))) (f64 (13830524362339223676)) &&
  out_eq64 (ported_cos (f64 (4627302300313126009))) (f64 (13813921801329134480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2859 :
  out_eq64 (ported_sin (f64 (4626913348020079975))) (f64 (13815745783813042087)) &&
  out_eq64 (ported_cos (f64 (4626913348020079975))) (f64 (13830502756758256050)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2860 :
  out_eq64 (ported_sin (f64 (4612890395981922324))) (f64 (4603311067488430982)) &&
  out_eq64 (ported_cos (f64 (4612890395981922324))) (f64 (13828946763432240361)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2861 :
  out_eq64 (ported_sin (f64 (4625257698597287429))) (f64 (13825811616424361500)) &&
  out_eq64 (ported_cos (f64 (4625257698597287429))) (f64 (13829415570025044276)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2862 :
  out_eq64 (ported_sin (f64 (13848854022837296285))) (f64 (4606866495629310765)) &&
  out_eq64 (ported_cos (f64 (13848854022837296285))) (f64 (13821772867466105838)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2863 :
  out_eq64 (ported_sin (f64 (4621583790051319906))) (f64 (13818180356399110093)) &&
  out_eq64 (ported_cos (f64 (4621583790051319906))) (f64 (13830443397554231458)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2864 :
  out_eq64 (ported_sin (f64 (4624280436893986579))) (f64 (4606934819709819702)) &&
  out_eq64 (ported_cos (f64 (4624280436893986579))) (f64 (13820929615772023290)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2865 :
  out_eq64 (ported_sin (f64 (4625833123600063646))) (f64 (13826550588586529567)) &&
  out_eq64 (ported_cos (f64 (4625833123600063646))) (f64 (4605664966233006685)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2866 :
  out_eq64 (ported_sin (f64 (13713558360062523158))) (f64 (13713558360062523158)) &&
  out_eq64 (ported_cos (f64 (13713558360062523158))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2867 :
  out_eq64 (ported_sin (f64 (4551728747240615587))) (f64 (4551728747186933644)) &&
  out_eq64 (ported_cos (f64 (4551728747240615587))) (f64 (4607182418609070362)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2868 :
  out_eq64 (ported_sin (f64 (4490244805117919845))) (f64 (4490244805117919845)) &&
  out_eq64 (ported_cos (f64 (4490244805117919845))) (f64 (4607182418800017407)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2869 :
  out_eq64 (ported_sin (f64 (13849357229745613598))) (f64 (4587174039903938527)) &&
  out_eq64 (ported_cos (f64 (13849357229745613598))) (f64 (4607171747129582646)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2870 :
  out_eq64 (ported_sin (f64 (4596054004542288548))) (f64 (4596012158531761543)) &&
  out_eq64 (ported_cos (f64 (4596054004542288548))) (f64 (4607018408966975090)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2871 :
  out_eq64 (ported_sin (f64 (4620448504442911458))) (f64 (4607159513920492403)) &&
  out_eq64 (ported_cos (f64 (4620448504442911458))) (f64 (4589799978239555273)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2872 :
  out_eq64 (ported_sin (f64 (13842422676450996889))) (f64 (13821638453311167887)) &&
  out_eq64 (ported_cos (f64 (13842422676450996889))) (f64 (4606884501927142650)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2873 :
  out_eq64 (ported_sin (f64 (13817988863381170984))) (f64 (13817968116317112720)) &&
  out_eq64 (ported_cos (f64 (13817988863381170984))) (f64 (4607079608871126928)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2874 :
  out_eq64 (ported_sin (f64 (4612902792230864858))) (f64 (4603270255287094229)) &&
  out_eq64 (ported_cos (f64 (4612902792230864858))) (f64 (13828974924217355694)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2875 :
  out_eq64 (ported_sin (f64 (4610024380286098507))) (f64 (4607166077626524693)) &&
  out_eq64 (ported_cos (f64 (4610024380286098507))) (f64 (13812209954215353402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2876 :
  out_eq64 (ported_sin (f64 (13847290482940408075))) (f64 (13829815073376268887)) &&
  out_eq64 (ported_cos (f64 (13847290482940408075))) (f64 (4600819442205117664)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2877 :
  out_eq64 (ported_sin (f64 (4626319702160084473))) (f64 (4606358455838524923)) &&
  out_eq64 (ported_cos (f64 (4626319702160084473))) (f64 (4601198712898191764)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2878 :
  out_eq64 (ported_sin (f64 (4608735245069373039))) (f64 (4606953371090953029)) &&
  out_eq64 (ported_cos (f64 (4608735245069373039))) (f64 (4597241377813392422)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2879 :
  out_eq64 (ported_sin (f64 (4598985160999163511))) (f64 (4598908447475934205)) &&
  out_eq64 (ported_cos (f64 (4598985160999163511))) (f64 (4606793429782702488)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2880 :
  out_eq64 (ported_sin (f64 (4546228609624429203))) (f64 (4546228609615627683)) &&
  out_eq64 (ported_cos (f64 (4546228609624429203))) (f64 (4607182418763983398)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2881 :
  out_eq64 (ported_sin (f64 (4627567515180980539))) (f64 (13827420710099279844)) &&
  out_eq64 (ported_cos (f64 (4627567515180980539))) (f64 (4605003995428085579)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2882 :
  out_eq64 (ported_sin (f64 (4623965722909706739))) (f64 (4606713684533488487)) &&
  out_eq64 (ported_cos (f64 (4623965722909706739))) (f64 (4599407211974418767)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2883 :
  out_eq64 (ported_sin (f64 (13838519164054730404))) (f64 (4600611163039474547)) &&
  out_eq64 (ported_cos (f64 (13838519164054730404))) (f64 (13829859315334550888)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2884 :
  out_eq64 (ported_sin (f64 (4626766307948814212))) (f64 (4600938103194028380)) &&
  out_eq64 (ported_cos (f64 (4626766307948814212))) (f64 (13829789173265324819)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2885 :
  out_eq64 (ported_sin (f64 (4625514174660306932))) (f64 (13830451584596968583)) &&
  out_eq64 (ported_cos (f64 (4625514174660306932))) (f64 (13817969720525237375)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2886 :
  out_eq64 (ported_sin (f64 (4622954573876559901))) (f64 (13826250558401929593)) &&
  out_eq64 (ported_cos (f64 (4622954573876559901))) (f64 (4605856924349142743)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2887 :
  out_eq64 (ported_sin (f64 (4627545914077003651))) (f64 (13827926966319071634)) &&
  out_eq64 (ported_cos (f64 (4627545914077003651))) (f64 (4604533595105415344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2888 :
  out_eq64 (ported_sin (f64 (4624290867253217633))) (f64 (4606894457922851381)) &&
  out_eq64 (ported_cos (f64 (4624290867253217633))) (f64 (13821562293969727123)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2889 :
  out_eq64 (ported_sin (f64 (13846418097236590782))) (f64 (4600468507761341808)) &&
  out_eq64 (ported_cos (f64 (13846418097236590782))) (f64 (4606516695273560054)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2890 :
  out_eq64 (ported_sin (f64 (13786738627620121833))) (f64 (13786738626150602546)) &&
  out_eq64 (ported_cos (f64 (13786738627620121833))) (f64 (4607182411862496887)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2891 :
  out_eq64 (ported_sin (f64 (13850419232971760785))) (f64 (4603131836428071777)) &&
  out_eq64 (ported_cos (f64 (13850419232971760785))) (f64 (13829068000212455003)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2892 :
  out_eq64 (ported_sin (f64 (4524113206006607749))) (f64 (4524113206006597483)) &&
  out_eq64 (ported_cos (f64 (4524113206006607749))) (f64 (4607182418799977795)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2893 :
  out_eq64 (ported_sin (f64 (13849923756864733430))) (f64 (13829866995313616514)) &&
  out_eq64 (ported_cos (f64 (13849923756864733430))) (f64 (13823946288973438415)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2894 :
  out_eq64 (ported_sin (f64 (13818153602289892186))) (f64 (13818130917554055703)) &&
  out_eq64 (ported_cos (f64 (13818153602289892186))) (f64 (4607073310964661111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2895 :
  out_eq64 (ported_sin (f64 (4571504792163956879))) (f64 (4571504777817162752)) &&
  out_eq64 (ported_cos (f64 (4571504792163956879))) (f64 (4607182338945962496)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2896 :
  out_eq64 (ported_sin (f64 (4606306327947088687))) (f64 (4605246084383198225)) &&
  out_eq64 (ported_cos (f64 (4606306327947088687))) (f64 (4603754870865784506)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2897 :
  out_eq64 (ported_sin (f64 (13755156108712039825))) (f64 (13755156108711952800)) &&
  out_eq64 (ported_cos (f64 (13755156108712039825))) (f64 (4607182418799602414)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2898 :
  out_eq64 (ported_sin (f64 (13850354289487877061))) (f64 (4599882413157539799)) &&
  out_eq64 (ported_cos (f64 (13850354289487877061))) (f64 (13830002204670043958)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2899 :
  out_eq64 (ported_sin (f64 (4620719572399622133))) (f64 (4607015471392050087)) &&
  out_eq64 (ported_cos (f64 (4620719572399622133))) (f64 (13819444647734444088)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2900 :
  out_eq64 (ported_sin (f64 (13794745529149418928))) (f64 (13794745515935475947)) &&
  out_eq64 (ported_cos (f64 (13794745529149418928))) (f64 (4607182343206938233)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2901 :
  out_eq64 (ported_sin (f64 (4626457680465590497))) (f64 (4607166675314872635)) &&
  out_eq64 (ported_cos (f64 (4626457680465590497))) (f64 (13812049932438112734)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2902 :
  out_eq64 (ported_sin (f64 (4619928210205433195))) (f64 (4605930963136856409)) &&
  out_eq64 (ported_cos (f64 (4619928210205433195))) (f64 (4602755402921111116)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2903 :
  out_eq64 (ported_sin (f64 (13848826265009085190))) (f64 (4606591459127502408)) &&
  out_eq64 (ported_cos (f64 (13848826265009085190))) (f64 (13823461304226127312)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2904 :
  out_eq64 (ported_sin (f64 (13787380604372976095))) (f64 (13787380602351461502)) &&
  out_eq64 (ported_cos (f64 (13787380604372976095))) (f64 (4607182410219002302)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2905 :
  out_eq64 (ported_sin (f64 (13772637315038683056))) (f64 (13772637315022120490)) &&
  out_eq64 (ported_cos (f64 (13772637315038683056))) (f64 (4607182418712831584)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2906 :
  out_eq64 (ported_sin (f64 (4625227857498551161))) (f64 (13824097163853710204)) &&
  out_eq64 (ported_cos (f64 (4625227857498551161))) (f64 (13829835298863690847)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2907 :
  out_eq64 (ported_sin (f64 (13731405828743852352))) (f64 (13731405828743852269)) &&
  out_eq64 (ported_cos (f64 (13731405828743852352))) (f64 (4607182418800017156)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2908 :
  out_eq64 (ported_sin (f64 (4550652811138827448))) (f64 (4550652811104876697)) &&
  out_eq64 (ported_cos (f64 (4550652811138827448))) (f64 (4607182418659328331)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2909 :
  out_eq64 (ported_sin (f64 (4621880614433077875))) (f64 (13827242117360682657)) &&
  out_eq64 (ported_cos (f64 (4621880614433077875))) (f64 (13828525665749875012)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2910 :
  out_eq64 (ported_sin (f64 (4620770628327582421))) (f64 (4606822803430372084)) &&
  out_eq64 (ported_cos (f64 (4620770628327582421))) (f64 (13822083073947252770)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2911 :
  out_eq64 (ported_sin (f64 (4627511997444980633))) (f64 (13828645014524584338)) &&
  out_eq64 (ported_cos (f64 (4627511997444980633))) (f64 (4603720620163829151)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2912 :
  out_eq64 (ported_sin (f64 (13846965207314699478))) (f64 (13826520878602139771)) &&
  out_eq64 (ported_cos (f64 (13846965207314699478))) (f64 (4605684728224644761)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2913 :
  out_eq64 (ported_sin (f64 (13850088844621726065))) (f64 (13826566424377366626)) &&
  out_eq64 (ported_cos (f64 (13850088844621726065))) (f64 (13829026400149847941)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2914 :
  out_eq64 (ported_sin (f64 (13836801464437195991))) (f64 (13823513637149083743)) &&
  out_eq64 (ported_cos (f64 (13836801464437195991))) (f64 (13829953472962623634)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2915 :
  out_eq64 (ported_sin (f64 (13831733762589606311))) (f64 (13830128029004258321)) &&
  out_eq64 (ported_cos (f64 (13831733762589606311))) (f64 (4599148838164246957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2916 :
  out_eq64 (ported_sin (f64 (4615136569358282699))) (f64 (13823905179672515050)) &&
  out_eq64 (ported_cos (f64 (4615136569358282699))) (f64 (13829875492365031387)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2917 :
  out_eq64 (ported_sin (f64 (13809442923167344336))) (f64 (13809441266750806468)) &&
  out_eq64 (ported_cos (f64 (13809442923167344336))) (f64 (4607174845869741138)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2918 :
  out_eq64 (ported_sin (f64 (4621843451542128035))) (f64 (13826769370922256368)) &&
  out_eq64 (ported_cos (f64 (4621843451542128035))) (f64 (13828886136309928885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2919 :
  out_eq64 (ported_sin (f64 (4623749778913223977))) (f64 (4605019869705659678)) &&
  out_eq64 (ported_cos (f64 (4623749778913223977))) (f64 (4604030166393589564)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2920 :
  out_eq64 (ported_sin (f64 (13832184317294098902))) (f64 (13830358646366874625)) &&
  out_eq64 (ported_cos (f64 (13832184317294098902))) (f64 (4596639614784016147)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2921 :
  out_eq64 (ported_sin (f64 (4622813306558936761))) (f64 (13828010735301430148)) &&
  out_eq64 (ported_cos (f64 (4622813306558936761))) (f64 (4604448422786527978)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2922 :
  out_eq64 (ported_sin (f64 (4620012298997031679))) (f64 (4606251099476201496)) &&
  out_eq64 (ported_cos (f64 (4620012298997031679))) (f64 (4601649038486813585)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2923 :
  out_eq64 (ported_sin (f64 (4627068845319078824))) (f64 (13827067095597811911)) &&
  out_eq64 (ported_cos (f64 (4627068845319078824))) (f64 (13828664911466538825)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2924 :
  out_eq64 (ported_sin (f64 (4625722435564481262))) (f64 (13829038655227740435)) &&
  out_eq64 (ported_cos (f64 (4625722435564481262))) (f64 (4603176077673549840)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2925 :
  out_eq64 (ported_sin (f64 (13849707104837965744))) (f64 (13829923653619972725)) &&
  out_eq64 (ported_cos (f64 (13849707104837965744))) (f64 (4600294491811190518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2926 :
  out_eq64 (ported_sin (f64 (4667069154956513410))) (f64 (13830295730242635313)) &&
  out_eq64 (ported_cos (f64 (4667069154956513410))) (f64 (13821113358810593906)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2927 :
  out_eq64 (ported_sin (f64 (4623662608285930240))) (f64 (4604034978105641187)) &&
  out_eq64 (ported_cos (f64 (4623662608285930240))) (f64 (4605015750813302202)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2928 :
  out_eq64 (ported_sin (f64 (4620316132694117764))) (f64 (4607022192559662395)) &&
  out_eq64 (ported_cos (f64 (4620316132694117764))) (f64 (4595933470043310701)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2929 :
  out_eq64 (ported_sin (f64 (4621619214739824973))) (f64 (13820406941256783404)) &&
  out_eq64 (ported_cos (f64 (4621619214739824973))) (f64 (13830337116854755037)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2930 :
  out_eq64 (ported_sin (f64 (4625765673049924859))) (f64 (13828185278395659229)) &&
  out_eq64 (ported_cos (f64 (4625765673049924859))) (f64 (4604263429659952508)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2931 :
  out_eq64 (ported_sin (f64 (13850138110294324802))) (f64 (13824323870936967633)) &&
  out_eq64 (ported_cos (f64 (13850138110294324802))) (f64 (13829786143390728780)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2932 :
  out_eq64 (ported_sin (f64 (13848438192214178806))) (f64 (4588793120134588320)) &&
  out_eq64 (ported_cos (f64 (13848438192214178806))) (f64 (13830538282926193848)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2933 :
  out_eq64 (ported_sin (f64 (4626352851076960227))) (f64 (4606743976719123172)) &&
  out_eq64 (ported_cos (f64 (4626352851076960227))) (f64 (4599223570533772900)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2934 :
  out_eq64 (ported_sin (f64 (13733595036519770023))) (f64 (13733595036519769887)) &&
  out_eq64 (ported_cos (f64 (13733595036519770023))) (f64 (4607182418800016854)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2935 :
  out_eq64 (ported_sin (f64 (13776342061419395242))) (f64 (13776342061334865142)) &&
  out_eq64 (ported_cos (f64 (13776342061419395242))) (f64 (4607182418541572259)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2936 :
  out_eq64 (ported_sin (f64 (4513260860338157366))) (f64 (4513260860338157110)) &&
  out_eq64 (ported_cos (f64 (4513260860338157366))) (f64 (4607182418800016065)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2937 :
  out_eq64 (ported_sin (f64 (4569548086598819056))) (f64 (4569548073887893752)) &&
  out_eq64 (ported_cos (f64 (4569548086598819056))) (f64 (4607182372395669757)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2938 :
  out_eq64 (ported_sin (f64 (4522937971123011640))) (f64 (4522937971123005724)) &&
  out_eq64 (ported_cos (f64 (4522937971123011640))) (f64 (4607182418799989975)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2939 :
  out_eq64 (ported_sin (f64 (4626392299213978866))) (f64 (4607047737870029800)) &&
  out_eq64 (ported_cos (f64 (4626392299213978866))) (f64 (4595375186460725594)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2940 :
  out_eq64 (ported_sin (f64 (13850109955927678331))) (f64 (13825932915032733798)) &&
  out_eq64 (ported_cos (f64 (13850109955927678331))) (f64 (13829381470483872674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2941 :
  out_eq64 (ported_sin (f64 (13842023920255430577))) (f64 (4591589573456430851)) &&
  out_eq64 (ported_cos (f64 (13842023920255430577))) (f64 (4607140725593916348)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2942 :
  out_eq64 (ported_sin (f64 (4622258314012858119))) (f64 (13830346299001213991)) &&
  out_eq64 (ported_cos (f64 (4622258314012858119))) (f64 (13820240953423067003)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2943 :
  out_eq64 (ported_sin (f64 (13797758010689986808))) (f64 (13797757952641682498)) &&
  out_eq64 (ported_cos (f64 (13797758010689986808))) (f64 (4607182216038205994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2944 :
  out_eq64 (ported_sin (f64 (13913538377285104645))) (f64 (13827321164920666874)) &&
  out_eq64 (ported_cos (f64 (13913538377285104645))) (f64 (13828460404656106062)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2945 :
  out_eq64 (ported_sin (f64 (13846395593041888670))) (f64 (4601129809023511197)) &&
  out_eq64 (ported_cos (f64 (13846395593041888670))) (f64 (4606374212912200454)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2946 :
  out_eq64 (ported_sin (f64 (13839671439201335462))) (f64 (4605532679395786472)) &&
  out_eq64 (ported_cos (f64 (13839671439201335462))) (f64 (13826743160841315480)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2947 :
  out_eq64 (ported_sin (f64 (4609113152267705799))) (f64 (4607091649291010017)) &&
  out_eq64 (ported_cos (f64 (4609113152267705799))) (f64 (4594270049696963746)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2948 :
  out_eq64 (ported_sin (f64 (13847822970885665817))) (f64 (13829282617916034617)) &&
  out_eq64 (ported_cos (f64 (13847822970885665817))) (f64 (13826161779195712167)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2949 :
  out_eq64 (ported_sin (f64 (4626192873069661858))) (f64 (4603902695215256126)) &&
  out_eq64 (ported_cos (f64 (4626192873069661858))) (f64 (4605126885594821457)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2950 :
  out_eq64 (ported_sin (f64 (13845196481460680465))) (f64 (4603146621612521612)) &&
  out_eq64 (ported_cos (f64 (13845196481460680465))) (f64 (13829058235024732025)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2951 :
  out_eq64 (ported_sin (f64 (4569778616747695381))) (f64 (4569778602811722853)) &&
  out_eq64 (ported_cos (f64 (4569778616747695381))) (f64 (4607182369460064092)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2952 :
  out_eq64 (ported_sin (f64 (13895611899949088249))) (f64 (4606346515883731628)) &&
  out_eq64 (ported_cos (f64 (13895611899949088249))) (f64 (13824622457354239504)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2953 :
  out_eq64 (ported_sin (f64 (13791698468672997330))) (f64 (13791698461274278781)) &&
  out_eq64 (ported_cos (f64 (13791698468672997330))) (f64 (4607182386449718358)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2954 :
  out_eq64 (ported_sin (f64 (4622877137685866173))) (f64 (13827259455036108240)) &&
  out_eq64 (ported_cos (f64 (4622877137685866173))) (f64 (4605139444208284242)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2955 :
  out_eq64 (ported_sin (f64 (4624442757539410070))) (f64 (4605976785824528605)) &&
  out_eq64 (ported_cos (f64 (4624442757539410070))) (f64 (13826047034362240402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2956 :
  out_eq64 (ported_sin (f64 (13850753664508778806))) (f64 (4607002765868372011)) &&
  out_eq64 (ported_cos (f64 (13850753664508778806))) (f64 (4596327980433673792)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2957 :
  out_eq64 (ported_sin (f64 (13880784612815416372))) (f64 (4601454861774538863)) &&
  out_eq64 (ported_cos (f64 (13880784612815416372))) (f64 (4606298330092652706)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2958 :
  out_eq64 (ported_sin (f64 (13844512174631269026))) (f64 (13826860264322359635)) &&
  out_eq64 (ported_cos (f64 (13844512174631269026))) (f64 (13828820603994668157)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2959 :
  out_eq64 (ported_sin (f64 (13847723758039183224))) (f64 (13829971848035373325)) &&
  out_eq64 (ported_cos (f64 (13847723758039183224))) (f64 (13823417319516405909)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2960 :
  out_eq64 (ported_sin (f64 (4623117504353173549))) (f64 (13821674327892337101)) &&
  out_eq64 (ported_cos (f64 (4623117504353173549))) (f64 (4606879750529769727)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2961 :
  out_eq64 (ported_sin (f64 (13850662473535752898))) (f64 (4607113355104847681)) &&
  out_eq64 (ported_cos (f64 (13850662473535752898))) (f64 (13816942621256240098)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2962 :
  out_eq64 (ported_sin (f64 (4606927714560653064))) (f64 (4605613887283947552)) &&
  out_eq64 (ported_cos (f64 (4606927714560653064))) (f64 (4603254182105510537)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2963 :
  out_eq64 (ported_sin (f64 (13850929373581440384))) (f64 (4604291715983503423)) &&
  out_eq64 (ported_cos (f64 (13850929373581440384))) (f64 (4604787186706096486)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2964 :
  out_eq64 (ported_sin (f64 (4571818978121241276))) (f64 (4571818960804852361)) &&
  out_eq64 (ported_cos (f64 (4571818978121241276))) (f64 (4607182328275705455)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2965 :
  out_eq64 (ported_sin (f64 (4625134587911165040))) (f64 (13819043266967168320)) &&
  out_eq64 (ported_cos (f64 (4625134587911165040))) (f64 (13830406511718103117)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2966 :
  out_eq64 (ported_sin (f64 (13789016492288854028))) (f64 (13789016488274043714)) &&
  out_eq64 (ported_cos (f64 (13789016492288854028))) (f64 (4607182405241961845)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2967 :
  out_eq64 (ported_sin (f64 (13848205251499663088))) (f64 (13823285881965636642)) &&
  out_eq64 (ported_cos (f64 (13848205251499663088))) (f64 (13829996415800532039)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2968 :
  out_eq64 (ported_sin (f64 (4600342916690928288))) (f64 (4600191469423237376)) &&
  out_eq64 (ported_cos (f64 (4600342916690928288))) (f64 (4606571797956841687)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2969 :
  out_eq64 (ported_sin (f64 (4504080662630543485))) (f64 (4504080662630543471)) &&
  out_eq64 (ported_cos (f64 (4504080662630543485))) (f64 (4607182418800017330)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2970 :
  out_eq64 (ported_sin (f64 (13849026250461084892))) (f64 (4606647894480079329)) &&
  out_eq64 (ported_cos (f64 (13849026250461084892))) (f64 (4599785020890774994)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2971 :
  out_eq64 (ported_sin (f64 (4622520912801869547))) (f64 (13830272066686067295)) &&
  out_eq64 (ported_cos (f64 (4622520912801869547))) (f64 (4598118840487726120)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2972 :
  out_eq64 (ported_sin (f64 (13864204621621472644))) (f64 (4591881106829702892)) &&
  out_eq64 (ported_cos (f64 (13864204621621472644))) (f64 (4607137132269505309)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2973 :
  out_eq64 (ported_sin (f64 (4627334692698575035))) (f64 (13830549457849477965)) &&
  out_eq64 (ported_cos (f64 (4627334692698575035))) (f64 (4584961020460019006)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2974 :
  out_eq64 (ported_sin (f64 (13846030667296425590))) (f64 (4606098275546251203)) &&
  out_eq64 (ported_cos (f64 (13846030667296425590))) (f64 (4602240125509903650)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2975 :
  out_eq64 (ported_sin (f64 (4523151435117787496))) (f64 (4523151435117780906)) &&
  out_eq64 (ported_cos (f64 (4523151435117787496))) (f64 (4607182418799987929)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2976 :
  out_eq64 (ported_sin (f64 (4634908266624636266))) (f64 (13830408015325644182)) &&
  out_eq64 (ported_cos (f64 (4634908266624636266))) (f64 (4595638370731924683)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2977 :
  out_eq64 (ported_sin (f64 (13836354260403584367))) (f64 (13826377168988810644)) &&
  out_eq64 (ported_cos (f64 (13836354260403584367))) (f64 (13829149991618350939)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2978 :
  out_eq64 (ported_sin (f64 (4682223856428708238))) (f64 (13813609895044156870)) &&
  out_eq64 (ported_cos (f64 (4682223856428708238))) (f64 (4607155435345749449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2979 :
  out_eq64 (ported_sin (f64 (13844712890688801123))) (f64 (13821924055308188753)) &&
  out_eq64 (ported_cos (f64 (13844712890688801123))) (f64 (13830217611983778990)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2980 :
  out_eq64 (ported_sin (f64 (4627699109396577471))) (f64 (13821202638513994765)) &&
  out_eq64 (ported_cos (f64 (4627699109396577471))) (f64 (4606918194935070227)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2981 :
  out_eq64 (ported_sin (f64 (13906433893300764219))) (f64 (4606679032063842271)) &&
  out_eq64 (ported_cos (f64 (13906433893300764219))) (f64 (4599609569417081315)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2982 :
  out_eq64 (ported_sin (f64 (4621153653545456601))) (f64 (4603312088488676931)) &&
  out_eq64 (ported_cos (f64 (4621153653545456601))) (f64 (13828946054672267379)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2983 :
  out_eq64 (ported_sin (f64 (13847686202440233320))) (f64 (13830165550816334988)) &&
  out_eq64 (ported_cos (f64 (13847686202440233320))) (f64 (13822279930168476111)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2984 :
  out_eq64 (ported_sin (f64 (13845028433337478353))) (f64 (4598756747738879307)) &&
  out_eq64 (ported_cos (f64 (13845028433337478353))) (f64 (13830188147973014895)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2985 :
  out_eq64 (ported_sin (f64 (4635467977443555466))) (f64 (4598659615972141426)) &&
  out_eq64 (ported_cos (f64 (4635467977443555466))) (f64 (4606830253470994988)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2986 :
  out_eq64 (ported_sin (f64 (13780561383910497778))) (f64 (13780561383603966420)) &&
  out_eq64 (ported_cos (f64 (13780561383910497778))) (f64 (4607182417831671040)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2987 :
  out_eq64 (ported_sin (f64 (4603087624789490729))) (f64 (4602847691489052561)) &&
  out_eq64 (ported_cos (f64 (4603087624789490729))) (f64 (4605875715915591219)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2988 :
  out_eq64 (ported_sin (f64 (4626110444234386947))) (f64 (4600625300094711165)) &&
  out_eq64 (ported_cos (f64 (4626110444234386947))) (f64 (4606484324275286932)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2989 :
  out_eq64 (ported_sin (f64 (4624915346051726975))) (f64 (4596606562404414720)) &&
  out_eq64 (ported_cos (f64 (4624915346051726975))) (f64 (13830360393986397931)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2990 :
  out_eq64 (ported_sin (f64 (4627304511914644749))) (f64 (13830529865459456653)) &&
  out_eq64 (ported_cos (f64 (4627304511914644749))) (f64 (13813357347070710830)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2991 :
  out_eq64 (ported_sin (f64 (4620823720648389375))) (f64 (4606547089874111528)) &&
  out_eq64 (ported_cos (f64 (4620823720648389375))) (f64 (13823689384907890678)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2992 :
  out_eq64 (ported_sin (f64 (13715957047047832736))) (f64 (13715957047047832735)) &&
  out_eq64 (ported_cos (f64 (13715957047047832736))) (f64 (4607182418800017406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2993 :
  out_eq64 (ported_sin (f64 (4613259314026193736))) (f64 (4601392044035373508)) &&
  out_eq64 (ported_cos (f64 (4613259314026193736))) (f64 (13829685339790888968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2994 :
  out_eq64 (ported_sin (f64 (4501981732600814265))) (f64 (4501981732600814253)) &&
  out_eq64 (ported_cos (f64 (4501981732600814265))) (f64 (4607182418800017365)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2995 :
  out_eq64 (ported_sin (f64 (4594239014815547137))) (f64 (4594222288569908974)) &&
  out_eq64 (ported_cos (f64 (4594239014815547137))) (f64 (4607093349207633545)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2996 :
  out_eq64 (ported_sin (f64 (4498726602155807729))) (f64 (4498726602155807724)) &&
  out_eq64 (ported_cos (f64 (4498726602155807729))) (f64 (4607182418800017393)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2997 :
  out_eq64 (ported_sin (f64 (4592436531901607228))) (f64 (4592421470907720322)) &&
  out_eq64 (ported_cos (f64 (4592436531901607228))) (f64 (4607130075970387205)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2998 :
  out_eq64 (ported_sin (f64 (4617798823635694671))) (f64 (13828337461010629348)) &&
  out_eq64 (ported_cos (f64 (4617798823635694671))) (f64 (4604093222566659884)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_2999 :
  out_eq64 (ported_sin (f64 (13844239668297890380))) (f64 (13829634746824517825)) &&
  out_eq64 (ported_cos (f64 (13844239668297890380))) (f64 (13824973886794259639)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3000 :
  out_eq64 (ported_sin (f64 (13828011661140498576))) (f64 (13827470828173285568)) &&
  out_eq64 (ported_cos (f64 (13828011661140498576))) (f64 (4604960566689082682)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3001 :
  out_eq64 (ported_sin (f64 (13843621777699996822))) (f64 (13830279174369144450)) &&
  out_eq64 (ported_cos (f64 (13843621777699996822))) (f64 (4598007248307190254)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3002 :
  out_eq64 (ported_sin (f64 (4688537212100090351))) (f64 (4602720688165188467)) &&
  out_eq64 (ported_cos (f64 (4688537212100090351))) (f64 (4605951359554304129)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3003 :
  out_eq64 (ported_sin (f64 (4624566749299038910))) (f64 (4604804800178918961)) &&
  out_eq64 (ported_cos (f64 (4624566749299038910))) (f64 (13827644657406763066)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3004 :
  out_eq64 (ported_sin (f64 (13843104427947643450))) (f64 (13828393407646950522)) &&
  out_eq64 (ported_cos (f64 (13843104427947643450))) (f64 (4604028411112208047)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3005 :
  out_eq64 (ported_sin (f64 (4625001569712857478))) (f64 (4588053326632636640)) &&
  out_eq64 (ported_cos (f64 (4625001569712857478))) (f64 (13830540938164374488)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3006 :
  out_eq64 (ported_sin (f64 (13845905245243699381))) (f64 (4606849078238566600)) &&
  out_eq64 (ported_cos (f64 (13845905245243699381))) (f64 (4598527055545505561)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3007 :
  out_eq64 (ported_sin (f64 (13847420700728378994))) (f64 (13830414210259575758)) &&
  out_eq64 (ported_cos (f64 (13847420700728378994))) (f64 (4595501130322975908)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3008 :
  out_eq64 (ported_sin (f64 (13847254848467710748))) (f64 (13829572439147185291)) &&
  out_eq64 (ported_cos (f64 (13847254848467710748))) (f64 (4601851126086306173)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3009 :
  out_eq64 (ported_sin (f64 (13834193213383499454))) (f64 (13830302314755210441)) &&
  out_eq64 (ported_cos (f64 (13834193213383499454))) (f64 (13821005130434899206)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3010 :
  out_eq64 (ported_sin (f64 (13916174367602043936))) (f64 (4601864932426154905)) &&
  out_eq64 (ported_cos (f64 (13916174367602043936))) (f64 (13829568917446877212)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3011 :
  out_eq64 (ported_sin (f64 (13716698544079604156))) (f64 (13716698544079604155)) &&
  out_eq64 (ported_cos (f64 (13716698544079604156))) (f64 (4607182418800017405)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3012 :
  out_eq64 (ported_sin (f64 (13823194599490175380))) (f64 (13823075776002031890)) &&
  out_eq64 (ported_cos (f64 (13823194599490175380))) (f64 (4606662446584500280)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3013 :
  out_eq64 (ported_sin (f64 (13846480534508618785))) (f64 (4598580216039134105)) &&
  out_eq64 (ported_cos (f64 (13846480534508618785))) (f64 (4606841594764725005)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3014 :
  out_eq64 (ported_sin (f64 (13831621370060592686))) (f64 (13830057018990087589)) &&
  out_eq64 (ported_cos (f64 (13831621370060592686))) (f64 (4599575374342284114)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3015 :
  out_eq64 (ported_sin (f64 (13850675822713945202))) (f64 (4607156083090504408)) &&
  out_eq64 (ported_cos (f64 (13850675822713945202))) (f64 (13813542691928361455)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3016 :
  out_eq64 (ported_sin (f64 (4606200187861000187))) (f64 (4605179844831349970)) &&
  out_eq64 (ported_cos (f64 (4606200187861000187))) (f64 (4603837804027322196)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3017 :
  out_eq64 (ported_sin (f64 (4616867449462841434))) (f64 (13830499666676890544)) &&
  out_eq64 (ported_cos (f64 (4616867449462841434))) (f64 (13815972153680536957)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3018 :
  out_eq64 (ported_sin (f64 (4589328800793354074))) (f64 (4589325544076085507)) &&
  out_eq64 (ported_cos (f64 (4589328800793354074))) (f64 (4607163554682991325)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3019 :
  out_eq64 (ported_sin (f64 (13847944509336679089))) (f64 (13828114506791804372)) &&
  out_eq64 (ported_cos (f64 (13847944509336679089))) (f64 (13827711740215152880)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3020 :
  out_eq64 (ported_sin (f64 (13837463676067063458))) (f64 (13813312287286991577)) &&
  out_eq64 (ported_cos (f64 (13837463676067063458))) (f64 (13830530280736598443)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3021 :
  out_eq64 (ported_sin (f64 (4614126118148331638))) (f64 (4588510600325563983)) &&
  out_eq64 (ported_cos (f64 (4614126118148331638))) (f64 (13830539325088440082)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3022 :
  out_eq64 (ported_sin (f64 (13843537073899708909))) (f64 (13830088383660520219)) &&
  out_eq64 (ported_cos (f64 (13843537073899708909))) (f64 (4599391334433542926)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3023 :
  out_eq64 (ported_sin (f64 (4620589472698216678))) (f64 (4607169350527763752)) &&
  out_eq64 (ported_cos (f64 (4620589472698216678))) (f64 (13811293208966638134)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3024 :
  out_eq64 (ported_sin (f64 (13848587300006936584))) (f64 (4599976632834076925)) &&
  out_eq64 (ported_cos (f64 (13848587300006936584))) (f64 (13829984752559834217)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3025 :
  out_eq64 (ported_sin (f64 (13838659008851521534))) (f64 (4601629538412852935)) &&
  out_eq64 (ported_cos (f64 (13838659008851521534))) (f64 (13829627944596087989)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3026 :
  out_eq64 (ported_sin (f64 (4625581700033391254))) (f64 (13830519110934108111)) &&
  out_eq64 (ported_cos (f64 (4625581700033391254))) (f64 (4591041703517033060)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3027 :
  out_eq64 (ported_sin (f64 (13846542238210699129))) (f64 (4595134294701326732)) &&
  out_eq64 (ported_cos (f64 (13846542238210699129))) (f64 (4607058060392553414)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3028 :
  out_eq64 (ported_sin (f64 (13846141290175345674))) (f64 (4605109322314090048)) &&
  out_eq64 (ported_cos (f64 (13846141290175345674))) (f64 (4603923946117843406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3029 :
  out_eq64 (ported_sin (f64 (4624922908399802310))) (f64 (4596132342866345366)) &&
  out_eq64 (ported_cos (f64 (4624922908399802310))) (f64 (13830384579332131864)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3030 :
  out_eq64 (ported_sin (f64 (4524661862506927972))) (f64 (4524661862506915099)) &&
  out_eq64 (ported_cos (f64 (4524661862506927972))) (f64 (4607182418799971344)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3031 :
  out_eq64 (ported_sin (f64 (13849529228135339665))) (f64 (13826349888885210179)) &&
  out_eq64 (ported_cos (f64 (13849529228135339665))) (f64 (4605795216896136337)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3032 :
  out_eq64 (ported_sin (f64 (13824404553129377311))) (f64 (13824201422675356508)) &&
  out_eq64 (ported_cos (f64 (13824404553129377311))) (f64 (4606440885594375742)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3033 :
  out_eq64 (ported_sin (f64 (13848081158179514012))) (f64 (13826440281715580083)) &&
  out_eq64 (ported_cos (f64 (13848081158179514012))) (f64 (13829109527333853140)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3034 :
  out_eq64 (ported_sin (f64 (13844940276909926924))) (f64 (4593823363899100885)) &&
  out_eq64 (ported_cos (f64 (13844940276909926924))) (f64 (13830478948535784035)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3035 :
  out_eq64 (ported_sin (f64 (13889573321509649526))) (f64 (13820993416348622535)) &&
  out_eq64 (ported_cos (f64 (13889573321509649526))) (f64 (13830303022117614777)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3036 :
  out_eq64 (ported_sin (f64 (13829723173885127328))) (f64 (13828645791318033434)) &&
  out_eq64 (ported_cos (f64 (13829723173885127328))) (f64 (4603719625774333606)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3037 :
  out_eq64 (ported_sin (f64 (4607525265834356779))) (f64 (4606102688901804799)) &&
  out_eq64 (ported_cos (f64 (4607525265834356779))) (f64 (4602223781753584698)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3038 :
  out_eq64 (ported_sin (f64 (4680483002603504296))) (f64 (4605597202282831456)) &&
  out_eq64 (ported_cos (f64 (4680483002603504296))) (f64 (4603278533239146476)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3039 :
  out_eq64 (ported_sin (f64 (13848839641969498229))) (f64 (4606734396922760538)) &&
  out_eq64 (ported_cos (f64 (13848839641969498229))) (f64 (13822654403972608209)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3040 :
  out_eq64 (ported_sin (f64 (4627658425784636847))) (f64 (13823848363744185339)) &&
  out_eq64 (ported_cos (f64 (4627658425784636847))) (f64 (4606515101389319485)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3041 :
  out_eq64 (ported_sin (f64 (4594495332234131323))) (f64 (4594475941295084353)) &&
  out_eq64 (ported_cos (f64 (4594495332234131323))) (f64 (4607084134284328443)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3042 :
  out_eq64 (ported_sin (f64 (4616281183007126384))) (f64 (13828819676385619570)) &&
  out_eq64 (ported_cos (f64 (4616281183007126384))) (f64 (13826861533958491125)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3043 :
  out_eq64 (ported_sin (f64 (4581634094278977155))) (f64 (4581633665945547682)) &&
  out_eq64 (ported_cos (f64 (4581634094278977155))) (f64 (4607180482321194283)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3044 :
  out_eq64 (ported_sin (f64 (4626823641944872718))) (f64 (4596731654011534261)) &&
  out_eq64 (ported_cos (f64 (4626823641944872718))) (f64 (13830353737179740400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3045 :
  out_eq64 (ported_sin (f64 (4610730173665280660))) (f64 (4606971250448258702)) &&
  out_eq64 (ported_cos (f64 (4610730173665280660))) (f64 (13820295807289184937)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3046 :
  out_eq64 (ported_sin (f64 (4617048603237661578))) (f64 (13830542953175888261)) &&
  out_eq64 (ported_cos (f64 (4617048603237661578))) (f64 (4587441751645673449)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3047 :
  out_eq64 (ported_sin (f64 (13842137670610034461))) (f64 (13795528675734280629)) &&
  out_eq64 (ported_cos (f64 (13842137670610034461))) (f64 (4607182316061694795)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3048 :
  out_eq64 (ported_sin (f64 (13849845957272983781))) (f64 (13830493055382840803)) &&
  out_eq64 (ported_cos (f64 (13849845957272983781))) (f64 (13816435767867327327)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3049 :
  out_eq64 (ported_sin (f64 (13848691035144476326))) (f64 (4604155697617236624)) &&
  out_eq64 (ported_cos (f64 (13848691035144476326))) (f64 (13828282501046344576)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3050 :
  out_eq64 (ported_sin (f64 (4626805440252642026))) (f64 (4598583688097073296)) &&
  out_eq64 (ported_cos (f64 (4626805440252642026))) (f64 (13830213139792148468)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3051 :
  out_eq64 (ported_sin (f64 (13842719535575313034))) (f64 (13826019282824500563)) &&
  out_eq64 (ported_cos (f64 (13842719535575313034))) (f64 (4605984776040947885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3052 :
  out_eq64 (ported_sin (f64 (13831233649243274731))) (f64 (13829771685312352915)) &&
  out_eq64 (ported_cos (f64 (13831233649243274731))) (f64 (4601016933384632620)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3053 :
  out_eq64 (ported_sin (f64 (4580920854165962142))) (f64 (4580920561603397852)) &&
  out_eq64 (ported_cos (f64 (4580920854165962142))) (f64 (4607180916905714527)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3054 :
  out_eq64 (ported_sin (f64 (13850521089014008559))) (f64 (4605473325602332322)) &&
  out_eq64 (ported_cos (f64 (13850521089014008559))) (f64 (13826826203870388577)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3055 :
  out_eq64 (ported_sin (f64 (4609145707504234408))) (f64 (4607100636529416717)) &&
  out_eq64 (ported_cos (f64 (4609145707504234408))) (f64 (4594012101336639472)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3056 :
  out_eq64 (ported_sin (f64 (13724677076648497108))) (f64 (13724677076648497099)) &&
  out_eq64 (ported_cos (f64 (13724677076648497108))) (f64 (4607182418800017372)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3057 :
  out_eq64 (ported_sin (f64 (4625856190784278185))) (f64 (13825790525294038723)) &&
  out_eq64 (ported_cos (f64 (4625856190784278185))) (f64 (4606049399577643609)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3058 :
  out_eq64 (ported_sin (f64 (4625583155799857274))) (f64 (13830514868108975306)) &&
  out_eq64 (ported_cos (f64 (4625583155799857274))) (f64 (4591412830384418402)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3059 :
  out_eq64 (ported_sin (f64 (13849609065046660514))) (f64 (13828290448848485495)) &&
  out_eq64 (ported_cos (f64 (13849609065046660514))) (f64 (4604146734764883512)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3060 :
  out_eq64 (ported_sin (f64 (4625571602734957773))) (f64 (13830541929048806361)) &&
  out_eq64 (ported_cos (f64 (4625571602734957773))) (f64 (4587758755177940825)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3061 :
  out_eq64 (ported_sin (f64 (13896949814898262511))) (f64 (13829249629125437021)) &&
  out_eq64 (ported_cos (f64 (13896949814898262511))) (f64 (13826216634604251906)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3062 :
  out_eq64 (ported_sin (f64 (13871547590788226930))) (f64 (4606230001679536710)) &&
  out_eq64 (ported_cos (f64 (13871547590788226930))) (f64 (4601733908224387613)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3063 :
  out_eq64 (ported_sin (f64 (4612049002053796838))) (f64 (4605657658773847207)) &&
  out_eq64 (ported_cos (f64 (4612049002053796838))) (f64 (13826561510243382418)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3064 :
  out_eq64 (ported_sin (f64 (4618831678464909944))) (f64 (4589232381846352547)) &&
  out_eq64 (ported_cos (f64 (4618831678464909944))) (f64 (4607164301976519502)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3065 :
  out_eq64 (ported_sin (f64 (13822765444515940676))) (f64 (13822669722131565779)) &&
  out_eq64 (ported_cos (f64 (13822765444515940676))) (f64 (4606731882771031997)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3066 :
  out_eq64 (ported_sin (f64 (4623775828927369919))) (f64 (4605283378645201878)) &&
  out_eq64 (ported_cos (f64 (4623775828927369919))) (f64 (4603707281785052242)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3067 :
  out_eq64 (ported_sin (f64 (4639406600547300608))) (f64 (13820102602207771487)) &&
  out_eq64 (ported_cos (f64 (4639406600547300608))) (f64 (13830353795613940266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3068 :
  out_eq64 (ported_sin (f64 (13842351762812629770))) (f64 (13819518698720472219)) &&
  out_eq64 (ported_cos (f64 (13842351762812629770))) (f64 (4607011836461548522)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3069 :
  out_eq64 (ported_sin (f64 (4608611637380106128))) (f64 (4606894675744762047)) &&
  out_eq64 (ported_cos (f64 (4608611637380106128))) (f64 (4598188575529757013)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3070 :
  out_eq64 (ported_sin (f64 (13849762379567870491))) (f64 (13830408774147025304)) &&
  out_eq64 (ported_cos (f64 (13849762379567870491))) (f64 (4595621722031010060)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3071 :
  out_eq64 (ported_sin (f64 (13850908139410114058))) (f64 (4604772646401040080)) &&
  out_eq64 (ported_cos (f64 (13850908139410114058))) (f64 (4604307396752227880)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3072 :
  out_eq64 (ported_sin (f64 (4621482720396260756))) (f64 (4582095583796753227)) &&
  out_eq64 (ported_cos (f64 (4621482720396260756))) (f64 (13830552208229327718)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3073 :
  out_eq64 (ported_sin (f64 (4620198823032186229))) (f64 (4606798307214769684)) &&
  out_eq64 (ported_cos (f64 (4620198823032186229))) (f64 (4598876232279586602)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3074 :
  out_eq64 (ported_sin (f64 (13850134811782154936))) (f64 (13824516464221555212)) &&
  out_eq64 (ported_cos (f64 (13850134811782154936))) (f64 (13829742921450712965)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3075 :
  out_eq64 (ported_sin (f64 (13850728990869716951))) (f64 (4607125578936861392)) &&
  out_eq64 (ported_cos (f64 (13850728990869716951))) (f64 (4592746817044727232)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3076 :
  out_eq64 (ported_sin (f64 (13846330775168920311))) (f64 (4602821567755544041)) &&
  out_eq64 (ported_cos (f64 (13846330775168920311))) (f64 (4605891506652658406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3077 :
  out_eq64 (ported_sin (f64 (4600629682606985128))) (f64 (4600457957397185903)) &&
  out_eq64 (ported_cos (f64 (4600629682606985128))) (f64 (4606518842518477964)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3078 :
  out_eq64 (ported_sin (f64 (4618604094733594806))) (f64 (13817521216672020677)) &&
  out_eq64 (ported_cos (f64 (4618604094733594806))) (f64 (4607095919715397518)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3079 :
  out_eq64 (ported_sin (f64 (4626995770608946422))) (f64 (13824059083004827406)) &&
  out_eq64 (ported_cos (f64 (4626995770608946422))) (f64 (13829843375198016562)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3080 :
  out_eq64 (ported_sin (f64 (4576826155768302312))) (f64 (4576826064222490856)) &&
  out_eq64 (ported_cos (f64 (4576826155768302312))) (f64 (4607181982715171498)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3081 :
  out_eq64 (ported_sin (f64 (4624663265049223255))) (f64 (4603667340315993467)) &&
  out_eq64 (ported_cos (f64 (4624663265049223255))) (f64 (13828686321314623672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3082 :
  out_eq64 (ported_sin (f64 (4621795038345797714))) (f64 (13826119712359834996)) &&
  out_eq64 (ported_cos (f64 (4621795038345797714))) (f64 (13829307558256968209)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3083 :
  out_eq64 (ported_sin (f64 (4626122638384016165))) (f64 (4601338489945385047)) &&
  out_eq64 (ported_cos (f64 (4626122638384016165))) (f64 (4606325950457902733)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3084 :
  out_eq64 (ported_sin (f64 (13818439233853983754))) (f64 (13818412910497145031)) &&
  out_eq64 (ported_cos (f64 (13818439233853983754))) (f64 (4607061950553293233)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3085 :
  out_eq64 (ported_sin (f64 (13883045223490519828))) (f64 (4598287903725766759)) &&
  out_eq64 (ported_cos (f64 (13883045223490519828))) (f64 (13830253697657301201)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3086 :
  out_eq64 (ported_sin (f64 (13849399209840870778))) (f64 (13815263196973702651)) &&
  out_eq64 (ported_cos (f64 (13849399209840870778))) (f64 (4607137005687849155)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3087 :
  out_eq64 (ported_sin (f64 (4622213892786818809))) (f64 (13830167161867588303)) &&
  out_eq64 (ported_cos (f64 (4622213892786818809))) (f64 (13822269312002544597)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3088 :
  out_eq64 (ported_sin (f64 (4625400111225635673))) (f64 (13829195281903541134)) &&
  out_eq64 (ported_cos (f64 (4625400111225635673))) (f64 (13826305128226046477)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3089 :
  out_eq64 (ported_sin (f64 (4623976182870225539))) (f64 (4606765493037232332)) &&
  out_eq64 (ported_cos (f64 (4623976182870225539))) (f64 (4599088940195683930)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3090 :
  out_eq64 (ported_sin (f64 (4608047133348737899))) (f64 (4606543919637417360)) &&
  out_eq64 (ported_cos (f64 (4608047133348737899))) (f64 (4600333300541414325)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3091 :
  out_eq64 (ported_sin (f64 (4627516702118936869))) (f64 (13828551339594004891)) &&
  out_eq64 (ported_cos (f64 (4627516702118936869))) (f64 (4603838474530423782)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3092 :
  out_eq64 (ported_sin (f64 (4624425965649391889))) (f64 (4606107573639290579)) &&
  out_eq64 (ported_cos (f64 (4624425965649391889))) (f64 (13825577682069523406)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3093 :
  out_eq64 (ported_sin (f64 (4620327565087788481))) (f64 (4607038910293322420)) &&
  out_eq64 (ported_cos (f64 (4620327565087788481))) (f64 (4595573798604040015)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3094 :
  out_eq64 (ported_sin (f64 (13834737871965532187))) (f64 (13829983051610590549)) &&
  out_eq64 (ported_cos (f64 (13834737871965532187))) (f64 (13823357767186814614)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3095 :
  out_eq64 (ported_sin (f64 (4573306217326886615))) (f64 (4573306180350310923)) &&
  out_eq64 (ported_cos (f64 (4573306217326886615))) (f64 (4607182268689478439)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3096 :
  out_eq64 (ported_sin (f64 (4625260767616069471))) (f64 (13825982673725635461)) &&
  out_eq64 (ported_cos (f64 (4625260767616069471))) (f64 (13829367303228128647)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3097 :
  out_eq64 (ported_sin (f64 (4617453190680473457))) (f64 (13829808345022750606)) &&
  out_eq64 (ported_cos (f64 (4617453190680473457))) (f64 (4600850492582198004)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3098 :
  out_eq64 (ported_sin (f64 (13828377159312412412))) (f64 (13827741215238565901)) &&
  out_eq64 (ported_cos (f64 (13828377159312412412))) (f64 (4604714677651373968)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3099 :
  out_eq64 (ported_sin (f64 (4604956200908391801))) (f64 (4604333568896165370)) &&
  out_eq64 (ported_cos (f64 (4604956200908391801))) (f64 (4604748222792423969)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3100 :
  out_eq64 (ported_sin (f64 (4620773362485353740))) (f64 (4606810463664123131)) &&
  out_eq64 (ported_cos (f64 (4620773362485353740))) (f64 (13822167014040149965)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3101 :
  out_eq64 (ported_sin (f64 (13887655262297543172))) (f64 (13812732015702508475)) &&
  out_eq64 (ported_cos (f64 (13887655262297543172))) (f64 (13830535311487109232)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3102 :
  out_eq64 (ported_sin (f64 (13849466642671510766))) (f64 (13823051728656695229)) &&
  out_eq64 (ported_cos (f64 (13849466642671510766))) (f64 (4606666709783964693)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3103 :
  out_eq64 (ported_sin (f64 (4568791455460907315))) (f64 (4568791446263180388)) &&
  out_eq64 (ported_cos (f64 (4568791455460907315))) (f64 (4607182381398064550)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3104 :
  out_eq64 (ported_sin (f64 (13846185526163690160))) (f64 (4604636661641338437)) &&
  out_eq64 (ported_cos (f64 (13846185526163690160))) (f64 (4604450520689751023)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3105 :
  out_eq64 (ported_sin (f64 (4621354047510624866))) (f64 (4598113393881562452)) &&
  out_eq64 (ported_cos (f64 (4621354047510624866))) (f64 (13830272415803863506)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3106 :
  out_eq64 (ported_sin (f64 (4625992070021469402))) (f64 (13806018371242036831)) &&
  out_eq64 (ported_cos (f64 (4625992070021469402))) (f64 (4607179770371516995)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3107 :
  out_eq64 (ported_sin (f64 (4594751265676935806))) (f64 (4594728946000717794)) &&
  out_eq64 (ported_cos (f64 (4594751265676935806))) (f64 (4607074483278443965)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3108 :
  out_eq64 (ported_sin (f64 (4624441921038944953))) (f64 (4605983466373634021)) &&
  out_eq64 (ported_cos (f64 (4624441921038944953))) (f64 (13826023839372618119)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3109 :
  out_eq64 (ported_sin (f64 (4536903860857051258))) (f64 (4536903860856576803)) &&
  out_eq64 (ported_cos (f64 (4536903860857051258))) (f64 (4607182418797976779)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3110 :
  out_eq64 (ported_sin (f64 (4625381221434195035))) (f64 (13828859004696427079)) &&
  out_eq64 (ported_cos (f64 (4625381221434195035))) (f64 (13826807292071515497)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3111 :
  out_eq64 (ported_sin (f64 (4620356410111852209))) (f64 (4607077025331435300)) &&
  out_eq64 (ported_cos (f64 (4620356410111852209))) (f64 (4594663461543231914)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3112 :
  out_eq64 (ported_sin (f64 (13850727147541587096))) (f64 (4607132003230117009)) &&
  out_eq64 (ported_cos (f64 (13850727147541587096))) (f64 (4592277732951855238)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3113 :
  out_eq64 (ported_sin (f64 (4522884516790829277))) (f64 (4522884516790823522)) &&
  out_eq64 (ported_cos (f64 (4522884516790829277))) (f64 (4607182418799990476)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3114 :
  out_eq64 (ported_sin (f64 (4627543831068072792))) (f64 (13827973845303031028)) &&
  out_eq64 (ported_cos (f64 (4627543831068072792))) (f64 (4604486209442805676)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3115 :
  out_eq64 (ported_sin (f64 (4626572038537521986))) (f64 (4606224371512542960)) &&
  out_eq64 (ported_cos (f64 (4626572038537521986))) (f64 (13825128405630242067)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3116 :
  out_eq64 (ported_sin (f64 (4608426507362425034))) (f64 (4606794496355946178)) &&
  out_eq64 (ported_cos (f64 (4608426507362425034))) (f64 (4598901421319740289)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3117 :
  out_eq64 (ported_sin (f64 (13847757896969581266))) (f64 (13829763221458442689)) &&
  out_eq64 (ported_cos (f64 (13847757896969581266))) (f64 (13824426760882448472)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3118 :
  out_eq64 (ported_sin (f64 (13773184671436104991))) (f64 (13773184671413659228)) &&
  out_eq64 (ported_cos (f64 (13773184671436104991))) (f64 (4607182418693247130)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3119 :
  out_eq64 (ported_sin (f64 (13844859305784484668))) (f64 (13802745477673486085)) &&
  out_eq64 (ported_cos (f64 (13844859305784484668))) (f64 (13830553539925986543)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3120 :
  out_eq64 (ported_sin (f64 (13835018248686030718))) (f64 (13829770289923134395)) &&
  out_eq64 (ported_cos (f64 (13835018248686030718))) (f64 (13824395216632432176)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3121 :
  out_eq64 (ported_sin (f64 (4622236072171572177))) (f64 (13830263387507393195)) &&
  out_eq64 (ported_cos (f64 (4622236072171572177))) (f64 (13821586209770391164)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3122 :
  out_eq64 (ported_sin (f64 (4646618717179740871))) (f64 (13824818864891769688)) &&
  out_eq64 (ported_cos (f64 (4646618717179740871))) (f64 (13829672290128648300)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3123 :
  out_eq64 (ported_sin (f64 (13849103442748053534))) (f64 (4605503469015222439)) &&
  out_eq64 (ported_cos (f64 (13849103442748053534))) (f64 (4603412241420430511)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3124 :
  out_eq64 (ported_sin (f64 (4621659874229065468))) (f64 (13822235448872051469)) &&
  out_eq64 (ported_cos (f64 (4621659874229065468))) (f64 (13830172275942861224)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3125 :
  out_eq64 (ported_sin (f64 (4626851870551116902))) (f64 (4592662031082493983)) &&
  out_eq64 (ported_cos (f64 (4626851870551116902))) (f64 (13830498805747542533)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3126 :
  out_eq64 (ported_sin (f64 (4626088569843499754))) (f64 (4599314153892182731)) &&
  out_eq64 (ported_cos (f64 (4626088569843499754))) (f64 (4606729171322197400)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3127 :
  out_eq64 (ported_sin (f64 (4627579428468872865))) (f64 (13827126511892554935)) &&
  out_eq64 (ported_cos (f64 (4627579428468872865))) (f64 (4605246396714884389)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3128 :
  out_eq64 (ported_sin (f64 (13836319334952350945))) (f64 (13826494501874622922)) &&
  out_eq64 (ported_cos (f64 (13836319334952350945))) (f64 (13829074168159130208)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3129 :
  out_eq64 (ported_sin (f64 (4523375023711310254))) (f64 (4523375023711302904)) &&
  out_eq64 (ported_cos (f64 (4523375023711310254))) (f64 (4607182418799985706)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3130 :
  out_eq64 (ported_sin (f64 (13850944417608619080))) (f64 (4603929759502215765)) &&
  out_eq64 (ported_cos (f64 (13850944417608619080))) (f64 (4605104498605798885)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3131 :
  out_eq64 (ported_sin (f64 (4544616962466241786))) (f64 (4544616962462441562)) &&
  out_eq64 (ported_cos (f64 (4544616962466241786))) (f64 (4607182418779432595)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3132 :
  out_eq64 (ported_sin (f64 (4553898121030428190))) (f64 (4553898120959046803)) &&
  out_eq64 (ported_cos (f64 (4553898121030428190))) (f64 (4607182418433491977)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3133 :
  out_eq64 (ported_sin (f64 (4626890468351492321))) (f64 (13806496082447420807)) &&
  out_eq64 (ported_cos (f64 (4626890468351492321))) (f64 (13830551432746226648)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3134 :
  out_eq64 (ported_sin (f64 (4608457625257436332))) (f64 (4606812358277244772)) &&
  out_eq64 (ported_cos (f64 (4608457625257436332))) (f64 (4598782186594640993)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3135 :
  out_eq64 (ported_sin (f64 (4625221295343684048))) (f64 (13823708836245575567)) &&
  out_eq64 (ported_cos (f64 (4625221295343684048))) (f64 (13829915259988909923)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3136 :
  out_eq64 (ported_sin (f64 (13790415188308116017))) (f64 (13790415184627611376)) &&
  out_eq64 (ported_cos (f64 (13790415188308116017))) (f64 (4607182398489907839)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3137 :
  out_eq64 (ported_sin (f64 (13848652417600023756))) (f64 (4603178340774598808)) &&
  out_eq64 (ported_cos (f64 (13848652417600023756))) (f64 (13829037144007974674)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3138 :
  out_eq64 (ported_sin (f64 (13849687544382338097))) (f64 (13829673500516425954)) &&
  out_eq64 (ported_cos (f64 (13849687544382338097))) (f64 (4601441766628414808)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3139 :
  out_eq64 (ported_sin (f64 (13850917764178491259))) (f64 (4604559146720920457)) &&
  out_eq64 (ported_cos (f64 (13850917764178491259))) (f64 (4604529360890153801)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3140 :
  out_eq64 (ported_sin (f64 (4625701219383525795))) (f64 (13829393967450922304)) &&
  out_eq64 (ported_cos (f64 (4625701219383525795))) (f64 (4602516678221560009)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3141 :
  out_eq64 (ported_sin (f64 (13839600550163641894))) (f64 (4605191171868025985)) &&
  out_eq64 (ported_cos (f64 (13839600550163641894))) (f64 (13827195800585903266)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3142 :
  out_eq64 (ported_sin (f64 (4571426573358191169))) (f64 (4571426559693739452)) &&
  out_eq64 (ported_cos (f64 (4571426573358191169))) (f64 (4607182341498405659)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3143 :
  out_eq64 (ported_sin (f64 (4622340438037735921))) (f64 (13830532696419326680)) &&
  out_eq64 (ported_cos (f64 (4622340438037735921))) (f64 (13813042093219445175)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3144 :
  out_eq64 (ported_sin (f64 (4619682765367117173))) (f64 (4604756817065992528)) &&
  out_eq64 (ported_cos (f64 (4619682765367117173))) (f64 (4604324383105461672)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3145 :
  out_eq64 (ported_sin (f64 (4619549853455145177))) (f64 (4603986789961319044)) &&
  out_eq64 (ported_cos (f64 (4619549853455145177))) (f64 (4605056737380317229)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3146 :
  out_eq64 (ported_sin (f64 (4619451501057462726))) (f64 (4603364263413771224)) &&
  out_eq64 (ported_cos (f64 (4619451501057462726))) (f64 (4605537519603372603)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3147 :
  out_eq64 (ported_sin (f64 (13750833267966546695))) (f64 (13750833267966522790)) &&
  out_eq64 (ported_cos (f64 (13750833267966546695))) (f64 (4607182418799906935)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3148 :
  out_eq64 (ported_sin (f64 (4537187305740046965))) (f64 (4537187305739505353)) &&
  out_eq64 (ported_cos (f64 (4537187305740046965))) (f64 (4607182418797788497)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3149 :
  out_eq64 (ported_sin (f64 (13847868700427272989))) (f64 (13828882675800720566)) &&
  out_eq64 (ported_cos (f64 (13847868700427272989))) (f64 (13826774230728562475)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3150 :
  out_eq64 (ported_sin (f64 (4595432218548670613))) (f64 (4595400705584168525)) &&
  out_eq64 (ported_cos (f64 (4595432218548670613))) (f64 (4607046619690772886)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3151 :
  out_eq64 (ported_sin (f64 (4622994155291734067))) (f64 (13825347696572703388)) &&
  out_eq64 (ported_cos (f64 (4622994155291734067))) (f64 (4606168364681236399)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3152 :
  out_eq64 (ported_sin (f64 (13839644137829135146))) (f64 (4605404535959943881)) &&
  out_eq64 (ported_cos (f64 (13839644137829135146))) (f64 (13826920023153897605)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3153 :
  out_eq64 (ported_sin (f64 (13838510311662005709))) (f64 (4600545755985329499)) &&
  out_eq64 (ported_cos (f64 (13838510311662005709))) (f64 (13829872891615832654)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3154 :
  out_eq64 (ported_sin (f64 (13850502653086874150))) (f64 (4605112165935413359)) &&
  out_eq64 (ported_cos (f64 (13850502653086874150))) (f64 (13827292551274553681)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3155 :
  out_eq64 (ported_sin (f64 (13849721516269043445))) (f64 (13830082147464289496)) &&
  out_eq64 (ported_cos (f64 (13849721516269043445))) (f64 (4599428449926238442)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3156 :
  out_eq64 (ported_sin (f64 (13850825100371772044))) (f64 (4606270574977269237)) &&
  out_eq64 (ported_cos (f64 (13850825100371772044))) (f64 (4601569685211206807)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3157 :
  out_eq64 (ported_sin (f64 (13868775807872771614))) (f64 (4602302213571505299)) &&
  out_eq64 (ported_cos (f64 (13868775807872771614))) (f64 (13829453447120697610)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3158 :
  out_eq64 (ported_sin (f64 (4624208093804593304))) (f64 (4607131379121627861)) &&
  out_eq64 (ported_cos (f64 (4624208093804593304))) (f64 (13815696615459017384)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3159 :
  out_eq64 (ported_sin (f64 (4626033484534602093))) (f64 (4593496818678718781)) &&
  out_eq64 (ported_cos (f64 (4626033484534602093))) (f64 (4607114498742160165)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3160 :
  out_eq64 (ported_sin (f64 (4612570571932035070))) (f64 (4604306777867191540)) &&
  out_eq64 (ported_cos (f64 (4612570571932035070))) (f64 (13828145258443061916)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3161 :
  out_eq64 (ported_sin (f64 (4625516019529724547))) (f64 (13830460290175450274)) &&
  out_eq64 (ported_cos (f64 (4625516019529724547))) (f64 (13817736159273976943)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3162 :
  out_eq64 (ported_sin (f64 (4627109172463956414))) (f64 (13828026807934406108)) &&
  out_eq64 (ported_cos (f64 (4627109172463956414))) (f64 (13827803856940941734)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3163 :
  out_eq64 (ported_sin (f64 (13920691177349587193))) (f64 (4605969902001134505)) &&
  out_eq64 (ported_cos (f64 (13920691177349587193))) (f64 (13826060854059009521)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3164 :
  out_eq64 (ported_sin (f64 (4546475910415855132))) (f64 (4546475910406026733)) &&
  out_eq64 (ported_cos (f64 (4546475910415855132))) (f64 (4607182418761232510)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3165 :
  out_eq64 (ported_sin (f64 (13828157028325758049))) (f64 (13827579560702695026)) &&
  out_eq64 (ported_cos (f64 (13828157028325758049))) (f64 (4604864086655252800)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3166 :
  out_eq64 (ported_sin (f64 (4625575117211718476))) (f64 (13830535298879803346)) &&
  out_eq64 (ported_cos (f64 (4625575117211718476))) (f64 (4589361523067301220)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3167 :
  out_eq64 (ported_sin (f64 (13836367415024351962))) (f64 (13826332672976889444)) &&
  out_eq64 (ported_cos (f64 (13836367415024351962))) (f64 (13829178077234060727)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3168 :
  out_eq64 (ported_sin (f64 (13814083597039302997))) (f64 (13814076501485950821)) &&
  out_eq64 (ported_cos (f64 (13814083597039302997))) (f64 (4607150719816326190)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3169 :
  out_eq64 (ported_sin (f64 (13835086696657127868))) (f64 (13829689142217150936)) &&
  out_eq64 (ported_cos (f64 (13835086696657127868))) (f64 (13824748027936101495)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3170 :
  out_eq64 (ported_sin (f64 (4495238495875976742))) (f64 (4495238495875976741)) &&
  out_eq64 (ported_cos (f64 (4495238495875976742))) (f64 (4607182418800017403)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3171 :
  out_eq64 (ported_sin (f64 (4693423583496555438))) (f64 (4606591113881949712)) &&
  out_eq64 (ported_cos (f64 (4693423583496555438))) (f64 (4600091078128240193)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3172 :
  out_eq64 (ported_sin (f64 (4623260125350797809))) (f64 (13797661976959560518)) &&
  out_eq64 (ported_cos (f64 (4623260125350797809))) (f64 (4607182221038196812)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3173 :
  out_eq64 (ported_sin (f64 (13839579468143354830))) (f64 (4605084181446316578)) &&
  out_eq64 (ported_cos (f64 (13839579468143354830))) (f64 (13827326173587950161)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3174 :
  out_eq64 (ported_sin (f64 (4610752489046596773))) (f64 (4606961535052236545)) &&
  out_eq64 (ported_cos (f64 (4610752489046596773))) (f64 (13820470049051242688)) = true.
Proof. vm_compute. reflexivity. Qed.

Example t_3175 :
  out_eq64 (ported_sin (f64 (13736116925912096396))) (f64 (13736116925912096209)) &&
  out_eq64 (ported_cos (f64 (13736116925912096396))) (f64 (4607182418800016320)) = true.
Proof. vm_compute. reflexivity. Qed.
