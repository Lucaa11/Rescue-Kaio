   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 67 void I2C_DeInit(void)
  41                     ; 68 {
  43                     	switch	.text
  44  0000               _I2C_DeInit:
  48                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  50  0000 725f5210      	clr	21008
  51                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  53  0004 725f5211      	clr	21009
  54                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  56  0008 725f5212      	clr	21010
  57                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  59  000c 725f5213      	clr	21011
  60                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  62  0010 725f5214      	clr	21012
  63                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  65  0014 725f521a      	clr	21018
  66                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  68  0018 725f521b      	clr	21019
  69                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  71  001c 725f521c      	clr	21020
  72                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  74  0020 3502521d      	mov	21021,#2
  75                     ; 78 }
  78  0024 81            	ret
 245                     .const:	section	.text
 246  0000               L01:
 247  0000 000186a1      	dc.l	100001
 248  0004               L21:
 249  0004 000f4240      	dc.l	1000000
 250                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 250                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 250                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 250                     ; 99 {
 251                     	switch	.text
 252  0025               _I2C_Init:
 254  0025 5209          	subw	sp,#9
 255       00000009      OFST:	set	9
 258                     ; 100   uint16_t result = 0x0004;
 260                     ; 101   uint16_t tmpval = 0;
 262                     ; 102   uint8_t tmpccrh = 0;
 264  0027 0f07          	clr	(OFST-2,sp)
 266                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 268                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 270                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 272                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 274                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 276                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 278                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 280  0029 c65212        	ld	a,21010
 281  002c a4c0          	and	a,#192
 282  002e c75212        	ld	21010,a
 283                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 285  0031 c65212        	ld	a,21010
 286  0034 1a15          	or	a,(OFST+12,sp)
 287  0036 c75212        	ld	21010,a
 288                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 290  0039 72115210      	bres	21008,#0
 291                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 293  003d c6521c        	ld	a,21020
 294  0040 a430          	and	a,#48
 295  0042 c7521c        	ld	21020,a
 296                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 298  0045 725f521b      	clr	21019
 299                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 301  0049 96            	ldw	x,sp
 302  004a 1c000c        	addw	x,#OFST+3
 303  004d cd0000        	call	c_ltor
 305  0050 ae0000        	ldw	x,#L01
 306  0053 cd0000        	call	c_lcmp
 308  0056 2403          	jruge	L41
 309  0058 cc00e5        	jp	L511
 310  005b               L41:
 311                     ; 131     tmpccrh = I2C_CCRH_FS;
 313  005b a680          	ld	a,#128
 314  005d 6b07          	ld	(OFST-2,sp),a
 316                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 318  005f 0d12          	tnz	(OFST+9,sp)
 319  0061 2630          	jrne	L711
 320                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 322  0063 96            	ldw	x,sp
 323  0064 1c000c        	addw	x,#OFST+3
 324  0067 cd0000        	call	c_ltor
 326  006a a603          	ld	a,#3
 327  006c cd0000        	call	c_smul
 329  006f 96            	ldw	x,sp
 330  0070 1c0001        	addw	x,#OFST-8
 331  0073 cd0000        	call	c_rtol
 334  0076 7b15          	ld	a,(OFST+12,sp)
 335  0078 b703          	ld	c_lreg+3,a
 336  007a 3f02          	clr	c_lreg+2
 337  007c 3f01          	clr	c_lreg+1
 338  007e 3f00          	clr	c_lreg
 339  0080 ae0004        	ldw	x,#L21
 340  0083 cd0000        	call	c_lmul
 342  0086 96            	ldw	x,sp
 343  0087 1c0001        	addw	x,#OFST-8
 344  008a cd0000        	call	c_ludv
 346  008d be02          	ldw	x,c_lreg+2
 347  008f 1f08          	ldw	(OFST-1,sp),x
 350  0091 2034          	jra	L121
 351  0093               L711:
 352                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 354  0093 96            	ldw	x,sp
 355  0094 1c000c        	addw	x,#OFST+3
 356  0097 cd0000        	call	c_ltor
 358  009a a619          	ld	a,#25
 359  009c cd0000        	call	c_smul
 361  009f 96            	ldw	x,sp
 362  00a0 1c0001        	addw	x,#OFST-8
 363  00a3 cd0000        	call	c_rtol
 366  00a6 7b15          	ld	a,(OFST+12,sp)
 367  00a8 b703          	ld	c_lreg+3,a
 368  00aa 3f02          	clr	c_lreg+2
 369  00ac 3f01          	clr	c_lreg+1
 370  00ae 3f00          	clr	c_lreg
 371  00b0 ae0004        	ldw	x,#L21
 372  00b3 cd0000        	call	c_lmul
 374  00b6 96            	ldw	x,sp
 375  00b7 1c0001        	addw	x,#OFST-8
 376  00ba cd0000        	call	c_ludv
 378  00bd be02          	ldw	x,c_lreg+2
 379  00bf 1f08          	ldw	(OFST-1,sp),x
 381                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 383  00c1 7b07          	ld	a,(OFST-2,sp)
 384  00c3 aa40          	or	a,#64
 385  00c5 6b07          	ld	(OFST-2,sp),a
 387  00c7               L121:
 388                     ; 147     if (result < (uint16_t)0x01)
 390  00c7 1e08          	ldw	x,(OFST-1,sp)
 391  00c9 2605          	jrne	L321
 392                     ; 150       result = (uint16_t)0x0001;
 394  00cb ae0001        	ldw	x,#1
 395  00ce 1f08          	ldw	(OFST-1,sp),x
 397  00d0               L321:
 398                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 400  00d0 7b15          	ld	a,(OFST+12,sp)
 401  00d2 97            	ld	xl,a
 402  00d3 a603          	ld	a,#3
 403  00d5 42            	mul	x,a
 404  00d6 a60a          	ld	a,#10
 405  00d8 cd0000        	call	c_sdivx
 407  00db 5c            	incw	x
 408  00dc 1f05          	ldw	(OFST-4,sp),x
 410                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 412  00de 7b06          	ld	a,(OFST-3,sp)
 413  00e0 c7521d        	ld	21021,a
 415  00e3 2043          	jra	L521
 416  00e5               L511:
 417                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 419  00e5 96            	ldw	x,sp
 420  00e6 1c000c        	addw	x,#OFST+3
 421  00e9 cd0000        	call	c_ltor
 423  00ec 3803          	sll	c_lreg+3
 424  00ee 3902          	rlc	c_lreg+2
 425  00f0 3901          	rlc	c_lreg+1
 426  00f2 3900          	rlc	c_lreg
 427  00f4 96            	ldw	x,sp
 428  00f5 1c0001        	addw	x,#OFST-8
 429  00f8 cd0000        	call	c_rtol
 432  00fb 7b15          	ld	a,(OFST+12,sp)
 433  00fd b703          	ld	c_lreg+3,a
 434  00ff 3f02          	clr	c_lreg+2
 435  0101 3f01          	clr	c_lreg+1
 436  0103 3f00          	clr	c_lreg
 437  0105 ae0004        	ldw	x,#L21
 438  0108 cd0000        	call	c_lmul
 440  010b 96            	ldw	x,sp
 441  010c 1c0001        	addw	x,#OFST-8
 442  010f cd0000        	call	c_ludv
 444  0112 be02          	ldw	x,c_lreg+2
 445  0114 1f08          	ldw	(OFST-1,sp),x
 447                     ; 167     if (result < (uint16_t)0x0004)
 449  0116 1e08          	ldw	x,(OFST-1,sp)
 450  0118 a30004        	cpw	x,#4
 451  011b 2405          	jruge	L721
 452                     ; 170       result = (uint16_t)0x0004;
 454  011d ae0004        	ldw	x,#4
 455  0120 1f08          	ldw	(OFST-1,sp),x
 457  0122               L721:
 458                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 460  0122 7b15          	ld	a,(OFST+12,sp)
 461  0124 4c            	inc	a
 462  0125 c7521d        	ld	21021,a
 463  0128               L521:
 464                     ; 181   I2C->CCRL = (uint8_t)result;
 466  0128 7b09          	ld	a,(OFST+0,sp)
 467  012a c7521b        	ld	21019,a
 468                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 470  012d 7b08          	ld	a,(OFST-1,sp)
 471  012f a40f          	and	a,#15
 472  0131 1a07          	or	a,(OFST-2,sp)
 473  0133 c7521c        	ld	21020,a
 474                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 476  0136 72105210      	bset	21008,#0
 477                     ; 188   I2C_AcknowledgeConfig(Ack);
 479  013a 7b13          	ld	a,(OFST+10,sp)
 480  013c ad71          	call	_I2C_AcknowledgeConfig
 482                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 484  013e 7b11          	ld	a,(OFST+8,sp)
 485  0140 c75213        	ld	21011,a
 486                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 486                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 488  0143 1e10          	ldw	x,(OFST+7,sp)
 489  0145 4f            	clr	a
 490  0146 01            	rrwa	x,a
 491  0147 48            	sll	a
 492  0148 59            	rlcw	x
 493  0149 01            	rrwa	x,a
 494  014a a406          	and	a,#6
 495  014c 5f            	clrw	x
 496  014d 6b04          	ld	(OFST-5,sp),a
 498  014f 7b14          	ld	a,(OFST+11,sp)
 499  0151 aa40          	or	a,#64
 500  0153 1a04          	or	a,(OFST-5,sp)
 501  0155 c75214        	ld	21012,a
 502                     ; 194 }
 505  0158 5b09          	addw	sp,#9
 506  015a 81            	ret
 561                     ; 202 void I2C_Cmd(FunctionalState NewState)
 561                     ; 203 {
 562                     	switch	.text
 563  015b               _I2C_Cmd:
 567                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 569                     ; 207   if (NewState != DISABLE)
 571  015b 4d            	tnz	a
 572  015c 2706          	jreq	L751
 573                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 575  015e 72105210      	bset	21008,#0
 577  0162 2004          	jra	L161
 578  0164               L751:
 579                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 581  0164 72115210      	bres	21008,#0
 582  0168               L161:
 583                     ; 217 }
 586  0168 81            	ret
 621                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 621                     ; 226 {
 622                     	switch	.text
 623  0169               _I2C_GeneralCallCmd:
 627                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 629                     ; 230   if (NewState != DISABLE)
 631  0169 4d            	tnz	a
 632  016a 2706          	jreq	L102
 633                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 635  016c 721c5210      	bset	21008,#6
 637  0170 2004          	jra	L302
 638  0172               L102:
 639                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 641  0172 721d5210      	bres	21008,#6
 642  0176               L302:
 643                     ; 240 }
 646  0176 81            	ret
 681                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 681                     ; 251 {
 682                     	switch	.text
 683  0177               _I2C_GenerateSTART:
 687                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 689                     ; 255   if (NewState != DISABLE)
 691  0177 4d            	tnz	a
 692  0178 2706          	jreq	L322
 693                     ; 258     I2C->CR2 |= I2C_CR2_START;
 695  017a 72105211      	bset	21009,#0
 697  017e 2004          	jra	L522
 698  0180               L322:
 699                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 701  0180 72115211      	bres	21009,#0
 702  0184               L522:
 703                     ; 265 }
 706  0184 81            	ret
 741                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 741                     ; 274 {
 742                     	switch	.text
 743  0185               _I2C_GenerateSTOP:
 747                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 749                     ; 278   if (NewState != DISABLE)
 751  0185 4d            	tnz	a
 752  0186 2706          	jreq	L542
 753                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 755  0188 72125211      	bset	21009,#1
 757  018c 2004          	jra	L742
 758  018e               L542:
 759                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 761  018e 72135211      	bres	21009,#1
 762  0192               L742:
 763                     ; 288 }
 766  0192 81            	ret
 802                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 802                     ; 297 {
 803                     	switch	.text
 804  0193               _I2C_SoftwareResetCmd:
 808                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 810                     ; 301   if (NewState != DISABLE)
 812  0193 4d            	tnz	a
 813  0194 2706          	jreq	L762
 814                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 816  0196 721e5211      	bset	21009,#7
 818  019a 2004          	jra	L172
 819  019c               L762:
 820                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 822  019c 721f5211      	bres	21009,#7
 823  01a0               L172:
 824                     ; 311 }
 827  01a0 81            	ret
 863                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 863                     ; 321 {
 864                     	switch	.text
 865  01a1               _I2C_StretchClockCmd:
 869                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 871                     ; 325   if (NewState != DISABLE)
 873  01a1 4d            	tnz	a
 874  01a2 2706          	jreq	L113
 875                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 877  01a4 721f5210      	bres	21008,#7
 879  01a8 2004          	jra	L313
 880  01aa               L113:
 881                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 883  01aa 721e5210      	bset	21008,#7
 884  01ae               L313:
 885                     ; 336 }
 888  01ae 81            	ret
 924                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 924                     ; 346 {
 925                     	switch	.text
 926  01af               _I2C_AcknowledgeConfig:
 928  01af 88            	push	a
 929       00000000      OFST:	set	0
 932                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 934                     ; 350   if (Ack == I2C_ACK_NONE)
 936  01b0 4d            	tnz	a
 937  01b1 2606          	jrne	L333
 938                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 940  01b3 72155211      	bres	21009,#2
 942  01b7 2014          	jra	L533
 943  01b9               L333:
 944                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 946  01b9 72145211      	bset	21009,#2
 947                     ; 360     if (Ack == I2C_ACK_CURR)
 949  01bd 7b01          	ld	a,(OFST+1,sp)
 950  01bf a101          	cp	a,#1
 951  01c1 2606          	jrne	L733
 952                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 954  01c3 72175211      	bres	21009,#3
 956  01c7 2004          	jra	L533
 957  01c9               L733:
 958                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 960  01c9 72165211      	bset	21009,#3
 961  01cd               L533:
 962                     ; 371 }
 965  01cd 84            	pop	a
 966  01ce 81            	ret
