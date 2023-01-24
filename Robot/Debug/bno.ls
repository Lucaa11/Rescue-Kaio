   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  13                     .const:	section	.text
  14  0000               L3_BUSY_ERROR:
  15  0000 01            	dc.b	1
  16  0001 ff            	dc.b	255
  17  0002 00            	dc.b	0
  18  0003 7f            	dc.b	127
  19  0004 00            	dc.b	0
  20  0005 3f            	dc.b	63
  21  0006               L5_START_ERROR:
  22  0006 3f            	dc.b	63
  23  0007 ff            	dc.b	255
  24  0008 00            	dc.b	0
  25  0009 7f            	dc.b	127
  26  000a 00            	dc.b	0
  27  000b 3f            	dc.b	63
  28  000c               L7_ADD_ERROR:
  29  000c 7f            	dc.b	127
  30  000d ff            	dc.b	255
  31  000e 00            	dc.b	0
  32  000f 7f            	dc.b	127
  33  0010 00            	dc.b	0
  34  0011 3f            	dc.b	63
  35  0012               L11_SEND_ERROR:
  36  0012 bf            	dc.b	191
  37  0013 ff            	dc.b	255
  38  0014 00            	dc.b	0
  39  0015 7f            	dc.b	127
  40  0016 00            	dc.b	0
  41  0017 3f            	dc.b	63
  42  0018               L31_RECV_ERROR:
  43  0018 ff            	dc.b	255
  44  0019 ff            	dc.b	255
  45  001a 00            	dc.b	0
  46  001b 7f            	dc.b	127
  47  001c 00            	dc.b	0
  48  001d 3f            	dc.b	63
 181                     ; 11 bool BNO055_Init(uint8_t mode){
 183                     	switch	.text
 184  0000               _BNO055_Init:
 186  0000 88            	push	a
 187       00000000      OFST:	set	0
 190                     ; 13 	GPIO_WriteHigh(GPIOG,GPIO_PIN_5);
 192  0001 4b20          	push	#32
 193  0003 ae501e        	ldw	x,#20510
 194  0006 cd0000        	call	_GPIO_WriteHigh
 196  0009 84            	pop	a
 197                     ; 14 	delay_ms(30000);
 199  000a ae7530        	ldw	x,#30000
 200  000d 89            	pushw	x
 201  000e ae0000        	ldw	x,#0
 202  0011 89            	pushw	x
 203  0012 cd0000        	call	_delay_ms
 205  0015 5b04          	addw	sp,#4
 206                     ; 16 	if (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID){
 208  0017 4b00          	push	#0
 209  0019 4b01          	push	#1
 210  001b 5f            	clrw	x
 211  001c 89            	pushw	x
 212  001d a629          	ld	a,#41
 213  001f cd0000        	call	_I2C_Recv
 215  0022 5b04          	addw	sp,#4
 216  0024 f6            	ld	a,(x)
 217  0025 a1a0          	cp	a,#160
 218  0027 2723          	jreq	L301
 219                     ; 17 		delay_ms(30000);	// Wait for the device to boot up
 221  0029 ae7530        	ldw	x,#30000
 222  002c 89            	pushw	x
 223  002d ae0000        	ldw	x,#0
 224  0030 89            	pushw	x
 225  0031 cd0000        	call	_delay_ms
 227  0034 5b04          	addw	sp,#4
 228                     ; 18 		if (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID) return FALSE;
 230  0036 4b00          	push	#0
 231  0038 4b01          	push	#1
 232  003a 5f            	clrw	x
 233  003b 89            	pushw	x
 234  003c a629          	ld	a,#41
 235  003e cd0000        	call	_I2C_Recv
 237  0041 5b04          	addw	sp,#4
 238  0043 f6            	ld	a,(x)
 239  0044 a1a0          	cp	a,#160
 240  0046 2704          	jreq	L301
 243  0048 4f            	clr	a
 246  0049 5b01          	addw	sp,#1
 247  004b 81            	ret
 248  004c               L301:
 249                     ; 21 	BNO055_SetMode(OPERATION_MODE_CONFIG);
 251  004c 4f            	clr	a
 252  004d cd00f9        	call	_BNO055_SetMode
 254                     ; 23 	I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, 0x20,0);
 256  0050 4b00          	push	#0
 257  0052 ae0020        	ldw	x,#32
 258  0055 89            	pushw	x
 259  0056 ae003f        	ldw	x,#63
 260  0059 89            	pushw	x
 261  005a a629          	ld	a,#41
 262  005c cd0000        	call	_I2C_Send
 264  005f 5b05          	addw	sp,#5
 265                     ; 24 	delay_ms(30000);
 267  0061 ae7530        	ldw	x,#30000
 268  0064 89            	pushw	x
 269  0065 ae0000        	ldw	x,#0
 270  0068 89            	pushw	x
 271  0069 cd0000        	call	_delay_ms
 273  006c 5b04          	addw	sp,#4
 275  006e 200d          	jra	L111
 276  0070               L701:
 277                     ; 25 	while (I2C_Recv(0x29,BNO055_CHIP_ID_ADDR,1,0)[0] != BNO055_ID)delay_ms(10);
 279  0070 ae000a        	ldw	x,#10
 280  0073 89            	pushw	x
 281  0074 ae0000        	ldw	x,#0
 282  0077 89            	pushw	x
 283  0078 cd0000        	call	_delay_ms
 285  007b 5b04          	addw	sp,#4
 286  007d               L111:
 289  007d 4b00          	push	#0
 290  007f 4b01          	push	#1
 291  0081 5f            	clrw	x
 292  0082 89            	pushw	x
 293  0083 a629          	ld	a,#41
 294  0085 cd0000        	call	_I2C_Recv
 296  0088 5b04          	addw	sp,#4
 297  008a f6            	ld	a,(x)
 298  008b a1a0          	cp	a,#160
 299  008d 26e1          	jrne	L701
 300                     ; 26 	delay_ms(50);
 302  008f ae0032        	ldw	x,#50
 303  0092 89            	pushw	x
 304  0093 ae0000        	ldw	x,#0
 305  0096 89            	pushw	x
 306  0097 cd0000        	call	_delay_ms
 308  009a 5b04          	addw	sp,#4
 309                     ; 29 	I2C_Send(0x29,BNO055_PWR_MODE_ADDR, POWER_MODE_NORMAL,0);
 311  009c 4b00          	push	#0
 312  009e 5f            	clrw	x
 313  009f 89            	pushw	x
 314  00a0 ae003e        	ldw	x,#62
 315  00a3 89            	pushw	x
 316  00a4 a629          	ld	a,#41
 317  00a6 cd0000        	call	_I2C_Send
 319  00a9 5b05          	addw	sp,#5
 320                     ; 30 	delay_ms(10);
 322  00ab ae000a        	ldw	x,#10
 323  00ae 89            	pushw	x
 324  00af ae0000        	ldw	x,#0
 325  00b2 89            	pushw	x
 326  00b3 cd0000        	call	_delay_ms
 328  00b6 5b04          	addw	sp,#4
 329                     ; 32 	I2C_Send(0x29,BNO055_PAGE_ID_ADDR, 0,0);
 331  00b8 4b00          	push	#0
 332  00ba 5f            	clrw	x
 333  00bb 89            	pushw	x
 334  00bc ae0007        	ldw	x,#7
 335  00bf 89            	pushw	x
 336  00c0 a629          	ld	a,#41
 337  00c2 cd0000        	call	_I2C_Send
 339  00c5 5b05          	addw	sp,#5
 340                     ; 33 	I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, 0,0);
 342  00c7 4b00          	push	#0
 343  00c9 5f            	clrw	x
 344  00ca 89            	pushw	x
 345  00cb ae003f        	ldw	x,#63
 346  00ce 89            	pushw	x
 347  00cf a629          	ld	a,#41
 348  00d1 cd0000        	call	_I2C_Send
 350  00d4 5b05          	addw	sp,#5
 351                     ; 34 	delay_ms(10);
 353  00d6 ae000a        	ldw	x,#10
 354  00d9 89            	pushw	x
 355  00da ae0000        	ldw	x,#0
 356  00dd 89            	pushw	x
 357  00de cd0000        	call	_delay_ms
 359  00e1 5b04          	addw	sp,#4
 360                     ; 37 	BNO055_SetMode(mode);
 362  00e3 7b01          	ld	a,(OFST+1,sp)
 363  00e5 ad12          	call	_BNO055_SetMode
 365                     ; 38 	delay_ms(20);
 367  00e7 ae0014        	ldw	x,#20
 368  00ea 89            	pushw	x
 369  00eb ae0000        	ldw	x,#0
 370  00ee 89            	pushw	x
 371  00ef cd0000        	call	_delay_ms
 373  00f2 5b04          	addw	sp,#4
 374                     ; 40 	return TRUE;
 376  00f4 a601          	ld	a,#1
 379  00f6 5b01          	addw	sp,#1
 380  00f8 81            	ret
 415                     ; 42 void BNO055_SetMode(uint8_t mode){
 416                     	switch	.text
 417  00f9               _BNO055_SetMode:
 421                     ; 43 		BNO055_Mode=mode;
 423  00f9 c70000        	ld	_BNO055_Mode,a
 424                     ; 44 		I2C_Send(0x29,BNO055_OPR_MODE_ADDR, mode,0);
 426  00fc 4b00          	push	#0
 427  00fe 5f            	clrw	x
 428  00ff 97            	ld	xl,a
 429  0100 89            	pushw	x
 430  0101 ae003d        	ldw	x,#61
 431  0104 89            	pushw	x
 432  0105 a629          	ld	a,#41
 433  0107 cd0000        	call	_I2C_Send
 435  010a 5b05          	addw	sp,#5
 436                     ; 45 		delay_ms(30);
 438  010c ae001e        	ldw	x,#30
 439  010f 89            	pushw	x
 440  0110 ae0000        	ldw	x,#0
 441  0113 89            	pushw	x
 442  0114 cd0000        	call	_delay_ms
 444  0117 5b04          	addw	sp,#4
 445                     ; 46 	}
 448  0119 81            	ret
 495                     ; 47 void BNO055_SetExternalCrystalUse(bool useExternalCrystal){
 496                     	switch	.text
 497  011a               _BNO055_SetExternalCrystalUse:
 499  011a 88            	push	a
 500  011b 88            	push	a
 501       00000001      OFST:	set	1
 504                     ; 48 		uint8_t prevMode = BNO055_Mode;
 506  011c c60000        	ld	a,_BNO055_Mode
 507  011f 6b01          	ld	(OFST+0,sp),a
 509                     ; 49 		BNO055_SetMode(OPERATION_MODE_CONFIG);
 511  0121 4f            	clr	a
 512  0122 add5          	call	_BNO055_SetMode
 514                     ; 50 		delay_ms(25);
 516  0124 ae0019        	ldw	x,#25
 517  0127 89            	pushw	x
 518  0128 ae0000        	ldw	x,#0
 519  012b 89            	pushw	x
 520  012c cd0000        	call	_delay_ms
 522  012f 5b04          	addw	sp,#4
 523                     ; 51 		I2C_Send(0x29,BNO055_PAGE_ID_ADDR, 0,0);
 525  0131 4b00          	push	#0
 526  0133 5f            	clrw	x
 527  0134 89            	pushw	x
 528  0135 ae0007        	ldw	x,#7
 529  0138 89            	pushw	x
 530  0139 a629          	ld	a,#41
 531  013b cd0000        	call	_I2C_Send
 533  013e 5b05          	addw	sp,#5
 534                     ; 52 		I2C_Send(0x29,BNO055_SYS_TRIGGER_ADDR, useExternalCrystal? 0x80: 0,0);
 536  0140 4b00          	push	#0
 537  0142 0d03          	tnz	(OFST+2,sp)
 538  0144 2705          	jreq	L21
 539  0146 ae0080        	ldw	x,#128
 540  0149 2001          	jra	L41
 541  014b               L21:
 542  014b 5f            	clrw	x
 543  014c               L41:
 544  014c 89            	pushw	x
 545  014d ae003f        	ldw	x,#63
 546  0150 89            	pushw	x
 547  0151 a629          	ld	a,#41
 548  0153 cd0000        	call	_I2C_Send
 550  0156 5b05          	addw	sp,#5
 551                     ; 53 		delay_ms(10);
 553  0158 ae000a        	ldw	x,#10
 554  015b 89            	pushw	x
 555  015c ae0000        	ldw	x,#0
 556  015f 89            	pushw	x
 557  0160 cd0000        	call	_delay_ms
 559  0163 5b04          	addw	sp,#4
 560                     ; 54 		BNO055_SetMode(prevMode);
 562  0165 7b01          	ld	a,(OFST+0,sp)
 563  0167 ad90          	call	_BNO055_SetMode
 565                     ; 55 		delay_ms(20);
 567  0169 ae0014        	ldw	x,#20
 568  016c 89            	pushw	x
 569  016d ae0000        	ldw	x,#0
 570  0170 89            	pushw	x
 571  0171 cd0000        	call	_delay_ms
 573  0174 5b04          	addw	sp,#4
 574                     ; 56 	}
 577  0176 85            	popw	x
 578  0177 81            	ret
 656                     ; 57 float* BNO055_GetVector(uint8_t vectorType){
 657                     	switch	.text
 658  0178               _BNO055_GetVector:
 660  0178 88            	push	a
 661  0179 521e          	subw	sp,#30
 662       0000001e      OFST:	set	30
 665                     ; 63 		buf = I2C_Recv(0x29, vectorType, 6, 0);
 667  017b 4b00          	push	#0
 668  017d 4b06          	push	#6
 669  017f 5f            	clrw	x
 670  0180 97            	ld	xl,a
 671  0181 89            	pushw	x
 672  0182 a629          	ld	a,#41
 673  0184 cd0000        	call	_I2C_Recv
 675  0187 5b04          	addw	sp,#4
 676  0189 1f17          	ldw	(OFST-7,sp),x
 678                     ; 64 		for (i=0;i<3;i++) xyz[i] = buf[i*2] | (buf[i*2+1]<<8);
 680  018b 5f            	clrw	x
 681  018c 1f1d          	ldw	(OFST-1,sp),x
 683  018e               L712:
 686  018e 1e1d          	ldw	x,(OFST-1,sp)
 687  0190 58            	sllw	x
 688  0191 72fb17        	addw	x,(OFST-7,sp)
 689  0194 e601          	ld	a,(1,x)
 690  0196 5f            	clrw	x
 691  0197 97            	ld	xl,a
 692  0198 161d          	ldw	y,(OFST-1,sp)
 693  019a 9058          	sllw	y
 694  019c 72f917        	addw	y,(OFST-7,sp)
 695  019f 90f6          	ld	a,(y)
 696  01a1 02            	rlwa	x,a
 697  01a2 9096          	ldw	y,sp
 698  01a4 72a90011      	addw	y,#OFST-13
 699  01a8 1703          	ldw	(OFST-27,sp),y
 701  01aa 161d          	ldw	y,(OFST-1,sp)
 702  01ac 9058          	sllw	y
 703  01ae 72f903        	addw	y,(OFST-27,sp)
 704  01b1 90ff          	ldw	(y),x
 707  01b3 1e1d          	ldw	x,(OFST-1,sp)
 708  01b5 1c0001        	addw	x,#1
 709  01b8 1f1d          	ldw	(OFST-1,sp),x
 713  01ba 9c            	rvf
 714  01bb 1e1d          	ldw	x,(OFST-1,sp)
 715  01bd a30003        	cpw	x,#3
 716  01c0 2fcc          	jrslt	L712
 717                     ; 65 		switch(vectorType){
 719  01c2 7b1f          	ld	a,(OFST+1,sp)
 721                     ; 80 				break;
 722  01c4 a00e          	sub	a,#14
 723  01c6 2718          	jreq	L151
 724  01c8 a006          	sub	a,#6
 725  01ca 2720          	jreq	L351
 726  01cc a006          	sub	a,#6
 727  01ce 2728          	jreq	L551
 728  01d0 a014          	sub	a,#20
 729  01d2 2730          	jreq	L751
 730  01d4               L161:
 731                     ; 78 			default:
 731                     ; 79 				scalingFactor = 1.0;
 733  01d4 ce0020        	ldw	x,L562+2
 734  01d7 1f1b          	ldw	(OFST-3,sp),x
 735  01d9 ce001e        	ldw	x,L562
 736  01dc 1f19          	ldw	(OFST-5,sp),x
 738                     ; 80 				break;
 740  01de 202e          	jra	L722
 741  01e0               L151:
 742                     ; 66 			case VECTOR_MAGNETOMETER:
 742                     ; 67 				scalingFactor = 16.0;
 744  01e0 ce002c        	ldw	x,L532+2
 745  01e3 1f1b          	ldw	(OFST-3,sp),x
 746  01e5 ce002a        	ldw	x,L532
 747  01e8 1f19          	ldw	(OFST-5,sp),x
 749                     ; 68 				break;
 751  01ea 2022          	jra	L722
 752  01ec               L351:
 753                     ; 69 			case VECTOR_GYROSCOPE:
 753                     ; 70 				scalingFactor = 900.0;
 755  01ec ce0028        	ldw	x,L542+2
 756  01ef 1f1b          	ldw	(OFST-3,sp),x
 757  01f1 ce0026        	ldw	x,L542
 758  01f4 1f19          	ldw	(OFST-5,sp),x
 760                     ; 71 				break;
 762  01f6 2016          	jra	L722
 763  01f8               L551:
 764                     ; 72 			case VECTOR_EULER:
 764                     ; 73 				scalingFactor = 16.0;
 766  01f8 ce002c        	ldw	x,L532+2
 767  01fb 1f1b          	ldw	(OFST-3,sp),x
 768  01fd ce002a        	ldw	x,L532
 769  0200 1f19          	ldw	(OFST-5,sp),x
 771                     ; 74 				break;
 773  0202 200a          	jra	L722
 774  0204               L751:
 775                     ; 75 			case VECTOR_GRAVITY:
 775                     ; 76 				scalingFactor = 100.0;
 777  0204 ce0024        	ldw	x,L552+2
 778  0207 1f1b          	ldw	(OFST-3,sp),x
 779  0209 ce0022        	ldw	x,L552
 780  020c 1f19          	ldw	(OFST-5,sp),x
 782                     ; 77 				break;
 784  020e               L722:
 785                     ; 82 		for(i=0;i<3;i++)realxyz[i]=xyz[i]/scalingFactor;
 787  020e 5f            	clrw	x
 788  020f 1f1d          	ldw	(OFST-1,sp),x
 790  0211               L172:
 793  0211 96            	ldw	x,sp
 794  0212 1c0011        	addw	x,#OFST-13
 795  0215 1f03          	ldw	(OFST-27,sp),x
 797  0217 1e1d          	ldw	x,(OFST-1,sp)
 798  0219 58            	sllw	x
 799  021a 72fb03        	addw	x,(OFST-27,sp)
 800  021d fe            	ldw	x,(x)
 801  021e cd0000        	call	c_itof
 803  0221 96            	ldw	x,sp
 804  0222 1c0019        	addw	x,#OFST-5
 805  0225 cd0000        	call	c_fdiv
 807  0228 96            	ldw	x,sp
 808  0229 1c0005        	addw	x,#OFST-25
 809  022c 1f01          	ldw	(OFST-29,sp),x
 811  022e 1e1d          	ldw	x,(OFST-1,sp)
 812  0230 58            	sllw	x
 813  0231 58            	sllw	x
 814  0232 72fb01        	addw	x,(OFST-29,sp)
 815  0235 cd0000        	call	c_rtol
 819  0238 1e1d          	ldw	x,(OFST-1,sp)
 820  023a 1c0001        	addw	x,#1
 821  023d 1f1d          	ldw	(OFST-1,sp),x
 825  023f 9c            	rvf
 826  0240 1e1d          	ldw	x,(OFST-1,sp)
 827  0242 a30003        	cpw	x,#3
 828  0245 2fca          	jrslt	L172
 829                     ; 84 		return realxyz;
 831  0247 96            	ldw	x,sp
 832  0248 1c0005        	addw	x,#OFST-25
 835  024b 5b1f          	addw	sp,#31
 836  024d 81            	ret
 858                     	xref	_delay_ms
 859                     	switch	.bss
 860  0000               _BNO055_Mode:
 861  0000 00            	ds.b	1
 862                     	xdef	_BNO055_Mode
 863                     	xdef	_BNO055_GetVector
 864                     	xdef	_BNO055_SetExternalCrystalUse
 865                     	xdef	_BNO055_SetMode
 866                     	xdef	_BNO055_Init
 867                     	xref	_I2C_Recv
 868                     	xref	_I2C_Send
 869                     	xref	_GPIO_WriteHigh
 870                     	switch	.const
 871  001e               L562:
 872  001e 3f800000      	dc.w	16256,0
 873  0022               L552:
 874  0022 42c80000      	dc.w	17096,0
 875  0026               L542:
 876  0026 44610000      	dc.w	17505,0
 877  002a               L532:
 878  002a 41800000      	dc.w	16768,0
 879                     	xref.b	c_x
 899                     	xref	c_rtol
 900                     	xref	c_fdiv
 901                     	xref	c_itof
 902                     	end
