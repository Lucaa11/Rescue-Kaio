   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 54 void ADC2_DeInit(void)
  41                     ; 55 {
  43                     	switch	.text
  44  0000               _ADC2_DeInit:
  48                     ; 56   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  50  0000 725f5400      	clr	21504
  51                     ; 57   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  53  0004 725f5401      	clr	21505
  54                     ; 58   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  56  0008 725f5402      	clr	21506
  57                     ; 59   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  59  000c 725f5406      	clr	21510
  60                     ; 60   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  62  0010 725f5407      	clr	21511
  63                     ; 61 }
  66  0014 81            	ret
 592                     ; 83 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 592                     ; 84 {
 593                     	switch	.text
 594  0015               _ADC2_Init:
 596  0015 89            	pushw	x
 597       00000000      OFST:	set	0
 600                     ; 86   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 602                     ; 87   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 604                     ; 88   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 606                     ; 89   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 608                     ; 90   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 610                     ; 91   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 612                     ; 92   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 614                     ; 93   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 616                     ; 98   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 618  0016 7b08          	ld	a,(OFST+8,sp)
 619  0018 88            	push	a
 620  0019 9f            	ld	a,xl
 621  001a 97            	ld	xl,a
 622  001b 7b02          	ld	a,(OFST+2,sp)
 623  001d 95            	ld	xh,a
 624  001e cd00fa        	call	_ADC2_ConversionConfig
 626  0021 84            	pop	a
 627                     ; 100   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 629  0022 7b05          	ld	a,(OFST+5,sp)
 630  0024 ad33          	call	_ADC2_PrescalerConfig
 632                     ; 105   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 634  0026 7b07          	ld	a,(OFST+7,sp)
 635  0028 97            	ld	xl,a
 636  0029 7b06          	ld	a,(OFST+6,sp)
 637  002b 95            	ld	xh,a
 638  002c cd0128        	call	_ADC2_ExternalTriggerConfig
 640                     ; 110   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 642  002f 7b0a          	ld	a,(OFST+10,sp)
 643  0031 97            	ld	xl,a
 644  0032 7b09          	ld	a,(OFST+9,sp)
 645  0034 95            	ld	xh,a
 646  0035 ad35          	call	_ADC2_SchmittTriggerConfig
 648                     ; 113   ADC2->CR1 |= ADC2_CR1_ADON;
 650  0037 72105401      	bset	21505,#0
 651                     ; 114 }
 654  003b 85            	popw	x
 655  003c 81            	ret
 690                     ; 121 void ADC2_Cmd(FunctionalState NewState)
 690                     ; 122 {
 691                     	switch	.text
 692  003d               _ADC2_Cmd:
 696                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 698                     ; 126   if (NewState != DISABLE)
 700  003d 4d            	tnz	a
 701  003e 2706          	jreq	L703
 702                     ; 128     ADC2->CR1 |= ADC2_CR1_ADON;
 704  0040 72105401      	bset	21505,#0
 706  0044 2004          	jra	L113
 707  0046               L703:
 708                     ; 132     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 710  0046 72115401      	bres	21505,#0
 711  004a               L113:
 712                     ; 134 }
 715  004a 81            	ret
 750                     ; 141 void ADC2_ITConfig(FunctionalState NewState)
 750                     ; 142 {
 751                     	switch	.text
 752  004b               _ADC2_ITConfig:
 756                     ; 144   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 758                     ; 146   if (NewState != DISABLE)
 760  004b 4d            	tnz	a
 761  004c 2706          	jreq	L133
 762                     ; 149     ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
 764  004e 721a5400      	bset	21504,#5
 766  0052 2004          	jra	L333
 767  0054               L133:
 768                     ; 154     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
 770  0054 721b5400      	bres	21504,#5
 771  0058               L333:
 772                     ; 156 }
 775  0058 81            	ret
 811                     ; 164 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
 811                     ; 165 {
 812                     	switch	.text
 813  0059               _ADC2_PrescalerConfig:
 815  0059 88            	push	a
 816       00000000      OFST:	set	0
 819                     ; 167   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
 821                     ; 170   ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
 823  005a c65401        	ld	a,21505
 824  005d a48f          	and	a,#143
 825  005f c75401        	ld	21505,a
 826                     ; 172   ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
 828  0062 c65401        	ld	a,21505
 829  0065 1a01          	or	a,(OFST+1,sp)
 830  0067 c75401        	ld	21505,a
 831                     ; 173 }
 834  006a 84            	pop	a
 835  006b 81            	ret
 882                     ; 183 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
 882                     ; 184 {
 883                     	switch	.text
 884  006c               _ADC2_SchmittTriggerConfig:
 886  006c 89            	pushw	x
 887       00000000      OFST:	set	0
 890                     ; 186   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 892                     ; 187   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 894                     ; 189   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
 896  006d 9e            	ld	a,xh
 897  006e a11f          	cp	a,#31
 898  0070 2620          	jrne	L573
 899                     ; 191     if (NewState != DISABLE)
 901  0072 9f            	ld	a,xl
 902  0073 4d            	tnz	a
 903  0074 270a          	jreq	L773
 904                     ; 193       ADC2->TDRL &= (uint8_t)0x0;
 906  0076 725f5407      	clr	21511
 907                     ; 194       ADC2->TDRH &= (uint8_t)0x0;
 909  007a 725f5406      	clr	21510
 911  007e 2078          	jra	L304
 912  0080               L773:
 913                     ; 198       ADC2->TDRL |= (uint8_t)0xFF;
 915  0080 c65407        	ld	a,21511
 916  0083 aaff          	or	a,#255
 917  0085 c75407        	ld	21511,a
 918                     ; 199       ADC2->TDRH |= (uint8_t)0xFF;
 920  0088 c65406        	ld	a,21510
 921  008b aaff          	or	a,#255
 922  008d c75406        	ld	21510,a
 923  0090 2066          	jra	L304
 924  0092               L573:
 925                     ; 202   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
 927  0092 7b01          	ld	a,(OFST+1,sp)
 928  0094 a108          	cp	a,#8
 929  0096 242f          	jruge	L504
 930                     ; 204     if (NewState != DISABLE)
 932  0098 0d02          	tnz	(OFST+2,sp)
 933  009a 2716          	jreq	L704
 934                     ; 206       ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
 936  009c 7b01          	ld	a,(OFST+1,sp)
 937  009e 5f            	clrw	x
 938  009f 97            	ld	xl,a
 939  00a0 a601          	ld	a,#1
 940  00a2 5d            	tnzw	x
 941  00a3 2704          	jreq	L02
 942  00a5               L22:
 943  00a5 48            	sll	a
 944  00a6 5a            	decw	x
 945  00a7 26fc          	jrne	L22
 946  00a9               L02:
 947  00a9 43            	cpl	a
 948  00aa c45407        	and	a,21511
 949  00ad c75407        	ld	21511,a
 951  00b0 2046          	jra	L304
 952  00b2               L704:
 953                     ; 210       ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
 955  00b2 7b01          	ld	a,(OFST+1,sp)
 956  00b4 5f            	clrw	x
 957  00b5 97            	ld	xl,a
 958  00b6 a601          	ld	a,#1
 959  00b8 5d            	tnzw	x
 960  00b9 2704          	jreq	L42
 961  00bb               L62:
 962  00bb 48            	sll	a
 963  00bc 5a            	decw	x
 964  00bd 26fc          	jrne	L62
 965  00bf               L42:
 966  00bf ca5407        	or	a,21511
 967  00c2 c75407        	ld	21511,a
 968  00c5 2031          	jra	L304
 969  00c7               L504:
 970                     ; 215     if (NewState != DISABLE)
 972  00c7 0d02          	tnz	(OFST+2,sp)
 973  00c9 2718          	jreq	L514
 974                     ; 217       ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
 976  00cb 7b01          	ld	a,(OFST+1,sp)
 977  00cd a008          	sub	a,#8
 978  00cf 5f            	clrw	x
 979  00d0 97            	ld	xl,a
 980  00d1 a601          	ld	a,#1
 981  00d3 5d            	tnzw	x
 982  00d4 2704          	jreq	L03
 983  00d6               L23:
 984  00d6 48            	sll	a
 985  00d7 5a            	decw	x
 986  00d8 26fc          	jrne	L23
 987  00da               L03:
 988  00da 43            	cpl	a
 989  00db c45406        	and	a,21510
 990  00de c75406        	ld	21510,a
 992  00e1 2015          	jra	L304
 993  00e3               L514:
 994                     ; 221       ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
 996  00e3 7b01          	ld	a,(OFST+1,sp)
 997  00e5 a008          	sub	a,#8
 998  00e7 5f            	clrw	x
 999  00e8 97            	ld	xl,a
1000  00e9 a601          	ld	a,#1
1001  00eb 5d            	tnzw	x
1002  00ec 2704          	jreq	L43
1003  00ee               L63:
1004  00ee 48            	sll	a
1005  00ef 5a            	decw	x
1006  00f0 26fc          	jrne	L63
1007  00f2               L43:
1008  00f2 ca5406        	or	a,21510
1009  00f5 c75406        	ld	21510,a
1010  00f8               L304:
1011                     ; 224 }
1014  00f8 85            	popw	x
1015  00f9 81            	ret
1072                     ; 236 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1072                     ; 237 {
1073                     	switch	.text
1074  00fa               _ADC2_ConversionConfig:
1076  00fa 89            	pushw	x
1077       00000000      OFST:	set	0
1080                     ; 239   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1082                     ; 240   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1084                     ; 241   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1086                     ; 244   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1088  00fb 72175402      	bres	21506,#3
1089                     ; 246   ADC2->CR2 |= (uint8_t)(ADC2_Align);
1091  00ff c65402        	ld	a,21506
1092  0102 1a05          	or	a,(OFST+5,sp)
1093  0104 c75402        	ld	21506,a
1094                     ; 248   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1096  0107 9e            	ld	a,xh
1097  0108 a101          	cp	a,#1
1098  010a 2606          	jrne	L744
1099                     ; 251     ADC2->CR1 |= ADC2_CR1_CONT;
1101  010c 72125401      	bset	21505,#1
1103  0110 2004          	jra	L154
1104  0112               L744:
1105                     ; 256     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1107  0112 72135401      	bres	21505,#1
1108  0116               L154:
1109                     ; 260   ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1111  0116 c65400        	ld	a,21504
1112  0119 a4f0          	and	a,#240
1113  011b c75400        	ld	21504,a
1114                     ; 262   ADC2->CSR |= (uint8_t)(ADC2_Channel);
1116  011e c65400        	ld	a,21504
1117  0121 1a02          	or	a,(OFST+2,sp)
1118  0123 c75400        	ld	21504,a
1119                     ; 263 }
1122  0126 85            	popw	x
1123  0127 81            	ret
1169                     ; 275 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1169                     ; 276 {
1170                     	switch	.text
1171  0128               _ADC2_ExternalTriggerConfig:
1173  0128 89            	pushw	x
1174       00000000      OFST:	set	0
1177                     ; 278   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1179                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1181                     ; 282   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1183  0129 c65402        	ld	a,21506
1184  012c a4cf          	and	a,#207
1185  012e c75402        	ld	21506,a
1186                     ; 284   if (NewState != DISABLE)
1188  0131 9f            	ld	a,xl
1189  0132 4d            	tnz	a
1190  0133 2706          	jreq	L574
1191                     ; 287     ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1193  0135 721c5402      	bset	21506,#6
1195  0139 2004          	jra	L774
1196  013b               L574:
1197                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1199  013b 721d5402      	bres	21506,#6
1200  013f               L774:
1201                     ; 296   ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1203  013f c65402        	ld	a,21506
1204  0142 1a01          	or	a,(OFST+1,sp)
1205  0144 c75402        	ld	21506,a
1206                     ; 297 }
1209  0147 85            	popw	x
1210  0148 81            	ret
1234                     ; 308 void ADC2_StartConversion(void)
1234                     ; 309 {
1235                     	switch	.text
1236  0149               _ADC2_StartConversion:
1240                     ; 310   ADC2->CR1 |= ADC2_CR1_ADON;
1242  0149 72105401      	bset	21505,#0
1243                     ; 311 }
1246  014d 81            	ret
1286                     ; 320 uint16_t ADC2_GetConversionValue(void)
1286                     ; 321 {
1287                     	switch	.text
1288  014e               _ADC2_GetConversionValue:
1290  014e 5205          	subw	sp,#5
1291       00000005      OFST:	set	5
1294                     ; 322   uint16_t temph = 0;
1296                     ; 323   uint8_t templ = 0;
1298                     ; 325   if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1300  0150 c65402        	ld	a,21506
1301  0153 a508          	bcp	a,#8
1302  0155 2715          	jreq	L725
1303                     ; 328     templ = ADC2->DRL;
1305  0157 c65405        	ld	a,21509
1306  015a 6b03          	ld	(OFST-2,sp),a
1308                     ; 330     temph = ADC2->DRH;
1310  015c c65404        	ld	a,21508
1311  015f 5f            	clrw	x
1312  0160 97            	ld	xl,a
1313  0161 1f04          	ldw	(OFST-1,sp),x
1315                     ; 332     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1317  0163 1e04          	ldw	x,(OFST-1,sp)
1318  0165 7b03          	ld	a,(OFST-2,sp)
1319  0167 02            	rlwa	x,a
1320  0168 1f04          	ldw	(OFST-1,sp),x
1323  016a 2021          	jra	L135
1324  016c               L725:
1325                     ; 337     temph = ADC2->DRH;
1327  016c c65404        	ld	a,21508
1328  016f 5f            	clrw	x
1329  0170 97            	ld	xl,a
1330  0171 1f04          	ldw	(OFST-1,sp),x
1332                     ; 339     templ = ADC2->DRL;
1334  0173 c65405        	ld	a,21509
1335  0176 6b03          	ld	(OFST-2,sp),a
1337                     ; 341     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1339  0178 1e04          	ldw	x,(OFST-1,sp)
1340  017a 4f            	clr	a
1341  017b 02            	rlwa	x,a
1342  017c 1f01          	ldw	(OFST-4,sp),x
1344  017e 7b03          	ld	a,(OFST-2,sp)
1345  0180 97            	ld	xl,a
1346  0181 a640          	ld	a,#64
1347  0183 42            	mul	x,a
1348  0184 01            	rrwa	x,a
1349  0185 1a02          	or	a,(OFST-3,sp)
1350  0187 01            	rrwa	x,a
1351  0188 1a01          	or	a,(OFST-4,sp)
1352  018a 01            	rrwa	x,a
1353  018b 1f04          	ldw	(OFST-1,sp),x
1355  018d               L135:
1356                     ; 344   return ((uint16_t)temph);
1358  018d 1e04          	ldw	x,(OFST-1,sp)
1361  018f 5b05          	addw	sp,#5
1362  0191 81            	ret
1406                     ; 352 FlagStatus ADC2_GetFlagStatus(void)
1406                     ; 353 {
1407                     	switch	.text
1408  0192               _ADC2_GetFlagStatus:
1412                     ; 355   return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1414  0192 c65400        	ld	a,21504
1415  0195 a480          	and	a,#128
1418  0197 81            	ret
1441                     ; 363 void ADC2_ClearFlag(void)
1441                     ; 364 {
1442                     	switch	.text
1443  0198               _ADC2_ClearFlag:
1447                     ; 365   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1449  0198 721f5400      	bres	21504,#7
1450                     ; 366 }
1453  019c 81            	ret
1477                     ; 374 ITStatus ADC2_GetITStatus(void)
1477                     ; 375 {
1478                     	switch	.text
1479  019d               _ADC2_GetITStatus:
1483                     ; 376   return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
1485  019d c65400        	ld	a,21504
1486  01a0 a480          	and	a,#128
1489  01a2 81            	ret
1513                     ; 384 void ADC2_ClearITPendingBit(void)
1513                     ; 385 {
1514                     	switch	.text
1515  01a3               _ADC2_ClearITPendingBit:
1519                     ; 386   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1521  01a3 721f5400      	bres	21504,#7
1522                     ; 387 }
1525  01a7 81            	ret
1538                     	xdef	_ADC2_ClearITPendingBit
1539                     	xdef	_ADC2_GetITStatus
1540                     	xdef	_ADC2_ClearFlag
1541                     	xdef	_ADC2_GetFlagStatus
1542                     	xdef	_ADC2_GetConversionValue
1543                     	xdef	_ADC2_StartConversion
1544                     	xdef	_ADC2_ExternalTriggerConfig
1545                     	xdef	_ADC2_ConversionConfig
1546                     	xdef	_ADC2_SchmittTriggerConfig
1547                     	xdef	_ADC2_PrescalerConfig
1548                     	xdef	_ADC2_ITConfig
1549                     	xdef	_ADC2_Cmd
1550                     	xdef	_ADC2_Init
1551                     	xdef	_ADC2_DeInit
1570                     	end
