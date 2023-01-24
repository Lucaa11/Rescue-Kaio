   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 53 void UART1_DeInit(void)
  41                     ; 54 {
  43                     	switch	.text
  44  0000               _UART1_DeInit:
  48                     ; 57   (void)UART1->SR;
  50  0000 c65230        	ld	a,21040
  51                     ; 58   (void)UART1->DR;
  53  0003 c65231        	ld	a,21041
  54                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  56  0006 725f5233      	clr	21043
  57                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  59  000a 725f5232      	clr	21042
  60                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  62  000e 725f5234      	clr	21044
  63                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  65  0012 725f5235      	clr	21045
  66                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  68  0016 725f5236      	clr	21046
  69                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  71  001a 725f5237      	clr	21047
  72                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  74  001e 725f5238      	clr	21048
  75                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  77  0022 725f5239      	clr	21049
  78                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  80  0026 725f523a      	clr	21050
  81                     ; 71 }
  84  002a 81            	ret
 381                     .const:	section	.text
 382  0000               L01:
 383  0000 00000064      	dc.l	100
 384                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 384                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 384                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 384                     ; 93 {
 385                     	switch	.text
 386  002b               _UART1_Init:
 388  002b 520c          	subw	sp,#12
 389       0000000c      OFST:	set	12
 392                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 396                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 398                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 400                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 402                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 404                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 406                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 408                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 410  002d 72195234      	bres	21044,#4
 411                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 413  0031 c65234        	ld	a,21044
 414  0034 1a13          	or	a,(OFST+7,sp)
 415  0036 c75234        	ld	21044,a
 416                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 418  0039 c65236        	ld	a,21046
 419  003c a4cf          	and	a,#207
 420  003e c75236        	ld	21046,a
 421                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 423  0041 c65236        	ld	a,21046
 424  0044 1a14          	or	a,(OFST+8,sp)
 425  0046 c75236        	ld	21046,a
 426                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 428  0049 c65234        	ld	a,21044
 429  004c a4f9          	and	a,#249
 430  004e c75234        	ld	21044,a
 431                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 433  0051 c65234        	ld	a,21044
 434  0054 1a15          	or	a,(OFST+9,sp)
 435  0056 c75234        	ld	21044,a
 436                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 438  0059 725f5232      	clr	21042
 439                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 441  005d c65233        	ld	a,21043
 442  0060 a40f          	and	a,#15
 443  0062 c75233        	ld	21043,a
 444                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 446  0065 c65233        	ld	a,21043
 447  0068 a4f0          	and	a,#240
 448  006a c75233        	ld	21043,a
 449                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 451  006d 96            	ldw	x,sp
 452  006e 1c000f        	addw	x,#OFST+3
 453  0071 cd0000        	call	c_ltor
 455  0074 a604          	ld	a,#4
 456  0076 cd0000        	call	c_llsh
 458  0079 96            	ldw	x,sp
 459  007a 1c0001        	addw	x,#OFST-11
 460  007d cd0000        	call	c_rtol
 463  0080 cd0000        	call	_CLK_GetClockFreq
 465  0083 96            	ldw	x,sp
 466  0084 1c0001        	addw	x,#OFST-11
 467  0087 cd0000        	call	c_ludv
 469  008a 96            	ldw	x,sp
 470  008b 1c0009        	addw	x,#OFST-3
 471  008e cd0000        	call	c_rtol
 474                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 476  0091 96            	ldw	x,sp
 477  0092 1c000f        	addw	x,#OFST+3
 478  0095 cd0000        	call	c_ltor
 480  0098 a604          	ld	a,#4
 481  009a cd0000        	call	c_llsh
 483  009d 96            	ldw	x,sp
 484  009e 1c0001        	addw	x,#OFST-11
 485  00a1 cd0000        	call	c_rtol
 488  00a4 cd0000        	call	_CLK_GetClockFreq
 490  00a7 a664          	ld	a,#100
 491  00a9 cd0000        	call	c_smul
 493  00ac 96            	ldw	x,sp
 494  00ad 1c0001        	addw	x,#OFST-11
 495  00b0 cd0000        	call	c_ludv
 497  00b3 96            	ldw	x,sp
 498  00b4 1c0005        	addw	x,#OFST-7
 499  00b7 cd0000        	call	c_rtol
 502                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 504  00ba 96            	ldw	x,sp
 505  00bb 1c0009        	addw	x,#OFST-3
 506  00be cd0000        	call	c_ltor
 508  00c1 a664          	ld	a,#100
 509  00c3 cd0000        	call	c_smul
 511  00c6 96            	ldw	x,sp
 512  00c7 1c0001        	addw	x,#OFST-11
 513  00ca cd0000        	call	c_rtol
 516  00cd 96            	ldw	x,sp
 517  00ce 1c0005        	addw	x,#OFST-7
 518  00d1 cd0000        	call	c_ltor
 520  00d4 96            	ldw	x,sp
 521  00d5 1c0001        	addw	x,#OFST-11
 522  00d8 cd0000        	call	c_lsub
 524  00db a604          	ld	a,#4
 525  00dd cd0000        	call	c_llsh
 527  00e0 ae0000        	ldw	x,#L01
 528  00e3 cd0000        	call	c_ludv
 530  00e6 b603          	ld	a,c_lreg+3
 531  00e8 a40f          	and	a,#15
 532  00ea ca5233        	or	a,21043
 533  00ed c75233        	ld	21043,a
 534                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 536  00f0 1e0b          	ldw	x,(OFST-1,sp)
 537  00f2 54            	srlw	x
 538  00f3 54            	srlw	x
 539  00f4 54            	srlw	x
 540  00f5 54            	srlw	x
 541  00f6 01            	rrwa	x,a
 542  00f7 a4f0          	and	a,#240
 543  00f9 5f            	clrw	x
 544  00fa ca5233        	or	a,21043
 545  00fd c75233        	ld	21043,a
 546                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 548  0100 c65232        	ld	a,21042
 549  0103 1a0c          	or	a,(OFST+0,sp)
 550  0105 c75232        	ld	21042,a
 551                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 553  0108 c65235        	ld	a,21045
 554  010b a4f3          	and	a,#243
 555  010d c75235        	ld	21045,a
 556                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 558  0110 c65236        	ld	a,21046
 559  0113 a4f8          	and	a,#248
 560  0115 c75236        	ld	21046,a
 561                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 561                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 563  0118 7b16          	ld	a,(OFST+10,sp)
 564  011a a407          	and	a,#7
 565  011c ca5236        	or	a,21046
 566  011f c75236        	ld	21046,a
 567                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 569  0122 7b17          	ld	a,(OFST+11,sp)
 570  0124 a504          	bcp	a,#4
 571  0126 2706          	jreq	L561
 572                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 574  0128 72165235      	bset	21045,#3
 576  012c 2004          	jra	L761
 577  012e               L561:
 578                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 580  012e 72175235      	bres	21045,#3
 581  0132               L761:
 582                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 584  0132 7b17          	ld	a,(OFST+11,sp)
 585  0134 a508          	bcp	a,#8
 586  0136 2706          	jreq	L171
 587                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 589  0138 72145235      	bset	21045,#2
 591  013c 2004          	jra	L371
 592  013e               L171:
 593                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 595  013e 72155235      	bres	21045,#2
 596  0142               L371:
 597                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 599  0142 7b16          	ld	a,(OFST+10,sp)
 600  0144 a580          	bcp	a,#128
 601  0146 2706          	jreq	L571
 602                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 604  0148 72175236      	bres	21046,#3
 606  014c 200a          	jra	L771
 607  014e               L571:
 608                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 610  014e 7b16          	ld	a,(OFST+10,sp)
 611  0150 a408          	and	a,#8
 612  0152 ca5236        	or	a,21046
 613  0155 c75236        	ld	21046,a
 614  0158               L771:
 615                     ; 176 }
 618  0158 5b0c          	addw	sp,#12
 619  015a 81            	ret
 674                     ; 184 void UART1_Cmd(FunctionalState NewState)
 674                     ; 185 {
 675                     	switch	.text
 676  015b               _UART1_Cmd:
 680                     ; 186   if (NewState != DISABLE)
 682  015b 4d            	tnz	a
 683  015c 2706          	jreq	L722
 684                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 686  015e 721b5234      	bres	21044,#5
 688  0162 2004          	jra	L132
 689  0164               L722:
 690                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 692  0164 721a5234      	bset	21044,#5
 693  0168               L132:
 694                     ; 196 }
 697  0168 81            	ret
 818                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 818                     ; 212 {
 819                     	switch	.text
 820  0169               _UART1_ITConfig:
 822  0169 89            	pushw	x
 823  016a 89            	pushw	x
 824       00000002      OFST:	set	2
 827                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 831                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 833                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 835                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 837  016b 9e            	ld	a,xh
 838  016c 6b01          	ld	(OFST-1,sp),a
 840                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 842  016e 9f            	ld	a,xl
 843  016f a40f          	and	a,#15
 844  0171 5f            	clrw	x
 845  0172 97            	ld	xl,a
 846  0173 a601          	ld	a,#1
 847  0175 5d            	tnzw	x
 848  0176 2704          	jreq	L61
 849  0178               L02:
 850  0178 48            	sll	a
 851  0179 5a            	decw	x
 852  017a 26fc          	jrne	L02
 853  017c               L61:
 854  017c 6b02          	ld	(OFST+0,sp),a
 856                     ; 224   if (NewState != DISABLE)
 858  017e 0d07          	tnz	(OFST+5,sp)
 859  0180 272a          	jreq	L503
 860                     ; 227     if (uartreg == 0x01)
 862  0182 7b01          	ld	a,(OFST-1,sp)
 863  0184 a101          	cp	a,#1
 864  0186 260a          	jrne	L703
 865                     ; 229       UART1->CR1 |= itpos;
 867  0188 c65234        	ld	a,21044
 868  018b 1a02          	or	a,(OFST+0,sp)
 869  018d c75234        	ld	21044,a
 871  0190 2045          	jra	L713
 872  0192               L703:
 873                     ; 231     else if (uartreg == 0x02)
 875  0192 7b01          	ld	a,(OFST-1,sp)
 876  0194 a102          	cp	a,#2
 877  0196 260a          	jrne	L313
 878                     ; 233       UART1->CR2 |= itpos;
 880  0198 c65235        	ld	a,21045
 881  019b 1a02          	or	a,(OFST+0,sp)
 882  019d c75235        	ld	21045,a
 884  01a0 2035          	jra	L713
 885  01a2               L313:
 886                     ; 237       UART1->CR4 |= itpos;
 888  01a2 c65237        	ld	a,21047
 889  01a5 1a02          	or	a,(OFST+0,sp)
 890  01a7 c75237        	ld	21047,a
 891  01aa 202b          	jra	L713
 892  01ac               L503:
 893                     ; 243     if (uartreg == 0x01)
 895  01ac 7b01          	ld	a,(OFST-1,sp)
 896  01ae a101          	cp	a,#1
 897  01b0 260b          	jrne	L123
 898                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 900  01b2 7b02          	ld	a,(OFST+0,sp)
 901  01b4 43            	cpl	a
 902  01b5 c45234        	and	a,21044
 903  01b8 c75234        	ld	21044,a
 905  01bb 201a          	jra	L713
 906  01bd               L123:
 907                     ; 247     else if (uartreg == 0x02)
 909  01bd 7b01          	ld	a,(OFST-1,sp)
 910  01bf a102          	cp	a,#2
 911  01c1 260b          	jrne	L523
 912                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 914  01c3 7b02          	ld	a,(OFST+0,sp)
 915  01c5 43            	cpl	a
 916  01c6 c45235        	and	a,21045
 917  01c9 c75235        	ld	21045,a
 919  01cc 2009          	jra	L713
 920  01ce               L523:
 921                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 923  01ce 7b02          	ld	a,(OFST+0,sp)
 924  01d0 43            	cpl	a
 925  01d1 c45237        	and	a,21047
 926  01d4 c75237        	ld	21047,a
 927  01d7               L713:
 928                     ; 257 }
 931  01d7 5b04          	addw	sp,#4
 932  01d9 81            	ret
 968                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 968                     ; 266 {
 969                     	switch	.text
 970  01da               _UART1_HalfDuplexCmd:
 974                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 976                     ; 269   if (NewState != DISABLE)
 978  01da 4d            	tnz	a
 979  01db 2706          	jreq	L743
 980                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 982  01dd 72165238      	bset	21048,#3
 984  01e1 2004          	jra	L153
 985  01e3               L743:
 986                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 988  01e3 72175238      	bres	21048,#3
 989  01e7               L153:
 990                     ; 277 }
 993  01e7 81            	ret