1038                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1038                     ; 382 {
1039                     	switch	.text
1040  01cf               _I2C_ITConfig:
1042  01cf 89            	pushw	x
1043       00000000      OFST:	set	0
1046                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1048                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1050                     ; 387   if (NewState != DISABLE)
1052  01d0 9f            	ld	a,xl
1053  01d1 4d            	tnz	a
1054  01d2 2709          	jreq	L773
1055                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1057  01d4 9e            	ld	a,xh
1058  01d5 ca521a        	or	a,21018
1059  01d8 c7521a        	ld	21018,a
1061  01db 2009          	jra	L104
1062  01dd               L773:
1063                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1065  01dd 7b01          	ld	a,(OFST+1,sp)
1066  01df 43            	cpl	a
1067  01e0 c4521a        	and	a,21018
1068  01e3 c7521a        	ld	21018,a
1069  01e6               L104:
1070                     ; 397 }
1073  01e6 85            	popw	x
1074  01e7 81            	ret
1110                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1110                     ; 406 {
1111                     	switch	.text
1112  01e8               _I2C_FastModeDutyCycleConfig:
1116                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1118                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1120  01e8 a140          	cp	a,#64
1121  01ea 2606          	jrne	L124
1122                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1124  01ec 721c521c      	bset	21020,#6
1126  01f0 2004          	jra	L324
1127  01f2               L124:
1128                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1130  01f2 721d521c      	bres	21020,#6
1131  01f6               L324:
1132                     ; 420 }
1135  01f6 81            	ret
1158                     ; 427 uint8_t I2C_ReceiveData(void)
1158                     ; 428 {
1159                     	switch	.text
1160  01f7               _I2C_ReceiveData:
1164                     ; 430   return ((uint8_t)I2C->DR);
1166  01f7 c65216        	ld	a,21014
1169  01fa 81            	ret
1232                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1232                     ; 441 {
1233                     	switch	.text
1234  01fb               _I2C_Send7bitAddress:
1236  01fb 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1242                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1244                     ; 447   Address &= (uint8_t)0xFE;
1246  01fc 7b01          	ld	a,(OFST+1,sp)
1247  01fe a4fe          	and	a,#254
1248  0200 6b01          	ld	(OFST+1,sp),a
1249                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1251  0202 7b01          	ld	a,(OFST+1,sp)
1252  0204 1a02          	or	a,(OFST+2,sp)
1253  0206 c75216        	ld	21014,a
1254                     ; 451 }
1257  0209 85            	popw	x
1258  020a 81            	ret
1290                     ; 458 void I2C_SendData(uint8_t Data)
1290                     ; 459 {
1291                     	switch	.text
1292  020b               _I2C_SendData:
1296                     ; 461   I2C->DR = Data;
1298  020b c75216        	ld	21014,a
1299                     ; 462 }
1302  020e 81            	ret
1522                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1522                     ; 579 {
1523                     	switch	.text
1524  020f               _I2C_CheckEvent:
1526  020f 89            	pushw	x
1527  0210 5206          	subw	sp,#6
1528       00000006      OFST:	set	6
1531                     ; 580   __IO uint16_t lastevent = 0x00;
1533  0212 5f            	clrw	x
1534  0213 1f04          	ldw	(OFST-2,sp),x
1536                     ; 581   uint8_t flag1 = 0x00 ;
1538                     ; 582   uint8_t flag2 = 0x00;
1540                     ; 583   ErrorStatus status = ERROR;
1542                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1544                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1546  0215 1e07          	ldw	x,(OFST+1,sp)
1547  0217 a30004        	cpw	x,#4
1548  021a 260b          	jrne	L506
1549                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1551  021c c65218        	ld	a,21016
1552  021f a404          	and	a,#4
1553  0221 5f            	clrw	x
1554  0222 97            	ld	xl,a
1555  0223 1f04          	ldw	(OFST-2,sp),x
1558  0225 201f          	jra	L706
1559  0227               L506:
1560                     ; 594     flag1 = I2C->SR1;
1562  0227 c65217        	ld	a,21015
1563  022a 6b03          	ld	(OFST-3,sp),a
1565                     ; 595     flag2 = I2C->SR3;
1567  022c c65219        	ld	a,21017
1568  022f 6b06          	ld	(OFST+0,sp),a
1570                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1572  0231 7b03          	ld	a,(OFST-3,sp)
1573  0233 5f            	clrw	x
1574  0234 97            	ld	xl,a
1575  0235 1f01          	ldw	(OFST-5,sp),x
1577  0237 7b06          	ld	a,(OFST+0,sp)
1578  0239 5f            	clrw	x
1579  023a 97            	ld	xl,a
1580  023b 4f            	clr	a
1581  023c 02            	rlwa	x,a
1582  023d 01            	rrwa	x,a
1583  023e 1a02          	or	a,(OFST-4,sp)
1584  0240 01            	rrwa	x,a
1585  0241 1a01          	or	a,(OFST-5,sp)
1586  0243 01            	rrwa	x,a
1587  0244 1f04          	ldw	(OFST-2,sp),x
1589  0246               L706:
1590                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1592  0246 1e04          	ldw	x,(OFST-2,sp)
1593  0248 01            	rrwa	x,a
1594  0249 1408          	and	a,(OFST+2,sp)
1595  024b 01            	rrwa	x,a
1596  024c 1407          	and	a,(OFST+1,sp)
1597  024e 01            	rrwa	x,a
1598  024f 1307          	cpw	x,(OFST+1,sp)
1599  0251 2606          	jrne	L116
1600                     ; 602     status = SUCCESS;
1602  0253 a601          	ld	a,#1
1603  0255 6b06          	ld	(OFST+0,sp),a
1606  0257 2002          	jra	L316
1607  0259               L116:
1608                     ; 607     status = ERROR;
1610  0259 0f06          	clr	(OFST+0,sp)
1612  025b               L316:
1613                     ; 611   return status;
1615  025b 7b06          	ld	a,(OFST+0,sp)
1618  025d 5b08          	addw	sp,#8
1619  025f 81            	ret
1668                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1668                     ; 629 {
1669                     	switch	.text
1670  0260               _I2C_GetLastEvent:
1672  0260 5206          	subw	sp,#6
1673       00000006      OFST:	set	6
1676                     ; 630   __IO uint16_t lastevent = 0;
1678  0262 5f            	clrw	x
1679  0263 1f05          	ldw	(OFST-1,sp),x
1681                     ; 631   uint16_t flag1 = 0;
1683                     ; 632   uint16_t flag2 = 0;
1685                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1687  0265 c65218        	ld	a,21016
1688  0268 a504          	bcp	a,#4
1689  026a 2707          	jreq	L736
1690                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1692  026c ae0004        	ldw	x,#4
1693  026f 1f05          	ldw	(OFST-1,sp),x
1696  0271 201b          	jra	L146
1697  0273               L736:
1698                     ; 641     flag1 = I2C->SR1;
1700  0273 c65217        	ld	a,21015
1701  0276 5f            	clrw	x
1702  0277 97            	ld	xl,a
1703  0278 1f01          	ldw	(OFST-5,sp),x
1705                     ; 642     flag2 = I2C->SR3;
1707  027a c65219        	ld	a,21017
1708  027d 5f            	clrw	x
1709  027e 97            	ld	xl,a
1710  027f 1f03          	ldw	(OFST-3,sp),x
1712                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1714  0281 1e03          	ldw	x,(OFST-3,sp)
1715  0283 4f            	clr	a
1716  0284 02            	rlwa	x,a
1717  0285 01            	rrwa	x,a
1718  0286 1a02          	or	a,(OFST-4,sp)
1719  0288 01            	rrwa	x,a
1720  0289 1a01          	or	a,(OFST-5,sp)
1721  028b 01            	rrwa	x,a
1722  028c 1f05          	ldw	(OFST-1,sp),x
1724  028e               L146:
1725                     ; 648   return (I2C_Event_TypeDef)lastevent;
1727  028e 1e05          	ldw	x,(OFST-1,sp)
1730  0290 5b06          	addw	sp,#6
1731  0292 81            	ret
1942                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1942                     ; 680 {
1943                     	switch	.text
1944  0293               _I2C_GetFlagStatus:
1946  0293 89            	pushw	x
1947  0294 89            	pushw	x
1948       00000002      OFST:	set	2
1951                     ; 681   uint8_t tempreg = 0;
1953  0295 0f02          	clr	(OFST+0,sp)
1955                     ; 682   uint8_t regindex = 0;
1957                     ; 683   FlagStatus bitstatus = RESET;
1959                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1961                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1963  0297 9e            	ld	a,xh
1964  0298 6b01          	ld	(OFST-1,sp),a
1966                     ; 691   switch (regindex)
1968  029a 7b01          	ld	a,(OFST-1,sp)
1970                     ; 708     default:
1970                     ; 709       break;
1971  029c 4a            	dec	a
1972  029d 2708          	jreq	L346
1973  029f 4a            	dec	a
1974  02a0 270c          	jreq	L546
1975  02a2 4a            	dec	a
1976  02a3 2710          	jreq	L746
1977  02a5 2013          	jra	L757
1978  02a7               L346:
1979                     ; 694     case 0x01:
1979                     ; 695       tempreg = (uint8_t)I2C->SR1;
1981  02a7 c65217        	ld	a,21015
1982  02aa 6b02          	ld	(OFST+0,sp),a
1984                     ; 696       break;
1986  02ac 200c          	jra	L757
1987  02ae               L546:
1988                     ; 699     case 0x02:
1988                     ; 700       tempreg = (uint8_t)I2C->SR2;
1990  02ae c65218        	ld	a,21016
1991  02b1 6b02          	ld	(OFST+0,sp),a
1993                     ; 701       break;
1995  02b3 2005          	jra	L757
1996  02b5               L746:
1997                     ; 704     case 0x03:
1997                     ; 705       tempreg = (uint8_t)I2C->SR3;
1999  02b5 c65219        	ld	a,21017
2000  02b8 6b02          	ld	(OFST+0,sp),a
2002                     ; 706       break;
2004  02ba               L156:
2005                     ; 708     default:
2005                     ; 709       break;
2007  02ba               L757:
2008                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2010  02ba 7b04          	ld	a,(OFST+2,sp)
2011  02bc 1502          	bcp	a,(OFST+0,sp)
2012  02be 2706          	jreq	L167
2013                     ; 716     bitstatus = SET;
2015  02c0 a601          	ld	a,#1
2016  02c2 6b02          	ld	(OFST+0,sp),a
2019  02c4 2002          	jra	L367
2020  02c6               L167:
2021                     ; 721     bitstatus = RESET;
2023  02c6 0f02          	clr	(OFST+0,sp)
2025  02c8               L367:
2026                     ; 724   return bitstatus;
2028  02c8 7b02          	ld	a,(OFST+0,sp)
2031  02ca 5b04          	addw	sp,#4
2032  02cc 81            	ret
2074                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2074                     ; 760 {
2075                     	switch	.text
2076  02cd               _I2C_ClearFlag:
2078  02cd 89            	pushw	x
2079       00000002      OFST:	set	2
2082                     ; 761   uint16_t flagpos = 0;
2084                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2086                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2088  02ce 01            	rrwa	x,a
2089  02cf a4ff          	and	a,#255
2090  02d1 5f            	clrw	x
2091  02d2 02            	rlwa	x,a
2092  02d3 1f01          	ldw	(OFST-1,sp),x
2093  02d5 01            	rrwa	x,a
2095                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2097  02d6 7b02          	ld	a,(OFST+0,sp)
2098  02d8 43            	cpl	a
2099  02d9 c75218        	ld	21016,a
2100                     ; 769 }
2103  02dc 85            	popw	x
2104  02dd 81            	ret
2268                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2268                     ; 792 {
2269                     	switch	.text
2270  02de               _I2C_GetITStatus:
2272  02de 89            	pushw	x
2273  02df 5204          	subw	sp,#4
2274       00000004      OFST:	set	4
2277                     ; 793   ITStatus bitstatus = RESET;
2279                     ; 794   __IO uint8_t enablestatus = 0;
2281  02e1 0f03          	clr	(OFST-1,sp)
2283                     ; 795   uint16_t tempregister = 0;
2285                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2287                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2289  02e3 9e            	ld	a,xh
2290  02e4 a407          	and	a,#7
2291  02e6 5f            	clrw	x
2292  02e7 97            	ld	xl,a
2293  02e8 1f01          	ldw	(OFST-3,sp),x
2295                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2297  02ea c6521a        	ld	a,21018
2298  02ed 1402          	and	a,(OFST-2,sp)
2299  02ef 6b03          	ld	(OFST-1,sp),a
2301                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2303  02f1 7b05          	ld	a,(OFST+1,sp)
2304  02f3 97            	ld	xl,a
2305  02f4 7b06          	ld	a,(OFST+2,sp)
2306  02f6 9f            	ld	a,xl
2307  02f7 a430          	and	a,#48
2308  02f9 97            	ld	xl,a
2309  02fa 4f            	clr	a
2310  02fb 02            	rlwa	x,a
2311  02fc a30100        	cpw	x,#256
2312  02ff 2615          	jrne	L1701
2313                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2315  0301 c65217        	ld	a,21015
2316  0304 1506          	bcp	a,(OFST+2,sp)
2317  0306 270a          	jreq	L3701
2319  0308 0d03          	tnz	(OFST-1,sp)
2320  030a 2706          	jreq	L3701
2321                     ; 811       bitstatus = SET;
2323  030c a601          	ld	a,#1
2324  030e 6b04          	ld	(OFST+0,sp),a
2327  0310 2017          	jra	L7701
2328  0312               L3701:
2329                     ; 816       bitstatus = RESET;
2331  0312 0f04          	clr	(OFST+0,sp)
2333  0314 2013          	jra	L7701
2334  0316               L1701:
2335                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2337  0316 c65218        	ld	a,21016
2338  0319 1506          	bcp	a,(OFST+2,sp)
2339  031b 270a          	jreq	L1011
2341  031d 0d03          	tnz	(OFST-1,sp)
2342  031f 2706          	jreq	L1011
2343                     ; 825       bitstatus = SET;
2345  0321 a601          	ld	a,#1
2346  0323 6b04          	ld	(OFST+0,sp),a
2349  0325 2002          	jra	L7701
2350  0327               L1011:
2351                     ; 830       bitstatus = RESET;
2353  0327 0f04          	clr	(OFST+0,sp)
2355  0329               L7701:
2356                     ; 834   return  bitstatus;
2358  0329 7b04          	ld	a,(OFST+0,sp)
2361  032b 5b06          	addw	sp,#6
2362  032d 81            	ret
2405                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2405                     ; 872 {
2406                     	switch	.text
2407  032e               _I2C_ClearITPendingBit:
2409  032e 89            	pushw	x
2410       00000002      OFST:	set	2
2413                     ; 873   uint16_t flagpos = 0;
2415                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2417                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2419  032f 01            	rrwa	x,a
2420  0330 a4ff          	and	a,#255
2421  0332 5f            	clrw	x
2422  0333 02            	rlwa	x,a
2423  0334 1f01          	ldw	(OFST-1,sp),x
2424  0336 01            	rrwa	x,a
2426                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2428  0337 7b02          	ld	a,(OFST+0,sp)
2429  0339 43            	cpl	a
2430  033a c75218        	ld	21016,a
2431                     ; 883 }
2434  033d 85            	popw	x
2435  033e 81            	ret
2448                     	xdef	_I2C_ClearITPendingBit
2449                     	xdef	_I2C_GetITStatus
2450                     	xdef	_I2C_ClearFlag
2451                     	xdef	_I2C_GetFlagStatus
2452                     	xdef	_I2C_GetLastEvent
2453                     	xdef	_I2C_CheckEvent
2454                     	xdef	_I2C_SendData
2455                     	xdef	_I2C_Send7bitAddress
2456                     	xdef	_I2C_ReceiveData
2457                     	xdef	_I2C_ITConfig
2458                     	xdef	_I2C_FastModeDutyCycleConfig
2459                     	xdef	_I2C_AcknowledgeConfig
2460                     	xdef	_I2C_StretchClockCmd
2461                     	xdef	_I2C_SoftwareResetCmd
2462                     	xdef	_I2C_GenerateSTOP
2463                     	xdef	_I2C_GenerateSTART
2464                     	xdef	_I2C_GeneralCallCmd
2465                     	xdef	_I2C_Cmd
2466                     	xdef	_I2C_Init
2467                     	xdef	_I2C_DeInit
2468                     	xref.b	c_lreg
2469                     	xref.b	c_x
2488                     	xref	c_sdivx
2489                     	xref	c_ludv
2490                     	xref	c_rtol
2491                     	xref	c_smul
2492                     	xref	c_lmul
2493                     	xref	c_lcmp
2494                     	xref	c_ltor
2495                     	end
