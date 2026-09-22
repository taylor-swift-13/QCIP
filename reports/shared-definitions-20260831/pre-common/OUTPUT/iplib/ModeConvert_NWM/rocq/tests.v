(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.iplib.ModeConvert_NWM.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  modeConvert_NWM_fun (f64 (4694428428020873060)) (f64 (13909875606412569204)) (f64 (4661949024290739460)) (f64 (13916963049218609740)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 34
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4682373651927463264)) (f64 (4659776468340170156)) (f64 (4692306284073713876)) 2 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  modeConvert_NWM_fun (f64 (13910288359320600416)) (f64 (4694921795123315294)) (f64 (4659594847920267837)) (f64 (13913695283121086540)) 2 2
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 60
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 22
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13908142262416216576)) (f64 (4664283436195887071)) (f64 (4695799094774463098)) 2 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  modeConvert_NWM_fun (f64 (13901631835031225888)) (f64 (13901437819172648624)) (f64 (4666508044011228448)) (f64 (4689561684850286504)) 3 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 7
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 41
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 22
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4672661472076429920)) (f64 (4663256652962960337)) (f64 (4693127610429820662)) 2 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  modeConvert_NWM_fun (f64 (4681893138679560720)) (f64 (13920199435906669904)) (f64 (4666481506440991406)) (f64 (4688613045301036992)) 1 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 34
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 45
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4692148132519313188)) (f64 (4665847027813538917)) (f64 (13907037399056165336)) 2 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  modeConvert_NWM_fun (f64 (4694972567102963038)) (f64 (13912231802129035518)) (f64 (4662042985928928881)) (f64 (13918233423240295970)) 0 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 19
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 11
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918532127496005654)) (f64 (4652262658651348557)) (f64 (13918382721422096389)) 2 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  modeConvert_NWM_fun (f64 (4683888562501057936)) (f64 (13920099520069316758)) (f64 (4650367534935150522)) (f64 (4695310697167464662)) 1 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 37
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 66
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4690925166646600448)) (f64 (4666630145003089359)) (f64 (4686448593409704776)) 2 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  modeConvert_NWM_fun (f64 (13900640291810922240)) (f64 (4688026449296176688)) (f64 (4658931516780770218)) (f64 (4691785819468768212)) 0 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 65
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916814848094093467)) (f64 (4660253220997875978)) (f64 (13918181797224776668)) 2 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  modeConvert_NWM_fun (f64 (13918335234210483802)) (f64 (13894083452443007360)) (f64 (4666320369631689783)) (f64 (13908150784985190932)) 0 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 20
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 70
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4675802480010951056)) (f64 (4665789761393086933)) (f64 (13905107589178213416)) 2 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  modeConvert_NWM_fun (f64 (13916880786829158641)) (f64 (13915949847359755527)) (f64 (4661368634006903893)) (f64 (4693629392650188510)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 32
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 46
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696372954606073158)) (f64 (4665779360761760943)) (f64 (13909855974940095624)) 2 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  modeConvert_NWM_fun (f64 (4685528639688401080)) (f64 (13915993977788961929)) (f64 (4664478540185568185)) (f64 (13896693833996581472)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 44
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 41
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916502506342292880)) (f64 (4657121584162303044)) (f64 (13916721198997853021)) 2 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  modeConvert_NWM_fun (f64 (4691197683024135644)) (f64 (13917896677308338178)) (f64 (4660295685666201808)) (f64 (13897872616733661184)) 1 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4680156661516447616)) (f64 (4662761003812311704)) (f64 (4694979641041812510)) 2 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  modeConvert_NWM_fun (f64 (13917095196599982034)) (f64 (13910115298963198316)) (f64 (4658763311723602226)) (f64 (4694700779007701048)) 3 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 40
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 78
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 5
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13914690218126142964)) (f64 (4662456071218756709)) (f64 (4692798200080881504)) 2 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  modeConvert_NWM_fun (f64 (13911854932755398236)) (f64 (13912172584342569516)) (f64 (4653189959429749647)) (f64 (13916391690698705186)) 3 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 55
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 48
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 67
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4682458697010633328)) (f64 (4656946052270235000)) (f64 (13902724433743994192)) 2 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  modeConvert_NWM_fun (f64 (4691516468711992940)) (f64 (13903333646453402944)) (f64 (4659209633122788614)) (f64 (4694557843477307312)) 3 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 72
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 64
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 21
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693155035574068700)) (f64 (4661717354110788716)) (f64 (4691028642863685528)) 2 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  modeConvert_NWM_fun (f64 (13916585717995515542)) (f64 (4695685341276053844)) (f64 (4666259198403413477)) (f64 (4685348122100683680)) 2 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 36
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 65
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13907382627546284912)) (f64 (4643662721256238931)) (f64 (4696573602946434058)) 2 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  modeConvert_NWM_fun (f64 (4677310839867134848)) (f64 (13917386455609467187)) (f64 (4665924220672165701)) (f64 (4692162448061362124)) 3 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 43
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 49
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918886043284439336)) (f64 (4662255838246912270)) (f64 (13918221872949607142)) 2 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  modeConvert_NWM_fun (f64 (13883062300222806784)) (f64 (4689061024022027752)) (f64 (4657698240059422426)) (f64 (13912160142786459702)) 3 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 54
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4688929673695673508)) (f64 (4659403886033558895)) (f64 (4685676400349837984)) 2 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  modeConvert_NWM_fun (f64 (4693578022401199864)) (f64 (4690918122446760656)) (f64 (4665387879477355374)) (f64 (4669211258631963968)) 3 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 34
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 22
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 7
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13914901073509769424)) (f64 (4657066887174969488)) (f64 (13896127094045717344)) 2 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  modeConvert_NWM_fun (f64 (4696044627520712362)) (f64 (13917931889854097690)) (f64 (4664829535831017317)) (f64 (13912977739284006202)) 1 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 37
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 77
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695896969859009588)) (f64 (4663547955994354211)) (f64 (13907872330352953924)) 2 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  modeConvert_NWM_fun (f64 (13917720159690693097)) (f64 (13916207832352827764)) (f64 (4664272782291734693)) (f64 (4693341922040522366)) 1 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 14
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 5
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 32
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919620574892934238)) (f64 (4666499733169885481)) (f64 (4696182310967419948)) 2 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  modeConvert_NWM_fun (f64 (13918723905298666175)) (f64 (4694902805040119820)) (f64 (4665895101026445912)) (f64 (13905692882166689448)) 2 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 6
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 16
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13904971016198142920)) (f64 (4653445891011023184)) (f64 (13912657170459109444)) 2 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  modeConvert_NWM_fun (f64 (13900782053701700832)) (f64 (13909090083222600988)) (f64 (4662564297451890366)) (f64 (4688793141158371628)) 3 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 77
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13911167969003179960)) (f64 (4662579106117891693)) (f64 (4693422020717203018)) 2 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  modeConvert_NWM_fun (f64 (4695478796004447416)) (f64 (4686089190840673504)) (f64 (4654366923346675192)) (f64 (4692370766705234024)) 0 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 33
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 48
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 63
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696421107122610158)) (f64 (4661885847046479061)) (f64 (4695039638840573108)) 2 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  modeConvert_NWM_fun (f64 (13919628358161743398)) (f64 (13919824351946158979)) (f64 (4666156662134646332)) (f64 (4693327394508349850)) 0 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 23
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 1
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13915177553796440976)) (f64 (4665924426335861769)) (f64 (13909884650990891568)) 2 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  modeConvert_NWM_fun (f64 (4692813740310197648)) (f64 (4693363255639337570)) (f64 (4660388823030843526)) (f64 (4694877228541962850)) 1 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 70
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 23
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4691921606097601908)) (f64 (4653801982626025716)) (f64 (4696315239073452148)) 2 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  modeConvert_NWM_fun (f64 (4692989046122043230)) (f64 (13913283380623882568)) (f64 (4624290175942387192)) (f64 (4690748158627057136)) 3 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 18
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 72
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917441259787397554)) (f64 (4659957219134499296)) (f64 (13904851201765587200)) 2 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  modeConvert_NWM_fun (f64 (4692685493803673012)) (f64 (13908395993887739456)) (f64 (4665851768199959320)) (f64 (4695134361912369244)) 3 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 66
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 52
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918489646522505962)) (f64 (4664280127343559962)) (f64 (4693397210013776810)) 2 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  modeConvert_NWM_fun (f64 (13916727801522910118)) (f64 (4695885318629399412)) (f64 (4642571764042882438)) (f64 (13908937449034425820)) 1 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 46
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 9
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693144500118849878)) (f64 (4635534584716148416)) (f64 (13917084856261795745)) 2 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  modeConvert_NWM_fun (f64 (13908708359223424912)) (f64 (13916564699598118400)) (f64 (4663021580197726488)) (f64 (13918730324671487195)) 0 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 36
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916682024118977294)) (f64 (4666528740013487595)) (f64 (4695478555812404324)) 2 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  modeConvert_NWM_fun (f64 (13919208414935941785)) (f64 (4695575890706448674)) (f64 (4665589942218601357)) (f64 (13916268973984134698)) 2 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 32
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 0
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 30
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13910206791046299016)) (f64 (4666370132754235340)) (f64 (13904164784552905432)) 2 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  modeConvert_NWM_fun (f64 (13918013743719759278)) (f64 (13909423256840520528)) (f64 (4665393165008470210)) (f64 (4693521467414527408)) 1 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 49
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 64
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 16
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13910029620356940756)) (f64 (4658626616734229283)) (f64 (13915254604448763398)) 2 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  modeConvert_NWM_fun (f64 (13895918211906343136)) (f64 (13911502977782163840)) (f64 (4652533851694281197)) (f64 (13916658507782243728)) 2 42
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 29
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 15
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916458695109604888)) (f64 (4666184616714766034)) (f64 (13908191706602012296)) 2 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  modeConvert_NWM_fun (f64 (13917024407475343474)) (f64 (4696534490611358776)) (f64 (4663135601990955328)) (f64 (4689338651165273416)) 3 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 58
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 15
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919229595325706363)) (f64 (4647821914641523597)) (f64 (4688944976927187092)) 2 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  modeConvert_NWM_fun (f64 (13919249716487701928)) (f64 (4694903432083187206)) (f64 (4660266873922786339)) (f64 (4684652940914656064)) 2 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 39
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 58
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13908095139548712340)) (f64 (4654423454985787167)) (f64 (13915128255353664886)) 2 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  modeConvert_NWM_fun (f64 (4696366926378098850)) (f64 (4688350552906138284)) (f64 (4645940512116538513)) (f64 (13908055218070783644)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 49
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 39
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4677446074148696288)) (f64 (4639290521049147104)) (f64 (4694074366186186546)) 2 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  modeConvert_NWM_fun (f64 (13916188578666755466)) (f64 (13919702842650005614)) (f64 (4652675717171819189)) (f64 (13909953420188736564)) 3 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 75
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 33
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693497906509043234)) (f64 (4664645584399913201)) (f64 (13903351127456671960)) 2 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  modeConvert_NWM_fun (f64 (13917535496954923540)) (f64 (4666087260776064576)) (f64 (4657805492191706452)) (f64 (13904260114649071696)) 0 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 55
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 31
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917252714888895097)) (f64 (4659670267242729695)) (f64 (13916427640873000144)) 2 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  modeConvert_NWM_fun (f64 (13907607785441505720)) (f64 (4694911690509384422)) (f64 (4656881550937777057)) (f64 (13912488334092803760)) 2 70
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 18
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 15
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696320814807726130)) (f64 (4665919710363426281)) (f64 (13917483427987093387)) 2 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  modeConvert_NWM_fun (f64 (4694332249498432046)) (f64 (4689773848923821960)) (f64 (4665105536687321645)) (f64 (4695655901832122094)) 2 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 12
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916399654221290641)) (f64 (4650513495104158101)) (f64 (4693278684213652266)) 2 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  modeConvert_NWM_fun (f64 (13916526791986074733)) (f64 (13919133373799386003)) (f64 (4658629799002827782)) (f64 (13919081144182942916)) 3 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 47
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 44
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 32
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917907016307409170)) (f64 (4666142428313934075)) (f64 (13913634419624441814)) 2 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  modeConvert_NWM_fun (f64 (4690495119084859864)) (f64 (13919466355306943217)) (f64 (4664842386000602755)) (f64 (4683025664977131088)) 3 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 22
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 65
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 36
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918831850064877028)) (f64 (4665098236256658402)) (f64 (13916087220105929558)) 2 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  modeConvert_NWM_fun (f64 (13916916084790049586)) (f64 (4695533866791333642)) (f64 (4662408289891180694)) (f64 (13914422579966951714)) 2 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 0
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 32
  = 32.
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 52
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 50
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695123015536556530)) (f64 (4662073735963795762)) (f64 (4692967674904637498)) 2 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  modeConvert_NWM_fun (f64 (4695777176002640796)) (f64 (4693406822838225708)) (f64 (4645893992689294075)) (f64 (13911251214875542768)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 45
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 20
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13912175385487993286)) (f64 (4662119172474449761)) (f64 (13919586933568379256)) 2 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  modeConvert_NWM_fun (f64 (4690076929108603412)) (f64 (4692041710462818672)) (f64 (4663257659260430268)) (f64 (4660393479032080384)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 36
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 55
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916221004565974685)) (f64 (4662623231161835417)) (f64 (13917536082878089788)) 2 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  modeConvert_NWM_fun (f64 (13917374951097470294)) (f64 (4694222759450340990)) (f64 (13859227777240986394)) (f64 (4695483992206840790)) 1 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 64
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13899659211306143680)) (f64 (4665971344865237634)) (f64 (13914265973392263478)) 2 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  modeConvert_NWM_fun (f64 (4694827963937343542)) (f64 (4696764052365748618)) (f64 (4659099797894275589)) (f64 (4696379475095932754)) 1 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 0
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4689776440080295920)) (f64 (4666078608673410651)) (f64 (4696307684152563794)) 2 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  modeConvert_NWM_fun (f64 (13908367106292936248)) (f64 (13913046695276710904)) (f64 (4656942240234107880)) (f64 (13914416466015694470)) 2 78
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 11
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 60
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 64
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693325419756801254)) (f64 (4655330259708384743)) (f64 (13912771936280134300)) 2 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  modeConvert_NWM_fun (f64 (13913282051525760838)) (f64 (13918603907690366664)) (f64 (4646652898478148652)) (f64 (4692360495416795832)) 3 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 45
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 31
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4677005671038896608)) (f64 (4664359730358816436)) (f64 (13912622980350552460)) 2 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  modeConvert_NWM_fun (f64 (4694446575305192088)) (f64 (13916734448969280834)) (f64 (4665587416459309094)) (f64 (13902688527877866280)) 3 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 2
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 62
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13898032926585057408)) (f64 (4666617987764081909)) (f64 (13916707357555141088)) 2 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  modeConvert_NWM_fun (f64 (4694146140688262610)) (f64 (4694340990761362304)) (f64 (4662898001140097090)) (f64 (4680156372538688656)) 1 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 62
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 38
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 39
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13903498503439446696)) (f64 (4666717225320771697)) (f64 (4696276564839568108)) 2 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  modeConvert_NWM_fun (f64 (4691724359068454716)) (f64 (4690143208145005560)) (f64 (4666362742836076807)) (f64 (13919629184994535730)) 1 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 1
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 15
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693175831958582086)) (f64 (4662056947207058260)) (f64 (4695581980271555302)) 2 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  modeConvert_NWM_fun (f64 (4690101840914407036)) (f64 (13912468871211036404)) (f64 (4661350259438987454)) (f64 (13919361234401452110)) 1 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 42
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 2
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 28
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13920035126335133233)) (f64 (4665420489096867642)) (f64 (13905632020720603128)) 2 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  modeConvert_NWM_fun (f64 (13919240622186067390)) (f64 (13917365626582371742)) (f64 (4661989834411176074)) (f64 (4690104962849424884)) 3 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 21
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 45
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13913099483490347126)) (f64 (4635044776734232014)) (f64 (13914721112055149940)) 2 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  modeConvert_NWM_fun (f64 (4689762654156242892)) (f64 (13911714820859731628)) (f64 (4658211604717029077)) (f64 (13916342566700834318)) 1 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 35
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 50
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 12
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13915721547927825195)) (f64 (4663267188949383883)) (f64 (4691232105902575020)) 2 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  modeConvert_NWM_fun (f64 (13913187212843033734)) (f64 (4689000652332855716)) (f64 (4658465674582170556)) (f64 (13916889326152211734)) 0 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 22
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 60
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4684004814768688352)) (f64 (4658183592148342240)) (f64 (13909218364927003036)) 2 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  modeConvert_NWM_fun (f64 (13912489829294008740)) (f64 (4684674909410955784)) (f64 (4665145720927707710)) (f64 (13916387572903898143)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 72
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4680988160235165584)) (f64 (4660903226117481746)) (f64 (13913163446236860318)) 2 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  modeConvert_NWM_fun (f64 (4693673361193877494)) (f64 (4695470385628733462)) (f64 (4660416543614545103)) (f64 (4694035558393513386)) 0 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 76
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 66
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 1
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694798255688750168)) (f64 (4653064755866340226)) (f64 (4690013426018909932)) 2 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  modeConvert_NWM_fun (f64 (13912023028684750496)) (f64 (13915367254008139492)) (f64 (4655817145693401369)) (f64 (4694916834565492414)) 3 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 78
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 51
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 12
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917795354170005120)) (f64 (4665172814419400180)) (f64 (4690751886725434704)) 2 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  modeConvert_NWM_fun (f64 (13919786152266897460)) (f64 (13914263663252850330)) (f64 (4666592767738137824)) (f64 (13916274977936106466)) 3 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 59
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4690871177544423000)) (f64 (4662799396386680422)) (f64 (13919188376341223148)) 2 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  modeConvert_NWM_fun (f64 (13911569027270892340)) (f64 (4689279240358945180)) (f64 (4655539083455371789)) (f64 (13917802061008706780)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 65
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 38
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4685219384973185664)) (f64 (4664461734511771682)) (f64 (4693091639546887140)) 2 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  modeConvert_NWM_fun (f64 (13905427583139497952)) (f64 (13918147347456384139)) (f64 (4662683639107830140)) (f64 (13909119649042263572)) 3 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 66
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 37
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919792745889291675)) (f64 (4666675978517201160)) (f64 (13919305680856574882)) 2 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  modeConvert_NWM_fun (f64 (4688174116818988696)) (f64 (4687264681547735608)) (f64 (13834377628547217536)) (f64 (13916413257299382829)) 1 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 33
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694755970148728260)) (f64 (4661225638791379412)) (f64 (4684341886427235896)) 2 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  modeConvert_NWM_fun (f64 (4694071922370347164)) (f64 (13920154159322253661)) (f64 (4661416086757490365)) (f64 (4680723307820036304)) 0 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 48
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 12
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 52
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696508102610404330)) (f64 (4664878496751442923)) (f64 (13907380675972445500)) 2 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  modeConvert_NWM_fun (f64 (13916246287517580638)) (f64 (13912105519008757080)) (f64 (4658303868599119354)) (f64 (13916140021531227970)) 3 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 61
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 14
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 5
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919026764624779596)) (f64 (4658694533911872777)) (f64 (4680720764047880480)) 2 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  modeConvert_NWM_fun (f64 (13918285999888677285)) (f64 (4688653983537792724)) (f64 (4665519365605735442)) (f64 (13919026991008556499)) 1 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 40
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 29
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 12
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13913013165126047820)) (f64 (4663272642652664955)) (f64 (13903241844773370160)) 2 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  modeConvert_NWM_fun (f64 (13917446734585843306)) (f64 (4696663489247392278)) (f64 (4646045885374142914)) (f64 (13918081053506633738)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 0
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 57
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 36
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4680196762472592400)) (f64 (4666363614969430883)) (f64 (4691689603189729036)) 2 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  modeConvert_NWM_fun (f64 (4684081018285348192)) (f64 (4693326275577257036)) (f64 (4639134831000975036)) (f64 (13911824430439877510)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 78
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 33
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916931834508904918)) (f64 (4666164398723085892)) (f64 (13919543887689984149)) 2 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  modeConvert_NWM_fun (f64 (13914543586028194130)) (f64 (13904086934230302560)) (f64 (4666068163293096386)) (f64 (13914635664497764328)) 2 33
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 43
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13913680782200842788)) (f64 (4666473230146247858)) (f64 (13916638316168156579)) 2 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  modeConvert_NWM_fun (f64 (4693590459722215906)) (f64 (4689169199617841656)) (f64 (4665846584407196045)) (f64 (13906134137341700248)) 0 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 14
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 40
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918199341673910296)) (f64 (4666228605418020368)) (f64 (4695085554888750384)) 2 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  modeConvert_NWM_fun (f64 (13916043710448607841)) (f64 (4691936067281815112)) (f64 (4649771094781049915)) (f64 (13910142788576007964)) 2 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 40
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 74
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695541303141562716)) (f64 (4655049079444873934)) (f64 (4695903462698584392)) 2 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  modeConvert_NWM_fun (f64 (4688141718957957592)) (f64 (4689590931135561884)) (f64 (4658617306910004345)) (f64 (13914251274415641734)) 1 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 76
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4687861426247865864)) (f64 (4656346594445782620)) (f64 (4693014705750886364)) 2 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  modeConvert_NWM_fun (f64 (13914169286533698994)) (f64 (4692499372442453180)) (f64 (4665789611807626067)) (f64 (13908271176694700752)) 3 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 54
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 0
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4689842173606173684)) (f64 (4660790271437455785)) (f64 (4694616764256132066)) 2 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  modeConvert_NWM_fun (f64 (4688575806725251968)) (f64 (4686647990749935008)) (f64 (4662635428325182641)) (f64 (13913570658076212738)) 3 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 58
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 19
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13905582707229307736)) (f64 (4666028779543945258)) (f64 (4696084170084728004)) 2 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  modeConvert_NWM_fun (f64 (4692127025611667164)) (f64 (4694802918491546292)) (f64 (4660100685429225046)) (f64 (13913572149482601406)) 1 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 31
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 62
  = 62.
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 38
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 57
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696160578016840898)) (f64 (4662057106619113646)) (f64 (4690641719202377176)) 2 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  modeConvert_NWM_fun (f64 (13908834147700350188)) (f64 (13920028337741808175)) (f64 (4662464214506206448)) (f64 (13917189973357097831)) 1 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 60
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13915115007403523990)) (f64 (4663410660280866247)) (f64 (4694524348355746468)) 2 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  modeConvert_NWM_fun (f64 (4688324304792878020)) (f64 (4694801165399192738)) (f64 (4666533371152257446)) (f64 (13916394951393357704)) 0 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 70
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4688925825373190468)) (f64 (4652872379498020322)) (f64 (4689839363560376616)) 2 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  modeConvert_NWM_fun (f64 (13917226645769029576)) (f64 (4693649326694821406)) (f64 (4666595008595269403)) (f64 (13919147937709230222)) 1 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 62
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 49
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4692195816220470856)) (f64 (4666674670572761650)) (f64 (13917999960835336308)) 2 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  modeConvert_NWM_fun (f64 (4677711758884162016)) (f64 (4694452778986422798)) (f64 (4664178564099044350)) (f64 (13916724463575713374)) 0 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 67
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13918080360434239454)) (f64 (4657289846918638508)) (f64 (4696070263864376786)) 2 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  modeConvert_NWM_fun (f64 (13919844168735631366)) (f64 (4692475282671435992)) (f64 (4634029999167813828)) (f64 (13911561660253201520)) 2 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 54
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 43
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919628156437482877)) (f64 (4657014987053880271)) (f64 (13906959559225488536)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  modeConvert_NWM_fun (f64 (4695725019539601024)) (f64 (4680643283855229472)) (f64 (4662706219685549403)) (f64 (13910583351849853964)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 74
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 42
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 26
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13907996202219430632)) (f64 (4651072704450830769)) (f64 (13915317525434287697)) 2 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  modeConvert_NWM_fun (f64 (13900834482613448880)) (f64 (13916652314323066108)) (f64 (4661503055283275121)) (f64 (13919398989858650041)) 3 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 11
  = 11.
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 18
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 14
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13902777190529422512)) (f64 (4665991776004274864)) (f64 (4696263950541546534)) 2 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  modeConvert_NWM_fun (f64 (13899401206613880608)) (f64 (4693083060794136096)) (f64 (4661321541056259141)) (f64 (13910218990739032600)) 1 78
  = 78.
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 43
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 7
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 14
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916587111728811391)) (f64 (4655597635333979476)) (f64 (4694849398977633504)) 2 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  modeConvert_NWM_fun (f64 (13917431049530675853)) (f64 (13915644773636171333)) (f64 (4659287624252889933)) (f64 (13913638774648192706)) 3 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 49
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 70
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 67
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693503852675266590)) (f64 (4662742805161211100)) (f64 (4692931687900115146)) 2 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  modeConvert_NWM_fun (f64 (4693832575288118018)) (f64 (13917181574805247916)) (f64 (4659501010405753725)) (f64 (13912854466623106812)) 3 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 43
  = 43.
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 43
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 71
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695667510132939914)) (f64 (4660632080690426077)) (f64 (4695509166543954492)) 2 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  modeConvert_NWM_fun (f64 (4692277937615359608)) (f64 (13920097416130272359)) (f64 (4663975141505602702)) (f64 (13908378867663698400)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 23
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 23
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917441844933272857)) (f64 (4657151286392609086)) (f64 (13914416461983443242)) 2 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  modeConvert_NWM_fun (f64 (4681070138959916256)) (f64 (4695363161696142618)) (f64 (4661875466204100511)) (f64 (13919624488254384713)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 16
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 64
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13908280778897642716)) (f64 (4658248922231506697)) (f64 (4695517698532096628)) 2 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  modeConvert_NWM_fun (f64 (13914428358368262420)) (f64 (13898426058024369536)) (f64 (4662485797812033846)) (f64 (13901762678611514944)) 2 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 21
  = 21.
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 4
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 13
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696066761714570156)) (f64 (4629971793783058052)) (f64 (13907697979809013900)) 2 26
  = 26.
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  modeConvert_NWM_fun (f64 (13915674844865652408)) (f64 (13917406562388581418)) (f64 (4664667211919070994)) (f64 (4691953168199804192)) 1 29
  = 29.
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 61
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 8
  = 8.
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 65
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 45
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4692398949473948524)) (f64 (4657418757364833419)) (f64 (13918045884103580253)) 2 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 18
  = 18.
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  modeConvert_NWM_fun (f64 (4696243591608255960)) (f64 (4682489383283739664)) (f64 (4662940372737385044)) (f64 (13906896871446796440)) 0 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 14
  = 14.
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 17
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 33
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696718635632123962)) (f64 (4665361382487079256)) (f64 (4682594890029460976)) 2 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  modeConvert_NWM_fun (f64 (13910138998779114128)) (f64 (13919701196717329673)) (f64 (4665360556641592356)) (f64 (13917384947928566052)) 1 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 51
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 29
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695522968660496918)) (f64 (4662157693346560960)) (f64 (4686394420349629184)) 2 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  modeConvert_NWM_fun (f64 (13912235721937657238)) (f64 (4696404900052592022)) (f64 (4661579928291861600)) (f64 (13900941984979713584)) 3 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 51
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 73
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694096492634733974)) (f64 (4665578865200903424)) (f64 (13917844688203476594)) 2 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 10
  = 10.
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  modeConvert_NWM_fun (f64 (4683989077332876656)) (f64 (13918533924673320722)) (f64 (4661890000249863277)) (f64 (4694905942274054420)) 1 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 9
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 44
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 27
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4690687058748444444)) (f64 (4622469294540880024)) (f64 (4693224278099283766)) 2 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  modeConvert_NWM_fun (f64 (4689554990821424040)) (f64 (4687177346125699344)) (f64 (4666447502747744776)) (f64 (13912396145532090774)) 1 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 23
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 15
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4686519368644731288)) (f64 (4653569748574630796)) (f64 (13902855164891033136)) 2 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  modeConvert_NWM_fun (f64 (13916576280743944993)) (f64 (4692669536575799544)) (f64 (4664008336708257875)) (f64 (13917178318727609592)) 1 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 1
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13911519981039490044)) (f64 (4665572720654418743)) (f64 (4690541424471875004)) 2 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 31
  = 31.
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  modeConvert_NWM_fun (f64 (4693238052525192294)) (f64 (4690188808823899328)) (f64 (4644309657291006257)) (f64 (4695520705330181952)) 0 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 73
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 35
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13911962145436779694)) (f64 (4661309354023587622)) (f64 (13909867870554066764)) 2 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  modeConvert_NWM_fun (f64 (13906228905251847024)) (f64 (13917299865796362972)) (f64 (4666359678757738404)) (f64 (4692192068168500928)) 3 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 47
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 32
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 20
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4693752539674397804)) (f64 (4660539512941435655)) (f64 (4694912359207613734)) 2 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  modeConvert_NWM_fun (f64 (4688176776923615552)) (f64 (13918697930985033736)) (f64 (4662417678605139027)) (f64 (4696649306558964032)) 1 49
  = 49.
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 68
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 73
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 23
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916299549389010898)) (f64 (4657506400908679670)) (f64 (4691213008145172020)) 2 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  modeConvert_NWM_fun (f64 (4693469729625841120)) (f64 (4694395321492495104)) (f64 (4663827416342928114)) (f64 (4695853983832155372)) 0 58
  = 58.
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 26
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 25
  = 25.
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 30
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 72
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916563720078332980)) (f64 (4664866724692622325)) (f64 (4685231193189717312)) 2 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  modeConvert_NWM_fun (f64 (4690545520399885448)) (f64 (13903450130924940256)) (f64 (4666610630943903728)) (f64 (4694749488943535276)) 1 20
  = 20.
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 16
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916525691693864133)) (f64 (4660312441236058627)) (f64 (13917666272625347230)) 2 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 0
  = 0.
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  modeConvert_NWM_fun (f64 (4695895741860766440)) (f64 (4674246605310171744)) (f64 (4666367042939551860)) (f64 (4695146049671564078)) 3 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 16
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 51
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 69
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13913708525384586876)) (f64 (4653717493098688812)) (f64 (13917804300320443034)) 2 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  modeConvert_NWM_fun (f64 (4691744635803624348)) (f64 (4688113440408025008)) (f64 (4655712444263492298)) (f64 (4694431117538322758)) 2 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 52
  = 52.
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 71
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 62
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13893635821489784352)) (f64 (4650450101051765526)) (f64 (4695126274151675338)) 2 2
  = 2.
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  modeConvert_NWM_fun (f64 (13917795990959701198)) (f64 (4696369703476132430)) (f64 (4656994001802007900)) (f64 (4689081799457446632)) 2 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 67
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 70
  = 70.
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 4
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919002836097754054)) (f64 (4664410375290976670)) (f64 (13898447582456460240)) 2 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  modeConvert_NWM_fun (f64 (4695059959937812134)) (f64 (13918337309498284883)) (f64 (4656002394348967744)) (f64 (4689071013186835972)) 1 42
  = 42.
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 18
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 28
  = 28.
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 0
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696572340629627588)) (f64 (4660703303850276108)) (f64 (13911828634945251048)) 2 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 22
  = 22.
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  modeConvert_NWM_fun (f64 (13918376974870261768)) (f64 (4693696369430535726)) (f64 (4657916005238609921)) (f64 (4692555326186768956)) 1 69
  = 69.
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 49
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 20
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695728654055093324)) (f64 (4665057233710415349)) (f64 (4694148831669645852)) 2 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  modeConvert_NWM_fun (f64 (4692979002600843648)) (f64 (13911051395891487340)) (f64 (4661409370650901189)) (f64 (13918695760065736448)) 2 16
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 51
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 78
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 37
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13914316085052401616)) (f64 (4664087846305966074)) (f64 (4688977210360897624)) 2 1
  = 1.
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  modeConvert_NWM_fun (f64 (4692195655408850472)) (f64 (13914622579463719768)) (f64 (4646960361307063336)) (f64 (4694543299847246094)) 1 37
  = 37.
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 58
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 1
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 17
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694552329926693070)) (f64 (4665139612457451749)) (f64 (4684273515991383944)) 2 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  modeConvert_NWM_fun (f64 (4694630369826289346)) (f64 (4694118538901575768)) (f64 (4660883550413573606)) (f64 (13917089884693505046)) 3 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 75
  = 75.
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 11
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4691437870909708940)) (f64 (4664491734080882298)) (f64 (13903852299549768384)) 2 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 35
  = 35.
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  modeConvert_NWM_fun (f64 (4685475898007094648)) (f64 (4689660595920789096)) (f64 (4655803535167932177)) (f64 (13919589325718623841)) 2 47
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 7
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 23
  = 23.
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 49
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 25
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917352180051634658)) (f64 (4665003044051969093)) (f64 (13917357122001181582)) 2 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  modeConvert_NWM_fun (f64 (4690716468293761844)) (f64 (4687526858442198072)) (f64 (4663230101893863505)) (f64 (13891463262029239808)) 3 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 38
  = 38.
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 71
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 0
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13914889703146617138)) (f64 (4662718399220102456)) (f64 (13917676904173818923)) 2 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 55
  = 55.
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  modeConvert_NWM_fun (f64 (4695515732425333256)) (f64 (4688716195031802020)) (f64 (4663852147362482917)) (f64 (13908169391941958412)) 3 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 8
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 66
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 76
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694979976436804508)) (f64 (4657078003416182198)) (f64 (13920068328036129401)) 2 4
  = 4.
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  modeConvert_NWM_fun (f64 (13910555605276670212)) (f64 (4687849498366140336)) (f64 (4631075476309353036)) (f64 (4693796046485447710)) 1 24
  = 24.
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 57
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 58
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4692220992810859284)) (f64 (4664290477115674242)) (f64 (13916417628410387546)) 2 39
  = 39.
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  modeConvert_NWM_fun (f64 (4689670951295185476)) (f64 (13910691589771432088)) (f64 (4666075572494278124)) (f64 (13915416688143565216)) 3 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 6
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 64
  = 64.
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 31
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 74
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4658464652745177856)) (f64 (4666374631917330134)) (f64 (13919256447569944190)) 2 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 30
  = 30.
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  modeConvert_NWM_fun (f64 (4696415921851172398)) (f64 (13911377727354862020)) (f64 (4662305943280295920)) (f64 (4694988725652470228)) 2 62
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 26
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 13
  = 13.
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 14
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 69
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13917360516974390736)) (f64 (4642290966892938314)) (f64 (13907901044611707496)) 2 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 68
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  modeConvert_NWM_fun (f64 (13919420742717238284)) (f64 (4695762132214671608)) (f64 (4653605813490169966)) (f64 (4696719830872014176)) 2 48
  = 48.
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 21
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 12
  = 12.
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 49
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916411078687240262)) (f64 (4659453114883864948)) (f64 (13909053533576455428)) 2 16
  = 16.
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 60
  = 60.
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  modeConvert_NWM_fun (f64 (13895467261229014816)) (f64 (4692999712191945188)) (f64 (4663544353719699319)) (f64 (13916156182154684562)) 1 53
  = 53.
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 63
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 54
  = 54.
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 40
  = 40.
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 79
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 58
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694338740066442666)) (f64 (4661772932228924120)) (f64 (13919667311083699765)) 2 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 47
  = 47.
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  modeConvert_NWM_fun (f64 (13920164195187982926)) (f64 (4695100177438617934)) (f64 (4664503171784343703)) (f64 (4688421396338737208)) 1 67
  = 67.
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 29
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 41
  = 41.
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 44
  = 44.
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 69
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 31
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13919324048979931146)) (f64 (4664522035540952443)) (f64 (4695984957253612940)) 2 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  modeConvert_NWM_fun (f64 (4696518201170724112)) (f64 (4693461374100150998)) (f64 (4658999199376273412)) (f64 (13915853775598421299)) 3 27
  = 27.
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 31
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 71
  = 71.
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 11
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 34
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4696046142584178526)) (f64 (4665686908196936892)) (f64 (13919234056220535754)) 2 72
  = 72.
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  modeConvert_NWM_fun (f64 (4693970668992010426)) (f64 (4694563472546423332)) (f64 (4663502209497837467)) (f64 (13913372903936839718)) 1 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 39
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 65
  = 65.
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 22
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 39
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916844711940691926)) (f64 (4663427555272236791)) (f64 (13919075537527242952)) 2 9
  = 9.
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 56
  = 56.
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  modeConvert_NWM_fun (f64 (4693315292425727036)) (f64 (13913173441729415744)) (f64 (4656862368148641940)) (f64 (13917665752654587748)) 2 72
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 62
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 54
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 16
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4694852300532060752)) (f64 (4664178359726422579)) (f64 (4681553550803830320)) 2 34
  = 34.
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  modeConvert_NWM_fun (f64 (4695085688941173162)) (f64 (4694270073691522318)) (f64 (4662855152850277772)) (f64 (4692820658137396702)) 1 74
  = 74.
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 36
  = 36.
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 17
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 26
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13912501929334671424)) (f64 (4663909209509229415)) (f64 (4690690880777288564)) 2 6
  = 6.
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 3
  = 3.
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  modeConvert_NWM_fun (f64 (13891024274676386048)) (f64 (13915839977446522850)) (f64 (4661828558466332759)) (f64 (4695877859529609594)) 1 33
  = 33.
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 67
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 67
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 63
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4684327954686245496)) (f64 (4661856909614557463)) (f64 (13917925447481296916)) 2 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 63
  = 63.
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  modeConvert_NWM_fun (f64 (13915031029863473552)) (f64 (4691939766321452572)) (f64 (4652030763345369100)) (f64 (4694006540364946550)) 0 7
  = 7.
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 37
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 79
  = 79.
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 15
  = 15.
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 60
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 43
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13889212337698169600)) (f64 (4657471377912947578)) (f64 (4691126660610243532)) 2 5
  = 5.
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 73
  = 73.
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  modeConvert_NWM_fun (f64 (4691471032994442240)) (f64 (4688649920172673272)) (f64 (4663047629816657966)) (f64 (13918650592026356776)) 2 24
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 76
  = 76.
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 46
  = 46.
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 43
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 4
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4689082567626207720)) (f64 (4657335883533569371)) (f64 (13918771663692482636)) 2 45
  = 45.
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 66
  = 66.
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  modeConvert_NWM_fun (f64 (4695074597623713828)) (f64 (4690131353563188312)) (f64 (4652384366769531341)) (f64 (4686502643972193024)) 2 53
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 4
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 77
  = 77.
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 21
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 56
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (4695475265928426890)) (f64 (4663414121517581276)) (f64 (4690481647472382364)) 2 61
  = 61.
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 19
  = 19.
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  modeConvert_NWM_fun (f64 (4693940731026965302)) (f64 (4687224305041039352)) (f64 (4665918029293047383)) (f64 (13919019009460639014)) 3 59
  = 59.
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  modeConvert_NWM_fun (f64 (4638144666238189568)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 29
  = 51.
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  modeConvert_NWM_fun (f64 (4636737291354636288)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 57
  = 57.
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  modeConvert_NWM_fun (f64 (4639481672377565184)) (f64 (4636737291354636288)) (f64 (4632233691727265792)) (f64 (4741671816366391296)) 0 50
  = 50.
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (4647503709213818880)) (f64 (0)) 2 32
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4652007308841189376)) (f64 (4621819117588971520)) (f64 (0)) 2 11
  = 68.
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  modeConvert_NWM_fun (f64 (9221120237041090560)) (f64 (13916890608562204306)) (f64 (4665119161107872669)) (f64 (4669333075582168192)) 2 17
  = 17.
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  modeConvert_NWM_fun (f64 (4641240890982006784)) (f64 (4636737291354636288)) (f64 (13845191154443747328)) (f64 (4741671816366391296)) 0 74
  = 74.
Proof. vm_compute. reflexivity. Qed.
