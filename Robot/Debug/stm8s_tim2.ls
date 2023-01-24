   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 52 void TIM2_DeInit(void)
  41                     ; 53 {
  43                     	switch	.text
  44  0000               _TIM2_DeInit:
  48                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  50  0000 725f5300      	clr	21248
  51                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  53  0004 725f5301      	clr	21249
  54                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  56  0008 725f5303      	clr	21251
  57                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  59  000c 725f5308      	clr	21256
  60                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  62  0010 725f5309      	clr	21257
  63                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  65  0014 725f5308      	clr	21256
  66                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  68  0018 725f5309      	clr	21257
  69                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  71  001c 725f5305      	clr	21253
  72                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  74  0020 725f5306      	clr	21254
  75                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  77  0024 725f5307      	clr	21255
  78                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  80  0028 725f530a      	clr	21258
  81                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  83  002c 725f530b      	clr	21259
  84                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  86  0030 725f530c      	clr	21260
  87                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  89  0034 35ff530d      	mov	21261,#255
  90                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  92  0038 35ff530e      	mov	21262,#255
  93                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  95  003c 725f530f      	clr	21263
  96                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  98  0040 725f5310      	clr	21264
  99                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 101  0044 725f5311      	clr	21265
 102                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 104  0048 725f5312      	clr	21266
 105                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 107  004c 725f5313      	clr	21267
 108                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 110  0050 725f5314      	clr	21268
 111                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 113  0054 725f5302      	clr	21250
 114                     ; 81 }
 117  0058 81            	ret
 283                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 283                     ; 90                         uint16_t TIM2_Period)
 283                     ; 91 {
 284                     	switch	.text
 285  0059               _TIM2_TimeBaseInit:
 287  0059 88            	push	a
 288       00000000      OFST:	set	0
 291                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 293  005a c7530c        	ld	21260,a
 294                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 296  005d 7b04          	ld	a,(OFST+4,sp)
 297  005f c7530d        	ld	21261,a
 298                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 300  0062 7b05          	ld	a,(OFST+5,sp)
 301  0064 c7530e        	ld	21262,a
 302                     ; 97 }
 305  0067 84            	pop	a
 306  0068 81            	ret
 461                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 461                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 461                     ; 110                   uint16_t TIM2_Pulse,
 461                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 461                     ; 112 {
 462                     	switch	.text
 463  0069               _TIM2_OC1Init:
 465  0069 89            	pushw	x
 466  006a 88            	push	a
 467       00000001      OFST:	set	1
 470                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 472                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 474                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 476                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 478  006b c65308        	ld	a,21256
 479  006e a4fc          	and	a,#252
 480  0070 c75308        	ld	21256,a
 481                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 481                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 483  0073 7b08          	ld	a,(OFST+7,sp)
 484  0075 a402          	and	a,#2
 485  0077 6b01          	ld	(OFST+0,sp),a
 487  0079 9f            	ld	a,xl
 488  007a a401          	and	a,#1
 489  007c 1a01          	or	a,(OFST+0,sp)
 490  007e ca5308        	or	a,21256
 491  0081 c75308        	ld	21256,a
 492                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 492                     ; 126                           (uint8_t)TIM2_OCMode);
 494  0084 c65305        	ld	a,21253
 495  0087 a48f          	and	a,#143
 496  0089 1a02          	or	a,(OFST+1,sp)
 497  008b c75305        	ld	21253,a
 498                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 500  008e 7b06          	ld	a,(OFST+5,sp)
 501  0090 c7530f        	ld	21263,a
 502                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 504  0093 7b07          	ld	a,(OFST+6,sp)
 505  0095 c75310        	ld	21264,a
 506                     ; 131 }
 509  0098 5b03          	addw	sp,#3
 510  009a 81            	ret
 572                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 572                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 572                     ; 144                   uint16_t TIM2_Pulse,
 572                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 572                     ; 146 {
 573                     	switch	.text
 574  009b               _TIM2_OC2Init:
 576  009b 89            	pushw	x
 577  009c 88            	push	a
 578       00000001      OFST:	set	1
 581                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 583                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 585                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 587                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 589  009d c65308        	ld	a,21256
 590  00a0 a4cf          	and	a,#207
 591  00a2 c75308        	ld	21256,a
 592                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 592                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 594  00a5 7b08          	ld	a,(OFST+7,sp)
 595  00a7 a420          	and	a,#32
 596  00a9 6b01          	ld	(OFST+0,sp),a
 598  00ab 9f            	ld	a,xl
 599  00ac a410          	and	a,#16
 600  00ae 1a01          	or	a,(OFST+0,sp)
 601  00b0 ca5308        	or	a,21256
 602  00b3 c75308        	ld	21256,a
 603                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 603                     ; 162                           (uint8_t)TIM2_OCMode);
 605  00b6 c65306        	ld	a,21254
 606  00b9 a48f          	and	a,#143
 607  00bb 1a02          	or	a,(OFST+1,sp)
 608  00bd c75306        	ld	21254,a
 609                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 611  00c0 7b06          	ld	a,(OFST+5,sp)
 612  00c2 c75311        	ld	21265,a
 613                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 615  00c5 7b07          	ld	a,(OFST+6,sp)
 616  00c7 c75312        	ld	21266,a
 617                     ; 168 }
 620  00ca 5b03          	addw	sp,#3
 621  00cc 81            	ret
 683                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 683                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 683                     ; 181                   uint16_t TIM2_Pulse,
 683                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 683                     ; 183 {
 684                     	switch	.text
 685  00cd               _TIM2_OC3Init:
 687  00cd 89            	pushw	x
 688  00ce 88            	push	a
 689       00000001      OFST:	set	1
 692                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 694                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 696                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 698                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 700  00cf c65309        	ld	a,21257
 701  00d2 a4fc          	and	a,#252
 702  00d4 c75309        	ld	21257,a
 703                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 703                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 705  00d7 7b08          	ld	a,(OFST+7,sp)
 706  00d9 a402          	and	a,#2
 707  00db 6b01          	ld	(OFST+0,sp),a
 709  00dd 9f            	ld	a,xl
 710  00de a401          	and	a,#1
 711  00e0 1a01          	or	a,(OFST+0,sp)
 712  00e2 ca5309        	or	a,21257
 713  00e5 c75309        	ld	21257,a
 714                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 714                     ; 196                           (uint8_t)TIM2_OCMode);
 716  00e8 c65307        	ld	a,21255
 717  00eb a48f          	and	a,#143
 718  00ed 1a02          	or	a,(OFST+1,sp)
 719  00ef c75307        	ld	21255,a
 720                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 722  00f2 7b06          	ld	a,(OFST+5,sp)
 723  00f4 c75313        	ld	21267,a
 724                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 726  00f7 7b07          	ld	a,(OFST+6,sp)
 727  00f9 c75314        	ld	21268,a
 728                     ; 201 }
 731  00fc 5b03          	addw	sp,#3
 732  00fe 81            	ret
 923                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 923                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 923                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 923                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 923                     ; 216                  uint8_t TIM2_ICFilter)
 923                     ; 217 {
 924                     	switch	.text
 925  00ff               _TIM2_ICInit:
 927  00ff 89            	pushw	x
 928       00000000      OFST:	set	0
 931                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 933                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 935                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 937                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 939                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 941                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 943  0100 9e            	ld	a,xh
 944  0101 4d            	tnz	a
 945  0102 2614          	jrne	L763
 946                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 946                     ; 229                (uint8_t)TIM2_ICSelection,
 946                     ; 230                (uint8_t)TIM2_ICFilter);
 948  0104 7b07          	ld	a,(OFST+7,sp)
 949  0106 88            	push	a
 950  0107 7b06          	ld	a,(OFST+6,sp)
 951  0109 97            	ld	xl,a
 952  010a 7b03          	ld	a,(OFST+3,sp)
 953  010c 95            	ld	xh,a
 954  010d cd044a        	call	L3_TI1_Config
 956  0110 84            	pop	a
 957                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 959  0111 7b06          	ld	a,(OFST+6,sp)
 960  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 963  0116 202c          	jra	L173
 964  0118               L763:
 965                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 967  0118 7b01          	ld	a,(OFST+1,sp)
 968  011a a101          	cp	a,#1
 969  011c 2614          	jrne	L373
 970                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 970                     ; 239                (uint8_t)TIM2_ICSelection,
 970                     ; 240                (uint8_t)TIM2_ICFilter);
 972  011e 7b07          	ld	a,(OFST+7,sp)
 973  0120 88            	push	a
 974  0121 7b06          	ld	a,(OFST+6,sp)
 975  0123 97            	ld	xl,a
 976  0124 7b03          	ld	a,(OFST+3,sp)
 977  0126 95            	ld	xh,a
 978  0127 cd047a        	call	L5_TI2_Config
 980  012a 84            	pop	a
 981                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 983  012b 7b06          	ld	a,(OFST+6,sp)
 984  012d cd034d        	call	_TIM2_SetIC2Prescaler
 987  0130 2012          	jra	L173
 988  0132               L373:
 989                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 989                     ; 249                (uint8_t)TIM2_ICSelection,
 989                     ; 250                (uint8_t)TIM2_ICFilter);
 991  0132 7b07          	ld	a,(OFST+7,sp)
 992  0134 88            	push	a
 993  0135 7b06          	ld	a,(OFST+6,sp)
 994  0137 97            	ld	xl,a
 995  0138 7b03          	ld	a,(OFST+3,sp)
 996  013a 95            	ld	xh,a
 997  013b cd04aa        	call	L7_TI3_Config
 999  013e 84            	pop	a
