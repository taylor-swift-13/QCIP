(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import OUTPUT.orbiter_new.BinarySearch_New.rocq.spec.

Import ListNotations.
Local Open Scope Z_scope.


Example t_0000 :
  binarySearch_New_fun [426; 426; 428; 436; 439; 444; 448; 454; 456; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0001 :
  binarySearch_New_fun [803; 780; 783; 788; 790; 793; 798; 799; 803; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0002 :
  binarySearch_New_fun [253; 244; 247; 252; 253; 260; 266; 269; 278; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0003 :
  binarySearch_New_fun [589; 589; 590; 599; 604; 609; 611; 613; 622; 0; 2]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0004 :
  binarySearch_New_fun [343; 334; 336; 338; 341; 342; 344; 350; 358; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0005 :
  binarySearch_New_fun [435; 415; 416; 422; 431; 436; 444; 450; 456; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0006 :
  binarySearch_New_fun [209; 209; 218; 223; 231; 240; 249; 252; 255; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0007 :
  binarySearch_New_fun [771; 749; 752; 756; 758; 762; 768; 769; 771; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0008 :
  binarySearch_New_fun [315; 302; 303; 312; 315; 317; 323; 330; 331; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0009 :
  binarySearch_New_fun [910; 895; 902; 906; 908; 910; 919; 925; 931; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0010 :
  binarySearch_New_fun [780; 761; 762; 766; 770; 779; 781; 783; 788; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0011 :
  binarySearch_New_fun [657; 649; 652; 658; 667; 673; 682; 687; 693; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0012 :
  binarySearch_New_fun [460; 460; 461; 465; 467; 468; 477; 486; 495; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0013 :
  binarySearch_New_fun [73; 37; 43; 50; 51; 55; 63; 72; 73; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0014 :
  binarySearch_New_fun [917; 900; 904; 912; 917; 925; 931; 934; 938; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0015 :
  binarySearch_New_fun [702; 675; 683; 692; 700; 702; 709; 712; 719; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0016 :
  binarySearch_New_fun [565; 548; 550; 555; 561; 562; 564; 565; 570; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0017 :
  binarySearch_New_fun [402; 403; 404; 406; 408; 414; 423; 429; 438; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0018 :
  binarySearch_New_fun [814; 814; 818; 826; 834; 839; 846; 855; 862; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0019 :
  binarySearch_New_fun [378; 349; 355; 360; 364; 367; 368; 370; 378; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0020 :
  binarySearch_New_fun [360; 349; 351; 357; 360; 367; 370; 378; 387; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0021 :
  binarySearch_New_fun [713; 697; 701; 704; 710; 713; 718; 721; 730; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0022 :
  binarySearch_New_fun [717; 681; 682; 688; 693; 698; 703; 709; 716; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0023 :
  binarySearch_New_fun [963; 946; 949; 953; 956; 964; 971; 972; 974; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0024 :
  binarySearch_New_fun [446; 446; 452; 454; 458; 464; 470; 478; 481; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0025 :
  binarySearch_New_fun [110; 77; 84; 85; 89; 95; 102; 109; 110; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0026 :
  binarySearch_New_fun [39; 28; 36; 38; 39; 43; 49; 57; 66; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0027 :
  binarySearch_New_fun [94; 94; 103; 105; 112; 120; 128; 135; 138; 0; 4]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0028 :
  binarySearch_New_fun [714; 697; 702; 709; 713; 715; 719; 728; 735; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0029 :
  binarySearch_New_fun [523; 521; 524; 528; 534; 542; 548; 550; 559; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0030 :
  binarySearch_New_fun [737; 737; 744; 750; 751; 752; 758; 766; 770; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0031 :
  binarySearch_New_fun [771; 742; 743; 752; 756; 758; 759; 762; 771; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0032 :
  binarySearch_New_fun [493; 475; 481; 486; 493; 499; 500; 504; 507; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0033 :
  binarySearch_New_fun [806; 797; 804; 806; 813; 818; 822; 828; 830; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0034 :
  binarySearch_New_fun [353; 333; 340; 347; 352; 358; 361; 366; 370; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0035 :
  binarySearch_New_fun [950; 948; 951; 960; 967; 968; 973; 981; 990; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0036 :
  binarySearch_New_fun [318; 318; 320; 329; 337; 339; 342; 345; 350; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0037 :
  binarySearch_New_fun [160; 125; 129; 137; 140; 142; 147; 153; 160; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0038 :
  binarySearch_New_fun [331; 318; 320; 322; 331; 333; 341; 347; 349; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0039 :
  binarySearch_New_fun [557; 557; 561; 563; 565; 566; 573; 580; 583; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0040 :
  binarySearch_New_fun [409; 401; 402; 408; 410; 418; 422; 428; 431; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0041 :
  binarySearch_New_fun [802; 780; 788; 795; 803; 806; 811; 814; 817; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0042 :
  binarySearch_New_fun [311; 311; 320; 326; 330; 337; 339; 340; 342; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0043 :
  binarySearch_New_fun [360; 323; 330; 336; 339; 346; 353; 354; 360; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0044 :
  binarySearch_New_fun [530; 509; 512; 521; 530; 531; 540; 544; 553; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0045 :
  binarySearch_New_fun [298; 282; 291; 298; 302; 305; 314; 318; 321; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0046 :
  binarySearch_New_fun [148; 128; 133; 134; 136; 140; 147; 153; 160; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0047 :
  binarySearch_New_fun [156; 139; 141; 149; 157; 159; 165; 174; 182; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0048 :
  binarySearch_New_fun [830; 830; 837; 838; 843; 850; 854; 855; 858; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0049 :
  binarySearch_New_fun [771; 737; 741; 748; 749; 755; 764; 767; 771; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0050 :
  binarySearch_New_fun [681; 665; 672; 674; 681; 690; 696; 698; 706; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0051 :
  binarySearch_New_fun [696; 679; 685; 693; 695; 696; 701; 704; 710; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0052 :
  binarySearch_New_fun [667; 639; 643; 644; 651; 653; 662; 666; 675; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0053 :
  binarySearch_New_fun [630; 625; 631; 635; 642; 643; 649; 657; 658; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0054 :
  binarySearch_New_fun [912; 912; 914; 919; 921; 923; 925; 927; 932; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0055 :
  binarySearch_New_fun [606; 572; 574; 579; 583; 588; 594; 599; 606; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0056 :
  binarySearch_New_fun [551; 530; 536; 544; 551; 554; 555; 562; 565; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0057 :
  binarySearch_New_fun [702; 696; 699; 702; 711; 717; 718; 726; 733; 2; 3]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0058 :
  binarySearch_New_fun [584; 557; 566; 568; 577; 583; 590; 599; 606; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0059 :
  binarySearch_New_fun [847; 830; 838; 840; 848; 854; 863; 866; 869; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0060 :
  binarySearch_New_fun [468; 468; 474; 479; 482; 491; 498; 502; 506; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0061 :
  binarySearch_New_fun [628; 605; 608; 617; 618; 620; 622; 624; 628; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0062 :
  binarySearch_New_fun [889; 870; 875; 881; 889; 892; 893; 895; 901; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0063 :
  binarySearch_New_fun [761; 733; 739; 746; 754; 761; 762; 771; 780; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0064 :
  binarySearch_New_fun [284; 278; 283; 285; 287; 296; 303; 305; 314; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0065 :
  binarySearch_New_fun [886; 878; 880; 887; 894; 899; 902; 911; 920; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0066 :
  binarySearch_New_fun [127; 127; 128; 133; 141; 142; 145; 148; 156; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0067 :
  binarySearch_New_fun [379; 342; 348; 356; 363; 367; 370; 378; 379; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0068 :
  binarySearch_New_fun [461; 450; 459; 460; 461; 470; 478; 482; 486; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0069 :
  binarySearch_New_fun [955; 947; 951; 952; 955; 963; 966; 975; 983; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0070 :
  binarySearch_New_fun [466; 421; 427; 435; 443; 449; 451; 456; 465; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0071 :
  binarySearch_New_fun [764; 755; 764; 765; 773; 779; 788; 795; 804; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0072 :
  binarySearch_New_fun [14; 14; 19; 21; 24; 33; 38; 41; 49; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0073 :
  binarySearch_New_fun [637; 600; 608; 612; 619; 625; 626; 634; 637; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0074 :
  binarySearch_New_fun [1005; 995; 996; 1002; 1005; 1014; 1021; 1026; 1028; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0075 :
  binarySearch_New_fun [502; 502; 503; 508; 516; 518; 525; 527; 536; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0076 :
  binarySearch_New_fun [843; 836; 840; 842; 848; 850; 855; 858; 864; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0077 :
  binarySearch_New_fun [853; 854; 860; 863; 864; 868; 873; 876; 882; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0078 :
  binarySearch_New_fun [603; 603; 611; 614; 618; 625; 627; 628; 637; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0079 :
  binarySearch_New_fun [139; 110; 113; 116; 120; 129; 133; 136; 139; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0080 :
  binarySearch_New_fun [475; 460; 468; 474; 475; 479; 482; 484; 493; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0081 :
  binarySearch_New_fun [223; 218; 223; 231; 235; 242; 243; 245; 246; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0082 :
  binarySearch_New_fun [564; 536; 541; 544; 545; 550; 554; 559; 563; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0083 :
  binarySearch_New_fun [344; 345; 350; 353; 354; 361; 368; 375; 383; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0084 :
  binarySearch_New_fun [440; 440; 441; 442; 443; 446; 447; 450; 455; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0085 :
  binarySearch_New_fun [982; 948; 955; 964; 969; 972; 976; 980; 982; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0086 :
  binarySearch_New_fun [428; 418; 420; 424; 428; 436; 440; 447; 454; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0087 :
  binarySearch_New_fun [803; 789; 795; 799; 803; 804; 805; 813; 820; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0088 :
  binarySearch_New_fun [333; 299; 304; 310; 316; 321; 323; 332; 333; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0089 :
  binarySearch_New_fun [712; 695; 697; 703; 711; 713; 714; 715; 718; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0090 :
  binarySearch_New_fun [376; 376; 385; 393; 402; 404; 412; 419; 423; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0091 :
  binarySearch_New_fun [659; 616; 620; 626; 634; 641; 649; 651; 659; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0092 :
  binarySearch_New_fun [197; 189; 192; 194; 197; 204; 209; 212; 218; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0093 :
  binarySearch_New_fun [853; 849; 853; 861; 863; 867; 869; 871; 877; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0094 :
  binarySearch_New_fun [974; 967; 969; 973; 981; 986; 993; 1002; 1009; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0095 :
  binarySearch_New_fun [823; 824; 831; 839; 842; 851; 856; 860; 862; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0096 :
  binarySearch_New_fun [1013; 1013; 1022; 1026; 1029; 1030; 1035; 1036; 1044; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0097 :
  binarySearch_New_fun [334; 309; 310; 311; 313; 321; 323; 332; 334; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0098 :
  binarySearch_New_fun [712; 702; 704; 706; 712; 718; 722; 727; 732; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0099 :
  binarySearch_New_fun [1018; 1002; 1004; 1010; 1018; 1021; 1023; 1030; 1038; 3; 4]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0100 :
  binarySearch_New_fun [1029; 990; 994; 998; 999; 1006; 1012; 1020; 1028; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0101 :
  binarySearch_New_fun [885; 872; 879; 886; 887; 896; 904; 912; 920; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0102 :
  binarySearch_New_fun [203; 203; 206; 209; 210; 215; 224; 228; 237; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0103 :
  binarySearch_New_fun [547; 517; 520; 521; 524; 528; 536; 538; 547; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0104 :
  binarySearch_New_fun [347; 335; 337; 339; 347; 355; 357; 359; 365; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0105 :
  binarySearch_New_fun [393; 370; 376; 379; 386; 393; 401; 403; 409; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0106 :
  binarySearch_New_fun [556; 512; 520; 529; 537; 539; 541; 549; 555; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0107 :
  binarySearch_New_fun [194; 193; 195; 197; 206; 213; 221; 227; 236; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0108 :
  binarySearch_New_fun [804; 804; 808; 812; 818; 821; 824; 833; 837; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0109 :
  binarySearch_New_fun [159; 133; 137; 139; 140; 149; 152; 154; 159; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0110 :
  binarySearch_New_fun [922; 901; 906; 915; 922; 926; 934; 943; 947; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0111 :
  binarySearch_New_fun [239; 235; 239; 248; 249; 258; 262; 268; 277; 1; 2]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0112 :
  binarySearch_New_fun [676; 648; 655; 659; 664; 665; 667; 673; 675; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0113 :
  binarySearch_New_fun [809; 797; 803; 810; 814; 818; 822; 827; 833; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0114 :
  binarySearch_New_fun [739; 739; 743; 750; 755; 762; 768; 774; 775; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0115 :
  binarySearch_New_fun [97; 67; 70; 77; 79; 84; 90; 95; 97; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0116 :
  binarySearch_New_fun [569; 550; 559; 568; 569; 570; 577; 583; 586; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0117 :
  binarySearch_New_fun [624; 602; 610; 618; 623; 624; 627; 636; 637; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0118 :
  binarySearch_New_fun [616; 589; 595; 601; 609; 615; 617; 618; 621; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0119 :
  binarySearch_New_fun [613; 613; 614; 623; 631; 633; 640; 647; 648; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0120 :
  binarySearch_New_fun [541; 541; 549; 554; 563; 570; 579; 588; 596; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0121 :
  binarySearch_New_fun [717; 685; 694; 696; 704; 710; 713; 714; 717; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0122 :
  binarySearch_New_fun [312; 287; 295; 304; 312; 316; 319; 323; 329; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0123 :
  binarySearch_New_fun [899; 890; 895; 899; 902; 903; 912; 913; 917; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0124 :
  binarySearch_New_fun [161; 133; 142; 145; 153; 160; 168; 170; 178; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0125 :
  binarySearch_New_fun [64; 54; 56; 57; 65; 73; 78; 85; 92; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0126 :
  binarySearch_New_fun [779; 779; 785; 792; 798; 799; 800; 806; 814; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0127 :
  binarySearch_New_fun [516; 481; 489; 497; 501; 504; 506; 507; 516; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0128 :
  binarySearch_New_fun [586; 572; 575; 578; 586; 594; 602; 606; 608; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0129 :
  binarySearch_New_fun [869; 853; 862; 863; 869; 872; 874; 876; 879; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0130 :
  binarySearch_New_fun [267; 236; 245; 246; 248; 251; 255; 261; 266; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0131 :
  binarySearch_New_fun [955; 953; 956; 962; 971; 975; 977; 984; 993; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0132 :
  binarySearch_New_fun [594; 594; 598; 600; 608; 614; 621; 623; 632; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0133 :
  binarySearch_New_fun [441; 406; 408; 415; 420; 427; 434; 437; 441; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0134 :
  binarySearch_New_fun [264; 259; 261; 262; 264; 265; 270; 277; 283; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0135 :
  binarySearch_New_fun [651; 642; 651; 654; 657; 663; 667; 671; 679; 1; 1]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0136 :
  binarySearch_New_fun [440; 400; 408; 413; 415; 423; 430; 432; 439; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0137 :
  binarySearch_New_fun [373; 362; 366; 374; 381; 384; 391; 395; 401; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0138 :
  binarySearch_New_fun [797; 797; 800; 809; 816; 821; 827; 836; 838; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0139 :
  binarySearch_New_fun [693; 647; 653; 661; 667; 676; 680; 687; 693; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0140 :
  binarySearch_New_fun [931; 909; 916; 925; 931; 933; 936; 942; 944; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0141 :
  binarySearch_New_fun [515; 508; 515; 524; 531; 539; 544; 553; 560; 1; 3]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0142 :
  binarySearch_New_fun [1030; 1003; 1007; 1014; 1016; 1020; 1029; 1038; 1045; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0143 :
  binarySearch_New_fun [956; 933; 939; 946; 953; 957; 965; 966; 972; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0144 :
  binarySearch_New_fun [708; 708; 715; 716; 718; 726; 734; 738; 742; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0145 :
  binarySearch_New_fun [676; 656; 658; 661; 662; 663; 664; 673; 676; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0146 :
  binarySearch_New_fun [883; 867; 871; 876; 883; 886; 890; 899; 905; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0147 :
  binarySearch_New_fun [395; 379; 385; 392; 395; 397; 400; 403; 404; 3; 5]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0148 :
  binarySearch_New_fun [780; 759; 760; 768; 777; 779; 780; 786; 793; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0149 :
  binarySearch_New_fun [305; 293; 296; 305; 306; 307; 313; 319; 328; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0150 :
  binarySearch_New_fun [343; 343; 350; 355; 361; 364; 370; 377; 378; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0151 :
  binarySearch_New_fun [947; 920; 928; 931; 936; 938; 942; 943; 947; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0152 :
  binarySearch_New_fun [334; 326; 332; 333; 334; 341; 345; 346; 352; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0153 :
  binarySearch_New_fun [841; 832; 834; 841; 842; 843; 849; 858; 860; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0154 :
  binarySearch_New_fun [400; 365; 374; 382; 385; 392; 394; 399; 400; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0155 :
  binarySearch_New_fun [54; 44; 45; 48; 51; 55; 58; 64; 73; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0156 :
  binarySearch_New_fun [926; 926; 929; 938; 940; 942; 950; 953; 960; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0157 :
  binarySearch_New_fun [91; 51; 57; 63; 64; 72; 78; 84; 91; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0158 :
  binarySearch_New_fun [187; 175; 178; 179; 187; 196; 205; 206; 214; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0159 :
  binarySearch_New_fun [405; 396; 398; 405; 410; 413; 417; 422; 429; 2; 5]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0160 :
  binarySearch_New_fun [941; 917; 925; 932; 940; 941; 947; 951; 958; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0161 :
  binarySearch_New_fun [122; 101; 106; 110; 117; 123; 127; 133; 134; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0162 :
  binarySearch_New_fun [932; 932; 940; 944; 950; 951; 953; 961; 970; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0163 :
  binarySearch_New_fun [790; 755; 759; 767; 773; 778; 783; 784; 790; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0164 :
  binarySearch_New_fun [877; 866; 873; 875; 877; 881; 886; 890; 893; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0165 :
  binarySearch_New_fun [165; 165; 169; 171; 180; 188; 195; 202; 207; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0166 :
  binarySearch_New_fun [279; 267; 276; 278; 285; 293; 294; 300; 302; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0167 :
  binarySearch_New_fun [462; 448; 449; 458; 460; 463; 466; 469; 478; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0168 :
  binarySearch_New_fun [677; 677; 685; 690; 697; 705; 709; 715; 720; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0169 :
  binarySearch_New_fun [822; 783; 790; 795; 804; 809; 811; 814; 822; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0170 :
  binarySearch_New_fun [753; 734; 743; 750; 753; 756; 757; 761; 764; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0171 :
  binarySearch_New_fun [387; 362; 371; 380; 385; 387; 388; 395; 403; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0172 :
  binarySearch_New_fun [702; 683; 685; 687; 690; 691; 699; 701; 709; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0173 :
  binarySearch_New_fun [46; 46; 47; 52; 56; 60; 69; 73; 78; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0174 :
  binarySearch_New_fun [409; 409; 418; 426; 430; 436; 443; 448; 455; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0175 :
  binarySearch_New_fun [392; 364; 365; 374; 376; 383; 384; 391; 392; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0176 :
  binarySearch_New_fun [816; 804; 807; 808; 816; 819; 821; 825; 828; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0177 :
  binarySearch_New_fun [320; 306; 310; 311; 316; 320; 324; 331; 340; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0178 :
  binarySearch_New_fun [1014; 1008; 1013; 1020; 1021; 1024; 1027; 1032; 1035; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0179 :
  binarySearch_New_fun [685; 685; 686; 693; 697; 701; 710; 717; 718; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0180 :
  binarySearch_New_fun [475; 475; 484; 491; 500; 508; 514; 519; 525; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0181 :
  binarySearch_New_fun [726; 688; 697; 706; 710; 712; 717; 718; 726; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0182 :
  binarySearch_New_fun [413; 404; 405; 410; 413; 415; 418; 427; 432; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0183 :
  binarySearch_New_fun [465; 449; 457; 463; 465; 473; 478; 483; 485; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0184 :
  binarySearch_New_fun [897; 857; 864; 871; 875; 881; 889; 893; 896; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0185 :
  binarySearch_New_fun [134; 135; 143; 152; 153; 155; 159; 162; 170; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0186 :
  binarySearch_New_fun [13; 13; 14; 15; 16; 21; 30; 33; 42; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0187 :
  binarySearch_New_fun [796; 755; 763; 765; 774; 782; 790; 791; 796; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0188 :
  binarySearch_New_fun [752; 732; 738; 745; 752; 760; 769; 774; 783; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0189 :
  binarySearch_New_fun [867; 850; 857; 864; 867; 870; 871; 879; 884; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0190 :
  binarySearch_New_fun [115; 80; 87; 92; 99; 104; 107; 114; 121; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0191 :
  binarySearch_New_fun [732; 716; 724; 730; 733; 735; 744; 753; 761; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0192 :
  binarySearch_New_fun [137; 137; 139; 144; 151; 159; 161; 164; 166; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0193 :
  binarySearch_New_fun [664; 628; 633; 638; 639; 644; 649; 656; 664; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0194 :
  binarySearch_New_fun [688; 672; 677; 681; 688; 690; 696; 698; 705; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0195 :
  binarySearch_New_fun [1014; 986; 994; 996; 1005; 1014; 1015; 1016; 1023; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0196 :
  binarySearch_New_fun [475; 469; 474; 477; 485; 488; 490; 493; 495; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0197 :
  binarySearch_New_fun [642; 635; 643; 644; 649; 651; 660; 669; 672; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0198 :
  binarySearch_New_fun [970; 970; 972; 981; 990; 996; 998; 1006; 1007; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0199 :
  binarySearch_New_fun [648; 614; 621; 624; 629; 634; 643; 647; 648; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0200 :
  binarySearch_New_fun [474; 462; 467; 473; 474; 480; 489; 498; 501; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0201 :
  binarySearch_New_fun [894; 867; 876; 885; 887; 894; 899; 902; 911; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0202 :
  binarySearch_New_fun [44; 16; 17; 19; 25; 34; 39; 43; 47; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0203 :
  binarySearch_New_fun [349; 343; 350; 351; 358; 364; 369; 374; 383; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0204 :
  binarySearch_New_fun [716; 716; 722; 723; 728; 730; 734; 741; 750; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0205 :
  binarySearch_New_fun [826; 780; 788; 797; 802; 810; 817; 822; 826; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0206 :
  binarySearch_New_fun [785; 776; 779; 783; 785; 787; 790; 795; 799; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0207 :
  binarySearch_New_fun [316; 295; 297; 300; 307; 316; 324; 325; 331; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0208 :
  binarySearch_New_fun [638; 608; 616; 617; 621; 622; 628; 637; 643; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0209 :
  binarySearch_New_fun [234; 215; 223; 232; 235; 240; 244; 247; 248; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0210 :
  binarySearch_New_fun [958; 958; 961; 966; 973; 978; 981; 985; 987; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0211 :
  binarySearch_New_fun [406; 372; 379; 386; 388; 392; 394; 401; 406; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0212 :
  binarySearch_New_fun [817; 800; 808; 815; 817; 818; 824; 825; 829; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0213 :
  binarySearch_New_fun [706; 705; 706; 709; 718; 724; 733; 738; 741; 1; 4]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0214 :
  binarySearch_New_fun [52; 36; 37; 44; 51; 59; 67; 72; 81; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0215 :
  binarySearch_New_fun [995; 992; 995; 996; 997; 1000; 1006; 1011; 1013; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0216 :
  binarySearch_New_fun [751; 751; 758; 765; 772; 778; 787; 788; 795; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0217 :
  binarySearch_New_fun [457; 426; 431; 438; 439; 440; 447; 450; 457; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0218 :
  binarySearch_New_fun [143; 123; 126; 135; 143; 148; 156; 159; 167; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0219 :
  binarySearch_New_fun [85; 72; 75; 81; 85; 89; 98; 104; 109; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0220 :
  binarySearch_New_fun [414; 386; 392; 397; 398; 404; 413; 418; 426; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0221 :
  binarySearch_New_fun [967; 963; 964; 968; 972; 978; 985; 990; 995; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0222 :
  binarySearch_New_fun [532; 532; 537; 545; 549; 551; 558; 562; 565; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0223 :
  binarySearch_New_fun [278; 243; 249; 254; 261; 268; 269; 273; 278; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0224 :
  binarySearch_New_fun [409; 393; 395; 402; 409; 417; 418; 425; 430; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0225 :
  binarySearch_New_fun [209; 202; 206; 209; 213; 217; 226; 228; 234; 2; 3]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0226 :
  binarySearch_New_fun [296; 286; 295; 298; 307; 311; 320; 324; 333; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0227 :
  binarySearch_New_fun [429; 421; 423; 430; 439; 440; 443; 449; 451; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0228 :
  binarySearch_New_fun [243; 243; 251; 258; 264; 273; 277; 282; 286; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0229 :
  binarySearch_New_fun [1007; 982; 991; 992; 994; 996; 1001; 1005; 1007; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0230 :
  binarySearch_New_fun [83; 59; 67; 74; 83; 90; 99; 108; 113; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0231 :
  binarySearch_New_fun [272; 260; 265; 269; 272; 279; 280; 284; 293; 3; 5]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0232 :
  binarySearch_New_fun [90; 65; 74; 81; 89; 91; 96; 103; 111; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0233 :
  binarySearch_New_fun [800; 792; 799; 801; 809; 811; 817; 819; 826; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0234 :
  binarySearch_New_fun [28; 28; 37; 41; 46; 51; 54; 55; 62; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0235 :
  binarySearch_New_fun [867; 837; 846; 850; 854; 858; 865; 866; 867; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0236 :
  binarySearch_New_fun [191; 174; 183; 185; 191; 195; 198; 200; 205; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0237 :
  binarySearch_New_fun [701; 687; 691; 693; 701; 709; 715; 720; 724; 3; 4]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0238 :
  binarySearch_New_fun [162; 138; 145; 149; 154; 161; 169; 177; 183; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0239 :
  binarySearch_New_fun [913; 896; 905; 912; 914; 917; 926; 928; 937; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0240 :
  binarySearch_New_fun [220; 220; 225; 233; 240; 249; 254; 260; 269; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0241 :
  binarySearch_New_fun [679; 654; 655; 662; 664; 669; 673; 676; 679; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0242 :
  binarySearch_New_fun [948; 930; 935; 941; 948; 951; 960; 963; 970; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0243 :
  binarySearch_New_fun [99; 97; 99; 105; 111; 119; 126; 128; 135; 1; 5]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0244 :
  binarySearch_New_fun [488; 456; 465; 471; 480; 487; 489; 490; 499; 1; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0245 :
  binarySearch_New_fun [26; 22; 25; 27; 33; 40; 43; 46; 53; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0246 :
  binarySearch_New_fun [991; 991; 995; 996; 1001; 1010; 1017; 1019; 1026; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0247 :
  binarySearch_New_fun [914; 864; 872; 881; 890; 897; 900; 909; 914; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0248 :
  binarySearch_New_fun [481; 462; 467; 474; 481; 488; 490; 491; 496; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0249 :
  binarySearch_New_fun [579; 570; 572; 577; 579; 586; 587; 596; 599; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0250 :
  binarySearch_New_fun [697; 652; 657; 661; 670; 678; 686; 691; 696; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0251 :
  binarySearch_New_fun [351; 352; 353; 356; 360; 362; 365; 371; 373; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0252 :
  binarySearch_New_fun [559; 559; 562; 568; 570; 577; 586; 588; 591; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0253 :
  binarySearch_New_fun [886; 842; 851; 852; 858; 865; 872; 878; 886; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0254 :
  binarySearch_New_fun [355; 339; 345; 352; 355; 359; 363; 371; 375; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0255 :
  binarySearch_New_fun [431; 419; 423; 431; 435; 442; 443; 448; 454; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0256 :
  binarySearch_New_fun [186; 178; 179; 185; 187; 194; 198; 203; 212; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0257 :
  binarySearch_New_fun [186; 172; 180; 187; 189; 193; 201; 205; 206; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0258 :
  binarySearch_New_fun [400; 400; 403; 408; 412; 419; 425; 427; 434; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0259 :
  binarySearch_New_fun [67; 38; 40; 47; 54; 57; 58; 61; 67; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0260 :
  binarySearch_New_fun [28; 20; 22; 23; 28; 32; 39; 47; 54; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0261 :
  binarySearch_New_fun [337; 330; 337; 344; 353; 356; 364; 366; 370; 1; 1]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0262 :
  binarySearch_New_fun [1000; 981; 987; 991; 999; 1006; 1008; 1013; 1020; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0263 :
  binarySearch_New_fun [142; 133; 141; 143; 148; 155; 157; 158; 161; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0264 :
  binarySearch_New_fun [547; 547; 553; 562; 563; 566; 573; 581; 590; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0265 :
  binarySearch_New_fun [262; 234; 242; 243; 244; 248; 251; 260; 262; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0266 :
  binarySearch_New_fun [153; 138; 140; 144; 153; 159; 163; 168; 175; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0267 :
  binarySearch_New_fun [278; 260; 269; 278; 281; 286; 295; 297; 306; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0268 :
  binarySearch_New_fun [643; 616; 620; 628; 630; 633; 635; 642; 651; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0269 :
  binarySearch_New_fun [614; 614; 615; 623; 630; 634; 643; 645; 648; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0270 :
  binarySearch_New_fun [166; 166; 172; 180; 185; 190; 195; 196; 197; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0271 :
  binarySearch_New_fun [922; 889; 898; 900; 904; 909; 912; 920; 922; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0272 :
  binarySearch_New_fun [474; 456; 458; 465; 474; 480; 483; 487; 491; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0273 :
  binarySearch_New_fun [148; 148; 149; 157; 159; 161; 162; 168; 172; 0; 4]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0274 :
  binarySearch_New_fun [339; 322; 323; 327; 332; 333; 338; 342; 343; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0275 :
  binarySearch_New_fun [403; 404; 406; 415; 419; 420; 427; 436; 442; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0276 :
  binarySearch_New_fun [534; 534; 535; 539; 543; 546; 555; 558; 566; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0277 :
  binarySearch_New_fun [738; 712; 718; 722; 724; 727; 728; 737; 738; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0278 :
  binarySearch_New_fun [79; 60; 68; 70; 79; 84; 86; 93; 97; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0279 :
  binarySearch_New_fun [731; 729; 731; 734; 737; 739; 744; 745; 753; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0280 :
  binarySearch_New_fun [547; 526; 534; 536; 539; 544; 545; 546; 554; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0281 :
  binarySearch_New_fun [357; 333; 337; 344; 349; 358; 360; 362; 368; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0282 :
  binarySearch_New_fun [164; 164; 168; 177; 178; 180; 185; 186; 191; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0283 :
  binarySearch_New_fun [191; 160; 162; 170; 178; 180; 184; 188; 191; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0284 :
  binarySearch_New_fun [870; 863; 865; 869; 870; 872; 874; 882; 889; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0285 :
  binarySearch_New_fun [435; 420; 425; 432; 435; 442; 449; 453; 454; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0286 :
  binarySearch_New_fun [709; 666; 671; 675; 677; 686; 695; 702; 708; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0287 :
  binarySearch_New_fun [510; 498; 503; 511; 517; 521; 529; 535; 540; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0288 :
  binarySearch_New_fun [555; 555; 564; 569; 576; 577; 585; 593; 597; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0289 :
  binarySearch_New_fun [688; 653; 656; 663; 668; 673; 674; 681; 688; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0290 :
  binarySearch_New_fun [768; 753; 759; 764; 768; 771; 777; 782; 788; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0291 :
  binarySearch_New_fun [605; 588; 594; 596; 605; 609; 617; 625; 627; 3; 4]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0292 :
  binarySearch_New_fun [811; 767; 775; 781; 788; 797; 801; 808; 810; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0293 :
  binarySearch_New_fun [374; 355; 359; 366; 375; 381; 384; 393; 402; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0294 :
  binarySearch_New_fun [479; 479; 484; 489; 492; 500; 501; 509; 517; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0295 :
  binarySearch_New_fun [373; 336; 341; 347; 356; 361; 369; 372; 373; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0296 :
  binarySearch_New_fun [378; 358; 363; 369; 378; 384; 387; 394; 400; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0297 :
  binarySearch_New_fun [380; 372; 374; 379; 380; 382; 388; 395; 404; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0298 :
  binarySearch_New_fun [672; 639; 647; 649; 656; 657; 664; 671; 678; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0299 :
  binarySearch_New_fun [178; 162; 164; 173; 179; 188; 194; 203; 210; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0300 :
  binarySearch_New_fun [18; 18; 19; 24; 25; 32; 37; 39; 45; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0301 :
  binarySearch_New_fun [1030; 994; 1001; 1005; 1013; 1020; 1025; 1029; 1030; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0302 :
  binarySearch_New_fun [921; 908; 909; 913; 921; 923; 925; 928; 934; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0303 :
  binarySearch_New_fun [359; 328; 337; 343; 350; 359; 368; 377; 380; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0304 :
  binarySearch_New_fun [796; 767; 770; 775; 784; 786; 795; 802; 810; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0305 :
  binarySearch_New_fun [245; 240; 246; 247; 256; 259; 262; 265; 271; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0306 :
  binarySearch_New_fun [144; 144; 146; 150; 152; 160; 163; 169; 172; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0307 :
  binarySearch_New_fun [715; 690; 692; 693; 701; 704; 707; 714; 715; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0308 :
  binarySearch_New_fun [836; 819; 824; 827; 836; 841; 845; 850; 858; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0309 :
  binarySearch_New_fun [100; 98; 100; 109; 114; 122; 127; 133; 134; 1; 4]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0310 :
  binarySearch_New_fun [430; 413; 422; 428; 429; 438; 445; 451; 455; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0311 :
  binarySearch_New_fun [153; 148; 151; 153; 154; 155; 160; 162; 169; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0312 :
  binarySearch_New_fun [406; 406; 415; 423; 427; 428; 437; 438; 439; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0313 :
  binarySearch_New_fun [510; 477; 478; 480; 489; 496; 504; 505; 510; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0314 :
  binarySearch_New_fun [431; 413; 422; 424; 431; 435; 444; 447; 453; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0315 :
  binarySearch_New_fun [519; 501; 503; 508; 515; 519; 522; 526; 527; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0316 :
  binarySearch_New_fun [519; 496; 504; 505; 512; 518; 523; 528; 533; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0317 :
  binarySearch_New_fun [372; 360; 368; 373; 378; 379; 383; 390; 397; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0318 :
  binarySearch_New_fun [522; 522; 523; 528; 537; 538; 547; 552; 553; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0319 :
  binarySearch_New_fun [677; 648; 652; 656; 657; 664; 673; 675; 677; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0320 :
  binarySearch_New_fun [352; 335; 342; 345; 352; 361; 362; 368; 370; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0321 :
  binarySearch_New_fun [591; 581; 587; 591; 594; 599; 604; 608; 617; 2; 4]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0322 :
  binarySearch_New_fun [956; 944; 950; 953; 955; 957; 962; 968; 969; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0323 :
  binarySearch_New_fun [50; 27; 34; 43; 51; 56; 58; 59; 63; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0324 :
  binarySearch_New_fun [527; 527; 531; 538; 544; 548; 551; 555; 560; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0325 :
  binarySearch_New_fun [160; 121; 129; 130; 136; 145; 146; 151; 160; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0326 :
  binarySearch_New_fun [219; 201; 205; 211; 219; 222; 223; 229; 238; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0327 :
  binarySearch_New_fun [381; 374; 380; 381; 387; 389; 392; 394; 400; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0328 :
  binarySearch_New_fun [814; 775; 784; 793; 795; 803; 809; 811; 813; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0329 :
  binarySearch_New_fun [239; 233; 236; 240; 243; 248; 250; 259; 264; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0330 :
  binarySearch_New_fun [540; 540; 543; 548; 555; 557; 560; 562; 563; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0331 :
  binarySearch_New_fun [852; 837; 839; 842; 843; 847; 849; 850; 852; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0332 :
  binarySearch_New_fun [255; 244; 248; 249; 255; 262; 266; 270; 276; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0333 :
  binarySearch_New_fun [909; 903; 909; 915; 917; 919; 920; 921; 923; 1; 5]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0334 :
  binarySearch_New_fun [213; 180; 185; 191; 192; 201; 202; 209; 212; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0335 :
  binarySearch_New_fun [345; 322; 331; 338; 346; 355; 359; 361; 363; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0336 :
  binarySearch_New_fun [366; 366; 370; 379; 383; 390; 397; 403; 410; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0337 :
  binarySearch_New_fun [137; 99; 107; 112; 117; 121; 126; 130; 137; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0338 :
  binarySearch_New_fun [922; 910; 913; 915; 922; 927; 933; 940; 941; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0339 :
  binarySearch_New_fun [290; 284; 286; 290; 296; 301; 304; 310; 313; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0340 :
  binarySearch_New_fun [626; 606; 615; 624; 625; 626; 635; 639; 643; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0341 :
  binarySearch_New_fun [264; 265; 269; 274; 279; 280; 285; 291; 292; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0342 :
  binarySearch_New_fun [625; 625; 634; 642; 644; 650; 658; 663; 666; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0343 :
  binarySearch_New_fun [693; 651; 659; 665; 670; 673; 681; 688; 693; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0344 :
  binarySearch_New_fun [599; 585; 589; 595; 599; 608; 616; 620; 626; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0345 :
  binarySearch_New_fun [666; 646; 654; 657; 659; 666; 673; 681; 687; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0346 :
  binarySearch_New_fun [293; 274; 282; 290; 292; 293; 301; 307; 309; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0347 :
  binarySearch_New_fun [992; 983; 984; 985; 990; 993; 1002; 1009; 1018; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0348 :
  binarySearch_New_fun [580; 580; 583; 584; 593; 600; 609; 614; 617; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0349 :
  binarySearch_New_fun [638; 608; 609; 610; 615; 619; 628; 629; 638; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0350 :
  binarySearch_New_fun [611; 597; 600; 609; 611; 616; 622; 629; 631; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0351 :
  binarySearch_New_fun [209; 205; 209; 213; 216; 219; 222; 224; 226; 1; 6]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0352 :
  binarySearch_New_fun [629; 609; 611; 618; 619; 621; 628; 630; 637; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0353 :
  binarySearch_New_fun [330; 319; 328; 330; 331; 335; 341; 348; 354; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0354 :
  binarySearch_New_fun [951; 951; 954; 957; 963; 965; 968; 971; 978; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0355 :
  binarySearch_New_fun [407; 369; 375; 380; 385; 389; 398; 400; 407; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0356 :
  binarySearch_New_fun [771; 761; 768; 769; 771; 776; 777; 781; 786; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0357 :
  binarySearch_New_fun [135; 113; 122; 126; 130; 135; 141; 147; 151; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0358 :
  binarySearch_New_fun [155; 108; 116; 122; 130; 136; 142; 146; 154; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0359 :
  binarySearch_New_fun [998; 999; 1006; 1013; 1014; 1015; 1023; 1027; 1029; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0360 :
  binarySearch_New_fun [465; 465; 474; 482; 487; 495; 500; 502; 508; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0361 :
  binarySearch_New_fun [850; 809; 817; 825; 830; 839; 840; 841; 850; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0362 :
  binarySearch_New_fun [181; 172; 174; 176; 181; 183; 185; 194; 203; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0363 :
  binarySearch_New_fun [330; 330; 334; 340; 346; 355; 358; 359; 362; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0364 :
  binarySearch_New_fun [220; 195; 204; 207; 209; 210; 211; 219; 225; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0365 :
  binarySearch_New_fun [768; 765; 767; 769; 771; 779; 783; 787; 796; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0366 :
  binarySearch_New_fun [128; 128; 130; 135; 136; 144; 145; 150; 152; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0367 :
  binarySearch_New_fun [941; 912; 919; 923; 927; 931; 933; 934; 941; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0368 :
  binarySearch_New_fun [997; 985; 994; 995; 997; 998; 1002; 1007; 1012; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0369 :
  binarySearch_New_fun [42; 22; 25; 33; 42; 45; 49; 57; 64; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0370 :
  binarySearch_New_fun [803; 780; 786; 792; 798; 802; 811; 812; 821; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0371 :
  binarySearch_New_fun [927; 928; 935; 940; 944; 948; 950; 955; 964; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0372 :
  binarySearch_New_fun [151; 151; 158; 164; 173; 182; 191; 199; 208; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0373 :
  binarySearch_New_fun [571; 538; 539; 540; 542; 546; 555; 562; 571; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0374 :
  binarySearch_New_fun [745; 730; 735; 744; 745; 746; 751; 760; 768; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0375 :
  binarySearch_New_fun [209; 181; 190; 194; 200; 209; 217; 218; 227; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0376 :
  binarySearch_New_fun [299; 290; 296; 298; 303; 311; 319; 325; 333; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0377 :
  binarySearch_New_fun [900; 897; 899; 900; 901; 909; 917; 920; 926; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0378 :
  binarySearch_New_fun [644; 644; 645; 650; 651; 652; 661; 666; 668; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0379 :
  binarySearch_New_fun [195; 166; 174; 176; 183; 184; 185; 191; 195; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0380 :
  binarySearch_New_fun [682; 669; 677; 679; 682; 689; 697; 699; 705; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0381 :
  binarySearch_New_fun [351; 351; 352; 357; 362; 367; 375; 383; 390; 0; 5]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0382 :
  binarySearch_New_fun [148; 112; 114; 119; 121; 130; 136; 142; 147; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0383 :
  binarySearch_New_fun [681; 681; 682; 686; 688; 692; 701; 709; 710; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0384 :
  binarySearch_New_fun [699; 699; 707; 714; 722; 724; 733; 737; 742; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0385 :
  binarySearch_New_fun [733; 696; 704; 705; 708; 712; 719; 728; 733; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0386 :
  binarySearch_New_fun [959; 941; 945; 950; 959; 965; 966; 973; 974; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0387 :
  binarySearch_New_fun [865; 850; 856; 862; 864; 865; 870; 879; 885; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0388 :
  binarySearch_New_fun [742; 732; 736; 738; 741; 744; 748; 752; 756; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0389 :
  binarySearch_New_fun [65; 55; 61; 66; 72; 80; 81; 88; 90; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0390 :
  binarySearch_New_fun [919; 919; 924; 925; 931; 940; 946; 950; 951; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0391 :
  binarySearch_New_fun [853; 815; 817; 823; 832; 841; 849; 851; 853; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0392 :
  binarySearch_New_fun [878; 866; 874; 876; 878; 886; 895; 902; 911; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0393 :
  binarySearch_New_fun [569; 554; 557; 559; 561; 569; 575; 578; 583; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0394 :
  binarySearch_New_fun [623; 589; 593; 596; 601; 602; 608; 615; 622; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0395 :
  binarySearch_New_fun [294; 295; 301; 305; 307; 309; 310; 315; 323; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0396 :
  binarySearch_New_fun [878; 878; 885; 886; 889; 893; 897; 904; 912; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0397 :
  binarySearch_New_fun [882; 853; 862; 868; 869; 874; 877; 881; 882; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0398 :
  binarySearch_New_fun [618; 601; 604; 611; 618; 626; 628; 629; 638; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0399 :
  binarySearch_New_fun [356; 356; 363; 372; 376; 382; 383; 386; 390; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0400 :
  binarySearch_New_fun [828; 820; 821; 827; 836; 837; 842; 849; 854; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0401 :
  binarySearch_New_fun [678; 666; 672; 678; 679; 685; 690; 696; 704; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0402 :
  binarySearch_New_fun [249; 249; 252; 258; 264; 272; 280; 285; 289; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0403 :
  binarySearch_New_fun [345; 324; 327; 331; 336; 337; 341; 342; 345; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0404 :
  binarySearch_New_fun [197; 181; 185; 194; 197; 204; 210; 216; 222; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0405 :
  binarySearch_New_fun [451; 451; 456; 457; 465; 474; 478; 479; 482; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0406 :
  binarySearch_New_fun [175; 147; 154; 161; 165; 166; 174; 180; 188; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0407 :
  binarySearch_New_fun [80; 78; 81; 83; 92; 93; 100; 103; 109; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0408 :
  binarySearch_New_fun [762; 762; 766; 772; 775; 781; 784; 785; 790; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0409 :
  binarySearch_New_fun [440; 406; 407; 414; 422; 430; 433; 435; 440; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0410 :
  binarySearch_New_fun [612; 597; 602; 606; 612; 616; 623; 627; 635; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0411 :
  binarySearch_New_fun [496; 496; 505; 513; 514; 518; 521; 523; 532; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0412 :
  binarySearch_New_fun [887; 865; 873; 882; 886; 894; 896; 904; 909; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0413 :
  binarySearch_New_fun [561; 543; 551; 556; 562; 564; 566; 572; 575; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0414 :
  binarySearch_New_fun [456; 456; 459; 463; 465; 469; 473; 481; 482; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0415 :
  binarySearch_New_fun [896; 847; 854; 858; 866; 875; 882; 890; 896; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0416 :
  binarySearch_New_fun [284; 274; 279; 281; 284; 287; 292; 295; 296; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0417 :
  binarySearch_New_fun [980; 965; 972; 975; 980; 988; 994; 996; 1002; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0418 :
  binarySearch_New_fun [731; 712; 716; 719; 721; 722; 729; 730; 738; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0419 :
  binarySearch_New_fun [951; 947; 952; 957; 961; 966; 967; 972; 977; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0420 :
  binarySearch_New_fun [361; 361; 362; 369; 371; 378; 381; 388; 394; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0421 :
  binarySearch_New_fun [247; 213; 219; 224; 227; 233; 236; 245; 247; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0422 :
  binarySearch_New_fun [710; 699; 705; 708; 710; 713; 719; 722; 731; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0423 :
  binarySearch_New_fun [612; 612; 619; 627; 628; 629; 634; 635; 644; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0424 :
  binarySearch_New_fun [143; 104; 107; 113; 121; 130; 135; 136; 142; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0425 :
  binarySearch_New_fun [817; 801; 805; 809; 818; 824; 832; 833; 841; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0426 :
  binarySearch_New_fun [160; 160; 168; 176; 185; 193; 202; 204; 207; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0427 :
  binarySearch_New_fun [501; 475; 478; 479; 484; 486; 491; 499; 501; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0428 :
  binarySearch_New_fun [703; 692; 695; 702; 703; 706; 713; 718; 719; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0429 :
  binarySearch_New_fun [848; 842; 844; 848; 849; 851; 854; 859; 864; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0430 :
  binarySearch_New_fun [699; 679; 683; 690; 691; 694; 698; 699; 707; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0431 :
  binarySearch_New_fun [460; 453; 456; 457; 461; 467; 470; 471; 473; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0432 :
  binarySearch_New_fun [423; 423; 429; 434; 435; 442; 444; 446; 449; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0433 :
  binarySearch_New_fun [456; 419; 421; 426; 435; 444; 446; 455; 456; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0434 :
  binarySearch_New_fun [512; 499; 501; 503; 512; 521; 529; 536; 540; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0435 :
  binarySearch_New_fun [577; 567; 570; 571; 577; 578; 585; 593; 596; 3; 4]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0436 :
  binarySearch_New_fun [775; 744; 753; 759; 765; 766; 774; 777; 779; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0437 :
  binarySearch_New_fun [574; 575; 581; 582; 586; 590; 593; 602; 610; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0438 :
  binarySearch_New_fun [376; 376; 381; 387; 391; 393; 400; 403; 405; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0439 :
  binarySearch_New_fun [381; 332; 341; 346; 352; 359; 366; 375; 381; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0440 :
  binarySearch_New_fun [970; 958; 960; 962; 970; 974; 980; 984; 993; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0441 :
  binarySearch_New_fun [803; 797; 800; 803; 811; 812; 820; 824; 827; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0442 :
  binarySearch_New_fun [281; 243; 251; 258; 264; 271; 272; 280; 286; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0443 :
  binarySearch_New_fun [102; 94; 103; 104; 106; 114; 118; 124; 131; 1; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0444 :
  binarySearch_New_fun [461; 461; 462; 468; 470; 471; 475; 483; 487; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0445 :
  binarySearch_New_fun [488; 450; 459; 466; 470; 477; 483; 486; 488; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0446 :
  binarySearch_New_fun [91; 83; 86; 90; 91; 94; 98; 107; 110; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0447 :
  binarySearch_New_fun [988; 988; 990; 996; 1001; 1002; 1007; 1008; 1009; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0448 :
  binarySearch_New_fun [563; 527; 536; 543; 545; 551; 554; 562; 564; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0449 :
  binarySearch_New_fun [204; 202; 205; 214; 215; 222; 226; 228; 235; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0450 :
  binarySearch_New_fun [692; 692; 698; 705; 713; 718; 720; 723; 730; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0451 :
  binarySearch_New_fun [660; 635; 636; 639; 642; 649; 650; 652; 660; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0452 :
  binarySearch_New_fun [1030; 1015; 1017; 1022; 1030; 1039; 1046; 1051; 1054; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0453 :
  binarySearch_New_fun [1010; 1010; 1018; 1022; 1025; 1026; 1031; 1038; 1045; 0; 1]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0454 :
  binarySearch_New_fun [854; 823; 825; 829; 835; 842; 850; 853; 861; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0455 :
  binarySearch_New_fun [906; 881; 890; 896; 902; 907; 909; 913; 921; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0456 :
  binarySearch_New_fun [884; 884; 891; 892; 897; 903; 904; 908; 917; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0457 :
  binarySearch_New_fun [201; 163; 169; 176; 180; 182; 185; 193; 201; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0458 :
  binarySearch_New_fun [975; 962; 971; 973; 975; 984; 988; 992; 998; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0459 :
  binarySearch_New_fun [813; 813; 815; 824; 830; 831; 833; 836; 837; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0460 :
  binarySearch_New_fun [621; 595; 598; 603; 608; 611; 620; 626; 629; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0461 :
  binarySearch_New_fun [841; 834; 842; 851; 852; 857; 863; 864; 869; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0462 :
  binarySearch_New_fun [49; 49; 54; 59; 66; 69; 74; 83; 84; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0463 :
  binarySearch_New_fun [1017; 981; 989; 995; 1002; 1003; 1005; 1011; 1017; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0464 :
  binarySearch_New_fun [769; 756; 765; 767; 769; 776; 784; 793; 797; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0465 :
  binarySearch_New_fun [520; 514; 516; 520; 525; 532; 537; 539; 543; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0466 :
  binarySearch_New_fun [418; 397; 406; 411; 415; 417; 422; 426; 430; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0467 :
  binarySearch_New_fun [114; 95; 99; 100; 108; 115; 116; 118; 120; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0468 :
  binarySearch_New_fun [436; 436; 439; 440; 447; 449; 450; 456; 465; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0469 :
  binarySearch_New_fun [988; 940; 949; 958; 961; 969; 973; 979; 988; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0470 :
  binarySearch_New_fun [316; 295; 301; 310; 316; 321; 327; 335; 337; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0471 :
  binarySearch_New_fun [588; 578; 582; 585; 588; 591; 597; 606; 610; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0472 :
  binarySearch_New_fun [327; 313; 314; 320; 322; 326; 329; 334; 340; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0473 :
  binarySearch_New_fun [44; 40; 44; 45; 52; 57; 59; 62; 68; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0474 :
  binarySearch_New_fun [326; 326; 332; 334; 342; 346; 352; 357; 364; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0475 :
  binarySearch_New_fun [706; 678; 679; 682; 687; 694; 699; 700; 706; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0476 :
  binarySearch_New_fun [952; 940; 944; 948; 952; 958; 959; 966; 972; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0477 :
  binarySearch_New_fun [798; 780; 782; 785; 791; 798; 803; 809; 818; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0478 :
  binarySearch_New_fun [182; 166; 168; 175; 181; 182; 191; 196; 197; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0479 :
  binarySearch_New_fun [331; 332; 335; 337; 341; 346; 350; 353; 361; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0480 :
  binarySearch_New_fun [915; 915; 917; 924; 928; 932; 938; 939; 945; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0481 :
  binarySearch_New_fun [743; 707; 709; 718; 722; 725; 730; 737; 743; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0482 :
  binarySearch_New_fun [994; 983; 986; 989; 994; 997; 1006; 1014; 1019; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0483 :
  binarySearch_New_fun [81; 67; 68; 72; 80; 81; 82; 89; 94; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0484 :
  binarySearch_New_fun [373; 349; 356; 361; 367; 368; 372; 373; 382; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0485 :
  binarySearch_New_fun [142; 143; 152; 157; 162; 171; 172; 175; 181; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0486 :
  binarySearch_New_fun [557; 557; 562; 571; 578; 585; 593; 594; 597; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0487 :
  binarySearch_New_fun [1029; 998; 1000; 1003; 1005; 1014; 1018; 1024; 1029; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0488 :
  binarySearch_New_fun [962; 951; 957; 960; 962; 968; 974; 981; 988; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0489 :
  binarySearch_New_fun [816; 807; 810; 813; 816; 817; 825; 833; 839; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0490 :
  binarySearch_New_fun [294; 260; 267; 270; 277; 284; 289; 293; 294; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0491 :
  binarySearch_New_fun [128; 129; 138; 141; 148; 154; 157; 158; 165; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0492 :
  binarySearch_New_fun [906; 906; 908; 910; 914; 918; 923; 924; 925; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0493 :
  binarySearch_New_fun [602; 575; 584; 586; 589; 592; 594; 596; 602; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0494 :
  binarySearch_New_fun [403; 387; 396; 401; 403; 411; 412; 419; 428; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0495 :
  binarySearch_New_fun [272; 272; 280; 283; 288; 291; 296; 301; 309; 0; 1]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0496 :
  binarySearch_New_fun [574; 557; 562; 564; 573; 579; 585; 592; 596; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0497 :
  binarySearch_New_fun [544; 529; 538; 545; 553; 555; 562; 563; 572; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0498 :
  binarySearch_New_fun [420; 420; 426; 434; 439; 446; 450; 458; 459; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0499 :
  binarySearch_New_fun [791; 750; 758; 765; 774; 779; 786; 787; 791; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0500 :
  binarySearch_New_fun [164; 160; 162; 163; 164; 172; 177; 184; 188; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0501 :
  binarySearch_New_fun [331; 329; 331; 332; 340; 343; 347; 352; 355; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0502 :
  binarySearch_New_fun [709; 667; 676; 683; 688; 692; 693; 699; 708; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0503 :
  binarySearch_New_fun [373; 371; 374; 380; 383; 385; 389; 391; 400; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0504 :
  binarySearch_New_fun [497; 497; 499; 506; 508; 510; 511; 517; 523; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0505 :
  binarySearch_New_fun [706; 673; 677; 681; 690; 694; 697; 700; 706; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0506 :
  binarySearch_New_fun [368; 361; 365; 366; 368; 373; 374; 379; 385; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0507 :
  binarySearch_New_fun [879; 870; 872; 879; 884; 890; 898; 904; 908; 2; 3]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0508 :
  binarySearch_New_fun [360; 330; 336; 341; 350; 356; 359; 361; 364; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0509 :
  binarySearch_New_fun [894; 894; 895; 896; 901; 902; 906; 907; 908; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0510 :
  binarySearch_New_fun [375; 375; 376; 384; 390; 395; 399; 403; 407; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0511 :
  binarySearch_New_fun [196; 153; 162; 163; 170; 176; 185; 191; 196; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0512 :
  binarySearch_New_fun [1012; 1001; 1007; 1011; 1012; 1019; 1027; 1035; 1038; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0513 :
  binarySearch_New_fun [343; 337; 342; 343; 347; 350; 352; 354; 356; 2; 5]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0514 :
  binarySearch_New_fun [205; 181; 186; 195; 204; 212; 213; 217; 218; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0515 :
  binarySearch_New_fun [85; 80; 86; 90; 99; 108; 110; 117; 119; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0516 :
  binarySearch_New_fun [231; 231; 232; 236; 240; 243; 244; 245; 253; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0517 :
  binarySearch_New_fun [988; 959; 961; 963; 972; 977; 981; 985; 988; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0518 :
  binarySearch_New_fun [502; 484; 493; 495; 502; 507; 514; 517; 522; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0519 :
  binarySearch_New_fun [662; 650; 658; 662; 669; 676; 677; 681; 682; 2; 5]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0520 :
  binarySearch_New_fun [458; 429; 436; 441; 444; 445; 453; 457; 459; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0521 :
  binarySearch_New_fun [752; 750; 753; 757; 761; 765; 766; 772; 778; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0522 :
  binarySearch_New_fun [791; 791; 799; 808; 815; 820; 822; 823; 825; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0523 :
  binarySearch_New_fun [453; 420; 426; 431; 437; 444; 447; 452; 453; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0524 :
  binarySearch_New_fun [144; 123; 129; 138; 144; 146; 152; 158; 166; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0525 :
  binarySearch_New_fun [93; 74; 77; 81; 86; 93; 102; 106; 110; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0526 :
  binarySearch_New_fun [619; 582; 591; 599; 605; 607; 611; 618; 621; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0527 :
  binarySearch_New_fun [943; 944; 948; 949; 950; 959; 966; 973; 979; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0528 :
  binarySearch_New_fun [127; 127; 134; 136; 141; 147; 151; 154; 155; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0529 :
  binarySearch_New_fun [660; 618; 624; 630; 639; 646; 652; 658; 660; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0530 :
  binarySearch_New_fun [479; 463; 465; 470; 479; 485; 489; 498; 505; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0531 :
  binarySearch_New_fun [168; 156; 158; 161; 166; 168; 174; 183; 190; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0532 :
  binarySearch_New_fun [651; 622; 630; 637; 641; 648; 650; 651; 659; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0533 :
  binarySearch_New_fun [776; 767; 776; 777; 780; 781; 789; 798; 801; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0534 :
  binarySearch_New_fun [817; 817; 818; 823; 824; 832; 835; 840; 842; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0535 :
  binarySearch_New_fun [475; 449; 454; 459; 463; 469; 472; 473; 475; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0536 :
  binarySearch_New_fun [743; 731; 733; 736; 743; 747; 754; 756; 757; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0537 :
  binarySearch_New_fun [330; 318; 323; 330; 337; 345; 350; 351; 352; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0538 :
  binarySearch_New_fun [344; 306; 312; 318; 326; 334; 342; 343; 348; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0539 :
  binarySearch_New_fun [62; 63; 64; 69; 75; 82; 87; 88; 97; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0540 :
  binarySearch_New_fun [287; 287; 295; 296; 305; 309; 314; 320; 321; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0541 :
  binarySearch_New_fun [795; 767; 773; 777; 782; 788; 789; 794; 795; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0542 :
  binarySearch_New_fun [509; 500; 502; 503; 509; 512; 519; 528; 537; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0543 :
  binarySearch_New_fun [737; 710; 719; 725; 730; 737; 739; 743; 747; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0544 :
  binarySearch_New_fun [322; 285; 288; 295; 299; 308; 317; 321; 323; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0545 :
  binarySearch_New_fun [365; 344; 346; 351; 359; 366; 371; 374; 381; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0546 :
  binarySearch_New_fun [122; 122; 124; 129; 135; 142; 143; 146; 153; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0547 :
  binarySearch_New_fun [615; 582; 585; 590; 596; 599; 605; 608; 615; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0548 :
  binarySearch_New_fun [585; 566; 570; 576; 585; 586; 589; 594; 600; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0549 :
  binarySearch_New_fun [599; 599; 601; 609; 616; 617; 625; 632; 633; 0; 5]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0550 :
  binarySearch_New_fun [415; 404; 413; 414; 416; 418; 419; 423; 428; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0551 :
  binarySearch_New_fun [986; 978; 981; 986; 987; 989; 993; 997; 998; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0552 :
  binarySearch_New_fun [140; 140; 143; 146; 149; 157; 159; 164; 166; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0553 :
  binarySearch_New_fun [540; 498; 506; 511; 514; 523; 532; 538; 540; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0554 :
  binarySearch_New_fun [928; 910; 917; 920; 928; 931; 940; 943; 951; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0555 :
  binarySearch_New_fun [748; 748; 757; 761; 765; 770; 773; 776; 780; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0556 :
  binarySearch_New_fun [259; 229; 235; 244; 245; 248; 253; 258; 264; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0557 :
  binarySearch_New_fun [970; 964; 970; 971; 974; 977; 982; 991; 999; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0558 :
  binarySearch_New_fun [51; 51; 56; 58; 60; 65; 68; 74; 79; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0559 :
  binarySearch_New_fun [753; 722; 724; 725; 728; 737; 741; 748; 753; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0560 :
  binarySearch_New_fun [360; 348; 354; 359; 360; 369; 375; 377; 386; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0561 :
  binarySearch_New_fun [319; 311; 314; 319; 320; 321; 328; 334; 340; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0562 :
  binarySearch_New_fun [742; 715; 718; 719; 720; 724; 733; 741; 744; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0563 :
  binarySearch_New_fun [276; 252; 261; 267; 275; 277; 286; 288; 289; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0564 :
  binarySearch_New_fun [534; 534; 538; 546; 555; 561; 566; 575; 583; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0565 :
  binarySearch_New_fun [1000; 963; 970; 977; 986; 987; 988; 995; 1000; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0566 :
  binarySearch_New_fun [43; 24; 29; 38; 43; 48; 53; 61; 68; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0567 :
  binarySearch_New_fun [354; 331; 335; 338; 346; 354; 357; 362; 366; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0568 :
  binarySearch_New_fun [684; 653; 660; 669; 672; 675; 683; 687; 689; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0569 :
  binarySearch_New_fun [547; 539; 548; 554; 559; 561; 569; 577; 579; 1; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0570 :
  binarySearch_New_fun [100; 100; 105; 106; 115; 122; 125; 127; 131; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0571 :
  binarySearch_New_fun [81; 37; 44; 53; 61; 68; 75; 77; 81; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0572 :
  binarySearch_New_fun [432; 424; 425; 430; 432; 433; 441; 444; 448; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0573 :
  binarySearch_New_fun [79; 64; 70; 79; 87; 90; 95; 102; 108; 2; 4]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0574 :
  binarySearch_New_fun [396; 360; 367; 368; 369; 376; 382; 386; 395; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0575 :
  binarySearch_New_fun [624; 603; 610; 617; 625; 631; 636; 642; 651; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0576 :
  binarySearch_New_fun [591; 591; 596; 598; 601; 609; 610; 615; 619; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0577 :
  binarySearch_New_fun [746; 713; 718; 727; 728; 734; 739; 743; 746; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0578 :
  binarySearch_New_fun [826; 812; 815; 819; 826; 830; 832; 839; 841; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0579 :
  binarySearch_New_fun [709; 701; 709; 715; 722; 727; 732; 739; 747; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0580 :
  binarySearch_New_fun [570; 554; 555; 562; 569; 570; 575; 577; 582; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0581 :
  binarySearch_New_fun [266; 252; 256; 261; 266; 267; 269; 275; 280; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0582 :
  binarySearch_New_fun [623; 623; 629; 635; 639; 641; 650; 659; 667; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0583 :
  binarySearch_New_fun [257; 216; 217; 226; 233; 237; 246; 253; 257; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0584 :
  binarySearch_New_fun [835; 809; 817; 826; 835; 837; 845; 848; 849; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0585 :
  binarySearch_New_fun [527; 518; 527; 529; 535; 539; 545; 547; 549; 1; 3]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0586 :
  binarySearch_New_fun [398; 378; 380; 384; 390; 393; 397; 404; 405; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0587 :
  binarySearch_New_fun [1001; 984; 990; 997; 1002; 1009; 1010; 1016; 1025; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0588 :
  binarySearch_New_fun [288; 288; 296; 303; 310; 318; 327; 333; 339; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0589 :
  binarySearch_New_fun [469; 436; 440; 447; 448; 454; 460; 461; 469; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0590 :
  binarySearch_New_fun [822; 805; 809; 814; 822; 829; 830; 838; 843; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0591 :
  binarySearch_New_fun [894; 887; 894; 895; 896; 905; 908; 913; 914; 1; 2]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0592 :
  binarySearch_New_fun [401; 384; 387; 391; 400; 405; 409; 417; 425; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0593 :
  binarySearch_New_fun [315; 293; 296; 305; 308; 316; 321; 328; 329; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0594 :
  binarySearch_New_fun [661; 661; 670; 673; 682; 691; 692; 701; 706; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0595 :
  binarySearch_New_fun [433; 390; 399; 407; 410; 415; 423; 427; 433; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0596 :
  binarySearch_New_fun [192; 172; 181; 185; 192; 193; 199; 201; 210; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0597 :
  binarySearch_New_fun [570; 543; 552; 558; 563; 570; 575; 577; 579; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0598 :
  binarySearch_New_fun [39; 19; 22; 25; 29; 38; 40; 46; 49; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0599 :
  binarySearch_New_fun [211; 199; 205; 212; 220; 222; 225; 229; 231; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0600 :
  binarySearch_New_fun [552; 552; 560; 566; 567; 572; 574; 576; 578; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0601 :
  binarySearch_New_fun [579; 530; 539; 544; 553; 554; 563; 572; 579; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0602 :
  binarySearch_New_fun [148; 129; 132; 139; 148; 155; 159; 165; 166; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0603 :
  binarySearch_New_fun [838; 838; 840; 841; 847; 852; 857; 866; 872; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0604 :
  binarySearch_New_fun [755; 749; 750; 754; 762; 767; 776; 781; 787; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0605 :
  binarySearch_New_fun [172; 173; 182; 188; 193; 202; 205; 207; 215; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0606 :
  binarySearch_New_fun [488; 488; 489; 496; 503; 512; 520; 524; 530; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0607 :
  binarySearch_New_fun [88; 61; 67; 74; 79; 83; 85; 87; 88; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0608 :
  binarySearch_New_fun [965; 949; 956; 960; 965; 970; 977; 984; 987; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0609 :
  binarySearch_New_fun [595; 589; 595; 598; 599; 602; 609; 611; 615; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0610 :
  binarySearch_New_fun [153; 129; 136; 141; 144; 150; 152; 157; 159; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0611 :
  binarySearch_New_fun [122; 117; 123; 129; 135; 141; 149; 154; 161; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0612 :
  binarySearch_New_fun [643; 643; 649; 653; 654; 661; 665; 674; 679; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0613 :
  binarySearch_New_fun [226; 184; 189; 197; 206; 213; 215; 220; 226; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0614 :
  binarySearch_New_fun [744; 720; 728; 736; 744; 745; 754; 763; 764; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0615 :
  binarySearch_New_fun [772; 771; 772; 774; 779; 786; 789; 797; 804; 1; 4]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0616 :
  binarySearch_New_fun [69; 57; 59; 62; 68; 73; 78; 82; 85; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0617 :
  binarySearch_New_fun [997; 990; 998; 1004; 1005; 1012; 1018; 1024; 1025; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0618 :
  binarySearch_New_fun [124; 124; 127; 135; 139; 143; 150; 158; 165; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0619 :
  binarySearch_New_fun [433; 389; 395; 396; 405; 414; 423; 432; 433; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0620 :
  binarySearch_New_fun [606; 588; 592; 598; 606; 614; 616; 617; 625; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0621 :
  binarySearch_New_fun [231; 213; 220; 229; 231; 235; 243; 245; 249; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0622 :
  binarySearch_New_fun [999; 961; 970; 977; 984; 993; 998; 1005; 1013; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0623 :
  binarySearch_New_fun [185; 186; 195; 201; 210; 216; 217; 222; 231; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0624 :
  binarySearch_New_fun [301; 301; 304; 311; 314; 317; 325; 328; 331; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0625 :
  binarySearch_New_fun [76; 48; 50; 55; 61; 63; 64; 72; 76; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0626 :
  binarySearch_New_fun [283; 258; 266; 274; 283; 289; 297; 305; 306; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0627 :
  binarySearch_New_fun [89; 77; 85; 87; 89; 92; 93; 96; 103; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0628 :
  binarySearch_New_fun [256; 237; 243; 244; 250; 255; 257; 258; 264; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0629 :
  binarySearch_New_fun [301; 289; 292; 296; 299; 302; 305; 308; 311; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0630 :
  binarySearch_New_fun [652; 652; 656; 664; 673; 676; 679; 686; 692; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0631 :
  binarySearch_New_fun [182; 157; 163; 166; 167; 170; 176; 179; 182; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0632 :
  binarySearch_New_fun [80; 65; 72; 78; 80; 81; 82; 91; 93; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0633 :
  binarySearch_New_fun [597; 597; 600; 604; 608; 612; 614; 616; 621; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0634 :
  binarySearch_New_fun [640; 605; 606; 613; 617; 619; 628; 637; 639; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0635 :
  binarySearch_New_fun [696; 678; 682; 684; 689; 697; 699; 705; 709; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0636 :
  binarySearch_New_fun [136; 136; 142; 145; 153; 155; 162; 169; 178; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0637 :
  binarySearch_New_fun [633; 602; 606; 614; 620; 627; 630; 631; 633; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0638 :
  binarySearch_New_fun [339; 327; 328; 335; 339; 348; 354; 363; 364; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0639 :
  binarySearch_New_fun [255; 248; 253; 255; 256; 262; 268; 271; 274; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0640 :
  binarySearch_New_fun [688; 675; 682; 687; 693; 700; 706; 709; 712; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0641 :
  binarySearch_New_fun [946; 937; 945; 947; 948; 950; 958; 963; 964; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0642 :
  binarySearch_New_fun [106; 106; 113; 114; 122; 130; 137; 144; 145; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0643 :
  binarySearch_New_fun [603; 561; 565; 570; 578; 586; 589; 597; 603; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0644 :
  binarySearch_New_fun [760; 750; 756; 757; 760; 767; 768; 775; 784; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0645 :
  binarySearch_New_fun [506; 504; 506; 509; 518; 523; 525; 528; 537; 1; 5]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0646 :
  binarySearch_New_fun [742; 711; 718; 726; 729; 734; 741; 743; 751; 1; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0647 :
  binarySearch_New_fun [462; 441; 449; 453; 454; 463; 467; 475; 481; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0648 :
  binarySearch_New_fun [566; 566; 571; 575; 576; 578; 584; 585; 593; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0649 :
  binarySearch_New_fun [74; 33; 35; 37; 46; 55; 60; 68; 74; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0650 :
  binarySearch_New_fun [714; 696; 700; 706; 714; 720; 729; 730; 734; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0651 :
  binarySearch_New_fun [670; 656; 661; 669; 670; 675; 680; 686; 691; 3; 4]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0652 :
  binarySearch_New_fun [601; 575; 578; 582; 584; 590; 591; 600; 603; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0653 :
  binarySearch_New_fun [506; 498; 502; 507; 516; 520; 526; 531; 532; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0654 :
  binarySearch_New_fun [498; 498; 502; 511; 517; 522; 524; 526; 528; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0655 :
  binarySearch_New_fun [361; 333; 335; 337; 341; 345; 353; 354; 361; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0656 :
  binarySearch_New_fun [872; 862; 863; 870; 872; 876; 877; 879; 885; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0657 :
  binarySearch_New_fun [576; 562; 568; 576; 584; 585; 591; 592; 593; 2; 5]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0658 :
  binarySearch_New_fun [271; 243; 250; 252; 256; 260; 265; 267; 270; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0659 :
  binarySearch_New_fun [640; 641; 642; 647; 655; 657; 659; 665; 670; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0660 :
  binarySearch_New_fun [352; 352; 359; 362; 365; 368; 377; 382; 390; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0661 :
  binarySearch_New_fun [463; 419; 427; 436; 438; 444; 450; 457; 463; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0662 :
  binarySearch_New_fun [799; 782; 788; 796; 799; 800; 805; 811; 818; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0663 :
  binarySearch_New_fun [821; 811; 815; 821; 827; 834; 838; 841; 842; 2; 3]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0664 :
  binarySearch_New_fun [823; 787; 789; 790; 798; 802; 811; 814; 822; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0665 :
  binarySearch_New_fun [907; 889; 892; 898; 901; 908; 909; 912; 919; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0666 :
  binarySearch_New_fun [387; 387; 389; 390; 397; 405; 414; 418; 420; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0667 :
  binarySearch_New_fun [809; 774; 778; 782; 784; 793; 797; 804; 809; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0668 :
  binarySearch_New_fun [942; 921; 929; 936; 942; 944; 949; 956; 965; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0669 :
  binarySearch_New_fun [753; 750; 753; 754; 760; 768; 777; 778; 781; 1; 3]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0670 :
  binarySearch_New_fun [914; 890; 896; 899; 901; 907; 913; 916; 925; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0671 :
  binarySearch_New_fun [172; 172; 173; 179; 188; 190; 194; 203; 212; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0672 :
  binarySearch_New_fun [714; 714; 720; 725; 726; 729; 734; 737; 738; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0673 :
  binarySearch_New_fun [977; 944; 946; 947; 950; 957; 966; 972; 977; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0674 :
  binarySearch_New_fun [210; 195; 200; 206; 210; 218; 224; 231; 236; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0675 :
  binarySearch_New_fun [1036; 1010; 1016; 1022; 1027; 1036; 1037; 1041; 1050; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0676 :
  binarySearch_New_fun [930; 895; 903; 909; 912; 918; 921; 928; 929; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0677 :
  binarySearch_New_fun [948; 927; 930; 939; 942; 949; 955; 956; 957; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0678 :
  binarySearch_New_fun [321; 321; 328; 330; 332; 341; 344; 351; 352; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0679 :
  binarySearch_New_fun [314; 288; 293; 298; 301; 303; 308; 313; 314; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0680 :
  binarySearch_New_fun [937; 916; 925; 934; 937; 944; 952; 960; 964; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0681 :
  binarySearch_New_fun [350; 335; 342; 345; 350; 356; 362; 364; 371; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0682 :
  binarySearch_New_fun [627; 590; 597; 599; 601; 609; 617; 622; 626; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0683 :
  binarySearch_New_fun [792; 779; 780; 787; 793; 798; 804; 812; 813; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0684 :
  binarySearch_New_fun [657; 657; 661; 667; 673; 680; 684; 690; 698; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0685 :
  binarySearch_New_fun [961; 925; 929; 937; 943; 947; 949; 953; 961; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0686 :
  binarySearch_New_fun [529; 506; 511; 520; 529; 538; 546; 549; 556; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0687 :
  binarySearch_New_fun [254; 240; 244; 246; 254; 261; 263; 268; 277; 3; 5]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0688 :
  binarySearch_New_fun [329; 306; 314; 321; 328; 335; 337; 339; 347; 0; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0689 :
  binarySearch_New_fun [84; 66; 74; 77; 80; 85; 94; 97; 98; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0690 :
  binarySearch_New_fun [518; 518; 523; 524; 526; 528; 537; 541; 542; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0691 :
  binarySearch_New_fun [780; 746; 755; 764; 767; 774; 778; 779; 780; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0692 :
  binarySearch_New_fun [54; 43; 45; 47; 54; 61; 70; 76; 78; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0693 :
  binarySearch_New_fun [467; 467; 476; 485; 494; 498; 502; 509; 515; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0694 :
  binarySearch_New_fun [77; 51; 57; 61; 65; 69; 76; 85; 90; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0695 :
  binarySearch_New_fun [694; 674; 675; 683; 689; 695; 703; 709; 712; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0696 :
  binarySearch_New_fun [321; 321; 330; 337; 341; 344; 350; 358; 362; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0697 :
  binarySearch_New_fun [80; 43; 49; 52; 57; 65; 73; 77; 80; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0698 :
  binarySearch_New_fun [71; 63; 64; 67; 71; 75; 80; 87; 89; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0699 :
  binarySearch_New_fun [645; 624; 630; 635; 644; 645; 646; 654; 657; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0700 :
  binarySearch_New_fun [347; 324; 332; 333; 337; 340; 342; 343; 346; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0701 :
  binarySearch_New_fun [743; 728; 735; 744; 745; 746; 747; 755; 759; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0702 :
  binarySearch_New_fun [425; 425; 434; 440; 443; 451; 453; 462; 467; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0703 :
  binarySearch_New_fun [113; 80; 86; 94; 102; 103; 104; 112; 113; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0704 :
  binarySearch_New_fun [719; 702; 709; 713; 719; 727; 734; 738; 741; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0705 :
  binarySearch_New_fun [709; 689; 693; 701; 707; 709; 711; 716; 718; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0706 :
  binarySearch_New_fun [1012; 979; 987; 995; 1001; 1005; 1011; 1012; 1019; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0707 :
  binarySearch_New_fun [215; 193; 196; 204; 207; 216; 219; 222; 228; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0708 :
  binarySearch_New_fun [335; 335; 344; 350; 351; 357; 364; 365; 374; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0709 :
  binarySearch_New_fun [178; 139; 146; 150; 152; 157; 163; 169; 178; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0710 :
  binarySearch_New_fun [977; 966; 969; 972; 977; 985; 989; 995; 999; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0711 :
  binarySearch_New_fun [893; 875; 876; 878; 886; 893; 895; 904; 906; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0712 :
  binarySearch_New_fun [351; 336; 344; 350; 351; 355; 364; 367; 376; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0713 :
  binarySearch_New_fun [877; 862; 866; 871; 878; 880; 889; 890; 895; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0714 :
  binarySearch_New_fun [379; 379; 382; 385; 388; 396; 400; 406; 413; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0715 :
  binarySearch_New_fun [223; 192; 201; 209; 210; 212; 221; 222; 223; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0716 :
  binarySearch_New_fun [542; 524; 531; 536; 542; 544; 550; 552; 555; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0717 :
  binarySearch_New_fun [58; 46; 54; 58; 60; 67; 75; 77; 84; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0718 :
  binarySearch_New_fun [613; 584; 592; 593; 599; 604; 607; 612; 616; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0719 :
  binarySearch_New_fun [665; 666; 675; 681; 682; 691; 697; 699; 700; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0720 :
  binarySearch_New_fun [941; 941; 947; 949; 950; 951; 955; 958; 963; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0721 :
  binarySearch_New_fun [567; 521; 530; 537; 545; 553; 555; 561; 567; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0722 :
  binarySearch_New_fun [571; 560; 566; 568; 571; 575; 581; 582; 585; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0723 :
  binarySearch_New_fun [112; 87; 93; 99; 103; 112; 115; 124; 126; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0724 :
  binarySearch_New_fun [487; 464; 465; 473; 482; 486; 495; 496; 505; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0725 :
  binarySearch_New_fun [753; 740; 744; 752; 754; 759; 767; 768; 774; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0726 :
  binarySearch_New_fun [889; 889; 890; 899; 900; 906; 909; 912; 921; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0727 :
  binarySearch_New_fun [720; 683; 691; 699; 701; 703; 710; 713; 720; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0728 :
  binarySearch_New_fun [222; 204; 209; 217; 222; 229; 232; 235; 237; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0729 :
  binarySearch_New_fun [499; 499; 508; 509; 517; 526; 531; 539; 547; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0730 :
  binarySearch_New_fun [297; 267; 273; 281; 282; 287; 288; 296; 305; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0731 :
  binarySearch_New_fun [546; 521; 530; 539; 547; 550; 553; 557; 563; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0732 :
  binarySearch_New_fun [304; 304; 309; 318; 321; 325; 334; 339; 341; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0733 :
  binarySearch_New_fun [653; 618; 621; 630; 634; 643; 645; 647; 653; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0734 :
  binarySearch_New_fun [334; 313; 319; 327; 334; 339; 343; 346; 351; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0735 :
  binarySearch_New_fun [741; 735; 737; 741; 749; 751; 756; 765; 771; 2; 3]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0736 :
  binarySearch_New_fun [161; 145; 152; 158; 159; 160; 168; 177; 184; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0737 :
  binarySearch_New_fun [544; 539; 545; 547; 555; 564; 568; 571; 579; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0738 :
  binarySearch_New_fun [696; 696; 697; 699; 704; 713; 720; 722; 731; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0739 :
  binarySearch_New_fun [447; 393; 402; 410; 419; 421; 430; 438; 447; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0740 :
  binarySearch_New_fun [45; 28; 32; 37; 45; 54; 63; 69; 71; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0741 :
  binarySearch_New_fun [699; 692; 693; 695; 699; 700; 704; 709; 714; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0742 :
  binarySearch_New_fun [373; 353; 358; 360; 363; 372; 376; 381; 390; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0743 :
  binarySearch_New_fun [315; 305; 310; 316; 317; 322; 331; 334; 343; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0744 :
  binarySearch_New_fun [742; 742; 743; 745; 751; 755; 763; 764; 770; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0745 :
  binarySearch_New_fun [340; 309; 316; 318; 323; 326; 333; 335; 340; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0746 :
  binarySearch_New_fun [427; 408; 414; 420; 427; 433; 436; 442; 448; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0747 :
  binarySearch_New_fun [932; 911; 912; 921; 924; 932; 935; 943; 947; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0748 :
  binarySearch_New_fun [484; 454; 462; 466; 467; 472; 477; 481; 483; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0749 :
  binarySearch_New_fun [98; 83; 89; 94; 99; 101; 103; 108; 109; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0750 :
  binarySearch_New_fun [114; 114; 122; 125; 133; 141; 147; 154; 162; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0751 :
  binarySearch_New_fun [910; 881; 884; 885; 891; 895; 900; 905; 910; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0752 :
  binarySearch_New_fun [809; 797; 798; 801; 809; 816; 822; 825; 832; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0753 :
  binarySearch_New_fun [583; 563; 568; 573; 574; 583; 586; 593; 598; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0754 :
  binarySearch_New_fun [805; 796; 798; 804; 805; 814; 816; 819; 823; 1; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0755 :
  binarySearch_New_fun [864; 865; 869; 875; 881; 885; 888; 894; 902; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0756 :
  binarySearch_New_fun [162; 162; 166; 173; 174; 179; 187; 194; 201; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0757 :
  binarySearch_New_fun [251; 217; 225; 227; 235; 242; 244; 246; 251; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0758 :
  binarySearch_New_fun [249; 237; 241; 246; 249; 254; 261; 262; 269; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0759 :
  binarySearch_New_fun [506; 502; 506; 508; 514; 518; 524; 527; 536; 1; 6]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0760 :
  binarySearch_New_fun [641; 625; 630; 635; 640; 642; 647; 648; 654; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0761 :
  binarySearch_New_fun [842; 833; 835; 836; 843; 850; 853; 855; 856; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0762 :
  binarySearch_New_fun [274; 274; 275; 277; 281; 285; 292; 293; 301; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0763 :
  binarySearch_New_fun [94; 67; 69; 72; 74; 79; 80; 87; 94; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0764 :
  binarySearch_New_fun [480; 468; 472; 474; 480; 487; 496; 497; 500; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0765 :
  binarySearch_New_fun [479; 467; 475; 477; 479; 487; 491; 493; 502; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0766 :
  binarySearch_New_fun [1019; 974; 975; 984; 986; 995; 1002; 1009; 1018; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0767 :
  binarySearch_New_fun [577; 568; 576; 578; 581; 584; 592; 601; 602; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0768 :
  binarySearch_New_fun [559; 559; 563; 566; 567; 569; 573; 577; 586; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0769 :
  binarySearch_New_fun [387; 353; 354; 358; 359; 362; 371; 379; 387; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0770 :
  binarySearch_New_fun [1004; 988; 991; 995; 1004; 1007; 1016; 1017; 1024; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0771 :
  binarySearch_New_fun [221; 208; 213; 221; 226; 228; 232; 235; 238; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0772 :
  binarySearch_New_fun [851; 812; 815; 821; 826; 832; 840; 841; 850; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0773 :
  binarySearch_New_fun [490; 464; 470; 479; 482; 491; 500; 503; 509; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0774 :
  binarySearch_New_fun [17; 17; 25; 34; 36; 40; 42; 46; 52; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0775 :
  binarySearch_New_fun [964; 931; 936; 937; 945; 947; 950; 955; 964; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0776 :
  binarySearch_New_fun [251; 240; 242; 243; 251; 260; 268; 271; 273; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0777 :
  binarySearch_New_fun [24; 23; 24; 30; 33; 36; 39; 43; 51; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0778 :
  binarySearch_New_fun [798; 765; 769; 775; 776; 777; 780; 788; 797; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0779 :
  binarySearch_New_fun [901; 880; 882; 891; 898; 902; 903; 912; 919; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0780 :
  binarySearch_New_fun [986; 986; 993; 1002; 1011; 1016; 1020; 1023; 1031; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0781 :
  binarySearch_New_fun [202; 159; 166; 168; 175; 183; 191; 195; 202; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0782 :
  binarySearch_New_fun [509; 493; 496; 503; 509; 516; 522; 531; 532; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0783 :
  binarySearch_New_fun [820; 808; 815; 816; 817; 820; 828; 837; 840; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0784 :
  binarySearch_New_fun [540; 515; 524; 528; 534; 539; 546; 551; 552; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0785 :
  binarySearch_New_fun [363; 361; 363; 364; 365; 367; 372; 376; 385; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0786 :
  binarySearch_New_fun [36; 36; 42; 47; 56; 60; 63; 65; 66; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0787 :
  binarySearch_New_fun [532; 494; 499; 507; 508; 514; 517; 524; 532; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0788 :
  binarySearch_New_fun [207; 184; 193; 201; 207; 214; 216; 220; 227; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0789 :
  binarySearch_New_fun [743; 732; 734; 742; 743; 751; 754; 755; 762; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0790 :
  binarySearch_New_fun [369; 345; 351; 354; 359; 368; 377; 382; 390; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0791 :
  binarySearch_New_fun [107; 93; 95; 96; 102; 108; 110; 114; 123; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0792 :
  binarySearch_New_fun [1007; 1007; 1015; 1019; 1022; 1029; 1035; 1044; 1050; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0793 :
  binarySearch_New_fun [789; 760; 763; 765; 766; 773; 782; 786; 789; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0794 :
  binarySearch_New_fun [370; 357; 365; 366; 370; 376; 381; 383; 390; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0795 :
  binarySearch_New_fun [617; 606; 613; 617; 623; 631; 636; 644; 653; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0796 :
  binarySearch_New_fun [953; 923; 929; 930; 935; 941; 943; 952; 960; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0797 :
  binarySearch_New_fun [654; 652; 654; 655; 661; 666; 669; 678; 687; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0798 :
  binarySearch_New_fun [700; 700; 705; 706; 711; 717; 721; 725; 726; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0799 :
  binarySearch_New_fun [228; 200; 202; 210; 216; 218; 219; 220; 228; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0800 :
  binarySearch_New_fun [914; 898; 902; 910; 914; 919; 922; 926; 928; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0801 :
  binarySearch_New_fun [542; 523; 530; 537; 542; 550; 559; 561; 563; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0802 :
  binarySearch_New_fun [534; 517; 519; 521; 527; 533; 542; 543; 548; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0803 :
  binarySearch_New_fun [53; 54; 63; 67; 74; 76; 78; 80; 85; 0; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0804 :
  binarySearch_New_fun [776; 776; 779; 784; 793; 799; 808; 816; 819; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0805 :
  binarySearch_New_fun [876; 829; 838; 847; 853; 857; 865; 869; 876; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0806 :
  binarySearch_New_fun [959; 941; 949; 951; 959; 963; 971; 978; 979; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0807 :
  binarySearch_New_fun [698; 698; 707; 712; 721; 725; 727; 735; 737; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0808 :
  binarySearch_New_fun [743; 718; 725; 726; 727; 734; 742; 750; 753; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0809 :
  binarySearch_New_fun [614; 615; 616; 619; 622; 629; 631; 639; 640; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0810 :
  binarySearch_New_fun [1004; 1004; 1007; 1013; 1022; 1029; 1034; 1037; 1039; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0811 :
  binarySearch_New_fun [662; 635; 636; 643; 647; 650; 658; 659; 662; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0812 :
  binarySearch_New_fun [874; 863; 866; 870; 874; 876; 884; 888; 890; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0813 :
  binarySearch_New_fun [842; 835; 842; 846; 849; 858; 865; 873; 875; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0814 :
  binarySearch_New_fun [863; 834; 837; 845; 854; 856; 862; 870; 876; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0815 :
  binarySearch_New_fun [400; 381; 390; 398; 401; 405; 412; 419; 426; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0816 :
  binarySearch_New_fun [338; 338; 345; 349; 354; 362; 370; 375; 384; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0817 :
  binarySearch_New_fun [292; 259; 260; 262; 271; 278; 283; 284; 292; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0818 :
  binarySearch_New_fun [572; 561; 562; 570; 572; 573; 575; 582; 586; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0819 :
  binarySearch_New_fun [684; 679; 683; 684; 685; 689; 693; 694; 703; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0820 :
  binarySearch_New_fun [1014; 993; 996; 998; 999; 1002; 1010; 1013; 1018; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0821 :
  binarySearch_New_fun [711; 708; 712; 720; 724; 726; 731; 733; 736; 1; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0822 :
  binarySearch_New_fun [456; 456; 459; 468; 477; 482; 487; 491; 493; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0823 :
  binarySearch_New_fun [227; 197; 198; 204; 210; 217; 222; 225; 227; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0824 :
  binarySearch_New_fun [166; 151; 154; 161; 166; 174; 179; 185; 187; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0825 :
  binarySearch_New_fun [548; 548; 554; 558; 562; 564; 571; 578; 581; 0; 1]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0826 :
  binarySearch_New_fun [693; 670; 671; 676; 682; 687; 692; 695; 702; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0827 :
  binarySearch_New_fun [69; 61; 70; 75; 79; 84; 86; 91; 93; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0828 :
  binarySearch_New_fun [241; 241; 244; 248; 250; 253; 260; 262; 271; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0829 :
  binarySearch_New_fun [63; 34; 38; 42; 46; 49; 54; 62; 63; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0830 :
  binarySearch_New_fun [479; 458; 465; 473; 479; 483; 487; 496; 505; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0831 :
  binarySearch_New_fun [568; 562; 568; 572; 579; 588; 595; 603; 606; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0832 :
  binarySearch_New_fun [556; 555; 564; 567; 575; 583; 588; 596; 603; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0833 :
  binarySearch_New_fun [162; 134; 140; 146; 155; 163; 164; 167; 176; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0834 :
  binarySearch_New_fun [83; 83; 86; 95; 103; 112; 121; 130; 135; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0835 :
  binarySearch_New_fun [269; 230; 236; 240; 247; 250; 259; 262; 269; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0836 :
  binarySearch_New_fun [84; 62; 68; 76; 84; 87; 90; 95; 99; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0837 :
  binarySearch_New_fun [780; 780; 781; 783; 786; 793; 798; 804; 805; 0; 5]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0838 :
  binarySearch_New_fun [593; 573; 582; 587; 592; 601; 604; 611; 612; 1; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0839 :
  binarySearch_New_fun [132; 116; 118; 120; 126; 133; 142; 146; 153; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0840 :
  binarySearch_New_fun [755; 755; 763; 764; 768; 776; 777; 778; 787; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0841 :
  binarySearch_New_fun [939; 897; 904; 909; 912; 921; 927; 934; 939; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0842 :
  binarySearch_New_fun [552; 542; 543; 548; 552; 554; 561; 568; 572; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0843 :
  binarySearch_New_fun [344; 342; 344; 349; 354; 355; 360; 366; 375; 1; 4]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0844 :
  binarySearch_New_fun [484; 470; 474; 483; 488; 497; 505; 510; 514; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0845 :
  binarySearch_New_fun [300; 283; 291; 300; 301; 302; 307; 309; 314; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0846 :
  binarySearch_New_fun [760; 760; 766; 774; 782; 791; 795; 798; 804; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0847 :
  binarySearch_New_fun [73; 30; 33; 40; 49; 54; 63; 67; 73; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0848 :
  binarySearch_New_fun [823; 800; 809; 816; 823; 825; 827; 831; 838; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0849 :
  binarySearch_New_fun [589; 578; 582; 589; 592; 599; 604; 605; 614; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0850 :
  binarySearch_New_fun [536; 514; 519; 520; 527; 528; 531; 534; 535; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0851 :
  binarySearch_New_fun [262; 263; 266; 267; 270; 273; 279; 288; 290; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0852 :
  binarySearch_New_fun [255; 255; 258; 264; 271; 274; 276; 283; 288; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0853 :
  binarySearch_New_fun [874; 833; 835; 838; 845; 851; 860; 868; 874; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0854 :
  binarySearch_New_fun [455; 441; 447; 448; 455; 459; 466; 467; 476; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0855 :
  binarySearch_New_fun [398; 389; 390; 393; 398; 403; 411; 416; 417; 3; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0856 :
  binarySearch_New_fun [311; 310; 311; 317; 325; 331; 339; 348; 354; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0857 :
  binarySearch_New_fun [316; 317; 320; 326; 332; 341; 345; 347; 356; 0; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0858 :
  binarySearch_New_fun [934; 934; 936; 938; 943; 944; 950; 959; 963; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0859 :
  binarySearch_New_fun [686; 661; 662; 664; 671; 674; 678; 685; 686; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0860 :
  binarySearch_New_fun [269; 251; 259; 266; 269; 270; 274; 275; 276; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0861 :
  binarySearch_New_fun [444; 435; 436; 439; 444; 453; 456; 458; 466; 3; 6]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0862 :
  binarySearch_New_fun [441; 432; 440; 449; 451; 454; 458; 464; 466; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0863 :
  binarySearch_New_fun [250; 243; 245; 251; 252; 258; 265; 271; 279; 2; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0864 :
  binarySearch_New_fun [831; 831; 836; 838; 846; 852; 853; 854; 861; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0865 :
  binarySearch_New_fun [730; 696; 705; 710; 713; 716; 717; 723; 730; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0866 :
  binarySearch_New_fun [299; 285; 290; 293; 299; 305; 312; 316; 321; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0867 :
  binarySearch_New_fun [643; 623; 626; 628; 636; 643; 647; 654; 662; 4; 4]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0868 :
  binarySearch_New_fun [469; 449; 455; 456; 461; 468; 469; 477; 485; 3; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0869 :
  binarySearch_New_fun [881; 882; 886; 890; 891; 895; 904; 907; 914; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0870 :
  binarySearch_New_fun [33; 33; 39; 44; 53; 60; 65; 73; 75; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0871 :
  binarySearch_New_fun [73; 47; 51; 58; 61; 62; 64; 71; 73; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0872 :
  binarySearch_New_fun [167; 152; 157; 160; 167; 172; 179; 183; 185; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0873 :
  binarySearch_New_fun [671; 655; 658; 667; 668; 671; 672; 681; 690; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0874 :
  binarySearch_New_fun [150; 119; 120; 127; 133; 137; 140; 147; 149; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0875 :
  binarySearch_New_fun [518; 509; 512; 519; 520; 524; 532; 537; 545; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0876 :
  binarySearch_New_fun [850; 850; 851; 853; 856; 863; 871; 875; 883; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0877 :
  binarySearch_New_fun [274; 242; 243; 251; 255; 262; 269; 270; 274; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0878 :
  binarySearch_New_fun [336; 327; 333; 334; 336; 338; 345; 351; 353; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0879 :
  binarySearch_New_fun [595; 595; 602; 606; 607; 615; 621; 625; 629; 0; 4]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0880 :
  binarySearch_New_fun [130; 97; 98; 101; 103; 111; 115; 124; 129; 1; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0881 :
  binarySearch_New_fun [97; 79; 86; 90; 95; 98; 101; 106; 113; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0882 :
  binarySearch_New_fun [654; 654; 660; 661; 665; 673; 680; 689; 691; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0883 :
  binarySearch_New_fun [962; 929; 934; 937; 939; 945; 951; 955; 962; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0884 :
  binarySearch_New_fun [262; 248; 251; 259; 262; 265; 267; 272; 276; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0885 :
  binarySearch_New_fun [465; 465; 471; 480; 481; 489; 497; 499; 504; 0; 1]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0886 :
  binarySearch_New_fun [338; 322; 329; 335; 337; 344; 350; 359; 361; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0887 :
  binarySearch_New_fun [190; 182; 190; 191; 198; 205; 208; 214; 219; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0888 :
  binarySearch_New_fun [671; 671; 673; 682; 687; 696; 703; 708; 714; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0889 :
  binarySearch_New_fun [1005; 969; 970; 979; 981; 989; 993; 998; 1005; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0890 :
  binarySearch_New_fun [909; 896; 899; 907; 909; 918; 926; 929; 935; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0891 :
  binarySearch_New_fun [56; 35; 39; 48; 56; 63; 72; 78; 80; 3; 5]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0892 :
  binarySearch_New_fun [805; 785; 792; 801; 804; 808; 809; 811; 818; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0893 :
  binarySearch_New_fun [271; 255; 256; 263; 272; 273; 274; 281; 288; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0894 :
  binarySearch_New_fun [730; 730; 735; 743; 750; 752; 755; 758; 761; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0895 :
  binarySearch_New_fun [672; 640; 647; 652; 661; 667; 669; 671; 672; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0896 :
  binarySearch_New_fun [841; 829; 835; 836; 841; 849; 857; 865; 869; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0897 :
  binarySearch_New_fun [362; 350; 357; 361; 362; 368; 375; 378; 383; 3; 3]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0898 :
  binarySearch_New_fun [937; 913; 914; 917; 922; 926; 928; 930; 936; 4; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0899 :
  binarySearch_New_fun [881; 882; 885; 891; 893; 902; 905; 913; 922; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0900 :
  binarySearch_New_fun [23; 23; 29; 30; 39; 41; 45; 53; 59; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0901 :
  binarySearch_New_fun [683; 645; 651; 657; 660; 663; 669; 676; 683; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0902 :
  binarySearch_New_fun [685; 670; 675; 676; 685; 686; 693; 700; 709; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0903 :
  binarySearch_New_fun [1011; 1003; 1011; 1017; 1026; 1033; 1038; 1040; 1046; 1; 6]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0904 :
  binarySearch_New_fun [378; 364; 369; 372; 373; 377; 382; 384; 389; 2; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0905 :
  binarySearch_New_fun [735; 723; 730; 733; 736; 737; 744; 745; 754; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0906 :
  binarySearch_New_fun [462; 462; 470; 473; 474; 476; 483; 489; 497; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0907 :
  binarySearch_New_fun [1029; 977; 982; 988; 997; 1005; 1013; 1021; 1029; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0908 :
  binarySearch_New_fun [420; 403; 408; 417; 420; 427; 433; 440; 443; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0909 :
  binarySearch_New_fun [87; 76; 77; 79; 86; 87; 88; 93; 98; 4; 6]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0910 :
  binarySearch_New_fun [232; 184; 193; 202; 208; 211; 218; 224; 231; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0911 :
  binarySearch_New_fun [66; 55; 59; 67; 73; 77; 86; 90; 94; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0912 :
  binarySearch_New_fun [593; 593; 602; 605; 613; 618; 626; 630; 634; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0913 :
  binarySearch_New_fun [251; 219; 220; 226; 227; 233; 242; 245; 251; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0914 :
  binarySearch_New_fun [844; 828; 834; 839; 844; 851; 852; 860; 868; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0915 :
  binarySearch_New_fun [434; 405; 409; 416; 425; 434; 435; 438; 445; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0916 :
  binarySearch_New_fun [182; 144; 149; 156; 160; 164; 170; 174; 181; 3; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0917 :
  binarySearch_New_fun [450; 451; 456; 465; 469; 470; 476; 478; 483; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0918 :
  binarySearch_New_fun [850; 850; 858; 864; 870; 879; 888; 891; 900; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0919 :
  binarySearch_New_fun [368; 340; 341; 343; 348; 355; 357; 362; 368; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0920 :
  binarySearch_New_fun [218; 205; 211; 216; 218; 224; 228; 233; 237; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0921 :
  binarySearch_New_fun [558; 547; 553; 558; 563; 567; 570; 572; 576; 2; 2]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0922 :
  binarySearch_New_fun [140; 135; 139; 147; 153; 157; 159; 163; 169; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0923 :
  binarySearch_New_fun [517; 508; 516; 518; 523; 529; 538; 543; 552; 2; 7]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0924 :
  binarySearch_New_fun [854; 854; 862; 863; 867; 873; 880; 887; 896; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0925 :
  binarySearch_New_fun [161; 120; 126; 131; 134; 140; 148; 152; 161; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0926 :
  binarySearch_New_fun [370; 353; 360; 364; 370; 371; 376; 379; 380; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0927 :
  binarySearch_New_fun [399; 399; 402; 411; 412; 420; 428; 433; 440; 0; 3]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0928 :
  binarySearch_New_fun [641; 610; 619; 628; 632; 638; 640; 641; 650; 3; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0929 :
  binarySearch_New_fun [535; 516; 519; 522; 528; 536; 545; 552; 559; 4; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0930 :
  binarySearch_New_fun [804; 804; 810; 813; 821; 825; 830; 836; 841; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0931 :
  binarySearch_New_fun [265; 235; 243; 246; 247; 252; 256; 263; 265; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0932 :
  binarySearch_New_fun [1012; 991; 997; 1006; 1012; 1020; 1022; 1024; 1025; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0933 :
  binarySearch_New_fun [371; 365; 371; 376; 377; 382; 388; 389; 390; 1; 5]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0934 :
  binarySearch_New_fun [921; 893; 897; 901; 907; 911; 920; 924; 928; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0935 :
  binarySearch_New_fun [396; 384; 386; 388; 396; 397; 404; 408; 414; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0936 :
  binarySearch_New_fun [636; 636; 637; 645; 649; 652; 653; 662; 664; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0937 :
  binarySearch_New_fun [566; 535; 536; 540; 543; 547; 553; 559; 566; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0938 :
  binarySearch_New_fun [909; 890; 899; 903; 909; 914; 915; 917; 919; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0939 :
  binarySearch_New_fun [912; 901; 903; 907; 912; 913; 916; 919; 926; 3; 5]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0940 :
  binarySearch_New_fun [620; 596; 602; 606; 607; 609; 612; 619; 628; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0941 :
  binarySearch_New_fun [836; 829; 832; 837; 842; 843; 851; 855; 863; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0942 :
  binarySearch_New_fun [805; 805; 810; 815; 820; 822; 825; 826; 835; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0943 :
  binarySearch_New_fun [396; 366; 372; 373; 377; 386; 389; 391; 396; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0944 :
  binarySearch_New_fun [895; 875; 879; 886; 895; 904; 907; 914; 923; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0945 :
  binarySearch_New_fun [334; 327; 334; 343; 351; 359; 361; 366; 367; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example t_0946 :
  binarySearch_New_fun [1004; 993; 994; 1003; 1010; 1012; 1018; 1019; 1026; 0; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0947 :
  binarySearch_New_fun [910; 911; 916; 925; 934; 941; 946; 950; 953; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0948 :
  binarySearch_New_fun [1012; 1012; 1019; 1028; 1036; 1045; 1047; 1049; 1052; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0949 :
  binarySearch_New_fun [483; 453; 455; 456; 459; 466; 467; 475; 483; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0950 :
  binarySearch_New_fun [718; 708; 710; 713; 718; 727; 731; 738; 741; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0951 :
  binarySearch_New_fun [195; 184; 193; 195; 203; 210; 217; 223; 226; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0952 :
  binarySearch_New_fun [597; 573; 576; 578; 581; 586; 588; 596; 600; 2; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0953 :
  binarySearch_New_fun [892; 880; 882; 887; 893; 896; 900; 908; 912; 3; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0954 :
  binarySearch_New_fun [535; 535; 539; 543; 545; 551; 560; 563; 569; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0955 :
  binarySearch_New_fun [575; 534; 539; 547; 554; 556; 562; 566; 575; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0956 :
  binarySearch_New_fun [847; 830; 834; 843; 847; 856; 859; 861; 864; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0957 :
  binarySearch_New_fun [164; 164; 167; 169; 171; 174; 178; 185; 188; 0; 0]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0958 :
  binarySearch_New_fun [149; 144; 148; 150; 156; 158; 161; 162; 165; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0959 :
  binarySearch_New_fun [281; 282; 290; 293; 302; 311; 315; 324; 332; 0; 0]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0960 :
  binarySearch_New_fun [949; 949; 957; 961; 963; 967; 976; 984; 991; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0961 :
  binarySearch_New_fun [862; 826; 831; 837; 840; 846; 854; 855; 862; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0962 :
  binarySearch_New_fun [1038; 1015; 1023; 1029; 1038; 1047; 1051; 1055; 1056; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0963 :
  binarySearch_New_fun [46; 32; 40; 46; 48; 50; 53; 56; 63; 2; 4]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0964 :
  binarySearch_New_fun [422; 392; 394; 402; 408; 412; 417; 421; 426; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0965 :
  binarySearch_New_fun [336; 326; 332; 335; 337; 339; 347; 351; 360; 3; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0966 :
  binarySearch_New_fun [541; 541; 550; 551; 556; 557; 560; 561; 563; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0967 :
  binarySearch_New_fun [898; 856; 860; 867; 869; 876; 884; 891; 898; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0968 :
  binarySearch_New_fun [919; 912; 914; 918; 919; 921; 925; 930; 938; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0969 :
  binarySearch_New_fun [873; 866; 870; 873; 874; 875; 876; 877; 881; 2; 7]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0970 :
  binarySearch_New_fun [944; 933; 937; 943; 949; 952; 960; 963; 967; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0971 :
  binarySearch_New_fun [652; 640; 643; 647; 650; 653; 657; 664; 667; 4; 6]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0972 :
  binarySearch_New_fun [63; 63; 68; 71; 79; 81; 86; 90; 99; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0973 :
  binarySearch_New_fun [130; 75; 83; 86; 95; 104; 113; 121; 130; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0974 :
  binarySearch_New_fun [595; 582; 585; 593; 595; 596; 599; 604; 608; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0975 :
  binarySearch_New_fun [922; 909; 918; 922; 926; 929; 936; 944; 947; 2; 4]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0976 :
  binarySearch_New_fun [407; 377; 384; 390; 396; 405; 406; 412; 421; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0977 :
  binarySearch_New_fun [83; 84; 87; 88; 89; 92; 96; 105; 111; 0; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0978 :
  binarySearch_New_fun [919; 919; 928; 935; 936; 938; 943; 951; 955; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0979 :
  binarySearch_New_fun [233; 196; 200; 209; 213; 219; 227; 230; 233; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0980 :
  binarySearch_New_fun [437; 416; 422; 430; 437; 439; 447; 451; 453; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0981 :
  binarySearch_New_fun [372; 343; 352; 359; 367; 372; 381; 390; 394; 4; 7]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0982 :
  binarySearch_New_fun [566; 541; 545; 553; 555; 556; 565; 573; 580; 0; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0983 :
  binarySearch_New_fun [880; 881; 884; 887; 889; 898; 902; 909; 913; 0; 4]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0984 :
  binarySearch_New_fun [968; 968; 974; 979; 985; 992; 995; 1003; 1011; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0985 :
  binarySearch_New_fun [395; 346; 355; 361; 370; 378; 382; 388; 395; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0986 :
  binarySearch_New_fun [682; 673; 674; 675; 682; 684; 693; 700; 708; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0987 :
  binarySearch_New_fun [178; 168; 176; 178; 185; 193; 197; 205; 209; 2; 6]
  = [2].
Proof. vm_compute. reflexivity. Qed.


Example t_0988 :
  binarySearch_New_fun [454; 451; 453; 460; 461; 470; 479; 481; 487; 1; 1]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0989 :
  binarySearch_New_fun [856; 841; 845; 846; 849; 857; 863; 870; 879; 4; 5]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0990 :
  binarySearch_New_fun [671; 671; 675; 684; 685; 692; 693; 702; 707; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0991 :
  binarySearch_New_fun [353; 313; 316; 324; 327; 333; 337; 344; 353; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0992 :
  binarySearch_New_fun [229; 215; 222; 224; 229; 237; 242; 251; 260; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0993 :
  binarySearch_New_fun [340; 324; 333; 336; 337; 340; 346; 354; 363; 4; 5]
  = [4].
Proof. vm_compute. reflexivity. Qed.


Example t_0994 :
  binarySearch_New_fun [226; 215; 216; 225; 227; 234; 240; 245; 247; 2; 2]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0995 :
  binarySearch_New_fun [438; 429; 434; 439; 444; 452; 461; 465; 470; 2; 3]
  = [-1].
Proof. vm_compute. reflexivity. Qed.


Example t_0996 :
  binarySearch_New_fun [908; 908; 916; 918; 919; 921; 927; 932; 937; 0; 7]
  = [0].
Proof. vm_compute. reflexivity. Qed.


Example t_0997 :
  binarySearch_New_fun [509; 463; 469; 475; 479; 485; 494; 501; 509; 0; 7]
  = [7].
Proof. vm_compute. reflexivity. Qed.


Example t_0998 :
  binarySearch_New_fun [1005; 989; 997; 1001; 1005; 1007; 1016; 1017; 1023; 0; 7]
  = [3].
Proof. vm_compute. reflexivity. Qed.


Example t_0999 :
  binarySearch_New_fun [537; 532; 537; 540; 541; 550; 558; 567; 572; 1; 7]
  = [1].
Proof. vm_compute. reflexivity. Qed.


Example negative_control_wrong_expected :
  binarySearch_New_fun [426; 426; 428; 436; 439; 444; 448; 454; 456; 0; 7]
  <> [1].
Proof. vm_compute. discriminate. Qed.
