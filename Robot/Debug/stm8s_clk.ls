   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  13                     .const:	section	.text
  14  0000               _HSIDivFactor:
  15  0000 01            	dc.b	1
  16  0001 02            	dc.b	2
  17  0002 04            	dc.b	4
  18  0003 08            	dc.b	8
  19  0004               _CLKPrescTable:
  20  0004 01            	dc.b	1
  21  0005 02            	dc.b	2
  22  0006 04            	dc.b	4
  23  0007 08            	dc.b	8
  24  0008 0a            	dc.b	10
  25  0009 10            	dc.b	16
  26  000a 14            	dc.b	20
  27  000b 28            	dc.b	40
  56                     ; 72 void CLK_DeInit(void)
  56                     ; 73 {
  58                     	switch	.text
  59  0000               _CLK_DeInit:
  63                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  65  0000 350150c0      	mov	20672,#1
  66                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  68  0004 725f50c1      	clr	20673
  69                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0008 35e150c4      	mov	20676,#225
  72                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  000c 725f50c5      	clr	20677
  75                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0010 351850c6      	mov	20678,#24
  78                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  0014 35ff50c7      	mov	20679,#255
  81                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0018 35ff50ca      	mov	20682,#255
  84                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  86  001c 725f50c8      	clr	20680
  87                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  89  0020 725f50c9      	clr	20681
  91  0024               L52:
  92                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  94  0024 c650c9        	ld	a,20681
  95  0027 a501          	bcp	a,#1
  96  0029 26f9          	jrne	L52
  97                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  002b 725f50c9      	clr	20681
 100                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 102  002f 725f50cc      	clr	20684
 103                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 105  0033 725f50cd      	clr	20685
 106                     ; 88 }
 109  0037 81            	ret
 165                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 165                     ; 100 {
 166                     	switch	.text
 167  0038               _CLK_FastHaltWakeUpCmd:
 171                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 173                     ; 104   if (NewState != DISABLE)
 175  0038 4d            	tnz	a
 176  0039 2706          	jreq	L75
 177                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 179  003b 721450c0      	bset	20672,#2
 181  003f 2004          	jra	L16
 182  0041               L75:
 183                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 185  0041 721550c0      	bres	20672,#2
 186  0045               L16:
 187                     ; 114 }
 190  0045 81            	ret
 225                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 225                     ; 122 {
 226                     	switch	.text
 227  0046               _CLK_HSECmd:
 231                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 233                     ; 126   if (NewState != DISABLE)
 235  0046 4d            	tnz	a
 236  0047 2706          	jreq	L101
 237                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 239  0049 721050c1      	bset	20673,#0
 241  004d 2004          	jra	L301
 242  004f               L101:
 243                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 245  004f 721150c1      	bres	20673,#0
 246  0053               L301:
 247                     ; 136 }
 250  0053 81            	ret
 285                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 285                     ; 144 {
 286                     	switch	.text
 287  0054               _CLK_HSICmd:
 291                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 293                     ; 148   if (NewState != DISABLE)
 295  0054 4d            	tnz	a
 296  0055 2706          	jreq	L321
 297                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 299  0057 721050c0      	bset	20672,#0
 301  005b 2004          	jra	L521
 302  005d               L321:
 303                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 305  005d 721150c0      	bres	20672,#0
 306  0061               L521:
 307                     ; 158 }
 310  0061 81            	ret
 345                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 345                     ; 167 {
 346                     	switch	.text
 347  0062               _CLK_LSICmd:
 351                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 353                     ; 171   if (NewState != DISABLE)
 355  0062 4d            	tnz	a
 356  0063 2706          	jreq	L541
 357                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 359  0065 721650c0      	bset	20672,#3
 361  0069 2004          	jra	L741
 362  006b               L541:
 363                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 365  006b 721750c0      	bres	20672,#3
 366  006f               L741:
 367                     ; 181 }
 370  006f 81            	ret
 405                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 405                     ; 190 {
 406                     	switch	.text
 407  0070               _CLK_CCOCmd:
 411                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 413                     ; 194   if (NewState != DISABLE)
 415  0070 4d            	tnz	a
 416  0071 2706          	jreq	L761
 417                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 419  0073 721050c9      	bset	20681,#0
 421  0077 2004          	jra	L171
 422  0079               L761:
 423                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 425  0079 721150c9      	bres	20681,#0
 426  007d               L171:
 427                     ; 204 }
 430  007d 81            	ret
 465                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 465                     ; 214 {
 466                     	switch	.text
 467  007e               _CLK_ClockSwitchCmd:
 471                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 473                     ; 218   if (NewState != DISABLE )
 475  007e 4d            	tnz	a
 476  007f 2706          	jreq	L112
 477                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 479  0081 721250c5      	bset	20677,#1
 481  0085 2004          	jra	L312
 482  0087               L112:
 483                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 485  0087 721350c5      	bres	20677,#1
 486  008b               L312:
 487                     ; 228 }
 490  008b 81            	ret
 526                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 526                     ; 239 {
 527                     	switch	.text
 528  008c               _CLK_SlowActiveHaltWakeUpCmd:
 532                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 534                     ; 243   if (NewState != DISABLE)
 536  008c 4d            	tnz	a
 537  008d 2706          	jreq	L332
 538                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 540  008f 721a50c0      	bset	20672,#5
 542  0093 2004          	jra	L532
 543  0095               L332:
 544                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 546  0095 721b50c0      	bres	20672,#5
 547  0099               L532:
 548                     ; 253 }
 551  0099 81            	ret
 710                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 710                     ; 264 {
 711                     	switch	.text
 712  009a               _CLK_PeripheralClockConfig:
 714  009a 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 720                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 722                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 724  009b 9e            	ld	a,xh
 725  009c a510          	bcp	a,#16
 726  009e 2633          	jrne	L123
 727                     ; 271     if (NewState != DISABLE)
 729  00a0 0d02          	tnz	(OFST+2,sp)
 730  00a2 2717          	jreq	L323
 731                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 733  00a4 7b01          	ld	a,(OFST+1,sp)
 734  00a6 a40f          	and	a,#15
 735  00a8 5f            	clrw	x
 736  00a9 97            	ld	xl,a
 737  00aa a601          	ld	a,#1
 738  00ac 5d            	tnzw	x
 739  00ad 2704          	jreq	L62
 740  00af               L03:
 741  00af 48            	sll	a
 742  00b0 5a            	decw	x
 743  00b1 26fc          	jrne	L03
 744  00b3               L62:
 745  00b3 ca50c7        	or	a,20679
 746  00b6 c750c7        	ld	20679,a
 748  00b9 2049          	jra	L723
 749  00bb               L323:
 750                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 752  00bb 7b01          	ld	a,(OFST+1,sp)
 753  00bd a40f          	and	a,#15
 754  00bf 5f            	clrw	x
 755  00c0 97            	ld	xl,a
 756  00c1 a601          	ld	a,#1
 757  00c3 5d            	tnzw	x
 758  00c4 2704          	jreq	L23
 759  00c6               L43:
 760  00c6 48            	sll	a
 761  00c7 5a            	decw	x
 762  00c8 26fc          	jrne	L43
 763  00ca               L23:
 764  00ca 43            	cpl	a
 765  00cb c450c7        	and	a,20679
 766  00ce c750c7        	ld	20679,a
 767  00d1 2031          	jra	L723
 768  00d3               L123:
 769                     ; 284     if (NewState != DISABLE)
 771  00d3 0d02          	tnz	(OFST+2,sp)
 772  00d5 2717          	jreq	L133
 773                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 775  00d7 7b01          	ld	a,(OFST+1,sp)
 776  00d9 a40f          	and	a,#15
 777  00db 5f            	clrw	x
 778  00dc 97            	ld	xl,a
 779  00dd a601          	ld	a,#1
 780  00df 5d            	tnzw	x
 781  00e0 2704          	jreq	L63
 782  00e2               L04:
 783  00e2 48            	sll	a
 784  00e3 5a            	decw	x
 785  00e4 26fc          	jrne	L04
 786  00e6               L63:
 787  00e6 ca50ca        	or	a,20682
 788  00e9 c750ca        	ld	20682,a
 790  00ec 2016          	jra	L723
 791  00ee               L133:
 792                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 794  00ee 7b01          	ld	a,(OFST+1,sp)
 795  00f0 a40f          	and	a,#15
 796  00f2 5f            	clrw	x
 797  00f3 97            	ld	xl,a
 798  00f4 a601          	ld	a,#1
 799  00f6 5d            	tnzw	x
 800  00f7 2704          	jreq	L24
 801  00f9               L44:
 802  00f9 48            	sll	a
 803  00fa 5a            	decw	x
 804  00fb 26fc          	jrne	L44
 805  00fd               L24:
 806  00fd 43            	cpl	a
 807  00fe c450ca        	and	a,20682
 808  0101 c750ca        	ld	20682,a
 809  0104               L723:
 810                     ; 295 }
 813  0104 85            	popw	x
 814  0105 81            	ret