1050                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1050                     ; 286 {
1051                     	switch	.text
1052  01e8               _UART1_IrDAConfig:
1056                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1058                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1060  01e8 4d            	tnz	a
1061  01e9 2706          	jreq	L104
1062                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1064  01eb 72145238      	bset	21048,#2
1066  01ef 2004          	jra	L304
1067  01f1               L104:
1068                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1070  01f1 72155238      	bres	21048,#2
1071  01f5               L304:
1072                     ; 297 }
1075  01f5 81            	ret
1110                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1110                     ; 306 {
1111                     	switch	.text
1112  01f6               _UART1_IrDACmd:
1116                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1118                     ; 310   if (NewState != DISABLE)
1120  01f6 4d            	tnz	a
1121  01f7 2706          	jreq	L324
1122                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1124  01f9 72125238      	bset	21048,#1
1126  01fd 2004          	jra	L524
1127  01ff               L324:
1128                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1130  01ff 72135238      	bres	21048,#1
1131  0203               L524:
1132                     ; 320 }
1135  0203 81            	ret
1194                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1194                     ; 330 {
1195                     	switch	.text
1196  0204               _UART1_LINBreakDetectionConfig:
1200                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1202                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1204  0204 4d            	tnz	a
1205  0205 2706          	jreq	L554
1206                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1208  0207 721a5237      	bset	21047,#5
1210  020b 2004          	jra	L754
1211  020d               L554:
1212                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1214  020d 721b5237      	bres	21047,#5
1215  0211               L754:
1216                     ; 341 }
1219  0211 81            	ret
1254                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1254                     ; 350 {
1255                     	switch	.text
1256  0212               _UART1_LINCmd:
1260                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1262                     ; 353   if (NewState != DISABLE)
1264  0212 4d            	tnz	a
1265  0213 2706          	jreq	L774
1266                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1268  0215 721c5236      	bset	21046,#6
1270  0219 2004          	jra	L105
1271  021b               L774:
1272                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1274  021b 721d5236      	bres	21046,#6
1275  021f               L105:
1276                     ; 363 }
1279  021f 81            	ret
1314                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1314                     ; 372 {
1315                     	switch	.text
1316  0220               _UART1_SmartCardCmd:
1320                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1322                     ; 375   if (NewState != DISABLE)
1324  0220 4d            	tnz	a
1325  0221 2706          	jreq	L125
1326                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1328  0223 721a5238      	bset	21048,#5
1330  0227 2004          	jra	L325
1331  0229               L125:
1332                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1334  0229 721b5238      	bres	21048,#5
1335  022d               L325:
1336                     ; 385 }
1339  022d 81            	ret
1375                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1375                     ; 395 {
1376                     	switch	.text
1377  022e               _UART1_SmartCardNACKCmd:
1381                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1383                     ; 398   if (NewState != DISABLE)
1385  022e 4d            	tnz	a
1386  022f 2706          	jreq	L345
1387                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1389  0231 72185238      	bset	21048,#4
1391  0235 2004          	jra	L545
1392  0237               L345:
1393                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1395  0237 72195238      	bres	21048,#4
1396  023b               L545:
1397                     ; 408 }
1400  023b 81            	ret
1457                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1457                     ; 417 {
1458                     	switch	.text
1459  023c               _UART1_WakeUpConfig:
1463                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1465                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1467  023c 72175234      	bres	21044,#3
1468                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1470  0240 ca5234        	or	a,21044
1471  0243 c75234        	ld	21044,a
1472                     ; 422 }
1475  0246 81            	ret
1511                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1511                     ; 431 {
1512                     	switch	.text
1513  0247               _UART1_ReceiverWakeUpCmd:
1517                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1519                     ; 434   if (NewState != DISABLE)
1521  0247 4d            	tnz	a
1522  0248 2706          	jreq	L316
1523                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1525  024a 72125235      	bset	21045,#1
1527  024e 2004          	jra	L516
1528  0250               L316:
1529                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1531  0250 72135235      	bres	21045,#1
1532  0254               L516:
1533                     ; 444 }
1536  0254 81            	ret
1559                     ; 451 uint8_t UART1_ReceiveData8(void)
1559                     ; 452 {
1560                     	switch	.text
1561  0255               _UART1_ReceiveData8:
1565                     ; 453   return ((uint8_t)UART1->DR);
1567  0255 c65231        	ld	a,21041
1570  0258 81            	ret
1602                     ; 461 uint16_t UART1_ReceiveData9(void)
1602                     ; 462 {
1603                     	switch	.text
1604  0259               _UART1_ReceiveData9:
1606  0259 89            	pushw	x
1607       00000002      OFST:	set	2
1610                     ; 463   uint16_t temp = 0;
1612                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1614  025a c65234        	ld	a,21044
1615  025d 5f            	clrw	x
1616  025e a480          	and	a,#128
1617  0260 5f            	clrw	x
1618  0261 02            	rlwa	x,a
1619  0262 58            	sllw	x
1620  0263 1f01          	ldw	(OFST-1,sp),x
1622                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1624  0265 c65231        	ld	a,21041
1625  0268 5f            	clrw	x
1626  0269 97            	ld	xl,a
1627  026a 01            	rrwa	x,a
1628  026b 1a02          	or	a,(OFST+0,sp)
1629  026d 01            	rrwa	x,a
1630  026e 1a01          	or	a,(OFST-1,sp)
1631  0270 01            	rrwa	x,a
1632  0271 01            	rrwa	x,a
1633  0272 a4ff          	and	a,#255
1634  0274 01            	rrwa	x,a
1635  0275 a401          	and	a,#1
1636  0277 01            	rrwa	x,a
1639  0278 5b02          	addw	sp,#2
1640  027a 81            	ret
1672                     ; 474 void UART1_SendData8(uint8_t Data)
1672                     ; 475 {
1673                     	switch	.text
1674  027b               _UART1_SendData8:
1678                     ; 477   UART1->DR = Data;
1680  027b c75231        	ld	21041,a
1681                     ; 478 }
1684  027e 81            	ret
1716                     ; 486 void UART1_SendData9(uint16_t Data)
1716                     ; 487 {
1717                     	switch	.text
1718  027f               _UART1_SendData9:
1720  027f 89            	pushw	x
1721       00000000      OFST:	set	0
1724                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1726  0280 721d5234      	bres	21044,#6
1727                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1729  0284 54            	srlw	x
1730  0285 54            	srlw	x
1731  0286 9f            	ld	a,xl
1732  0287 a440          	and	a,#64
1733  0289 ca5234        	or	a,21044
1734  028c c75234        	ld	21044,a
1735                     ; 493   UART1->DR   = (uint8_t)(Data);
1737  028f 7b02          	ld	a,(OFST+2,sp)
1738  0291 c75231        	ld	21041,a
1739                     ; 494 }
1742  0294 85            	popw	x
1743  0295 81            	ret
1766                     ; 501 void UART1_SendBreak(void)
1766                     ; 502 {
1767                     	switch	.text
1768  0296               _UART1_SendBreak:
1772                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1774  0296 72105235      	bset	21045,#0
1775                     ; 504 }
1778  029a 81            	ret
1810                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1810                     ; 512 {
1811                     	switch	.text
1812  029b               _UART1_SetAddress:
1814  029b 88            	push	a
1815       00000000      OFST:	set	0
1818                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1820                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1822  029c c65237        	ld	a,21047
1823  029f a4f0          	and	a,#240
1824  02a1 c75237        	ld	21047,a
1825                     ; 519   UART1->CR4 |= UART1_Address;
1827  02a4 c65237        	ld	a,21047
1828  02a7 1a01          	or	a,(OFST+1,sp)
1829  02a9 c75237        	ld	21047,a
1830                     ; 520 }
1833  02ac 84            	pop	a
1834  02ad 81            	ret
1866                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1866                     ; 529 {
1867                     	switch	.text
1868  02ae               _UART1_SetGuardTime:
1872                     ; 531   UART1->GTR = UART1_GuardTime;
1874  02ae c75239        	ld	21049,a
1875                     ; 532 }
1878  02b1 81            	ret
1910                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1910                     ; 557 {
1911                     	switch	.text
1912  02b2               _UART1_SetPrescaler:
1916                     ; 559   UART1->PSCR = UART1_Prescaler;
1918  02b2 c7523a        	ld	21050,a
1919                     ; 560 }
1922  02b5 81            	ret
2065                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2065                     ; 569 {
2066                     	switch	.text
2067  02b6               _UART1_GetFlagStatus:
2069  02b6 89            	pushw	x
2070  02b7 88            	push	a
2071       00000001      OFST:	set	1
2074                     ; 570   FlagStatus status = RESET;
2076                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2078                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2080  02b8 a30210        	cpw	x,#528
2081  02bb 2610          	jrne	L1301
2082                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2084  02bd 9f            	ld	a,xl
2085  02be c45237        	and	a,21047
2086  02c1 2706          	jreq	L3301
2087                     ; 582       status = SET;
2089  02c3 a601          	ld	a,#1
2090  02c5 6b01          	ld	(OFST+0,sp),a
2093  02c7 202b          	jra	L7301
2094  02c9               L3301:
2095                     ; 587       status = RESET;
2097  02c9 0f01          	clr	(OFST+0,sp)
2099  02cb 2027          	jra	L7301
2100  02cd               L1301:
2101                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2103  02cd 1e02          	ldw	x,(OFST+1,sp)
2104  02cf a30101        	cpw	x,#257
2105  02d2 2611          	jrne	L1401
2106                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2108  02d4 c65235        	ld	a,21045
2109  02d7 1503          	bcp	a,(OFST+2,sp)
2110  02d9 2706          	jreq	L3401
2111                     ; 595       status = SET;
2113  02db a601          	ld	a,#1
2114  02dd 6b01          	ld	(OFST+0,sp),a
2117  02df 2013          	jra	L7301
2118  02e1               L3401:
2119                     ; 600       status = RESET;
2121  02e1 0f01          	clr	(OFST+0,sp)
2123  02e3 200f          	jra	L7301
2124  02e5               L1401:
2125                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2127  02e5 c65230        	ld	a,21040
2128  02e8 1503          	bcp	a,(OFST+2,sp)
2129  02ea 2706          	jreq	L1501
2130                     ; 608       status = SET;
2132  02ec a601          	ld	a,#1
2133  02ee 6b01          	ld	(OFST+0,sp),a
2136  02f0 2002          	jra	L7301
2137  02f2               L1501:
2138                     ; 613       status = RESET;
2140  02f2 0f01          	clr	(OFST+0,sp)
2142  02f4               L7301:
2143                     ; 617   return status;
2145  02f4 7b01          	ld	a,(OFST+0,sp)
2148  02f6 5b03          	addw	sp,#3
2149  02f8 81            	ret
2184                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2184                     ; 647 {
2185                     	switch	.text
2186  02f9               _UART1_ClearFlag:
2190                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2192                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2194  02f9 a30020        	cpw	x,#32
2195  02fc 2606          	jrne	L3701
2196                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2198  02fe 35df5230      	mov	21040,#223
2200  0302 2004          	jra	L5701
2201  0304               L3701:
2202                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2204  0304 72195237      	bres	21047,#4
2205  0308               L5701:
2206                     ; 660 }
2209  0308 81            	ret
2283                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2283                     ; 676 {
2284                     	switch	.text
2285  0309               _UART1_GetITStatus:
2287  0309 89            	pushw	x
2288  030a 89            	pushw	x
2289       00000002      OFST:	set	2
2292                     ; 677   ITStatus pendingbitstatus = RESET;
2294                     ; 678   uint8_t itpos = 0;
2296                     ; 679   uint8_t itmask1 = 0;
2298                     ; 680   uint8_t itmask2 = 0;
2300                     ; 681   uint8_t enablestatus = 0;
2302                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2304                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2306  030b 9f            	ld	a,xl
2307  030c a40f          	and	a,#15
2308  030e 5f            	clrw	x
2309  030f 97            	ld	xl,a
2310  0310 a601          	ld	a,#1
2311  0312 5d            	tnzw	x
2312  0313 2704          	jreq	L27
2313  0315               L47:
2314  0315 48            	sll	a
2315  0316 5a            	decw	x
2316  0317 26fc          	jrne	L47
2317  0319               L27:
2318  0319 6b01          	ld	(OFST-1,sp),a
2320                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2322  031b 7b04          	ld	a,(OFST+2,sp)
2323  031d 4e            	swap	a
2324  031e a40f          	and	a,#15
2325  0320 6b02          	ld	(OFST+0,sp),a
2327                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2329  0322 7b02          	ld	a,(OFST+0,sp)
2330  0324 5f            	clrw	x
2331  0325 97            	ld	xl,a
2332  0326 a601          	ld	a,#1
2333  0328 5d            	tnzw	x
2334  0329 2704          	jreq	L67
2335  032b               L001:
2336  032b 48            	sll	a
2337  032c 5a            	decw	x
2338  032d 26fc          	jrne	L001
2339  032f               L67:
2340  032f 6b02          	ld	(OFST+0,sp),a
2342                     ; 695   if (UART1_IT == UART1_IT_PE)
2344  0331 1e03          	ldw	x,(OFST+1,sp)
2345  0333 a30100        	cpw	x,#256
2346  0336 261c          	jrne	L1311
2347                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2349  0338 c65234        	ld	a,21044
2350  033b 1402          	and	a,(OFST+0,sp)
2351  033d 6b02          	ld	(OFST+0,sp),a
2353                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2355  033f c65230        	ld	a,21040
2356  0342 1501          	bcp	a,(OFST-1,sp)
2357  0344 270a          	jreq	L3311
2359  0346 0d02          	tnz	(OFST+0,sp)
2360  0348 2706          	jreq	L3311
2361                     ; 704       pendingbitstatus = SET;
2363  034a a601          	ld	a,#1
2364  034c 6b02          	ld	(OFST+0,sp),a
2367  034e 2041          	jra	L7311
2368  0350               L3311:
2369                     ; 709       pendingbitstatus = RESET;
2371  0350 0f02          	clr	(OFST+0,sp)
2373  0352 203d          	jra	L7311
2374  0354               L1311:
2375                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2377  0354 1e03          	ldw	x,(OFST+1,sp)
2378  0356 a30346        	cpw	x,#838
2379  0359 261c          	jrne	L1411
2380                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2382  035b c65237        	ld	a,21047
2383  035e 1402          	and	a,(OFST+0,sp)
2384  0360 6b02          	ld	(OFST+0,sp),a
2386                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2388  0362 c65237        	ld	a,21047
2389  0365 1501          	bcp	a,(OFST-1,sp)
2390  0367 270a          	jreq	L3411
2392  0369 0d02          	tnz	(OFST+0,sp)
2393  036b 2706          	jreq	L3411
2394                     ; 721       pendingbitstatus = SET;
2396  036d a601          	ld	a,#1
2397  036f 6b02          	ld	(OFST+0,sp),a
2400  0371 201e          	jra	L7311
2401  0373               L3411:
2402                     ; 726       pendingbitstatus = RESET;
2404  0373 0f02          	clr	(OFST+0,sp)
2406  0375 201a          	jra	L7311
2407  0377               L1411:
2408                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2410  0377 c65235        	ld	a,21045
2411  037a 1402          	and	a,(OFST+0,sp)
2412  037c 6b02          	ld	(OFST+0,sp),a
2414                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2416  037e c65230        	ld	a,21040
2417  0381 1501          	bcp	a,(OFST-1,sp)
2418  0383 270a          	jreq	L1511
2420  0385 0d02          	tnz	(OFST+0,sp)
2421  0387 2706          	jreq	L1511
2422                     ; 737       pendingbitstatus = SET;
2424  0389 a601          	ld	a,#1
2425  038b 6b02          	ld	(OFST+0,sp),a
2428  038d 2002          	jra	L7311
2429  038f               L1511:
2430                     ; 742       pendingbitstatus = RESET;
2432  038f 0f02          	clr	(OFST+0,sp)
2434  0391               L7311:
2435                     ; 747   return  pendingbitstatus;
2437  0391 7b02          	ld	a,(OFST+0,sp)
2440  0393 5b04          	addw	sp,#4
2441  0395 81            	ret
2477                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2477                     ; 776 {
2478                     	switch	.text
2479  0396               _UART1_ClearITPendingBit:
2483                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2485                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2487  0396 a30255        	cpw	x,#597
2488  0399 2606          	jrne	L3711
2489                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2491  039b 35df5230      	mov	21040,#223
2493  039f 2004          	jra	L5711
2494  03a1               L3711:
2495                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2497  03a1 72195237      	bres	21047,#4
2498  03a5               L5711:
2499                     ; 789 }
2502  03a5 81            	ret
2515                     	xdef	_UART1_ClearITPendingBit
2516                     	xdef	_UART1_GetITStatus
2517                     	xdef	_UART1_ClearFlag
2518                     	xdef	_UART1_GetFlagStatus
2519                     	xdef	_UART1_SetPrescaler
2520                     	xdef	_UART1_SetGuardTime
2521                     	xdef	_UART1_SetAddress
2522                     	xdef	_UART1_SendBreak
2523                     	xdef	_UART1_SendData9
2524                     	xdef	_UART1_SendData8
2525                     	xdef	_UART1_ReceiveData9
2526                     	xdef	_UART1_ReceiveData8
2527                     	xdef	_UART1_ReceiverWakeUpCmd
2528                     	xdef	_UART1_WakeUpConfig
2529                     	xdef	_UART1_SmartCardNACKCmd
2530                     	xdef	_UART1_SmartCardCmd
2531                     	xdef	_UART1_LINCmd
2532                     	xdef	_UART1_LINBreakDetectionConfig
2533                     	xdef	_UART1_IrDACmd
2534                     	xdef	_UART1_IrDAConfig
2535                     	xdef	_UART1_HalfDuplexCmd
2536                     	xdef	_UART1_ITConfig
2537                     	xdef	_UART1_Cmd
2538                     	xdef	_UART1_Init
2539                     	xdef	_UART1_DeInit
2540                     	xref	_CLK_GetClockFreq
2541                     	xref.b	c_lreg
2542                     	xref.b	c_x
2561                     	xref	c_lsub
2562                     	xref	c_smul
2563                     	xref	c_ludv
2564                     	xref	c_rtol
2565                     	xref	c_llsh
2566                     	xref	c_ltor
2567                     	end
