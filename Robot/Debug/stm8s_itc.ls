   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 50 uint8_t ITC_GetCPUCC(void)
  41                     ; 51 {
  43                     	switch	.text
  44  0000               _ITC_GetCPUCC:
  48                     ; 53   _asm("push cc");
  51  0000 8a            push cc
  53                     ; 54   _asm("pop a");
  56  0001 84            pop a
  58                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  61  0002 81            	ret
  84                     ; 80 void ITC_DeInit(void)
  84                     ; 81 {
  85                     	switch	.text
  86  0003               _ITC_DeInit:
  90                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  92  0003 35ff7f70      	mov	32624,#255
  93                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  95  0007 35ff7f71      	mov	32625,#255
  96                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  98  000b 35ff7f72      	mov	32626,#255
  99                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 101  000f 35ff7f73      	mov	32627,#255
 102                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 104  0013 35ff7f74      	mov	32628,#255
 105                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 107  0017 35ff7f75      	mov	32629,#255
 108                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 110  001b 35ff7f76      	mov	32630,#255
 111                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 113  001f 35ff7f77      	mov	32631,#255
 114                     ; 90 }
 117  0023 81            	ret
 142                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 142                     ; 98 {
 143                     	switch	.text
 144  0024               _ITC_GetSoftIntStatus:
 148                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 150  0024 adda          	call	_ITC_GetCPUCC
 152  0026 a428          	and	a,#40
 155  0028 81            	ret
 428                     .const:	section	.text
 429  0000               L22:
 430  0000 004c          	dc.w	L14
 431  0002 004c          	dc.w	L14
 432  0004 004c          	dc.w	L14
 433  0006 004c          	dc.w	L14
 434  0008 0055          	dc.w	L34
 435  000a 0055          	dc.w	L34
 436  000c 0055          	dc.w	L34
 437  000e 0055          	dc.w	L34
 438  0010 005e          	dc.w	L54
 439  0012 005e          	dc.w	L54
 440  0014 005e          	dc.w	L54
 441  0016 005e          	dc.w	L54
 442  0018 0067          	dc.w	L74
 443  001a 0067          	dc.w	L74
 444  001c 0067          	dc.w	L74
 445  001e 0067          	dc.w	L74
 446  0020 0070          	dc.w	L15
 447  0022 0070          	dc.w	L15
 448  0024 0070          	dc.w	L15
 449  0026 0070          	dc.w	L15
 450  0028 0079          	dc.w	L35
 451  002a 0079          	dc.w	L35
 452  002c 0079          	dc.w	L35
 453  002e 0079          	dc.w	L35
 454  0030 0082          	dc.w	L55
 455                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 455                     ; 108 {
 456                     	switch	.text
 457  0029               _ITC_GetSoftwarePriority:
 459  0029 88            	push	a
 460  002a 89            	pushw	x
 461       00000002      OFST:	set	2
 464                     ; 109   uint8_t Value = 0;
 466  002b 0f02          	clr	(OFST+0,sp)
 468                     ; 110   uint8_t Mask = 0;
 470                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 472                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 474  002d a403          	and	a,#3
 475  002f 48            	sll	a
 476  0030 5f            	clrw	x
 477  0031 97            	ld	xl,a
 478  0032 a603          	ld	a,#3
 479  0034 5d            	tnzw	x
 480  0035 2704          	jreq	L41
 481  0037               L61:
 482  0037 48            	sll	a
 483  0038 5a            	decw	x
 484  0039 26fc          	jrne	L61
 485  003b               L41:
 486  003b 6b01          	ld	(OFST-1,sp),a
 488                     ; 118   switch (IrqNum)
 490  003d 7b03          	ld	a,(OFST+1,sp)
 492                     ; 198   default:
 492                     ; 199     break;
 493  003f a119          	cp	a,#25
 494  0041 2407          	jruge	L02
 495  0043 5f            	clrw	x
 496  0044 97            	ld	xl,a
 497  0045 58            	sllw	x
 498  0046 de0000        	ldw	x,(L22,x)
 499  0049 fc            	jp	(x)
 500  004a               L02:
 501  004a 203d          	jra	L702
 502  004c               L14:
 503                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 503                     ; 121   case ITC_IRQ_AWU:
 503                     ; 122   case ITC_IRQ_CLK:
 503                     ; 123   case ITC_IRQ_PORTA:
 503                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 505  004c c67f70        	ld	a,32624
 506  004f 1401          	and	a,(OFST-1,sp)
 507  0051 6b02          	ld	(OFST+0,sp),a
 509                     ; 125     break;
 511  0053 2034          	jra	L702
 512  0055               L34:
 513                     ; 127   case ITC_IRQ_PORTB:
 513                     ; 128   case ITC_IRQ_PORTC:
 513                     ; 129   case ITC_IRQ_PORTD:
 513                     ; 130   case ITC_IRQ_PORTE:
 513                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 515  0055 c67f71        	ld	a,32625
 516  0058 1401          	and	a,(OFST-1,sp)
 517  005a 6b02          	ld	(OFST+0,sp),a
 519                     ; 132     break;
 521  005c 202b          	jra	L702
 522  005e               L54:
 523                     ; 135   case ITC_IRQ_CAN_RX:
 523                     ; 136   case ITC_IRQ_CAN_TX:
 523                     ; 137 #endif /*STM8S208 or STM8AF52Ax */
 523                     ; 138 #if defined(STM8S903) || defined(STM8AF622x)
 523                     ; 139   case ITC_IRQ_PORTF:
 523                     ; 140 #endif /*STM8S903 or STM8AF622x */
 523                     ; 141   case ITC_IRQ_SPI:
 523                     ; 142   case ITC_IRQ_TIM1_OVF:
 523                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 525  005e c67f72        	ld	a,32626
 526  0061 1401          	and	a,(OFST-1,sp)
 527  0063 6b02          	ld	(OFST+0,sp),a
 529                     ; 144     break;
 531  0065 2022          	jra	L702
 532  0067               L74:
 533                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 533                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 533                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 533                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 533                     ; 150 #else
 533                     ; 151   case ITC_IRQ_TIM2_OVF:
 533                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 533                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 533                     ; 154   case ITC_IRQ_TIM3_OVF:
 533                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 535  0067 c67f73        	ld	a,32627
 536  006a 1401          	and	a,(OFST-1,sp)
 537  006c 6b02          	ld	(OFST+0,sp),a
 539                     ; 156     break;
 541  006e 2019          	jra	L702
 542  0070               L15:
 543                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 543                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 543                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 543                     ; 161   case ITC_IRQ_UART1_TX:
 543                     ; 162   case ITC_IRQ_UART1_RX:
 543                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 543                     ; 164 #if defined(STM8AF622x)
 543                     ; 165   case ITC_IRQ_UART4_TX:
 543                     ; 166   case ITC_IRQ_UART4_RX:
 543                     ; 167 #endif /*STM8AF622x */
 543                     ; 168   case ITC_IRQ_I2C:
 543                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 545  0070 c67f74        	ld	a,32628
 546  0073 1401          	and	a,(OFST-1,sp)
 547  0075 6b02          	ld	(OFST+0,sp),a
 549                     ; 170     break;
 551  0077 2010          	jra	L702
 552  0079               L35:
 553                     ; 178   case ITC_IRQ_UART3_TX:
 553                     ; 179   case ITC_IRQ_UART3_RX:
 553                     ; 180   case ITC_IRQ_ADC2:
 553                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 553                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 553                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 553                     ; 184   case ITC_IRQ_ADC1:
 553                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 553                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 553                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 553                     ; 188 #else
 553                     ; 189   case ITC_IRQ_TIM4_OVF:
 553                     ; 190 #endif /*STM8S903 or STM8AF622x */
 553                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 555  0079 c67f75        	ld	a,32629
 556  007c 1401          	and	a,(OFST-1,sp)
 557  007e 6b02          	ld	(OFST+0,sp),a
 559                     ; 192     break;
 561  0080 2007          	jra	L702
 562  0082               L55:
 563                     ; 194   case ITC_IRQ_EEPROM_EEC:
 563                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 565  0082 c67f76        	ld	a,32630
 566  0085 1401          	and	a,(OFST-1,sp)
 567  0087 6b02          	ld	(OFST+0,sp),a
 569                     ; 196     break;
 571  0089               L75:
 572                     ; 198   default:
 572                     ; 199     break;
 574  0089               L702:
 575                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 577  0089 7b03          	ld	a,(OFST+1,sp)
 578  008b a403          	and	a,#3
 579  008d 48            	sll	a
 580  008e 5f            	clrw	x
 581  008f 97            	ld	xl,a
 582  0090 7b02          	ld	a,(OFST+0,sp)
 583  0092 5d            	tnzw	x
 584  0093 2704          	jreq	L42
 585  0095               L62:
 586  0095 44            	srl	a
 587  0096 5a            	decw	x
 588  0097 26fc          	jrne	L62
 589  0099               L42:
 590  0099 6b02          	ld	(OFST+0,sp),a
 592                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 594  009b 7b02          	ld	a,(OFST+0,sp)
 597  009d 5b03          	addw	sp,#3
 598  009f 81            	ret
 658                     	switch	.const
 659  0032               L44:
 660  0032 00d5          	dc.w	L112
 661  0034 00d5          	dc.w	L112
 662  0036 00d5          	dc.w	L112
 663  0038 00d5          	dc.w	L112
 664  003a 00e7          	dc.w	L312
 665  003c 00e7          	dc.w	L312
 666  003e 00e7          	dc.w	L312
 667  0040 00e7          	dc.w	L312
 668  0042 00f9          	dc.w	L512
 669  0044 00f9          	dc.w	L512
 670  0046 00f9          	dc.w	L512
 671  0048 00f9          	dc.w	L512
 672  004a 010b          	dc.w	L712
 673  004c 010b          	dc.w	L712
 674  004e 010b          	dc.w	L712
 675  0050 010b          	dc.w	L712
 676  0052 011d          	dc.w	L122
 677  0054 011d          	dc.w	L122
 678  0056 011d          	dc.w	L122
 679  0058 011d          	dc.w	L122
 680  005a 012f          	dc.w	L322
 681  005c 012f          	dc.w	L322
 682  005e 012f          	dc.w	L322
 683  0060 012f          	dc.w	L322
 684  0062 0141          	dc.w	L522
 685                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 685                     ; 221 {
 686                     	switch	.text
 687  00a0               _ITC_SetSoftwarePriority:
 689  00a0 89            	pushw	x
 690  00a1 89            	pushw	x
 691       00000002      OFST:	set	2
 694                     ; 222   uint8_t Mask = 0;
 696                     ; 223   uint8_t NewPriority = 0;
 698                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 700                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 702                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 704                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 706  00a2 9e            	ld	a,xh
 707  00a3 a403          	and	a,#3
 708  00a5 48            	sll	a
 709  00a6 5f            	clrw	x
 710  00a7 97            	ld	xl,a
 711  00a8 a603          	ld	a,#3
 712  00aa 5d            	tnzw	x
 713  00ab 2704          	jreq	L23
 714  00ad               L43:
 715  00ad 48            	sll	a
 716  00ae 5a            	decw	x
 717  00af 26fc          	jrne	L43
 718  00b1               L23:
 719  00b1 43            	cpl	a
 720  00b2 6b01          	ld	(OFST-1,sp),a
 722                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 724  00b4 7b03          	ld	a,(OFST+1,sp)
 725  00b6 a403          	and	a,#3
 726  00b8 48            	sll	a
 727  00b9 5f            	clrw	x
 728  00ba 97            	ld	xl,a
 729  00bb 7b04          	ld	a,(OFST+2,sp)
 730  00bd 5d            	tnzw	x
 731  00be 2704          	jreq	L63
 732  00c0               L04:
 733  00c0 48            	sll	a
 734  00c1 5a            	decw	x
 735  00c2 26fc          	jrne	L04
 736  00c4               L63:
 737  00c4 6b02          	ld	(OFST+0,sp),a
 739                     ; 239   switch (IrqNum)
 741  00c6 7b03          	ld	a,(OFST+1,sp)
 743                     ; 329   default:
 743                     ; 330     break;
 744  00c8 a119          	cp	a,#25
 745  00ca 2407          	jruge	L24
 746  00cc 5f            	clrw	x
 747  00cd 97            	ld	xl,a
 748  00ce 58            	sllw	x
 749  00cf de0032        	ldw	x,(L44,x)
 750  00d2 fc            	jp	(x)
 751  00d3               L24:
 752  00d3 207c          	jra	L162
 753  00d5               L112:
 754                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 754                     ; 242   case ITC_IRQ_AWU:
 754                     ; 243   case ITC_IRQ_CLK:
 754                     ; 244   case ITC_IRQ_PORTA:
 754                     ; 245     ITC->ISPR1 &= Mask;
 756  00d5 c67f70        	ld	a,32624
 757  00d8 1401          	and	a,(OFST-1,sp)
 758  00da c77f70        	ld	32624,a
 759                     ; 246     ITC->ISPR1 |= NewPriority;
 761  00dd c67f70        	ld	a,32624
 762  00e0 1a02          	or	a,(OFST+0,sp)
 763  00e2 c77f70        	ld	32624,a
 764                     ; 247     break;
 766  00e5 206a          	jra	L162
 767  00e7               L312:
 768                     ; 249   case ITC_IRQ_PORTB:
 768                     ; 250   case ITC_IRQ_PORTC:
 768                     ; 251   case ITC_IRQ_PORTD:
 768                     ; 252   case ITC_IRQ_PORTE:
 768                     ; 253     ITC->ISPR2 &= Mask;
 770  00e7 c67f71        	ld	a,32625
 771  00ea 1401          	and	a,(OFST-1,sp)
 772  00ec c77f71        	ld	32625,a
 773                     ; 254     ITC->ISPR2 |= NewPriority;
 775  00ef c67f71        	ld	a,32625
 776  00f2 1a02          	or	a,(OFST+0,sp)
 777  00f4 c77f71        	ld	32625,a
 778                     ; 255     break;
 780  00f7 2058          	jra	L162
 781  00f9               L512:
 782                     ; 258   case ITC_IRQ_CAN_RX:
 782                     ; 259   case ITC_IRQ_CAN_TX:
 782                     ; 260 #endif /*STM8S208 or STM8AF52Ax */
 782                     ; 261 #if defined(STM8S903) || defined(STM8AF622x)
 782                     ; 262   case ITC_IRQ_PORTF:
 782                     ; 263 #endif /*STM8S903 or STM8AF622x */
 782                     ; 264   case ITC_IRQ_SPI:
 782                     ; 265   case ITC_IRQ_TIM1_OVF:
 782                     ; 266     ITC->ISPR3 &= Mask;
 784  00f9 c67f72        	ld	a,32626
 785  00fc 1401          	and	a,(OFST-1,sp)
 786  00fe c77f72        	ld	32626,a
 787                     ; 267     ITC->ISPR3 |= NewPriority;
 789  0101 c67f72        	ld	a,32626
 790  0104 1a02          	or	a,(OFST+0,sp)
 791  0106 c77f72        	ld	32626,a
 792                     ; 268     break;
 794  0109 2046          	jra	L162
 795  010b               L712:
 796                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 796                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 796                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 796                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 796                     ; 274 #else
 796                     ; 275   case ITC_IRQ_TIM2_OVF:
 796                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 796                     ; 277 #endif /*STM8S903 or STM8AF622x */
 796                     ; 278   case ITC_IRQ_TIM3_OVF:
 796                     ; 279     ITC->ISPR4 &= Mask;
 798  010b c67f73        	ld	a,32627
 799  010e 1401          	and	a,(OFST-1,sp)
 800  0110 c77f73        	ld	32627,a
 801                     ; 280     ITC->ISPR4 |= NewPriority;
 803  0113 c67f73        	ld	a,32627
 804  0116 1a02          	or	a,(OFST+0,sp)
 805  0118 c77f73        	ld	32627,a
 806                     ; 281     break;
 808  011b 2034          	jra	L162
 809  011d               L122:
 810                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 810                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 810                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 810                     ; 286   case ITC_IRQ_UART1_TX:
 810                     ; 287   case ITC_IRQ_UART1_RX:
 810                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 810                     ; 289 #if defined(STM8AF622x)
 810                     ; 290   case ITC_IRQ_UART4_TX:
 810                     ; 291   case ITC_IRQ_UART4_RX:
 810                     ; 292 #endif /*STM8AF622x */
 810                     ; 293   case ITC_IRQ_I2C:
 810                     ; 294     ITC->ISPR5 &= Mask;
 812  011d c67f74        	ld	a,32628
 813  0120 1401          	and	a,(OFST-1,sp)
 814  0122 c77f74        	ld	32628,a
 815                     ; 295     ITC->ISPR5 |= NewPriority;
 817  0125 c67f74        	ld	a,32628
 818  0128 1a02          	or	a,(OFST+0,sp)
 819  012a c77f74        	ld	32628,a
 820                     ; 296     break;
 822  012d 2022          	jra	L162
 823  012f               L322:
 824                     ; 305   case ITC_IRQ_UART3_TX:
 824                     ; 306   case ITC_IRQ_UART3_RX:
 824                     ; 307   case ITC_IRQ_ADC2:
 824                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 824                     ; 309     
 824                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 824                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 824                     ; 312   case ITC_IRQ_ADC1:
 824                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 824                     ; 314     
 824                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 824                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 824                     ; 317 #else
 824                     ; 318   case ITC_IRQ_TIM4_OVF:
 824                     ; 319 #endif /* STM8S903 or STM8AF622x */
 824                     ; 320     ITC->ISPR6 &= Mask;
 826  012f c67f75        	ld	a,32629
 827  0132 1401          	and	a,(OFST-1,sp)
 828  0134 c77f75        	ld	32629,a
 829                     ; 321     ITC->ISPR6 |= NewPriority;
 831  0137 c67f75        	ld	a,32629
 832  013a 1a02          	or	a,(OFST+0,sp)
 833  013c c77f75        	ld	32629,a
 834                     ; 322     break;
 836  013f 2010          	jra	L162
 837  0141               L522:
 838                     ; 324   case ITC_IRQ_EEPROM_EEC:
 838                     ; 325     ITC->ISPR7 &= Mask;
 840  0141 c67f76        	ld	a,32630
 841  0144 1401          	and	a,(OFST-1,sp)
 842  0146 c77f76        	ld	32630,a
 843                     ; 326     ITC->ISPR7 |= NewPriority;
 845  0149 c67f76        	ld	a,32630
 846  014c 1a02          	or	a,(OFST+0,sp)
 847  014e c77f76        	ld	32630,a
 848                     ; 327     break;
 850  0151               L722:
 851                     ; 329   default:
 851                     ; 330     break;
 853  0151               L162:
 854                     ; 332 }
 857  0151 5b04          	addw	sp,#4
 858  0153 81            	ret
 871                     	xdef	_ITC_GetSoftwarePriority
 872                     	xdef	_ITC_SetSoftwarePriority
 873                     	xdef	_ITC_GetSoftIntStatus
 874                     	xdef	_ITC_DeInit
 875                     	xdef	_ITC_GetCPUCC
 894                     	end