1000                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1002  013f 7b06          	ld	a,(OFST+6,sp)
1003  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1005  0144               L173:
1006                     ; 255 }
1009  0144 85            	popw	x
1010  0145 81            	ret
1100                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1100                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1100                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1100                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1100                     ; 270                      uint8_t TIM2_ICFilter)
1100                     ; 271 {
1101                     	switch	.text
1102  0146               _TIM2_PWMIConfig:
1104  0146 89            	pushw	x
1105  0147 89            	pushw	x
1106       00000002      OFST:	set	2
1109                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1111                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1113                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1115                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1117                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1119                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1121                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1123  0148 9f            	ld	a,xl
1124  0149 a144          	cp	a,#68
1125  014b 2706          	jreq	L734
1126                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1128  014d a644          	ld	a,#68
1129  014f 6b01          	ld	(OFST-1,sp),a
1132  0151 2002          	jra	L144
1133  0153               L734:
1134                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1136  0153 0f01          	clr	(OFST-1,sp)
1138  0155               L144:
1139                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1141  0155 7b07          	ld	a,(OFST+5,sp)
1142  0157 a101          	cp	a,#1
1143  0159 2606          	jrne	L344
1144                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1146  015b a602          	ld	a,#2
1147  015d 6b02          	ld	(OFST+0,sp),a
1150  015f 2004          	jra	L544
1151  0161               L344:
1152                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1154  0161 a601          	ld	a,#1
1155  0163 6b02          	ld	(OFST+0,sp),a
1157  0165               L544:
1158                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1160  0165 0d03          	tnz	(OFST+1,sp)
1161  0167 2626          	jrne	L744
1162                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1162                     ; 305                (uint8_t)TIM2_ICFilter);
1164  0169 7b09          	ld	a,(OFST+7,sp)
1165  016b 88            	push	a
1166  016c 7b08          	ld	a,(OFST+6,sp)
1167  016e 97            	ld	xl,a
1168  016f 7b05          	ld	a,(OFST+3,sp)
1169  0171 95            	ld	xh,a
1170  0172 cd044a        	call	L3_TI1_Config
1172  0175 84            	pop	a
1173                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1175  0176 7b08          	ld	a,(OFST+6,sp)
1176  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1178                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1180  017b 7b09          	ld	a,(OFST+7,sp)
1181  017d 88            	push	a
1182  017e 7b03          	ld	a,(OFST+1,sp)
1183  0180 97            	ld	xl,a
1184  0181 7b02          	ld	a,(OFST+0,sp)
1185  0183 95            	ld	xh,a
1186  0184 cd047a        	call	L5_TI2_Config
1188  0187 84            	pop	a
1189                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1191  0188 7b08          	ld	a,(OFST+6,sp)
1192  018a cd034d        	call	_TIM2_SetIC2Prescaler
1195  018d 2024          	jra	L154
1196  018f               L744:
1197                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1197                     ; 320                (uint8_t)TIM2_ICFilter);
1199  018f 7b09          	ld	a,(OFST+7,sp)
1200  0191 88            	push	a
1201  0192 7b08          	ld	a,(OFST+6,sp)
1202  0194 97            	ld	xl,a
1203  0195 7b05          	ld	a,(OFST+3,sp)
1204  0197 95            	ld	xh,a
1205  0198 cd047a        	call	L5_TI2_Config
1207  019b 84            	pop	a
1208                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1210  019c 7b08          	ld	a,(OFST+6,sp)
1211  019e cd034d        	call	_TIM2_SetIC2Prescaler
1213                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1215  01a1 7b09          	ld	a,(OFST+7,sp)
1216  01a3 88            	push	a
1217  01a4 7b03          	ld	a,(OFST+1,sp)
1218  01a6 97            	ld	xl,a
1219  01a7 7b02          	ld	a,(OFST+0,sp)
1220  01a9 95            	ld	xh,a
1221  01aa cd044a        	call	L3_TI1_Config
1223  01ad 84            	pop	a
1224                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1226  01ae 7b08          	ld	a,(OFST+6,sp)
1227  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1229  01b3               L154:
1230                     ; 331 }
1233  01b3 5b04          	addw	sp,#4
1234  01b5 81            	ret
1289                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1289                     ; 340 {
1290                     	switch	.text
1291  01b6               _TIM2_Cmd:
1295                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1297                     ; 345   if (NewState != DISABLE)
1299  01b6 4d            	tnz	a
1300  01b7 2706          	jreq	L105
1301                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1303  01b9 72105300      	bset	21248,#0
1305  01bd 2004          	jra	L305
1306  01bf               L105:
1307                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1309  01bf 72115300      	bres	21248,#0
1310  01c3               L305:
1311                     ; 353 }
1314  01c3 81            	ret
1393                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1393                     ; 369 {
1394                     	switch	.text
1395  01c4               _TIM2_ITConfig:
1397  01c4 89            	pushw	x
1398       00000000      OFST:	set	0
1401                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1403                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1405                     ; 374   if (NewState != DISABLE)
1407  01c5 9f            	ld	a,xl
1408  01c6 4d            	tnz	a
1409  01c7 2709          	jreq	L345
1410                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1412  01c9 9e            	ld	a,xh
1413  01ca ca5301        	or	a,21249
1414  01cd c75301        	ld	21249,a
1416  01d0 2009          	jra	L545
1417  01d2               L345:
1418                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1420  01d2 7b01          	ld	a,(OFST+1,sp)
1421  01d4 43            	cpl	a
1422  01d5 c45301        	and	a,21249
1423  01d8 c75301        	ld	21249,a
1424  01db               L545:
1425                     ; 384 }
1428  01db 85            	popw	x
1429  01dc 81            	ret
1465                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1465                     ; 393 {
1466                     	switch	.text
1467  01dd               _TIM2_UpdateDisableConfig:
1471                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1473                     ; 398   if (NewState != DISABLE)
1475  01dd 4d            	tnz	a
1476  01de 2706          	jreq	L565
1477                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1479  01e0 72125300      	bset	21248,#1
1481  01e4 2004          	jra	L765
1482  01e6               L565:
1483                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1485  01e6 72135300      	bres	21248,#1
1486  01ea               L765:
1487                     ; 406 }
1490  01ea 81            	ret
1548                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1548                     ; 417 {
1549                     	switch	.text
1550  01eb               _TIM2_UpdateRequestConfig:
1554                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1556                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1558  01eb 4d            	tnz	a
1559  01ec 2706          	jreq	L716
1560                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1562  01ee 72145300      	bset	21248,#2
1564  01f2 2004          	jra	L126
1565  01f4               L716:
1566                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1568  01f4 72155300      	bres	21248,#2
1569  01f8               L126:
1570                     ; 430 }
1573  01f8 81            	ret
1630                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1630                     ; 441 {
1631                     	switch	.text
1632  01f9               _TIM2_SelectOnePulseMode:
1636                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1638                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1640  01f9 4d            	tnz	a
1641  01fa 2706          	jreq	L156
1642                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1644  01fc 72165300      	bset	21248,#3
1646  0200 2004          	jra	L356
1647  0202               L156:
1648                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1650  0202 72175300      	bres	21248,#3
1651  0206               L356:
1652                     ; 454 }
1655  0206 81            	ret
1723                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1723                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1723                     ; 486 {
1724                     	switch	.text
1725  0207               _TIM2_PrescalerConfig:
1729                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1731                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1733                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1735  0207 9e            	ld	a,xh
1736  0208 c7530c        	ld	21260,a
1737                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1739  020b 9f            	ld	a,xl
1740  020c c75304        	ld	21252,a
1741                     ; 496 }
1744  020f 81            	ret
1802                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1802                     ; 508 {
1803                     	switch	.text
1804  0210               _TIM2_ForcedOC1Config:
1806  0210 88            	push	a
1807       00000000      OFST:	set	0
1810                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1812                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1812                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1814  0211 c65305        	ld	a,21253
1815  0214 a48f          	and	a,#143
1816  0216 1a01          	or	a,(OFST+1,sp)
1817  0218 c75305        	ld	21253,a
1818                     ; 515 }
1821  021b 84            	pop	a
1822  021c 81            	ret
1858                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1858                     ; 527 {
1859                     	switch	.text
1860  021d               _TIM2_ForcedOC2Config:
1862  021d 88            	push	a
1863       00000000      OFST:	set	0
1866                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1868                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1868                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1870  021e c65306        	ld	a,21254
1871  0221 a48f          	and	a,#143
1872  0223 1a01          	or	a,(OFST+1,sp)
1873  0225 c75306        	ld	21254,a
1874                     ; 534 }
1877  0228 84            	pop	a
1878  0229 81            	ret
1914                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1914                     ; 546 {
1915                     	switch	.text
1916  022a               _TIM2_ForcedOC3Config:
1918  022a 88            	push	a
1919       00000000      OFST:	set	0
1922                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1924                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1924                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1926  022b c65307        	ld	a,21255
1927  022e a48f          	and	a,#143
1928  0230 1a01          	or	a,(OFST+1,sp)
1929  0232 c75307        	ld	21255,a
1930                     ; 553 }
1933  0235 84            	pop	a
1934  0236 81            	ret
1970                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1970                     ; 562 {
1971                     	switch	.text
1972  0237               _TIM2_ARRPreloadConfig:
1976                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1978                     ; 567   if (NewState != DISABLE)
1980  0237 4d            	tnz	a
1981  0238 2706          	jreq	L7001
1982                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1984  023a 721e5300      	bset	21248,#7
1986  023e 2004          	jra	L1101
1987  0240               L7001:
1988                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1990  0240 721f5300      	bres	21248,#7
1991  0244               L1101:
1992                     ; 575 }
1995  0244 81            	ret
2031                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2031                     ; 584 {
2032                     	switch	.text
2033  0245               _TIM2_OC1PreloadConfig:
2037                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2039                     ; 589   if (NewState != DISABLE)
2041  0245 4d            	tnz	a
2042  0246 2706          	jreq	L1301
2043                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2045  0248 72165305      	bset	21253,#3
2047  024c 2004          	jra	L3301
2048  024e               L1301:
2049                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2051  024e 72175305      	bres	21253,#3
2052  0252               L3301:
2053                     ; 597 }
2056  0252 81            	ret
2092                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2092                     ; 606 {
2093                     	switch	.text
2094  0253               _TIM2_OC2PreloadConfig:
2098                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2100                     ; 611   if (NewState != DISABLE)
2102  0253 4d            	tnz	a
2103  0254 2706          	jreq	L3501
2104                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2106  0256 72165306      	bset	21254,#3
2108  025a 2004          	jra	L5501
2109  025c               L3501:
2110                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2112  025c 72175306      	bres	21254,#3
2113  0260               L5501:
2114                     ; 619 }
2117  0260 81            	ret
2153                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2153                     ; 628 {
2154                     	switch	.text
2155  0261               _TIM2_OC3PreloadConfig:
2159                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2161                     ; 633   if (NewState != DISABLE)
2163  0261 4d            	tnz	a
2164  0262 2706          	jreq	L5701
2165                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2167  0264 72165307      	bset	21255,#3
2169  0268 2004          	jra	L7701
2170  026a               L5701:
2171                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2173  026a 72175307      	bres	21255,#3
2174  026e               L7701:
2175                     ; 641 }
2178  026e 81            	ret
2251                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2251                     ; 654 {
2252                     	switch	.text
2253  026f               _TIM2_GenerateEvent:
2257                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2259                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2261  026f c75304        	ld	21252,a
2262                     ; 660 }
2265  0272 81            	ret
2301                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2301                     ; 671 {
2302                     	switch	.text
2303  0273               _TIM2_OC1PolarityConfig:
2307                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2309                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2311  0273 4d            	tnz	a
2312  0274 2706          	jreq	L1511
2313                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2315  0276 72125308      	bset	21256,#1
2317  027a 2004          	jra	L3511
2318  027c               L1511:
2319                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2321  027c 72135308      	bres	21256,#1
2322  0280               L3511:
2323                     ; 684 }
2326  0280 81            	ret
2362                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2362                     ; 695 {
2363                     	switch	.text
2364  0281               _TIM2_OC2PolarityConfig:
2368                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2370                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2372  0281 4d            	tnz	a
2373  0282 2706          	jreq	L3711
2374                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2376  0284 721a5308      	bset	21256,#5
2378  0288 2004          	jra	L5711
2379  028a               L3711:
2380                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2382  028a 721b5308      	bres	21256,#5
2383  028e               L5711:
2384                     ; 708 }
2387  028e 81            	ret
2423                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2423                     ; 719 {
2424                     	switch	.text
2425  028f               _TIM2_OC3PolarityConfig:
2429                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2431                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2433  028f 4d            	tnz	a
2434  0290 2706          	jreq	L5121
2435                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2437  0292 72125309      	bset	21257,#1
2439  0296 2004          	jra	L7121
2440  0298               L5121:
2441                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2443  0298 72135309      	bres	21257,#1
2444  029c               L7121:
2445                     ; 732 }
2448  029c 81            	ret
2493                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2493                     ; 746 {
2494                     	switch	.text
2495  029d               _TIM2_CCxCmd:
2497  029d 89            	pushw	x
2498       00000000      OFST:	set	0
2501                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2503                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2505                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2507  029e 9e            	ld	a,xh
2508  029f 4d            	tnz	a
2509  02a0 2610          	jrne	L3421
2510                     ; 754     if (NewState != DISABLE)
2512  02a2 9f            	ld	a,xl
2513  02a3 4d            	tnz	a
2514  02a4 2706          	jreq	L5421
2515                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2517  02a6 72105308      	bset	21256,#0
2519  02aa 202a          	jra	L1521
2520  02ac               L5421:
2521                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2523  02ac 72115308      	bres	21256,#0
2524  02b0 2024          	jra	L1521
2525  02b2               L3421:
2526                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2528  02b2 7b01          	ld	a,(OFST+1,sp)
2529  02b4 a101          	cp	a,#1
2530  02b6 2610          	jrne	L3521
2531                     ; 767     if (NewState != DISABLE)
2533  02b8 0d02          	tnz	(OFST+2,sp)
2534  02ba 2706          	jreq	L5521
2535                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2537  02bc 72185308      	bset	21256,#4
2539  02c0 2014          	jra	L1521
2540  02c2               L5521:
2541                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2543  02c2 72195308      	bres	21256,#4
2544  02c6 200e          	jra	L1521
2545  02c8               L3521:
2546                     ; 779     if (NewState != DISABLE)
2548  02c8 0d02          	tnz	(OFST+2,sp)
2549  02ca 2706          	jreq	L3621
2550                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2552  02cc 72105309      	bset	21257,#0
2554  02d0 2004          	jra	L1521
2555  02d2               L3621:
2556                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2558  02d2 72115309      	bres	21257,#0
2559  02d6               L1521:
2560                     ; 788 }
2563  02d6 85            	popw	x
2564  02d7 81            	ret
2609                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2609                     ; 811 {
2610                     	switch	.text
2611  02d8               _TIM2_SelectOCxM:
2613  02d8 89            	pushw	x
2614       00000000      OFST:	set	0
2617                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2619                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2621                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2623  02d9 9e            	ld	a,xh
2624  02da 4d            	tnz	a
2625  02db 2610          	jrne	L1131
2626                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2628  02dd 72115308      	bres	21256,#0
2629                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2629                     ; 823                             | (uint8_t)TIM2_OCMode);
2631  02e1 c65305        	ld	a,21253
2632  02e4 a48f          	and	a,#143
2633  02e6 1a02          	or	a,(OFST+2,sp)
2634  02e8 c75305        	ld	21253,a
2636  02eb 2024          	jra	L3131
2637  02ed               L1131:
2638                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2640  02ed 7b01          	ld	a,(OFST+1,sp)
2641  02ef a101          	cp	a,#1
2642  02f1 2610          	jrne	L5131
2643                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2645  02f3 72195308      	bres	21256,#4
2646                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2646                     ; 832                             | (uint8_t)TIM2_OCMode);
2648  02f7 c65306        	ld	a,21254
2649  02fa a48f          	and	a,#143
2650  02fc 1a02          	or	a,(OFST+2,sp)
2651  02fe c75306        	ld	21254,a
2653  0301 200e          	jra	L3131
2654  0303               L5131:
2655                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2657  0303 72115309      	bres	21257,#0
2658                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2658                     ; 841                             | (uint8_t)TIM2_OCMode);
2660  0307 c65307        	ld	a,21255
2661  030a a48f          	and	a,#143
2662  030c 1a02          	or	a,(OFST+2,sp)
2663  030e c75307        	ld	21255,a
2664  0311               L3131:
2665                     ; 843 }
2668  0311 85            	popw	x
2669  0312 81            	ret
2701                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2701                     ; 852 {
2702                     	switch	.text
2703  0313               _TIM2_SetCounter:
2707                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2709  0313 9e            	ld	a,xh
2710  0314 c7530a        	ld	21258,a
2711                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2713  0317 9f            	ld	a,xl
2714  0318 c7530b        	ld	21259,a
2715                     ; 856 }
2718  031b 81            	ret
2750                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2750                     ; 865 {
2751                     	switch	.text
2752  031c               _TIM2_SetAutoreload:
2756                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2758  031c 9e            	ld	a,xh
2759  031d c7530d        	ld	21261,a
2760                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2762  0320 9f            	ld	a,xl
2763  0321 c7530e        	ld	21262,a
2764                     ; 869 }
2767  0324 81            	ret
2799                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2799                     ; 878 {
2800                     	switch	.text
2801  0325               _TIM2_SetCompare1:
2805                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2807  0325 9e            	ld	a,xh
2808  0326 c7530f        	ld	21263,a
2809                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2811  0329 9f            	ld	a,xl
2812  032a c75310        	ld	21264,a
2813                     ; 882 }
2816  032d 81            	ret
2848                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2848                     ; 891 {
2849                     	switch	.text
2850  032e               _TIM2_SetCompare2:
2854                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2856  032e 9e            	ld	a,xh
2857  032f c75311        	ld	21265,a
2858                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2860  0332 9f            	ld	a,xl
2861  0333 c75312        	ld	21266,a
2862                     ; 895 }
2865  0336 81            	ret
2897                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2897                     ; 904 {
2898                     	switch	.text
2899  0337               _TIM2_SetCompare3:
2903                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2905  0337 9e            	ld	a,xh
2906  0338 c75313        	ld	21267,a
2907                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2909  033b 9f            	ld	a,xl
2910  033c c75314        	ld	21268,a
2911                     ; 908 }
2914  033f 81            	ret
2950                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2950                     ; 921 {
2951                     	switch	.text
2952  0340               _TIM2_SetIC1Prescaler:
2954  0340 88            	push	a
2955       00000000      OFST:	set	0
2958                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2960                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2960                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2962  0341 c65305        	ld	a,21253
2963  0344 a4f3          	and	a,#243
2964  0346 1a01          	or	a,(OFST+1,sp)
2965  0348 c75305        	ld	21253,a
2966                     ; 928 }
2969  034b 84            	pop	a
2970  034c 81            	ret
3006                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3006                     ; 941 {
3007                     	switch	.text
3008  034d               _TIM2_SetIC2Prescaler:
3010  034d 88            	push	a
3011       00000000      OFST:	set	0
3014                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3016                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3016                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3018  034e c65306        	ld	a,21254
3019  0351 a4f3          	and	a,#243
3020  0353 1a01          	or	a,(OFST+1,sp)
3021  0355 c75306        	ld	21254,a
3022                     ; 948 }
3025  0358 84            	pop	a
3026  0359 81            	ret
3062                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3062                     ; 961 {
3063                     	switch	.text
3064  035a               _TIM2_SetIC3Prescaler:
3066  035a 88            	push	a
3067       00000000      OFST:	set	0
3070                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3072                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3072                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3074  035b c65307        	ld	a,21255
3075  035e a4f3          	and	a,#243
3076  0360 1a01          	or	a,(OFST+1,sp)
3077  0362 c75307        	ld	21255,a
3078                     ; 968 }
3081  0365 84            	pop	a
3082  0366 81            	ret
3128                     ; 975 uint16_t TIM2_GetCapture1(void)
3128                     ; 976 {
3129                     	switch	.text
3130  0367               _TIM2_GetCapture1:
3132  0367 5204          	subw	sp,#4
3133       00000004      OFST:	set	4
3136                     ; 978   uint16_t tmpccr1 = 0;
3138                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3142                     ; 981   tmpccr1h = TIM2->CCR1H;
3144  0369 c6530f        	ld	a,21263
3145  036c 6b02          	ld	(OFST-2,sp),a
3147                     ; 982   tmpccr1l = TIM2->CCR1L;
3149  036e c65310        	ld	a,21264
3150  0371 6b01          	ld	(OFST-3,sp),a
3152                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3154  0373 7b01          	ld	a,(OFST-3,sp)
3155  0375 5f            	clrw	x
3156  0376 97            	ld	xl,a
3157  0377 1f03          	ldw	(OFST-1,sp),x
3159                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3161  0379 7b02          	ld	a,(OFST-2,sp)
3162  037b 5f            	clrw	x
3163  037c 97            	ld	xl,a
3164  037d 4f            	clr	a
3165  037e 02            	rlwa	x,a
3166  037f 01            	rrwa	x,a
3167  0380 1a04          	or	a,(OFST+0,sp)
3168  0382 01            	rrwa	x,a
3169  0383 1a03          	or	a,(OFST-1,sp)
3170  0385 01            	rrwa	x,a
3171  0386 1f03          	ldw	(OFST-1,sp),x
3173                     ; 987   return (uint16_t)tmpccr1;
3175  0388 1e03          	ldw	x,(OFST-1,sp)
3178  038a 5b04          	addw	sp,#4
3179  038c 81            	ret
3225                     ; 995 uint16_t TIM2_GetCapture2(void)
3225                     ; 996 {
3226                     	switch	.text
3227  038d               _TIM2_GetCapture2:
3229  038d 5204          	subw	sp,#4
3230       00000004      OFST:	set	4
3233                     ; 998   uint16_t tmpccr2 = 0;
3235                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3239                     ; 1001   tmpccr2h = TIM2->CCR2H;
3241  038f c65311        	ld	a,21265
3242  0392 6b02          	ld	(OFST-2,sp),a
3244                     ; 1002   tmpccr2l = TIM2->CCR2L;
3246  0394 c65312        	ld	a,21266
3247  0397 6b01          	ld	(OFST-3,sp),a
3249                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3251  0399 7b01          	ld	a,(OFST-3,sp)
3252  039b 5f            	clrw	x
3253  039c 97            	ld	xl,a
3254  039d 1f03          	ldw	(OFST-1,sp),x
3256                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3258  039f 7b02          	ld	a,(OFST-2,sp)
3259  03a1 5f            	clrw	x
3260  03a2 97            	ld	xl,a
3261  03a3 4f            	clr	a
3262  03a4 02            	rlwa	x,a
3263  03a5 01            	rrwa	x,a
3264  03a6 1a04          	or	a,(OFST+0,sp)
3265  03a8 01            	rrwa	x,a
3266  03a9 1a03          	or	a,(OFST-1,sp)
3267  03ab 01            	rrwa	x,a
3268  03ac 1f03          	ldw	(OFST-1,sp),x
3270                     ; 1007   return (uint16_t)tmpccr2;
3272  03ae 1e03          	ldw	x,(OFST-1,sp)
3275  03b0 5b04          	addw	sp,#4
3276  03b2 81            	ret
3322                     ; 1015 uint16_t TIM2_GetCapture3(void)
3322                     ; 1016 {
3323                     	switch	.text
3324  03b3               _TIM2_GetCapture3:
3326  03b3 5204          	subw	sp,#4
3327       00000004      OFST:	set	4
3330                     ; 1018   uint16_t tmpccr3 = 0;
3332                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3336                     ; 1021   tmpccr3h = TIM2->CCR3H;
3338  03b5 c65313        	ld	a,21267
3339  03b8 6b02          	ld	(OFST-2,sp),a
3341                     ; 1022   tmpccr3l = TIM2->CCR3L;
3343  03ba c65314        	ld	a,21268
3344  03bd 6b01          	ld	(OFST-3,sp),a
3346                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3348  03bf 7b01          	ld	a,(OFST-3,sp)
3349  03c1 5f            	clrw	x
3350  03c2 97            	ld	xl,a
3351  03c3 1f03          	ldw	(OFST-1,sp),x
3353                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3355  03c5 7b02          	ld	a,(OFST-2,sp)
3356  03c7 5f            	clrw	x
3357  03c8 97            	ld	xl,a
3358  03c9 4f            	clr	a
3359  03ca 02            	rlwa	x,a
3360  03cb 01            	rrwa	x,a
3361  03cc 1a04          	or	a,(OFST+0,sp)
3362  03ce 01            	rrwa	x,a
3363  03cf 1a03          	or	a,(OFST-1,sp)
3364  03d1 01            	rrwa	x,a
3365  03d2 1f03          	ldw	(OFST-1,sp),x
3367                     ; 1027   return (uint16_t)tmpccr3;
3369  03d4 1e03          	ldw	x,(OFST-1,sp)
3372  03d6 5b04          	addw	sp,#4
3373  03d8 81            	ret
3405                     ; 1035 uint16_t TIM2_GetCounter(void)
3405                     ; 1036 {
3406                     	switch	.text
3407  03d9               _TIM2_GetCounter:
3409  03d9 89            	pushw	x
3410       00000002      OFST:	set	2
3413                     ; 1037   uint16_t tmpcntr = 0;
3415                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3417  03da c6530a        	ld	a,21258
3418  03dd 5f            	clrw	x
3419  03de 97            	ld	xl,a
3420  03df 4f            	clr	a
3421  03e0 02            	rlwa	x,a
3422  03e1 1f01          	ldw	(OFST-1,sp),x
3424                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3426  03e3 c6530b        	ld	a,21259
3427  03e6 5f            	clrw	x
3428  03e7 97            	ld	xl,a
3429  03e8 01            	rrwa	x,a
3430  03e9 1a02          	or	a,(OFST+0,sp)
3431  03eb 01            	rrwa	x,a
3432  03ec 1a01          	or	a,(OFST-1,sp)
3433  03ee 01            	rrwa	x,a
3436  03ef 5b02          	addw	sp,#2
3437  03f1 81            	ret
3461                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3461                     ; 1050 {
3462                     	switch	.text
3463  03f2               _TIM2_GetPrescaler:
3467                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3469  03f2 c6530c        	ld	a,21260
3472  03f5 81            	ret
3607                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3607                     ; 1069 {
3608                     	switch	.text
3609  03f6               _TIM2_GetFlagStatus:
3611  03f6 89            	pushw	x
3612  03f7 89            	pushw	x
3613       00000002      OFST:	set	2
3616                     ; 1070   FlagStatus bitstatus = RESET;
3618                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3622                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3624                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3626  03f8 9f            	ld	a,xl
3627  03f9 c45302        	and	a,21250
3628  03fc 6b01          	ld	(OFST-1,sp),a
3630                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3632  03fe 7b03          	ld	a,(OFST+1,sp)
3633  0400 6b02          	ld	(OFST+0,sp),a
3635                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3637  0402 c65303        	ld	a,21251
3638  0405 1402          	and	a,(OFST+0,sp)
3639  0407 1a01          	or	a,(OFST-1,sp)
3640  0409 2706          	jreq	L3561
3641                     ; 1081     bitstatus = SET;
3643  040b a601          	ld	a,#1
3644  040d 6b02          	ld	(OFST+0,sp),a
3647  040f 2002          	jra	L5561
3648  0411               L3561:
3649                     ; 1085     bitstatus = RESET;
3651  0411 0f02          	clr	(OFST+0,sp)
3653  0413               L5561:
3654                     ; 1087   return (FlagStatus)bitstatus;
3656  0413 7b02          	ld	a,(OFST+0,sp)
3659  0415 5b04          	addw	sp,#4
3660  0417 81            	ret
3695                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3695                     ; 1104 {
3696                     	switch	.text
3697  0418               _TIM2_ClearFlag:
3701                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3703                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3705  0418 9f            	ld	a,xl
3706  0419 43            	cpl	a
3707  041a c75302        	ld	21250,a
3708                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3710  041d 35ff5303      	mov	21251,#255
3711                     ; 1111 }
3714  0421 81            	ret
3774                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3774                     ; 1124 {
3775                     	switch	.text
3776  0422               _TIM2_GetITStatus:
3778  0422 88            	push	a
3779  0423 89            	pushw	x
3780       00000002      OFST:	set	2
3783                     ; 1125   ITStatus bitstatus = RESET;
3785                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3789                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3791                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3793  0424 c45302        	and	a,21250
3794  0427 6b01          	ld	(OFST-1,sp),a
3796                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3798  0429 c65301        	ld	a,21249
3799  042c 1403          	and	a,(OFST+1,sp)
3800  042e 6b02          	ld	(OFST+0,sp),a
3802                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3804  0430 0d01          	tnz	(OFST-1,sp)
3805  0432 270a          	jreq	L3271
3807  0434 0d02          	tnz	(OFST+0,sp)
3808  0436 2706          	jreq	L3271
3809                     ; 1137     bitstatus = SET;
3811  0438 a601          	ld	a,#1
3812  043a 6b02          	ld	(OFST+0,sp),a
3815  043c 2002          	jra	L5271
3816  043e               L3271:
3817                     ; 1141     bitstatus = RESET;
3819  043e 0f02          	clr	(OFST+0,sp)
3821  0440               L5271:
3822                     ; 1143   return (ITStatus)(bitstatus);
3824  0440 7b02          	ld	a,(OFST+0,sp)
3827  0442 5b03          	addw	sp,#3
3828  0444 81            	ret
3864                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3864                     ; 1157 {
3865                     	switch	.text
3866  0445               _TIM2_ClearITPendingBit:
3870                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3872                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3874  0445 43            	cpl	a
3875  0446 c75302        	ld	21250,a
3876                     ; 1163 }
3879  0449 81            	ret
3925                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3925                     ; 1182                        uint8_t TIM2_ICSelection,
3925                     ; 1183                        uint8_t TIM2_ICFilter)
3925                     ; 1184 {
3926                     	switch	.text
3927  044a               L3_TI1_Config:
3929  044a 89            	pushw	x
3930  044b 88            	push	a
3931       00000001      OFST:	set	1
3934                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3936  044c 72115308      	bres	21256,#0
3937                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3937                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3939  0450 7b06          	ld	a,(OFST+5,sp)
3940  0452 97            	ld	xl,a
3941  0453 a610          	ld	a,#16
3942  0455 42            	mul	x,a
3943  0456 9f            	ld	a,xl
3944  0457 1a03          	or	a,(OFST+2,sp)
3945  0459 6b01          	ld	(OFST+0,sp),a
3947  045b c65305        	ld	a,21253
3948  045e a40c          	and	a,#12
3949  0460 1a01          	or	a,(OFST+0,sp)
3950  0462 c75305        	ld	21253,a
3951                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3953  0465 0d02          	tnz	(OFST+1,sp)
3954  0467 2706          	jreq	L5671
3955                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3957  0469 72125308      	bset	21256,#1
3959  046d 2004          	jra	L7671
3960  046f               L5671:
3961                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3963  046f 72135308      	bres	21256,#1
3964  0473               L7671:
3965                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3967  0473 72105308      	bset	21256,#0
3968                     ; 1203 }
3971  0477 5b03          	addw	sp,#3
3972  0479 81            	ret
4018                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4018                     ; 1222                        uint8_t TIM2_ICSelection,
4018                     ; 1223                        uint8_t TIM2_ICFilter)
4018                     ; 1224 {
4019                     	switch	.text
4020  047a               L5_TI2_Config:
4022  047a 89            	pushw	x
4023  047b 88            	push	a
4024       00000001      OFST:	set	1
4027                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4029  047c 72195308      	bres	21256,#4
4030                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4030                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4032  0480 7b06          	ld	a,(OFST+5,sp)
4033  0482 97            	ld	xl,a
4034  0483 a610          	ld	a,#16
4035  0485 42            	mul	x,a
4036  0486 9f            	ld	a,xl
4037  0487 1a03          	or	a,(OFST+2,sp)
4038  0489 6b01          	ld	(OFST+0,sp),a
4040  048b c65306        	ld	a,21254
4041  048e a40c          	and	a,#12
4042  0490 1a01          	or	a,(OFST+0,sp)
4043  0492 c75306        	ld	21254,a
4044                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4046  0495 0d02          	tnz	(OFST+1,sp)
4047  0497 2706          	jreq	L1102
4048                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4050  0499 721a5308      	bset	21256,#5
4052  049d 2004          	jra	L3102
4053  049f               L1102:
4054                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4056  049f 721b5308      	bres	21256,#5
4057  04a3               L3102:
4058                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4060  04a3 72185308      	bset	21256,#4
4061                     ; 1245 }
4064  04a7 5b03          	addw	sp,#3
4065  04a9 81            	ret
4111                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4111                     ; 1262                        uint8_t TIM2_ICFilter)
4111                     ; 1263 {
4112                     	switch	.text
4113  04aa               L7_TI3_Config:
4115  04aa 89            	pushw	x
4116  04ab 88            	push	a
4117       00000001      OFST:	set	1
4120                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4122  04ac 72115309      	bres	21257,#0
4123                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4123                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4125  04b0 7b06          	ld	a,(OFST+5,sp)
4126  04b2 97            	ld	xl,a
4127  04b3 a610          	ld	a,#16
4128  04b5 42            	mul	x,a
4129  04b6 9f            	ld	a,xl
4130  04b7 1a03          	or	a,(OFST+2,sp)
4131  04b9 6b01          	ld	(OFST+0,sp),a
4133  04bb c65307        	ld	a,21255
4134  04be a40c          	and	a,#12
4135  04c0 1a01          	or	a,(OFST+0,sp)
4136  04c2 c75307        	ld	21255,a
4137                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4139  04c5 0d02          	tnz	(OFST+1,sp)
4140  04c7 2706          	jreq	L5302
4141                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4143  04c9 72125309      	bset	21257,#1
4145  04cd 2004          	jra	L7302
4146  04cf               L5302:
4147                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4149  04cf 72135309      	bres	21257,#1
4150  04d3               L7302:
4151                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4153  04d3 72105309      	bset	21257,#0
4154                     ; 1283 }
4157  04d7 5b03          	addw	sp,#3
4158  04d9 81            	ret
4171                     	xdef	_TIM2_ClearITPendingBit
4172                     	xdef	_TIM2_GetITStatus
4173                     	xdef	_TIM2_ClearFlag
4174                     	xdef	_TIM2_GetFlagStatus
4175                     	xdef	_TIM2_GetPrescaler
4176                     	xdef	_TIM2_GetCounter
4177                     	xdef	_TIM2_GetCapture3
4178                     	xdef	_TIM2_GetCapture2
4179                     	xdef	_TIM2_GetCapture1
4180                     	xdef	_TIM2_SetIC3Prescaler
4181                     	xdef	_TIM2_SetIC2Prescaler
4182                     	xdef	_TIM2_SetIC1Prescaler
4183                     	xdef	_TIM2_SetCompare3
4184                     	xdef	_TIM2_SetCompare2
4185                     	xdef	_TIM2_SetCompare1
4186                     	xdef	_TIM2_SetAutoreload
4187                     	xdef	_TIM2_SetCounter
4188                     	xdef	_TIM2_SelectOCxM
4189                     	xdef	_TIM2_CCxCmd
4190                     	xdef	_TIM2_OC3PolarityConfig
4191                     	xdef	_TIM2_OC2PolarityConfig
4192                     	xdef	_TIM2_OC1PolarityConfig
4193                     	xdef	_TIM2_GenerateEvent
4194                     	xdef	_TIM2_OC3PreloadConfig
4195                     	xdef	_TIM2_OC2PreloadConfig
4196                     	xdef	_TIM2_OC1PreloadConfig
4197                     	xdef	_TIM2_ARRPreloadConfig
4198                     	xdef	_TIM2_ForcedOC3Config
4199                     	xdef	_TIM2_ForcedOC2Config
4200                     	xdef	_TIM2_ForcedOC1Config
4201                     	xdef	_TIM2_PrescalerConfig
4202                     	xdef	_TIM2_SelectOnePulseMode
4203                     	xdef	_TIM2_UpdateRequestConfig
4204                     	xdef	_TIM2_UpdateDisableConfig
4205                     	xdef	_TIM2_ITConfig
4206                     	xdef	_TIM2_Cmd
4207                     	xdef	_TIM2_PWMIConfig
4208                     	xdef	_TIM2_ICInit
4209                     	xdef	_TIM2_OC3Init
4210                     	xdef	_TIM2_OC2Init
4211                     	xdef	_TIM2_OC1Init
4212                     	xdef	_TIM2_TimeBaseInit
4213                     	xdef	_TIM2_DeInit
4232                     	end
