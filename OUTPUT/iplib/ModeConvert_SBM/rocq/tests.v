(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.iplib.ModeConvert_SBM.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  modeConvert_SBM_fun (f64 (4694428428020873060)) (f64 (13909875606412569204)) (f64 (4661949024290739460)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 10
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  modeConvert_SBM_fun (f64 (4683088663683732336)) (f64 (4683088663683732336)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919261331652114762)) (f64 (4664642903650263917)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  modeConvert_SBM_fun (f64 (13916636426833493707)) (f64 (4688465798187988412)) (f64 (9221120237041090560)) 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  modeConvert_SBM_fun (f64 (13916551264565812545)) (f64 (9221120237041090560)) (f64 (4661316234590577034)) 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  modeConvert_SBM_fun (f64 (4687569583053478200)) (f64 (4690283879765296552)) (f64 (4665251855098619923)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 32
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  modeConvert_SBM_fun (f64 (13912596511165819680)) (f64 (13912596511165819680)) (f64 (4607182418800017408)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4691827271742136600)) (f64 (4661429727595288580)) 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  modeConvert_SBM_fun (f64 (13910288359320600416)) (f64 (4694921795123315294)) (f64 (9221120237041090560)) 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 6
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  modeConvert_SBM_fun (f64 (13916179958909758932)) (f64 (9221120237041090560)) (f64 (4662871501699018966)) 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  modeConvert_SBM_fun (f64 (4694216504470234014)) (f64 (13906126458955082328)) (f64 (4659306235793240408)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 9
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  modeConvert_SBM_fun (f64 (13913435030931846008)) (f64 (13913435030931846008)) (f64 (4607182418800017408)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693310992639496304)) (f64 (4653079234587643567)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  modeConvert_SBM_fun (f64 (13919719447640056893)) (f64 (4692168086170994488)) (f64 (9221120237041090560)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 60
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  modeConvert_SBM_fun (f64 (4696357684583559490)) (f64 (9221120237041090560)) (f64 (4666066282874056788)) 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  modeConvert_SBM_fun (f64 (13901631835031225888)) (f64 (13901437819172648624)) (f64 (4666508044011228448)) 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  modeConvert_SBM_fun (f64 (13918655151661597165)) (f64 (13918655151661597165)) (f64 (4607182418800017408)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13915667799320425743)) (f64 (4666637797333757040)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  modeConvert_SBM_fun (f64 (4690503717003921980)) (f64 (13914606947688475906)) (f64 (9221120237041090560)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 58
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  modeConvert_SBM_fun (f64 (13908850437358288412)) (f64 (9221120237041090560)) (f64 (4663077657730703198)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  modeConvert_SBM_fun (f64 (4691381640873281008)) (f64 (13908900416044270712)) (f64 (4662150922994230357)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 68
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  modeConvert_SBM_fun (f64 (4661372771688434176)) (f64 (4661372771688434176)) (f64 (4607182418800017408)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695362492877531028)) (f64 (4659217776782652016)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  modeConvert_SBM_fun (f64 (4681893138679560720)) (f64 (13920199435906669904)) (f64 (9221120237041090560)) 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 7
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  modeConvert_SBM_fun (f64 (13905297504198918072)) (f64 (9221120237041090560)) (f64 (4658550507619228174)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  modeConvert_SBM_fun (f64 (13917146192774437396)) (f64 (4694106262631116168)) (f64 (4652283465695931667)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  modeConvert_SBM_fun (f64 (13907563657345523880)) (f64 (13907563657345523880)) (f64 (4607182418800017408)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695875763424922498)) (f64 (4657348988953984501)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  modeConvert_SBM_fun (f64 (13905278030492135616)) (f64 (4688501211760172724)) (f64 (9221120237041090560)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  modeConvert_SBM_fun (f64 (13919041091821840478)) (f64 (9221120237041090560)) (f64 (4664418523105879713)) 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  modeConvert_SBM_fun (f64 (4694972567102963038)) (f64 (13912231802129035518)) (f64 (4662042985928928881)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  modeConvert_SBM_fun (f64 (13909090022991495040)) (f64 (13909090022991495040)) (f64 (4607182418800017408)) 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694990203123039904)) (f64 (4664981834064699278)) 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  modeConvert_SBM_fun (f64 (4695062108554728802)) (f64 (13919192498408147092)) (f64 (9221120237041090560)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  modeConvert_SBM_fun (f64 (4694551681088831842)) (f64 (9221120237041090560)) (f64 (4666093959199603771)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  modeConvert_SBM_fun (f64 (13908171324324611364)) (f64 (4696281855433193370)) (f64 (4654380595127282541)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  modeConvert_SBM_fun (f64 (13911052169538329032)) (f64 (13911052169538329032)) (f64 (4607182418800017408)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13906872815791929560)) (f64 (4664354491688827502)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  modeConvert_SBM_fun (f64 (4683888562501057936)) (f64 (13920099520069316758)) (f64 (9221120237041090560)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 29
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 51
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  modeConvert_SBM_fun (f64 (13908129316812303284)) (f64 (9221120237041090560)) (f64 (4664894673665223454)) 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  modeConvert_SBM_fun (f64 (4695250993404073954)) (f64 (13914412029409629208)) (f64 (4655539955785259796)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 0
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  modeConvert_SBM_fun (f64 (13917196349882348157)) (f64 (13917196349882348157)) (f64 (4607182418800017408)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4689350080732375336)) (f64 (4652034580990982334)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  modeConvert_SBM_fun (f64 (4683879124676830160)) (f64 (13889109348580031744)) (f64 (9221120237041090560)) 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  modeConvert_SBM_fun (f64 (13915854599117579609)) (f64 (9221120237041090560)) (f64 (4664600501257849488)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  modeConvert_SBM_fun (f64 (13900640291810922240)) (f64 (4688026449296176688)) (f64 (4658931516780770218)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  modeConvert_SBM_fun (f64 (4693610964083968196)) (f64 (4693610964083968196)) (f64 (4607182418800017408)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4682361456193973712)) (f64 (4645418650451580831)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  modeConvert_SBM_fun (f64 (4689041244709064800)) (f64 (13916693836578864070)) (f64 (9221120237041090560)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 74
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  modeConvert_SBM_fun (f64 (13906238956743854712)) (f64 (9221120237041090560)) (f64 (4664809586974115285)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  modeConvert_SBM_fun (f64 (4689899203039165668)) (f64 (13917572995055155300)) (f64 (4663878773494791483)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  modeConvert_SBM_fun (f64 (4684592880231189712)) (f64 (4684592880231189712)) (f64 (4607182418800017408)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13886876486280155776)) (f64 (4666498395348526181)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  modeConvert_SBM_fun (f64 (13918335234210483802)) (f64 (13894083452443007360)) (f64 (9221120237041090560)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  modeConvert_SBM_fun (f64 (4689505485150184212)) (f64 (9221120237041090560)) (f64 (4661320766668564829)) 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  modeConvert_SBM_fun (f64 (4694478067446812180)) (f64 (13903232821563725472)) (f64 (4664477515235647280)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  modeConvert_SBM_fun (f64 (13918115685412950629)) (f64 (13918115685412950629)) (f64 (4607182418800017408)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693756341311588300)) (f64 (4662421832348917406)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  modeConvert_SBM_fun (f64 (13908036683808357588)) (f64 (4676787633571230752)) (f64 (9221120237041090560)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 51
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  modeConvert_SBM_fun (f64 (13918421203717122279)) (f64 (9221120237041090560)) (f64 (4663743636857378623)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  modeConvert_SBM_fun (f64 (13916880786829158641)) (f64 (13915949847359755527)) (f64 (4661368634006903893)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  modeConvert_SBM_fun (f64 (13918277714823976722)) (f64 (13918277714823976722)) (f64 (4607182418800017408)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696216099283821104)) (f64 (4659801485913150574)) 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  modeConvert_SBM_fun (f64 (4693010616278068978)) (f64 (4696086347930612340)) (f64 (9221120237041090560)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 5
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 74
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  modeConvert_SBM_fun (f64 (4658741971856428544)) (f64 (9221120237041090560)) (f64 (4666479580891306343)) 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  modeConvert_SBM_fun (f64 (13913630563993734452)) (f64 (13909042294671144904)) (f64 (4664900287130930115)) 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 14
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  modeConvert_SBM_fun (f64 (4694967743244795548)) (f64 (4694967743244795548)) (f64 (4607182418800017408)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13901455272270272480)) (f64 (4662480978953446677)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  modeConvert_SBM_fun (f64 (4685528639688401080)) (f64 (13915993977788961929)) (f64 (9221120237041090560)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  modeConvert_SBM_fun (f64 (13914384624085391582)) (f64 (9221120237041090560)) (f64 (4665521081822931884)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  modeConvert_SBM_fun (f64 (13919350126076284410)) (f64 (13912154624235189666)) (f64 (4663888958634637906)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  modeConvert_SBM_fun (f64 (4696353722900773572)) (f64 (4696353722900773572)) (f64 (4607182418800017408)) 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919655626119416400)) (f64 (4656887782371320615)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  modeConvert_SBM_fun (f64 (4693102453356914838)) (f64 (13913971616807713154)) (f64 (9221120237041090560)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 12
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  modeConvert_SBM_fun (f64 (4692645522472988584)) (f64 (9221120237041090560)) (f64 (4663454797324557203)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  modeConvert_SBM_fun (f64 (4691197683024135644)) (f64 (13917896677308338178)) (f64 (4660295685666201808)) 3
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 35
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  modeConvert_SBM_fun (f64 (4694334692045660650)) (f64 (4694334692045660650)) (f64 (4607182418800017408)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4690739205261169568)) (f64 (4662313783311271028)) 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  modeConvert_SBM_fun (f64 (13906777041942372992)) (f64 (13910334379598595664)) (f64 (9221120237041090560)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 70
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  modeConvert_SBM_fun (f64 (4685812578996419008)) (f64 (9221120237041090560)) (f64 (4648524963114340499)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  modeConvert_SBM_fun (f64 (13917017550077032071)) (f64 (13908274863803786748)) (f64 (4647819593439226532)) 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  modeConvert_SBM_fun (f64 (13915888718186426586)) (f64 (13915888718186426586)) (f64 (4607182418800017408)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696458549300173412)) (f64 (4666092903499887228)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  modeConvert_SBM_fun (f64 (13917095196599982034)) (f64 (13910115298963198316)) (f64 (9221120237041090560)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 19
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 40
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  modeConvert_SBM_fun (f64 (4695848035785209394)) (f64 (9221120237041090560)) (f64 (4663782301153958677)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  modeConvert_SBM_fun (f64 (13917449028870748098)) (f64 (4693127793145104490)) (f64 (13854415383030749633)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  modeConvert_SBM_fun (f64 (13907229084878380248)) (f64 (13907229084878380248)) (f64 (4607182418800017408)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13914829237655266888)) (f64 (4661674927528000186)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  modeConvert_SBM_fun (f64 (13916309270503114412)) (f64 (4671127390742122080)) (f64 (9221120237041090560)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  modeConvert_SBM_fun (f64 (13919558719172772472)) (f64 (9221120237041090560)) (f64 (4663333381065539900)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  modeConvert_SBM_fun (f64 (13911854932755398236)) (f64 (13912172584342569516)) (f64 (4653189959429749647)) 74
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  modeConvert_SBM_fun (f64 (4679675317175428160)) (f64 (4679675317175428160)) (f64 (4607182418800017408)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13908200313574299840)) (f64 (13859998902392903198)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  modeConvert_SBM_fun (f64 (4690282262050550988)) (f64 (13919968326170239772)) (f64 (9221120237041090560)) 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  modeConvert_SBM_fun (f64 (13918150949913285856)) (f64 (9221120237041090560)) (f64 (4666615176703843574)) 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  modeConvert_SBM_fun (f64 (13918408922319051688)) (f64 (13912932442596137528)) (f64 (13859012131743581930)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  modeConvert_SBM_fun (f64 (13907302634683741864)) (f64 (13907302634683741864)) (f64 (4607182418800017408)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4680343329096928384)) (f64 (4666464787658439886)) 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  modeConvert_SBM_fun (f64 (4691516468711992940)) (f64 (13903333646453402944)) (f64 (9221120237041090560)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  modeConvert_SBM_fun (f64 (13918851828297823287)) (f64 (9221120237041090560)) (f64 (4653710614307204108)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  modeConvert_SBM_fun (f64 (13917368866060183879)) (f64 (13908906475180848396)) (f64 (4662981431603449663)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  modeConvert_SBM_fun (f64 (4693924270087946970)) (f64 (4693924270087946970)) (f64 (4607182418800017408)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913906861865059948)) (f64 (4662074813222059623)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  modeConvert_SBM_fun (f64 (4696629662601721934)) (f64 (4696029404266806852)) (f64 (9221120237041090560)) 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 5
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 51
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  modeConvert_SBM_fun (f64 (13919135208968919015)) (f64 (9221120237041090560)) (f64 (4658626651661234546)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  modeConvert_SBM_fun (f64 (13916585717995515542)) (f64 (4695685341276053844)) (f64 (4666259198403413477)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  modeConvert_SBM_fun (f64 (13913489561179918388)) (f64 (13913489561179918388)) (f64 (4607182418800017408)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695105816880867450)) (f64 (4636574396842339744)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  modeConvert_SBM_fun (f64 (13912407822527565216)) (f64 (13918835578924500426)) (f64 (9221120237041090560)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  modeConvert_SBM_fun (f64 (13917746348678552974)) (f64 (9221120237041090560)) (f64 (4665762457704867355)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  modeConvert_SBM_fun (f64 (13919508041863654046)) (f64 (13916717069550664277)) (f64 (4643423260770220966)) 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 7
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  modeConvert_SBM_fun (f64 (13895485654000335968)) (f64 (13895485654000335968)) (f64 (4607182418800017408)) 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13918483145299499585)) (f64 (4664514971752169231)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  modeConvert_SBM_fun (f64 (4677310839867134848)) (f64 (13917386455609467187)) (f64 (9221120237041090560)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  modeConvert_SBM_fun (f64 (13916900639056980150)) (f64 (9221120237041090560)) (f64 (4655402268326599205)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  modeConvert_SBM_fun (f64 (13915826970299404995)) (f64 (13911039401607316856)) (f64 (4663820444769655344)) 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 21
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  modeConvert_SBM_fun (f64 (13919185518051816579)) (f64 (13919185518051816579)) (f64 (4607182418800017408)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4689497833952553008)) (f64 (4666057889702842185)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  modeConvert_SBM_fun (f64 (13917305414299970346)) (f64 (4696513600384493876)) (f64 (9221120237041090560)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  modeConvert_SBM_fun (f64 (13913652267208142044)) (f64 (9221120237041090560)) (f64 (4659155688489777601)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  modeConvert_SBM_fun (f64 (13883062300222806784)) (f64 (4689061024022027752)) (f64 (4657698240059422426)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 9
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  modeConvert_SBM_fun (f64 (13916749000335436204)) (f64 (13916749000335436204)) (f64 (4607182418800017408)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693140164142317868)) (f64 (4664216460375991078)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  modeConvert_SBM_fun (f64 (4696721174230814742)) (f64 (13918495336306218936)) (f64 (9221120237041090560)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 48
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  modeConvert_SBM_fun (f64 (4688739963809644428)) (f64 (9221120237041090560)) (f64 (4660517879014273714)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  modeConvert_SBM_fun (f64 (4692337492859845732)) (f64 (13917831457503501258)) (f64 (4666620937703943636)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 39
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  modeConvert_SBM_fun (f64 (13914826508495075752)) (f64 (13914826508495075752)) (f64 (4607182418800017408)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919056862076881738)) (f64 (4665910103709216084)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  modeConvert_SBM_fun (f64 (4693578022401199864)) (f64 (4690918122446760656)) (f64 (9221120237041090560)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  modeConvert_SBM_fun (f64 (13912766521199294178)) (f64 (9221120237041090560)) (f64 (4656817265141735096)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  modeConvert_SBM_fun (f64 (13918624263587036920)) (f64 (4683654756238532192)) (f64 (4665725675228152502)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 58
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  modeConvert_SBM_fun (f64 (13914627766265850312)) (f64 (13914627766265850312)) (f64 (4607182418800017408)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694188684004448740)) (f64 (4651492083971424394)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  modeConvert_SBM_fun (f64 (4694813092570310602)) (f64 (13912104304564960560)) (f64 (9221120237041090560)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 30
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 35
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  modeConvert_SBM_fun (f64 (4693053994133097452)) (f64 (9221120237041090560)) (f64 (4663681825429498067)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  modeConvert_SBM_fun (f64 (4696044627520712362)) (f64 (13917931889854097690)) (f64 (4664829535831017317)) 36
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 79
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  modeConvert_SBM_fun (f64 (13913691131114032788)) (f64 (13913691131114032788)) (f64 (4607182418800017408)) 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13911208251601055840)) (f64 (4652883725080000222)) 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  modeConvert_SBM_fun (f64 (13913508199215494426)) (f64 (4678845129548077312)) (f64 (9221120237041090560)) 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 49
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  modeConvert_SBM_fun (f64 (4684358008680914616)) (f64 (9221120237041090560)) (f64 (4651008530366149360)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  modeConvert_SBM_fun (f64 (4682985681992815056)) (f64 (13910764725134306944)) (f64 (4663622740562494698)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  modeConvert_SBM_fun (f64 (13919882508787555854)) (f64 (13919882508787555854)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4684628024288659640)) (f64 (4663160851708642339)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  modeConvert_SBM_fun (f64 (13917720159690693097)) (f64 (13916207832352827764)) (f64 (9221120237041090560)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 14
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  modeConvert_SBM_fun (f64 (4686152221843600456)) (f64 (9221120237041090560)) (f64 (4665160442250100637)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  modeConvert_SBM_fun (f64 (4690284729212575104)) (f64 (4689373891871242040)) (f64 (4661533102526421431)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 62
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  modeConvert_SBM_fun (f64 (4693188750005807992)) (f64 (4693188750005807992)) (f64 (4607182418800017408)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694713409409098072)) (f64 (4660016652463616798)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  modeConvert_SBM_fun (f64 (13914697963115452866)) (f64 (13903047344270875040)) (f64 (9221120237041090560)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 30
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  modeConvert_SBM_fun (f64 (13916146672449442950)) (f64 (9221120237041090560)) (f64 (4649890088580617340)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  modeConvert_SBM_fun (f64 (13918723905298666175)) (f64 (4694902805040119820)) (f64 (4665895101026445912)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  modeConvert_SBM_fun (f64 (13916978324843991506)) (f64 (13916978324843991506)) (f64 (4607182418800017408)) 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13918296339226210809)) (f64 (4658729038000388470)) 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  modeConvert_SBM_fun (f64 (13915676591353675026)) (f64 (4694521533720851192)) (f64 (9221120237041090560)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 49
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  modeConvert_SBM_fun (f64 (13917226943399368228)) (f64 (9221120237041090560)) (f64 (4659756935468102571)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  modeConvert_SBM_fun (f64 (13917400194876686900)) (f64 (4694273496787673218)) (f64 (4657249952260213897)) 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 5
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  modeConvert_SBM_fun (f64 (13911915653007954186)) (f64 (13911915653007954186)) (f64 (4607182418800017408)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693071642051990664)) (f64 (4662215779608995658)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  modeConvert_SBM_fun (f64 (13900782053701700832)) (f64 (13909090083222600988)) (f64 (9221120237041090560)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  modeConvert_SBM_fun (f64 (4696426251766992756)) (f64 (9221120237041090560)) (f64 (4641044261067374396)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  modeConvert_SBM_fun (f64 (4696420732470322066)) (f64 (4665806758121431488)) (f64 (4663490479660881813)) 16
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  modeConvert_SBM_fun (f64 (4690683386223156804)) (f64 (4690683386223156804)) (f64 (4607182418800017408)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13911083197170683332)) (f64 (4665772512062855953)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  modeConvert_SBM_fun (f64 (13918918381742768458)) (f64 (13906528966928365352)) (f64 (9221120237041090560)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  modeConvert_SBM_fun (f64 (13916750245573467736)) (f64 (9221120237041090560)) (f64 (4665663239565524494)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  modeConvert_SBM_fun (f64 (4695478796004447416)) (f64 (4686089190840673504)) (f64 (4654366923346675192)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  modeConvert_SBM_fun (f64 (4679654315673544176)) (f64 (4679654315673544176)) (f64 (4607182418800017408)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13918109386555345805)) (f64 (4663827613552940001)) 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  modeConvert_SBM_fun (f64 (4696553708176147400)) (f64 (4693357801559541572)) (f64 (9221120237041090560)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 11
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  modeConvert_SBM_fun (f64 (13919252673265815484)) (f64 (9221120237041090560)) (f64 (4661878322083018654)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  modeConvert_SBM_fun (f64 (4694184907391160928)) (f64 (13919551857470800738)) (f64 (13857151787164047650)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  modeConvert_SBM_fun (f64 (4690943508172637892)) (f64 (4690943508172637892)) (f64 (4607182418800017408)) 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694916218509693646)) (f64 (4665156410875587009)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  modeConvert_SBM_fun (f64 (13919628358161743398)) (f64 (13919824351946158979)) (f64 (9221120237041090560)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 56
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 23
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  modeConvert_SBM_fun (f64 (13917122972134059916)) (f64 (9221120237041090560)) (f64 (4659348001527755186)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  modeConvert_SBM_fun (f64 (13917538278015501498)) (f64 (4693572671993139202)) (f64 (4657113953806518131)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  modeConvert_SBM_fun (f64 (4685623684888611560)) (f64 (4685623684888611560)) (f64 (4607182418800017408)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696657048878177686)) (f64 (4666019996477109749)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  modeConvert_SBM_fun (f64 (13919665461698459750)) (f64 (13911519553208416184)) (f64 (9221120237041090560)) 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  modeConvert_SBM_fun (f64 (4693900626171216978)) (f64 (9221120237041090560)) (f64 (4664276874958070707)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  modeConvert_SBM_fun (f64 (4692813740310197648)) (f64 (4693363255639337570)) (f64 (4660388823030843526)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  modeConvert_SBM_fun (f64 (13918354454199863631)) (f64 (13918354454199863631)) (f64 (4607182418800017408)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4690256500522799864)) (f64 (4663043048027018013)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  modeConvert_SBM_fun (f64 (4688605674263402760)) (f64 (4692715093615918476)) (f64 (9221120237041090560)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 12
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  modeConvert_SBM_fun (f64 (13907628000652790076)) (f64 (9221120237041090560)) (f64 (4666254703535809051)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  modeConvert_SBM_fun (f64 (13916973823353166056)) (f64 (4687502431340725488)) (f64 (4657252984970628654)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 30
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  modeConvert_SBM_fun (f64 (4681245120908878064)) (f64 (4681245120908878064)) (f64 (4607182418800017408)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919388402553101943)) (f64 (4665971252139953884)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  modeConvert_SBM_fun (f64 (4692989046122043230)) (f64 (13913283380623882568)) (f64 (9221120237041090560)) 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 32
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  modeConvert_SBM_fun (f64 (13917444225249867011)) (f64 (9221120237041090560)) (f64 (4662317850417013478)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  modeConvert_SBM_fun (f64 (4688582158937493992)) (f64 (13918410735592092643)) (f64 (4661720841212978586)) 55
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 36
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  modeConvert_SBM_fun (f64 (13914037980929509536)) (f64 (13914037980929509536)) (f64 (4607182418800017408)) 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13912198042797786628)) (f64 (4655930481460005592)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  modeConvert_SBM_fun (f64 (4685575764065994480)) (f64 (13918842273558681951)) (f64 (9221120237041090560)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  modeConvert_SBM_fun (f64 (4695834336445921682)) (f64 (9221120237041090560)) (f64 (4656526818275468194)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  modeConvert_SBM_fun (f64 (4692685493803673012)) (f64 (13908395993887739456)) (f64 (4665851768199959320)) 69
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  modeConvert_SBM_fun (f64 (4692461732740718500)) (f64 (4692461732740718500)) (f64 (4607182418800017408)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4684961990883091944)) (f64 (4659361903342850475)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  modeConvert_SBM_fun (f64 (13919599839105038016)) (f64 (13908450152213654332)) (f64 (9221120237041090560)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 15
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 3
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  modeConvert_SBM_fun (f64 (4696391237328038332)) (f64 (9221120237041090560)) (f64 (4666484634978900106)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  modeConvert_SBM_fun (f64 (4686951444090507920)) (f64 (4693637702579199944)) (f64 (4665788685135738237)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  modeConvert_SBM_fun (f64 (13896200637208651584)) (f64 (13896200637208651584)) (f64 (4607182418800017408)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4688583154048990412)) (f64 (4666100849819772121)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  modeConvert_SBM_fun (f64 (13916727801522910118)) (f64 (4695885318629399412)) (f64 (9221120237041090560)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 57
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  modeConvert_SBM_fun (f64 (13911714942177865876)) (f64 (9221120237041090560)) (f64 (4653507961433873755)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  modeConvert_SBM_fun (f64 (4688657894468163856)) (f64 (13859140436339507200)) (f64 (4665648746832165760)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 15
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  modeConvert_SBM_fun (f64 (4678037844080745728)) (f64 (4678037844080745728)) (f64 (4607182418800017408)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694087117429094594)) (f64 (4660121164275715257)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  modeConvert_SBM_fun (f64 (13907760558088265700)) (f64 (13915317076558492439)) (f64 (9221120237041090560)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  modeConvert_SBM_fun (f64 (13908387597854115004)) (f64 (9221120237041090560)) (f64 (4657142374675326424)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  modeConvert_SBM_fun (f64 (13908708359223424912)) (f64 (13916564699598118400)) (f64 (4663021580197726488)) 39
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  modeConvert_SBM_fun (f64 (13909125916889393456)) (f64 (13909125916889393456)) (f64 (4607182418800017408)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4687119639726858456)) (f64 (4655681103832521762)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  modeConvert_SBM_fun (f64 (4690365148665817344)) (f64 (4693220135255299914)) (f64 (9221120237041090560)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 28
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 27
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  modeConvert_SBM_fun (f64 (4695428324710573792)) (f64 (9221120237041090560)) (f64 (4665185050893034760)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  modeConvert_SBM_fun (f64 (13918230057340907016)) (f64 (4675875928850892560)) (f64 (4657660711776557419)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 10
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  modeConvert_SBM_fun (f64 (13918484540709696170)) (f64 (13918484540709696170)) (f64 (4607182418800017408)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696490758512837998)) (f64 (4659305517876454338)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  modeConvert_SBM_fun (f64 (13919208414935941785)) (f64 (4695575890706448674)) (f64 (9221120237041090560)) 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 45
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 32
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  modeConvert_SBM_fun (f64 (4671297687235651360)) (f64 (9221120237041090560)) (f64 (13851413473196585476)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  modeConvert_SBM_fun (f64 (4688921730128772136)) (f64 (4684020192889210208)) (f64 (4659972597530687901)) 10
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  modeConvert_SBM_fun (f64 (4687320297613486760)) (f64 (4687320297613486760)) (f64 (4607182418800017408)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695497502503726442)) (f64 (4664967115659216270)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  modeConvert_SBM_fun (f64 (4689243575909987968)) (f64 (4687660381558691032)) (f64 (9221120237041090560)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 39
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  modeConvert_SBM_fun (f64 (4696650413614568362)) (f64 (9221120237041090560)) (f64 (4644658096577494402)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  modeConvert_SBM_fun (f64 (13918013743719759278)) (f64 (13909423256840520528)) (f64 (4665393165008470210)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 39
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  modeConvert_SBM_fun (f64 (13919390631681369357)) (f64 (13919390631681369357)) (f64 (4607182418800017408)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4684904376573911640)) (f64 (4666002859529813536)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  modeConvert_SBM_fun (f64 (4690942606875871304)) (f64 (13916913180548562558)) (f64 (9221120237041090560)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 12
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  modeConvert_SBM_fun (f64 (4695088972583674296)) (f64 (9221120237041090560)) (f64 (4664547823620292307)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  modeConvert_SBM_fun (f64 (4682396790329712464)) (f64 (4695362313784234130)) (f64 (4664185967221432870)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  modeConvert_SBM_fun (f64 (13919487286040816369)) (f64 (13919487286040816369)) (f64 (4607182418800017408)) 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4684582961039595440)) (f64 (4665106025381840414)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  modeConvert_SBM_fun (f64 (13895918211906343136)) (f64 (13911502977782163840)) (f64 (9221120237041090560)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  modeConvert_SBM_fun (f64 (4695006794873348990)) (f64 (9221120237041090560)) (f64 (4663353293375117329)) 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  modeConvert_SBM_fun (f64 (4695323172917998034)) (f64 (13918159497025640140)) (f64 (4665824108790268679)) 57
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 28
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  modeConvert_SBM_fun (f64 (13901009694331846768)) (f64 (13901009694331846768)) (f64 (4607182418800017408)) 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13908627900912521316)) (f64 (4665951476953208125)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  modeConvert_SBM_fun (f64 (4696331699932638650)) (f64 (13913629616456391812)) (f64 (9221120237041090560)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 53
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  modeConvert_SBM_fun (f64 (13913177043577159558)) (f64 (9221120237041090560)) (f64 (4644774580509976918)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  modeConvert_SBM_fun (f64 (13917024407475343474)) (f64 (4696534490611358776)) (f64 (4663135601990955328)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 41
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  modeConvert_SBM_fun (f64 (4682422229161322016)) (f64 (4682422229161322016)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916565373359956466)) (f64 (4663494732624153331)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  modeConvert_SBM_fun (f64 (13909072491483530304)) (f64 (13903144808385513632)) (f64 (9221120237041090560)) 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 7
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  modeConvert_SBM_fun (f64 (13917209018373983369)) (f64 (9221120237041090560)) (f64 (4661988303978260916)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  modeConvert_SBM_fun (f64 (13918671524694877110)) (f64 (4693832217293280684)) (f64 (4661958366005769464)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  modeConvert_SBM_fun (f64 (13916368327051581348)) (f64 (13916368327051581348)) (f64 (4607182418800017408)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4682076825317323296)) (f64 (4657751967922221687)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  modeConvert_SBM_fun (f64 (13919249716487701928)) (f64 (4694903432083187206)) (f64 (9221120237041090560)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  modeConvert_SBM_fun (f64 (13914186230009998020)) (f64 (9221120237041090560)) (f64 (4661109352451361948)) 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  modeConvert_SBM_fun (f64 (4695303132022077420)) (f64 (13908087810933880448)) (f64 (4660982725985408707)) 70
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  modeConvert_SBM_fun (f64 (4695492617864424210)) (f64 (4695492617864424210)) (f64 (4607182418800017408)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696071484653705920)) (f64 (4664900533190684792)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  modeConvert_SBM_fun (f64 (4691209245822258724)) (f64 (13918491184506083961)) (f64 (9221120237041090560)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 23
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 40
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  modeConvert_SBM_fun (f64 (13909559756271448980)) (f64 (9221120237041090560)) (f64 (4663071255162950355)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  modeConvert_SBM_fun (f64 (4696366926378098850)) (f64 (4688350552906138284)) (f64 (4645940512116538513)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  modeConvert_SBM_fun (f64 (13894099201507064320)) (f64 (13894099201507064320)) (f64 (4607182418800017408)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4690949064652164716)) (f64 (4655742658199049991)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  modeConvert_SBM_fun (f64 (4681714858099082624)) (f64 (13910855203077006476)) (f64 (9221120237041090560)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 29
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 9
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  modeConvert_SBM_fun (f64 (13915314275246226314)) (f64 (9221120237041090560)) (f64 (13848679548948361744)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  modeConvert_SBM_fun (f64 (13919742961864276591)) (f64 (4671915249225358752)) (f64 (4664809695881868326)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  modeConvert_SBM_fun (f64 (4689235830594937648)) (f64 (4689235830594937648)) (f64 (4607182418800017408)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13910522874406517308)) (f64 (4657031917944777060)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  modeConvert_SBM_fun (f64 (13916188578666755466)) (f64 (13919702842650005614)) (f64 (9221120237041090560)) 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  modeConvert_SBM_fun (f64 (13917616877677765199)) (f64 (9221120237041090560)) (f64 (4659362515513563576)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  modeConvert_SBM_fun (f64 (4693158303030329154)) (f64 (13918530598823542320)) (f64 (4654147309760319203)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  modeConvert_SBM_fun (f64 (13902906083709748496)) (f64 (13902906083709748496)) (f64 (4607182418800017408)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4690541877756096252)) (f64 (4658029553939495180)) 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  modeConvert_SBM_fun (f64 (13910890436758000732)) (f64 (13905389544246355952)) (f64 (9221120237041090560)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  modeConvert_SBM_fun (f64 (4685365830388445920)) (f64 (9221120237041090560)) (f64 (4648832993283855124)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  modeConvert_SBM_fun (f64 (13917535496954923540)) (f64 (4666087260776064576)) (f64 (4657805492191706452)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  modeConvert_SBM_fun (f64 (4691747171800067424)) (f64 (4691747171800067424)) (f64 (4607182418800017408)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695369681144613600)) (f64 (4663932543381571235)) 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  modeConvert_SBM_fun (f64 (13916507080014895078)) (f64 (4695351827129117260)) (f64 (9221120237041090560)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 53
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 47
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  modeConvert_SBM_fun (f64 (4689098466329231008)) (f64 (9221120237041090560)) (f64 (4664256601874480489)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  modeConvert_SBM_fun (f64 (13913452818700821010)) (f64 (4690067705391745384)) (f64 (4660650300151941955)) 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  modeConvert_SBM_fun (f64 (4683291207632603008)) (f64 (4683291207632603008)) (f64 (4607182418800017408)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913171496338473442)) (f64 (4654335958333146150)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  modeConvert_SBM_fun (f64 (13907607785441505720)) (f64 (4694911690509384422)) (f64 (9221120237041090560)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 10
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  modeConvert_SBM_fun (f64 (4693796111665205104)) (f64 (9221120237041090560)) (f64 (4664124145261740923)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  modeConvert_SBM_fun (f64 (13919332218128746762)) (f64 (13916218524974192232)) (f64 (4665885208342131062)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  modeConvert_SBM_fun (f64 (13918704691765571393)) (f64 (13918704691765571393)) (f64 (4607182418800017408)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696477338792689842)) (f64 (4664586584909738127)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  modeConvert_SBM_fun (f64 (13903527307652207312)) (f64 (4693570186723136766)) (f64 (9221120237041090560)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 15
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 9
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  modeConvert_SBM_fun (f64 (4691004233356077512)) (f64 (9221120237041090560)) (f64 (4655927683089246675)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  modeConvert_SBM_fun (f64 (4694332249498432046)) (f64 (4689773848923821960)) (f64 (4665105536687321645)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 79
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  modeConvert_SBM_fun (f64 (13885095168113517056)) (f64 (13885095168113517056)) (f64 (4607182418800017408)) 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695833719307713546)) (f64 (4666618717503971694)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  modeConvert_SBM_fun (f64 (13912327013217423370)) (f64 (13916233200902605590)) (f64 (9221120237041090560)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 68
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  modeConvert_SBM_fun (f64 (4694527470223338286)) (f64 (9221120237041090560)) (f64 (4664360458319718982)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  modeConvert_SBM_fun (f64 (4684612134717332360)) (f64 (4691199172300850004)) (f64 (4661297769482126290)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  modeConvert_SBM_fun (f64 (13898830433861293888)) (f64 (13898830433861293888)) (f64 (4607182418800017408)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13917217096524763629)) (f64 (4663503587709470176)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  modeConvert_SBM_fun (f64 (13916526791986074733)) (f64 (13919133373799386003)) (f64 (9221120237041090560)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 7
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 47
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  modeConvert_SBM_fun (f64 (4693861052772957656)) (f64 (9221120237041090560)) (f64 (4663653657220902188)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  modeConvert_SBM_fun (f64 (13918608897121952937)) (f64 (4684529711895334856)) (f64 (4661262768891003754)) 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  modeConvert_SBM_fun (f64 (4689760121504517792)) (f64 (4689760121504517792)) (f64 (4607182418800017408)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13914601489752806530)) (f64 (4652403842741631265)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  modeConvert_SBM_fun (f64 (4693162542283158894)) (f64 (13902846851867455592)) (f64 (9221120237041090560)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 12
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  modeConvert_SBM_fun (f64 (13914718338398829296)) (f64 (9221120237041090560)) (f64 (4666033322395181852)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  modeConvert_SBM_fun (f64 (4690495119084859864)) (f64 (13919466355306943217)) (f64 (4664842386000602755)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  modeConvert_SBM_fun (f64 (13914406063785924060)) (f64 (13914406063785924060)) (f64 (4607182418800017408)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4684022119543495976)) (f64 (4666061018902036148)) 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  modeConvert_SBM_fun (f64 (13902076814856330832)) (f64 (13918492231973025546)) (f64 (9221120237041090560)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 58
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  modeConvert_SBM_fun (f64 (4696635989569709868)) (f64 (9221120237041090560)) (f64 (4653574709492980351)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  modeConvert_SBM_fun (f64 (13918077116136432725)) (f64 (4696261773186707860)) (f64 (4659588128758052788)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  modeConvert_SBM_fun (f64 (13914255007972333614)) (f64 (13914255007972333614)) (f64 (4607182418800017408)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913473701022443448)) (f64 (4657209708221297507)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  modeConvert_SBM_fun (f64 (13916916084790049586)) (f64 (4695533866791333642)) (f64 (9221120237041090560)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 0
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  modeConvert_SBM_fun (f64 (13916084878908729080)) (f64 (9221120237041090560)) (f64 (4656703463373594462)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  modeConvert_SBM_fun (f64 (4679763419758824688)) (f64 (4696227058945163042)) (f64 (4666610542446573793)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  modeConvert_SBM_fun (f64 (13912587382985846786)) (f64 (13912587382985846786)) (f64 (4607182418800017408)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919553494559527961)) (f64 (4664059289608022659)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  modeConvert_SBM_fun (f64 (4691215987562641328)) (f64 (4693330609848059608)) (f64 (9221120237041090560)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 32
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  modeConvert_SBM_fun (f64 (13910435136295348320)) (f64 (9221120237041090560)) (f64 (4666166357149501431)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  modeConvert_SBM_fun (f64 (4695777176002640796)) (f64 (4693406822838225708)) (f64 (4645893992689294075)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 73
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  modeConvert_SBM_fun (f64 (4690599326636709120)) (f64 (4690599326636709120)) (f64 (4607182418800017408)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13917909761550543528)) (f64 (4662471126832634460)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  modeConvert_SBM_fun (f64 (13918917544879884925)) (f64 (4689406101535442180)) (f64 (9221120237041090560)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 74
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 47
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  modeConvert_SBM_fun (f64 (4694593368715245254)) (f64 (9221120237041090560)) (f64 (4657357745470136844)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  modeConvert_SBM_fun (f64 (13920093297842546466)) (f64 (13912658328134017014)) (f64 (4663861746781081747)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  modeConvert_SBM_fun (f64 (4691929358263136700)) (f64 (4691929358263136700)) (f64 (4607182418800017408)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913585225153062962)) (f64 (4666716424827733712)) 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  modeConvert_SBM_fun (f64 (4690076929108603412)) (f64 (4692041710462818672)) (f64 (9221120237041090560)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 69
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 44
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  modeConvert_SBM_fun (f64 (13917858187340695684)) (f64 (9221120237041090560)) (f64 (4666000648609040491)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  modeConvert_SBM_fun (f64 (4694130335505840868)) (f64 (13918680747758286687)) (f64 (4646463414065824486)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 58
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  modeConvert_SBM_fun (f64 (13917573615574779310)) (f64 (13917573615574779310)) (f64 (4607182418800017408)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693637601851775954)) (f64 (4661273169898210586)) 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  modeConvert_SBM_fun (f64 (4694479901307147112)) (f64 (13911943390813599510)) (f64 (9221120237041090560)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  modeConvert_SBM_fun (f64 (4690382564407502948)) (f64 (9221120237041090560)) (f64 (4662087593320132810)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  modeConvert_SBM_fun (f64 (13917374951097470294)) (f64 (4694222759450340990)) (f64 (13859227777240986394)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  modeConvert_SBM_fun (f64 (13915911899568542477)) (f64 (13915911899568542477)) (f64 (4607182418800017408)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916726177223062124)) (f64 (4654674238381734212)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  modeConvert_SBM_fun (f64 (13915087779955012974)) (f64 (13900167761597740144)) (f64 (9221120237041090560)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  modeConvert_SBM_fun (f64 (4688288131199301364)) (f64 (9221120237041090560)) (f64 (4666120959117448905)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  modeConvert_SBM_fun (f64 (4690891031408590728)) (f64 (13916909682291105884)) (f64 (4660974006382660236)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  modeConvert_SBM_fun (f64 (13915361654760342358)) (f64 (13915361654760342358)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695760027137716958)) (f64 (4662991405197016120)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  modeConvert_SBM_fun (f64 (4694827963937343542)) (f64 (4696764052365748618)) (f64 (9221120237041090560)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  modeConvert_SBM_fun (f64 (13909225341404225592)) (f64 (9221120237041090560)) (f64 (4659099889555981257)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  modeConvert_SBM_fun (f64 (13891599676570018688)) (f64 (4692974018555702234)) (f64 (4657345897873760479)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 79
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  modeConvert_SBM_fun (f64 (4692136533295357540)) (f64 (4692136533295357540)) (f64 (4607182418800017408)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13912881254582611396)) (f64 (4665927409104633054)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  modeConvert_SBM_fun (f64 (13906046738571800656)) (f64 (13913354881979394436)) (f64 (9221120237041090560)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 23
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  modeConvert_SBM_fun (f64 (13916491746264777170)) (f64 (9221120237041090560)) (f64 (4662198228171749523)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  modeConvert_SBM_fun (f64 (13908367106292936248)) (f64 (13913046695276710904)) (f64 (4656942240234107880)) 48
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  modeConvert_SBM_fun (f64 (13919326353346992906)) (f64 (13919326353346992906)) (f64 (4607182418800017408)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695652859579203352)) (f64 (4661610570044822415)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  modeConvert_SBM_fun (f64 (13918418331991567731)) (f64 (4693435730305311540)) (f64 (9221120237041090560)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 30
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 29
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  modeConvert_SBM_fun (f64 (4677448467074515264)) (f64 (9221120237041090560)) (f64 (4655856541205145855)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  modeConvert_SBM_fun (f64 (4683382085295714080)) (f64 (13912689981067889926)) (f64 (4653718590998078722)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 1
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  modeConvert_SBM_fun (f64 (4692824000257808106)) (f64 (4692824000257808106)) (f64 (4607182418800017408)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13912133688566178158)) (f64 (4658599407943412775)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  modeConvert_SBM_fun (f64 (13913282051525760838)) (f64 (13918603907690366664)) (f64 (9221120237041090560)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 45
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  modeConvert_SBM_fun (f64 (13919036123342750632)) (f64 (9221120237041090560)) (f64 (4654060804493921130)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  modeConvert_SBM_fun (f64 (13919753423581466815)) (f64 (13919705468167070306)) (f64 (4656994881796973662)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  modeConvert_SBM_fun (f64 (4694612377760817434)) (f64 (4694612377760817434)) (f64 (4607182418800017408)) 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13911959472922374958)) (f64 (4648235087517225117)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  modeConvert_SBM_fun (f64 (4676025686450299712)) (f64 (13917781768114885964)) (f64 (9221120237041090560)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  modeConvert_SBM_fun (f64 (4695215573345208888)) (f64 (9221120237041090560)) (f64 (4659018367274091416)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  modeConvert_SBM_fun (f64 (4694446575305192088)) (f64 (13916734448969280834)) (f64 (4665587416459309094)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  modeConvert_SBM_fun (f64 (4674042456524081728)) (f64 (4674042456524081728)) (f64 (4607182418800017408)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13905255391384189968)) (f64 (4656747976223748423)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  modeConvert_SBM_fun (f64 (13918959144157780658)) (f64 (13918365754566308816)) (f64 (9221120237041090560)) 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 57
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  modeConvert_SBM_fun (f64 (4684002374823233344)) (f64 (9221120237041090560)) (f64 (4656736039973884228)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  modeConvert_SBM_fun (f64 (4694007537251515750)) (f64 (13911857005641066342)) (f64 (4666051264675131087)) 62
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  modeConvert_SBM_fun (f64 (13913129327354082688)) (f64 (13913129327354082688)) (f64 (4607182418800017408)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4687443949363399536)) (f64 (4664436537040354241)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  modeConvert_SBM_fun (f64 (4694146140688262610)) (f64 (4694340990761362304)) (f64 (9221120237041090560)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 62
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  modeConvert_SBM_fun (f64 (4694878968936708004)) (f64 (9221120237041090560)) (f64 (4662803966636841106)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  modeConvert_SBM_fun (f64 (4696077177969089998)) (f64 (4696784523065486170)) (f64 (4659808027317484374)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 28
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  modeConvert_SBM_fun (f64 (4695994498491472280)) (f64 (4695994498491472280)) (f64 (4607182418800017408)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696762466879131302)) (f64 (4658430480827607196)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  modeConvert_SBM_fun (f64 (13915892411349610683)) (f64 (13917135098879748074)) (f64 (9221120237041090560)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  modeConvert_SBM_fun (f64 (4688095640297644064)) (f64 (9221120237041090560)) (f64 (4655398098389289701)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  modeConvert_SBM_fun (f64 (4691724359068454716)) (f64 (4690143208145005560)) (f64 (4666362742836076807)) 6
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 16
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  modeConvert_SBM_fun (f64 (13911726306433568356)) (f64 (13911726306433568356)) (f64 (4607182418800017408)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916060630665115887)) (f64 (4665441487420047452)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  modeConvert_SBM_fun (f64 (13917746211598486902)) (f64 (13916917891320964300)) (f64 (9221120237041090560)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 53
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  modeConvert_SBM_fun (f64 (4671117452899981920)) (f64 (9221120237041090560)) (f64 (4660839550529002099)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  modeConvert_SBM_fun (f64 (4693753991514508924)) (f64 (4688656267046358372)) (f64 (4666123240333816336)) 27
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  modeConvert_SBM_fun (f64 (4695042906522306650)) (f64 (4695042906522306650)) (f64 (4607182418800017408)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695290728444715792)) (f64 (4663389530449683045)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  modeConvert_SBM_fun (f64 (4690101840914407036)) (f64 (13912468871211036404)) (f64 (9221120237041090560)) 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  modeConvert_SBM_fun (f64 (4694012141325928102)) (f64 (9221120237041090560)) (f64 (4652185227885351648)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  modeConvert_SBM_fun (f64 (4689335868857548916)) (f64 (13916491900890036248)) (f64 (4658823210926326938)) 28
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 3
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  modeConvert_SBM_fun (f64 (13916847483395077254)) (f64 (13916847483395077254)) (f64 (4607182418800017408)) 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4695607769215602090)) (f64 (4653444739553725159)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  modeConvert_SBM_fun (f64 (13915725547318209846)) (f64 (13917154187896093572)) (f64 (9221120237041090560)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  modeConvert_SBM_fun (f64 (4696691807563442730)) (f64 (9221120237041090560)) (f64 (4661533978213678552)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  modeConvert_SBM_fun (f64 (13919240622186067390)) (f64 (13917365626582371742)) (f64 (4661989834411176074)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  modeConvert_SBM_fun (f64 (13920150466578221635)) (f64 (13920150466578221635)) (f64 (4607182418800017408)) 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4688221130755876496)) (f64 (4660549642603862851)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  modeConvert_SBM_fun (f64 (13911524338332849456)) (f64 (13919437332870742376)) (f64 (9221120237041090560)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  modeConvert_SBM_fun (f64 (4693719918528362554)) (f64 (9221120237041090560)) (f64 (13855861547773671938)) 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  modeConvert_SBM_fun (f64 (4692449072031378528)) (f64 (4689786629135321448)) (f64 (4651942452418426312)) 45
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  modeConvert_SBM_fun (f64 (4696440444487456372)) (f64 (4696440444487456372)) (f64 (4607182418800017408)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13911372424852264328)) (f64 (4643533189169702828)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  modeConvert_SBM_fun (f64 (4689762654156242892)) (f64 (13911714820859731628)) (f64 (9221120237041090560)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 45
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 35
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  modeConvert_SBM_fun (f64 (4694223028105545234)) (f64 (9221120237041090560)) (f64 (4662702576675372945)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  modeConvert_SBM_fun (f64 (13909683731916048292)) (f64 (13918579990693907992)) (f64 (4663138271673267531)) 11
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  modeConvert_SBM_fun (f64 (4688324004042055104)) (f64 (4688324004042055104)) (f64 (4607182418800017408)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13912565759350373784)) (f64 (4652821507568473132)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  modeConvert_SBM_fun (f64 (13908110498863079368)) (f64 (13912440972941800770)) (f64 (9221120237041090560)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 73
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  modeConvert_SBM_fun (f64 (4694416342436274992)) (f64 (9221120237041090560)) (f64 (4663571128639702961)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  modeConvert_SBM_fun (f64 (13913187212843033734)) (f64 (4689000652332855716)) (f64 (4658465674582170556)) 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 48
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  modeConvert_SBM_fun (f64 (4672957882040188544)) (f64 (4672957882040188544)) (f64 (4607182418800017408)) 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13899147697962017184)) (f64 (4661801790221437938)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  modeConvert_SBM_fun (f64 (4692344246818377640)) (f64 (13898225722934627232)) (f64 (9221120237041090560)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  modeConvert_SBM_fun (f64 (4693724219916489190)) (f64 (9221120237041090560)) (f64 (4666721328421934862)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  modeConvert_SBM_fun (f64 (13898687567018016048)) (f64 (13917556307719960676)) (f64 (4655536438278539590)) 60
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  modeConvert_SBM_fun (f64 (4689019065989998060)) (f64 (4689019065989998060)) (f64 (4607182418800017408)) 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696780854993685444)) (f64 (4661180012347666870)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  modeConvert_SBM_fun (f64 (13912489829294008740)) (f64 (4684674909410955784)) (f64 (9221120237041090560)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 71
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  modeConvert_SBM_fun (f64 (13909624176007434476)) (f64 (9221120237041090560)) (f64 (4666080473644437903)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  modeConvert_SBM_fun (f64 (13917511259120891176)) (f64 (4694234510204173172)) (f64 (4649754340947747324)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  modeConvert_SBM_fun (f64 (4693641280761566986)) (f64 (4693641280761566986)) (f64 (4607182418800017408)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13911486420365713460)) (f64 (13858967521742491331)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  modeConvert_SBM_fun (f64 (13919636406917933347)) (f64 (13919550155455275600)) (f64 (9221120237041090560)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 62
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  modeConvert_SBM_fun (f64 (4694294402910539574)) (f64 (9221120237041090560)) (f64 (4662820899610580175)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  modeConvert_SBM_fun (f64 (4693673361193877494)) (f64 (4695470385628733462)) (f64 (4660416543614545103)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 34
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  modeConvert_SBM_fun (f64 (4696612551389953396)) (f64 (4696612551389953396)) (f64 (4607182418800017408)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4683310319723664768)) (f64 (4665352571346436896)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  modeConvert_SBM_fun (f64 (13916871458175419240)) (f64 (13908859758158375420)) (f64 (9221120237041090560)) 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 2
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  modeConvert_SBM_fun (f64 (4692362154976532728)) (f64 (9221120237041090560)) (f64 (4663868943976286167)) 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  modeConvert_SBM_fun (f64 (13919845088613852080)) (f64 (4685749917265685040)) (f64 (4662397240567021362)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 70
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  modeConvert_SBM_fun (f64 (4687468951370914184)) (f64 (4687468951370914184)) (f64 (4607182418800017408)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13907763017108186200)) (f64 (4640078216335945190)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  modeConvert_SBM_fun (f64 (13912023028684750496)) (f64 (13915367254008139492)) (f64 (9221120237041090560)) 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 51
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  modeConvert_SBM_fun (f64 (13914540932942056808)) (f64 (9221120237041090560)) (f64 (4653205894138718800)) 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  modeConvert_SBM_fun (f64 (4692964084642225512)) (f64 (13918472104531541011)) (f64 (4666118108502783426)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  modeConvert_SBM_fun (f64 (13918208334543436025)) (f64 (13918208334543436025)) (f64 (4607182418800017408)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916212826806813926)) (f64 (4663211896737157283)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  modeConvert_SBM_fun (f64 (4693121800382743218)) (f64 (13915732910899898605)) (f64 (9221120237041090560)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 73
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 15
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  modeConvert_SBM_fun (f64 (4687297706291229256)) (f64 (9221120237041090560)) (f64 (4664948892018224109)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  modeConvert_SBM_fun (f64 (13919786152266897460)) (f64 (13914263663252850330)) (f64 (4666592767738137824)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 69
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  modeConvert_SBM_fun (f64 (13914499533945182742)) (f64 (13914499533945182742)) (f64 (4607182418800017408)) 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4689594717278547612)) (f64 (4666445353286063808)) 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  modeConvert_SBM_fun (f64 (4693120592239842324)) (f64 (4686481991995629912)) (f64 (9221120237041090560)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 47
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  modeConvert_SBM_fun (f64 (13919168205073418031)) (f64 (9221120237041090560)) (f64 (4656815727918531398)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  modeConvert_SBM_fun (f64 (13918859620450199862)) (f64 (4696260930432930144)) (f64 (4663141833723646845)) 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 36
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  modeConvert_SBM_fun (f64 (13912207420670438286)) (f64 (13912207420670438286)) (f64 (4607182418800017408)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13909498263460031280)) (f64 (4665748280982126665)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  modeConvert_SBM_fun (f64 (13911569027270892340)) (f64 (4689279240358945180)) (f64 (9221120237041090560)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  modeConvert_SBM_fun (f64 (13919823480727676120)) (f64 (9221120237041090560)) (f64 (4653677512539471244)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  modeConvert_SBM_fun (f64 (13918870800525018289)) (f64 (4694421063470575210)) (f64 (4664351584732233500)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  modeConvert_SBM_fun (f64 (13910854006373786712)) (f64 (13910854006373786712)) (f64 (4607182418800017408)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4696628148479038772)) (f64 (4660786643016890649)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  modeConvert_SBM_fun (f64 (13918890086325921655)) (f64 (13917147526956023630)) (f64 (9221120237041090560)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  modeConvert_SBM_fun (f64 (4690715106885185252)) (f64 (9221120237041090560)) (f64 (4657443903089461622)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  modeConvert_SBM_fun (f64 (13905427583139497952)) (f64 (13918147347456384139)) (f64 (4662683639107830140)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  modeConvert_SBM_fun (f64 (4694907980723618522)) (f64 (4694907980723618522)) (f64 (4607182418800017408)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4678325088999720576)) (f64 (4658179956046028910)) 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  modeConvert_SBM_fun (f64 (13913453195525144416)) (f64 (4693172547113960730)) (f64 (9221120237041090560)) 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 68
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  modeConvert_SBM_fun (f64 (4690412800237493060)) (f64 (9221120237041090560)) (f64 (4647411301818413526)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  modeConvert_SBM_fun (f64 (4695037321181973162)) (f64 (13919106892623254703)) (f64 (4658781954832044913)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  modeConvert_SBM_fun (f64 (13910385276463888196)) (f64 (13910385276463888196)) (f64 (4607182418800017408)) 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13905220147609264904)) (f64 (4655946437224956959)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  modeConvert_SBM_fun (f64 (4688174116818988696)) (f64 (4687264681547735608)) (f64 (9221120237041090560)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 68
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  modeConvert_SBM_fun (f64 (13890289847595451456)) (f64 (9221120237041090560)) (f64 (4666126337078401640)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  modeConvert_SBM_fun (f64 (13904587989603431464)) (f64 (4690390805660508568)) (f64 (4665095493267442073)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 20
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  modeConvert_SBM_fun (f64 (13909354699839159872)) (f64 (13909354699839159872)) (f64 (4607182418800017408)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4688655041406091768)) (f64 (4664134388248152889)) 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  modeConvert_SBM_fun (f64 (4689587153656723280)) (f64 (13918503135132791978)) (f64 (9221120237041090560)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 48
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  modeConvert_SBM_fun (f64 (13917484707974209928)) (f64 (9221120237041090560)) (f64 (4661547496503150958)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  modeConvert_SBM_fun (f64 (4694071922370347164)) (f64 (13920154159322253661)) (f64 (4661416086757490365)) 60
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 68
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  modeConvert_SBM_fun (f64 (13902752986724664056)) (f64 (13902752986724664056)) (f64 (4607182418800017408)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4688943937956042652)) (f64 (4647744586903003381)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  modeConvert_SBM_fun (f64 (13912617585037447654)) (f64 (4678070802059617952)) (f64 (9221120237041090560)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 6
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  modeConvert_SBM_fun (f64 (13911848012569701396)) (f64 (9221120237041090560)) (f64 (4656823551740992184)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  modeConvert_SBM_fun (f64 (13909745378637892980)) (f64 (13915654585348840496)) (f64 (4664178421325411021)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 16
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  modeConvert_SBM_fun (f64 (4695289855079425836)) (f64 (4695289855079425836)) (f64 (4607182418800017408)) 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916157745495397094)) (f64 (4660307808678669194)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  modeConvert_SBM_fun (f64 (13916246287517580638)) (f64 (13912105519008757080)) (f64 (9221120237041090560)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 64
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  modeConvert_SBM_fun (f64 (4695605155804722136)) (f64 (9221120237041090560)) (f64 (4666408197653655645)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  modeConvert_SBM_fun (f64 (4692454945780988360)) (f64 (4696236306244255340)) (f64 (4665491235951988319)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  modeConvert_SBM_fun (f64 (13917119971292386720)) (f64 (13917119971292386720)) (f64 (4607182418800017408)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913259468441004966)) (f64 (4666190730930421220)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  modeConvert_SBM_fun (f64 (13910844270969387252)) (f64 (13901927961263300256)) (f64 (9221120237041090560)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 73
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  modeConvert_SBM_fun (f64 (13917506984338390960)) (f64 (9221120237041090560)) (f64 (4663488637760016532)) 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  modeConvert_SBM_fun (f64 (13918285999888677285)) (f64 (4688653983537792724)) (f64 (4665519365605735442)) 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  modeConvert_SBM_fun (f64 (4693957636882941126)) (f64 (4693957636882941126)) (f64 (4607182418800017408)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4674455253747843936)) (f64 (4636563090205026828)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  modeConvert_SBM_fun (f64 (13905795121133884024)) (f64 (4695071873665583518)) (f64 (9221120237041090560)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  modeConvert_SBM_fun (f64 (13917205754376276870)) (f64 (9221120237041090560)) (f64 (4664762169064133930)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  modeConvert_SBM_fun (f64 (4696175749731053326)) (f64 (13917390047588619815)) (f64 (4666697392237548630)) 12
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 56
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  modeConvert_SBM_fun (f64 (13920160145441002122)) (f64 (13920160145441002122)) (f64 (4607182418800017408)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916677084911539094)) (f64 (4666718308642859737)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  modeConvert_SBM_fun (f64 (13917446734585843306)) (f64 (4696663489247392278)) (f64 (9221120237041090560)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 59
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 0
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  modeConvert_SBM_fun (f64 (13909485294897398864)) (f64 (9221120237041090560)) (f64 (4659026387077489418)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  modeConvert_SBM_fun (f64 (4693209946967269814)) (f64 (13919339847441676715)) (f64 (4658798236727667697)) 23
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  modeConvert_SBM_fun (f64 (13911196646184155976)) (f64 (13911196646184155976)) (f64 (4607182418800017408)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693468403364301640)) (f64 (4660534490231137439)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  modeConvert_SBM_fun (f64 (4695652611283433078)) (f64 (4695676653160885868)) (f64 (9221120237041090560)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 6
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  modeConvert_SBM_fun (f64 (4692994314628536762)) (f64 (9221120237041090560)) (f64 (4662432310551901109)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  modeConvert_SBM_fun (f64 (4684081018285348192)) (f64 (4693326275577257036)) (f64 (4639134831000975036)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  modeConvert_SBM_fun (f64 (4694291975918336040)) (f64 (4694291975918336040)) (f64 (4607182418800017408)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13918560319361750874)) (f64 (4665912782004311171)) 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  modeConvert_SBM_fun (f64 (4692142570639617316)) (f64 (4695383184609307296)) (f64 (9221120237041090560)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  modeConvert_SBM_fun (f64 (4680309329818603344)) (f64 (9221120237041090560)) (f64 (4666559032319346652)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  modeConvert_SBM_fun (f64 (4695296003934478750)) (f64 (13918623397285596944)) (f64 (4657656676939874990)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 69
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  modeConvert_SBM_fun (f64 (13893506082720269056)) (f64 (13893506082720269056)) (f64 (4607182418800017408)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4687210016542850344)) (f64 (4666065374722525658)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  modeConvert_SBM_fun (f64 (13914543586028194130)) (f64 (13904086934230302560)) (f64 (9221120237041090560)) 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 52
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  modeConvert_SBM_fun (f64 (13914760467014787204)) (f64 (9221120237041090560)) (f64 (4666128835560445327)) 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  modeConvert_SBM_fun (f64 (13912670784149878848)) (f64 (13919887635154857970)) (f64 (4657561468567325957)) 11
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 60
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  modeConvert_SBM_fun (f64 (4691824651667754680)) (f64 (4691824651667754680)) (f64 (4607182418800017408)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916368493220278896)) (f64 (4661505399425674978)) 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  modeConvert_SBM_fun (f64 (13918858296353951520)) (f64 (13915967978558126854)) (f64 (9221120237041090560)) 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 69
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  modeConvert_SBM_fun (f64 (4685952066205882784)) (f64 (9221120237041090560)) (f64 (4657034591399864095)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  modeConvert_SBM_fun (f64 (4693590459722215906)) (f64 (4689169199617841656)) (f64 (4665846584407196045)) 23
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 39
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  modeConvert_SBM_fun (f64 (4678760711872821888)) (f64 (4678760711872821888)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916926408535532403)) (f64 (4662955701762717718)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  modeConvert_SBM_fun (f64 (13912392271756848728)) (f64 (4686695366003353896)) (f64 (9221120237041090560)) 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 38
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  modeConvert_SBM_fun (f64 (4693453150568912036)) (f64 (9221120237041090560)) (f64 (4638151521633804628)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  modeConvert_SBM_fun (f64 (4690835524761555360)) (f64 (4694816839970783372)) (f64 (4666121738861619270)) 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 3
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  modeConvert_SBM_fun (f64 (13919868752223168170)) (f64 (13919868752223168170)) (f64 (4607182418800017408)) 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694657894320838168)) (f64 (4655276947532878347)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  modeConvert_SBM_fun (f64 (13916043710448607841)) (f64 (4691936067281815112)) (f64 (9221120237041090560)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 40
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  modeConvert_SBM_fun (f64 (4693620827015375752)) (f64 (9221120237041090560)) (f64 (13859693288240212035)) 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  modeConvert_SBM_fun (f64 (13909133187095135404)) (f64 (13906885352091441320)) (f64 (4652323228971151889)) 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 46
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  modeConvert_SBM_fun (f64 (13895407157769959872)) (f64 (13895407157769959872)) (f64 (4607182418800017408)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13910851895326011892)) (f64 (4665956120181402366)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  modeConvert_SBM_fun (f64 (4695202084472813066)) (f64 (13914396023102497860)) (f64 (9221120237041090560)) 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 8
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  modeConvert_SBM_fun (f64 (13916603158092843818)) (f64 (9221120237041090560)) (f64 (4646301746081800080)) 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  modeConvert_SBM_fun (f64 (4688141718957957592)) (f64 (4689590931135561884)) (f64 (4658617306910004345)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  modeConvert_SBM_fun (f64 (13910395332087944716)) (f64 (13910395332087944716)) (f64 (4607182418800017408)) 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694946343815441144)) (f64 (4660287095139098536)) 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  modeConvert_SBM_fun (f64 (4688357933089895508)) (f64 (4688447068127112404)) (f64 (9221120237041090560)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 26
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 40
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  modeConvert_SBM_fun (f64 (13914520684119999386)) (f64 (9221120237041090560)) (f64 (4633762998100527864)) 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  modeConvert_SBM_fun (f64 (4695386566111582236)) (f64 (13915005089739771736)) (f64 (4662000415221132032)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  modeConvert_SBM_fun (f64 (4691018473903020672)) (f64 (4691018473903020672)) (f64 (4607182418800017408)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4691391941443429304)) (f64 (4662464842006211518)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  modeConvert_SBM_fun (f64 (13914169286533698994)) (f64 (4692499372442453180)) (f64 (9221120237041090560)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  modeConvert_SBM_fun (f64 (13919029230617456454)) (f64 (9221120237041090560)) (f64 (4665565804733810155)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  modeConvert_SBM_fun (f64 (13913072747990544734)) (f64 (13913219529877988574)) (f64 (4655280889674816440)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 19
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  modeConvert_SBM_fun (f64 (13906069639213079416)) (f64 (13906069639213079416)) (f64 (4607182418800017408)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693038209812304194)) (f64 (4663372680393767172)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  modeConvert_SBM_fun (f64 (4691991544615859744)) (f64 (4688240682388202376)) (f64 (9221120237041090560)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 16
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  modeConvert_SBM_fun (f64 (13912544619430055866)) (f64 (9221120237041090560)) (f64 (4662019918137173244)) 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  modeConvert_SBM_fun (f64 (4688575806725251968)) (f64 (4686647990749935008)) (f64 (4662635428325182641)) 24
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 58
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  modeConvert_SBM_fun (f64 (4692785835005305334)) (f64 (4692785835005305334)) (f64 (4607182418800017408)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4694651137404707214)) (f64 (4661488817770824785)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  modeConvert_SBM_fun (f64 (13912000341309820186)) (f64 (13911765314800689030)) (f64 (9221120237041090560)) 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 45
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 55
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  modeConvert_SBM_fun (f64 (4681338672262516752)) (f64 (9221120237041090560)) (f64 (4657292958008111520)) 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  modeConvert_SBM_fun (f64 (13918971315162000314)) (f64 (4693320026698437562)) (f64 (4660542093610511521)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  modeConvert_SBM_fun (f64 (13909177124746676856)) (f64 (13909177124746676856)) (f64 (4607182418800017408)) 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13916905792172996966)) (f64 (4661351106518946637)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  modeConvert_SBM_fun (f64 (4692127025611667164)) (f64 (4694802918491546292)) (f64 (9221120237041090560)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  modeConvert_SBM_fun (f64 (4690961302362115376)) (f64 (9221120237041090560)) (f64 (4663030615530340422)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  modeConvert_SBM_fun (f64 (4696388078526634808)) (f64 (4684086047753548712)) (f64 (4661811236194625461)) 4
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  modeConvert_SBM_fun (f64 (4689256217867952984)) (f64 (4689256217867952984)) (f64 (4607182418800017408)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693723477124352190)) (f64 (4663057267642601671)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  modeConvert_SBM_fun (f64 (13917839598960890538)) (f64 (13918714989949299172)) (f64 (9221120237041090560)) 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 47
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  modeConvert_SBM_fun (f64 (4693156977455245644)) (f64 (9221120237041090560)) (f64 (4664656240446094013)) 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  modeConvert_SBM_fun (f64 (13908834147700350188)) (f64 (13920028337741808175)) (f64 (4662464214506206448)) 66
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  modeConvert_SBM_fun (f64 (13919098867110555104)) (f64 (13919098867110555104)) (f64 (4607182418800017408)) 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13896192929075607456)) (f64 (4663723036574269028)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  modeConvert_SBM_fun (f64 (13917571952274875708)) (f64 (13903215411684342008)) (f64 (9221120237041090560)) 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 61
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  modeConvert_SBM_fun (f64 (4685810026753242504)) (f64 (9221120237041090560)) (f64 (4663923486807544660)) 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  modeConvert_SBM_fun (f64 (4688564033856102196)) (f64 (4696404964657419528)) (f64 (4658676141581642806)) 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 9
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  modeConvert_SBM_fun (f64 (13917737292340401883)) (f64 (13917737292340401883)) (f64 (4607182418800017408)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4690237888535361316)) (f64 (4662064813826441643)) 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  modeConvert_SBM_fun (f64 (4688324304792878020)) (f64 (4694801165399192738)) (f64 (9221120237041090560)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 13
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  modeConvert_SBM_fun (f64 (4684811148157397720)) (f64 (9221120237041090560)) (f64 (4644499626822154106)) 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  modeConvert_SBM_fun (f64 (13913433179011503406)) (f64 (4694139686277709204)) (f64 (4649303934933311109)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  modeConvert_SBM_fun (f64 (4693126004639436466)) (f64 (4693126004639436466)) (f64 (4607182418800017408)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4685264423514222784)) (f64 (4664867687644255685)) 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  modeConvert_SBM_fun (f64 (13914699468059700966)) (f64 (4696747604067596982)) (f64 (9221120237041090560)) 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 14
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 33
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  modeConvert_SBM_fun (f64 (4682539275597102576)) (f64 (9221120237041090560)) (f64 (4655147830398422304)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  modeConvert_SBM_fun (f64 (13917226645769029576)) (f64 (4693649326694821406)) (f64 (4666595008595269403)) 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 3
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  modeConvert_SBM_fun (f64 (4690274150489184484)) (f64 (4690274150489184484)) (f64 (4607182418800017408)) 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13913800255590840050)) (f64 (4662360178880489045)) 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  modeConvert_SBM_fun (f64 (4683848482096522224)) (f64 (4695978666359384278)) (f64 (9221120237041090560)) 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 27
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 62
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  modeConvert_SBM_fun (f64 (4695536921543267696)) (f64 (9221120237041090560)) (f64 (4665710619118296280)) 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  modeConvert_SBM_fun (f64 (13917538384219070346)) (f64 (4691168646029348636)) (f64 (4658849666079932397)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 54
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  modeConvert_SBM_fun (f64 (4693490114550236560)) (f64 (4693490114550236560)) (f64 (4607182418800017408)) 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13912612525573850182)) (f64 (4657477771272367012)) 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  modeConvert_SBM_fun (f64 (4677711758884162016)) (f64 (4694452778986422798)) (f64 (9221120237041090560)) 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 0
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 63
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  modeConvert_SBM_fun (f64 (13911026867158457564)) (f64 (9221120237041090560)) (f64 (4658866817401054171)) 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  modeConvert_SBM_fun (f64 (13914858718911022400)) (f64 (13904523986492472376)) (f64 (4660703488352396479)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 50
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  modeConvert_SBM_fun (f64 (4694874586644098034)) (f64 (4694874586644098034)) (f64 (4607182418800017408)) 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4693342209691167890)) (f64 (4662742659614211034)) 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  modeConvert_SBM_fun (f64 (13919974418418053214)) (f64 (13907312993249002196)) (f64 (9221120237041090560)) 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 41
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 65
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  modeConvert_SBM_fun (f64 (13902700998015664712)) (f64 (9221120237041090560)) (f64 (4664897649073954046)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  modeConvert_SBM_fun (f64 (13919844168735631366)) (f64 (4692475282671435992)) (f64 (4634029999167813828)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 31
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  modeConvert_SBM_fun (f64 (4690387883079427252)) (f64 (4690387883079427252)) (f64 (4607182418800017408)) 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4692388065245058188)) (f64 (4652707653499575263)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  modeConvert_SBM_fun (f64 (4681228141080960512)) (f64 (4688512807529100324)) (f64 (9221120237041090560)) 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 11
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 15
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  modeConvert_SBM_fun (f64 (4681821334238832496)) (f64 (9221120237041090560)) (f64 (4626160442298369948)) 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  modeConvert_SBM_fun (f64 (4694089238374848350)) (f64 (13919655082747935239)) (f64 (4656137309228052210)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 35
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  modeConvert_SBM_fun (f64 (4695298324429212852)) (f64 (4695298324429212852)) (f64 (4607182418800017408)) 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13919301959578993447)) (f64 (4666098214219551144)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  modeConvert_SBM_fun (f64 (4695725019539601024)) (f64 (4680643283855229472)) (f64 (9221120237041090560)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 72
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 74
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  modeConvert_SBM_fun (f64 (13917908879794056610)) (f64 (9221120237041090560)) (f64 (4657526592705586265)) 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  modeConvert_SBM_fun (f64 (13916591239429080404)) (f64 (4688301992697340272)) (f64 (4666342443673753564)) 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 22
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  modeConvert_SBM_fun (f64 (4693787253222931868)) (f64 (4693787253222931868)) (f64 (4607182418800017408)) 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4672615473113586240)) (f64 (4648133655379568924)) 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  modeConvert_SBM_fun (f64 (4691381213790082328)) (f64 (13913036866368241756)) (f64 (9221120237041090560)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 25
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 55
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  modeConvert_SBM_fun (f64 (4691630437915232736)) (f64 (9221120237041090560)) (f64 (4666439264990634261)) 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  modeConvert_SBM_fun (f64 (13900834482613448880)) (f64 (13916652314323066108)) (f64 (4661503055283275121)) 78
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  modeConvert_SBM_fun (f64 (4696232076519051360)) (f64 (4696232076519051360)) (f64 (4607182418800017408)) 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4689841065954796116)) (f64 (4665158327797583846)) 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  modeConvert_SBM_fun (f64 (4679980486672305040)) (f64 (13918700194842796396)) (f64 (9221120237041090560)) 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 76
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  modeConvert_SBM_fun (f64 (13913183470629192142)) (f64 (9221120237041090560)) (f64 (4661750822858203629)) 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  modeConvert_SBM_fun (f64 (13908632650973243780)) (f64 (13912429387267264766)) (f64 (4665233363608593790)) 14
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 79
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  modeConvert_SBM_fun (f64 (4692690931695943572)) (f64 (4692690931695943572)) (f64 (4607182418800017408)) 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4683671601321858272)) (f64 (4659008042005799046)) 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  modeConvert_SBM_fun (f64 (13899401206613880608)) (f64 (4693083060794136096)) (f64 (9221120237041090560)) 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 75
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 43
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  modeConvert_SBM_fun (f64 (4688793759092977080)) (f64 (9221120237041090560)) (f64 (4662940578540986830)) 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  modeConvert_SBM_fun (f64 (4693688094359110032)) (f64 (13916336181860668826)) (f64 (4661754171580292918)) 77
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 19
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  modeConvert_SBM_fun (f64 (13918324067575713311)) (f64 (13918324067575713311)) (f64 (4607182418800017408)) 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (4687955154770142544)) (f64 (4666235740141374993)) 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  modeConvert_SBM_fun (f64 (13913678382426455738)) (f64 (13919219209633080556)) (f64 (9221120237041090560)) 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 36
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 42
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  modeConvert_SBM_fun (f64 (4684760369283880448)) (f64 (9221120237041090560)) (f64 (4658595726383220752)) 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  modeConvert_SBM_fun (f64 (13917431049530675853)) (f64 (13915644773636171333)) (f64 (4659287624252889933)) 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 18
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  modeConvert_SBM_fun (f64 (13913500926293273716)) (f64 (13913500926293273716)) (f64 (4607182418800017408)) 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13915202381329380108)) (f64 (4659023412674776077)) 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  modeConvert_SBM_fun (f64 (13904786376268767736)) (f64 (4695118008010840734)) (f64 (9221120237041090560)) 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 44
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 44
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  modeConvert_SBM_fun (f64 (13917328296913368502)) (f64 (9221120237041090560)) (f64 (4660920647104188242)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  modeConvert_SBM_fun (f64 (4693119122047703074)) (f64 (13906239029914905264)) (f64 (4658588851695947849)) 67
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  modeConvert_SBM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) 28
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  modeConvert_SBM_fun (f64 (4693923466794887140)) (f64 (4693923466794887140)) (f64 (4607182418800017408)) 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  modeConvert_SBM_fun (f64 (9221120237041090560)) (f64 (13914453837063033348)) (f64 (4656437070642009674)) 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  modeConvert_SBM_fun (f64 (4693832575288118018)) (f64 (13917181574805247916)) (f64 (9221120237041090560)) 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  modeConvert_SBM_fun (f64 (9218868437227405312)) (f64 (4607182418800017408)) (f64 (4696837146684686336)) 40
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  modeConvert_SBM_fun (f64 (9218868437227405311)) (f64 (18442240474082181119)) (f64 (4607182418800017408)) 37
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  modeConvert_SBM_fun (f64 (4693142141562952488)) (f64 (9221120237041090560)) (f64 (4665545142239948591)) 1
  = 1.
Proof. vm_compute. reflexivity. Qed.
