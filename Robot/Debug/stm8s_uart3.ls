   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 54 void UART3_DeInit(void)
  41                     ; 55 {
  43                     	switch	.text
  44  0000               _UART3_DeInit:
  48                     ; 58   (void) UART3->SR;
  50  0000 c65240        	ld	a,21056
  51                     ; 59   (void) UART3->DR;
  53  0003 c65241        	ld	a,21057
  54                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  56  0006 725f5243      	clr	21059
  57                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  59  000a 725f5242      	clr	21058
  60                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  62  000e 725f5244      	clr	21060
  63                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  65  0012 725f5245      	clr	21061
  66                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  68  0016 725f5246      	clr	21062
  69                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  71  001a 725f5247      	clr	21063
  72                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  74  001e 725f5249      	clr	21065
  75                     ; 69 }
  78  0022 81            	ret
 295                     .const:	section	.text
 296  0000               L01:
 297  0000 00000064      	dc.l	100
 298                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 298                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 298                     ; 85                 UART3_Mode_TypeDef Mode)
 298                     ; 86 {
 299                     	switch	.text
 300  0023               _UART3_Init:
 302  0023 520e          	subw	sp,#14
 303       0000000e      OFST:	set	14
 306                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 310                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 314                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 316                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 318                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 320                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 322                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 324                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 326  0025 72195244      	bres	21060,#4
 327                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 329  0029 c65244        	ld	a,21060
 330  002c 1a15          	or	a,(OFST+7,sp)
 331  002e c75244        	ld	21060,a
 332                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 334  0031 c65246        	ld	a,21062
 335  0034 a4cf          	and	a,#207
 336  0036 c75246        	ld	21062,a
 337                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 339  0039 c65246        	ld	a,21062
 340  003c 1a16          	or	a,(OFST+8,sp)
 341  003e c75246        	ld	21062,a
 342                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 344  0041 c65244        	ld	a,21060
 345  0044 a4f9          	and	a,#249
 346  0046 c75244        	ld	21060,a
 347                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 349  0049 c65244        	ld	a,21060
 350  004c 1a17          	or	a,(OFST+9,sp)
 351  004e c75244        	ld	21060,a
 352                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 354  0051 725f5242      	clr	21058
 355                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 357  0055 c65243        	ld	a,21059
 358  0058 a40f          	and	a,#15
 359  005a c75243        	ld	21059,a
 360                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 362  005d c65243        	ld	a,21059
 363  0060 a4f0          	and	a,#240
 364  0062 c75243        	ld	21059,a
 365                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 367  0065 96            	ldw	x,sp
 368  0066 1c0011        	addw	x,#OFST+3
 369  0069 cd0000        	call	c_ltor
 371  006c a604          	ld	a,#4
 372  006e cd0000        	call	c_llsh
 374  0071 96            	ldw	x,sp
 375  0072 1c0001        	addw	x,#OFST-13
 376  0075 cd0000        	call	c_rtol
 379  0078 cd0000        	call	_CLK_GetClockFreq
 381  007b 96            	ldw	x,sp
 382  007c 1c0001        	addw	x,#OFST-13
 383  007f cd0000        	call	c_ludv
 385  0082 96            	ldw	x,sp
 386  0083 1c000b        	addw	x,#OFST-3
 387  0086 cd0000        	call	c_rtol
 390                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 392  0089 96            	ldw	x,sp
 393  008a 1c0011        	addw	x,#OFST+3
 394  008d cd0000        	call	c_ltor
 396  0090 a604          	ld	a,#4
 397  0092 cd0000        	call	c_llsh
 399  0095 96            	ldw	x,sp
 400  0096 1c0001        	addw	x,#OFST-13
 401  0099 cd0000        	call	c_rtol
 404  009c cd0000        	call	_CLK_GetClockFreq
 406  009f a664          	ld	a,#100
 407  00a1 cd0000        	call	c_smul
 409  00a4 96            	ldw	x,sp
 410  00a5 1c0001        	addw	x,#OFST-13
 411  00a8 cd0000        	call	c_ludv
 413  00ab 96            	ldw	x,sp
 414  00ac 1c0007        	addw	x,#OFST-7
 415  00af cd0000        	call	c_rtol
 418                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 418                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 420  00b2 96            	ldw	x,sp
 421  00b3 1c000b        	addw	x,#OFST-3
 422  00b6 cd0000        	call	c_ltor
 424  00b9 a664          	ld	a,#100
 425  00bb cd0000        	call	c_smul
 427  00be 96            	ldw	x,sp
 428  00bf 1c0001        	addw	x,#OFST-13
 429  00c2 cd0000        	call	c_rtol
 432  00c5 96            	ldw	x,sp
 433  00c6 1c0007        	addw	x,#OFST-7
 434  00c9 cd0000        	call	c_ltor
 436  00cc 96            	ldw	x,sp
 437  00cd 1c0001        	addw	x,#OFST-13
 438  00d0 cd0000        	call	c_lsub
 440  00d3 a604          	ld	a,#4
 441  00d5 cd0000        	call	c_llsh
 443  00d8 ae0000        	ldw	x,#L01
 444  00db cd0000        	call	c_ludv
 446  00de b603          	ld	a,c_lreg+3
 447  00e0 a40f          	and	a,#15
 448  00e2 6b05          	ld	(OFST-9,sp),a
 450                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 452  00e4 1e0d          	ldw	x,(OFST-1,sp)
 453  00e6 54            	srlw	x
 454  00e7 54            	srlw	x
 455  00e8 54            	srlw	x
 456  00e9 54            	srlw	x
 457  00ea 01            	rrwa	x,a
 458  00eb a4f0          	and	a,#240
 459  00ed 5f            	clrw	x
 460  00ee 6b06          	ld	(OFST-8,sp),a
 462                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 464  00f0 7b05          	ld	a,(OFST-9,sp)
 465  00f2 1a06          	or	a,(OFST-8,sp)
 466  00f4 c75243        	ld	21059,a
 467                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 469  00f7 7b0e          	ld	a,(OFST+0,sp)
 470  00f9 c75242        	ld	21058,a
 471                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 473  00fc 7b18          	ld	a,(OFST+10,sp)
 474  00fe a504          	bcp	a,#4
 475  0100 2706          	jreq	L531
 476                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 478  0102 72165245      	bset	21061,#3
 480  0106 2004          	jra	L731
 481  0108               L531:
 482                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 484  0108 72175245      	bres	21061,#3
 485  010c               L731:
 486                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 488  010c 7b18          	ld	a,(OFST+10,sp)
 489  010e a508          	bcp	a,#8
 490  0110 2706          	jreq	L141
 491                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 493  0112 72145245      	bset	21061,#2
 495  0116 2004          	jra	L341
 496  0118               L141:
 497                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 499  0118 72155245      	bres	21061,#2
 500  011c               L341:
 501                     ; 152 }
 504  011c 5b0e          	addw	sp,#14
 505  011e 81            	ret
 560                     ; 160 void UART3_Cmd(FunctionalState NewState)
 560                     ; 161 {
 561                     	switch	.text
 562  011f               _UART3_Cmd:
 566                     ; 162   if (NewState != DISABLE)
 568  011f 4d            	tnz	a
 569  0120 2706          	jreq	L371
 570                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 572  0122 721b5244      	bres	21060,#5
 574  0126 2004          	jra	L571
 575  0128               L371:
 576                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 578  0128 721a5244      	bset	21060,#5
 579  012c               L571:
 580                     ; 172 }
 583  012c 81            	ret
 711                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 711                     ; 190 {
 712                     	switch	.text
 713  012d               _UART3_ITConfig:
 715  012d 89            	pushw	x
 716  012e 89            	pushw	x
 717       00000002      OFST:	set	2
 720                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 724                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 726                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 728                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 730  012f 9e            	ld	a,xh
 731  0130 6b01          	ld	(OFST-1,sp),a
 733                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 735  0132 9f            	ld	a,xl
 736  0133 a40f          	and	a,#15
 737  0135 5f            	clrw	x
 738  0136 97            	ld	xl,a
 739  0137 a601          	ld	a,#1
 740  0139 5d            	tnzw	x
 741  013a 2704          	jreq	L61
 742  013c               L02:
 743  013c 48            	sll	a
 744  013d 5a            	decw	x
 745  013e 26fc          	jrne	L02
 746  0140               L61:
 747  0140 6b02          	ld	(OFST+0,sp),a
 749                     ; 203   if (NewState != DISABLE)
 751  0142 0d07          	tnz	(OFST+5,sp)
 752  0144 273a          	jreq	L352
 753                     ; 206     if (uartreg == 0x01)
 755  0146 7b01          	ld	a,(OFST-1,sp)
 756  0148 a101          	cp	a,#1
 757  014a 260a          	jrne	L552
 758                     ; 208       UART3->CR1 |= itpos;
 760  014c c65244        	ld	a,21060
 761  014f 1a02          	or	a,(OFST+0,sp)
 762  0151 c75244        	ld	21060,a
 764  0154 2066          	jra	L172
 765  0156               L552:
 766                     ; 210     else if (uartreg == 0x02)
 768  0156 7b01          	ld	a,(OFST-1,sp)
 769  0158 a102          	cp	a,#2
 770  015a 260a          	jrne	L162
 771                     ; 212       UART3->CR2 |= itpos;
 773  015c c65245        	ld	a,21061
 774  015f 1a02          	or	a,(OFST+0,sp)
 775  0161 c75245        	ld	21061,a
 777  0164 2056          	jra	L172
 778  0166               L162:
 779                     ; 214     else if (uartreg == 0x03)
 781  0166 7b01          	ld	a,(OFST-1,sp)
 782  0168 a103          	cp	a,#3
 783  016a 260a          	jrne	L562
 784                     ; 216       UART3->CR4 |= itpos;
 786  016c c65247        	ld	a,21063
 787  016f 1a02          	or	a,(OFST+0,sp)
 788  0171 c75247        	ld	21063,a
 790  0174 2046          	jra	L172
 791  0176               L562:
 792                     ; 220       UART3->CR6 |= itpos;
 794  0176 c65249        	ld	a,21065
 795  0179 1a02          	or	a,(OFST+0,sp)
 796  017b c75249        	ld	21065,a
 797  017e 203c          	jra	L172
 798  0180               L352:
 799                     ; 226     if (uartreg == 0x01)
 801  0180 7b01          	ld	a,(OFST-1,sp)
 802  0182 a101          	cp	a,#1
 803  0184 260b          	jrne	L372
 804                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 806  0186 7b02          	ld	a,(OFST+0,sp)
 807  0188 43            	cpl	a
 808  0189 c45244        	and	a,21060
 809  018c c75244        	ld	21060,a
 811  018f 202b          	jra	L172
 812  0191               L372:
 813                     ; 230     else if (uartreg == 0x02)
 815  0191 7b01          	ld	a,(OFST-1,sp)
 816  0193 a102          	cp	a,#2
 817  0195 260b          	jrne	L772
 818                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 820  0197 7b02          	ld	a,(OFST+0,sp)
 821  0199 43            	cpl	a
 822  019a c45245        	and	a,21061
 823  019d c75245        	ld	21061,a
 825  01a0 201a          	jra	L172
 826  01a2               L772:
 827                     ; 234     else if (uartreg == 0x03)
 829  01a2 7b01          	ld	a,(OFST-1,sp)
 830  01a4 a103          	cp	a,#3
 831  01a6 260b          	jrne	L303
 832                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
 834  01a8 7b02          	ld	a,(OFST+0,sp)
 835  01aa 43            	cpl	a
 836  01ab c45247        	and	a,21063
 837  01ae c75247        	ld	21063,a
 839  01b1 2009          	jra	L172
 840  01b3               L303:
 841                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
 843  01b3 7b02          	ld	a,(OFST+0,sp)
 844  01b5 43            	cpl	a
 845  01b6 c45249        	and	a,21065
 846  01b9 c75249        	ld	21065,a
 847  01bc               L172:
 848                     ; 243 }
 851  01bc 5b04          	addw	sp,#4
 852  01be 81            	ret
 911                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 911                     ; 253 {
 912                     	switch	.text
 913  01bf               _UART3_LINBreakDetectionConfig:
 917                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 919                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 921  01bf 4d            	tnz	a
 922  01c0 2706          	jreq	L533
 923                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
 925  01c2 721a5247      	bset	21063,#5
 927  01c6 2004          	jra	L733
 928  01c8               L533:
 929                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
 931  01c8 721b5247      	bres	21063,#5
 932  01cc               L733:
 933                     ; 265 }
 936  01cc 81            	ret
