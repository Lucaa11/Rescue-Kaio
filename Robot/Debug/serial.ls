   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  46                     ; 20 void InitSer(){
  48                     	switch	.text
  49  0000               _InitSer:
  53                     ; 22 	GPIO_Init(GPIOD,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  55  0000 4bf0          	push	#240
  56  0002 4b20          	push	#32
  57  0004 ae500f        	ldw	x,#20495
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 23 	GPIO_Init(GPIOD,GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  63  000b 4b40          	push	#64
  64  000d 4b40          	push	#64
  65  000f ae500f        	ldw	x,#20495
  66  0012 cd0000        	call	_GPIO_Init
  68  0015 85            	popw	x
  69                     ; 24 	UART1_DeInit();
  71  0016 cd0000        	call	_UART1_DeInit
  73                     ; 25 	UART1_Init(500000,UART1_WORDLENGTH_8D,UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE,UART1_MODE_TXRX_ENABLE);
  75  0019 4b0c          	push	#12
  76  001b 4b80          	push	#128
  77  001d 4b00          	push	#0
  78  001f 4b00          	push	#0
  79  0021 4b00          	push	#0
  80  0023 aea120        	ldw	x,#41248
  81  0026 89            	pushw	x
  82  0027 ae0007        	ldw	x,#7
  83  002a 89            	pushw	x
  84  002b cd0000        	call	_UART1_Init
  86  002e 5b09          	addw	sp,#9
  87                     ; 26 	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
  89  0030 4b01          	push	#1
  90  0032 ae0255        	ldw	x,#597
  91  0035 cd0000        	call	_UART1_ITConfig
  93  0038 84            	pop	a
  94                     ; 27 	UART1_Cmd(ENABLE);
  96  0039 a601          	ld	a,#1
  97  003b cd0000        	call	_UART1_Cmd
  99                     ; 28 }
 102  003e 81            	ret
 134                     ; 29 void Serial_Tx(uint8_t data){
 135                     	switch	.text
 136  003f               _Serial_Tx:
 138  003f 88            	push	a
 139       00000000      OFST:	set	0
 142  0040               L73:
 143                     ; 30 	while(!(UART1 -> SR & UART1_SR_TC));
 145  0040 c65230        	ld	a,21040
 146  0043 a540          	bcp	a,#64
 147  0045 27f9          	jreq	L73
 148                     ; 31 	UART1 -> DR = data;
 150  0047 7b01          	ld	a,(OFST+1,sp)
 151  0049 c75231        	ld	21041,a
 152                     ; 32 }
 155  004c 84            	pop	a
 156  004d 81            	ret
 215                     .const:	section	.text
 216  0000               L41:
 217  0000 0000000a      	dc.l	10
 218                     ; 33 void Serial_Send_Int(int32_t num)
 218                     ; 34 {
 219                     	switch	.text
 220  004e               _Serial_Send_Int:
 222  004e 520e          	subw	sp,#14
 223       0000000e      OFST:	set	14
 226                     ; 35 	if(num<0)
 228  0050 9c            	rvf
 229  0051 9c            	rvf
 230  0052 0d11          	tnz	(OFST+3,sp)
 231  0054 2e0d          	jrsge	L76
 232                     ; 37 		Serial_Send_String("-");
 234  0056 ae0012        	ldw	x,#L17
 235  0059 cd02c1        	call	_Serial_Send_String
 237                     ; 38 		num=-num;
 239  005c 96            	ldw	x,sp
 240  005d 1c0011        	addw	x,#OFST+3
 241  0060 cd0000        	call	c_lgneg
 243  0063               L76:
 244                     ; 40 	if(num==0){Serial_Tx('0');}
 246  0063 96            	ldw	x,sp
 247  0064 1c0011        	addw	x,#OFST+3
 248  0067 cd0000        	call	c_lzmp
 250  006a 260a          	jrne	L37
 253  006c a630          	ld	a,#48
 254  006e adcf          	call	_Serial_Tx
 257  0070               L57:
 258                     ; 57 	SerialN();
 260  0070 cd02e4        	call	_SerialN
 262                     ; 58 }
 265  0073 5b0e          	addw	sp,#14
 266  0075 81            	ret
 267  0076               L37:
 268                     ; 46 		for(i=0;i<10;i++) str[i]=0; // cancella la stringa
 270  0076 0f0e          	clr	(OFST+0,sp)
 272  0078               L77:
 275  0078 96            	ldw	x,sp
 276  0079 1c0004        	addw	x,#OFST-10
 277  007c 9f            	ld	a,xl
 278  007d 5e            	swapw	x
 279  007e 1b0e          	add	a,(OFST+0,sp)
 280  0080 2401          	jrnc	L21
 281  0082 5c            	incw	x
 282  0083               L21:
 283  0083 02            	rlwa	x,a
 284  0084 7f            	clr	(x)
 287  0085 0c0e          	inc	(OFST+0,sp)
 291  0087 7b0e          	ld	a,(OFST+0,sp)
 292  0089 a10a          	cp	a,#10
 293  008b 25eb          	jrult	L77
 294                     ; 47 		i=0;
 296  008d 0f0e          	clr	(OFST+0,sp)
 299  008f 203b          	jra	L111
 300  0091               L501:
 301                     ; 50         remainder = num % 10;
 303  0091 96            	ldw	x,sp
 304  0092 1c0011        	addw	x,#OFST+3
 305  0095 cd0000        	call	c_ltor
 307  0098 ae0000        	ldw	x,#L41
 308  009b cd0000        	call	c_lmod
 310  009e b603          	ld	a,c_lreg+3
 311  00a0 6b03          	ld	(OFST-11,sp),a
 313                     ; 51         str[i++] = 48 + remainder;
 315  00a2 96            	ldw	x,sp
 316  00a3 1c0004        	addw	x,#OFST-10
 317  00a6 1f01          	ldw	(OFST-13,sp),x
 319  00a8 7b0e          	ld	a,(OFST+0,sp)
 320  00aa 97            	ld	xl,a
 321  00ab 0c0e          	inc	(OFST+0,sp)
 323  00ad 9f            	ld	a,xl
 324  00ae 5f            	clrw	x
 325  00af 97            	ld	xl,a
 326  00b0 72fb01        	addw	x,(OFST-13,sp)
 327  00b3 7b03          	ld	a,(OFST-11,sp)
 328  00b5 ab30          	add	a,#48
 329  00b7 f7            	ld	(x),a
 330                     ; 52         num/=10;
 332  00b8 96            	ldw	x,sp
 333  00b9 1c0011        	addw	x,#OFST+3
 334  00bc cd0000        	call	c_ltor
 336  00bf ae0000        	ldw	x,#L41
 337  00c2 cd0000        	call	c_ldiv
 339  00c5 96            	ldw	x,sp
 340  00c6 1c0011        	addw	x,#OFST+3
 341  00c9 cd0000        	call	c_rtol
 343  00cc               L111:
 344                     ; 48 		while (num)
 346  00cc 96            	ldw	x,sp
 347  00cd 1c0011        	addw	x,#OFST+3
 348  00d0 cd0000        	call	c_lzmp
 350  00d3 26bc          	jrne	L501
 351                     ; 54 		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
 353  00d5 0f0e          	clr	(OFST+0,sp)
 355  00d7               L511:
 356                     ; 55 		if (str[9-i]) Serial_Tx(str[9-i]);
 358  00d7 96            	ldw	x,sp
 359  00d8 1c0004        	addw	x,#OFST-10
 360  00db 1f01          	ldw	(OFST-13,sp),x
 362  00dd a600          	ld	a,#0
 363  00df 97            	ld	xl,a
 364  00e0 a609          	ld	a,#9
 365  00e2 100e          	sub	a,(OFST+0,sp)
 366  00e4 2401          	jrnc	L61
 367  00e6 5a            	decw	x
 368  00e7               L61:
 369  00e7 02            	rlwa	x,a
 370  00e8 72fb01        	addw	x,(OFST-13,sp)
 371  00eb 7d            	tnz	(x)
 372  00ec 2718          	jreq	L321
 375  00ee 96            	ldw	x,sp
 376  00ef 1c0004        	addw	x,#OFST-10
 377  00f2 1f01          	ldw	(OFST-13,sp),x
 379  00f4 a600          	ld	a,#0
 380  00f6 97            	ld	xl,a
 381  00f7 a609          	ld	a,#9
 382  00f9 100e          	sub	a,(OFST+0,sp)
 383  00fb 2401          	jrnc	L02
 384  00fd 5a            	decw	x
 385  00fe               L02:
 386  00fe 02            	rlwa	x,a
 387  00ff 72fb01        	addw	x,(OFST-13,sp)
 388  0102 f6            	ld	a,(x)
 389  0103 cd003f        	call	_Serial_Tx
 391  0106               L321:
 392                     ; 54 		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
 394  0106 0c0e          	inc	(OFST+0,sp)
 398  0108 7b0e          	ld	a,(OFST+0,sp)
 399  010a a10a          	cp	a,#10
 400  010c 25c9          	jrult	L511
 401  010e ac700070      	jpf	L57
 460                     	switch	.const
 461  0004               L62:
 462  0004 00000010      	dc.l	16
 463                     ; 59 void Serial_Send_Hex(int32_t num){
 464                     	switch	.text
 465  0112               _Serial_Send_Hex:
 467  0112 5211          	subw	sp,#17
 468       00000011      OFST:	set	17
 471                     ; 60 	if(num<0)
 473  0114 9c            	rvf
 474  0115 9c            	rvf
 475  0116 0d14          	tnz	(OFST+3,sp)
 476  0118 2e0d          	jrsge	L151
 477                     ; 62 		Serial_Send_String("-");
 479  011a ae0012        	ldw	x,#L17
 480  011d cd02c1        	call	_Serial_Send_String
 482                     ; 63 		num=-num;
 484  0120 96            	ldw	x,sp
 485  0121 1c0014        	addw	x,#OFST+3
 486  0124 cd0000        	call	c_lgneg
 488  0127               L151:
 489                     ; 65 	Serial_Send_String("0x");
 491  0127 ae000f        	ldw	x,#L351
 492  012a cd02c1        	call	_Serial_Send_String
 494                     ; 66 	if(num==0)Serial_Tx('0');
 496  012d 96            	ldw	x,sp
 497  012e 1c0014        	addw	x,#OFST+3
 498  0131 cd0000        	call	c_lzmp
 500  0134 260b          	jrne	L551
 503  0136 a630          	ld	a,#48
 504  0138 cd003f        	call	_Serial_Tx
 507  013b               L751:
 508                     ; 83 	SerialN();
 510  013b cd02e4        	call	_SerialN
 512                     ; 84 }
 515  013e 5b11          	addw	sp,#17
 516  0140 81            	ret
 517  0141               L551:
 518                     ; 71 		for(i=0;i<10;i++) str[i]=0; // cancella la stringa
 520  0141 0f11          	clr	(OFST+0,sp)
 522  0143               L161:
 525  0143 96            	ldw	x,sp
 526  0144 1c0007        	addw	x,#OFST-10
 527  0147 9f            	ld	a,xl
 528  0148 5e            	swapw	x
 529  0149 1b11          	add	a,(OFST+0,sp)
 530  014b 2401          	jrnc	L42
 531  014d 5c            	incw	x
 532  014e               L42:
 533  014e 02            	rlwa	x,a
 534  014f 7f            	clr	(x)
 537  0150 0c11          	inc	(OFST+0,sp)
 541  0152 7b11          	ld	a,(OFST+0,sp)
 542  0154 a10a          	cp	a,#10
 543  0156 25eb          	jrult	L161
 544                     ; 72 		i=0;
 546  0158 0f11          	clr	(OFST+0,sp)
 549  015a 2066          	jra	L371
 550  015c               L761:
 551                     ; 75         remainder = num % 16;
 553  015c 96            	ldw	x,sp
 554  015d 1c0014        	addw	x,#OFST+3
 555  0160 cd0000        	call	c_ltor
 557  0163 ae0004        	ldw	x,#L62
 558  0166 cd0000        	call	c_lmod
 560  0169 96            	ldw	x,sp
 561  016a 1c0003        	addw	x,#OFST-14
 562  016d cd0000        	call	c_rtol
 565                     ; 76         if (remainder < 10)str[i++] = 48 + remainder;
 567  0170 9c            	rvf
 568  0171 96            	ldw	x,sp
 569  0172 1c0003        	addw	x,#OFST-14
 570  0175 cd0000        	call	c_ltor
 572  0178 ae0000        	ldw	x,#L41
 573  017b cd0000        	call	c_lcmp
 575  017e 2e18          	jrsge	L771
 578  0180 96            	ldw	x,sp
 579  0181 1c0007        	addw	x,#OFST-10
 580  0184 1f01          	ldw	(OFST-16,sp),x
 582  0186 7b11          	ld	a,(OFST+0,sp)
 583  0188 97            	ld	xl,a
 584  0189 0c11          	inc	(OFST+0,sp)
 586  018b 9f            	ld	a,xl
 587  018c 5f            	clrw	x
 588  018d 97            	ld	xl,a
 589  018e 72fb01        	addw	x,(OFST-16,sp)
 590  0191 7b06          	ld	a,(OFST-11,sp)
 591  0193 ab30          	add	a,#48
 592  0195 f7            	ld	(x),a
 594  0196 2016          	jra	L102
 595  0198               L771:
 596                     ; 77         else str[i++] = 55 + remainder;
 598  0198 96            	ldw	x,sp
 599  0199 1c0007        	addw	x,#OFST-10
 600  019c 1f01          	ldw	(OFST-16,sp),x
 602  019e 7b11          	ld	a,(OFST+0,sp)
 603  01a0 97            	ld	xl,a
 604  01a1 0c11          	inc	(OFST+0,sp)
 606  01a3 9f            	ld	a,xl
 607  01a4 5f            	clrw	x
 608  01a5 97            	ld	xl,a
 609  01a6 72fb01        	addw	x,(OFST-16,sp)
 610  01a9 7b06          	ld	a,(OFST-11,sp)
 611  01ab ab37          	add	a,#55
 612  01ad f7            	ld	(x),a
 613  01ae               L102:
 614                     ; 78         num/=16;
 616  01ae 96            	ldw	x,sp
 617  01af 1c0014        	addw	x,#OFST+3
 618  01b2 cd0000        	call	c_ltor
 620  01b5 ae0004        	ldw	x,#L62
 621  01b8 cd0000        	call	c_ldiv
 623  01bb 96            	ldw	x,sp
 624  01bc 1c0014        	addw	x,#OFST+3
 625  01bf cd0000        	call	c_rtol
 627  01c2               L371:
 628                     ; 73 		while (num)
 630  01c2 96            	ldw	x,sp
 631  01c3 1c0014        	addw	x,#OFST+3
 632  01c6 cd0000        	call	c_lzmp
 634  01c9 2691          	jrne	L761
 635                     ; 80 		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
 637  01cb 0f11          	clr	(OFST+0,sp)
 639  01cd               L302:
 640                     ; 81 		if (str[9-i]) Serial_Tx(str[9-i]);
 642  01cd 96            	ldw	x,sp
 643  01ce 1c0007        	addw	x,#OFST-10
 644  01d1 1f01          	ldw	(OFST-16,sp),x
 646  01d3 a600          	ld	a,#0
 647  01d5 97            	ld	xl,a
 648  01d6 a609          	ld	a,#9
 649  01d8 1011          	sub	a,(OFST+0,sp)
 650  01da 2401          	jrnc	L03
 651  01dc 5a            	decw	x
 652  01dd               L03:
 653  01dd 02            	rlwa	x,a
 654  01de 72fb01        	addw	x,(OFST-16,sp)
 655  01e1 7d            	tnz	(x)
 656  01e2 2718          	jreq	L112
 659  01e4 96            	ldw	x,sp
 660  01e5 1c0007        	addw	x,#OFST-10
 661  01e8 1f01          	ldw	(OFST-16,sp),x
 663  01ea a600          	ld	a,#0
 664  01ec 97            	ld	xl,a
 665  01ed a609          	ld	a,#9
 666  01ef 1011          	sub	a,(OFST+0,sp)
 667  01f1 2401          	jrnc	L23
 668  01f3 5a            	decw	x
 669  01f4               L23:
 670  01f4 02            	rlwa	x,a
 671  01f5 72fb01        	addw	x,(OFST-16,sp)
 672  01f8 f6            	ld	a,(x)
 673  01f9 cd003f        	call	_Serial_Tx
 675  01fc               L112:
 676                     ; 80 		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
 678  01fc 0c11          	inc	(OFST+0,sp)
 682  01fe 7b11          	ld	a,(OFST+0,sp)
 683  0200 a10a          	cp	a,#10
 684  0202 25c9          	jrult	L302
 685  0204 ac3b013b      	jpf	L751
 744                     	switch	.const
 745  0008               L04:
 746  0008 00000002      	dc.l	2
 747                     ; 85 void Serial_Send_Bin(int32_t num){
 748                     	switch	.text
 749  0208               _Serial_Send_Bin:
 751  0208 5217          	subw	sp,#23
 752       00000017      OFST:	set	23
 755                     ; 86 	if(num<0)
 757  020a 9c            	rvf
 758  020b 9c            	rvf
 759  020c 0d1a          	tnz	(OFST+3,sp)
 760  020e 2e0d          	jrsge	L732
 761                     ; 88 		Serial_Send_String("-");
 763  0210 ae0012        	ldw	x,#L17
 764  0213 cd02c1        	call	_Serial_Send_String
 766                     ; 89 		num=-num;
 768  0216 96            	ldw	x,sp
 769  0217 1c001a        	addw	x,#OFST+3
 770  021a cd0000        	call	c_lgneg
 772  021d               L732:
 773                     ; 91 	Serial_Send_String("0b");
 775  021d ae000c        	ldw	x,#L142
 776  0220 cd02c1        	call	_Serial_Send_String
 778                     ; 92 	if(num==0)Serial_Tx('0');
 780  0223 96            	ldw	x,sp
 781  0224 1c001a        	addw	x,#OFST+3
 782  0227 cd0000        	call	c_lzmp
 784  022a 260b          	jrne	L342
 787  022c a630          	ld	a,#48
 788  022e cd003f        	call	_Serial_Tx
 791  0231               L542:
 792                     ; 108 	SerialN();
 794  0231 cd02e4        	call	_SerialN
 796                     ; 109 }
 799  0234 5b17          	addw	sp,#23
 800  0236 81            	ret
 801  0237               L342:
 802                     ; 97 		for(i=0;i<16;i++) str[i]='0'; // cancella la stringa
 804  0237 0f17          	clr	(OFST+0,sp)
 806  0239               L742:
 809  0239 96            	ldw	x,sp
 810  023a 1c0007        	addw	x,#OFST-16
 811  023d 9f            	ld	a,xl
 812  023e 5e            	swapw	x
 813  023f 1b17          	add	a,(OFST+0,sp)
 814  0241 2401          	jrnc	L63
 815  0243 5c            	incw	x
 816  0244               L63:
 817  0244 02            	rlwa	x,a
 818  0245 a630          	ld	a,#48
 819  0247 f7            	ld	(x),a
 822  0248 0c17          	inc	(OFST+0,sp)
 826  024a 7b17          	ld	a,(OFST+0,sp)
 827  024c a110          	cp	a,#16
 828  024e 25e9          	jrult	L742
 829                     ; 98 		i=0;
 831  0250 0f17          	clr	(OFST+0,sp)
 834  0252 203e          	jra	L162
 835  0254               L552:
 836                     ; 101         remainder = num % 2;
 838  0254 96            	ldw	x,sp
 839  0255 1c001a        	addw	x,#OFST+3
 840  0258 cd0000        	call	c_ltor
 842  025b ae0008        	ldw	x,#L04
 843  025e cd0000        	call	c_lmod
 845  0261 96            	ldw	x,sp
 846  0262 1c0003        	addw	x,#OFST-20
 847  0265 cd0000        	call	c_rtol
 850                     ; 102         str[i++] = 48 + remainder;
 852  0268 96            	ldw	x,sp
 853  0269 1c0007        	addw	x,#OFST-16
 854  026c 1f01          	ldw	(OFST-22,sp),x
 856  026e 7b17          	ld	a,(OFST+0,sp)
 857  0270 97            	ld	xl,a
 858  0271 0c17          	inc	(OFST+0,sp)
 860  0273 9f            	ld	a,xl
 861  0274 5f            	clrw	x
 862  0275 97            	ld	xl,a
 863  0276 72fb01        	addw	x,(OFST-22,sp)
 864  0279 7b06          	ld	a,(OFST-17,sp)
 865  027b ab30          	add	a,#48
 866  027d f7            	ld	(x),a
 867                     ; 103         num/=2;
 869  027e 96            	ldw	x,sp
 870  027f 1c001a        	addw	x,#OFST+3
 871  0282 cd0000        	call	c_ltor
 873  0285 ae0008        	ldw	x,#L04
 874  0288 cd0000        	call	c_ldiv
 876  028b 96            	ldw	x,sp
 877  028c 1c001a        	addw	x,#OFST+3
 878  028f cd0000        	call	c_rtol
 880  0292               L162:
 881                     ; 99 		while (num)
 883  0292 96            	ldw	x,sp
 884  0293 1c001a        	addw	x,#OFST+3
 885  0296 cd0000        	call	c_lzmp
 887  0299 26b9          	jrne	L552
 888                     ; 105 		for (i=0; i<16; i++)			// invia la stringa un carattere alla volta
 890  029b 0f17          	clr	(OFST+0,sp)
 892  029d               L562:
 893                     ; 106 		Serial_Tx(str[15-i]);
 895  029d 96            	ldw	x,sp
 896  029e 1c0007        	addw	x,#OFST-16
 897  02a1 1f01          	ldw	(OFST-22,sp),x
 899  02a3 a600          	ld	a,#0
 900  02a5 97            	ld	xl,a
 901  02a6 a60f          	ld	a,#15
 902  02a8 1017          	sub	a,(OFST+0,sp)
 903  02aa 2401          	jrnc	L24
 904  02ac 5a            	decw	x
 905  02ad               L24:
 906  02ad 02            	rlwa	x,a
 907  02ae 72fb01        	addw	x,(OFST-22,sp)
 908  02b1 f6            	ld	a,(x)
 909  02b2 cd003f        	call	_Serial_Tx
 911                     ; 105 		for (i=0; i<16; i++)			// invia la stringa un carattere alla volta
 913  02b5 0c17          	inc	(OFST+0,sp)
 917  02b7 7b17          	ld	a,(OFST+0,sp)
 918  02b9 a110          	cp	a,#16
 919  02bb 25e0          	jrult	L562
 920  02bd ac310231      	jpf	L542
 964                     ; 110 void Serial_Send_String(char *string1)
 964                     ; 111 {
 965                     	switch	.text
 966  02c1               _Serial_Send_String:
 968  02c1 89            	pushw	x
 969  02c2 89            	pushw	x
 970       00000002      OFST:	set	2
 973                     ; 112 	int i=0;
 975                     ; 113 	for(i=0;i<strlen(string1);i++)
 977  02c3 5f            	clrw	x
 978  02c4 1f01          	ldw	(OFST-1,sp),x
 981  02c6 2010          	jra	L713
 982  02c8               L313:
 983                     ; 115 		Serial_Tx(string1[i]);
 985  02c8 1e01          	ldw	x,(OFST-1,sp)
 986  02ca 72fb03        	addw	x,(OFST+1,sp)
 987  02cd f6            	ld	a,(x)
 988  02ce cd003f        	call	_Serial_Tx
 990                     ; 113 	for(i=0;i<strlen(string1);i++)
 992  02d1 1e01          	ldw	x,(OFST-1,sp)
 993  02d3 1c0001        	addw	x,#1
 994  02d6 1f01          	ldw	(OFST-1,sp),x
 996  02d8               L713:
 999  02d8 1e03          	ldw	x,(OFST+1,sp)
1000  02da cd0000        	call	_strlen
1002  02dd 1301          	cpw	x,(OFST-1,sp)
1003  02df 22e7          	jrugt	L313
1004                     ; 117 }
1007  02e1 5b04          	addw	sp,#4
1008  02e3 81            	ret
1032                     ; 118 void SerialN()
1032                     ; 119 {
1033                     	switch	.text
1034  02e4               _SerialN:
1038                     ; 120 	Serial_Tx(13);
1040  02e4 a60d          	ld	a,#13
1041  02e6 cd003f        	call	_Serial_Tx
1043                     ; 121 	Serial_Tx(10);
1045  02e9 a60a          	ld	a,#10
1046  02eb cd003f        	call	_Serial_Tx
1048                     ; 122 }
1051  02ee 81            	ret
1064                     	xdef	_SerialN
1065                     	xdef	_Serial_Send_String
1066                     	xdef	_Serial_Send_Bin
1067                     	xdef	_Serial_Send_Hex
1068                     	xdef	_Serial_Send_Int
1069                     	xdef	_Serial_Tx
1070                     	xdef	_InitSer
1071                     	xref	_strlen
1072                     	xref	_UART1_ITConfig
1073                     	xref	_UART1_Cmd
1074                     	xref	_UART1_Init
1075                     	xref	_UART1_DeInit
1076                     	xref	_GPIO_Init
1077                     	switch	.const
1078  000c               L142:
1079  000c 306200        	dc.b	"0b",0
1080  000f               L351:
1081  000f 307800        	dc.b	"0x",0
1082  0012               L17:
1083  0012 2d00          	dc.b	"-",0
1084                     	xref.b	c_lreg
1085                     	xref.b	c_x
1105                     	xref	c_lcmp
1106                     	xref	c_rtol
1107                     	xref	c_ldiv
1108                     	xref	c_lmod
1109                     	xref	c_ltor
1110                     	xref	c_lzmp
1111                     	xref	c_lgneg
1112                     	end