1000                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1000                     ; 310 {
1001                     	switch	.text
1002  0106               _CLK_ClockSwitchConfig:
1004  0106 89            	pushw	x
1005  0107 5204          	subw	sp,#4
1006       00000004      OFST:	set	4
1009                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1011  0109 aeffff        	ldw	x,#65535
1012  010c 1f03          	ldw	(OFST-1,sp),x
1014                     ; 313   ErrorStatus Swif = ERROR;
1016                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1018                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1020                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1022                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1024                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1026  010e c650c3        	ld	a,20675
1027  0111 6b01          	ld	(OFST-3,sp),a
1029                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1031  0113 7b05          	ld	a,(OFST+1,sp)
1032  0115 a101          	cp	a,#1
1033  0117 264b          	jrne	L344
1034                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1036  0119 721250c5      	bset	20677,#1
1037                     ; 331     if (ITState != DISABLE)
1039  011d 0d09          	tnz	(OFST+5,sp)
1040  011f 2706          	jreq	L544
1041                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1043  0121 721450c5      	bset	20677,#2
1045  0125 2004          	jra	L744
1046  0127               L544:
1047                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1049  0127 721550c5      	bres	20677,#2
1050  012b               L744:
1051                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1053  012b 7b06          	ld	a,(OFST+2,sp)
1054  012d c750c4        	ld	20676,a
1056  0130 2007          	jra	L554
1057  0132               L154:
1058                     ; 346       DownCounter--;
1060  0132 1e03          	ldw	x,(OFST-1,sp)
1061  0134 1d0001        	subw	x,#1
1062  0137 1f03          	ldw	(OFST-1,sp),x
1064  0139               L554:
1065                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1067  0139 c650c5        	ld	a,20677
1068  013c a501          	bcp	a,#1
1069  013e 2704          	jreq	L164
1071  0140 1e03          	ldw	x,(OFST-1,sp)
1072  0142 26ee          	jrne	L154
1073  0144               L164:
1074                     ; 349     if(DownCounter != 0)
1076  0144 1e03          	ldw	x,(OFST-1,sp)
1077  0146 2706          	jreq	L364
1078                     ; 351       Swif = SUCCESS;
1080  0148 a601          	ld	a,#1
1081  014a 6b02          	ld	(OFST-2,sp),a
1084  014c 2002          	jra	L764
1085  014e               L364:
1086                     ; 355       Swif = ERROR;
1088  014e 0f02          	clr	(OFST-2,sp)
1090  0150               L764:
1091                     ; 390   if(Swif != ERROR)
1093  0150 0d02          	tnz	(OFST-2,sp)
1094  0152 2767          	jreq	L315
1095                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1097  0154 0d0a          	tnz	(OFST+6,sp)
1098  0156 2645          	jrne	L515
1100  0158 7b01          	ld	a,(OFST-3,sp)
1101  015a a1e1          	cp	a,#225
1102  015c 263f          	jrne	L515
1103                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1105  015e 721150c0      	bres	20672,#0
1107  0162 2057          	jra	L315
1108  0164               L344:
1109                     ; 361     if (ITState != DISABLE)
1111  0164 0d09          	tnz	(OFST+5,sp)
1112  0166 2706          	jreq	L174
1113                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1115  0168 721450c5      	bset	20677,#2
1117  016c 2004          	jra	L374
1118  016e               L174:
1119                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1121  016e 721550c5      	bres	20677,#2
1122  0172               L374:
1123                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1125  0172 7b06          	ld	a,(OFST+2,sp)
1126  0174 c750c4        	ld	20676,a
1128  0177 2007          	jra	L105
1129  0179               L574:
1130                     ; 376       DownCounter--;
1132  0179 1e03          	ldw	x,(OFST-1,sp)
1133  017b 1d0001        	subw	x,#1
1134  017e 1f03          	ldw	(OFST-1,sp),x
1136  0180               L105:
1137                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1139  0180 c650c5        	ld	a,20677
1140  0183 a508          	bcp	a,#8
1141  0185 2704          	jreq	L505
1143  0187 1e03          	ldw	x,(OFST-1,sp)
1144  0189 26ee          	jrne	L574
1145  018b               L505:
1146                     ; 379     if(DownCounter != 0)
1148  018b 1e03          	ldw	x,(OFST-1,sp)
1149  018d 270a          	jreq	L705
1150                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1152  018f 721250c5      	bset	20677,#1
1153                     ; 383       Swif = SUCCESS;
1155  0193 a601          	ld	a,#1
1156  0195 6b02          	ld	(OFST-2,sp),a
1159  0197 20b7          	jra	L764
1160  0199               L705:
1161                     ; 387       Swif = ERROR;
1163  0199 0f02          	clr	(OFST-2,sp)
1165  019b 20b3          	jra	L764
1166  019d               L515:
1167                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1169  019d 0d0a          	tnz	(OFST+6,sp)
1170  019f 260c          	jrne	L125
1172  01a1 7b01          	ld	a,(OFST-3,sp)
1173  01a3 a1d2          	cp	a,#210
1174  01a5 2606          	jrne	L125
1175                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1177  01a7 721750c0      	bres	20672,#3
1179  01ab 200e          	jra	L315
1180  01ad               L125:
1181                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1183  01ad 0d0a          	tnz	(OFST+6,sp)
1184  01af 260a          	jrne	L315
1186  01b1 7b01          	ld	a,(OFST-3,sp)
1187  01b3 a1b4          	cp	a,#180
1188  01b5 2604          	jrne	L315
1189                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1191  01b7 721150c1      	bres	20673,#0
1192  01bb               L315:
1193                     ; 406   return(Swif);
1195  01bb 7b02          	ld	a,(OFST-2,sp)
1198  01bd 5b06          	addw	sp,#6
1199  01bf 81            	ret
1337                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1337                     ; 416 {
1338                     	switch	.text
1339  01c0               _CLK_HSIPrescalerConfig:
1341  01c0 88            	push	a
1342       00000000      OFST:	set	0
1345                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1347                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1349  01c1 c650c6        	ld	a,20678
1350  01c4 a4e7          	and	a,#231
1351  01c6 c750c6        	ld	20678,a
1352                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1354  01c9 c650c6        	ld	a,20678
1355  01cc 1a01          	or	a,(OFST+1,sp)
1356  01ce c750c6        	ld	20678,a
1357                     ; 425 }
1360  01d1 84            	pop	a
1361  01d2 81            	ret
1496                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1496                     ; 437 {
1497                     	switch	.text
1498  01d3               _CLK_CCOConfig:
1500  01d3 88            	push	a
1501       00000000      OFST:	set	0
1504                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1506                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1508  01d4 c650c9        	ld	a,20681
1509  01d7 a4e1          	and	a,#225
1510  01d9 c750c9        	ld	20681,a
1511                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1513  01dc c650c9        	ld	a,20681
1514  01df 1a01          	or	a,(OFST+1,sp)
1515  01e1 c750c9        	ld	20681,a
1516                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1518  01e4 721050c9      	bset	20681,#0
1519                     ; 449 }
1522  01e8 84            	pop	a
1523  01e9 81            	ret
1588                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1588                     ; 460 {
1589                     	switch	.text
1590  01ea               _CLK_ITConfig:
1592  01ea 89            	pushw	x
1593       00000000      OFST:	set	0
1596                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1598                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1600                     ; 465   if (NewState != DISABLE)
1602  01eb 9f            	ld	a,xl
1603  01ec 4d            	tnz	a
1604  01ed 2719          	jreq	L327
1605                     ; 467     switch (CLK_IT)
1607  01ef 9e            	ld	a,xh
1609                     ; 475     default:
1609                     ; 476       break;
1610  01f0 a00c          	sub	a,#12
1611  01f2 270a          	jreq	L756
1612  01f4 a010          	sub	a,#16
1613  01f6 2624          	jrne	L137
1614                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1614                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1616  01f8 721450c5      	bset	20677,#2
1617                     ; 471       break;
1619  01fc 201e          	jra	L137
1620  01fe               L756:
1621                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1621                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1623  01fe 721450c8      	bset	20680,#2
1624                     ; 474       break;
1626  0202 2018          	jra	L137
1627  0204               L166:
1628                     ; 475     default:
1628                     ; 476       break;
1630  0204 2016          	jra	L137
1631  0206               L727:
1633  0206 2014          	jra	L137
1634  0208               L327:
1635                     ; 481     switch (CLK_IT)
1637  0208 7b01          	ld	a,(OFST+1,sp)
1639                     ; 489     default:
1639                     ; 490       break;
1640  020a a00c          	sub	a,#12
1641  020c 270a          	jreq	L566
1642  020e a010          	sub	a,#16
1643  0210 260a          	jrne	L137
1644                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1644                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1646  0212 721550c5      	bres	20677,#2
1647                     ; 485       break;
1649  0216 2004          	jra	L137
1650  0218               L566:
1651                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1651                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1653  0218 721550c8      	bres	20680,#2
1654                     ; 488       break;
1655  021c               L137:
1656                     ; 493 }
1659  021c 85            	popw	x
1660  021d 81            	ret
1661  021e               L766:
1662                     ; 489     default:
1662                     ; 490       break;
1664  021e 20fc          	jra	L137
1665  0220               L537:
1666  0220 20fa          	jra	L137
1701                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1701                     ; 501 {
1702                     	switch	.text
1703  0222               _CLK_SYSCLKConfig:
1705  0222 88            	push	a
1706       00000000      OFST:	set	0
1709                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1711                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1713  0223 a580          	bcp	a,#128
1714  0225 2614          	jrne	L557
1715                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1717  0227 c650c6        	ld	a,20678
1718  022a a4e7          	and	a,#231
1719  022c c750c6        	ld	20678,a
1720                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1722  022f 7b01          	ld	a,(OFST+1,sp)
1723  0231 a418          	and	a,#24
1724  0233 ca50c6        	or	a,20678
1725  0236 c750c6        	ld	20678,a
1727  0239 2012          	jra	L757
1728  023b               L557:
1729                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1731  023b c650c6        	ld	a,20678
1732  023e a4f8          	and	a,#248
1733  0240 c750c6        	ld	20678,a
1734                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1736  0243 7b01          	ld	a,(OFST+1,sp)
1737  0245 a407          	and	a,#7
1738  0247 ca50c6        	or	a,20678
1739  024a c750c6        	ld	20678,a
1740  024d               L757:
1741                     ; 515 }
1744  024d 84            	pop	a
1745  024e 81            	ret
1801                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1801                     ; 524 {
1802                     	switch	.text
1803  024f               _CLK_SWIMConfig:
1807                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1809                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1811  024f 4d            	tnz	a
1812  0250 2706          	jreq	L7001
1813                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1815  0252 721050cd      	bset	20685,#0
1817  0256 2004          	jra	L1101
1818  0258               L7001:
1819                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1821  0258 721150cd      	bres	20685,#0
1822  025c               L1101:
1823                     ; 538 }
1826  025c 81            	ret
1850                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1850                     ; 548 {
1851                     	switch	.text
1852  025d               _CLK_ClockSecuritySystemEnable:
1856                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1858  025d 721050c8      	bset	20680,#0
1859                     ; 551 }
1862  0261 81            	ret
1887                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1887                     ; 560 {
1888                     	switch	.text
1889  0262               _CLK_GetSYSCLKSource:
1893                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1895  0262 c650c3        	ld	a,20675
1898  0265 81            	ret
1955                     ; 569 uint32_t CLK_GetClockFreq(void)
1955                     ; 570 {
1956                     	switch	.text
1957  0266               _CLK_GetClockFreq:
1959  0266 5209          	subw	sp,#9
1960       00000009      OFST:	set	9
1963                     ; 571   uint32_t clockfrequency = 0;
1965                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1967                     ; 573   uint8_t tmp = 0, presc = 0;
1971                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1973  0268 c650c3        	ld	a,20675
1974  026b 6b09          	ld	(OFST+0,sp),a
1976                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1978  026d 7b09          	ld	a,(OFST+0,sp)
1979  026f a1e1          	cp	a,#225
1980  0271 2641          	jrne	L7501
1981                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1983  0273 c650c6        	ld	a,20678
1984  0276 a418          	and	a,#24
1985  0278 6b09          	ld	(OFST+0,sp),a
1987                     ; 581     tmp = (uint8_t)(tmp >> 3);
1989  027a 0409          	srl	(OFST+0,sp)
1990  027c 0409          	srl	(OFST+0,sp)
1991  027e 0409          	srl	(OFST+0,sp)
1993                     ; 582     presc = HSIDivFactor[tmp];
1995  0280 7b09          	ld	a,(OFST+0,sp)
1996  0282 5f            	clrw	x
1997  0283 97            	ld	xl,a
1998  0284 d60000        	ld	a,(_HSIDivFactor,x)
1999  0287 6b09          	ld	(OFST+0,sp),a
2001                     ; 583     clockfrequency = HSI_VALUE / presc;
2003  0289 7b09          	ld	a,(OFST+0,sp)
2004  028b b703          	ld	c_lreg+3,a
2005  028d 3f02          	clr	c_lreg+2
2006  028f 3f01          	clr	c_lreg+1
2007  0291 3f00          	clr	c_lreg
2008  0293 96            	ldw	x,sp
2009  0294 1c0001        	addw	x,#OFST-8
2010  0297 cd0000        	call	c_rtol
2013  029a ae2400        	ldw	x,#9216
2014  029d bf02          	ldw	c_lreg+2,x
2015  029f ae00f4        	ldw	x,#244
2016  02a2 bf00          	ldw	c_lreg,x
2017  02a4 96            	ldw	x,sp
2018  02a5 1c0001        	addw	x,#OFST-8
2019  02a8 cd0000        	call	c_ludv
2021  02ab 96            	ldw	x,sp
2022  02ac 1c0005        	addw	x,#OFST-4
2023  02af cd0000        	call	c_rtol
2027  02b2 201c          	jra	L1601
2028  02b4               L7501:
2029                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2031  02b4 7b09          	ld	a,(OFST+0,sp)
2032  02b6 a1d2          	cp	a,#210
2033  02b8 260c          	jrne	L3601
2034                     ; 587     clockfrequency = LSI_VALUE;
2036  02ba aef400        	ldw	x,#62464
2037  02bd 1f07          	ldw	(OFST-2,sp),x
2038  02bf ae0001        	ldw	x,#1
2039  02c2 1f05          	ldw	(OFST-4,sp),x
2042  02c4 200a          	jra	L1601
2043  02c6               L3601:
2044                     ; 591     clockfrequency = HSE_VALUE;
2046  02c6 ae3600        	ldw	x,#13824
2047  02c9 1f07          	ldw	(OFST-2,sp),x
2048  02cb ae016e        	ldw	x,#366
2049  02ce 1f05          	ldw	(OFST-4,sp),x
2051  02d0               L1601:
2052                     ; 594   return((uint32_t)clockfrequency);
2054  02d0 96            	ldw	x,sp
2055  02d1 1c0005        	addw	x,#OFST-4
2056  02d4 cd0000        	call	c_ltor
2060  02d7 5b09          	addw	sp,#9
2061  02d9 81            	ret
2160                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2160                     ; 605 {
2161                     	switch	.text
2162  02da               _CLK_AdjustHSICalibrationValue:
2164  02da 88            	push	a
2165       00000000      OFST:	set	0
2168                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2170                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2172  02db c650cc        	ld	a,20684
2173  02de a4f8          	and	a,#248
2174  02e0 1a01          	or	a,(OFST+1,sp)
2175  02e2 c750cc        	ld	20684,a
2176                     ; 611 }
2179  02e5 84            	pop	a
2180  02e6 81            	ret
2204                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2204                     ; 623 {
2205                     	switch	.text
2206  02e7               _CLK_SYSCLKEmergencyClear:
2210                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2212  02e7 721150c5      	bres	20677,#0
2213                     ; 625 }
2216  02eb 81            	ret
2365                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2365                     ; 635 {
2366                     	switch	.text
2367  02ec               _CLK_GetFlagStatus:
2369  02ec 89            	pushw	x
2370  02ed 5203          	subw	sp,#3
2371       00000003      OFST:	set	3
2374                     ; 636   uint16_t statusreg = 0;
2376                     ; 637   uint8_t tmpreg = 0;
2378                     ; 638   FlagStatus bitstatus = RESET;
2380                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2382                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2384  02ef 01            	rrwa	x,a
2385  02f0 9f            	ld	a,xl
2386  02f1 a4ff          	and	a,#255
2387  02f3 97            	ld	xl,a
2388  02f4 4f            	clr	a
2389  02f5 02            	rlwa	x,a
2390  02f6 1f01          	ldw	(OFST-2,sp),x
2391  02f8 01            	rrwa	x,a
2393                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2395  02f9 1e01          	ldw	x,(OFST-2,sp)
2396  02fb a30100        	cpw	x,#256
2397  02fe 2607          	jrne	L5221
2398                     ; 649     tmpreg = CLK->ICKR;
2400  0300 c650c0        	ld	a,20672
2401  0303 6b03          	ld	(OFST+0,sp),a
2404  0305 202f          	jra	L7221
2405  0307               L5221:
2406                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2408  0307 1e01          	ldw	x,(OFST-2,sp)
2409  0309 a30200        	cpw	x,#512
2410  030c 2607          	jrne	L1321
2411                     ; 653     tmpreg = CLK->ECKR;
2413  030e c650c1        	ld	a,20673
2414  0311 6b03          	ld	(OFST+0,sp),a
2417  0313 2021          	jra	L7221
2418  0315               L1321:
2419                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2421  0315 1e01          	ldw	x,(OFST-2,sp)
2422  0317 a30300        	cpw	x,#768
2423  031a 2607          	jrne	L5321
2424                     ; 657     tmpreg = CLK->SWCR;
2426  031c c650c5        	ld	a,20677
2427  031f 6b03          	ld	(OFST+0,sp),a
2430  0321 2013          	jra	L7221
2431  0323               L5321:
2432                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2434  0323 1e01          	ldw	x,(OFST-2,sp)
2435  0325 a30400        	cpw	x,#1024
2436  0328 2607          	jrne	L1421
2437                     ; 661     tmpreg = CLK->CSSR;
2439  032a c650c8        	ld	a,20680
2440  032d 6b03          	ld	(OFST+0,sp),a
2443  032f 2005          	jra	L7221
2444  0331               L1421:
2445                     ; 665     tmpreg = CLK->CCOR;
2447  0331 c650c9        	ld	a,20681
2448  0334 6b03          	ld	(OFST+0,sp),a
2450  0336               L7221:
2451                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2453  0336 7b05          	ld	a,(OFST+2,sp)
2454  0338 1503          	bcp	a,(OFST+0,sp)
2455  033a 2706          	jreq	L5421
2456                     ; 670     bitstatus = SET;
2458  033c a601          	ld	a,#1
2459  033e 6b03          	ld	(OFST+0,sp),a
2462  0340 2002          	jra	L7421
2463  0342               L5421:
2464                     ; 674     bitstatus = RESET;
2466  0342 0f03          	clr	(OFST+0,sp)
2468  0344               L7421:
2469                     ; 678   return((FlagStatus)bitstatus);
2471  0344 7b03          	ld	a,(OFST+0,sp)
2474  0346 5b05          	addw	sp,#5
2475  0348 81            	ret
2521                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2521                     ; 688 {
2522                     	switch	.text
2523  0349               _CLK_GetITStatus:
2525  0349 88            	push	a
2526  034a 88            	push	a
2527       00000001      OFST:	set	1
2530                     ; 689   ITStatus bitstatus = RESET;
2532                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2534                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2536  034b a11c          	cp	a,#28
2537  034d 2611          	jrne	L3721
2538                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2540  034f c450c5        	and	a,20677
2541  0352 a10c          	cp	a,#12
2542  0354 2606          	jrne	L5721
2543                     ; 699       bitstatus = SET;
2545  0356 a601          	ld	a,#1
2546  0358 6b01          	ld	(OFST+0,sp),a
2549  035a 2015          	jra	L1031
2550  035c               L5721:
2551                     ; 703       bitstatus = RESET;
2553  035c 0f01          	clr	(OFST+0,sp)
2555  035e 2011          	jra	L1031
2556  0360               L3721:
2557                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2559  0360 c650c8        	ld	a,20680
2560  0363 1402          	and	a,(OFST+1,sp)
2561  0365 a10c          	cp	a,#12
2562  0367 2606          	jrne	L3031
2563                     ; 711       bitstatus = SET;
2565  0369 a601          	ld	a,#1
2566  036b 6b01          	ld	(OFST+0,sp),a
2569  036d 2002          	jra	L1031
2570  036f               L3031:
2571                     ; 715       bitstatus = RESET;
2573  036f 0f01          	clr	(OFST+0,sp)
2575  0371               L1031:
2576                     ; 720   return bitstatus;
2578  0371 7b01          	ld	a,(OFST+0,sp)
2581  0373 85            	popw	x
2582  0374 81            	ret
2618                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2618                     ; 730 {
2619                     	switch	.text
2620  0375               _CLK_ClearITPendingBit:
2624                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2626                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2628  0375 a10c          	cp	a,#12
2629  0377 2606          	jrne	L5231
2630                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2632  0379 721750c8      	bres	20680,#3
2634  037d 2004          	jra	L7231
2635  037f               L5231:
2636                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2638  037f 721750c5      	bres	20677,#3
2639  0383               L7231:
2640                     ; 745 }
2643  0383 81            	ret
2678                     	xdef	_CLKPrescTable
2679                     	xdef	_HSIDivFactor
2680                     	xdef	_CLK_ClearITPendingBit
2681                     	xdef	_CLK_GetITStatus
2682                     	xdef	_CLK_GetFlagStatus
2683                     	xdef	_CLK_GetSYSCLKSource
2684                     	xdef	_CLK_GetClockFreq
2685                     	xdef	_CLK_AdjustHSICalibrationValue
2686                     	xdef	_CLK_SYSCLKEmergencyClear
2687                     	xdef	_CLK_ClockSecuritySystemEnable
2688                     	xdef	_CLK_SWIMConfig
2689                     	xdef	_CLK_SYSCLKConfig
2690                     	xdef	_CLK_ITConfig
2691                     	xdef	_CLK_CCOConfig
2692                     	xdef	_CLK_HSIPrescalerConfig
2693                     	xdef	_CLK_ClockSwitchConfig
2694                     	xdef	_CLK_PeripheralClockConfig
2695                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2696                     	xdef	_CLK_FastHaltWakeUpCmd
2697                     	xdef	_CLK_ClockSwitchCmd
2698                     	xdef	_CLK_CCOCmd
2699                     	xdef	_CLK_LSICmd
2700                     	xdef	_CLK_HSICmd
2701                     	xdef	_CLK_HSECmd
2702                     	xdef	_CLK_DeInit
2703                     	xref.b	c_lreg
2704                     	xref.b	c_x
2723                     	xref	c_ltor
2724                     	xref	c_ludv
2725                     	xref	c_rtol
2726                     	end
