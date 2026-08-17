(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.iplib.CS_Track_Plan.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  cs_Track_Plan_fun 0 (f64 (4608308318706860032)) (f64 (9223372036854775808)) (f64 (4593671619917905920))
  = [1; 1; 4608308318706860032; 9223372036854775808; 4593671619917905920].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  cs_Track_Plan_fun 1 (f64 (13835058055282163712)) (f64 (4613937818241073152)) (f64 (13839561654909534208))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  cs_Track_Plan_fun 2 (f64 (0)) (f64 (13821547256400052224)) (f64 (4602678819172646912))
  = [3; 1; 13821547256400052224; 4602678819172646912; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  cs_Track_Plan_fun 3 (f64 (4620693217682128896)) (f64 (4625196817309499392)) (f64 (4629700416936869888))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  cs_Track_Plan_fun 4 (f64 (13844065254536904704)) (f64 (13848568854164275200)) (f64 (13853072453791645696))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  cs_Track_Plan_fun 42 (f64 (9607322161900909158)) (f64 (2464765278566582972)) (f64 (13297594269363903938))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  cs_Track_Plan_fun 7 (f64 (17444171210150376942)) (f64 (6567839332584942096)) (f64 (9770621759530327857))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  cs_Track_Plan_fun 4 (f64 (2297983254561753802)) (f64 (18185094297472730774)) (f64 (12866042257794296776))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  cs_Track_Plan_fun 3 (f64 (10760198232510463962)) (f64 (14672240828082357917)) (f64 (2712131813201864316))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  cs_Track_Plan_fun 1 (f64 (17797283099460776866)) (f64 (14013940884064132951)) (f64 (15687211084263741715))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  cs_Track_Plan_fun 0 (f64 (12532648586842813227)) (f64 (5321642065988187542)) (f64 (3550178339426522265))
  = [1; 1; 12532648586842813227; 5321642065988187542; 3550178339426522265].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  cs_Track_Plan_fun 4 (f64 (2362095329605139183)) (f64 (4627769919018454588)) (f64 (18024228232371628933))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  cs_Track_Plan_fun 2 (f64 (13348268254322201133)) (f64 (6563801421070292218)) (f64 (17918284572086816848))
  = [3; 1; 6563801421070292218; 17918284572086816848; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  cs_Track_Plan_fun 4 (f64 (8304691260946387590)) (f64 (1880697251987496262)) (f64 (10918202092092016811))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  cs_Track_Plan_fun 7 (f64 (8798509039997749490)) (f64 (16683652086332015397)) (f64 (11115092788098045249))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  cs_Track_Plan_fun 7 (f64 (8397170456531708776)) (f64 (15445155880504093853)) (f64 (1847651182217209926))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  cs_Track_Plan_fun 2 (f64 (9207486953699769748)) (f64 (8083290228896342555)) (f64 (8136299339753908821))
  = [3; 1; 8083290228896342555; 8136299339753908821; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  cs_Track_Plan_fun 2 (f64 (14722787114589845684)) (f64 (1509703965345542719)) (f64 (13978531602757487919))
  = [3; 1; 1509703965345542719; 13978531602757487919; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  cs_Track_Plan_fun 3 (f64 (2640266152248174834)) (f64 (16321199857035536293)) (f64 (905091766180454718))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  cs_Track_Plan_fun 4 (f64 (5782872072433522175)) (f64 (2226839275626442524)) (f64 (4009806325574056805))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  cs_Track_Plan_fun 2 (f64 (11873481543611749464)) (f64 (16876228273296595439)) (f64 (1898855901568552932))
  = [3; 1; 16876228273296595439; 1898855901568552932; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  cs_Track_Plan_fun 42 (f64 (9918479110207869056)) (f64 (4339161864454732308)) (f64 (16749637213641760482))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  cs_Track_Plan_fun 1 (f64 (11050295904421224370)) (f64 (3660483710240281694)) (f64 (16323261314067309595))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  cs_Track_Plan_fun 4294967295 (f64 (14505795169535211061)) (f64 (14513469553399638654)) (f64 (11333241351189916944))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  cs_Track_Plan_fun 0 (f64 (5620570580171248734)) (f64 (16143928402376922347)) (f64 (4757897717037291334))
  = [1; 1; 5620570580171248734; 16143928402376922347; 4757897717037291334].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  cs_Track_Plan_fun 0 (f64 (4775124445088031776)) (f64 (487926052350618698)) (f64 (6415709633459559870))
  = [1; 1; 4775124445088031776; 487926052350618698; 6415709633459559870].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  cs_Track_Plan_fun 4294967295 (f64 (18436265176576235591)) (f64 (16250749777375956839)) (f64 (17931276608936182434))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  cs_Track_Plan_fun 1 (f64 (4350227686510872820)) (f64 (17066556953355365358)) (f64 (11976592327759331011))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  cs_Track_Plan_fun 4 (f64 (4170749365442719538)) (f64 (11383453959690704238)) (f64 (11847572101015648385))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  cs_Track_Plan_fun 4 (f64 (8707562977477776413)) (f64 (3418396208909752662)) (f64 (17388060143033501544))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  cs_Track_Plan_fun 3 (f64 (5908328780670663617)) (f64 (14143122025226109727)) (f64 (1267745665592213500))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  cs_Track_Plan_fun 1 (f64 (14959953519480708679)) (f64 (16486090151311137790)) (f64 (9092810803791709144))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  cs_Track_Plan_fun 0 (f64 (15866352159700343122)) (f64 (7209206955250746044)) (f64 (18002700567719684178))
  = [1; 1; 15866352159700343122; 7209206955250746044; 18002700567719684178].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  cs_Track_Plan_fun 4 (f64 (12542055053527537529)) (f64 (15374428931154335974)) (f64 (17125924340860200810))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  cs_Track_Plan_fun 1 (f64 (6690929155356711479)) (f64 (2516896310307004666)) (f64 (14594910475471871527))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  cs_Track_Plan_fun 42 (f64 (11427273105179644271)) (f64 (9857308901444363022)) (f64 (9301003001726238883))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  cs_Track_Plan_fun 1 (f64 (3812001193942340808)) (f64 (8990417315434513275)) (f64 (1357093157936552150))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  cs_Track_Plan_fun 2 (f64 (9126298209739041788)) (f64 (2535492543998230300)) (f64 (8254231959363478642))
  = [3; 1; 2535492543998230300; 8254231959363478642; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  cs_Track_Plan_fun 42 (f64 (17269742440709320251)) (f64 (5241223435928852761)) (f64 (6775648619240952135))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  cs_Track_Plan_fun 2 (f64 (13043124758652258716)) (f64 (143237411720819598)) (f64 (6684507867702768530))
  = [3; 1; 143237411720819598; 6684507867702768530; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  cs_Track_Plan_fun 4 (f64 (16567390725545673404)) (f64 (3313636233365944748)) (f64 (16310015458188316309))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  cs_Track_Plan_fun 1 (f64 (15758163215198212398)) (f64 (6568834740680749394)) (f64 (18317126685916219964))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  cs_Track_Plan_fun 1 (f64 (7478410201907257058)) (f64 (8377369653013795245)) (f64 (11002636903292719554))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  cs_Track_Plan_fun 4294967295 (f64 (10390095947398219747)) (f64 (10583435265374728972)) (f64 (3629334858186512572))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  cs_Track_Plan_fun 42 (f64 (12332196685249072394)) (f64 (871269279100537873)) (f64 (13023465138711645481))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  cs_Track_Plan_fun 42 (f64 (12564208892351676988)) (f64 (3157492335726500844)) (f64 (695752568988589232))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  cs_Track_Plan_fun 3 (f64 (17162460168545947356)) (f64 (10072805126644873981)) (f64 (5541551377594912577))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  cs_Track_Plan_fun 3 (f64 (7613194271336539146)) (f64 (15959166710295203078)) (f64 (12223865827814719256))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  cs_Track_Plan_fun 4294967295 (f64 (6315460135485223506)) (f64 (8353100437448991914)) (f64 (11855892947658082278))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  cs_Track_Plan_fun 4294967295 (f64 (7738086624637543198)) (f64 (583398098978923573)) (f64 (4924964741589583268))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  cs_Track_Plan_fun 4294967295 (f64 (3754778133609353198)) (f64 (15988432389266007940)) (f64 (5592366489979680384))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  cs_Track_Plan_fun 7 (f64 (11347637047363131366)) (f64 (16596011780465293640)) (f64 (5748896907036278105))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  cs_Track_Plan_fun 7 (f64 (850904921851547649)) (f64 (16610390366090540490)) (f64 (16213460899540381742))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  cs_Track_Plan_fun 4294967295 (f64 (16649269175434009481)) (f64 (5015556334419995299)) (f64 (12792478473652178042))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  cs_Track_Plan_fun 3 (f64 (17042112487757873127)) (f64 (2734024304852032225)) (f64 (17395698122166368946))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  cs_Track_Plan_fun 3 (f64 (11560906555157242504)) (f64 (11396770146731451048)) (f64 (3811299864501511519))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  cs_Track_Plan_fun 1 (f64 (14925447279061779102)) (f64 (13978828463918312458)) (f64 (15827589908471808920))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  cs_Track_Plan_fun 4 (f64 (1018177572069152694)) (f64 (969716402943727848)) (f64 (13874915412106446420))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  cs_Track_Plan_fun 4294967295 (f64 (10506688281773840795)) (f64 (13167561650158473939)) (f64 (2880643438030965870))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  cs_Track_Plan_fun 42 (f64 (7159305649770417239)) (f64 (16205586970449839586)) (f64 (17857874566116807657))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  cs_Track_Plan_fun 1 (f64 (1658612468484555399)) (f64 (1090481561956507890)) (f64 (3679803175738796937))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  cs_Track_Plan_fun 7 (f64 (5734291711963030317)) (f64 (4930585149047834011)) (f64 (2326130823960836680))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  cs_Track_Plan_fun 1 (f64 (3841526576668470710)) (f64 (14719258339666442415)) (f64 (257988512483372172))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  cs_Track_Plan_fun 0 (f64 (13240629171491893368)) (f64 (13303629704036788822)) (f64 (14999989333153672103))
  = [1; 1; 13240629171491893368; 13303629704036788822; 14999989333153672103].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  cs_Track_Plan_fun 2 (f64 (6854401957655086407)) (f64 (16304389673575584506)) (f64 (10268409270814334411))
  = [3; 1; 16304389673575584506; 10268409270814334411; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  cs_Track_Plan_fun 2 (f64 (7048029188543078412)) (f64 (2074399544328352598)) (f64 (1256266474122169757))
  = [3; 1; 2074399544328352598; 1256266474122169757; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  cs_Track_Plan_fun 0 (f64 (1415502274107629546)) (f64 (2439402241840278694)) (f64 (11989893677773525587))
  = [1; 1; 1415502274107629546; 2439402241840278694; 11989893677773525587].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  cs_Track_Plan_fun 4294967295 (f64 (9290950862881541571)) (f64 (17442259321048830655)) (f64 (4096013338843657359))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  cs_Track_Plan_fun 4294967295 (f64 (2601890804263908323)) (f64 (7399201275657996478)) (f64 (5911687033145624266))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  cs_Track_Plan_fun 4294967295 (f64 (487162577312984542)) (f64 (13723886731425695431)) (f64 (11927625296237867383))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  cs_Track_Plan_fun 4 (f64 (15593573192126913663)) (f64 (12325662380985980917)) (f64 (9457365651781235148))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  cs_Track_Plan_fun 4294967295 (f64 (10365750720943754236)) (f64 (16557088987257130618)) (f64 (1796589447369316843))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  cs_Track_Plan_fun 4294967295 (f64 (10367639769969472243)) (f64 (5885316106571550929)) (f64 (11363319370520881655))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  cs_Track_Plan_fun 2 (f64 (15696740415022269134)) (f64 (3626205128999222515)) (f64 (16357798065398490481))
  = [3; 1; 3626205128999222515; 16357798065398490481; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  cs_Track_Plan_fun 1 (f64 (16405364440089490878)) (f64 (126784729467961683)) (f64 (12862199441119609978))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  cs_Track_Plan_fun 4 (f64 (15349417982993335544)) (f64 (5837902537585277481)) (f64 (13908073805991998925))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  cs_Track_Plan_fun 0 (f64 (15837451146242428804)) (f64 (12098574970969368921)) (f64 (934996625981557613))
  = [1; 1; 15837451146242428804; 12098574970969368921; 934996625981557613].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  cs_Track_Plan_fun 4294967295 (f64 (561415416333556729)) (f64 (15341325266251089827)) (f64 (3311942223789656492))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  cs_Track_Plan_fun 2 (f64 (4079727387544728227)) (f64 (16241333724423989101)) (f64 (7239642512955778589))
  = [3; 1; 16241333724423989101; 7239642512955778589; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  cs_Track_Plan_fun 7 (f64 (4550116543918301795)) (f64 (12739556778837154710)) (f64 (2553780296740906650))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  cs_Track_Plan_fun 0 (f64 (18408219900677125078)) (f64 (4254684427486983247)) (f64 (7998826388526695663))
  = [1; 1; 18408219900677125078; 4254684427486983247; 7998826388526695663].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  cs_Track_Plan_fun 4294967295 (f64 (284624754298053660)) (f64 (5360979002351016801)) (f64 (5716773851517344119))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  cs_Track_Plan_fun 2 (f64 (12452902178601397508)) (f64 (3842801657676237879)) (f64 (17785065638068534821))
  = [3; 1; 3842801657676237879; 17785065638068534821; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  cs_Track_Plan_fun 7 (f64 (13015892910633567294)) (f64 (10250374440539794358)) (f64 (16742671592056094077))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  cs_Track_Plan_fun 0 (f64 (6426492417415420418)) (f64 (5809214730846317961)) (f64 (2729624563937183400))
  = [1; 1; 6426492417415420418; 5809214730846317961; 2729624563937183400].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  cs_Track_Plan_fun 3 (f64 (14476265441316374662)) (f64 (16143216007278505923)) (f64 (2874669615836015327))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  cs_Track_Plan_fun 1 (f64 (4231813979095808542)) (f64 (3303819918311605006)) (f64 (10870720088307581838))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  cs_Track_Plan_fun 0 (f64 (8209150885319469904)) (f64 (2486325620952428248)) (f64 (16433319177619412358))
  = [1; 1; 8209150885319469904; 2486325620952428248; 16433319177619412358].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  cs_Track_Plan_fun 2 (f64 (9049765945818257732)) (f64 (14012039343158551983)) (f64 (2319103759641847681))
  = [3; 1; 14012039343158551983; 2319103759641847681; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  cs_Track_Plan_fun 7 (f64 (13931696770274426897)) (f64 (8777374258616052415)) (f64 (14574346506391675688))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  cs_Track_Plan_fun 2 (f64 (11470133177070112827)) (f64 (9771809409680069551)) (f64 (15354432291066361774))
  = [3; 1; 9771809409680069551; 15354432291066361774; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  cs_Track_Plan_fun 1 (f64 (13362855388608292616)) (f64 (2216589276642071548)) (f64 (8219579671911804251))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  cs_Track_Plan_fun 4 (f64 (12658360538220046532)) (f64 (14038519854078290133)) (f64 (11433590606345364996))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  cs_Track_Plan_fun 7 (f64 (13459401510505469970)) (f64 (2628978005638410383)) (f64 (12756258974874611165))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  cs_Track_Plan_fun 7 (f64 (14098166697051954984)) (f64 (13501488585196342017)) (f64 (17352201018735407212))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  cs_Track_Plan_fun 1 (f64 (14685109740357257882)) (f64 (6597100377481402147)) (f64 (17216942073784410839))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  cs_Track_Plan_fun 3 (f64 (9257490508776450915)) (f64 (14063039708295773584)) (f64 (18045645471843006925))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  cs_Track_Plan_fun 4294967295 (f64 (6973789492807480354)) (f64 (7558071108482462579)) (f64 (18409225773669765846))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  cs_Track_Plan_fun 4294967295 (f64 (8406110039530545878)) (f64 (9163230948509453060)) (f64 (13700384617281967015))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  cs_Track_Plan_fun 42 (f64 (2033761863983401007)) (f64 (12746145364665522113)) (f64 (3218386331967324196))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  cs_Track_Plan_fun 2 (f64 (1767391253224610504)) (f64 (2649994649312247475)) (f64 (3332114461848249979))
  = [3; 1; 2649994649312247475; 3332114461848249979; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  cs_Track_Plan_fun 2 (f64 (18152153763903116315)) (f64 (5733183551733375935)) (f64 (16994562640112114064))
  = [3; 1; 5733183551733375935; 16994562640112114064; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  cs_Track_Plan_fun 7 (f64 (222831527344835845)) (f64 (15883348996378676036)) (f64 (17946485135644901858))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  cs_Track_Plan_fun 42 (f64 (5254072573555589269)) (f64 (9762754722512103049)) (f64 (11711543392022550300))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  cs_Track_Plan_fun 42 (f64 (5102021026771633142)) (f64 (13803163288288681873)) (f64 (9506659520185069127))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  cs_Track_Plan_fun 2 (f64 (16756457425711236064)) (f64 (5533234760341966005)) (f64 (1838863855111140137))
  = [3; 1; 5533234760341966005; 1838863855111140137; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  cs_Track_Plan_fun 7 (f64 (5513835934421816498)) (f64 (8875606971149513478)) (f64 (8749993304217785591))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  cs_Track_Plan_fun 3 (f64 (8278299118587693068)) (f64 (4034384230953567634)) (f64 (13750768254280680775))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  cs_Track_Plan_fun 3 (f64 (16537123252764055559)) (f64 (16728615090479328951)) (f64 (9060540277741909104))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  cs_Track_Plan_fun 7 (f64 (11034391637802385404)) (f64 (15444474952000780793)) (f64 (17543231002794559633))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  cs_Track_Plan_fun 4 (f64 (17599538939893282885)) (f64 (10673304726838940388)) (f64 (1930201889337125899))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  cs_Track_Plan_fun 4294967295 (f64 (15153111346308490084)) (f64 (7752060168098521937)) (f64 (2671485119074986900))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  cs_Track_Plan_fun 1 (f64 (270868461036530177)) (f64 (6705599285626090735)) (f64 (4185992762004769211))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  cs_Track_Plan_fun 4 (f64 (11925990934595476612)) (f64 (783565881626507706)) (f64 (18412666876467490871))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  cs_Track_Plan_fun 2 (f64 (8320396838799439670)) (f64 (5628056206433075068)) (f64 (10449890451932575599))
  = [3; 1; 5628056206433075068; 10449890451932575599; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  cs_Track_Plan_fun 4294967295 (f64 (4204324502204658821)) (f64 (6533227640541144516)) (f64 (13689524999278246994))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  cs_Track_Plan_fun 42 (f64 (11787619862539744468)) (f64 (7557817986398995975)) (f64 (2603112138871458169))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  cs_Track_Plan_fun 4294967295 (f64 (2342434400827379004)) (f64 (13678728869936354573)) (f64 (8799458429016341294))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  cs_Track_Plan_fun 1 (f64 (14426814776003235565)) (f64 (17729518531588228941)) (f64 (1514075021356769936))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  cs_Track_Plan_fun 1 (f64 (2562649162540988701)) (f64 (16156395917618254430)) (f64 (4594190810974580624))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  cs_Track_Plan_fun 7 (f64 (1100330182786631170)) (f64 (4689642552239928529)) (f64 (838271371004873765))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  cs_Track_Plan_fun 4 (f64 (14707691952957198541)) (f64 (11804512764983511552)) (f64 (5928340151950617785))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  cs_Track_Plan_fun 3 (f64 (11895951822413405956)) (f64 (16230747370357137177)) (f64 (8257080949397277863))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  cs_Track_Plan_fun 42 (f64 (15616937551928569978)) (f64 (12978034236747418351)) (f64 (6034539721277325380))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  cs_Track_Plan_fun 2 (f64 (6561141467762333012)) (f64 (11316593220247222276)) (f64 (3369663594963639609))
  = [3; 1; 11316593220247222276; 3369663594963639609; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  cs_Track_Plan_fun 4 (f64 (1807270509387474470)) (f64 (17080512947638805414)) (f64 (1089356146596949586))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  cs_Track_Plan_fun 0 (f64 (15272932485278900927)) (f64 (16076457792972587209)) (f64 (5546301763680991286))
  = [1; 1; 15272932485278900927; 16076457792972587209; 5546301763680991286].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  cs_Track_Plan_fun 4294967295 (f64 (6662408651372588652)) (f64 (6401873022686326585)) (f64 (8075680476829390942))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  cs_Track_Plan_fun 4 (f64 (2699723673914598360)) (f64 (5958525485122940124)) (f64 (9427725509898520269))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  cs_Track_Plan_fun 4 (f64 (16525781125114000498)) (f64 (11370953711428687362)) (f64 (14540461732680970179))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  cs_Track_Plan_fun 1 (f64 (520757445164766457)) (f64 (14691185939273477621)) (f64 (17707323485406081612))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  cs_Track_Plan_fun 42 (f64 (16003671898757347208)) (f64 (39662023088415189)) (f64 (3686508148005382977))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  cs_Track_Plan_fun 2 (f64 (2485495073665668131)) (f64 (5638787365030595371)) (f64 (3906110494727898335))
  = [3; 1; 5638787365030595371; 3906110494727898335; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  cs_Track_Plan_fun 42 (f64 (16425082109464924251)) (f64 (10278649434929540889)) (f64 (3490801346949145354))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  cs_Track_Plan_fun 3 (f64 (7658434455395508756)) (f64 (6208014031297483093)) (f64 (1253450512194381720))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  cs_Track_Plan_fun 2 (f64 (12392801086920288206)) (f64 (12625533490995605681)) (f64 (2126008828961244114))
  = [3; 1; 12625533490995605681; 2126008828961244114; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  cs_Track_Plan_fun 1 (f64 (14965504964368537743)) (f64 (7173598350534910344)) (f64 (1282670433926653451))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  cs_Track_Plan_fun 0 (f64 (6953427991488381681)) (f64 (18428567527376638139)) (f64 (5765969404755528668))
  = [1; 1; 6953427991488381681; 18428567527376638139; 5765969404755528668].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  cs_Track_Plan_fun 3 (f64 (18396600056019703670)) (f64 (7242965724779908457)) (f64 (6190636332961042436))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  cs_Track_Plan_fun 1 (f64 (3989756247407336797)) (f64 (9016734514731181790)) (f64 (15129569909579721080))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  cs_Track_Plan_fun 0 (f64 (2312907043690327579)) (f64 (17212901858370276137)) (f64 (2268714028483304737))
  = [1; 1; 2312907043690327579; 17212901858370276137; 2268714028483304737].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  cs_Track_Plan_fun 2 (f64 (2189329093996681985)) (f64 (14730213955516141555)) (f64 (5577639394869335454))
  = [3; 1; 14730213955516141555; 5577639394869335454; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  cs_Track_Plan_fun 42 (f64 (6382781935379176586)) (f64 (12814137371668801319)) (f64 (16009110555946452294))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  cs_Track_Plan_fun 0 (f64 (15111782583987490266)) (f64 (11356048657782026791)) (f64 (9859065332278677873))
  = [1; 1; 15111782583987490266; 11356048657782026791; 9859065332278677873].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  cs_Track_Plan_fun 42 (f64 (16868207300061132128)) (f64 (14986502804672882640)) (f64 (12310398076603461305))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  cs_Track_Plan_fun 4294967295 (f64 (11483034190809746987)) (f64 (2107566624493881647)) (f64 (15146413883836248219))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  cs_Track_Plan_fun 4 (f64 (9761011690789735966)) (f64 (843666878692387201)) (f64 (4931228289816836808))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  cs_Track_Plan_fun 42 (f64 (9765120190512145831)) (f64 (3561040440126665011)) (f64 (15447266275760406364))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  cs_Track_Plan_fun 4294967295 (f64 (4422711961415880207)) (f64 (4602943986663481915)) (f64 (17765188597634488363))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  cs_Track_Plan_fun 7 (f64 (16459633922842286946)) (f64 (8314827830466884323)) (f64 (18157659010378308813))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  cs_Track_Plan_fun 4294967295 (f64 (11068096133215412643)) (f64 (1613887649361966244)) (f64 (1357236085526811381))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  cs_Track_Plan_fun 3 (f64 (6522215885807423337)) (f64 (33882939837467914)) (f64 (10113491553758296008))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  cs_Track_Plan_fun 3 (f64 (10964992437570319526)) (f64 (14177300839417177692)) (f64 (8571343582919525798))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  cs_Track_Plan_fun 4 (f64 (2605968666472324044)) (f64 (15986515378262197583)) (f64 (6259660278885109015))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  cs_Track_Plan_fun 1 (f64 (11307465502874623268)) (f64 (18432676709921531464)) (f64 (11128438333031747613))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  cs_Track_Plan_fun 7 (f64 (15764138338923199116)) (f64 (17996472131007211683)) (f64 (2467182536900648019))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  cs_Track_Plan_fun 3 (f64 (4378431308738893493)) (f64 (15130071391561303850)) (f64 (12944679632763181817))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  cs_Track_Plan_fun 3 (f64 (4064378605861168398)) (f64 (3318481288618829364)) (f64 (2557700488153449165))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  cs_Track_Plan_fun 4 (f64 (17524207304210101104)) (f64 (1004518697347280077)) (f64 (13207204291051633503))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  cs_Track_Plan_fun 42 (f64 (10177331667882803912)) (f64 (13701586713051855946)) (f64 (1218108832344556955))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  cs_Track_Plan_fun 4294967295 (f64 (12047184876961086239)) (f64 (10563422264189446582)) (f64 (9394427727230046683))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  cs_Track_Plan_fun 3 (f64 (5965442361738887641)) (f64 (12927754109023887559)) (f64 (15887775414478248542))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  cs_Track_Plan_fun 4294967295 (f64 (3985183485201855675)) (f64 (8668628772292900314)) (f64 (14837349013433400653))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  cs_Track_Plan_fun 7 (f64 (5316035065360219379)) (f64 (1279083329618982912)) (f64 (8735372880137159046))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  cs_Track_Plan_fun 4294967295 (f64 (16655844761886772535)) (f64 (11322344896726220071)) (f64 (15886410180291699773))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  cs_Track_Plan_fun 4 (f64 (15332477045179293061)) (f64 (11173580372500236026)) (f64 (2654567171911117610))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  cs_Track_Plan_fun 4 (f64 (16690571203498024909)) (f64 (7370304183897166732)) (f64 (393618036182824735))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  cs_Track_Plan_fun 0 (f64 (9032990341932753669)) (f64 (4500824288038757041)) (f64 (13112731251579389610))
  = [1; 1; 9032990341932753669; 4500824288038757041; 13112731251579389610].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  cs_Track_Plan_fun 0 (f64 (10879670306493221418)) (f64 (9187579011459700873)) (f64 (15665089417824967142))
  = [1; 1; 10879670306493221418; 9187579011459700873; 15665089417824967142].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  cs_Track_Plan_fun 42 (f64 (6436890881167939745)) (f64 (1734366654036167860)) (f64 (12537231065825220957))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  cs_Track_Plan_fun 0 (f64 (8013632754229440216)) (f64 (4088056107326431769)) (f64 (8126417375777496584))
  = [1; 1; 8013632754229440216; 4088056107326431769; 8126417375777496584].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  cs_Track_Plan_fun 1 (f64 (3819381477757632586)) (f64 (10395198149931085761)) (f64 (4719415052688308304))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  cs_Track_Plan_fun 4294967295 (f64 (5777393999892221672)) (f64 (4257214364244093274)) (f64 (7662928321322252069))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  cs_Track_Plan_fun 42 (f64 (12632608387136549754)) (f64 (10654875271446504033)) (f64 (4746091005759121313))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  cs_Track_Plan_fun 3 (f64 (7467085743446107833)) (f64 (16852173904190641576)) (f64 (16628464186455009525))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  cs_Track_Plan_fun 1 (f64 (11883776964339119291)) (f64 (206908532284440439)) (f64 (13140193176270101437))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  cs_Track_Plan_fun 1 (f64 (11099310206827544183)) (f64 (14233925543815431514)) (f64 (17085070176303131828))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  cs_Track_Plan_fun 2 (f64 (11808147341247076571)) (f64 (4197522422930673241)) (f64 (3507401035363597619))
  = [3; 1; 4197522422930673241; 3507401035363597619; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  cs_Track_Plan_fun 1 (f64 (18309379683204842694)) (f64 (5424650235766009697)) (f64 (14745470133528620960))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  cs_Track_Plan_fun 4 (f64 (3902317802398233201)) (f64 (5969642236215498826)) (f64 (11487071092206772531))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  cs_Track_Plan_fun 3 (f64 (13736939753220813402)) (f64 (13677959990030468272)) (f64 (15838835727471825837))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  cs_Track_Plan_fun 3 (f64 (18414062409756369260)) (f64 (14184392885220301303)) (f64 (3568557593171829885))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  cs_Track_Plan_fun 42 (f64 (189877311408930812)) (f64 (2375120262247062315)) (f64 (8472023917126429772))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  cs_Track_Plan_fun 3 (f64 (16004413134836352635)) (f64 (12732325163276231670)) (f64 (7119016088400175278))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  cs_Track_Plan_fun 42 (f64 (15620442514865123452)) (f64 (2802582344322471668)) (f64 (8696613992998453171))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  cs_Track_Plan_fun 4294967295 (f64 (51678505185183379)) (f64 (9387790388277107409)) (f64 (1481235789653363590))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  cs_Track_Plan_fun 42 (f64 (7231977956061555503)) (f64 (3077878852980254313)) (f64 (17517607152290127749))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  cs_Track_Plan_fun 0 (f64 (8544159542403374854)) (f64 (12241969567690345696)) (f64 (5980078204601138180))
  = [1; 1; 8544159542403374854; 12241969567690345696; 5980078204601138180].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  cs_Track_Plan_fun 2 (f64 (12889644599434411338)) (f64 (5827479949914371139)) (f64 (3342933344678607784))
  = [3; 1; 5827479949914371139; 3342933344678607784; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  cs_Track_Plan_fun 1 (f64 (10362531493961831871)) (f64 (12545362254042782170)) (f64 (3763254564714899287))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  cs_Track_Plan_fun 0 (f64 (5516310718158361910)) (f64 (1532799926374739722)) (f64 (8264019103497194626))
  = [1; 1; 5516310718158361910; 1532799926374739722; 8264019103497194626].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  cs_Track_Plan_fun 4294967295 (f64 (5114941366748099998)) (f64 (6830080441847873244)) (f64 (18239671911344966044))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  cs_Track_Plan_fun 4 (f64 (3483412326477574073)) (f64 (7320462112131461640)) (f64 (18318056741626361453))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  cs_Track_Plan_fun 42 (f64 (7572655191121074183)) (f64 (2498584947023945995)) (f64 (3370001676034503516))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  cs_Track_Plan_fun 42 (f64 (5722163364144122251)) (f64 (5666568517929920096)) (f64 (17357195352555873863))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  cs_Track_Plan_fun 7 (f64 (14914045621745343387)) (f64 (15560724651198925100)) (f64 (11546859281882546449))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  cs_Track_Plan_fun 7 (f64 (13768492777575692736)) (f64 (11655906185678830431)) (f64 (7443961080954184901))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  cs_Track_Plan_fun 42 (f64 (6981413339829022346)) (f64 (9923411010725808555)) (f64 (538978087902475691))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  cs_Track_Plan_fun 2 (f64 (11112257962170378491)) (f64 (7034014961661201365)) (f64 (16536440661844633957))
  = [3; 1; 7034014961661201365; 16536440661844633957; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  cs_Track_Plan_fun 4 (f64 (969088218557123825)) (f64 (12647213967840412408)) (f64 (14195444301905939037))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  cs_Track_Plan_fun 3 (f64 (11104152830559990208)) (f64 (8964525374389503521)) (f64 (8885015415129368278))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  cs_Track_Plan_fun 4294967295 (f64 (6373897060213083526)) (f64 (15574594086351068917)) (f64 (1793246788228925804))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  cs_Track_Plan_fun 1 (f64 (16851760502918149515)) (f64 (7864306882843786730)) (f64 (3819812524391714326))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  cs_Track_Plan_fun 3 (f64 (18042225657792224477)) (f64 (8058392125487263458)) (f64 (13628817420567711632))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  cs_Track_Plan_fun 2 (f64 (6275842230908713239)) (f64 (14134019298036025830)) (f64 (4228896911442737449))
  = [3; 1; 14134019298036025830; 4228896911442737449; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  cs_Track_Plan_fun 4 (f64 (18321756234848548431)) (f64 (429142847512316340)) (f64 (15103954297745993970))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  cs_Track_Plan_fun 1 (f64 (5733557602978637585)) (f64 (3423431164768506406)) (f64 (12830319383444695894))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  cs_Track_Plan_fun 4294967295 (f64 (13753537838330420587)) (f64 (15141598294089821683)) (f64 (792755908733151443))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  cs_Track_Plan_fun 3 (f64 (677499604698016902)) (f64 (11283345845407519844)) (f64 (10978018609954246743))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  cs_Track_Plan_fun 0 (f64 (14064895827959193349)) (f64 (14296203207587093546)) (f64 (285477021229332158))
  = [1; 1; 14064895827959193349; 14296203207587093546; 285477021229332158].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  cs_Track_Plan_fun 4 (f64 (445151365194598178)) (f64 (9486356075627287417)) (f64 (7799901756312452365))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  cs_Track_Plan_fun 2 (f64 (7950782773567987005)) (f64 (14122963798172848325)) (f64 (6868695234780806890))
  = [3; 1; 14122963798172848325; 6868695234780806890; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  cs_Track_Plan_fun 1 (f64 (10158390207559301461)) (f64 (5322987016012558892)) (f64 (17412503242245534333))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  cs_Track_Plan_fun 1 (f64 (17186549168391799539)) (f64 (5710175179657144233)) (f64 (14015542759098064645))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  cs_Track_Plan_fun 4294967295 (f64 (17733595443688368387)) (f64 (9769169631592103232)) (f64 (8989793976137529257))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  cs_Track_Plan_fun 4 (f64 (1112247867156401483)) (f64 (13375355811990570152)) (f64 (6131772797024268920))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  cs_Track_Plan_fun 2 (f64 (10944601743840620425)) (f64 (18316692507741335311)) (f64 (54760040825971747))
  = [3; 1; 18316692507741335311; 54760040825971747; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  cs_Track_Plan_fun 1 (f64 (15628337688573114373)) (f64 (9623766932349074589)) (f64 (2065452327328205181))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  cs_Track_Plan_fun 4 (f64 (2757284881341755412)) (f64 (3221720634553734254)) (f64 (2306592278620444660))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  cs_Track_Plan_fun 1 (f64 (6521393614229219568)) (f64 (16442042732507187235)) (f64 (13668390067957644262))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  cs_Track_Plan_fun 3 (f64 (17258250523960620372)) (f64 (6578371657574212365)) (f64 (4082873366380115417))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  cs_Track_Plan_fun 1 (f64 (18334506559575811846)) (f64 (8008724805739217516)) (f64 (877099300889772194))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  cs_Track_Plan_fun 4294967295 (f64 (13606393249099755252)) (f64 (5712779111097351494)) (f64 (4716077683776762466))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  cs_Track_Plan_fun 3 (f64 (591587349594984920)) (f64 (11577566391308163882)) (f64 (141165002937232483))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  cs_Track_Plan_fun 4 (f64 (4780313951534269534)) (f64 (17092782191930489634)) (f64 (8671765792336182721))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  cs_Track_Plan_fun 42 (f64 (4958244123587401659)) (f64 (15810439980003535198)) (f64 (5935083682084673546))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  cs_Track_Plan_fun 2 (f64 (4998793274708663364)) (f64 (16253703938852180165)) (f64 (17974403998970873656))
  = [3; 1; 16253703938852180165; 17974403998970873656; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  cs_Track_Plan_fun 3 (f64 (16677258516781507079)) (f64 (11112619822969600516)) (f64 (15033065526469348437))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  cs_Track_Plan_fun 0 (f64 (6015929578478828926)) (f64 (7825542434057098670)) (f64 (14239531313528368514))
  = [1; 1; 6015929578478828926; 7825542434057098670; 14239531313528368514].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  cs_Track_Plan_fun 2 (f64 (2423199802229557811)) (f64 (7409489851841697789)) (f64 (13502386427684576023))
  = [3; 1; 7409489851841697789; 13502386427684576023; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  cs_Track_Plan_fun 7 (f64 (14930300440560721344)) (f64 (12362253007580366055)) (f64 (10328410854568072499))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  cs_Track_Plan_fun 1 (f64 (17000918773950869061)) (f64 (3909322443761785932)) (f64 (3204290729828982614))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  cs_Track_Plan_fun 2 (f64 (18251152393201820887)) (f64 (11835563632257230344)) (f64 (3429352295572405213))
  = [3; 1; 11835563632257230344; 3429352295572405213; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  cs_Track_Plan_fun 4 (f64 (1213950085727323401)) (f64 (8351968610692178702)) (f64 (14813503047324538314))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  cs_Track_Plan_fun 2 (f64 (6982839593139931518)) (f64 (9942110216634267750)) (f64 (9375937920944743492))
  = [3; 1; 9942110216634267750; 9375937920944743492; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  cs_Track_Plan_fun 3 (f64 (10265660953715862966)) (f64 (13740285174984717284)) (f64 (1277184202317326917))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  cs_Track_Plan_fun 3 (f64 (6091059788018829955)) (f64 (1792297499199250252)) (f64 (5781961789574162812))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  cs_Track_Plan_fun 7 (f64 (13282996456290575158)) (f64 (17578167581534541463)) (f64 (985037191977373398))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  cs_Track_Plan_fun 4 (f64 (15029234546005951836)) (f64 (15603413512238416628)) (f64 (12097525513215185113))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  cs_Track_Plan_fun 42 (f64 (10763689034538414326)) (f64 (10559982926251779708)) (f64 (6070872676053614816))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  cs_Track_Plan_fun 4 (f64 (13883578550196377625)) (f64 (12896220282932114859)) (f64 (13065538014548372062))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  cs_Track_Plan_fun 1 (f64 (6025724095961253483)) (f64 (12343314764896876465)) (f64 (6050554639668977552))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  cs_Track_Plan_fun 2 (f64 (8301659293640652369)) (f64 (8361219956656104048)) (f64 (5830632811752458104))
  = [3; 1; 8361219956656104048; 5830632811752458104; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  cs_Track_Plan_fun 2 (f64 (11057653583824680460)) (f64 (1385221825609857303)) (f64 (9369230066744119893))
  = [3; 1; 1385221825609857303; 9369230066744119893; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  cs_Track_Plan_fun 1 (f64 (12486786149770530662)) (f64 (16562243407937006424)) (f64 (14554087966784339413))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  cs_Track_Plan_fun 3 (f64 (16953816120755715148)) (f64 (12920116904653963843)) (f64 (7340008617011835479))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  cs_Track_Plan_fun 42 (f64 (7036778148725352778)) (f64 (7907042056804708930)) (f64 (17676282142559775239))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  cs_Track_Plan_fun 3 (f64 (6551083083285261634)) (f64 (5408482843061229397)) (f64 (10269547512029900917))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  cs_Track_Plan_fun 3 (f64 (11567130426063553032)) (f64 (1998599162619543185)) (f64 (8562385201497390822))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  cs_Track_Plan_fun 3 (f64 (16642595954902616809)) (f64 (991567152449471252)) (f64 (7390635504643666273))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  cs_Track_Plan_fun 4294967295 (f64 (6447944482924901051)) (f64 (4266536603331507810)) (f64 (6853759747121598158))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  cs_Track_Plan_fun 4294967295 (f64 (13274697618227740161)) (f64 (6368093063521789068)) (f64 (14414742576695717806))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  cs_Track_Plan_fun 1 (f64 (384203287776175993)) (f64 (2249109350232541964)) (f64 (8120929550236501848))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  cs_Track_Plan_fun 2 (f64 (6809642283396648496)) (f64 (7150169734769564114)) (f64 (17197082661146543201))
  = [3; 1; 7150169734769564114; 17197082661146543201; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  cs_Track_Plan_fun 3 (f64 (11577638875423710661)) (f64 (11330817595046613643)) (f64 (469284208497256780))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  cs_Track_Plan_fun 4294967295 (f64 (4260516882074747460)) (f64 (13898962177722638426)) (f64 (3979650438260492354))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  cs_Track_Plan_fun 0 (f64 (10261665560744078290)) (f64 (981726471099094493)) (f64 (2448253016013406056))
  = [1; 1; 10261665560744078290; 981726471099094493; 2448253016013406056].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  cs_Track_Plan_fun 4294967295 (f64 (7037345491960641113)) (f64 (3295710241886589613)) (f64 (9365587514179153891))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  cs_Track_Plan_fun 42 (f64 (17196129167652781427)) (f64 (3682852179875389131)) (f64 (8852528791391841899))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  cs_Track_Plan_fun 4 (f64 (13886625620050574990)) (f64 (17601829926614826357)) (f64 (1567758037108147767))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  cs_Track_Plan_fun 2 (f64 (2678733536645670022)) (f64 (17067150439401693113)) (f64 (1941539786547800205))
  = [3; 1; 17067150439401693113; 1941539786547800205; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  cs_Track_Plan_fun 42 (f64 (8282855697780268784)) (f64 (18164797656717166020)) (f64 (2496324602602393686))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  cs_Track_Plan_fun 7 (f64 (7181906831606253978)) (f64 (15438655966378192933)) (f64 (5027857255479667583))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  cs_Track_Plan_fun 7 (f64 (2631822266458876195)) (f64 (7796780875221402235)) (f64 (6431411969158903816))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  cs_Track_Plan_fun 7 (f64 (5132555047013867064)) (f64 (2287118885672720183)) (f64 (10762535445160318933))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  cs_Track_Plan_fun 42 (f64 (16450001798838033679)) (f64 (7597624657803598258)) (f64 (8779984578999373191))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  cs_Track_Plan_fun 4 (f64 (18262532011401977256)) (f64 (16556155754290097905)) (f64 (3527586153732612068))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  cs_Track_Plan_fun 2 (f64 (341356069527430415)) (f64 (3608385057538273977)) (f64 (511913832120149945))
  = [3; 1; 3608385057538273977; 511913832120149945; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  cs_Track_Plan_fun 2 (f64 (14558257359870722027)) (f64 (1450679312202156817)) (f64 (16038077227498130875))
  = [3; 1; 1450679312202156817; 16038077227498130875; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  cs_Track_Plan_fun 42 (f64 (16365811803100483438)) (f64 (10363982157266233011)) (f64 (10909367159206720445))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  cs_Track_Plan_fun 7 (f64 (11814410670666385962)) (f64 (1417029549242562010)) (f64 (13660049632306479683))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  cs_Track_Plan_fun 42 (f64 (4553390470219839367)) (f64 (14909340100043024427)) (f64 (17507397283256033842))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  cs_Track_Plan_fun 0 (f64 (16255476277381314174)) (f64 (14157594767123364887)) (f64 (2331215838077024898))
  = [1; 1; 16255476277381314174; 14157594767123364887; 2331215838077024898].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  cs_Track_Plan_fun 1 (f64 (3540907735832528312)) (f64 (5437359992294572135)) (f64 (747184991655872755))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  cs_Track_Plan_fun 0 (f64 (14788312882694239360)) (f64 (4135085267667486268)) (f64 (2398847238048696910))
  = [1; 1; 14788312882694239360; 4135085267667486268; 2398847238048696910].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  cs_Track_Plan_fun 1 (f64 (3205327289659366007)) (f64 (8519664337978209620)) (f64 (212826796383813869))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  cs_Track_Plan_fun 2 (f64 (16201322449700520740)) (f64 (11050008607627740170)) (f64 (7809196668749826922))
  = [3; 1; 11050008607627740170; 7809196668749826922; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  cs_Track_Plan_fun 7 (f64 (5624913719956248892)) (f64 (3692006269009668307)) (f64 (15081006242209912791))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  cs_Track_Plan_fun 1 (f64 (13838798891364757479)) (f64 (12366153191106229560)) (f64 (7737863924454207660))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  cs_Track_Plan_fun 0 (f64 (8481430106175611966)) (f64 (13453385562140901973)) (f64 (18077418917518340555))
  = [1; 1; 8481430106175611966; 13453385562140901973; 18077418917518340555].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  cs_Track_Plan_fun 42 (f64 (17929224078847904413)) (f64 (8076853104039747722)) (f64 (17831818911308154480))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  cs_Track_Plan_fun 4 (f64 (11491807585082426321)) (f64 (3161136779673781827)) (f64 (15320584246863546146))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  cs_Track_Plan_fun 4 (f64 (8884547916862674030)) (f64 (2205225461600598605)) (f64 (14509162835991450238))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  cs_Track_Plan_fun 1 (f64 (12258333524335679488)) (f64 (669236971668158716)) (f64 (15079893835339643206))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  cs_Track_Plan_fun 1 (f64 (13405196457497120342)) (f64 (4659603090948264686)) (f64 (14903641508587646639))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  cs_Track_Plan_fun 42 (f64 (2018587742408144609)) (f64 (13315577485198430400)) (f64 (11539502143061833189))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  cs_Track_Plan_fun 1 (f64 (15507359016490725616)) (f64 (1991126689024238809)) (f64 (3112579721284926562))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  cs_Track_Plan_fun 2 (f64 (16587076877090886046)) (f64 (11160232299394321578)) (f64 (10630136850147451724))
  = [3; 1; 11160232299394321578; 10630136850147451724; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  cs_Track_Plan_fun 7 (f64 (13411398065008637478)) (f64 (2634844814628715958)) (f64 (7702314205977517243))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  cs_Track_Plan_fun 4 (f64 (7084421763563725336)) (f64 (14393578841908058872)) (f64 (7614686936139895111))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  cs_Track_Plan_fun 3 (f64 (15132498993545245898)) (f64 (4866412095372095345)) (f64 (15213111102174865036))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  cs_Track_Plan_fun 4294967295 (f64 (4447007340800887623)) (f64 (2840915281901304899)) (f64 (18283844376591429665))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  cs_Track_Plan_fun 0 (f64 (11458440672501335039)) (f64 (9920854728639515621)) (f64 (5421826334754707437))
  = [1; 1; 11458440672501335039; 9920854728639515621; 5421826334754707437].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  cs_Track_Plan_fun 4294967295 (f64 (2977152568452045152)) (f64 (7386273432348696862)) (f64 (7948883100612624549))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  cs_Track_Plan_fun 4 (f64 (17691781201520411148)) (f64 (9583417736923767085)) (f64 (4996996526176428529))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  cs_Track_Plan_fun 42 (f64 (11197184214726515151)) (f64 (14427041424929199577)) (f64 (8353901656791027332))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  cs_Track_Plan_fun 3 (f64 (8199657452440825959)) (f64 (5688041730612363941)) (f64 (17637215303816929450))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  cs_Track_Plan_fun 7 (f64 (11900761568883402989)) (f64 (7530208697496812038)) (f64 (17948363119192381650))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  cs_Track_Plan_fun 42 (f64 (3365719414796534657)) (f64 (703929552779766684)) (f64 (10874374432174613489))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  cs_Track_Plan_fun 42 (f64 (7041510072630497617)) (f64 (7986625018591173063)) (f64 (6911755719559145849))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  cs_Track_Plan_fun 1 (f64 (17840938525266566938)) (f64 (9736914905176571091)) (f64 (17126538785367044376))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  cs_Track_Plan_fun 42 (f64 (4844371911812593779)) (f64 (2711441035310675676)) (f64 (2431836691351512369))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  cs_Track_Plan_fun 7 (f64 (5194682056268778439)) (f64 (16073980347040974566)) (f64 (1283709302797145178))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  cs_Track_Plan_fun 7 (f64 (10867102702367458531)) (f64 (11708910103072873461)) (f64 (6726705882279854235))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  cs_Track_Plan_fun 2 (f64 (12303855831577859590)) (f64 (7576589283401358583)) (f64 (11530074611930455096))
  = [3; 1; 7576589283401358583; 11530074611930455096; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  cs_Track_Plan_fun 4294967295 (f64 (12302595379262235876)) (f64 (14621429694544285446)) (f64 (14515895891925621316))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  cs_Track_Plan_fun 1 (f64 (4393370536042196820)) (f64 (2485168803452903604)) (f64 (8116947843552427259))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  cs_Track_Plan_fun 1 (f64 (10877705821346370050)) (f64 (12472500788624968507)) (f64 (2758459297881154555))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  cs_Track_Plan_fun 2 (f64 (14373220602480848119)) (f64 (9760275456193207062)) (f64 (5282619653649842647))
  = [3; 1; 9760275456193207062; 5282619653649842647; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  cs_Track_Plan_fun 0 (f64 (12338859266896341335)) (f64 (4380642630365937512)) (f64 (10323930867221482667))
  = [1; 1; 12338859266896341335; 4380642630365937512; 10323930867221482667].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  cs_Track_Plan_fun 7 (f64 (5176941141135210723)) (f64 (9656729831186305693)) (f64 (2572169782870341660))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  cs_Track_Plan_fun 2 (f64 (15298307560586169066)) (f64 (7996959267415218416)) (f64 (15080787606326052096))
  = [3; 1; 7996959267415218416; 15080787606326052096; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  cs_Track_Plan_fun 7 (f64 (12024792340744043821)) (f64 (5304319332751768828)) (f64 (3377712491869979058))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  cs_Track_Plan_fun 42 (f64 (9746392869927514760)) (f64 (14202777346221387313)) (f64 (10230064215961088129))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  cs_Track_Plan_fun 42 (f64 (8269014056819755992)) (f64 (13505492651822225788)) (f64 (12127472065739723173))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  cs_Track_Plan_fun 1 (f64 (826246167772315499)) (f64 (12678946158987750946)) (f64 (11263421046042067569))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  cs_Track_Plan_fun 2 (f64 (9366157102957226094)) (f64 (12222454339793347276)) (f64 (1443654707903588434))
  = [3; 1; 12222454339793347276; 1443654707903588434; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  cs_Track_Plan_fun 2 (f64 (5156657194001140987)) (f64 (12794278656608982741)) (f64 (11440090650380197145))
  = [3; 1; 12794278656608982741; 11440090650380197145; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  cs_Track_Plan_fun 2 (f64 (3341294923169744786)) (f64 (17085805796455569768)) (f64 (1125641390759284478))
  = [3; 1; 17085805796455569768; 1125641390759284478; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  cs_Track_Plan_fun 4 (f64 (15078979423165504075)) (f64 (526975733792651729)) (f64 (9032395717919364975))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  cs_Track_Plan_fun 1 (f64 (7229212130065855240)) (f64 (10400145868297630332)) (f64 (15524135151205804370))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  cs_Track_Plan_fun 1 (f64 (17749306012876660772)) (f64 (434068979186436050)) (f64 (16135895851513470023))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  cs_Track_Plan_fun 1 (f64 (6983688769188314321)) (f64 (13007064370993333383)) (f64 (2905398687405949816))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  cs_Track_Plan_fun 4 (f64 (6189347365583945241)) (f64 (4169767751160129795)) (f64 (13003261237449682574))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  cs_Track_Plan_fun 42 (f64 (3004668925677241088)) (f64 (9366031550828835491)) (f64 (14392436904244409037))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  cs_Track_Plan_fun 1 (f64 (4953313310314585253)) (f64 (17941028446382358518)) (f64 (16995230759403684620))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  cs_Track_Plan_fun 7 (f64 (4898051396712735479)) (f64 (585071029608556451)) (f64 (2646757701685104079))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  cs_Track_Plan_fun 3 (f64 (16740380265249863529)) (f64 (9843844955183891430)) (f64 (8746737743077051305))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  cs_Track_Plan_fun 4 (f64 (17141755280196395703)) (f64 (5100639591592922993)) (f64 (13673123449513155979))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  cs_Track_Plan_fun 0 (f64 (12070285767839286069)) (f64 (13961043127747582829)) (f64 (146118444213306466))
  = [1; 1; 12070285767839286069; 13961043127747582829; 146118444213306466].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  cs_Track_Plan_fun 2 (f64 (9027486386424973388)) (f64 (6142746024894410692)) (f64 (15141797011167369518))
  = [3; 1; 6142746024894410692; 15141797011167369518; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  cs_Track_Plan_fun 3 (f64 (157619019866422350)) (f64 (16230930672436406816)) (f64 (14051739872120106482))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  cs_Track_Plan_fun 4294967295 (f64 (17080443432754753483)) (f64 (4097832461307334412)) (f64 (8948651011384597275))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  cs_Track_Plan_fun 0 (f64 (17235199734902790955)) (f64 (15960620523308261579)) (f64 (1068936666833864975))
  = [1; 1; 17235199734902790955; 15960620523308261579; 1068936666833864975].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  cs_Track_Plan_fun 4 (f64 (11841595582223635775)) (f64 (13759217059056422129)) (f64 (11801984560956656488))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  cs_Track_Plan_fun 4294967295 (f64 (6342777744028066953)) (f64 (747178817466686815)) (f64 (12156378978402567234))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  cs_Track_Plan_fun 1 (f64 (4018005271206188305)) (f64 (2992340602972826046)) (f64 (7812988788678461289))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  cs_Track_Plan_fun 0 (f64 (10039873826912891873)) (f64 (8920278077102254756)) (f64 (14809050817685668328))
  = [1; 1; 10039873826912891873; 8920278077102254756; 14809050817685668328].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  cs_Track_Plan_fun 7 (f64 (12065016502393871581)) (f64 (12446505822405263043)) (f64 (5323149300727560038))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  cs_Track_Plan_fun 42 (f64 (459639692483948858)) (f64 (7379400584092134913)) (f64 (6852139138168406102))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  cs_Track_Plan_fun 1 (f64 (16804573480580428704)) (f64 (10170809903407532233)) (f64 (7712511004829529166))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  cs_Track_Plan_fun 3 (f64 (15506714064050214105)) (f64 (3578889623113289318)) (f64 (1086560557457639543))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  cs_Track_Plan_fun 42 (f64 (823426709052037711)) (f64 (15592428439633517851)) (f64 (11128447965418182187))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  cs_Track_Plan_fun 2 (f64 (3765133493128411359)) (f64 (14962204458389216646)) (f64 (5300536709992511608))
  = [3; 1; 14962204458389216646; 5300536709992511608; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  cs_Track_Plan_fun 7 (f64 (1155959750761566499)) (f64 (18412145197427765088)) (f64 (13812263034929566918))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  cs_Track_Plan_fun 1 (f64 (5580005669885835311)) (f64 (16213916110060908254)) (f64 (12378661419743661659))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  cs_Track_Plan_fun 3 (f64 (1868741514447155678)) (f64 (6873017913890707474)) (f64 (2216055318189624124))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  cs_Track_Plan_fun 4 (f64 (5022004890266429166)) (f64 (17517971816567569793)) (f64 (12918210247942086664))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  cs_Track_Plan_fun 4294967295 (f64 (16588254277487252139)) (f64 (12066728738787103971)) (f64 (18134296509763719523))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  cs_Track_Plan_fun 4294967295 (f64 (1332154275880499046)) (f64 (2413877953736783358)) (f64 (9384165678387139884))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  cs_Track_Plan_fun 7 (f64 (4937756951001626200)) (f64 (17583095900756291729)) (f64 (6752106026631647499))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  cs_Track_Plan_fun 7 (f64 (13533051044328839001)) (f64 (4076469172363590740)) (f64 (5031214107004494168))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  cs_Track_Plan_fun 0 (f64 (9286688239817071200)) (f64 (15929204995669004899)) (f64 (13130896131479400742))
  = [1; 1; 9286688239817071200; 15929204995669004899; 13130896131479400742].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  cs_Track_Plan_fun 7 (f64 (16025586676688351313)) (f64 (2183341125062290707)) (f64 (1068051971936961489))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  cs_Track_Plan_fun 3 (f64 (1160384674039268105)) (f64 (544242251706517400)) (f64 (9193524734019283869))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  cs_Track_Plan_fun 4 (f64 (6921477986202399726)) (f64 (6184315922867177452)) (f64 (16845355977252663032))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  cs_Track_Plan_fun 4294967295 (f64 (1161515705229650639)) (f64 (3195062692884493917)) (f64 (7924590966145579071))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  cs_Track_Plan_fun 0 (f64 (10216478876359148007)) (f64 (7267044109612463255)) (f64 (16199257456156577169))
  = [1; 1; 10216478876359148007; 7267044109612463255; 16199257456156577169].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  cs_Track_Plan_fun 7 (f64 (10612397762786220213)) (f64 (3102620146199277549)) (f64 (7934679702196398751))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  cs_Track_Plan_fun 42 (f64 (6660881300729151141)) (f64 (11096559668236681862)) (f64 (6862973565029098917))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  cs_Track_Plan_fun 2 (f64 (4066437523972643825)) (f64 (3697624528827418584)) (f64 (17893727853532561901))
  = [3; 1; 3697624528827418584; 17893727853532561901; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  cs_Track_Plan_fun 7 (f64 (8946026654455454055)) (f64 (16644462979102620526)) (f64 (12010044581194630464))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  cs_Track_Plan_fun 4294967295 (f64 (2233750111380922021)) (f64 (5780955444960875100)) (f64 (13536378718421595293))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  cs_Track_Plan_fun 2 (f64 (12529872380294459651)) (f64 (12910328084045336175)) (f64 (17095376955472758850))
  = [3; 1; 12910328084045336175; 17095376955472758850; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  cs_Track_Plan_fun 7 (f64 (16900648605320152793)) (f64 (4215891033731816845)) (f64 (9153703230215501689))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  cs_Track_Plan_fun 1 (f64 (18305825223345744825)) (f64 (1253064850517459051)) (f64 (2452791738634009737))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  cs_Track_Plan_fun 3 (f64 (18148024039611060849)) (f64 (16126367343049755171)) (f64 (15842592662509202182))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  cs_Track_Plan_fun 0 (f64 (9254567676796608030)) (f64 (16196249694194334939)) (f64 (14327792435068412802))
  = [1; 1; 9254567676796608030; 16196249694194334939; 14327792435068412802].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  cs_Track_Plan_fun 4294967295 (f64 (12253336852468879781)) (f64 (9875715694456545408)) (f64 (15314148367821306613))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  cs_Track_Plan_fun 1 (f64 (1525878349151979947)) (f64 (11727311482594582051)) (f64 (7250604057093627226))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  cs_Track_Plan_fun 42 (f64 (10475078938335748068)) (f64 (14313780922378691369)) (f64 (9935643420155800447))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  cs_Track_Plan_fun 7 (f64 (13459220905966001009)) (f64 (7737309211787330329)) (f64 (8328123093843612124))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  cs_Track_Plan_fun 4 (f64 (18104252301907391353)) (f64 (13502600651834897278)) (f64 (3526017742100474654))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  cs_Track_Plan_fun 4 (f64 (8832289823500644020)) (f64 (13175149828852192775)) (f64 (5477411850436980885))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  cs_Track_Plan_fun 2 (f64 (5309039239340600071)) (f64 (6689941930706593175)) (f64 (14275548356901428435))
  = [3; 1; 6689941930706593175; 14275548356901428435; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  cs_Track_Plan_fun 4294967295 (f64 (17787010307841171097)) (f64 (3210537581025346006)) (f64 (4075022679099805859))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  cs_Track_Plan_fun 2 (f64 (15883644574648920931)) (f64 (3931064602587168729)) (f64 (10823214142477293994))
  = [3; 1; 3931064602587168729; 10823214142477293994; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  cs_Track_Plan_fun 4 (f64 (5991286998493015554)) (f64 (17121361176284882733)) (f64 (5022203222568869503))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  cs_Track_Plan_fun 3 (f64 (9919176940086610772)) (f64 (7615295643831103664)) (f64 (15173412387781221492))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  cs_Track_Plan_fun 4 (f64 (7062359798697385850)) (f64 (12898761084174331611)) (f64 (4238796604721289302))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  cs_Track_Plan_fun 3 (f64 (9312372631572245829)) (f64 (8212409060108017026)) (f64 (6981053415597373828))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  cs_Track_Plan_fun 1 (f64 (2283153620131011076)) (f64 (7628440079484455917)) (f64 (7792815562170360838))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  cs_Track_Plan_fun 7 (f64 (4194785525046899686)) (f64 (5961571106628846224)) (f64 (10062333740430442280))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  cs_Track_Plan_fun 2 (f64 (2300181308916768250)) (f64 (11375065204120026899)) (f64 (16559560251598228240))
  = [3; 1; 11375065204120026899; 16559560251598228240; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  cs_Track_Plan_fun 2 (f64 (16542091460276713655)) (f64 (12142740760970256876)) (f64 (3231615391628744330))
  = [3; 1; 12142740760970256876; 3231615391628744330; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  cs_Track_Plan_fun 42 (f64 (15582203071468899139)) (f64 (15161075260948438580)) (f64 (15671708649676394850))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  cs_Track_Plan_fun 4294967295 (f64 (3656669793240402106)) (f64 (10828207427585082381)) (f64 (7351176477901279992))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  cs_Track_Plan_fun 0 (f64 (4007037642694109016)) (f64 (17738630478229862369)) (f64 (10055108773367004228))
  = [1; 1; 4007037642694109016; 17738630478229862369; 10055108773367004228].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  cs_Track_Plan_fun 1 (f64 (4399442298188748017)) (f64 (10766065965763048227)) (f64 (18279997917934993804))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  cs_Track_Plan_fun 2 (f64 (10019624068669767172)) (f64 (7479625777267586530)) (f64 (2237767613377691704))
  = [3; 1; 7479625777267586530; 2237767613377691704; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  cs_Track_Plan_fun 4294967295 (f64 (3438256620256128103)) (f64 (999332675515874481)) (f64 (15371098955713193242))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  cs_Track_Plan_fun 0 (f64 (7894764894155994972)) (f64 (8002246564472995379)) (f64 (12759686910469975309))
  = [1; 1; 7894764894155994972; 8002246564472995379; 12759686910469975309].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  cs_Track_Plan_fun 3 (f64 (15404588138515030868)) (f64 (7113319312207194229)) (f64 (1528204188383213910))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  cs_Track_Plan_fun 1 (f64 (1816377525424287054)) (f64 (9428958790000876278)) (f64 (13935985400106090825))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  cs_Track_Plan_fun 4 (f64 (9068621890504285314)) (f64 (14481771736843552925)) (f64 (8452235702522018289))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  cs_Track_Plan_fun 1 (f64 (1953926623016224170)) (f64 (4897907362414951097)) (f64 (2301637768488386436))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  cs_Track_Plan_fun 7 (f64 (7445979536698135762)) (f64 (12232817549427637783)) (f64 (3332373508344352419))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  cs_Track_Plan_fun 0 (f64 (2970361780187578227)) (f64 (9078676405893708362)) (f64 (8724934052680939938))
  = [1; 1; 2970361780187578227; 9078676405893708362; 8724934052680939938].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  cs_Track_Plan_fun 1 (f64 (8178738905200115623)) (f64 (6127699074779127299)) (f64 (5047701722363266334))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  cs_Track_Plan_fun 0 (f64 (13246211217393745111)) (f64 (2254433196134566026)) (f64 (10657509604382816979))
  = [1; 1; 13246211217393745111; 2254433196134566026; 10657509604382816979].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  cs_Track_Plan_fun 4 (f64 (11343474863494642304)) (f64 (1233810382789506906)) (f64 (1237100304072150725))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  cs_Track_Plan_fun 2 (f64 (13020652427139703866)) (f64 (2634883023799381371)) (f64 (17813184452193675289))
  = [3; 1; 2634883023799381371; 17813184452193675289; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  cs_Track_Plan_fun 7 (f64 (17955599817603602881)) (f64 (5836078966346580327)) (f64 (14523568087006355078))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  cs_Track_Plan_fun 2 (f64 (13488680747242624894)) (f64 (4154077415037186653)) (f64 (10396257568219623876))
  = [3; 1; 4154077415037186653; 10396257568219623876; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  cs_Track_Plan_fun 3 (f64 (12826911368945740239)) (f64 (14543964556552597224)) (f64 (13581058245155474699))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  cs_Track_Plan_fun 7 (f64 (14142065604454337771)) (f64 (10150358598602981567)) (f64 (11094965589223955954))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  cs_Track_Plan_fun 1 (f64 (8570481975206754606)) (f64 (15619871980173090585)) (f64 (10802251914251035743))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  cs_Track_Plan_fun 42 (f64 (4942024804303833999)) (f64 (6098709731348246670)) (f64 (15128599088405916714))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  cs_Track_Plan_fun 42 (f64 (9924821941083040216)) (f64 (2984507559325585028)) (f64 (14145919098798893005))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  cs_Track_Plan_fun 4294967295 (f64 (7423463182640033188)) (f64 (2770722933441145273)) (f64 (13350850300982151589))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  cs_Track_Plan_fun 7 (f64 (12804275413759203305)) (f64 (5331640685405811)) (f64 (815411738279076052))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  cs_Track_Plan_fun 7 (f64 (4754985116164813115)) (f64 (12192289038045614804)) (f64 (13384927649062294963))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  cs_Track_Plan_fun 4 (f64 (3065365850526911381)) (f64 (9968240265247567695)) (f64 (3590477720350203155))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  cs_Track_Plan_fun 42 (f64 (10017350153026603725)) (f64 (6949657099344946747)) (f64 (4383971692670070690))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  cs_Track_Plan_fun 7 (f64 (13014415573761164444)) (f64 (3920943570261808940)) (f64 (10244628756215843953))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  cs_Track_Plan_fun 4294967295 (f64 (10784688873217403273)) (f64 (16506185742092679344)) (f64 (13088387611327933525))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  cs_Track_Plan_fun 4 (f64 (13043680407395135907)) (f64 (10470822040057533530)) (f64 (11288538631797369444))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  cs_Track_Plan_fun 0 (f64 (2137240863858686181)) (f64 (9831236869155352712)) (f64 (11141104580494386749))
  = [1; 1; 2137240863858686181; 9831236869155352712; 11141104580494386749].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  cs_Track_Plan_fun 42 (f64 (3864782888714763024)) (f64 (3343885079424219839)) (f64 (5883560147761842888))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  cs_Track_Plan_fun 0 (f64 (14606545235290989180)) (f64 (1486690774629490236)) (f64 (7419927396960949542))
  = [1; 1; 14606545235290989180; 1486690774629490236; 7419927396960949542].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  cs_Track_Plan_fun 3 (f64 (5709090268193544787)) (f64 (13690909540586325182)) (f64 (4734458189428951864))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  cs_Track_Plan_fun 4 (f64 (7204633896078864394)) (f64 (9493087250975643955)) (f64 (8256572987841780129))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  cs_Track_Plan_fun 1 (f64 (4653449580565027728)) (f64 (442559974656318795)) (f64 (9932460025782416636))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  cs_Track_Plan_fun 1 (f64 (4299842179768020848)) (f64 (997403489470544015)) (f64 (2855867980585360870))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  cs_Track_Plan_fun 7 (f64 (14436325316631522700)) (f64 (3074111291290360969)) (f64 (17102506141963001371))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  cs_Track_Plan_fun 4294967295 (f64 (17885601423627735313)) (f64 (12041339890187632818)) (f64 (1060333930666850203))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  cs_Track_Plan_fun 1 (f64 (5520699739738901382)) (f64 (9850327105938421339)) (f64 (11217417778134241586))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  cs_Track_Plan_fun 4 (f64 (5583032345709271587)) (f64 (13052448077304427484)) (f64 (3782735940953534402))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  cs_Track_Plan_fun 3 (f64 (13370326892692002808)) (f64 (11966928604497369026)) (f64 (4452153623416736570))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  cs_Track_Plan_fun 1 (f64 (11167340603527261504)) (f64 (3551432794494886996)) (f64 (8120773172693579942))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  cs_Track_Plan_fun 4294967295 (f64 (9374358995477700602)) (f64 (3797651278380495135)) (f64 (874302208956636563))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  cs_Track_Plan_fun 4294967295 (f64 (3305660708461746156)) (f64 (11613338148114756034)) (f64 (17448834746444413201))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  cs_Track_Plan_fun 2 (f64 (3618570096997339504)) (f64 (4799559442775644096)) (f64 (17941102317249566520))
  = [3; 1; 4799559442775644096; 17941102317249566520; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  cs_Track_Plan_fun 1 (f64 (943114193331018349)) (f64 (15111102513672131969)) (f64 (10702344322921043573))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  cs_Track_Plan_fun 0 (f64 (6169867446324918147)) (f64 (18003150493150135681)) (f64 (11993502878712362735))
  = [1; 1; 6169867446324918147; 18003150493150135681; 11993502878712362735].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  cs_Track_Plan_fun 3 (f64 (17447209933663545533)) (f64 (3321911410647760288)) (f64 (5211894703904782927))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  cs_Track_Plan_fun 2 (f64 (7738403915247051173)) (f64 (14772507751289919174)) (f64 (3774874569799725830))
  = [3; 1; 14772507751289919174; 3774874569799725830; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  cs_Track_Plan_fun 42 (f64 (3943162457742947943)) (f64 (15868696421246336021)) (f64 (17669832415575473674))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  cs_Track_Plan_fun 4 (f64 (5469898505578538584)) (f64 (14082310421539106075)) (f64 (15367225354520079155))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  cs_Track_Plan_fun 7 (f64 (3858242045177876539)) (f64 (18210490101513295570)) (f64 (16561361473153671757))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  cs_Track_Plan_fun 7 (f64 (6687524511547516036)) (f64 (17380566143109095677)) (f64 (2909599398348015372))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  cs_Track_Plan_fun 42 (f64 (16731792817245995307)) (f64 (8343448996042704956)) (f64 (16892796960778541233))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  cs_Track_Plan_fun 0 (f64 (11008127963673197170)) (f64 (14973322361591048014)) (f64 (10035685015029625803))
  = [1; 1; 11008127963673197170; 14973322361591048014; 10035685015029625803].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  cs_Track_Plan_fun 2 (f64 (17915744596351709766)) (f64 (7732373419018347515)) (f64 (10158941074432360734))
  = [3; 1; 7732373419018347515; 10158941074432360734; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  cs_Track_Plan_fun 7 (f64 (2292621527896979194)) (f64 (14519150854614143314)) (f64 (10345357455126020167))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  cs_Track_Plan_fun 7 (f64 (2851914214089700339)) (f64 (1244957507480616962)) (f64 (11759952084039846337))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  cs_Track_Plan_fun 1 (f64 (12797613695809143580)) (f64 (13866799409000043258)) (f64 (6368343547037934018))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  cs_Track_Plan_fun 7 (f64 (9613171214350207880)) (f64 (3457215143123279127)) (f64 (7935942133041839694))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  cs_Track_Plan_fun 7 (f64 (4557967765569929957)) (f64 (3169525003559055287)) (f64 (11049947802291308167))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  cs_Track_Plan_fun 3 (f64 (8875139121537792019)) (f64 (12740751079275899593)) (f64 (10336106100436856273))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  cs_Track_Plan_fun 3 (f64 (13880657828294858012)) (f64 (12158182968702240831)) (f64 (17663710907928651597))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  cs_Track_Plan_fun 0 (f64 (12474896061678399075)) (f64 (10561674027466004211)) (f64 (15386174730398989222))
  = [1; 1; 12474896061678399075; 10561674027466004211; 15386174730398989222].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  cs_Track_Plan_fun 1 (f64 (2378393114415898618)) (f64 (16825177622331258534)) (f64 (5653928178843586671))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  cs_Track_Plan_fun 0 (f64 (13906367835937467625)) (f64 (7466235238321227440)) (f64 (11296111120837868841))
  = [1; 1; 13906367835937467625; 7466235238321227440; 11296111120837868841].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  cs_Track_Plan_fun 0 (f64 (1437358185111431162)) (f64 (8032435955079306122)) (f64 (2587213447551496044))
  = [1; 1; 1437358185111431162; 8032435955079306122; 2587213447551496044].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  cs_Track_Plan_fun 4294967295 (f64 (18380952413956605133)) (f64 (4105375393439006328)) (f64 (10258067552355844518))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  cs_Track_Plan_fun 1 (f64 (16240535161553159038)) (f64 (16511732938535969191)) (f64 (16604120001215300398))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  cs_Track_Plan_fun 0 (f64 (18139505026064276086)) (f64 (17563408834905769965)) (f64 (13699001242749170681))
  = [1; 1; 18139505026064276086; 17563408834905769965; 13699001242749170681].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  cs_Track_Plan_fun 2 (f64 (372093097094414067)) (f64 (16789428213590357603)) (f64 (10559136218900843144))
  = [3; 1; 16789428213590357603; 10559136218900843144; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  cs_Track_Plan_fun 3 (f64 (2518959408709775286)) (f64 (17162275949804182263)) (f64 (10634037259950500341))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  cs_Track_Plan_fun 4294967295 (f64 (12592521887517309185)) (f64 (15179961639730365711)) (f64 (17785093457896028869))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  cs_Track_Plan_fun 7 (f64 (17931541801668768072)) (f64 (15240438283465587589)) (f64 (2437422140696396345))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  cs_Track_Plan_fun 0 (f64 (9487368109801560630)) (f64 (9571718693899679711)) (f64 (12333045389682116206))
  = [1; 1; 9487368109801560630; 9571718693899679711; 12333045389682116206].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  cs_Track_Plan_fun 1 (f64 (16649607018168853839)) (f64 (6824029567718015853)) (f64 (18273684910716409790))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  cs_Track_Plan_fun 1 (f64 (13102314842053380857)) (f64 (2248676376076119412)) (f64 (5999973008763556817))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  cs_Track_Plan_fun 4 (f64 (11824675029067647157)) (f64 (15549785030528507176)) (f64 (9266781932993032588))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  cs_Track_Plan_fun 4294967295 (f64 (16299270580513417830)) (f64 (1844178463753432645)) (f64 (15128061412762464497))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  cs_Track_Plan_fun 3 (f64 (1483466577799192389)) (f64 (18224041554583471226)) (f64 (9915634988784123122))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  cs_Track_Plan_fun 4 (f64 (7425010946830225827)) (f64 (17343487479252362052)) (f64 (4337139970974688783))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  cs_Track_Plan_fun 0 (f64 (17752338606245532595)) (f64 (5075390528443869455)) (f64 (17278799507630722841))
  = [1; 1; 17752338606245532595; 5075390528443869455; 17278799507630722841].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  cs_Track_Plan_fun 42 (f64 (11686760197444446103)) (f64 (17622215290856813063)) (f64 (10562881094031969490))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  cs_Track_Plan_fun 4 (f64 (3247371976908031931)) (f64 (3778512943648435699)) (f64 (1394991249853907544))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  cs_Track_Plan_fun 0 (f64 (4834004124155747613)) (f64 (2129527041274359679)) (f64 (6279550262550191846))
  = [1; 1; 4834004124155747613; 2129527041274359679; 6279550262550191846].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  cs_Track_Plan_fun 4294967295 (f64 (1094578878462563821)) (f64 (15572830178646456642)) (f64 (5338433611390367458))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  cs_Track_Plan_fun 7 (f64 (6661845256810584685)) (f64 (1487173707615192084)) (f64 (6454113965490275013))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  cs_Track_Plan_fun 4 (f64 (459655653598685910)) (f64 (8722402820549476581)) (f64 (5097714315159473927))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  cs_Track_Plan_fun 42 (f64 (4461717746758385200)) (f64 (7479361276467570014)) (f64 (12151527036570530275))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  cs_Track_Plan_fun 1 (f64 (13715665325977318124)) (f64 (16990334300738247745)) (f64 (1154846736224465409))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  cs_Track_Plan_fun 42 (f64 (14314985255010130153)) (f64 (15187149000005382773)) (f64 (438186848094021357))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  cs_Track_Plan_fun 0 (f64 (4319211259949845680)) (f64 (10613931596853590236)) (f64 (8492625047262413909))
  = [1; 1; 4319211259949845680; 10613931596853590236; 8492625047262413909].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  cs_Track_Plan_fun 7 (f64 (9779526893475963435)) (f64 (4106765703230513779)) (f64 (3576546653381815005))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  cs_Track_Plan_fun 3 (f64 (10099678241120063033)) (f64 (10785977094540158211)) (f64 (10910834111619874310))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  cs_Track_Plan_fun 4 (f64 (14134101182054916072)) (f64 (1228807477686067601)) (f64 (4247254876694681212))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  cs_Track_Plan_fun 3 (f64 (5055443960141168157)) (f64 (229413650692020315)) (f64 (3034041151498411803))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  cs_Track_Plan_fun 0 (f64 (4461589178881637580)) (f64 (5223650354885186978)) (f64 (6193034866265744080))
  = [1; 1; 4461589178881637580; 5223650354885186978; 6193034866265744080].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  cs_Track_Plan_fun 42 (f64 (15770859174518504551)) (f64 (12630725440145233580)) (f64 (14817945840061204783))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  cs_Track_Plan_fun 1 (f64 (10638408698754714935)) (f64 (1577992218130624128)) (f64 (733626794651498459))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  cs_Track_Plan_fun 1 (f64 (2510861664191246306)) (f64 (4079440926232955097)) (f64 (4020167018486793714))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  cs_Track_Plan_fun 2 (f64 (2232129205826564800)) (f64 (12809859891273067980)) (f64 (1027644311478437769))
  = [3; 1; 12809859891273067980; 1027644311478437769; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  cs_Track_Plan_fun 4294967295 (f64 (7084299475027954792)) (f64 (17728364895851517234)) (f64 (10817248369651420384))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  cs_Track_Plan_fun 1 (f64 (14011705168104976036)) (f64 (2541927847095857787)) (f64 (224142874760975888))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  cs_Track_Plan_fun 0 (f64 (16848950894394839821)) (f64 (16962286167512173518)) (f64 (7826468162784285454))
  = [1; 1; 16848950894394839821; 16962286167512173518; 7826468162784285454].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  cs_Track_Plan_fun 1 (f64 (16700116476803077114)) (f64 (3165785589746500149)) (f64 (10241901570057168777))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  cs_Track_Plan_fun 0 (f64 (2616563465935183787)) (f64 (10030105066069726095)) (f64 (11209739530932211784))
  = [1; 1; 2616563465935183787; 10030105066069726095; 11209739530932211784].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  cs_Track_Plan_fun 0 (f64 (1875645963586895235)) (f64 (12491518753163000140)) (f64 (3179215879020866718))
  = [1; 1; 1875645963586895235; 12491518753163000140; 3179215879020866718].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  cs_Track_Plan_fun 4294967295 (f64 (9324042957659602724)) (f64 (8511084378864461597)) (f64 (9157425108747768143))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  cs_Track_Plan_fun 0 (f64 (13312311323278683165)) (f64 (16263412221134451808)) (f64 (3156990568108196137))
  = [1; 1; 13312311323278683165; 16263412221134451808; 3156990568108196137].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  cs_Track_Plan_fun 4294967295 (f64 (2969810140276478315)) (f64 (14617440241916801907)) (f64 (17532196770687854372))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  cs_Track_Plan_fun 4294967295 (f64 (157167672026970837)) (f64 (7017353621423617912)) (f64 (4916367477211480077))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  cs_Track_Plan_fun 4294967295 (f64 (12892847752235213056)) (f64 (16401712696722279544)) (f64 (1450846239539057354))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  cs_Track_Plan_fun 4294967295 (f64 (9809605450221872399)) (f64 (1534158741401478611)) (f64 (6245983533432840169))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  cs_Track_Plan_fun 42 (f64 (6740280506429126712)) (f64 (10897169086261461712)) (f64 (6922733154995032121))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  cs_Track_Plan_fun 0 (f64 (18132357196480352276)) (f64 (14165976719030303128)) (f64 (11634612498037378305))
  = [1; 1; 18132357196480352276; 14165976719030303128; 11634612498037378305].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  cs_Track_Plan_fun 0 (f64 (2231019774175800894)) (f64 (4882629881642665240)) (f64 (5563805579323655821))
  = [1; 1; 2231019774175800894; 4882629881642665240; 5563805579323655821].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  cs_Track_Plan_fun 4 (f64 (11349674788421623539)) (f64 (5717179330053124119)) (f64 (3546315287571139769))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  cs_Track_Plan_fun 42 (f64 (3601801064937496401)) (f64 (1238491038232155434)) (f64 (15929423691888176286))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  cs_Track_Plan_fun 2 (f64 (16544192076266216220)) (f64 (12783664482881647868)) (f64 (10404461751715785784))
  = [3; 1; 12783664482881647868; 10404461751715785784; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  cs_Track_Plan_fun 2 (f64 (13451476264667416248)) (f64 (8169491948212394649)) (f64 (13389148039418754427))
  = [3; 1; 8169491948212394649; 13389148039418754427; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  cs_Track_Plan_fun 3 (f64 (15248876641509667702)) (f64 (7448396666542475612)) (f64 (16159865785479222253))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  cs_Track_Plan_fun 4294967295 (f64 (10549967544825970767)) (f64 (15765994968163166434)) (f64 (6011062552864461861))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  cs_Track_Plan_fun 42 (f64 (6140027643772407178)) (f64 (7118467431373110116)) (f64 (9740054508476832637))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  cs_Track_Plan_fun 0 (f64 (85815993238486051)) (f64 (1470722311518947586)) (f64 (2931623935766390438))
  = [1; 1; 85815993238486051; 1470722311518947586; 2931623935766390438].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  cs_Track_Plan_fun 3 (f64 (3818415991816728520)) (f64 (13906610809256007956)) (f64 (1131073932563077951))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  cs_Track_Plan_fun 1 (f64 (11396531345070529350)) (f64 (6787500272426679846)) (f64 (847479409069673278))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  cs_Track_Plan_fun 2 (f64 (1465197081774129846)) (f64 (4195904575511979967)) (f64 (4903000624306988192))
  = [3; 1; 4195904575511979967; 4903000624306988192; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  cs_Track_Plan_fun 4 (f64 (6882375499134336183)) (f64 (12783638494824204664)) (f64 (13557908720875827856))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  cs_Track_Plan_fun 1 (f64 (17476207886127835296)) (f64 (9487005949238199797)) (f64 (15956197393410595697))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  cs_Track_Plan_fun 2 (f64 (9534554676621428095)) (f64 (17840649532651516708)) (f64 (8472588945498826289))
  = [3; 1; 17840649532651516708; 8472588945498826289; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  cs_Track_Plan_fun 3 (f64 (5404361889731407873)) (f64 (16583722292770331982)) (f64 (29116532841008471))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  cs_Track_Plan_fun 3 (f64 (11931392823299059488)) (f64 (6832667296756413155)) (f64 (1051345302223776294))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  cs_Track_Plan_fun 4 (f64 (11056685553314594181)) (f64 (3564638619911442261)) (f64 (2626442709737488591))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  cs_Track_Plan_fun 42 (f64 (7817113677750106323)) (f64 (7167043300076581712)) (f64 (9273721942052600812))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  cs_Track_Plan_fun 3 (f64 (9557699392532807304)) (f64 (4177379322370644429)) (f64 (399643268288343341))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  cs_Track_Plan_fun 4294967295 (f64 (10620844234795505228)) (f64 (16477257432357832872)) (f64 (11328097317496204659))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  cs_Track_Plan_fun 3 (f64 (18129068064943441458)) (f64 (11376755513166182192)) (f64 (197556031166536920))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  cs_Track_Plan_fun 4294967295 (f64 (9732071338450520049)) (f64 (3729468009801171404)) (f64 (14334469844683810562))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  cs_Track_Plan_fun 3 (f64 (1872145041087900354)) (f64 (16943726218255032887)) (f64 (15838214400645799429))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  cs_Track_Plan_fun 3 (f64 (6612213455530693865)) (f64 (5668806186386320306)) (f64 (17063323464735162589))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  cs_Track_Plan_fun 2 (f64 (7593797103065934213)) (f64 (6679603220600809950)) (f64 (6190522988912401945))
  = [3; 1; 6679603220600809950; 6190522988912401945; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  cs_Track_Plan_fun 0 (f64 (8675856234376079257)) (f64 (4942804122060004800)) (f64 (9748927504706453036))
  = [1; 1; 8675856234376079257; 4942804122060004800; 9748927504706453036].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  cs_Track_Plan_fun 3 (f64 (4225291376705918110)) (f64 (1740948242166291257)) (f64 (10098345159434048406))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  cs_Track_Plan_fun 42 (f64 (9462265106702486674)) (f64 (786787379419949109)) (f64 (12283900265205199386))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  cs_Track_Plan_fun 3 (f64 (11998108130568601011)) (f64 (3293074260340152614)) (f64 (12478325438177414141))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  cs_Track_Plan_fun 0 (f64 (14618791375573506328)) (f64 (9593161335205380101)) (f64 (5344727488393048094))
  = [1; 1; 14618791375573506328; 9593161335205380101; 5344727488393048094].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  cs_Track_Plan_fun 4 (f64 (16346540954374345276)) (f64 (13746087769768244752)) (f64 (14494181690263404566))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  cs_Track_Plan_fun 3 (f64 (16556689212134501272)) (f64 (16695914567251402872)) (f64 (5952442929563833365))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  cs_Track_Plan_fun 42 (f64 (14603837116472183965)) (f64 (12996690023660746916)) (f64 (6360927744882302729))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  cs_Track_Plan_fun 4 (f64 (7577896377625133444)) (f64 (8142088835974803704)) (f64 (11184357825573661641))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  cs_Track_Plan_fun 4 (f64 (4463580666396155175)) (f64 (1516733852220335073)) (f64 (17784316225032033689))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  cs_Track_Plan_fun 4 (f64 (14997904954708229506)) (f64 (6018126290695251436)) (f64 (12637391426210474023))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  cs_Track_Plan_fun 42 (f64 (7303590370332530065)) (f64 (13764103674199571110)) (f64 (7374826149052470528))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  cs_Track_Plan_fun 3 (f64 (16964038877411069090)) (f64 (15393059121138732351)) (f64 (14421403822142700594))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  cs_Track_Plan_fun 42 (f64 (10443426068993641304)) (f64 (4619560345643506885)) (f64 (8825762188970076301))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  cs_Track_Plan_fun 4294967295 (f64 (13778976231393125340)) (f64 (13218586503763397723)) (f64 (1966180034041491048))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  cs_Track_Plan_fun 7 (f64 (10830017216385316618)) (f64 (13251230441263366545)) (f64 (3712568266253915117))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  cs_Track_Plan_fun 2 (f64 (18117066846052698986)) (f64 (3548124562675389903)) (f64 (15717147433638952560))
  = [3; 1; 3548124562675389903; 15717147433638952560; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  cs_Track_Plan_fun 4 (f64 (6486618329037338699)) (f64 (3446816295620084294)) (f64 (8414266087496962281))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  cs_Track_Plan_fun 1 (f64 (9845032524036383553)) (f64 (16823706548705741577)) (f64 (15370660872510397305))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  cs_Track_Plan_fun 2 (f64 (11771632084175844609)) (f64 (1609839638323161383)) (f64 (12014096855317293865))
  = [3; 1; 1609839638323161383; 12014096855317293865; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  cs_Track_Plan_fun 4 (f64 (9606403763985841052)) (f64 (1279374392276771827)) (f64 (14249766800085467791))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  cs_Track_Plan_fun 4 (f64 (13482395978102051579)) (f64 (1429820466860087945)) (f64 (3095737097176644777))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  cs_Track_Plan_fun 42 (f64 (9533722526688468322)) (f64 (8467573076543163389)) (f64 (10500436154013814841))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  cs_Track_Plan_fun 4294967295 (f64 (13210405556551236405)) (f64 (8038166869840113324)) (f64 (1054339552328483520))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  cs_Track_Plan_fun 42 (f64 (3731586976552674403)) (f64 (12415436568883842662)) (f64 (3734492378249118511))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  cs_Track_Plan_fun 0 (f64 (9341515456885844629)) (f64 (17246115091831675669)) (f64 (16895788139445797169))
  = [1; 1; 9341515456885844629; 17246115091831675669; 16895788139445797169].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  cs_Track_Plan_fun 42 (f64 (7384192517098934203)) (f64 (12379061197904606550)) (f64 (2533233444938768778))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  cs_Track_Plan_fun 4 (f64 (15800669798187384175)) (f64 (15335258297935486866)) (f64 (1713664688995410508))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  cs_Track_Plan_fun 3 (f64 (17552866466428183176)) (f64 (15801189111062447214)) (f64 (1912855627875687615))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  cs_Track_Plan_fun 0 (f64 (10373853861418157340)) (f64 (1794441695876251999)) (f64 (14391111773767697797))
  = [1; 1; 10373853861418157340; 1794441695876251999; 14391111773767697797].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  cs_Track_Plan_fun 1 (f64 (15006213942619520408)) (f64 (7078611046097421191)) (f64 (2779374920855415755))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  cs_Track_Plan_fun 3 (f64 (2338160037950360812)) (f64 (10840687466180638600)) (f64 (1052930362010381555))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  cs_Track_Plan_fun 4 (f64 (9125424124649727404)) (f64 (15528128580574902822)) (f64 (15555419063164748090))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  cs_Track_Plan_fun 3 (f64 (15088667155405946761)) (f64 (1783891405175797331)) (f64 (3397783143569196710))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  cs_Track_Plan_fun 42 (f64 (462163912285847736)) (f64 (756658927209224089)) (f64 (17118808572709443882))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  cs_Track_Plan_fun 7 (f64 (16363392803492345187)) (f64 (2471892770722976212)) (f64 (5696001077727789125))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  cs_Track_Plan_fun 4294967295 (f64 (18439191549369237538)) (f64 (17267419701473063538)) (f64 (10594291019105796319))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  cs_Track_Plan_fun 1 (f64 (7983863273194628480)) (f64 (3417812609669939838)) (f64 (10015471810090896689))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  cs_Track_Plan_fun 7 (f64 (6505702667771072589)) (f64 (12009003030963786820)) (f64 (766350315363942743))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  cs_Track_Plan_fun 4294967295 (f64 (15927524662149206435)) (f64 (16902572829906769396)) (f64 (14742843456450854030))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  cs_Track_Plan_fun 2 (f64 (12914452695379129117)) (f64 (14892643154318569086)) (f64 (9121198400625203132))
  = [3; 1; 14892643154318569086; 9121198400625203132; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  cs_Track_Plan_fun 4 (f64 (7489358564578638461)) (f64 (8252577024406141947)) (f64 (8641399881995344788))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  cs_Track_Plan_fun 0 (f64 (3451289748880300560)) (f64 (12928178230859508590)) (f64 (5181377598982371854))
  = [1; 1; 3451289748880300560; 12928178230859508590; 5181377598982371854].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  cs_Track_Plan_fun 0 (f64 (10237906588832047381)) (f64 (12951518972481916873)) (f64 (14650153650600486294))
  = [1; 1; 10237906588832047381; 12951518972481916873; 14650153650600486294].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  cs_Track_Plan_fun 4294967295 (f64 (18203926726635392466)) (f64 (18035556416554903676)) (f64 (2601620397432126083))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  cs_Track_Plan_fun 7 (f64 (7705451319587067044)) (f64 (10913893879228147877)) (f64 (14758524658857963871))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  cs_Track_Plan_fun 2 (f64 (7487564106887224265)) (f64 (8759672735558135981)) (f64 (16469288956737164221))
  = [3; 1; 8759672735558135981; 16469288956737164221; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  cs_Track_Plan_fun 4 (f64 (552174732789290312)) (f64 (9490282999181978143)) (f64 (212520874308206545))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  cs_Track_Plan_fun 1 (f64 (995057014210199461)) (f64 (7114511036663196899)) (f64 (11329875254536730810))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  cs_Track_Plan_fun 2 (f64 (5359470409494426034)) (f64 (1247218221027283578)) (f64 (5118453442359702152))
  = [3; 1; 1247218221027283578; 5118453442359702152; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  cs_Track_Plan_fun 4 (f64 (15416872456555425435)) (f64 (12736796786763726622)) (f64 (554503737361904125))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  cs_Track_Plan_fun 2 (f64 (8509298268825587284)) (f64 (16216651881282629055)) (f64 (6612821402727626844))
  = [3; 1; 16216651881282629055; 6612821402727626844; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  cs_Track_Plan_fun 1 (f64 (17501796294031183625)) (f64 (2318647454444235269)) (f64 (6754204593869321108))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  cs_Track_Plan_fun 7 (f64 (6725468710018174205)) (f64 (7544630091873763803)) (f64 (14932914914704894839))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  cs_Track_Plan_fun 3 (f64 (6001912141169527567)) (f64 (18392236644318015743)) (f64 (5167510508242058775))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  cs_Track_Plan_fun 1 (f64 (2377891382295157627)) (f64 (2330341925606207579)) (f64 (5301343215084532318))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  cs_Track_Plan_fun 7 (f64 (12960826273829281934)) (f64 (1627677360210238687)) (f64 (1942188194092741792))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  cs_Track_Plan_fun 1 (f64 (6055270216122444547)) (f64 (883554052067763618)) (f64 (5054304930876638854))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  cs_Track_Plan_fun 4 (f64 (13360757810537279805)) (f64 (2079933155128890586)) (f64 (8360075419112774435))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  cs_Track_Plan_fun 42 (f64 (4567753002622357139)) (f64 (9590559152943032615)) (f64 (13791187390695191903))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  cs_Track_Plan_fun 4 (f64 (6117726923964192086)) (f64 (3358342824009555602)) (f64 (3902795255783199379))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  cs_Track_Plan_fun 4 (f64 (11615520160703337210)) (f64 (7062124724056054161)) (f64 (7122778466420347033))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  cs_Track_Plan_fun 2 (f64 (12286249043145638173)) (f64 (14075268570607936314)) (f64 (15507179356009373689))
  = [3; 1; 14075268570607936314; 15507179356009373689; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  cs_Track_Plan_fun 42 (f64 (6283331092016584654)) (f64 (6265987696839825838)) (f64 (7432477740552077052))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  cs_Track_Plan_fun 4294967295 (f64 (12344717518786401541)) (f64 (12738914155084883269)) (f64 (13834339775994802334))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  cs_Track_Plan_fun 4 (f64 (11878702026244302771)) (f64 (141689876419090292)) (f64 (11612813134402073732))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  cs_Track_Plan_fun 42 (f64 (13653129940972776178)) (f64 (16297072487317120478)) (f64 (9404861725671158346))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  cs_Track_Plan_fun 42 (f64 (3928479908777491393)) (f64 (15178149272580227662)) (f64 (14814268951324070386))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  cs_Track_Plan_fun 4294967295 (f64 (15406780043502328752)) (f64 (6915421269055660532)) (f64 (5128554167292814752))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  cs_Track_Plan_fun 4294967295 (f64 (14802912841518189440)) (f64 (8423022071094653072)) (f64 (5566553013007121850))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  cs_Track_Plan_fun 3 (f64 (17869334340687799342)) (f64 (8712362984723589827)) (f64 (5056854830722600133))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  cs_Track_Plan_fun 1 (f64 (5822634205687088236)) (f64 (14076161526542707393)) (f64 (15532004622244511839))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  cs_Track_Plan_fun 4294967295 (f64 (12780801777184608929)) (f64 (11812022672959986715)) (f64 (9087516394876829687))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  cs_Track_Plan_fun 4 (f64 (2464777313700206789)) (f64 (4407701346012014078)) (f64 (7309198655251693112))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  cs_Track_Plan_fun 0 (f64 (731152326673889582)) (f64 (16438348384564628328)) (f64 (17492507400560227188))
  = [1; 1; 731152326673889582; 16438348384564628328; 17492507400560227188].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  cs_Track_Plan_fun 42 (f64 (2863212594625375292)) (f64 (11264617860106933554)) (f64 (6576037713982432399))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  cs_Track_Plan_fun 4 (f64 (6279693020737035973)) (f64 (1415580923116383835)) (f64 (12242678360199258861))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  cs_Track_Plan_fun 4294967295 (f64 (8661651801698961735)) (f64 (375474648887828745)) (f64 (18437720958812540386))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  cs_Track_Plan_fun 1 (f64 (5111188467787405676)) (f64 (8840006178464311029)) (f64 (14371838920896463205))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  cs_Track_Plan_fun 2 (f64 (4401379785686852680)) (f64 (1049002120902464830)) (f64 (17732403367037755101))
  = [3; 1; 1049002120902464830; 17732403367037755101; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  cs_Track_Plan_fun 0 (f64 (832860128413148079)) (f64 (6007655800560975939)) (f64 (7915813936115943718))
  = [1; 1; 832860128413148079; 6007655800560975939; 7915813936115943718].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  cs_Track_Plan_fun 3 (f64 (14426242929122941702)) (f64 (14010022219678844133)) (f64 (16926039210599824522))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  cs_Track_Plan_fun 4 (f64 (392847207781094078)) (f64 (9272258316858184331)) (f64 (8955442597520773165))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  cs_Track_Plan_fun 7 (f64 (5604322236713191826)) (f64 (566677566462401623)) (f64 (13001915367041061681))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  cs_Track_Plan_fun 4 (f64 (14859641330867587626)) (f64 (3307288568675768580)) (f64 (14782073145164004948))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  cs_Track_Plan_fun 42 (f64 (5594752697149890783)) (f64 (15548958776877464344)) (f64 (5997439853421382441))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  cs_Track_Plan_fun 3 (f64 (15381946155527061665)) (f64 (246581841827627976)) (f64 (10307000611708626615))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  cs_Track_Plan_fun 42 (f64 (5533563455504518852)) (f64 (8438634764446783818)) (f64 (13391194664759974679))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  cs_Track_Plan_fun 4294967295 (f64 (1325730667271330774)) (f64 (9615845027504893005)) (f64 (6066233641008697502))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  cs_Track_Plan_fun 4 (f64 (3856609725221682827)) (f64 (5229875724380745865)) (f64 (18404212723593875734))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  cs_Track_Plan_fun 7 (f64 (1616080909814758809)) (f64 (6096941364721108151)) (f64 (12693247983291596902))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  cs_Track_Plan_fun 0 (f64 (10369099451205303265)) (f64 (11379232556358259623)) (f64 (17065564815500104337))
  = [1; 1; 10369099451205303265; 11379232556358259623; 17065564815500104337].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  cs_Track_Plan_fun 1 (f64 (7636201071527756955)) (f64 (16310109293931013118)) (f64 (379751962131879222))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  cs_Track_Plan_fun 3 (f64 (4506937447255576762)) (f64 (12128456519581370686)) (f64 (11745198434226001228))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  cs_Track_Plan_fun 0 (f64 (7463706498606430272)) (f64 (1627905322253939267)) (f64 (18058150319249889218))
  = [1; 1; 7463706498606430272; 1627905322253939267; 18058150319249889218].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  cs_Track_Plan_fun 7 (f64 (12307321149354887348)) (f64 (8368954074241610048)) (f64 (6604165432037111584))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  cs_Track_Plan_fun 0 (f64 (18033148966291613539)) (f64 (3655229706841900221)) (f64 (2196762191095580717))
  = [1; 1; 18033148966291613539; 3655229706841900221; 2196762191095580717].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  cs_Track_Plan_fun 42 (f64 (3135339443086100686)) (f64 (16438110257184205037)) (f64 (16478909094121332606))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  cs_Track_Plan_fun 4 (f64 (1441829637020863686)) (f64 (11489881643323123417)) (f64 (14912100514750494865))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  cs_Track_Plan_fun 3 (f64 (5140232617826043934)) (f64 (18196204918878705809)) (f64 (5614609277204061378))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  cs_Track_Plan_fun 4 (f64 (7609633430856224918)) (f64 (12935175063689230557)) (f64 (14437587747670028330))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  cs_Track_Plan_fun 1 (f64 (4544787156984505057)) (f64 (10986972992371327496)) (f64 (12295532193939049608))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  cs_Track_Plan_fun 4294967295 (f64 (12870322313277344194)) (f64 (13428469213180826688)) (f64 (236109807925535764))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  cs_Track_Plan_fun 2 (f64 (7770177309920954220)) (f64 (13957383296661209012)) (f64 (6545405935468635619))
  = [3; 1; 13957383296661209012; 6545405935468635619; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  cs_Track_Plan_fun 4 (f64 (13077130542271202740)) (f64 (11897179421250662322)) (f64 (10384137881620350955))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  cs_Track_Plan_fun 7 (f64 (4659941505916571282)) (f64 (10669130403198889832)) (f64 (16167520553193204595))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  cs_Track_Plan_fun 1 (f64 (13554586106190665179)) (f64 (1656983488488023828)) (f64 (16893740882822876715))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  cs_Track_Plan_fun 7 (f64 (14636487704538070993)) (f64 (12449558502327500961)) (f64 (12348774686302389837))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  cs_Track_Plan_fun 0 (f64 (4178494249560679794)) (f64 (14846164133454615170)) (f64 (600834211845404274))
  = [1; 1; 4178494249560679794; 14846164133454615170; 600834211845404274].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  cs_Track_Plan_fun 4294967295 (f64 (11010094660305807466)) (f64 (13097470604528938714)) (f64 (4998264777332960176))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  cs_Track_Plan_fun 1 (f64 (16923258879454349702)) (f64 (6637480299547468093)) (f64 (14596615736659679249))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  cs_Track_Plan_fun 3 (f64 (9521011261775282796)) (f64 (5942965245445789017)) (f64 (3081125853532318061))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  cs_Track_Plan_fun 42 (f64 (16854208927441299123)) (f64 (6511063862492284586)) (f64 (11608418630997578568))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  cs_Track_Plan_fun 2 (f64 (10190818058370904263)) (f64 (7333576314490237535)) (f64 (17784743835885886382))
  = [3; 1; 7333576314490237535; 17784743835885886382; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  cs_Track_Plan_fun 4294967295 (f64 (15261591213029436629)) (f64 (10920774808662551736)) (f64 (6029097053358173552))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  cs_Track_Plan_fun 1 (f64 (112544990393604836)) (f64 (13855967760823146048)) (f64 (16568163241226218604))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  cs_Track_Plan_fun 3 (f64 (10641009271219372793)) (f64 (16550662749226495730)) (f64 (1464130252033270202))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  cs_Track_Plan_fun 1 (f64 (7474585973893558340)) (f64 (8952659034483067154)) (f64 (6120229511625343078))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  cs_Track_Plan_fun 7 (f64 (224588457662840427)) (f64 (9829333211052775354)) (f64 (1308779992284525942))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  cs_Track_Plan_fun 4 (f64 (12033558889250876206)) (f64 (750957801089206771)) (f64 (11032957764660593499))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  cs_Track_Plan_fun 7 (f64 (11850211289448596533)) (f64 (12727629954279988102)) (f64 (4190681971984719515))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  cs_Track_Plan_fun 4 (f64 (8489451369704821188)) (f64 (18204741388157421763)) (f64 (9031101512100247790))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  cs_Track_Plan_fun 1 (f64 (16304395358437730747)) (f64 (10278819074590806177)) (f64 (8452045426403630085))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  cs_Track_Plan_fun 42 (f64 (6717681458139619652)) (f64 (12947788294880118841)) (f64 (949299507063155679))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  cs_Track_Plan_fun 2 (f64 (4227437757848649448)) (f64 (9558973491390897178)) (f64 (7060811260250598953))
  = [3; 1; 9558973491390897178; 7060811260250598953; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  cs_Track_Plan_fun 7 (f64 (17361092245501673350)) (f64 (16402856609442200027)) (f64 (16518231119542714177))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  cs_Track_Plan_fun 2 (f64 (13913112365913799113)) (f64 (51605740826761870)) (f64 (6627864752662300794))
  = [3; 1; 51605740826761870; 6627864752662300794; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  cs_Track_Plan_fun 2 (f64 (12033919277765296532)) (f64 (3658355524481886923)) (f64 (8030260156134212271))
  = [3; 1; 3658355524481886923; 8030260156134212271; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  cs_Track_Plan_fun 3 (f64 (4754853951592121634)) (f64 (1806510258465469536)) (f64 (3997672389942671092))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  cs_Track_Plan_fun 0 (f64 (16072015870192156141)) (f64 (5257901723199979897)) (f64 (18157609040663279404))
  = [1; 1; 16072015870192156141; 5257901723199979897; 18157609040663279404].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  cs_Track_Plan_fun 2 (f64 (11182788846787636924)) (f64 (12956712193453599115)) (f64 (13706590651382222436))
  = [3; 1; 12956712193453599115; 13706590651382222436; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  cs_Track_Plan_fun 3 (f64 (7798845186765953349)) (f64 (12288964935460572283)) (f64 (15589528917256316842))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  cs_Track_Plan_fun 0 (f64 (10590447532214334091)) (f64 (13828286917930568907)) (f64 (135440415725393433))
  = [1; 1; 10590447532214334091; 13828286917930568907; 135440415725393433].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  cs_Track_Plan_fun 3 (f64 (7173761039203741004)) (f64 (13248012664132865879)) (f64 (1221199713653317041))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  cs_Track_Plan_fun 4 (f64 (1622868073937281529)) (f64 (2204971432911763114)) (f64 (10421424276084778249))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  cs_Track_Plan_fun 4 (f64 (11486666974883546754)) (f64 (2601789677263424617)) (f64 (1924441987931328715))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  cs_Track_Plan_fun 4294967295 (f64 (17318793336538267802)) (f64 (8041436212656408320)) (f64 (18075611828567711848))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  cs_Track_Plan_fun 2 (f64 (5503194631484122274)) (f64 (11391299372841574834)) (f64 (1806672107698033117))
  = [3; 1; 11391299372841574834; 1806672107698033117; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  cs_Track_Plan_fun 1 (f64 (17425110275090444484)) (f64 (3151913538352387623)) (f64 (6204628507793999326))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  cs_Track_Plan_fun 3 (f64 (16604302821696493458)) (f64 (278576706940786327)) (f64 (16305976832193588536))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  cs_Track_Plan_fun 2 (f64 (5350137615313805623)) (f64 (10848109820817599887)) (f64 (3795452368736257312))
  = [3; 1; 10848109820817599887; 3795452368736257312; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  cs_Track_Plan_fun 0 (f64 (9117255318389057676)) (f64 (11239031760758194948)) (f64 (5266396068510209456))
  = [1; 1; 9117255318389057676; 11239031760758194948; 5266396068510209456].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  cs_Track_Plan_fun 4294967295 (f64 (10787089923043353768)) (f64 (1435335424539473864)) (f64 (7671772153762112113))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  cs_Track_Plan_fun 4294967295 (f64 (6037711479746485347)) (f64 (13579202852667804512)) (f64 (7642730597147750849))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  cs_Track_Plan_fun 0 (f64 (12464604841989985248)) (f64 (9975478154779237332)) (f64 (4278062598695252168))
  = [1; 1; 12464604841989985248; 9975478154779237332; 4278062598695252168].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  cs_Track_Plan_fun 0 (f64 (17279388958591638799)) (f64 (4186376631093945312)) (f64 (3159073478517136629))
  = [1; 1; 17279388958591638799; 4186376631093945312; 3159073478517136629].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  cs_Track_Plan_fun 1 (f64 (12720784928485922110)) (f64 (10446079068319154438)) (f64 (909671214829397769))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  cs_Track_Plan_fun 0 (f64 (2696640103564347635)) (f64 (10708430482180220961)) (f64 (7290642965914057909))
  = [1; 1; 2696640103564347635; 10708430482180220961; 7290642965914057909].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  cs_Track_Plan_fun 3 (f64 (11936323128352106873)) (f64 (13151299773905340617)) (f64 (15048875049834721486))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  cs_Track_Plan_fun 1 (f64 (14970035887828279989)) (f64 (12199879960283854914)) (f64 (12774356833904417665))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  cs_Track_Plan_fun 0 (f64 (11777858509145511008)) (f64 (2485771064918409945)) (f64 (4253958437186212027))
  = [1; 1; 11777858509145511008; 2485771064918409945; 4253958437186212027].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  cs_Track_Plan_fun 0 (f64 (749533548975766457)) (f64 (7449032659865248429)) (f64 (14186686681094615436))
  = [1; 1; 749533548975766457; 7449032659865248429; 14186686681094615436].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  cs_Track_Plan_fun 4294967295 (f64 (1811358559735993139)) (f64 (7944039492482582293)) (f64 (2738218009617167105))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  cs_Track_Plan_fun 4 (f64 (7454893580247565254)) (f64 (3478119724980385139)) (f64 (14819846479195829471))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  cs_Track_Plan_fun 0 (f64 (2179997897843441271)) (f64 (12756795504247635879)) (f64 (18181454468586975002))
  = [1; 1; 2179997897843441271; 12756795504247635879; 18181454468586975002].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  cs_Track_Plan_fun 4294967295 (f64 (7281335794005975742)) (f64 (14997947897733539064)) (f64 (11480538151886187782))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  cs_Track_Plan_fun 4294967295 (f64 (16809834795603961761)) (f64 (4013802325549536966)) (f64 (15479270663658055572))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  cs_Track_Plan_fun 42 (f64 (2217495596991959812)) (f64 (3338866007413378200)) (f64 (1088237850072722809))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  cs_Track_Plan_fun 2 (f64 (8394692784564959002)) (f64 (18278495564159189199)) (f64 (4935418121828352297))
  = [3; 1; 18278495564159189199; 4935418121828352297; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  cs_Track_Plan_fun 7 (f64 (1963919516335187501)) (f64 (8761026114618834620)) (f64 (11630305509572475826))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  cs_Track_Plan_fun 3 (f64 (10401021456664715999)) (f64 (7469980421464503930)) (f64 (11803699623320078543))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  cs_Track_Plan_fun 2 (f64 (1106003097005386378)) (f64 (13356365776407174050)) (f64 (3643067087316945068))
  = [3; 1; 13356365776407174050; 3643067087316945068; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  cs_Track_Plan_fun 4 (f64 (17629676249032308737)) (f64 (7200781723579628305)) (f64 (5810537160950514330))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  cs_Track_Plan_fun 4294967295 (f64 (16675463125622010300)) (f64 (11209661879274062657)) (f64 (13410272443885106701))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  cs_Track_Plan_fun 7 (f64 (1780617063949192350)) (f64 (8737740908897238373)) (f64 (13525144726615143172))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  cs_Track_Plan_fun 3 (f64 (10604863547238454113)) (f64 (8159252482677844087)) (f64 (18232718338869812873))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  cs_Track_Plan_fun 1 (f64 (4130734983298164539)) (f64 (2331997290615727880)) (f64 (18082307665003473111))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  cs_Track_Plan_fun 4294967295 (f64 (18324113901571895413)) (f64 (1804630426410966470)) (f64 (2451722384741599827))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  cs_Track_Plan_fun 42 (f64 (4453874897482187586)) (f64 (3654072101148671952)) (f64 (4743441473066850813))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  cs_Track_Plan_fun 3 (f64 (13155690200743042977)) (f64 (11508278510426434540)) (f64 (15235036493323805329))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  cs_Track_Plan_fun 42 (f64 (15032665232712411028)) (f64 (8477235865672360367)) (f64 (8775485424287132836))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  cs_Track_Plan_fun 4294967295 (f64 (11560098042267126518)) (f64 (1958170842974075581)) (f64 (12194963078046591049))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  cs_Track_Plan_fun 4 (f64 (5472341194158882298)) (f64 (16253398330368697186)) (f64 (10998857415623024955))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  cs_Track_Plan_fun 4294967295 (f64 (4557862861481491934)) (f64 (11009100742228996166)) (f64 (5717885676004519875))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  cs_Track_Plan_fun 2 (f64 (12597343991012988254)) (f64 (8249257450684974214)) (f64 (3071887439814437987))
  = [3; 1; 8249257450684974214; 3071887439814437987; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  cs_Track_Plan_fun 4 (f64 (11107784879180872961)) (f64 (7546245910419090175)) (f64 (3659020306250223676))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  cs_Track_Plan_fun 1 (f64 (16002077115490258836)) (f64 (5392496239928493144)) (f64 (751335429642894075))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  cs_Track_Plan_fun 2 (f64 (6697721920498285988)) (f64 (9099322565316104770)) (f64 (14192951593761063765))
  = [3; 1; 9099322565316104770; 14192951593761063765; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  cs_Track_Plan_fun 42 (f64 (9067660161927578567)) (f64 (9235693991229711451)) (f64 (12113096132003921214))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  cs_Track_Plan_fun 4294967295 (f64 (2704369868338074307)) (f64 (614131936122400942)) (f64 (2315538441871922465))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  cs_Track_Plan_fun 42 (f64 (11394078717272378192)) (f64 (12431976151442872301)) (f64 (1146402436653734046))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  cs_Track_Plan_fun 4294967295 (f64 (1947810983308725787)) (f64 (10081486786766996098)) (f64 (114001412423789391))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  cs_Track_Plan_fun 0 (f64 (12368598307788613642)) (f64 (11943052910102278036)) (f64 (16592353728452712342))
  = [1; 1; 12368598307788613642; 11943052910102278036; 16592353728452712342].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  cs_Track_Plan_fun 0 (f64 (6848762799832539252)) (f64 (6524185798459154441)) (f64 (4091003167721434419))
  = [1; 1; 6848762799832539252; 6524185798459154441; 4091003167721434419].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  cs_Track_Plan_fun 4 (f64 (2105924098985197116)) (f64 (6705750380426516963)) (f64 (2951348664416859699))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  cs_Track_Plan_fun 3 (f64 (187342657648158114)) (f64 (3190872276699603773)) (f64 (406085873641014382))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  cs_Track_Plan_fun 1 (f64 (1180640760282890122)) (f64 (15488458341021883208)) (f64 (283593030692439248))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  cs_Track_Plan_fun 4294967295 (f64 (17476078003514721804)) (f64 (6776137211167637461)) (f64 (7990584157606383035))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  cs_Track_Plan_fun 42 (f64 (18325362563257890517)) (f64 (11609360646437315860)) (f64 (15729751994448293170))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  cs_Track_Plan_fun 4 (f64 (14056983374626237218)) (f64 (12735407678306306604)) (f64 (9284580701702675290))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  cs_Track_Plan_fun 4 (f64 (10989059811789551310)) (f64 (5681932922270954879)) (f64 (15778807928932620957))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  cs_Track_Plan_fun 42 (f64 (109122839291241198)) (f64 (14088655351594487087)) (f64 (14934957266321746561))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  cs_Track_Plan_fun 2 (f64 (7485834352010408114)) (f64 (9131537426723771996)) (f64 (16028459812839382599))
  = [3; 1; 9131537426723771996; 16028459812839382599; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  cs_Track_Plan_fun 42 (f64 (3280379493174030568)) (f64 (3312490190932039053)) (f64 (6735506736614626500))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  cs_Track_Plan_fun 4294967295 (f64 (2056735609807824273)) (f64 (4326631830435818807)) (f64 (5511538192995601201))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  cs_Track_Plan_fun 1 (f64 (2215106476622422648)) (f64 (13793166416592100967)) (f64 (9743149406295651132))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  cs_Track_Plan_fun 2 (f64 (14453908670751345297)) (f64 (13278229860656914253)) (f64 (13487876290234263689))
  = [3; 1; 13278229860656914253; 13487876290234263689; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  cs_Track_Plan_fun 2 (f64 (16365159536840406893)) (f64 (888026710095325845)) (f64 (5238097743348832130))
  = [3; 1; 888026710095325845; 5238097743348832130; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  cs_Track_Plan_fun 4294967295 (f64 (7779701008339396393)) (f64 (15019627015801664084)) (f64 (15117767102983126492))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  cs_Track_Plan_fun 1 (f64 (1625284601826020216)) (f64 (4415295113914860943)) (f64 (5585281043252109584))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  cs_Track_Plan_fun 4294967295 (f64 (4974693470542599058)) (f64 (15720050863047012657)) (f64 (9919468641602469845))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  cs_Track_Plan_fun 3 (f64 (8980237732409659511)) (f64 (10937704056586343493)) (f64 (5196750901637267335))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  cs_Track_Plan_fun 7 (f64 (16271892105890858515)) (f64 (17342374563193290224)) (f64 (421458523902940789))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  cs_Track_Plan_fun 1 (f64 (7640566266147175818)) (f64 (5494547702191679105)) (f64 (8454370264022798524))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  cs_Track_Plan_fun 7 (f64 (12457925622474032522)) (f64 (9863998782826754498)) (f64 (11913290894265484076))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  cs_Track_Plan_fun 1 (f64 (17089858074409430271)) (f64 (1513690134289283998)) (f64 (17110339954945586625))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  cs_Track_Plan_fun 3 (f64 (35998935785123755)) (f64 (3780366261093435362)) (f64 (8424588693642076779))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  cs_Track_Plan_fun 4294967295 (f64 (1104497708214472496)) (f64 (6217074599344026525)) (f64 (6139393605686211075))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  cs_Track_Plan_fun 2 (f64 (11895334083054474606)) (f64 (610825370365303766)) (f64 (4765442889101837984))
  = [3; 1; 610825370365303766; 4765442889101837984; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  cs_Track_Plan_fun 4 (f64 (6751422907842814749)) (f64 (18044979314635910895)) (f64 (4286165783047655091))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  cs_Track_Plan_fun 42 (f64 (2748412942253869230)) (f64 (16474939754340442948)) (f64 (12227556168436120056))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  cs_Track_Plan_fun 4294967295 (f64 (2617677266994179473)) (f64 (17539209374982988035)) (f64 (1656886442930039441))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  cs_Track_Plan_fun 42 (f64 (9415590093070856292)) (f64 (4026426237294376225)) (f64 (14667828097342075869))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  cs_Track_Plan_fun 4 (f64 (910786825781304950)) (f64 (17930278763962838583)) (f64 (16092652889418520092))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  cs_Track_Plan_fun 4294967295 (f64 (8151509468726766011)) (f64 (7177278374892555313)) (f64 (2843873491786758776))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  cs_Track_Plan_fun 42 (f64 (3056947503264346772)) (f64 (10165484435119347905)) (f64 (11308131718204655420))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  cs_Track_Plan_fun 4 (f64 (10554822690471295016)) (f64 (12555367218971008239)) (f64 (9834066993231830344))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  cs_Track_Plan_fun 4 (f64 (10477822835931358155)) (f64 (7749836078969539577)) (f64 (14108428869073359445))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  cs_Track_Plan_fun 4294967295 (f64 (95629743911519304)) (f64 (3473293651237839353)) (f64 (8016425193118023763))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  cs_Track_Plan_fun 4 (f64 (1816083326327901264)) (f64 (10244476425116416075)) (f64 (7722293067566934807))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  cs_Track_Plan_fun 3 (f64 (8860087294364425275)) (f64 (10270140227805176834)) (f64 (3163647536856957508))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  cs_Track_Plan_fun 3 (f64 (1215509569014667455)) (f64 (9681625067141052635)) (f64 (7782349174803095790))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  cs_Track_Plan_fun 1 (f64 (16253056366062848314)) (f64 (7112700596954056793)) (f64 (7547451276096449697))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  cs_Track_Plan_fun 7 (f64 (3364035499058744142)) (f64 (5346788354621543283)) (f64 (11867473792669046795))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  cs_Track_Plan_fun 2 (f64 (14649015255121741162)) (f64 (272623866926422328)) (f64 (14956399913521125995))
  = [3; 1; 272623866926422328; 14956399913521125995; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  cs_Track_Plan_fun 4 (f64 (18168958535926221688)) (f64 (17031370790991914588)) (f64 (8627269120458910785))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  cs_Track_Plan_fun 0 (f64 (7090701246603209701)) (f64 (12015888296246865897)) (f64 (17158973423194909322))
  = [1; 1; 7090701246603209701; 12015888296246865897; 17158973423194909322].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  cs_Track_Plan_fun 0 (f64 (29855497323408474)) (f64 (12769435771985884264)) (f64 (14331242694153540619))
  = [1; 1; 29855497323408474; 12769435771985884264; 14331242694153540619].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  cs_Track_Plan_fun 2 (f64 (7276408561186989617)) (f64 (7887690698855777126)) (f64 (3399866288806308229))
  = [3; 1; 7887690698855777126; 3399866288806308229; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  cs_Track_Plan_fun 4294967295 (f64 (10206919822999607243)) (f64 (2791362148275888878)) (f64 (16999308320160653265))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  cs_Track_Plan_fun 2 (f64 (4841634889067034833)) (f64 (16952505436200532654)) (f64 (12865201447882792284))
  = [3; 1; 16952505436200532654; 12865201447882792284; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  cs_Track_Plan_fun 42 (f64 (9051984644353416669)) (f64 (8007932169631260832)) (f64 (4496871452388283627))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  cs_Track_Plan_fun 2 (f64 (14730174360625825097)) (f64 (844109755796934632)) (f64 (12803542555483528601))
  = [3; 1; 844109755796934632; 12803542555483528601; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  cs_Track_Plan_fun 7 (f64 (16676480048560069417)) (f64 (1574631607793923203)) (f64 (2399946971567622161))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  cs_Track_Plan_fun 4 (f64 (3766572169676764086)) (f64 (2252184221527692718)) (f64 (11502381752292124807))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  cs_Track_Plan_fun 4 (f64 (12421198251366229858)) (f64 (14849334173172890387)) (f64 (9575284716271582760))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  cs_Track_Plan_fun 0 (f64 (1731632632381459364)) (f64 (4740321805965592699)) (f64 (16875546970407131393))
  = [1; 1; 1731632632381459364; 4740321805965592699; 16875546970407131393].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  cs_Track_Plan_fun 2 (f64 (7079279070183352043)) (f64 (8645433163664865629)) (f64 (15315143674515994194))
  = [3; 1; 8645433163664865629; 15315143674515994194; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  cs_Track_Plan_fun 2 (f64 (13431688989152615268)) (f64 (6513303961921328730)) (f64 (2787738298950361372))
  = [3; 1; 6513303961921328730; 2787738298950361372; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  cs_Track_Plan_fun 3 (f64 (1674634667353203588)) (f64 (3759686323630077638)) (f64 (12886601444968894981))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  cs_Track_Plan_fun 4294967295 (f64 (1254182854331976574)) (f64 (2681782587504564283)) (f64 (4767136391408885086))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  cs_Track_Plan_fun 1 (f64 (15719603509037316722)) (f64 (16105077163462045265)) (f64 (16388150415466016780))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  cs_Track_Plan_fun 2 (f64 (13882779824313404420)) (f64 (13020033891512885887)) (f64 (1214981241213926502))
  = [3; 1; 13020033891512885887; 1214981241213926502; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  cs_Track_Plan_fun 1 (f64 (14936506339080385605)) (f64 (17505875776802172696)) (f64 (9202493757024286915))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  cs_Track_Plan_fun 4294967295 (f64 (13849752181778368147)) (f64 (9079335323349630665)) (f64 (3256660325475977462))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  cs_Track_Plan_fun 4294967295 (f64 (15947409904219569260)) (f64 (15511798653711280742)) (f64 (14354805511649598242))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  cs_Track_Plan_fun 0 (f64 (1970834606120049489)) (f64 (1759244000619660605)) (f64 (18300766367783775405))
  = [1; 1; 1970834606120049489; 1759244000619660605; 18300766367783775405].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  cs_Track_Plan_fun 7 (f64 (11126919506018689351)) (f64 (4713184381825440181)) (f64 (18002980294206446667))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  cs_Track_Plan_fun 4 (f64 (10414600329540687111)) (f64 (13167124436343419113)) (f64 (10012463156768267584))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  cs_Track_Plan_fun 4294967295 (f64 (2840646956539519594)) (f64 (3175811123339803373)) (f64 (16241214033363873907))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  cs_Track_Plan_fun 4294967295 (f64 (16604158364251166948)) (f64 (13813513632071773549)) (f64 (3457418172009131627))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  cs_Track_Plan_fun 3 (f64 (9412569184679068766)) (f64 (10729969934519484828)) (f64 (10184310262341417682))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  cs_Track_Plan_fun 3 (f64 (16704579528855590615)) (f64 (14448919555739678785)) (f64 (1219064409061171726))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  cs_Track_Plan_fun 4294967295 (f64 (3091002835407682468)) (f64 (2647355958803967989)) (f64 (6176874364356362672))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  cs_Track_Plan_fun 2 (f64 (15962589503374970002)) (f64 (4262388077314853072)) (f64 (12828662920448384599))
  = [3; 1; 4262388077314853072; 12828662920448384599; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  cs_Track_Plan_fun 42 (f64 (4064835468625072767)) (f64 (4709184349446423928)) (f64 (17507818792316806770))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  cs_Track_Plan_fun 3 (f64 (17075442423513707162)) (f64 (14692610515156512214)) (f64 (9842758849476859605))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  cs_Track_Plan_fun 4294967295 (f64 (402266409010902036)) (f64 (14902139484723774995)) (f64 (3521103584995716466))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  cs_Track_Plan_fun 7 (f64 (5818021098364475320)) (f64 (15536260448443967611)) (f64 (14042909806789406704))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  cs_Track_Plan_fun 0 (f64 (210248774583341556)) (f64 (10234390099554590345)) (f64 (2727268489121405816))
  = [1; 1; 210248774583341556; 10234390099554590345; 2727268489121405816].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  cs_Track_Plan_fun 7 (f64 (6295212930545507556)) (f64 (11929027206603972960)) (f64 (7146649936964612692))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  cs_Track_Plan_fun 4294967295 (f64 (4031155888188091558)) (f64 (3952520433545279363)) (f64 (12018040905442011389))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  cs_Track_Plan_fun 2 (f64 (1165700773765266285)) (f64 (1544313581098984990)) (f64 (207216699031354721))
  = [3; 1; 1544313581098984990; 207216699031354721; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  cs_Track_Plan_fun 4294967295 (f64 (13224364790663105182)) (f64 (8237656305572463580)) (f64 (3057439229444415986))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  cs_Track_Plan_fun 1 (f64 (4146641130116430543)) (f64 (6156364525430457931)) (f64 (12107433988707138788))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  cs_Track_Plan_fun 3 (f64 (4060138601924009926)) (f64 (6121411026832772752)) (f64 (16367472243178007508))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  cs_Track_Plan_fun 42 (f64 (4821927447115827274)) (f64 (17286707112669112295)) (f64 (5076931753260392440))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  cs_Track_Plan_fun 4294967295 (f64 (5307607241585801270)) (f64 (15992324768103466118)) (f64 (1688357180231401850))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  cs_Track_Plan_fun 2 (f64 (4012229698356218187)) (f64 (5533197035676544847)) (f64 (13714068524097204765))
  = [3; 1; 5533197035676544847; 13714068524097204765; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  cs_Track_Plan_fun 7 (f64 (4025298912426790063)) (f64 (15422968918577308753)) (f64 (625025111850071113))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  cs_Track_Plan_fun 7 (f64 (2778654164591688180)) (f64 (14746429949513015893)) (f64 (5914068443400833287))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  cs_Track_Plan_fun 4294967295 (f64 (12938001649267991781)) (f64 (10139134671336577926)) (f64 (4072716007487648076))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  cs_Track_Plan_fun 4 (f64 (18157776863039541456)) (f64 (11163990909595541663)) (f64 (14874307760413897525))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  cs_Track_Plan_fun 0 (f64 (1185573053270646833)) (f64 (9338468078817018504)) (f64 (15061418241051411624))
  = [1; 1; 1185573053270646833; 9338468078817018504; 15061418241051411624].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  cs_Track_Plan_fun 7 (f64 (9946713761626963418)) (f64 (10760589480472630774)) (f64 (10892509183893913765))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  cs_Track_Plan_fun 2 (f64 (12097293254252947926)) (f64 (18295906048854176123)) (f64 (16070405025013333517))
  = [3; 1; 18295906048854176123; 16070405025013333517; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  cs_Track_Plan_fun 0 (f64 (2063580807180418287)) (f64 (5260896623200067280)) (f64 (6803282990557029525))
  = [1; 1; 2063580807180418287; 5260896623200067280; 6803282990557029525].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  cs_Track_Plan_fun 4 (f64 (4211980234635069504)) (f64 (13978645127688499013)) (f64 (10979729042424569385))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  cs_Track_Plan_fun 2 (f64 (9159079082741521726)) (f64 (9977593097160191273)) (f64 (4436479782045677207))
  = [3; 1; 9977593097160191273; 4436479782045677207; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  cs_Track_Plan_fun 4 (f64 (14565696982007910794)) (f64 (11646183508949939185)) (f64 (5294885576958522010))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  cs_Track_Plan_fun 2 (f64 (4979677772579981692)) (f64 (7203879734546732631)) (f64 (5674005714253987226))
  = [3; 1; 7203879734546732631; 5674005714253987226; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  cs_Track_Plan_fun 4 (f64 (17315831852391449232)) (f64 (2430808268400371640)) (f64 (10461519632584805263))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  cs_Track_Plan_fun 4 (f64 (2961081314701287476)) (f64 (2583291158828401261)) (f64 (3394073951288694203))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  cs_Track_Plan_fun 1 (f64 (6882686196058304535)) (f64 (11527657508372184591)) (f64 (11457387638832240406))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  cs_Track_Plan_fun 1 (f64 (7888563643925552989)) (f64 (15090468215154143712)) (f64 (5546961566771586201))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  cs_Track_Plan_fun 4294967295 (f64 (629211996429908688)) (f64 (6517544627994082962)) (f64 (9691363232466417485))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  cs_Track_Plan_fun 1 (f64 (6828177756300098293)) (f64 (2906759586600480226)) (f64 (555870023362147240))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  cs_Track_Plan_fun 3 (f64 (5898602810329310318)) (f64 (12636012918819124654)) (f64 (15402828105731733142))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  cs_Track_Plan_fun 4294967295 (f64 (13291071577608905230)) (f64 (7012867908165423570)) (f64 (16218999948359418563))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  cs_Track_Plan_fun 4294967295 (f64 (3226441217783649524)) (f64 (9898125029106856719)) (f64 (15032562553428115879))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  cs_Track_Plan_fun 2 (f64 (8857015010424085541)) (f64 (7355165932713262844)) (f64 (5387244150600721563))
  = [3; 1; 7355165932713262844; 5387244150600721563; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  cs_Track_Plan_fun 42 (f64 (14565098079839914835)) (f64 (8354300339616782134)) (f64 (17401394936779346653))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  cs_Track_Plan_fun 42 (f64 (6741201586047369583)) (f64 (1687053428576609982)) (f64 (14926139342779836297))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  cs_Track_Plan_fun 2 (f64 (252038282540835623)) (f64 (5956813522015222476)) (f64 (11511367128049683021))
  = [3; 1; 5956813522015222476; 11511367128049683021; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  cs_Track_Plan_fun 0 (f64 (5141072542204663117)) (f64 (14439111642944757118)) (f64 (1150256958666807801))
  = [1; 1; 5141072542204663117; 14439111642944757118; 1150256958666807801].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  cs_Track_Plan_fun 4294967295 (f64 (4957046180497192411)) (f64 (16407523937353802427)) (f64 (17388032243902472837))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  cs_Track_Plan_fun 2 (f64 (15198442028036322745)) (f64 (7615584946185574346)) (f64 (17762295021498757361))
  = [3; 1; 7615584946185574346; 17762295021498757361; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  cs_Track_Plan_fun 4294967295 (f64 (4887525981280231783)) (f64 (10176067632895379306)) (f64 (16688512509738635842))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  cs_Track_Plan_fun 0 (f64 (2372029093691885512)) (f64 (4333696853013552545)) (f64 (8367907447710654402))
  = [1; 1; 2372029093691885512; 4333696853013552545; 8367907447710654402].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  cs_Track_Plan_fun 0 (f64 (3532392813270252090)) (f64 (11954459662778207373)) (f64 (12344583106541142913))
  = [1; 1; 3532392813270252090; 11954459662778207373; 12344583106541142913].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  cs_Track_Plan_fun 42 (f64 (11574987294647723158)) (f64 (5257397221841738464)) (f64 (7269651329394805837))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  cs_Track_Plan_fun 3 (f64 (2489040453553728340)) (f64 (3515691271381785288)) (f64 (13858425415924568587))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  cs_Track_Plan_fun 2 (f64 (1278634730176627478)) (f64 (13935656214225949368)) (f64 (5788809459021866093))
  = [3; 1; 13935656214225949368; 5788809459021866093; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  cs_Track_Plan_fun 3 (f64 (9981362411743381783)) (f64 (5866793519274772362)) (f64 (12914504814340743353))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  cs_Track_Plan_fun 3 (f64 (7304143780027477156)) (f64 (9991009975546769923)) (f64 (9637062997042057943))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  cs_Track_Plan_fun 2 (f64 (4617900091436488936)) (f64 (2219968790031605808)) (f64 (13514765294897763442))
  = [3; 1; 2219968790031605808; 13514765294897763442; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  cs_Track_Plan_fun 7 (f64 (188129251459157771)) (f64 (5931459244594547679)) (f64 (5371975952054245018))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  cs_Track_Plan_fun 7 (f64 (424702768862516007)) (f64 (1677657861956046604)) (f64 (9594216705805274610))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  cs_Track_Plan_fun 7 (f64 (15719032157392776259)) (f64 (2936541795405302935)) (f64 (5799257836848911326))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  cs_Track_Plan_fun 4 (f64 (11749060503236409755)) (f64 (1112243376386924038)) (f64 (15397198114691337081))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  cs_Track_Plan_fun 1 (f64 (9478384200233873092)) (f64 (12066715746489405918)) (f64 (12505224834149274838))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  cs_Track_Plan_fun 7 (f64 (11860103737172829044)) (f64 (17289894297107338591)) (f64 (4843158688995661991))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  cs_Track_Plan_fun 42 (f64 (11285043672118393488)) (f64 (14696743074439741934)) (f64 (5134874062472414650))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  cs_Track_Plan_fun 1 (f64 (15446033114139436098)) (f64 (13566620593321728242)) (f64 (1337412075638803881))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  cs_Track_Plan_fun 42 (f64 (14253130122384855058)) (f64 (3993926307821738598)) (f64 (1048735733018864342))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  cs_Track_Plan_fun 0 (f64 (16301976062737557599)) (f64 (7558443235479391634)) (f64 (2306030054895013466))
  = [1; 1; 16301976062737557599; 7558443235479391634; 2306030054895013466].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  cs_Track_Plan_fun 1 (f64 (7441187174630430967)) (f64 (3344499815409199264)) (f64 (13609730763312623282))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  cs_Track_Plan_fun 3 (f64 (8972911162927190647)) (f64 (8443900596259132377)) (f64 (5878150171012478581))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  cs_Track_Plan_fun 4294967295 (f64 (11875440152406606868)) (f64 (8540461438040552189)) (f64 (9985997388653212764))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  cs_Track_Plan_fun 42 (f64 (2976398113420950529)) (f64 (878810070921289081)) (f64 (11076144014199554939))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  cs_Track_Plan_fun 4 (f64 (16107446919361172025)) (f64 (10743095375649554084)) (f64 (13423105256481664568))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  cs_Track_Plan_fun 3 (f64 (15998373308251243958)) (f64 (8344313640791877483)) (f64 (6876347442386663896))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  cs_Track_Plan_fun 0 (f64 (16334758723321564587)) (f64 (9917456962295890322)) (f64 (11078393570547307286))
  = [1; 1; 16334758723321564587; 9917456962295890322; 11078393570547307286].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  cs_Track_Plan_fun 3 (f64 (9618405339450198016)) (f64 (11661567825835350498)) (f64 (5981053483506941435))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  cs_Track_Plan_fun 7 (f64 (15226308446138999426)) (f64 (620401103042858688)) (f64 (9883619748968015020))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  cs_Track_Plan_fun 1 (f64 (16428815774942699905)) (f64 (9320520497629205927)) (f64 (9442529416272428948))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  cs_Track_Plan_fun 1 (f64 (2516636166137296440)) (f64 (9039745755396857634)) (f64 (8686639523334239707))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  cs_Track_Plan_fun 2 (f64 (11727892947030848127)) (f64 (2040362351777342490)) (f64 (10751144824863879543))
  = [3; 1; 2040362351777342490; 10751144824863879543; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  cs_Track_Plan_fun 0 (f64 (7498482085786879395)) (f64 (16934910434110710958)) (f64 (10994716174403825096))
  = [1; 1; 7498482085786879395; 16934910434110710958; 10994716174403825096].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  cs_Track_Plan_fun 3 (f64 (1214900520006106447)) (f64 (4119097367901517590)) (f64 (1644057667680272393))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  cs_Track_Plan_fun 4 (f64 (16231937925728803337)) (f64 (8621092273451344854)) (f64 (10097065102814523471))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  cs_Track_Plan_fun 3 (f64 (1887910183033587741)) (f64 (904857555212304963)) (f64 (5942370858322796695))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  cs_Track_Plan_fun 0 (f64 (11009532635154634380)) (f64 (17977090437897829330)) (f64 (11805814917920753189))
  = [1; 1; 11009532635154634380; 17977090437897829330; 11805814917920753189].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  cs_Track_Plan_fun 3 (f64 (12622921488703003921)) (f64 (8615681234786527086)) (f64 (157929192648982537))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  cs_Track_Plan_fun 7 (f64 (7607988180538846992)) (f64 (111687568600770356)) (f64 (12428576458775529692))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  cs_Track_Plan_fun 2 (f64 (7305507799731049271)) (f64 (88179912153926036)) (f64 (14399594017070143969))
  = [3; 1; 88179912153926036; 14399594017070143969; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  cs_Track_Plan_fun 1 (f64 (17202384563629393603)) (f64 (4540172333580451789)) (f64 (4633063201174575266))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  cs_Track_Plan_fun 0 (f64 (423241014369355204)) (f64 (15811875605339069396)) (f64 (4835417675939036089))
  = [1; 1; 423241014369355204; 15811875605339069396; 4835417675939036089].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  cs_Track_Plan_fun 4 (f64 (3139040956680281521)) (f64 (10748367543708849983)) (f64 (3022626443615225087))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  cs_Track_Plan_fun 42 (f64 (9111395037684672823)) (f64 (14235728989279042253)) (f64 (357614138071896773))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  cs_Track_Plan_fun 0 (f64 (10155715474153941258)) (f64 (12473460737108860916)) (f64 (14564411536077287856))
  = [1; 1; 10155715474153941258; 12473460737108860916; 14564411536077287856].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  cs_Track_Plan_fun 7 (f64 (6839913834320954137)) (f64 (3975170638780438578)) (f64 (8800026333065767464))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  cs_Track_Plan_fun 2 (f64 (650414786307314142)) (f64 (11614075365282852666)) (f64 (524145370073382846))
  = [3; 1; 11614075365282852666; 524145370073382846; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  cs_Track_Plan_fun 1 (f64 (9987899160427190089)) (f64 (2840792991189826977)) (f64 (16125020284932007744))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  cs_Track_Plan_fun 1 (f64 (16938289328515799885)) (f64 (17795663883261428853)) (f64 (4743674125344850023))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  cs_Track_Plan_fun 42 (f64 (17586329597156985647)) (f64 (18258762981087593601)) (f64 (9079801461646949755))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  cs_Track_Plan_fun 7 (f64 (9244339576589424545)) (f64 (3203218748837246724)) (f64 (4107944016866646169))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  cs_Track_Plan_fun 1 (f64 (1044304295179853862)) (f64 (6821735480739223328)) (f64 (12813583646199972125))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  cs_Track_Plan_fun 4294967295 (f64 (9536947843551615980)) (f64 (872222299344892473)) (f64 (9101041250493771822))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  cs_Track_Plan_fun 0 (f64 (9468418749699035740)) (f64 (4648424773967539693)) (f64 (5830878896983212156))
  = [1; 1; 9468418749699035740; 4648424773967539693; 5830878896983212156].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  cs_Track_Plan_fun 4294967295 (f64 (18198401102047787038)) (f64 (16303383493426002098)) (f64 (4392989999538149277))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  cs_Track_Plan_fun 4294967295 (f64 (4402077294887423651)) (f64 (5890324006380452113)) (f64 (2422801834886282360))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  cs_Track_Plan_fun 1 (f64 (12654578986391181700)) (f64 (6015434938227621497)) (f64 (17794541930835456528))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  cs_Track_Plan_fun 42 (f64 (9257990886059799624)) (f64 (7785491224380967583)) (f64 (11119586377911490891))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  cs_Track_Plan_fun 1 (f64 (4838222741958621522)) (f64 (17037686311485940725)) (f64 (224651116865537433))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  cs_Track_Plan_fun 7 (f64 (17035650004818117552)) (f64 (11264370612146443520)) (f64 (7266216517335378032))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  cs_Track_Plan_fun 0 (f64 (2629462429969679643)) (f64 (7518721505303824586)) (f64 (9316342498120434347))
  = [1; 1; 2629462429969679643; 7518721505303824586; 9316342498120434347].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  cs_Track_Plan_fun 7 (f64 (4756033253149755438)) (f64 (6599661126122411409)) (f64 (3936146800631269671))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  cs_Track_Plan_fun 4294967295 (f64 (2602076416275028942)) (f64 (17710999827842046850)) (f64 (4063471198361011958))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  cs_Track_Plan_fun 42 (f64 (3217684687637013747)) (f64 (3968414769492915223)) (f64 (14465179519087170573))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  cs_Track_Plan_fun 4294967295 (f64 (14220540595621963810)) (f64 (11696390462559451013)) (f64 (4301053371240369401))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  cs_Track_Plan_fun 42 (f64 (14090762382699123306)) (f64 (142502190149872328)) (f64 (7180321815612112743))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  cs_Track_Plan_fun 4 (f64 (11891153992253500409)) (f64 (15498456855743638410)) (f64 (11537582268629461057))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  cs_Track_Plan_fun 1 (f64 (5990466477816020719)) (f64 (10618403798602767432)) (f64 (18426434994089341200))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  cs_Track_Plan_fun 1 (f64 (17897748415913834542)) (f64 (14175848159237207333)) (f64 (17776787767169756360))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  cs_Track_Plan_fun 3 (f64 (1883835853320379070)) (f64 (15466408019150698178)) (f64 (15592559414906336198))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  cs_Track_Plan_fun 4 (f64 (4364689811387808313)) (f64 (15509015509860628026)) (f64 (2006844911084010189))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  cs_Track_Plan_fun 42 (f64 (9661426600657638262)) (f64 (4175552698522376747)) (f64 (7885286178045879795))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  cs_Track_Plan_fun 1 (f64 (2727712901546443272)) (f64 (8997650932017541719)) (f64 (6706037603142944839))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  cs_Track_Plan_fun 4 (f64 (3430632934396316825)) (f64 (4873398578603486986)) (f64 (7175861384324464022))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  cs_Track_Plan_fun 2 (f64 (11969951229634209987)) (f64 (6234200478773457285)) (f64 (8571659630204934670))
  = [3; 1; 6234200478773457285; 8571659630204934670; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  cs_Track_Plan_fun 2 (f64 (865388118691396197)) (f64 (11771626644981519047)) (f64 (18430342121173439567))
  = [3; 1; 11771626644981519047; 18430342121173439567; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  cs_Track_Plan_fun 3 (f64 (13847318375407608037)) (f64 (15133530504181557297)) (f64 (15833189583919231565))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  cs_Track_Plan_fun 0 (f64 (13473336251088755538)) (f64 (8377824059226335892)) (f64 (14961023796449518068))
  = [1; 1; 13473336251088755538; 8377824059226335892; 14961023796449518068].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  cs_Track_Plan_fun 3 (f64 (13314624048529797930)) (f64 (13316761748575443384)) (f64 (4121268093889540094))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  cs_Track_Plan_fun 1 (f64 (17330529211906491365)) (f64 (4994103415805851400)) (f64 (4443334246873162681))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  cs_Track_Plan_fun 42 (f64 (1801040375366532025)) (f64 (13293582984518781925)) (f64 (1469102627907483955))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  cs_Track_Plan_fun 4294967295 (f64 (7736070907129888147)) (f64 (14946533704971030333)) (f64 (7730194042500017482))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  cs_Track_Plan_fun 4 (f64 (9936169092927237951)) (f64 (17927247857724552000)) (f64 (14431714103965061429))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  cs_Track_Plan_fun 4294967295 (f64 (16498190353028043930)) (f64 (4593483971051100705)) (f64 (2703708135028403519))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  cs_Track_Plan_fun 4 (f64 (15639936759712938470)) (f64 (177118569399451442)) (f64 (16876838133022692393))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  cs_Track_Plan_fun 1 (f64 (14599395919638865637)) (f64 (15102081949006894236)) (f64 (17704676106048998660))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  cs_Track_Plan_fun 0 (f64 (6936822175923941464)) (f64 (7383354486236220329)) (f64 (15209306534059866697))
  = [1; 1; 6936822175923941464; 7383354486236220329; 15209306534059866697].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  cs_Track_Plan_fun 42 (f64 (15133898348997944940)) (f64 (6882336636985785283)) (f64 (2409697255742543308))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  cs_Track_Plan_fun 42 (f64 (5608197704770652793)) (f64 (3733769646407164708)) (f64 (12075268444688962852))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  cs_Track_Plan_fun 4294967295 (f64 (10895027606838777462)) (f64 (7185127618224597272)) (f64 (744209043091556981))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  cs_Track_Plan_fun 7 (f64 (5554929484678635423)) (f64 (11611793036279866282)) (f64 (3772126483020822362))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  cs_Track_Plan_fun 0 (f64 (17736296211795631568)) (f64 (13851218038907257548)) (f64 (10764002345139528092))
  = [1; 1; 17736296211795631568; 13851218038907257548; 10764002345139528092].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  cs_Track_Plan_fun 4294967295 (f64 (3280751914132185379)) (f64 (6685664577824627007)) (f64 (16237726222896749572))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  cs_Track_Plan_fun 42 (f64 (5359493978538615188)) (f64 (11904118449712850821)) (f64 (1309843387642676622))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  cs_Track_Plan_fun 4 (f64 (4993102250368228014)) (f64 (16492935682831017630)) (f64 (5290747430971843282))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  cs_Track_Plan_fun 3 (f64 (924242905397160478)) (f64 (16946611203189444610)) (f64 (11301749934347290960))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  cs_Track_Plan_fun 4 (f64 (14651854064496443454)) (f64 (15784353591196675495)) (f64 (3214690993277877741))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  cs_Track_Plan_fun 7 (f64 (16187564910664299124)) (f64 (4434081179626147386)) (f64 (4656680287872872250))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  cs_Track_Plan_fun 4 (f64 (13807722856572951551)) (f64 (1997403539555829227)) (f64 (3550120057042859458))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  cs_Track_Plan_fun 0 (f64 (11914071019252865854)) (f64 (4299661706529715015)) (f64 (16248760759080239313))
  = [1; 1; 11914071019252865854; 4299661706529715015; 16248760759080239313].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  cs_Track_Plan_fun 0 (f64 (9152786134924067309)) (f64 (16261733339291023347)) (f64 (4679975522130968774))
  = [1; 1; 9152786134924067309; 16261733339291023347; 4679975522130968774].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  cs_Track_Plan_fun 4 (f64 (8151614898695976067)) (f64 (12893137314235429181)) (f64 (14260296677792334918))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  cs_Track_Plan_fun 4294967295 (f64 (14974514089842121750)) (f64 (18226622082426371034)) (f64 (8235139553646352161))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  cs_Track_Plan_fun 7 (f64 (1760755291853781209)) (f64 (7003316498408710327)) (f64 (13848145284876509401))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  cs_Track_Plan_fun 1 (f64 (2510031261602642786)) (f64 (11241675061228597153)) (f64 (8261314468442581868))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  cs_Track_Plan_fun 42 (f64 (2542485112579299804)) (f64 (7508411544807361460)) (f64 (14315624355573345112))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  cs_Track_Plan_fun 1 (f64 (18208029706413487351)) (f64 (1197166519593262372)) (f64 (7521209456238897531))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  cs_Track_Plan_fun 42 (f64 (8552902884597268898)) (f64 (2116935737871601810)) (f64 (2236532067662249805))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  cs_Track_Plan_fun 3 (f64 (6419512334812382175)) (f64 (1538640030500552800)) (f64 (17258707137319639785))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  cs_Track_Plan_fun 4 (f64 (1208246617202571148)) (f64 (1441828706974956532)) (f64 (15845671631726810243))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  cs_Track_Plan_fun 1 (f64 (3345870771660928322)) (f64 (4341793384810683281)) (f64 (13033016899199180975))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  cs_Track_Plan_fun 7 (f64 (8195296996820658332)) (f64 (1395219962958929584)) (f64 (3241640254168901158))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  cs_Track_Plan_fun 7 (f64 (9638023875151254389)) (f64 (14059250213617196627)) (f64 (15909145886784043867))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  cs_Track_Plan_fun 4 (f64 (13318900320657698655)) (f64 (4837773011945137677)) (f64 (10481419867945817517))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  cs_Track_Plan_fun 4294967295 (f64 (1365357383859467450)) (f64 (4732749477292834943)) (f64 (16248985302542376683))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  cs_Track_Plan_fun 3 (f64 (14896184550593818647)) (f64 (16854192435376177994)) (f64 (6713235576732597032))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  cs_Track_Plan_fun 2 (f64 (838760151009165046)) (f64 (14270849396685640998)) (f64 (5601579311958539554))
  = [3; 1; 14270849396685640998; 5601579311958539554; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  cs_Track_Plan_fun 4 (f64 (12869493482660031544)) (f64 (1172358256043817086)) (f64 (12111271239445452857))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  cs_Track_Plan_fun 4 (f64 (14782293876092268421)) (f64 (11026799190231022619)) (f64 (12991275732089843179))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  cs_Track_Plan_fun 7 (f64 (12498808615498473073)) (f64 (1583807902100940676)) (f64 (8871800815881071222))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  cs_Track_Plan_fun 4 (f64 (7181644617678918619)) (f64 (3523513632275775383)) (f64 (13136607031641828009))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  cs_Track_Plan_fun 4 (f64 (17657512814657862114)) (f64 (5914750487954392135)) (f64 (14484252655250009330))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  cs_Track_Plan_fun 0 (f64 (8999402389638966185)) (f64 (16214155092559358705)) (f64 (231005582895946161))
  = [1; 1; 8999402389638966185; 16214155092559358705; 231005582895946161].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  cs_Track_Plan_fun 4 (f64 (15390498873227138107)) (f64 (8402124671830944071)) (f64 (12591519501420576454))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  cs_Track_Plan_fun 1 (f64 (3432453108568328457)) (f64 (4457354267575695532)) (f64 (13179715393744851092))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  cs_Track_Plan_fun 2 (f64 (7865834945098176729)) (f64 (11161730203998888848)) (f64 (9291276240388233405))
  = [3; 1; 11161730203998888848; 9291276240388233405; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  cs_Track_Plan_fun 7 (f64 (7709724738049030286)) (f64 (11202437920513779601)) (f64 (3285685384559570666))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  cs_Track_Plan_fun 0 (f64 (3121599112381061470)) (f64 (16802929650110130041)) (f64 (10099924268678385819))
  = [1; 1; 3121599112381061470; 16802929650110130041; 10099924268678385819].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  cs_Track_Plan_fun 4 (f64 (16946174333923525905)) (f64 (7858572076167815995)) (f64 (3174974220143820966))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  cs_Track_Plan_fun 2 (f64 (14935011889913057185)) (f64 (8696586636150016962)) (f64 (4913138918277714094))
  = [3; 1; 8696586636150016962; 4913138918277714094; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  cs_Track_Plan_fun 1 (f64 (2578541304239151533)) (f64 (4139289620679912518)) (f64 (2041237765717275280))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  cs_Track_Plan_fun 42 (f64 (7891208600144810089)) (f64 (3943661347311760848)) (f64 (2993479960355885744))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  cs_Track_Plan_fun 3 (f64 (2577692129740157534)) (f64 (6823014831413964970)) (f64 (58630657274167391))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  cs_Track_Plan_fun 7 (f64 (15293279165957292468)) (f64 (3195995017088939277)) (f64 (2555606733497964348))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  cs_Track_Plan_fun 4 (f64 (2738711215464667115)) (f64 (17041420664755113056)) (f64 (9314258104227758821))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  cs_Track_Plan_fun 0 (f64 (4493365539219695052)) (f64 (1579036222455758554)) (f64 (13515517916820580228))
  = [1; 1; 4493365539219695052; 1579036222455758554; 13515517916820580228].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  cs_Track_Plan_fun 7 (f64 (2304939003868596835)) (f64 (7784217649207839702)) (f64 (1116981080820541180))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  cs_Track_Plan_fun 42 (f64 (14941852555636040698)) (f64 (1604783965642966772)) (f64 (3362754463970791981))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  cs_Track_Plan_fun 4 (f64 (6131437772270139860)) (f64 (4220024596634628889)) (f64 (15629069870224855034))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  cs_Track_Plan_fun 4294967295 (f64 (14651642722140626665)) (f64 (5752130442806048238)) (f64 (14844064156055485397))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  cs_Track_Plan_fun 42 (f64 (11475133019941797101)) (f64 (3004626064377386651)) (f64 (18339868770135647499))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  cs_Track_Plan_fun 2 (f64 (9720971105001399677)) (f64 (6370082740200155859)) (f64 (5248251586397683137))
  = [3; 1; 6370082740200155859; 5248251586397683137; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  cs_Track_Plan_fun 3 (f64 (11399754259592755496)) (f64 (1747252767297666520)) (f64 (4679034770646012935))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  cs_Track_Plan_fun 2 (f64 (123848281662996350)) (f64 (18025189148251629321)) (f64 (11283676765001085140))
  = [3; 1; 18025189148251629321; 11283676765001085140; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  cs_Track_Plan_fun 42 (f64 (12861963016504849327)) (f64 (2708812292052934399)) (f64 (7551221707669065769))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  cs_Track_Plan_fun 3 (f64 (9689992545480252322)) (f64 (6583808171494632605)) (f64 (3061313594801376345))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  cs_Track_Plan_fun 4 (f64 (4999106047235282822)) (f64 (16716926941785674068)) (f64 (7392965965076923446))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  cs_Track_Plan_fun 2 (f64 (8524113580594297491)) (f64 (5674490558720171801)) (f64 (10833916010332696213))
  = [3; 1; 5674490558720171801; 10833916010332696213; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  cs_Track_Plan_fun 3 (f64 (28593259719117078)) (f64 (9253001332293285311)) (f64 (2527846881105446800))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  cs_Track_Plan_fun 4294967295 (f64 (15526410207232469155)) (f64 (17015868037717095297)) (f64 (7360296547683953583))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  cs_Track_Plan_fun 1 (f64 (5081299641515847674)) (f64 (11863156011794202629)) (f64 (1150964392070258424))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  cs_Track_Plan_fun 0 (f64 (6078240384626653749)) (f64 (2177489007956282737)) (f64 (15043145718475774815))
  = [1; 1; 6078240384626653749; 2177489007956282737; 15043145718475774815].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  cs_Track_Plan_fun 0 (f64 (12744559061359738549)) (f64 (13514629620394746156)) (f64 (14149282096122481812))
  = [1; 1; 12744559061359738549; 13514629620394746156; 14149282096122481812].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  cs_Track_Plan_fun 42 (f64 (9799512943978215685)) (f64 (11012503779521687061)) (f64 (5523656990183803296))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  cs_Track_Plan_fun 2 (f64 (12009119507567377033)) (f64 (15684025595639880244)) (f64 (15104267311362763124))
  = [3; 1; 15684025595639880244; 15104267311362763124; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  cs_Track_Plan_fun 7 (f64 (133822987523481820)) (f64 (8652063085539302080)) (f64 (2822492153229343751))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  cs_Track_Plan_fun 0 (f64 (17590226521769071280)) (f64 (4450308219770177860)) (f64 (4772915335292462032))
  = [1; 1; 17590226521769071280; 4450308219770177860; 4772915335292462032].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  cs_Track_Plan_fun 42 (f64 (2954986597786487931)) (f64 (17021162848045202231)) (f64 (3619097704202357773))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  cs_Track_Plan_fun 7 (f64 (14971679411211714418)) (f64 (12292540549159386398)) (f64 (10458062882118808521))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  cs_Track_Plan_fun 42 (f64 (1007938417709105658)) (f64 (12382556964619508878)) (f64 (12786758439829183193))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  cs_Track_Plan_fun 4 (f64 (6635228920165914263)) (f64 (9812765178329295185)) (f64 (1228164481305995068))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  cs_Track_Plan_fun 1 (f64 (5780870622810245146)) (f64 (1628316063543713503)) (f64 (18090831035652988213))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  cs_Track_Plan_fun 4294967295 (f64 (9341131616035532702)) (f64 (4131991767223299508)) (f64 (15458596417249769596))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  cs_Track_Plan_fun 3 (f64 (2403983635246086126)) (f64 (15413165933164770805)) (f64 (2245290850285006617))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  cs_Track_Plan_fun 3 (f64 (15933468479082798373)) (f64 (15029214104204307854)) (f64 (16649056866443450858))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  cs_Track_Plan_fun 0 (f64 (17474523402880956203)) (f64 (10147409382839189306)) (f64 (7318942927505504201))
  = [1; 1; 17474523402880956203; 10147409382839189306; 7318942927505504201].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  cs_Track_Plan_fun 2 (f64 (14487968570367444401)) (f64 (16082446305002438171)) (f64 (10630495392524563115))
  = [3; 1; 16082446305002438171; 10630495392524563115; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  cs_Track_Plan_fun 42 (f64 (14895487948028375216)) (f64 (17745195189761933297)) (f64 (8409459536388984282))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  cs_Track_Plan_fun 3 (f64 (1791786692542148058)) (f64 (16923601940872491412)) (f64 (16849285432018117196))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  cs_Track_Plan_fun 3 (f64 (17012114635259226884)) (f64 (2532187446956625837)) (f64 (12391643732376184502))
  = [4; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  cs_Track_Plan_fun 42 (f64 (12313090834004784403)) (f64 (2159051216891157835)) (f64 (16219209696348507370))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  cs_Track_Plan_fun 7 (f64 (9640496507481966598)) (f64 (1701728213002104457)) (f64 (13521355343344052921))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  cs_Track_Plan_fun 4294967295 (f64 (8007603473610414103)) (f64 (212047258774162866)) (f64 (16091968841057945669))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  cs_Track_Plan_fun 1 (f64 (16075026979827535072)) (f64 (10484669262404726845)) (f64 (15742778306740888273))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  cs_Track_Plan_fun 1 (f64 (3441795057818896288)) (f64 (17161149144402290301)) (f64 (7382843385869143850))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_1000 :
  cs_Track_Plan_fun 2 (f64 (12901049471765273379)) (f64 (16480616446050972712)) (f64 (1329364398906417342))
  = [3; 1; 16480616446050972712; 1329364398906417342; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_1001 :
  cs_Track_Plan_fun 42 (f64 (7571943189588218509)) (f64 (16293447062382514647)) (f64 (10470838415141408151))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_1002 :
  cs_Track_Plan_fun 7 (f64 (1929451779906600173)) (f64 (209223213506411829)) (f64 (8425259097323351997))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_1003 :
  cs_Track_Plan_fun 1 (f64 (11457355408435998584)) (f64 (4017008183653658366)) (f64 (11822131561628635737))
  = [2; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example t_1004 :
  cs_Track_Plan_fun 7 (f64 (14178324143819344397)) (f64 (9172602347107760054)) (f64 (11641531174863934461))
  = [0; 1; 0; 0; 0].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  cs_Track_Plan_fun 0 (f64 (4608308318706860032)) (f64 (9223372036854775808)) (f64 (4593671619917905920))
  <> [0; 1; 4608308318706860032; 9223372036854775808; 4593671619917905920].
Proof. vm_compute. discriminate. Qed.
