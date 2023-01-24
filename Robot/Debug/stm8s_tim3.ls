   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 51 void TIM3_DeInit(void)
  41                     ; 52 {
  43                     	switch	.text
  44  0000               _TIM3_DeInit:
  48                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  50  0000 725f5320      	clr	21280
  51                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  53  0004 725f5321      	clr	21281
  54                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  56  0008 725f5323      	clr	21283
  57                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  59  000c 725f5327      	clr	21287
  60                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  62  0010 725f5327      	clr	21287
  63                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  65  0014 725f5325      	clr	21285
  66                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  68  0018 725f5326      	clr	21286
  69                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  71  001c 725f5328      	clr	21288
  72                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  74  0020 725f5329      	clr	21289
  75                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  77  0024 725f532a      	clr	21290
  78                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  80  0028 35ff532b      	mov	21291,#255
  81                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  83  002c 35ff532c      	mov	21292,#255
  84                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  86  0030 725f532d      	clr	21293
  87                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  89  0034 725f532e      	clr	21294
  90                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  92  0038 725f532f      	clr	21295
  93                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  95  003c 725f5330      	clr	21296
  96                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  98  0040 725f5322      	clr	21282
  99                     ; 74 }
 102  0044 81            	ret
 268                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 268                     ; 83                         uint16_t TIM3_Period)
 268                     ; 84 {
 269                     	switch	.text
 270  0045               _TIM3_TimeBaseInit:
 272  0045 88            	push	a
 273       00000000      OFST:	set	0
 276                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 278  0046 c7532a        	ld	21290,a
 279                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 281  0049 7b04          	ld	a,(OFST+4,sp)
 282  004b c7532b        	ld	21291,a
 283                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 285  004e 7b05          	ld	a,(OFST+5,sp)
 286  0050 c7532c        	ld	21292,a
 287                     ; 90 }
 290  0053 84            	pop	a
 291  0054 81            	ret
 446                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 446                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 446                     ; 102                   uint16_t TIM3_Pulse,
 446                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 446                     ; 104 {
 447                     	switch	.text
 448  0055               _TIM3_OC1Init:
 450  0055 89            	pushw	x
 451  0056 88            	push	a
 452       00000001      OFST:	set	1
 455                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 457                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 459                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 461                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 463  0057 c65327        	ld	a,21287
 464  005a a4fc          	and	a,#252
 465  005c c75327        	ld	21287,a
 466                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 468  005f 7b08          	ld	a,(OFST+7,sp)
 469  0061 a402          	and	a,#2
 470  0063 6b01          	ld	(OFST+0,sp),a
 472  0065 9f            	ld	a,xl
 473  0066 a401          	and	a,#1
 474  0068 1a01          	or	a,(OFST+0,sp)
 475  006a ca5327        	or	a,21287
 476  006d c75327        	ld	21287,a
 477                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 479  0070 c65325        	ld	a,21285
 480  0073 a48f          	and	a,#143
 481  0075 1a02          	or	a,(OFST+1,sp)
 482  0077 c75325        	ld	21285,a
 483                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 485  007a 7b06          	ld	a,(OFST+5,sp)
 486  007c c7532d        	ld	21293,a
 487                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 489  007f 7b07          	ld	a,(OFST+6,sp)
 490  0081 c7532e        	ld	21294,a
 491                     ; 121 }
 494  0084 5b03          	addw	sp,#3
 495  0086 81            	ret
 557                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 557                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 557                     ; 133                   uint16_t TIM3_Pulse,
 557                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 557                     ; 135 {
 558                     	switch	.text
 559  0087               _TIM3_OC2Init:
 561  0087 89            	pushw	x
 562  0088 88            	push	a
 563       00000001      OFST:	set	1
 566                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 568                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 570                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 572                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 574  0089 c65327        	ld	a,21287
 575  008c a4cf          	and	a,#207
 576  008e c75327        	ld	21287,a
 577                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 579  0091 7b08          	ld	a,(OFST+7,sp)
 580  0093 a420          	and	a,#32
 581  0095 6b01          	ld	(OFST+0,sp),a
 583  0097 9f            	ld	a,xl
 584  0098 a410          	and	a,#16
 585  009a 1a01          	or	a,(OFST+0,sp)
 586  009c ca5327        	or	a,21287
 587  009f c75327        	ld	21287,a
 588                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 590  00a2 c65326        	ld	a,21286
 591  00a5 a48f          	and	a,#143
 592  00a7 1a02          	or	a,(OFST+1,sp)
 593  00a9 c75326        	ld	21286,a
 594                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 596  00ac 7b06          	ld	a,(OFST+5,sp)
 597  00ae c7532f        	ld	21295,a
 598                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 600  00b1 7b07          	ld	a,(OFST+6,sp)
 601  00b3 c75330        	ld	21296,a
 602                     ; 155 }
 605  00b6 5b03          	addw	sp,#3
 606  00b8 81            	ret
 788                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 788                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 788                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 788                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 788                     ; 170                  uint8_t TIM3_ICFilter)
 788                     ; 171 {
 789                     	switch	.text
 790  00b9               _TIM3_ICInit:
 792  00b9 89            	pushw	x
 793       00000000      OFST:	set	0
 796                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 798                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 800                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 802                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 804                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 806                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 808  00ba 9e            	ld	a,xh
 809  00bb a101          	cp	a,#1
 810  00bd 2714          	jreq	L333
 811                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 811                     ; 183                (uint8_t)TIM3_ICSelection,
 811                     ; 184                (uint8_t)TIM3_ICFilter);
 813  00bf 7b07          	ld	a,(OFST+7,sp)
 814  00c1 88            	push	a
 815  00c2 7b06          	ld	a,(OFST+6,sp)
 816  00c4 97            	ld	xl,a
 817  00c5 7b03          	ld	a,(OFST+3,sp)
 818  00c7 95            	ld	xh,a
 819  00c8 cd0360        	call	L3_TI1_Config
 821  00cb 84            	pop	a
 822                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 824  00cc 7b06          	ld	a,(OFST+6,sp)
 825  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 828  00d1 2012          	jra	L533
 829  00d3               L333:
 830                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 830                     ; 193                (uint8_t)TIM3_ICSelection,
 830                     ; 194                (uint8_t)TIM3_ICFilter);
 832  00d3 7b07          	ld	a,(OFST+7,sp)
 833  00d5 88            	push	a
 834  00d6 7b06          	ld	a,(OFST+6,sp)
 835  00d8 97            	ld	xl,a
 836  00d9 7b03          	ld	a,(OFST+3,sp)
 837  00db 95            	ld	xh,a
 838  00dc cd0390        	call	L5_TI2_Config
 840  00df 84            	pop	a
 841                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 843  00e0 7b06          	ld	a,(OFST+6,sp)
 844  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 846  00e5               L533:
 847                     ; 199 }
 850  00e5 85            	popw	x
 851  00e6 81            	ret
 941                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 941                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 941                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 941                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 941                     ; 214                      uint8_t TIM3_ICFilter)
 941                     ; 215 {
 942                     	switch	.text
 943  00e7               _TIM3_PWMIConfig:
 945  00e7 89            	pushw	x
 946  00e8 89            	pushw	x
 947       00000002      OFST:	set	2
 950                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 952                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 954                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 956                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 958                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 960                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 962                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 964  00e9 9f            	ld	a,xl
 965  00ea a144          	cp	a,#68
 966  00ec 2706          	jreq	L773
 967                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 969  00ee a644          	ld	a,#68
 970  00f0 6b01          	ld	(OFST-1,sp),a
 973  00f2 2002          	jra	L104
 974  00f4               L773:
 975                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 977  00f4 0f01          	clr	(OFST-1,sp)
 979  00f6               L104:
 980                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 982  00f6 7b07          	ld	a,(OFST+5,sp)
 983  00f8 a101          	cp	a,#1
 984  00fa 2606          	jrne	L304
 985                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 987  00fc a602          	ld	a,#2
 988  00fe 6b02          	ld	(OFST+0,sp),a
 991  0100 2004          	jra	L504
 992  0102               L304:
 993                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 995  0102 a601          	ld	a,#1
 996  0104 6b02          	ld	(OFST+0,sp),a
 998  0106               L504:
 999                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1001  0106 7b03          	ld	a,(OFST+1,sp)
1002  0108 a101          	cp	a,#1
1003  010a 2726          	jreq	L704
1004                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1004                     ; 249                (uint8_t)TIM3_ICFilter);
1006  010c 7b09          	ld	a,(OFST+7,sp)
1007  010e 88            	push	a
1008  010f 7b08          	ld	a,(OFST+6,sp)
1009  0111 97            	ld	xl,a
1010  0112 7b05          	ld	a,(OFST+3,sp)
1011  0114 95            	ld	xh,a
1012  0115 cd0360        	call	L3_TI1_Config
1014  0118 84            	pop	a
1015                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1017  0119 7b08          	ld	a,(OFST+6,sp)
1018  011b cd0285        	call	_TIM3_SetIC1Prescaler
1020                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1022  011e 7b09          	ld	a,(OFST+7,sp)
1023  0120 88            	push	a
1024  0121 7b03          	ld	a,(OFST+1,sp)
1025  0123 97            	ld	xl,a
1026  0124 7b02          	ld	a,(OFST+0,sp)
1027  0126 95            	ld	xh,a
1028  0127 cd0390        	call	L5_TI2_Config
1030  012a 84            	pop	a
1031                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1033  012b 7b08          	ld	a,(OFST+6,sp)
1034  012d cd0292        	call	_TIM3_SetIC2Prescaler
1037  0130 2024          	jra	L114
1038  0132               L704:
1039                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1039                     ; 264                (uint8_t)TIM3_ICFilter);
1041  0132 7b09          	ld	a,(OFST+7,sp)
1042  0134 88            	push	a
1043  0135 7b08          	ld	a,(OFST+6,sp)
1044  0137 97            	ld	xl,a
1045  0138 7b05          	ld	a,(OFST+3,sp)
1046  013a 95            	ld	xh,a
1047  013b cd0390        	call	L5_TI2_Config
1049  013e 84            	pop	a
1050                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1052  013f 7b08          	ld	a,(OFST+6,sp)
1053  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1055                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1057  0144 7b09          	ld	a,(OFST+7,sp)
1058  0146 88            	push	a
1059  0147 7b03          	ld	a,(OFST+1,sp)
1060  0149 97            	ld	xl,a
1061  014a 7b02          	ld	a,(OFST+0,sp)
1062  014c 95            	ld	xh,a
1063  014d cd0360        	call	L3_TI1_Config
1065  0150 84            	pop	a
1066                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1068  0151 7b08          	ld	a,(OFST+6,sp)
1069  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1071  0156               L114:
1072                     ; 275 }
1075  0156 5b04          	addw	sp,#4
1076  0158 81            	ret
1131                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1131                     ; 284 {
1132                     	switch	.text
1133  0159               _TIM3_Cmd:
1137                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1139                     ; 289   if (NewState != DISABLE)
1141  0159 4d            	tnz	a
1142  015a 2706          	jreq	L144
1143                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1145  015c 72105320      	bset	21280,#0
1147  0160 2004          	jra	L344
1148  0162               L144:
1149                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1151  0162 72115320      	bres	21280,#0
1152  0166               L344:
1153                     ; 297 }
1156  0166 81            	ret
1228                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1228                     ; 312 {
1229                     	switch	.text
1230  0167               _TIM3_ITConfig:
1232  0167 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1238                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1240                     ; 317   if (NewState != DISABLE)
1242  0168 9f            	ld	a,xl
1243  0169 4d            	tnz	a
1244  016a 2709          	jreq	L105
1245                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1247  016c 9e            	ld	a,xh
1248  016d ca5321        	or	a,21281
1249  0170 c75321        	ld	21281,a
1251  0173 2009          	jra	L305
1252  0175               L105:
1253                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1255  0175 7b01          	ld	a,(OFST+1,sp)
1256  0177 43            	cpl	a
1257  0178 c45321        	and	a,21281
1258  017b c75321        	ld	21281,a
1259  017e               L305:
1260                     ; 327 }
1263  017e 85            	popw	x
1264  017f 81            	ret
1300                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1300                     ; 336 {
1301                     	switch	.text
1302  0180               _TIM3_UpdateDisableConfig:
1306                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1308                     ; 341   if (NewState != DISABLE)
1310  0180 4d            	tnz	a
1311  0181 2706          	jreq	L325
1312                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1314  0183 72125320      	bset	21280,#1
1316  0187 2004          	jra	L525
1317  0189               L325:
1318                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1320  0189 72135320      	bres	21280,#1
1321  018d               L525:
1322                     ; 349 }
1325  018d 81            	ret
1383                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1383                     ; 360 {
1384                     	switch	.text
1385  018e               _TIM3_UpdateRequestConfig:
1389                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1391                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1393  018e 4d            	tnz	a
1394  018f 2706          	jreq	L555
1395                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1397  0191 72145320      	bset	21280,#2
1399  0195 2004          	jra	L755
1400  0197               L555:
1401                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1403  0197 72155320      	bres	21280,#2
1404  019b               L755:
1405                     ; 373 }
1408  019b 81            	ret
1465                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1465                     ; 384 {
1466                     	switch	.text
1467  019c               _TIM3_SelectOnePulseMode:
1471                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1473                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1475  019c 4d            	tnz	a
1476  019d 2706          	jreq	L706
1477                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1479  019f 72165320      	bset	21280,#3
1481  01a3 2004          	jra	L116
1482  01a5               L706:
1483                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1485  01a5 72175320      	bres	21280,#3
1486  01a9               L116:
1487                     ; 397 }
1490  01a9 81            	ret
1558                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1558                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1558                     ; 429 {
1559                     	switch	.text
1560  01aa               _TIM3_PrescalerConfig:
1564                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1566                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1568                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1570  01aa 9e            	ld	a,xh
1571  01ab c7532a        	ld	21290,a
1572                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1574  01ae 9f            	ld	a,xl
1575  01af c75324        	ld	21284,a
1576                     ; 439 }
1579  01b2 81            	ret
1637                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1637                     ; 451 {
1638                     	switch	.text
1639  01b3               _TIM3_ForcedOC1Config:
1641  01b3 88            	push	a
1642       00000000      OFST:	set	0
1645                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1647                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1649  01b4 c65325        	ld	a,21285
1650  01b7 a48f          	and	a,#143
1651  01b9 1a01          	or	a,(OFST+1,sp)
1652  01bb c75325        	ld	21285,a
1653                     ; 457 }
1656  01be 84            	pop	a
1657  01bf 81            	ret
1693                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1693                     ; 469 {
1694                     	switch	.text
1695  01c0               _TIM3_ForcedOC2Config:
1697  01c0 88            	push	a
1698       00000000      OFST:	set	0
1701                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1703                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1705  01c1 c65326        	ld	a,21286
1706  01c4 a48f          	and	a,#143
1707  01c6 1a01          	or	a,(OFST+1,sp)
1708  01c8 c75326        	ld	21286,a
1709                     ; 475 }
1712  01cb 84            	pop	a
1713  01cc 81            	ret
1749                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1749                     ; 484 {
1750                     	switch	.text
1751  01cd               _TIM3_ARRPreloadConfig:
1755                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1757                     ; 489   if (NewState != DISABLE)
1759  01cd 4d            	tnz	a
1760  01ce 2706          	jreq	L727
1761                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1763  01d0 721e5320      	bset	21280,#7
1765  01d4 2004          	jra	L137
1766  01d6               L727:
1767                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1769  01d6 721f5320      	bres	21280,#7
1770  01da               L137:
1771                     ; 497 }
1774  01da 81            	ret
1810                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1810                     ; 506 {
1811                     	switch	.text
1812  01db               _TIM3_OC1PreloadConfig:
1816                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1818                     ; 511   if (NewState != DISABLE)
1820  01db 4d            	tnz	a
1821  01dc 2706          	jreq	L157
1822                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1824  01de 72165325      	bset	21285,#3
1826  01e2 2004          	jra	L357
1827  01e4               L157:
1828                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1830  01e4 72175325      	bres	21285,#3
1831  01e8               L357:
1832                     ; 519 }
1835  01e8 81            	ret
1871                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1871                     ; 528 {
1872                     	switch	.text
1873  01e9               _TIM3_OC2PreloadConfig:
1877                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1879                     ; 533   if (NewState != DISABLE)
1881  01e9 4d            	tnz	a
1882  01ea 2706          	jreq	L377
1883                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1885  01ec 72165326      	bset	21286,#3
1887  01f0 2004          	jra	L577
1888  01f2               L377:
1889                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1891  01f2 72175326      	bres	21286,#3
1892  01f6               L577:
1893                     ; 541 }
1896  01f6 81            	ret
1961                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1961                     ; 553 {
1962                     	switch	.text
1963  01f7               _TIM3_GenerateEvent:
1967                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1969                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1971  01f7 c75324        	ld	21284,a
1972                     ; 559 }
1975  01fa 81            	ret
2011                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2011                     ; 570 {
2012                     	switch	.text
2013  01fb               _TIM3_OC1PolarityConfig:
2017                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2019                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2021  01fb 4d            	tnz	a
2022  01fc 2706          	jreq	L5401
2023                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2025  01fe 72125327      	bset	21287,#1
2027  0202 2004          	jra	L7401
2028  0204               L5401:
2029                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2031  0204 72135327      	bres	21287,#1
2032  0208               L7401:
2033                     ; 583 }
2036  0208 81            	ret
2072                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2072                     ; 594 {
2073                     	switch	.text
2074  0209               _TIM3_OC2PolarityConfig:
2078                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2080                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2082  0209 4d            	tnz	a
2083  020a 2706          	jreq	L7601
2084                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2086  020c 721a5327      	bset	21287,#5
2088  0210 2004          	jra	L1701
2089  0212               L7601:
2090                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2092  0212 721b5327      	bres	21287,#5
2093  0216               L1701:
2094                     ; 607 }
2097  0216 81            	ret
2142                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2142                     ; 620 {
2143                     	switch	.text
2144  0217               _TIM3_CCxCmd:
2146  0217 89            	pushw	x
2147       00000000      OFST:	set	0
2150                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2152                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2154                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2156  0218 9e            	ld	a,xh
2157  0219 4d            	tnz	a
2158  021a 2610          	jrne	L5111
2159                     ; 628     if (NewState != DISABLE)
2161  021c 9f            	ld	a,xl
2162  021d 4d            	tnz	a
2163  021e 2706          	jreq	L7111
2164                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2166  0220 72105327      	bset	21287,#0
2168  0224 2014          	jra	L3211
2169  0226               L7111:
2170                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2172  0226 72115327      	bres	21287,#0
2173  022a 200e          	jra	L3211
2174  022c               L5111:
2175                     ; 641     if (NewState != DISABLE)
2177  022c 0d02          	tnz	(OFST+2,sp)
2178  022e 2706          	jreq	L5211
2179                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2181  0230 72185327      	bset	21287,#4
2183  0234 2004          	jra	L3211
2184  0236               L5211:
2185                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2187  0236 72195327      	bres	21287,#4
2188  023a               L3211:
2189                     ; 650 }
2192  023a 85            	popw	x
2193  023b 81            	ret
2238                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2238                     ; 672 {
2239                     	switch	.text
2240  023c               _TIM3_SelectOCxM:
2242  023c 89            	pushw	x
2243       00000000      OFST:	set	0
2246                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2248                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2250                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2252  023d 9e            	ld	a,xh
2253  023e 4d            	tnz	a
2254  023f 2610          	jrne	L3511
2255                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2257  0241 72115327      	bres	21287,#0
2258                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2260  0245 c65325        	ld	a,21285
2261  0248 a48f          	and	a,#143
2262  024a 1a02          	or	a,(OFST+2,sp)
2263  024c c75325        	ld	21285,a
2265  024f 200e          	jra	L5511
2266  0251               L3511:
2267                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2269  0251 72195327      	bres	21287,#4
2270                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2272  0255 c65326        	ld	a,21286
2273  0258 a48f          	and	a,#143
2274  025a 1a02          	or	a,(OFST+2,sp)
2275  025c c75326        	ld	21286,a
2276  025f               L5511:
2277                     ; 693 }
2280  025f 85            	popw	x
2281  0260 81            	ret
2313                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2313                     ; 702 {
2314                     	switch	.text
2315  0261               _TIM3_SetCounter:
2319                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2321  0261 9e            	ld	a,xh
2322  0262 c75328        	ld	21288,a
2323                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2325  0265 9f            	ld	a,xl
2326  0266 c75329        	ld	21289,a
2327                     ; 706 }
2330  0269 81            	ret
2362                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2362                     ; 715 {
2363                     	switch	.text
2364  026a               _TIM3_SetAutoreload:
2368                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2370  026a 9e            	ld	a,xh
2371  026b c7532b        	ld	21291,a
2372                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2374  026e 9f            	ld	a,xl
2375  026f c7532c        	ld	21292,a
2376                     ; 719 }
2379  0272 81            	ret
2411                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2411                     ; 728 {
2412                     	switch	.text
2413  0273               _TIM3_SetCompare1:
2417                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2419  0273 9e            	ld	a,xh
2420  0274 c7532d        	ld	21293,a
2421                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2423  0277 9f            	ld	a,xl
2424  0278 c7532e        	ld	21294,a
2425                     ; 732 }
2428  027b 81            	ret
2460                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2460                     ; 741 {
2461                     	switch	.text
2462  027c               _TIM3_SetCompare2:
2466                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2468  027c 9e            	ld	a,xh
2469  027d c7532f        	ld	21295,a
2470                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2472  0280 9f            	ld	a,xl
2473  0281 c75330        	ld	21296,a
2474                     ; 745 }
2477  0284 81            	ret
2513                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2513                     ; 758 {
2514                     	switch	.text
2515  0285               _TIM3_SetIC1Prescaler:
2517  0285 88            	push	a
2518       00000000      OFST:	set	0
2521                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2523                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2525  0286 c65325        	ld	a,21285
2526  0289 a4f3          	and	a,#243
2527  028b 1a01          	or	a,(OFST+1,sp)
2528  028d c75325        	ld	21285,a
2529                     ; 764 }
2532  0290 84            	pop	a
2533  0291 81            	ret
2569                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2569                     ; 777 {
2570                     	switch	.text
2571  0292               _TIM3_SetIC2Prescaler:
2573  0292 88            	push	a
2574       00000000      OFST:	set	0
2577                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2579                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2581  0293 c65326        	ld	a,21286
2582  0296 a4f3          	and	a,#243
2583  0298 1a01          	or	a,(OFST+1,sp)
2584  029a c75326        	ld	21286,a
2585                     ; 783 }
2588  029d 84            	pop	a
2589  029e 81            	ret
2635                     ; 790 uint16_t TIM3_GetCapture1(void)
2635                     ; 791 {
2636                     	switch	.text
2637  029f               _TIM3_GetCapture1:
2639  029f 5204          	subw	sp,#4
2640       00000004      OFST:	set	4
2643                     ; 793   uint16_t tmpccr1 = 0;
2645                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2649                     ; 796   tmpccr1h = TIM3->CCR1H;
2651  02a1 c6532d        	ld	a,21293
2652  02a4 6b02          	ld	(OFST-2,sp),a
2654                     ; 797   tmpccr1l = TIM3->CCR1L;
2656  02a6 c6532e        	ld	a,21294
2657  02a9 6b01          	ld	(OFST-3,sp),a
2659                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2661  02ab 7b01          	ld	a,(OFST-3,sp)
2662  02ad 5f            	clrw	x
2663  02ae 97            	ld	xl,a
2664  02af 1f03          	ldw	(OFST-1,sp),x
2666                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2668  02b1 7b02          	ld	a,(OFST-2,sp)
2669  02b3 5f            	clrw	x
2670  02b4 97            	ld	xl,a
2671  02b5 4f            	clr	a
2672  02b6 02            	rlwa	x,a
2673  02b7 01            	rrwa	x,a
2674  02b8 1a04          	or	a,(OFST+0,sp)
2675  02ba 01            	rrwa	x,a
2676  02bb 1a03          	or	a,(OFST-1,sp)
2677  02bd 01            	rrwa	x,a
2678  02be 1f03          	ldw	(OFST-1,sp),x
2680                     ; 802   return (uint16_t)tmpccr1;
2682  02c0 1e03          	ldw	x,(OFST-1,sp)
2685  02c2 5b04          	addw	sp,#4
2686  02c4 81            	ret
2732                     ; 810 uint16_t TIM3_GetCapture2(void)
2732                     ; 811 {
2733                     	switch	.text
2734  02c5               _TIM3_GetCapture2:
2736  02c5 5204          	subw	sp,#4
2737       00000004      OFST:	set	4
2740                     ; 813   uint16_t tmpccr2 = 0;
2742                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2746                     ; 816   tmpccr2h = TIM3->CCR2H;
2748  02c7 c6532f        	ld	a,21295
2749  02ca 6b02          	ld	(OFST-2,sp),a
2751                     ; 817   tmpccr2l = TIM3->CCR2L;
2753  02cc c65330        	ld	a,21296
2754  02cf 6b01          	ld	(OFST-3,sp),a
2756                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2758  02d1 7b01          	ld	a,(OFST-3,sp)
2759  02d3 5f            	clrw	x
2760  02d4 97            	ld	xl,a
2761  02d5 1f03          	ldw	(OFST-1,sp),x
2763                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2765  02d7 7b02          	ld	a,(OFST-2,sp)
2766  02d9 5f            	clrw	x
2767  02da 97            	ld	xl,a
2768  02db 4f            	clr	a
2769  02dc 02            	rlwa	x,a
2770  02dd 01            	rrwa	x,a
2771  02de 1a04          	or	a,(OFST+0,sp)
2772  02e0 01            	rrwa	x,a
2773  02e1 1a03          	or	a,(OFST-1,sp)
2774  02e3 01            	rrwa	x,a
2775  02e4 1f03          	ldw	(OFST-1,sp),x
2777                     ; 822   return (uint16_t)tmpccr2;
2779  02e6 1e03          	ldw	x,(OFST-1,sp)
2782  02e8 5b04          	addw	sp,#4
2783  02ea 81            	ret
2815                     ; 830 uint16_t TIM3_GetCounter(void)
2815                     ; 831 {
2816                     	switch	.text
2817  02eb               _TIM3_GetCounter:
2819  02eb 89            	pushw	x
2820       00000002      OFST:	set	2
2823                     ; 832   uint16_t tmpcntr = 0;
2825                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2827  02ec c65328        	ld	a,21288
2828  02ef 5f            	clrw	x
2829  02f0 97            	ld	xl,a
2830  02f1 4f            	clr	a
2831  02f2 02            	rlwa	x,a
2832  02f3 1f01          	ldw	(OFST-1,sp),x
2834                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2836  02f5 c65329        	ld	a,21289
2837  02f8 5f            	clrw	x
2838  02f9 97            	ld	xl,a
2839  02fa 01            	rrwa	x,a
2840  02fb 1a02          	or	a,(OFST+0,sp)
2841  02fd 01            	rrwa	x,a
2842  02fe 1a01          	or	a,(OFST-1,sp)
2843  0300 01            	rrwa	x,a
2846  0301 5b02          	addw	sp,#2
2847  0303 81            	ret
2871                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2871                     ; 845 {
2872                     	switch	.text
2873  0304               _TIM3_GetPrescaler:
2877                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2879  0304 c6532a        	ld	a,21290
2882  0307 81            	ret
3003                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3003                     ; 862 {
3004                     	switch	.text
3005  0308               _TIM3_GetFlagStatus:
3007  0308 89            	pushw	x
3008  0309 89            	pushw	x
3009       00000002      OFST:	set	2
3012                     ; 863   FlagStatus bitstatus = RESET;
3014                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3018                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3020                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3022  030a 9f            	ld	a,xl
3023  030b c45322        	and	a,21282
3024  030e 6b01          	ld	(OFST-1,sp),a
3026                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3028  0310 7b03          	ld	a,(OFST+1,sp)
3029  0312 6b02          	ld	(OFST+0,sp),a
3031                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3033  0314 c65323        	ld	a,21283
3034  0317 1402          	and	a,(OFST+0,sp)
3035  0319 1a01          	or	a,(OFST-1,sp)
3036  031b 2706          	jreq	L3341
3037                     ; 874     bitstatus = SET;
3039  031d a601          	ld	a,#1
3040  031f 6b02          	ld	(OFST+0,sp),a
3043  0321 2002          	jra	L5341
3044  0323               L3341:
3045                     ; 878     bitstatus = RESET;
3047  0323 0f02          	clr	(OFST+0,sp)
3049  0325               L5341:
3050                     ; 880   return (FlagStatus)bitstatus;
3052  0325 7b02          	ld	a,(OFST+0,sp)
3055  0327 5b04          	addw	sp,#4
3056  0329 81            	ret
3091                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3091                     ; 895 {
3092                     	switch	.text
3093  032a               _TIM3_ClearFlag:
3095  032a 89            	pushw	x
3096       00000000      OFST:	set	0
3099                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3101                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3103  032b 9f            	ld	a,xl
3104  032c 43            	cpl	a
3105  032d c75322        	ld	21282,a
3106                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3108  0330 7b01          	ld	a,(OFST+1,sp)
3109  0332 43            	cpl	a
3110  0333 c75323        	ld	21283,a
3111                     ; 902 }
3114  0336 85            	popw	x
3115  0337 81            	ret
3175                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3175                     ; 914 {
3176                     	switch	.text
3177  0338               _TIM3_GetITStatus:
3179  0338 88            	push	a
3180  0339 89            	pushw	x
3181       00000002      OFST:	set	2
3184                     ; 915   ITStatus bitstatus = RESET;
3186                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3190                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3192                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3194  033a c45322        	and	a,21282
3195  033d 6b01          	ld	(OFST-1,sp),a
3197                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3199  033f c65321        	ld	a,21281
3200  0342 1403          	and	a,(OFST+1,sp)
3201  0344 6b02          	ld	(OFST+0,sp),a
3203                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3205  0346 0d01          	tnz	(OFST-1,sp)
3206  0348 270a          	jreq	L3051
3208  034a 0d02          	tnz	(OFST+0,sp)
3209  034c 2706          	jreq	L3051
3210                     ; 927     bitstatus = SET;
3212  034e a601          	ld	a,#1
3213  0350 6b02          	ld	(OFST+0,sp),a
3216  0352 2002          	jra	L5051
3217  0354               L3051:
3218                     ; 931     bitstatus = RESET;
3220  0354 0f02          	clr	(OFST+0,sp)
3222  0356               L5051:
3223                     ; 933   return (ITStatus)(bitstatus);
3225  0356 7b02          	ld	a,(OFST+0,sp)
3228  0358 5b03          	addw	sp,#3
3229  035a 81            	ret
3265                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3265                     ; 946 {
3266                     	switch	.text
3267  035b               _TIM3_ClearITPendingBit:
3271                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3273                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3275  035b 43            	cpl	a
3276  035c c75322        	ld	21282,a
3277                     ; 952 }
3280  035f 81            	ret
3326                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3326                     ; 971                        uint8_t TIM3_ICSelection,
3326                     ; 972                        uint8_t TIM3_ICFilter)
3326                     ; 973 {
3327                     	switch	.text
3328  0360               L3_TI1_Config:
3330  0360 89            	pushw	x
3331  0361 88            	push	a
3332       00000001      OFST:	set	1
3335                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3337  0362 72115327      	bres	21287,#0
3338                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3340  0366 7b06          	ld	a,(OFST+5,sp)
3341  0368 97            	ld	xl,a
3342  0369 a610          	ld	a,#16
3343  036b 42            	mul	x,a
3344  036c 9f            	ld	a,xl
3345  036d 1a03          	or	a,(OFST+2,sp)
3346  036f 6b01          	ld	(OFST+0,sp),a
3348  0371 c65325        	ld	a,21285
3349  0374 a40c          	and	a,#12
3350  0376 1a01          	or	a,(OFST+0,sp)
3351  0378 c75325        	ld	21285,a
3352                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3354  037b 0d02          	tnz	(OFST+1,sp)
3355  037d 2706          	jreq	L5451
3356                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3358  037f 72125327      	bset	21287,#1
3360  0383 2004          	jra	L7451
3361  0385               L5451:
3362                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3364  0385 72135327      	bres	21287,#1
3365  0389               L7451:
3366                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3368  0389 72105327      	bset	21287,#0
3369                     ; 991 }
3372  038d 5b03          	addw	sp,#3
3373  038f 81            	ret
3419                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3419                     ; 1010                        uint8_t TIM3_ICSelection,
3419                     ; 1011                        uint8_t TIM3_ICFilter)
3419                     ; 1012 {
3420                     	switch	.text
3421  0390               L5_TI2_Config:
3423  0390 89            	pushw	x
3424  0391 88            	push	a
3425       00000001      OFST:	set	1
3428                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3430  0392 72195327      	bres	21287,#4
3431                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3431                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3431                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3433  0396 7b06          	ld	a,(OFST+5,sp)
3434  0398 97            	ld	xl,a
3435  0399 a610          	ld	a,#16
3436  039b 42            	mul	x,a
3437  039c 9f            	ld	a,xl
3438  039d 1a03          	or	a,(OFST+2,sp)
3439  039f 6b01          	ld	(OFST+0,sp),a
3441  03a1 c65326        	ld	a,21286
3442  03a4 a40c          	and	a,#12
3443  03a6 1a01          	or	a,(OFST+0,sp)
3444  03a8 c75326        	ld	21286,a
3445                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3447  03ab 0d02          	tnz	(OFST+1,sp)
3448  03ad 2706          	jreq	L1751
3449                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3451  03af 721a5327      	bset	21287,#5
3453  03b3 2004          	jra	L3751
3454  03b5               L1751:
3455                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3457  03b5 721b5327      	bres	21287,#5
3458  03b9               L3751:
3459                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3461  03b9 72185327      	bset	21287,#4
3462                     ; 1033 }
3465  03bd 5b03          	addw	sp,#3
3466  03bf 81            	ret
3479                     	xdef	_TIM3_ClearITPendingBit
3480                     	xdef	_TIM3_GetITStatus
3481                     	xdef	_TIM3_ClearFlag
3482                     	xdef	_TIM3_GetFlagStatus
3483                     	xdef	_TIM3_GetPrescaler
3484                     	xdef	_TIM3_GetCounter
3485                     	xdef	_TIM3_GetCapture2
3486                     	xdef	_TIM3_GetCapture1
3487                     	xdef	_TIM3_SetIC2Prescaler
3488                     	xdef	_TIM3_SetIC1Prescaler
3489                     	xdef	_TIM3_SetCompare2
3490                     	xdef	_TIM3_SetCompare1
3491                     	xdef	_TIM3_SetAutoreload
3492                     	xdef	_TIM3_SetCounter
3493                     	xdef	_TIM3_SelectOCxM
3494                     	xdef	_TIM3_CCxCmd
3495                     	xdef	_TIM3_OC2PolarityConfig
3496                     	xdef	_TIM3_OC1PolarityConfig
3497                     	xdef	_TIM3_GenerateEvent
3498                     	xdef	_TIM3_OC2PreloadConfig
3499                     	xdef	_TIM3_OC1PreloadConfig
3500                     	xdef	_TIM3_ARRPreloadConfig
3501                     	xdef	_TIM3_ForcedOC2Config
3502                     	xdef	_TIM3_ForcedOC1Config
3503                     	xdef	_TIM3_PrescalerConfig
3504                     	xdef	_TIM3_SelectOnePulseMode
3505                     	xdef	_TIM3_UpdateRequestConfig
3506                     	xdef	_TIM3_UpdateDisableConfig
3507                     	xdef	_TIM3_ITConfig
3508                     	xdef	_TIM3_Cmd
3509                     	xdef	_TIM3_PWMIConfig
3510                     	xdef	_TIM3_ICInit
3511                     	xdef	_TIM3_OC2Init
3512                     	xdef	_TIM3_OC1Init
3513                     	xdef	_TIM3_TimeBaseInit
3514                     	xdef	_TIM3_DeInit
3533                     	end