1057                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1057                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1057                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1057                     ; 280 {
1058                     	switch	.text
1059  01cd               _UART3_LINConfig:
1061  01cd 89            	pushw	x
1062       00000000      OFST:	set	0
1065                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1067                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1069                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1071                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1073  01ce 9e            	ld	a,xh
1074  01cf 4d            	tnz	a
1075  01d0 2706          	jreq	L714
1076                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1078  01d2 721a5249      	bset	21065,#5
1080  01d6 2004          	jra	L124
1081  01d8               L714:
1082                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1084  01d8 721b5249      	bres	21065,#5
1085  01dc               L124:
1086                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1088  01dc 0d02          	tnz	(OFST+2,sp)
1089  01de 2706          	jreq	L324
1090                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1092  01e0 72185249      	bset	21065,#4
1094  01e4 2004          	jra	L524
1095  01e6               L324:
1096                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1098  01e6 72195249      	bres	21065,#4
1099  01ea               L524:
1100                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1102  01ea 0d05          	tnz	(OFST+5,sp)
1103  01ec 2706          	jreq	L724
1104                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1106  01ee 721e5249      	bset	21065,#7
1108  01f2 2004          	jra	L134
1109  01f4               L724:
1110                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1112  01f4 721f5249      	bres	21065,#7
1113  01f8               L134:
1114                     ; 312 }
1117  01f8 85            	popw	x
1118  01f9 81            	ret
1153                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1153                     ; 321 {
1154                     	switch	.text
1155  01fa               _UART3_LINCmd:
1159                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1161                     ; 325   if (NewState != DISABLE)
1163  01fa 4d            	tnz	a
1164  01fb 2706          	jreq	L154
1165                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1167  01fd 721c5246      	bset	21062,#6
1169  0201 2004          	jra	L354
1170  0203               L154:
1171                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1173  0203 721d5246      	bres	21062,#6
1174  0207               L354:
1175                     ; 335 }
1178  0207 81            	ret
1235                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1235                     ; 344 {
1236                     	switch	.text
1237  0208               _UART3_WakeUpConfig:
1241                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1243                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1245  0208 72175244      	bres	21060,#3
1246                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1248  020c ca5244        	or	a,21060
1249  020f c75244        	ld	21060,a
1250                     ; 350 }
1253  0212 81            	ret
1289                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1289                     ; 359 {
1290                     	switch	.text
1291  0213               _UART3_ReceiverWakeUpCmd:
1295                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1297                     ; 363   if (NewState != DISABLE)
1299  0213 4d            	tnz	a
1300  0214 2706          	jreq	L125
1301                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1303  0216 72125245      	bset	21061,#1
1305  021a 2004          	jra	L325
1306  021c               L125:
1307                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1309  021c 72135245      	bres	21061,#1
1310  0220               L325:
1311                     ; 373 }
1314  0220 81            	ret
1337                     ; 380 uint8_t UART3_ReceiveData8(void)
1337                     ; 381 {
1338                     	switch	.text
1339  0221               _UART3_ReceiveData8:
1343                     ; 382   return ((uint8_t)UART3->DR);
1345  0221 c65241        	ld	a,21057
1348  0224 81            	ret
1380                     ; 390 uint16_t UART3_ReceiveData9(void)
1380                     ; 391 {
1381                     	switch	.text
1382  0225               _UART3_ReceiveData9:
1384  0225 89            	pushw	x
1385       00000002      OFST:	set	2
1388                     ; 392   uint16_t temp = 0;
1390                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1392  0226 c65244        	ld	a,21060
1393  0229 5f            	clrw	x
1394  022a a480          	and	a,#128
1395  022c 5f            	clrw	x
1396  022d 02            	rlwa	x,a
1397  022e 58            	sllw	x
1398  022f 1f01          	ldw	(OFST-1,sp),x
1400                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1402  0231 c65241        	ld	a,21057
1403  0234 5f            	clrw	x
1404  0235 97            	ld	xl,a
1405  0236 01            	rrwa	x,a
1406  0237 1a02          	or	a,(OFST+0,sp)
1407  0239 01            	rrwa	x,a
1408  023a 1a01          	or	a,(OFST-1,sp)
1409  023c 01            	rrwa	x,a
1410  023d 01            	rrwa	x,a
1411  023e a4ff          	and	a,#255
1412  0240 01            	rrwa	x,a
1413  0241 a401          	and	a,#1
1414  0243 01            	rrwa	x,a
1417  0244 5b02          	addw	sp,#2
1418  0246 81            	ret
1450                     ; 403 void UART3_SendData8(uint8_t Data)
1450                     ; 404 {
1451                     	switch	.text
1452  0247               _UART3_SendData8:
1456                     ; 406   UART3->DR = Data;
1458  0247 c75241        	ld	21057,a
1459                     ; 407 }
1462  024a 81            	ret
1494                     ; 414 void UART3_SendData9(uint16_t Data)
1494                     ; 415 {
1495                     	switch	.text
1496  024b               _UART3_SendData9:
1498  024b 89            	pushw	x
1499       00000000      OFST:	set	0
1502                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1504  024c 721d5244      	bres	21060,#6
1505                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1507  0250 54            	srlw	x
1508  0251 54            	srlw	x
1509  0252 9f            	ld	a,xl
1510  0253 a440          	and	a,#64
1511  0255 ca5244        	or	a,21060
1512  0258 c75244        	ld	21060,a
1513                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1515  025b 7b02          	ld	a,(OFST+2,sp)
1516  025d c75241        	ld	21057,a
1517                     ; 424 }
1520  0260 85            	popw	x
1521  0261 81            	ret
1544                     ; 431 void UART3_SendBreak(void)
1544                     ; 432 {
1545                     	switch	.text
1546  0262               _UART3_SendBreak:
1550                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1552  0262 72105245      	bset	21061,#0
1553                     ; 434 }
1556  0266 81            	ret
1588                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1588                     ; 442 {
1589                     	switch	.text
1590  0267               _UART3_SetAddress:
1592  0267 88            	push	a
1593       00000000      OFST:	set	0
1596                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1598                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1600  0268 c65247        	ld	a,21063
1601  026b a4f0          	and	a,#240
1602  026d c75247        	ld	21063,a
1603                     ; 449   UART3->CR4 |= UART3_Address;
1605  0270 c65247        	ld	a,21063
1606  0273 1a01          	or	a,(OFST+1,sp)
1607  0275 c75247        	ld	21063,a
1608                     ; 450 }
1611  0278 84            	pop	a
1612  0279 81            	ret
1769                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
1769                     ; 459 {
1770                     	switch	.text
1771  027a               _UART3_GetFlagStatus:
1773  027a 89            	pushw	x
1774  027b 88            	push	a
1775       00000001      OFST:	set	1
1778                     ; 460   FlagStatus status = RESET;
1780                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
1782                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
1784  027c a30210        	cpw	x,#528
1785  027f 2610          	jrne	L317
1786                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1788  0281 9f            	ld	a,xl
1789  0282 c45247        	and	a,21063
1790  0285 2706          	jreq	L517
1791                     ; 471       status = SET;
1793  0287 a601          	ld	a,#1
1794  0289 6b01          	ld	(OFST+0,sp),a
1797  028b 2039          	jra	L127
1798  028d               L517:
1799                     ; 476       status = RESET;
1801  028d 0f01          	clr	(OFST+0,sp)
1803  028f 2035          	jra	L127
1804  0291               L317:
1805                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
1807  0291 1e02          	ldw	x,(OFST+1,sp)
1808  0293 a30101        	cpw	x,#257
1809  0296 2611          	jrne	L327
1810                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1812  0298 c65245        	ld	a,21061
1813  029b 1503          	bcp	a,(OFST+2,sp)
1814  029d 2706          	jreq	L527
1815                     ; 484       status = SET;
1817  029f a601          	ld	a,#1
1818  02a1 6b01          	ld	(OFST+0,sp),a
1821  02a3 2021          	jra	L127
1822  02a5               L527:
1823                     ; 489       status = RESET;
1825  02a5 0f01          	clr	(OFST+0,sp)
1827  02a7 201d          	jra	L127
1828  02a9               L327:
1829                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
1831  02a9 1e02          	ldw	x,(OFST+1,sp)
1832  02ab a30302        	cpw	x,#770
1833  02ae 2707          	jreq	L537
1835  02b0 1e02          	ldw	x,(OFST+1,sp)
1836  02b2 a30301        	cpw	x,#769
1837  02b5 2614          	jrne	L337
1838  02b7               L537:
1839                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1841  02b7 c65249        	ld	a,21065
1842  02ba 1503          	bcp	a,(OFST+2,sp)
1843  02bc 2706          	jreq	L737
1844                     ; 497       status = SET;
1846  02be a601          	ld	a,#1
1847  02c0 6b01          	ld	(OFST+0,sp),a
1850  02c2 2002          	jra	L127
1851  02c4               L737:
1852                     ; 502       status = RESET;
1854  02c4 0f01          	clr	(OFST+0,sp)
1856  02c6               L127:
1857                     ; 520   return  status;
1859  02c6 7b01          	ld	a,(OFST+0,sp)
1862  02c8 5b03          	addw	sp,#3
1863  02ca 81            	ret
1864  02cb               L337:
1865                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1867  02cb c65240        	ld	a,21056
1868  02ce 1503          	bcp	a,(OFST+2,sp)
1869  02d0 2706          	jreq	L547
1870                     ; 510       status = SET;
1872  02d2 a601          	ld	a,#1
1873  02d4 6b01          	ld	(OFST+0,sp),a
1876  02d6 20ee          	jra	L127
1877  02d8               L547:
1878                     ; 515       status = RESET;
1880  02d8 0f01          	clr	(OFST+0,sp)
1882  02da 20ea          	jra	L127
1917                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
1917                     ; 552 {
1918                     	switch	.text
1919  02dc               _UART3_ClearFlag:
1921  02dc 89            	pushw	x
1922       00000000      OFST:	set	0
1925                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
1927                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
1929  02dd a30020        	cpw	x,#32
1930  02e0 2606          	jrne	L767
1931                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
1933  02e2 35df5240      	mov	21056,#223
1935  02e6 201e          	jra	L177
1936  02e8               L767:
1937                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
1939  02e8 1e01          	ldw	x,(OFST+1,sp)
1940  02ea a30210        	cpw	x,#528
1941  02ed 2606          	jrne	L377
1942                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
1944  02ef 72195247      	bres	21063,#4
1946  02f3 2011          	jra	L177
1947  02f5               L377:
1948                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
1950  02f5 1e01          	ldw	x,(OFST+1,sp)
1951  02f7 a30302        	cpw	x,#770
1952  02fa 2606          	jrne	L777
1953                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
1955  02fc 72135249      	bres	21065,#1
1957  0300 2004          	jra	L177
1958  0302               L777:
1959                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
1961  0302 72115249      	bres	21065,#0
1962  0306               L177:
1963                     ; 576 }
1966  0306 85            	popw	x
1967  0307 81            	ret
2041                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2041                     ; 592 {
2042                     	switch	.text
2043  0308               _UART3_GetITStatus:
2045  0308 89            	pushw	x
2046  0309 89            	pushw	x
2047       00000002      OFST:	set	2
2050                     ; 593   ITStatus pendingbitstatus = RESET;
2052                     ; 594   uint8_t itpos = 0;
2054                     ; 595   uint8_t itmask1 = 0;
2056                     ; 596   uint8_t itmask2 = 0;
2058                     ; 597   uint8_t enablestatus = 0;
2060                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2062                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2064  030a 9f            	ld	a,xl
2065  030b a40f          	and	a,#15
2066  030d 5f            	clrw	x
2067  030e 97            	ld	xl,a
2068  030f a601          	ld	a,#1
2069  0311 5d            	tnzw	x
2070  0312 2704          	jreq	L65
2071  0314               L06:
2072  0314 48            	sll	a
2073  0315 5a            	decw	x
2074  0316 26fc          	jrne	L06
2075  0318               L65:
2076  0318 6b01          	ld	(OFST-1,sp),a
2078                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2080  031a 7b04          	ld	a,(OFST+2,sp)
2081  031c 4e            	swap	a
2082  031d a40f          	and	a,#15
2083  031f 6b02          	ld	(OFST+0,sp),a
2085                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2087  0321 7b02          	ld	a,(OFST+0,sp)
2088  0323 5f            	clrw	x
2089  0324 97            	ld	xl,a
2090  0325 a601          	ld	a,#1
2091  0327 5d            	tnzw	x
2092  0328 2704          	jreq	L26
2093  032a               L46:
2094  032a 48            	sll	a
2095  032b 5a            	decw	x
2096  032c 26fc          	jrne	L46
2097  032e               L26:
2098  032e 6b02          	ld	(OFST+0,sp),a
2100                     ; 610   if (UART3_IT == UART3_IT_PE)
2102  0330 1e03          	ldw	x,(OFST+1,sp)
2103  0332 a30100        	cpw	x,#256
2104  0335 261c          	jrne	L5301
2105                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2107  0337 c65244        	ld	a,21060
2108  033a 1402          	and	a,(OFST+0,sp)
2109  033c 6b02          	ld	(OFST+0,sp),a
2111                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2113  033e c65240        	ld	a,21056
2114  0341 1501          	bcp	a,(OFST-1,sp)
2115  0343 270a          	jreq	L7301
2117  0345 0d02          	tnz	(OFST+0,sp)
2118  0347 2706          	jreq	L7301
2119                     ; 619       pendingbitstatus = SET;
2121  0349 a601          	ld	a,#1
2122  034b 6b02          	ld	(OFST+0,sp),a
2125  034d 2064          	jra	L3401
2126  034f               L7301:
2127                     ; 624       pendingbitstatus = RESET;
2129  034f 0f02          	clr	(OFST+0,sp)
2131  0351 2060          	jra	L3401
2132  0353               L5301:
2133                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2135  0353 1e03          	ldw	x,(OFST+1,sp)
2136  0355 a30346        	cpw	x,#838
2137  0358 261c          	jrne	L5401
2138                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2140  035a c65247        	ld	a,21063
2141  035d 1402          	and	a,(OFST+0,sp)
2142  035f 6b02          	ld	(OFST+0,sp),a
2144                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2146  0361 c65247        	ld	a,21063
2147  0364 1501          	bcp	a,(OFST-1,sp)
2148  0366 270a          	jreq	L7401
2150  0368 0d02          	tnz	(OFST+0,sp)
2151  036a 2706          	jreq	L7401
2152                     ; 635       pendingbitstatus = SET;
2154  036c a601          	ld	a,#1
2155  036e 6b02          	ld	(OFST+0,sp),a
2158  0370 2041          	jra	L3401
2159  0372               L7401:
2160                     ; 640       pendingbitstatus = RESET;
2162  0372 0f02          	clr	(OFST+0,sp)
2164  0374 203d          	jra	L3401
2165  0376               L5401:
2166                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2168  0376 1e03          	ldw	x,(OFST+1,sp)
2169  0378 a30412        	cpw	x,#1042
2170  037b 261c          	jrne	L5501
2171                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2173  037d c65249        	ld	a,21065
2174  0380 1402          	and	a,(OFST+0,sp)
2175  0382 6b02          	ld	(OFST+0,sp),a
2177                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2179  0384 c65249        	ld	a,21065
2180  0387 1501          	bcp	a,(OFST-1,sp)
2181  0389 270a          	jreq	L7501
2183  038b 0d02          	tnz	(OFST+0,sp)
2184  038d 2706          	jreq	L7501
2185                     ; 651       pendingbitstatus = SET;
2187  038f a601          	ld	a,#1
2188  0391 6b02          	ld	(OFST+0,sp),a
2191  0393 201e          	jra	L3401
2192  0395               L7501:
2193                     ; 656       pendingbitstatus = RESET;
2195  0395 0f02          	clr	(OFST+0,sp)
2197  0397 201a          	jra	L3401
2198  0399               L5501:
2199                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2201  0399 c65245        	ld	a,21061
2202  039c 1402          	and	a,(OFST+0,sp)
2203  039e 6b02          	ld	(OFST+0,sp),a
2205                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2207  03a0 c65240        	ld	a,21056
2208  03a3 1501          	bcp	a,(OFST-1,sp)
2209  03a5 270a          	jreq	L5601
2211  03a7 0d02          	tnz	(OFST+0,sp)
2212  03a9 2706          	jreq	L5601
2213                     ; 667       pendingbitstatus = SET;
2215  03ab a601          	ld	a,#1
2216  03ad 6b02          	ld	(OFST+0,sp),a
2219  03af 2002          	jra	L3401
2220  03b1               L5601:
2221                     ; 672       pendingbitstatus = RESET;
2223  03b1 0f02          	clr	(OFST+0,sp)
2225  03b3               L3401:
2226                     ; 676   return  pendingbitstatus;
2228  03b3 7b02          	ld	a,(OFST+0,sp)
2231  03b5 5b04          	addw	sp,#4
2232  03b7 81            	ret
2268                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2268                     ; 707 {
2269                     	switch	.text
2270  03b8               _UART3_ClearITPendingBit:
2272  03b8 89            	pushw	x
2273       00000000      OFST:	set	0
2276                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2278                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2280  03b9 a30255        	cpw	x,#597
2281  03bc 2606          	jrne	L7011
2282                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2284  03be 35df5240      	mov	21056,#223
2286  03c2 2011          	jra	L1111
2287  03c4               L7011:
2288                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2290  03c4 1e01          	ldw	x,(OFST+1,sp)
2291  03c6 a30346        	cpw	x,#838
2292  03c9 2606          	jrne	L3111
2293                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2295  03cb 72195247      	bres	21063,#4
2297  03cf 2004          	jra	L1111
2298  03d1               L3111:
2299                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2301  03d1 72135249      	bres	21065,#1
2302  03d5               L1111:
2303                     ; 726 }
2306  03d5 85            	popw	x
2307  03d6 81            	ret
2320                     	xdef	_UART3_ClearITPendingBit
2321                     	xdef	_UART3_GetITStatus
2322                     	xdef	_UART3_ClearFlag
2323                     	xdef	_UART3_GetFlagStatus
2324                     	xdef	_UART3_SetAddress
2325                     	xdef	_UART3_SendBreak
2326                     	xdef	_UART3_SendData9
2327                     	xdef	_UART3_SendData8
2328                     	xdef	_UART3_ReceiveData9
2329                     	xdef	_UART3_ReceiveData8
2330                     	xdef	_UART3_WakeUpConfig
2331                     	xdef	_UART3_ReceiverWakeUpCmd
2332                     	xdef	_UART3_LINCmd
2333                     	xdef	_UART3_LINConfig
2334                     	xdef	_UART3_LINBreakDetectionConfig
2335                     	xdef	_UART3_ITConfig
2336                     	xdef	_UART3_Cmd
2337                     	xdef	_UART3_Init
2338                     	xdef	_UART3_DeInit
2339                     	xref	_CLK_GetClockFreq
2340                     	xref.b	c_lreg
2341                     	xref.b	c_x
2360                     	xref	c_lsub
2361                     	xref	c_smul
2362                     	xref	c_ludv
2363                     	xref	c_rtol
2364                     	xref	c_llsh
2365                     	xref	c_ltor
2366                     	end
