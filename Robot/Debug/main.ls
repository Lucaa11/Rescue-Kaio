   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  52                     .const:	section	.text
  53  0000               L76_BUSY_ERROR:
  54  0000 01            	dc.b	1
  55  0001 ff            	dc.b	255
  56  0002 00            	dc.b	0
  57  0003 7f            	dc.b	127
  58  0004 00            	dc.b	0
  59  0005 3f            	dc.b	63
  60  0006               L17_START_ERROR:
  61  0006 3f            	dc.b	63
  62  0007 ff            	dc.b	255
  63  0008 00            	dc.b	0
  64  0009 7f            	dc.b	127
  65  000a 00            	dc.b	0
  66  000b 3f            	dc.b	63
  67  000c               L37_ADD_ERROR:
  68  000c 7f            	dc.b	127
  69  000d ff            	dc.b	255
  70  000e 00            	dc.b	0
  71  000f 7f            	dc.b	127
  72  0010 00            	dc.b	0
  73  0011 3f            	dc.b	63
  74  0012               L57_SEND_ERROR:
  75  0012 bf            	dc.b	191
  76  0013 ff            	dc.b	255
  77  0014 00            	dc.b	0
  78  0015 7f            	dc.b	127
  79  0016 00            	dc.b	0
  80  0017 3f            	dc.b	63
  81  0018               L77_RECV_ERROR:
  82  0018 ff            	dc.b	255
  83  0019 ff            	dc.b	255
  84  001a 00            	dc.b	0
  85  001b 7f            	dc.b	127
  86  001c 00            	dc.b	0
  87  001d 3f            	dc.b	63
 158                     	switch	.data
 159  0000               _test:
 160  0000 0000          	dc.w	0
 161  0002               _test1:
 162  0002 00000000      	dc.l	0
 163  0006               _test2:
 164  0006 00000000      	dc.w	0,0
 165  000a               _test3:
 166  000a 00000000      	dc.w	0,0
 167  000e               _test4:
 168  000e 41200000      	dc.w	16672,0
 169  0012               _test5:
 170  0012 41200000      	dc.w	16672,0
 171  0016               _test6:
 172  0016 41200000      	dc.w	16672,0
 173  001a               _test7:
 174  001a 41200000      	dc.w	16672,0
 175  001e               _test8:
 176  001e 41200000      	dc.w	16672,0
 177  0022               _test9:
 178  0022 41200000      	dc.w	16672,0
 214                     ; 32 main()
 214                     ; 33 {
 216                     	switch	.text
 217  0000               _main:
 221                     ; 35 	InitCLK();
 223  0000 cd0000        	call	_InitCLK
 225                     ; 36 	InitSer();
 227  0003 cd0000        	call	_InitSer
 229                     ; 37 	Serial_Send_String("xd\n");
 231  0006 ae0091        	ldw	x,#L351
 232  0009 cd0000        	call	_Serial_Send_String
 234                     ; 39 	InitPwm();
 236  000c cd0000        	call	_InitPwm
 238                     ; 40 	InitISR();
 240  000f cd0000        	call	_InitISR
 242                     ; 41 	Serial_Send_String("av\n");
 244  0012 ae008d        	ldw	x,#L551
 245  0015 cd0000        	call	_Serial_Send_String
 247                     ; 42 	VaiAvanti();
 249  0018 cd0000        	call	_VaiAvanti
 251  001b               L751:
 252                     ; 44 		delay_ms(100);
 254  001b ae0064        	ldw	x,#100
 255  001e 89            	pushw	x
 256  001f ae0000        	ldw	x,#0
 257  0022 89            	pushw	x
 258  0023 cd0000        	call	_delay_ms
 260  0026 5b04          	addw	sp,#4
 261                     ; 53 		delay_ms(100);
 263  0028 ae0064        	ldw	x,#100
 264  002b 89            	pushw	x
 265  002c ae0000        	ldw	x,#0
 266  002f 89            	pushw	x
 267  0030 cd0000        	call	_delay_ms
 269  0033 5b04          	addw	sp,#4
 271  0035 20e4          	jra	L751
 312                     	switch	.const
 313  001e               L22:
 314  001e 0000c800      	dc.l	51200
 315  0022               L03:
 316  0022 ffff3800      	dc.l	-51200
 317  0026               L63:
 318  0026 0000ffff      	dc.l	65535
 319                     ; 80 long CalcPid(uint8_t N){
 320                     	switch	.text
 321  0037               _CalcPid:
 323  0037 88            	push	a
 324  0038 5208          	subw	sp,#8
 325       00000008      OFST:	set	8
 328                     ; 81 	error[N] = setpoint[N] - speed[N];
 330  003a 97            	ld	xl,a
 331  003b a604          	ld	a,#4
 332  003d 42            	mul	x,a
 333  003e 1c0000        	addw	x,#_setpoint
 334  0041 cd0000        	call	c_ltor
 336  0044 7b09          	ld	a,(OFST+1,sp)
 337  0046 97            	ld	xl,a
 338  0047 a604          	ld	a,#4
 339  0049 42            	mul	x,a
 340  004a 1c0001        	addw	x,#L52_speed
 341  004d cd0000        	call	c_fsub
 343  0050 7b09          	ld	a,(OFST+1,sp)
 344  0052 97            	ld	xl,a
 345  0053 a604          	ld	a,#4
 346  0055 42            	mul	x,a
 347  0056 1c0000        	addw	x,#_error
 348  0059 cd0000        	call	c_rtol
 350                     ; 82 	if (ABS(error[N])>0.04){
 352  005c 9c            	rvf
 353  005d 7b09          	ld	a,(OFST+1,sp)
 354  005f 97            	ld	xl,a
 355  0060 a604          	ld	a,#4
 356  0062 42            	mul	x,a
 357  0063 9093          	ldw	y,x
 358  0065 de0002        	ldw	x,(_error+2,x)
 359  0068 89            	pushw	x
 360  0069 93            	ldw	x,y
 361  006a de0000        	ldw	x,(_error,x)
 362  006d 89            	pushw	x
 363  006e cd0000        	call	_ABS
 365  0071 9c            	rvf
 366  0072 5b04          	addw	sp,#4
 367  0074 ae0089        	ldw	x,#L502
 368  0077 cd0000        	call	c_fcmp
 370  007a 2c03          	jrsgt	L64
 371  007c cc02ee        	jp	L771
 372  007f               L64:
 373                     ; 83 		integral[N] += error[N]*0.002;									//0.002 -> dt 
 375  007f 7b09          	ld	a,(OFST+1,sp)
 376  0081 97            	ld	xl,a
 377  0082 a604          	ld	a,#4
 378  0084 42            	mul	x,a
 379  0085 1c0000        	addw	x,#_error
 380  0088 cd0000        	call	c_ltor
 382  008b ae0085        	ldw	x,#L512
 383  008e cd0000        	call	c_fmul
 385  0091 7b09          	ld	a,(OFST+1,sp)
 386  0093 97            	ld	xl,a
 387  0094 a604          	ld	a,#4
 388  0096 42            	mul	x,a
 389  0097 1c0000        	addw	x,#_integral
 390  009a cd0000        	call	c_fgadd
 392                     ; 84 		integral[N] = integral[N] > limI ? limI : integral[N] < -limI ? -limI : integral[N];
 394  009d 9c            	rvf
 395  009e a6c0          	ld	a,#192
 396  00a0 cd0000        	call	c_ctof
 398  00a3 96            	ldw	x,sp
 399  00a4 1c0005        	addw	x,#OFST-3
 400  00a7 cd0000        	call	c_rtol
 403  00aa 7b09          	ld	a,(OFST+1,sp)
 404  00ac 97            	ld	xl,a
 405  00ad a604          	ld	a,#4
 406  00af 42            	mul	x,a
 407  00b0 1c0000        	addw	x,#_integral
 408  00b3 cd0000        	call	c_ltor
 410  00b6 96            	ldw	x,sp
 411  00b7 1c0005        	addw	x,#OFST-3
 412  00ba cd0000        	call	c_fcmp
 414  00bd 2d08          	jrsle	L01
 415  00bf ae00c0        	ldw	x,#192
 416  00c2 cd0000        	call	c_itof
 418  00c5 2037          	jra	L21
 419  00c7               L01:
 420  00c7 9c            	rvf
 421  00c8 aeff40        	ldw	x,#65344
 422  00cb cd0000        	call	c_itof
 424  00ce 96            	ldw	x,sp
 425  00cf 1c0005        	addw	x,#OFST-3
 426  00d2 cd0000        	call	c_rtol
 429  00d5 7b09          	ld	a,(OFST+1,sp)
 430  00d7 97            	ld	xl,a
 431  00d8 a604          	ld	a,#4
 432  00da 42            	mul	x,a
 433  00db 1c0000        	addw	x,#_integral
 434  00de cd0000        	call	c_ltor
 436  00e1 96            	ldw	x,sp
 437  00e2 1c0005        	addw	x,#OFST-3
 438  00e5 cd0000        	call	c_fcmp
 440  00e8 2e08          	jrsge	L41
 441  00ea aeff40        	ldw	x,#65344
 442  00ed cd0000        	call	c_itof
 444  00f0 200c          	jra	L61
 445  00f2               L41:
 446  00f2 7b09          	ld	a,(OFST+1,sp)
 447  00f4 97            	ld	xl,a
 448  00f5 a604          	ld	a,#4
 449  00f7 42            	mul	x,a
 450  00f8 1c0000        	addw	x,#_integral
 451  00fb cd0000        	call	c_ltor
 453  00fe               L61:
 454  00fe               L21:
 455  00fe 7b09          	ld	a,(OFST+1,sp)
 456  0100 97            	ld	xl,a
 457  0101 a604          	ld	a,#4
 458  0103 42            	mul	x,a
 459  0104 1c0000        	addw	x,#_integral
 460  0107 cd0000        	call	c_rtol
 462                     ; 85 		proportional[N] = error[N]*Kp;
 464  010a 7b09          	ld	a,(OFST+1,sp)
 465  010c 97            	ld	xl,a
 466  010d a604          	ld	a,#4
 467  010f 42            	mul	x,a
 468  0110 1c0000        	addw	x,#_error
 469  0113 cd0000        	call	c_ltor
 471  0116 ae0081        	ldw	x,#L522
 472  0119 cd0000        	call	c_fmul
 474  011c 7b09          	ld	a,(OFST+1,sp)
 475  011e 97            	ld	xl,a
 476  011f a604          	ld	a,#4
 477  0121 42            	mul	x,a
 478  0122 1c0000        	addw	x,#_proportional
 479  0125 cd0000        	call	c_rtol
 481                     ; 86 		proportional[N] = proportional[N] > limP ? limP : proportional[N] < -limP ? -limP : proportional[N];
 483  0128 9c            	rvf
 484  0129 aec800        	ldw	x,#51200
 485  012c cd0000        	call	c_uitof
 487  012f 96            	ldw	x,sp
 488  0130 1c0005        	addw	x,#OFST-3
 489  0133 cd0000        	call	c_rtol
 492  0136 7b09          	ld	a,(OFST+1,sp)
 493  0138 97            	ld	xl,a
 494  0139 a604          	ld	a,#4
 495  013b 42            	mul	x,a
 496  013c 1c0000        	addw	x,#_proportional
 497  013f cd0000        	call	c_ltor
 499  0142 96            	ldw	x,sp
 500  0143 1c0005        	addw	x,#OFST-3
 501  0146 cd0000        	call	c_fcmp
 503  0149 2d0b          	jrsle	L02
 504  014b ae001e        	ldw	x,#L22
 505  014e cd0000        	call	c_ltor
 507  0151 cd0000        	call	c_ltof
 509  0154 2041          	jra	L42
 510  0156               L02:
 511  0156 9c            	rvf
 512  0157 ae3800        	ldw	x,#14336
 513  015a bf02          	ldw	c_lreg+2,x
 514  015c aeffff        	ldw	x,#-1
 515  015f bf00          	ldw	c_lreg,x
 516  0161 cd0000        	call	c_ltof
 518  0164 96            	ldw	x,sp
 519  0165 1c0005        	addw	x,#OFST-3
 520  0168 cd0000        	call	c_rtol
 523  016b 7b09          	ld	a,(OFST+1,sp)
 524  016d 97            	ld	xl,a
 525  016e a604          	ld	a,#4
 526  0170 42            	mul	x,a
 527  0171 1c0000        	addw	x,#_proportional
 528  0174 cd0000        	call	c_ltor
 530  0177 96            	ldw	x,sp
 531  0178 1c0005        	addw	x,#OFST-3
 532  017b cd0000        	call	c_fcmp
 534  017e 2e0b          	jrsge	L62
 535  0180 ae0022        	ldw	x,#L03
 536  0183 cd0000        	call	c_ltor
 538  0186 cd0000        	call	c_ltof
 540  0189 200c          	jra	L23
 541  018b               L62:
 542  018b 7b09          	ld	a,(OFST+1,sp)
 543  018d 97            	ld	xl,a
 544  018e a604          	ld	a,#4
 545  0190 42            	mul	x,a
 546  0191 1c0000        	addw	x,#_proportional
 547  0194 cd0000        	call	c_ltor
 549  0197               L23:
 550  0197               L42:
 551  0197 7b09          	ld	a,(OFST+1,sp)
 552  0199 97            	ld	xl,a
 553  019a a604          	ld	a,#4
 554  019c 42            	mul	x,a
 555  019d 1c0000        	addw	x,#_proportional
 556  01a0 cd0000        	call	c_rtol
 558                     ; 87 		derivative[N] = (error[N] - old_error[N])/0.002;
 560  01a3 7b09          	ld	a,(OFST+1,sp)
 561  01a5 97            	ld	xl,a
 562  01a6 a604          	ld	a,#4
 563  01a8 42            	mul	x,a
 564  01a9 1c0000        	addw	x,#_error
 565  01ac cd0000        	call	c_ltor
 567  01af 7b09          	ld	a,(OFST+1,sp)
 568  01b1 97            	ld	xl,a
 569  01b2 a604          	ld	a,#4
 570  01b4 42            	mul	x,a
 571  01b5 1c0000        	addw	x,#_old_error
 572  01b8 cd0000        	call	c_fsub
 574  01bb ae0085        	ldw	x,#L512
 575  01be cd0000        	call	c_fdiv
 577  01c1 7b09          	ld	a,(OFST+1,sp)
 578  01c3 97            	ld	xl,a
 579  01c4 a604          	ld	a,#4
 580  01c6 42            	mul	x,a
 581  01c7 1c0000        	addw	x,#_derivative
 582  01ca cd0000        	call	c_rtol
 584                     ; 88 		duty[N] = (proportional[N] + integral[N]*Ki + derivative[N]*Kd)>65535?65535: \
 584                     ; 89 							(proportional[N] + integral[N]*Ki + derivative[N]*Kd)<0?0: \
 584                     ; 90 							(uint16_t)(proportional[N] + integral[N]*Ki + derivative[N]*Kd);									
 586  01cd 9c            	rvf
 587  01ce aeffff        	ldw	x,#65535
 588  01d1 cd0000        	call	c_uitof
 590  01d4 96            	ldw	x,sp
 591  01d5 1c0005        	addw	x,#OFST-3
 592  01d8 cd0000        	call	c_rtol
 595  01db 7b09          	ld	a,(OFST+1,sp)
 596  01dd 97            	ld	xl,a
 597  01de a604          	ld	a,#4
 598  01e0 42            	mul	x,a
 599  01e1 1c0000        	addw	x,#_derivative
 600  01e4 cd0000        	call	c_ltor
 602  01e7 ae0079        	ldw	x,#L542
 603  01ea cd0000        	call	c_fmul
 605  01ed 96            	ldw	x,sp
 606  01ee 1c0001        	addw	x,#OFST-7
 607  01f1 cd0000        	call	c_rtol
 610  01f4 7b09          	ld	a,(OFST+1,sp)
 611  01f6 97            	ld	xl,a
 612  01f7 a604          	ld	a,#4
 613  01f9 42            	mul	x,a
 614  01fa 1c0000        	addw	x,#_integral
 615  01fd cd0000        	call	c_ltor
 617  0200 ae007d        	ldw	x,#L532
 618  0203 cd0000        	call	c_fmul
 620  0206 7b09          	ld	a,(OFST+1,sp)
 621  0208 97            	ld	xl,a
 622  0209 a604          	ld	a,#4
 623  020b 42            	mul	x,a
 624  020c 1c0000        	addw	x,#_proportional
 625  020f cd0000        	call	c_fadd
 627  0212 96            	ldw	x,sp
 628  0213 1c0001        	addw	x,#OFST-7
 629  0216 cd0000        	call	c_fadd
 631  0219 96            	ldw	x,sp
 632  021a 1c0005        	addw	x,#OFST-3
 633  021d cd0000        	call	c_fcmp
 635  0220 2d09          	jrsle	L43
 636  0222 ae0026        	ldw	x,#L63
 637  0225 cd0000        	call	c_ltor
 639  0228 cc02b6        	jp	L04
 640  022b               L43:
 641  022b 9c            	rvf
 642  022c 7b09          	ld	a,(OFST+1,sp)
 643  022e 97            	ld	xl,a
 644  022f a604          	ld	a,#4
 645  0231 42            	mul	x,a
 646  0232 1c0000        	addw	x,#_derivative
 647  0235 cd0000        	call	c_ltor
 649  0238 ae0079        	ldw	x,#L542
 650  023b cd0000        	call	c_fmul
 652  023e 96            	ldw	x,sp
 653  023f 1c0005        	addw	x,#OFST-3
 654  0242 cd0000        	call	c_rtol
 657  0245 7b09          	ld	a,(OFST+1,sp)
 658  0247 97            	ld	xl,a
 659  0248 a604          	ld	a,#4
 660  024a 42            	mul	x,a
 661  024b 1c0000        	addw	x,#_integral
 662  024e cd0000        	call	c_ltor
 664  0251 ae007d        	ldw	x,#L532
 665  0254 cd0000        	call	c_fmul
 667  0257 7b09          	ld	a,(OFST+1,sp)
 668  0259 97            	ld	xl,a
 669  025a a604          	ld	a,#4
 670  025c 42            	mul	x,a
 671  025d 1c0000        	addw	x,#_proportional
 672  0260 cd0000        	call	c_fadd
 674  0263 96            	ldw	x,sp
 675  0264 1c0005        	addw	x,#OFST-3
 676  0267 cd0000        	call	c_fadd
 678  026a 9c            	rvf
 679  026b 3d00          	tnz	c_lreg
 680  026d 2e03          	jrsge	L24
 681  026f 5f            	clrw	x
 682  0270 2041          	jra	L44
 683  0272               L24:
 684  0272 7b09          	ld	a,(OFST+1,sp)
 685  0274 97            	ld	xl,a
 686  0275 a604          	ld	a,#4
 687  0277 42            	mul	x,a
 688  0278 1c0000        	addw	x,#_derivative
 689  027b cd0000        	call	c_ltor
 691  027e ae0079        	ldw	x,#L542
 692  0281 cd0000        	call	c_fmul
 694  0284 96            	ldw	x,sp
 695  0285 1c0005        	addw	x,#OFST-3
 696  0288 cd0000        	call	c_rtol
 699  028b 7b09          	ld	a,(OFST+1,sp)
 700  028d 97            	ld	xl,a
 701  028e a604          	ld	a,#4
 702  0290 42            	mul	x,a
 703  0291 1c0000        	addw	x,#_integral
 704  0294 cd0000        	call	c_ltor
 706  0297 ae007d        	ldw	x,#L532
 707  029a cd0000        	call	c_fmul
 709  029d 7b09          	ld	a,(OFST+1,sp)
 710  029f 97            	ld	xl,a
 711  02a0 a604          	ld	a,#4
 712  02a2 42            	mul	x,a
 713  02a3 1c0000        	addw	x,#_proportional
 714  02a6 cd0000        	call	c_fadd
 716  02a9 96            	ldw	x,sp
 717  02aa 1c0005        	addw	x,#OFST-3
 718  02ad cd0000        	call	c_fadd
 720  02b0 cd0000        	call	c_ftoi
 722  02b3               L44:
 723  02b3 cd0000        	call	c_uitolx
 725  02b6               L04:
 726  02b6 7b09          	ld	a,(OFST+1,sp)
 727  02b8 97            	ld	xl,a
 728  02b9 a604          	ld	a,#4
 729  02bb 42            	mul	x,a
 730  02bc 1c0000        	addw	x,#_duty
 731  02bf cd0000        	call	c_rtol
 733                     ; 91 		old_error[N] = error[N];
 735  02c2 7b09          	ld	a,(OFST+1,sp)
 736  02c4 97            	ld	xl,a
 737  02c5 a604          	ld	a,#4
 738  02c7 42            	mul	x,a
 739  02c8 7b09          	ld	a,(OFST+1,sp)
 740  02ca 905f          	clrw	y
 741  02cc 9097          	ld	yl,a
 742  02ce 9058          	sllw	y
 743  02d0 9058          	sllw	y
 744  02d2 d60003        	ld	a,(_error+3,x)
 745  02d5 90d70003      	ld	(_old_error+3,y),a
 746  02d9 d60002        	ld	a,(_error+2,x)
 747  02dc 90d70002      	ld	(_old_error+2,y),a
 748  02e0 d60001        	ld	a,(_error+1,x)
 749  02e3 90d70001      	ld	(_old_error+1,y),a
 750  02e7 d60000        	ld	a,(_error,x)
 751  02ea 90d70000      	ld	(_old_error,y),a
 752  02ee               L771:
 753                     ; 93 	return duty[N];
 755  02ee 7b09          	ld	a,(OFST+1,sp)
 756  02f0 97            	ld	xl,a
 757  02f1 a604          	ld	a,#4
 758  02f3 42            	mul	x,a
 759  02f4 1c0000        	addw	x,#_duty
 760  02f7 cd0000        	call	c_ltor
 764  02fa 5b09          	addw	sp,#9
 765  02fc 81            	ret
 800                     	switch	.const
 801  002a               L25:
 802  002a 000003de      	dc.l	990
 803                     ; 102 @svlreg @far @interrupt void ISR_MOT0(void){ //PE3
 804                     	scross	on
 805                     	switch	.text
 806  02fd               f_ISR_MOT0:
 808  02fd 8a            	push	cc
 809  02fe 84            	pop	a
 810  02ff a4bf          	and	a,#191
 811  0301 88            	push	a
 812  0302 86            	pop	cc
 813       0000000c      OFST:	set	12
 814  0303 3b0002        	push	c_x+2
 815  0306 be00          	ldw	x,c_x
 816  0308 89            	pushw	x
 817  0309 3b0002        	push	c_y+2
 818  030c be00          	ldw	x,c_y
 819  030e 89            	pushw	x
 820  030f be02          	ldw	x,c_lreg+2
 821  0311 89            	pushw	x
 822  0312 be00          	ldw	x,c_lreg
 823  0314 89            	pushw	x
 824  0315 520c          	subw	sp,#12
 827                     ; 103 		Serial_Send_String("caio\n");
 829  0317 ae0073        	ldw	x,#L162
 830  031a cd0000        	call	_Serial_Send_String
 832                     ; 104 		imptemp[0]++;
 834  031d ae0000        	ldw	x,#_imptemp
 835  0320 a601          	ld	a,#1
 836  0322 cd0000        	call	c_lgadc
 838                     ; 105 		tImp[0] = TIM2_GetCounter();
 840  0325 cd0000        	call	_TIM2_GetCounter
 842  0328 cd0000        	call	c_uitolx
 844  032b ae0055        	ldw	x,#L7_tImp
 845  032e cd0000        	call	c_rtol
 847                     ; 106 		topRaggiuntiProv[0] = topRaggiunti;
 849  0331 ce0013        	ldw	x,L12_topRaggiunti+2
 850  0334 cf0027        	ldw	L51_topRaggiuntiProv+2,x
 851  0337 ce0011        	ldw	x,L12_topRaggiunti
 852  033a cf0025        	ldw	L51_topRaggiuntiProv,x
 853                     ; 107 		if(topRaggiuntiProv[0] == vTopRaggiunti[0]) difftImp[0] = tImp[0] - vtImp[0];
 855  033d ae0025        	ldw	x,#L51_topRaggiuntiProv
 856  0340 cd0000        	call	c_ltor
 858  0343 ae0015        	ldw	x,#L71_vTopRaggiunti
 859  0346 cd0000        	call	c_lcmp
 861  0349 2614          	jrne	L362
 864  034b ae0055        	ldw	x,#L7_tImp
 865  034e cd0000        	call	c_ltor
 867  0351 ae0035        	ldw	x,#L31_vtImp
 868  0354 cd0000        	call	c_lsub
 870  0357 ae0045        	ldw	x,#L11_difftImp
 871  035a cd0000        	call	c_rtol
 874  035d 2042          	jra	L562
 875  035f               L362:
 876                     ; 108 		else difftImp[0] = (65535 - vtImp[0]) + (tImp[0]) + ((topRaggiuntiProv[0]-vTopRaggiunti[0]-1)*0xFFFF);
 878  035f ae0025        	ldw	x,#L51_topRaggiuntiProv
 879  0362 cd0000        	call	c_ltor
 881  0365 ae0015        	ldw	x,#L71_vTopRaggiunti
 882  0368 cd0000        	call	c_lsub
 884  036b ae0026        	ldw	x,#L63
 885  036e cd0000        	call	c_lmul
 887  0371 ae0026        	ldw	x,#L63
 888  0374 cd0000        	call	c_lsub
 890  0377 96            	ldw	x,sp
 891  0378 1c0009        	addw	x,#OFST-3
 892  037b cd0000        	call	c_rtol
 895  037e aeffff        	ldw	x,#65535
 896  0381 bf02          	ldw	c_lreg+2,x
 897  0383 ae0000        	ldw	x,#0
 898  0386 bf00          	ldw	c_lreg,x
 899  0388 ae0035        	ldw	x,#L31_vtImp
 900  038b cd0000        	call	c_lsub
 902  038e ae0055        	ldw	x,#L7_tImp
 903  0391 cd0000        	call	c_ladd
 905  0394 96            	ldw	x,sp
 906  0395 1c0009        	addw	x,#OFST-3
 907  0398 cd0000        	call	c_ladd
 909  039b ae0045        	ldw	x,#L11_difftImp
 910  039e cd0000        	call	c_rtol
 912  03a1               L562:
 913                     ; 109 		if(ABS(speed[0]-(double) 16000000 / (990*difftImp[0]))<1){
 915  03a1 9c            	rvf
 916  03a2 a601          	ld	a,#1
 917  03a4 cd0000        	call	c_ctof
 919  03a7 96            	ldw	x,sp
 920  03a8 1c0009        	addw	x,#OFST-3
 921  03ab cd0000        	call	c_rtol
 924  03ae ae0045        	ldw	x,#L11_difftImp
 925  03b1 cd0000        	call	c_ltor
 927  03b4 ae002a        	ldw	x,#L25
 928  03b7 cd0000        	call	c_lmul
 930  03ba cd0000        	call	c_ltof
 932  03bd 96            	ldw	x,sp
 933  03be 1c0005        	addw	x,#OFST-7
 934  03c1 cd0000        	call	c_rtol
 937  03c4 ae006f        	ldw	x,#L572
 938  03c7 cd0000        	call	c_ltor
 940  03ca 96            	ldw	x,sp
 941  03cb 1c0005        	addw	x,#OFST-7
 942  03ce cd0000        	call	c_fdiv
 944  03d1 96            	ldw	x,sp
 945  03d2 1c0001        	addw	x,#OFST-11
 946  03d5 cd0000        	call	c_rtol
 949  03d8 ae0001        	ldw	x,#L52_speed
 950  03db cd0000        	call	c_ltor
 952  03de 96            	ldw	x,sp
 953  03df 1c0001        	addw	x,#OFST-11
 954  03e2 cd0000        	call	c_fsub
 956  03e5 be02          	ldw	x,c_lreg+2
 957  03e7 89            	pushw	x
 958  03e8 be00          	ldw	x,c_lreg
 959  03ea 89            	pushw	x
 960  03eb cd0000        	call	_ABS
 962  03ee 9c            	rvf
 963  03ef 5b04          	addw	sp,#4
 964  03f1 96            	ldw	x,sp
 965  03f2 1c0009        	addw	x,#OFST-3
 966  03f5 cd0000        	call	c_fcmp
 968  03f8 2e35          	jrsge	L762
 969                     ; 110 			test2 = speed[0] = (double) 16000000 / (990*difftImp[0]);
 971  03fa ae0045        	ldw	x,#L11_difftImp
 972  03fd cd0000        	call	c_ltor
 974  0400 ae002a        	ldw	x,#L25
 975  0403 cd0000        	call	c_lmul
 977  0406 cd0000        	call	c_ltof
 979  0409 96            	ldw	x,sp
 980  040a 1c0009        	addw	x,#OFST-3
 981  040d cd0000        	call	c_rtol
 984  0410 ae006f        	ldw	x,#L572
 985  0413 cd0000        	call	c_ltor
 987  0416 96            	ldw	x,sp
 988  0417 1c0009        	addw	x,#OFST-3
 989  041a cd0000        	call	c_fdiv
 991  041d ae0001        	ldw	x,#L52_speed
 992  0420 cd0000        	call	c_rtol
 994  0423 ce0003        	ldw	x,L52_speed+2
 995  0426 cf0008        	ldw	_test2+2,x
 996  0429 ce0001        	ldw	x,L52_speed
 997  042c cf0006        	ldw	_test2,x
 998  042f               L762:
 999                     ; 113 		vtImp[0] = tImp[0];
1001  042f ce0057        	ldw	x,L7_tImp+2
1002  0432 cf0037        	ldw	L31_vtImp+2,x
1003  0435 ce0055        	ldw	x,L7_tImp
1004  0438 cf0035        	ldw	L31_vtImp,x
1005                     ; 114 		vTopRaggiunti[0] = topRaggiuntiProv[0];
1007  043b ce0027        	ldw	x,L51_topRaggiuntiProv+2
1008  043e cf0017        	ldw	L71_vTopRaggiunti+2,x
1009  0441 ce0025        	ldw	x,L51_topRaggiuntiProv
1010  0444 cf0015        	ldw	L71_vTopRaggiunti,x
1011                     ; 116 	}
1014  0447 5b0c          	addw	sp,#12
1015  0449 85            	popw	x
1016  044a bf00          	ldw	c_lreg,x
1017  044c 85            	popw	x
1018  044d bf02          	ldw	c_lreg+2,x
1019  044f 85            	popw	x
1020  0450 bf00          	ldw	c_y,x
1021  0452 320002        	pop	c_y+2
1022  0455 85            	popw	x
1023  0456 bf00          	ldw	c_x,x
1024  0458 320002        	pop	c_x+2
1025  045b 80            	iret
1058                     ; 117 	@svlreg @far @interrupt void ISR_MOT1(void){ //PD4
1059                     	switch	.text
1060  045c               f_ISR_MOT1:
1062  045c 8a            	push	cc
1063  045d 84            	pop	a
1064  045e a4bf          	and	a,#191
1065  0460 88            	push	a
1066  0461 86            	pop	cc
1067       0000000c      OFST:	set	12
1068  0462 3b0002        	push	c_x+2
1069  0465 be00          	ldw	x,c_x
1070  0467 89            	pushw	x
1071  0468 3b0002        	push	c_y+2
1072  046b be00          	ldw	x,c_y
1073  046d 89            	pushw	x
1074  046e be02          	ldw	x,c_lreg+2
1075  0470 89            	pushw	x
1076  0471 be00          	ldw	x,c_lreg
1077  0473 89            	pushw	x
1078  0474 520c          	subw	sp,#12
1081                     ; 118 		imptemp[1]++;
1083  0476 ae0004        	ldw	x,#_imptemp+4
1084  0479 a601          	ld	a,#1
1085  047b cd0000        	call	c_lgadc
1087                     ; 119 		tImp[1] = TIM2_GetCounter();
1089  047e cd0000        	call	_TIM2_GetCounter
1091  0481 cd0000        	call	c_uitolx
1093  0484 ae0059        	ldw	x,#L7_tImp+4
1094  0487 cd0000        	call	c_rtol
1096                     ; 120 		topRaggiuntiProv[1] = topRaggiunti;
1098  048a ce0013        	ldw	x,L12_topRaggiunti+2
1099  048d cf002b        	ldw	L51_topRaggiuntiProv+6,x
1100  0490 ce0011        	ldw	x,L12_topRaggiunti
1101  0493 cf0029        	ldw	L51_topRaggiuntiProv+4,x
1102                     ; 121 		if(topRaggiuntiProv[1] == vTopRaggiunti[1]) difftImp[1] = tImp[1] - vtImp[1];
1104  0496 ae0029        	ldw	x,#L51_topRaggiuntiProv+4
1105  0499 cd0000        	call	c_ltor
1107  049c ae0019        	ldw	x,#L71_vTopRaggiunti+4
1108  049f cd0000        	call	c_lcmp
1110  04a2 2614          	jrne	L113
1113  04a4 ae0059        	ldw	x,#L7_tImp+4
1114  04a7 cd0000        	call	c_ltor
1116  04aa ae0039        	ldw	x,#L31_vtImp+4
1117  04ad cd0000        	call	c_lsub
1119  04b0 ae0049        	ldw	x,#L11_difftImp+4
1120  04b3 cd0000        	call	c_rtol
1123  04b6 2042          	jra	L313
1124  04b8               L113:
1125                     ; 122 		else difftImp[1] = (65535 - vtImp[1]) + (tImp[1]) + ((topRaggiuntiProv[1]-vTopRaggiunti[1]-1)*0xFFFF);
1127  04b8 ae0029        	ldw	x,#L51_topRaggiuntiProv+4
1128  04bb cd0000        	call	c_ltor
1130  04be ae0019        	ldw	x,#L71_vTopRaggiunti+4
1131  04c1 cd0000        	call	c_lsub
1133  04c4 ae0026        	ldw	x,#L63
1134  04c7 cd0000        	call	c_lmul
1136  04ca ae0026        	ldw	x,#L63
1137  04cd cd0000        	call	c_lsub
1139  04d0 96            	ldw	x,sp
1140  04d1 1c0009        	addw	x,#OFST-3
1141  04d4 cd0000        	call	c_rtol
1144  04d7 aeffff        	ldw	x,#65535
1145  04da bf02          	ldw	c_lreg+2,x
1146  04dc ae0000        	ldw	x,#0
1147  04df bf00          	ldw	c_lreg,x
1148  04e1 ae0039        	ldw	x,#L31_vtImp+4
1149  04e4 cd0000        	call	c_lsub
1151  04e7 ae0059        	ldw	x,#L7_tImp+4
1152  04ea cd0000        	call	c_ladd
1154  04ed 96            	ldw	x,sp
1155  04ee 1c0009        	addw	x,#OFST-3
1156  04f1 cd0000        	call	c_ladd
1158  04f4 ae0049        	ldw	x,#L11_difftImp+4
1159  04f7 cd0000        	call	c_rtol
1161  04fa               L313:
1162                     ; 124 		if(ABS(speed[1]-(double) 16000000 / (990*difftImp[1]))<1){
1164  04fa 9c            	rvf
1165  04fb a601          	ld	a,#1
1166  04fd cd0000        	call	c_ctof
1168  0500 96            	ldw	x,sp
1169  0501 1c0009        	addw	x,#OFST-3
1170  0504 cd0000        	call	c_rtol
1173  0507 ae0049        	ldw	x,#L11_difftImp+4
1174  050a cd0000        	call	c_ltor
1176  050d ae002a        	ldw	x,#L25
1177  0510 cd0000        	call	c_lmul
1179  0513 cd0000        	call	c_ltof
1181  0516 96            	ldw	x,sp
1182  0517 1c0005        	addw	x,#OFST-7
1183  051a cd0000        	call	c_rtol
1186  051d ae006f        	ldw	x,#L572
1187  0520 cd0000        	call	c_ltor
1189  0523 96            	ldw	x,sp
1190  0524 1c0005        	addw	x,#OFST-7
1191  0527 cd0000        	call	c_fdiv
1193  052a 96            	ldw	x,sp
1194  052b 1c0001        	addw	x,#OFST-11
1195  052e cd0000        	call	c_rtol
1198  0531 ae0005        	ldw	x,#L52_speed+4
1199  0534 cd0000        	call	c_ltor
1201  0537 96            	ldw	x,sp
1202  0538 1c0001        	addw	x,#OFST-11
1203  053b cd0000        	call	c_fsub
1205  053e be02          	ldw	x,c_lreg+2
1206  0540 89            	pushw	x
1207  0541 be00          	ldw	x,c_lreg
1208  0543 89            	pushw	x
1209  0544 cd0000        	call	_ABS
1211  0547 9c            	rvf
1212  0548 5b04          	addw	sp,#4
1213  054a 96            	ldw	x,sp
1214  054b 1c0009        	addw	x,#OFST-3
1215  054e cd0000        	call	c_fcmp
1217  0551 2e35          	jrsge	L513
1218                     ; 125 			test3 = speed[1] = (double) 16000000 / (990*difftImp[1]);
1220  0553 ae0049        	ldw	x,#L11_difftImp+4
1221  0556 cd0000        	call	c_ltor
1223  0559 ae002a        	ldw	x,#L25
1224  055c cd0000        	call	c_lmul
1226  055f cd0000        	call	c_ltof
1228  0562 96            	ldw	x,sp
1229  0563 1c0009        	addw	x,#OFST-3
1230  0566 cd0000        	call	c_rtol
1233  0569 ae006f        	ldw	x,#L572
1234  056c cd0000        	call	c_ltor
1236  056f 96            	ldw	x,sp
1237  0570 1c0009        	addw	x,#OFST-3
1238  0573 cd0000        	call	c_fdiv
1240  0576 ae0005        	ldw	x,#L52_speed+4
1241  0579 cd0000        	call	c_rtol
1243  057c ce0007        	ldw	x,L52_speed+6
1244  057f cf000c        	ldw	_test3+2,x
1245  0582 ce0005        	ldw	x,L52_speed+4
1246  0585 cf000a        	ldw	_test3,x
1247  0588               L513:
1248                     ; 128 		vtImp[1] = tImp[1];
1250  0588 ce005b        	ldw	x,L7_tImp+6
1251  058b cf003b        	ldw	L31_vtImp+6,x
1252  058e ce0059        	ldw	x,L7_tImp+4
1253  0591 cf0039        	ldw	L31_vtImp+4,x
1254                     ; 129 		vTopRaggiunti[1] = topRaggiuntiProv[1];
1256  0594 ce002b        	ldw	x,L51_topRaggiuntiProv+6
1257  0597 cf001b        	ldw	L71_vTopRaggiunti+6,x
1258  059a ce0029        	ldw	x,L51_topRaggiuntiProv+4
1259  059d cf0019        	ldw	L71_vTopRaggiunti+4,x
1260                     ; 131 	}
1263  05a0 5b0c          	addw	sp,#12
1264  05a2 85            	popw	x
1265  05a3 bf00          	ldw	c_lreg,x
1266  05a5 85            	popw	x
1267  05a6 bf02          	ldw	c_lreg+2,x
1268  05a8 85            	popw	x
1269  05a9 bf00          	ldw	c_y,x
1270  05ab 320002        	pop	c_y+2
1271  05ae 85            	popw	x
1272  05af bf00          	ldw	c_x,x
1273  05b1 320002        	pop	c_x+2
1274  05b4 80            	iret
1307                     ; 132 	@svlreg @far @interrupt void ISR_MOT2(void){ //PC5
1308                     	switch	.text
1309  05b5               f_ISR_MOT2:
1311  05b5 8a            	push	cc
1312  05b6 84            	pop	a
1313  05b7 a4bf          	and	a,#191
1314  05b9 88            	push	a
1315  05ba 86            	pop	cc
1316       0000000c      OFST:	set	12
1317  05bb 3b0002        	push	c_x+2
1318  05be be00          	ldw	x,c_x
1319  05c0 89            	pushw	x
1320  05c1 3b0002        	push	c_y+2
1321  05c4 be00          	ldw	x,c_y
1322  05c6 89            	pushw	x
1323  05c7 be02          	ldw	x,c_lreg+2
1324  05c9 89            	pushw	x
1325  05ca be00          	ldw	x,c_lreg
1326  05cc 89            	pushw	x
1327  05cd 520c          	subw	sp,#12
1330                     ; 133 		imptemp[2]++;
1332  05cf ae0008        	ldw	x,#_imptemp+8
1333  05d2 a601          	ld	a,#1
1334  05d4 cd0000        	call	c_lgadc
1336                     ; 134 		tImp[2] = TIM2_GetCounter();
1338  05d7 cd0000        	call	_TIM2_GetCounter
1340  05da cd0000        	call	c_uitolx
1342  05dd ae005d        	ldw	x,#L7_tImp+8
1343  05e0 cd0000        	call	c_rtol
1345                     ; 135 		topRaggiuntiProv[2] = topRaggiunti;
1347  05e3 ce0013        	ldw	x,L12_topRaggiunti+2
1348  05e6 cf002f        	ldw	L51_topRaggiuntiProv+10,x
1349  05e9 ce0011        	ldw	x,L12_topRaggiunti
1350  05ec cf002d        	ldw	L51_topRaggiuntiProv+8,x
1351                     ; 136 		if(topRaggiuntiProv[2] == vTopRaggiunti[2]) difftImp[2] = tImp[2] - vtImp[2]; 
1353  05ef ae002d        	ldw	x,#L51_topRaggiuntiProv+8
1354  05f2 cd0000        	call	c_ltor
1356  05f5 ae001d        	ldw	x,#L71_vTopRaggiunti+8
1357  05f8 cd0000        	call	c_lcmp
1359  05fb 2614          	jrne	L723
1362  05fd ae005d        	ldw	x,#L7_tImp+8
1363  0600 cd0000        	call	c_ltor
1365  0603 ae003d        	ldw	x,#L31_vtImp+8
1366  0606 cd0000        	call	c_lsub
1368  0609 ae004d        	ldw	x,#L11_difftImp+8
1369  060c cd0000        	call	c_rtol
1372  060f 2042          	jra	L133
1373  0611               L723:
1374                     ; 137 		else difftImp[2] = (65535 - vtImp[2]) + (tImp[2]) + ((topRaggiuntiProv[2]-vTopRaggiunti[2]-1)*0xFFFF);
1376  0611 ae002d        	ldw	x,#L51_topRaggiuntiProv+8
1377  0614 cd0000        	call	c_ltor
1379  0617 ae001d        	ldw	x,#L71_vTopRaggiunti+8
1380  061a cd0000        	call	c_lsub
1382  061d ae0026        	ldw	x,#L63
1383  0620 cd0000        	call	c_lmul
1385  0623 ae0026        	ldw	x,#L63
1386  0626 cd0000        	call	c_lsub
1388  0629 96            	ldw	x,sp
1389  062a 1c0009        	addw	x,#OFST-3
1390  062d cd0000        	call	c_rtol
1393  0630 aeffff        	ldw	x,#65535
1394  0633 bf02          	ldw	c_lreg+2,x
1395  0635 ae0000        	ldw	x,#0
1396  0638 bf00          	ldw	c_lreg,x
1397  063a ae003d        	ldw	x,#L31_vtImp+8
1398  063d cd0000        	call	c_lsub
1400  0640 ae005d        	ldw	x,#L7_tImp+8
1401  0643 cd0000        	call	c_ladd
1403  0646 96            	ldw	x,sp
1404  0647 1c0009        	addw	x,#OFST-3
1405  064a cd0000        	call	c_ladd
1407  064d ae004d        	ldw	x,#L11_difftImp+8
1408  0650 cd0000        	call	c_rtol
1410  0653               L133:
1411                     ; 139 		if(ABS(speed[2]-(double) 16000000 / (990*difftImp[2]))<1){
1413  0653 9c            	rvf
1414  0654 a601          	ld	a,#1
1415  0656 cd0000        	call	c_ctof
1417  0659 96            	ldw	x,sp
1418  065a 1c0009        	addw	x,#OFST-3
1419  065d cd0000        	call	c_rtol
1422  0660 ae004d        	ldw	x,#L11_difftImp+8
1423  0663 cd0000        	call	c_ltor
1425  0666 ae002a        	ldw	x,#L25
1426  0669 cd0000        	call	c_lmul
1428  066c cd0000        	call	c_ltof
1430  066f 96            	ldw	x,sp
1431  0670 1c0005        	addw	x,#OFST-7
1432  0673 cd0000        	call	c_rtol
1435  0676 ae006f        	ldw	x,#L572
1436  0679 cd0000        	call	c_ltor
1438  067c 96            	ldw	x,sp
1439  067d 1c0005        	addw	x,#OFST-7
1440  0680 cd0000        	call	c_fdiv
1442  0683 96            	ldw	x,sp
1443  0684 1c0001        	addw	x,#OFST-11
1444  0687 cd0000        	call	c_rtol
1447  068a ae0009        	ldw	x,#L52_speed+8
1448  068d cd0000        	call	c_ltor
1450  0690 96            	ldw	x,sp
1451  0691 1c0001        	addw	x,#OFST-11
1452  0694 cd0000        	call	c_fsub
1454  0697 be02          	ldw	x,c_lreg+2
1455  0699 89            	pushw	x
1456  069a be00          	ldw	x,c_lreg
1457  069c 89            	pushw	x
1458  069d cd0000        	call	_ABS
1460  06a0 9c            	rvf
1461  06a1 5b04          	addw	sp,#4
1462  06a3 96            	ldw	x,sp
1463  06a4 1c0009        	addw	x,#OFST-3
1464  06a7 cd0000        	call	c_fcmp
1466  06aa 2e35          	jrsge	L333
1467                     ; 140 			test4 = speed[2] = (double) 16000000 / (990*difftImp[2]);
1469  06ac ae004d        	ldw	x,#L11_difftImp+8
1470  06af cd0000        	call	c_ltor
1472  06b2 ae002a        	ldw	x,#L25
1473  06b5 cd0000        	call	c_lmul
1475  06b8 cd0000        	call	c_ltof
1477  06bb 96            	ldw	x,sp
1478  06bc 1c0009        	addw	x,#OFST-3
1479  06bf cd0000        	call	c_rtol
1482  06c2 ae006f        	ldw	x,#L572
1483  06c5 cd0000        	call	c_ltor
1485  06c8 96            	ldw	x,sp
1486  06c9 1c0009        	addw	x,#OFST-3
1487  06cc cd0000        	call	c_fdiv
1489  06cf ae0009        	ldw	x,#L52_speed+8
1490  06d2 cd0000        	call	c_rtol
1492  06d5 ce000b        	ldw	x,L52_speed+10
1493  06d8 cf0010        	ldw	_test4+2,x
1494  06db ce0009        	ldw	x,L52_speed+8
1495  06de cf000e        	ldw	_test4,x
1496  06e1               L333:
1497                     ; 143 		vtImp[2] = tImp[2];
1499  06e1 ce005f        	ldw	x,L7_tImp+10
1500  06e4 cf003f        	ldw	L31_vtImp+10,x
1501  06e7 ce005d        	ldw	x,L7_tImp+8
1502  06ea cf003d        	ldw	L31_vtImp+8,x
1503                     ; 144 		vTopRaggiunti[2] = topRaggiuntiProv[2];
1505  06ed ce002f        	ldw	x,L51_topRaggiuntiProv+10
1506  06f0 cf001f        	ldw	L71_vTopRaggiunti+10,x
1507  06f3 ce002d        	ldw	x,L51_topRaggiuntiProv+8
1508  06f6 cf001d        	ldw	L71_vTopRaggiunti+8,x
1509                     ; 146 	}
1512  06f9 5b0c          	addw	sp,#12
1513  06fb 85            	popw	x
1514  06fc bf00          	ldw	c_lreg,x
1515  06fe 85            	popw	x
1516  06ff bf02          	ldw	c_lreg+2,x
1517  0701 85            	popw	x
1518  0702 bf00          	ldw	c_y,x
1519  0704 320002        	pop	c_y+2
1520  0707 85            	popw	x
1521  0708 bf00          	ldw	c_x,x
1522  070a 320002        	pop	c_x+2
1523  070d 80            	iret
1556                     ; 147 	@svlreg @far @interrupt void ISR_MOT3(void){ //PA4
1557                     	switch	.text
1558  070e               f_ISR_MOT3:
1560  070e 8a            	push	cc
1561  070f 84            	pop	a
1562  0710 a4bf          	and	a,#191
1563  0712 88            	push	a
1564  0713 86            	pop	cc
1565       0000000c      OFST:	set	12
1566  0714 3b0002        	push	c_x+2
1567  0717 be00          	ldw	x,c_x
1568  0719 89            	pushw	x
1569  071a 3b0002        	push	c_y+2
1570  071d be00          	ldw	x,c_y
1571  071f 89            	pushw	x
1572  0720 be02          	ldw	x,c_lreg+2
1573  0722 89            	pushw	x
1574  0723 be00          	ldw	x,c_lreg
1575  0725 89            	pushw	x
1576  0726 520c          	subw	sp,#12
1579                     ; 148 		imptemp[3]++;
1581  0728 ae000c        	ldw	x,#_imptemp+12
1582  072b a601          	ld	a,#1
1583  072d cd0000        	call	c_lgadc
1585                     ; 149 		tImp[3] = TIM2_GetCounter();
1587  0730 cd0000        	call	_TIM2_GetCounter
1589  0733 cd0000        	call	c_uitolx
1591  0736 ae0061        	ldw	x,#L7_tImp+12
1592  0739 cd0000        	call	c_rtol
1594                     ; 150 		topRaggiuntiProv[3] = topRaggiunti;
1596  073c ce0013        	ldw	x,L12_topRaggiunti+2
1597  073f cf0033        	ldw	L51_topRaggiuntiProv+14,x
1598  0742 ce0011        	ldw	x,L12_topRaggiunti
1599  0745 cf0031        	ldw	L51_topRaggiuntiProv+12,x
1600                     ; 151 		if(topRaggiuntiProv[3] == vTopRaggiunti[3]) difftImp[3] = tImp[3] - vtImp[3];
1602  0748 ae0031        	ldw	x,#L51_topRaggiuntiProv+12
1603  074b cd0000        	call	c_ltor
1605  074e ae0021        	ldw	x,#L71_vTopRaggiunti+12
1606  0751 cd0000        	call	c_lcmp
1608  0754 2614          	jrne	L543
1611  0756 ae0061        	ldw	x,#L7_tImp+12
1612  0759 cd0000        	call	c_ltor
1614  075c ae0041        	ldw	x,#L31_vtImp+12
1615  075f cd0000        	call	c_lsub
1617  0762 ae0051        	ldw	x,#L11_difftImp+12
1618  0765 cd0000        	call	c_rtol
1621  0768 2042          	jra	L743
1622  076a               L543:
1623                     ; 152 		else difftImp[3] = (65535 - vtImp[3]) + (tImp[3]) + ((topRaggiuntiProv[3]-vTopRaggiunti[3]-1)*0xFFFF);
1625  076a ae0031        	ldw	x,#L51_topRaggiuntiProv+12
1626  076d cd0000        	call	c_ltor
1628  0770 ae0021        	ldw	x,#L71_vTopRaggiunti+12
1629  0773 cd0000        	call	c_lsub
1631  0776 ae0026        	ldw	x,#L63
1632  0779 cd0000        	call	c_lmul
1634  077c ae0026        	ldw	x,#L63
1635  077f cd0000        	call	c_lsub
1637  0782 96            	ldw	x,sp
1638  0783 1c0009        	addw	x,#OFST-3
1639  0786 cd0000        	call	c_rtol
1642  0789 aeffff        	ldw	x,#65535
1643  078c bf02          	ldw	c_lreg+2,x
1644  078e ae0000        	ldw	x,#0
1645  0791 bf00          	ldw	c_lreg,x
1646  0793 ae0041        	ldw	x,#L31_vtImp+12
1647  0796 cd0000        	call	c_lsub
1649  0799 ae0061        	ldw	x,#L7_tImp+12
1650  079c cd0000        	call	c_ladd
1652  079f 96            	ldw	x,sp
1653  07a0 1c0009        	addw	x,#OFST-3
1654  07a3 cd0000        	call	c_ladd
1656  07a6 ae0051        	ldw	x,#L11_difftImp+12
1657  07a9 cd0000        	call	c_rtol
1659  07ac               L743:
1660                     ; 154 		if(ABS(speed[3]-(double) 16000000 / (990*difftImp[3]))<1){
1662  07ac 9c            	rvf
1663  07ad a601          	ld	a,#1
1664  07af cd0000        	call	c_ctof
1666  07b2 96            	ldw	x,sp
1667  07b3 1c0009        	addw	x,#OFST-3
1668  07b6 cd0000        	call	c_rtol
1671  07b9 ae0051        	ldw	x,#L11_difftImp+12
1672  07bc cd0000        	call	c_ltor
1674  07bf ae002a        	ldw	x,#L25
1675  07c2 cd0000        	call	c_lmul
1677  07c5 cd0000        	call	c_ltof
1679  07c8 96            	ldw	x,sp
1680  07c9 1c0005        	addw	x,#OFST-7
1681  07cc cd0000        	call	c_rtol
1684  07cf ae006f        	ldw	x,#L572
1685  07d2 cd0000        	call	c_ltor
1687  07d5 96            	ldw	x,sp
1688  07d6 1c0005        	addw	x,#OFST-7
1689  07d9 cd0000        	call	c_fdiv
1691  07dc 96            	ldw	x,sp
1692  07dd 1c0001        	addw	x,#OFST-11
1693  07e0 cd0000        	call	c_rtol
1696  07e3 ae000d        	ldw	x,#L52_speed+12
1697  07e6 cd0000        	call	c_ltor
1699  07e9 96            	ldw	x,sp
1700  07ea 1c0001        	addw	x,#OFST-11
1701  07ed cd0000        	call	c_fsub
1703  07f0 be02          	ldw	x,c_lreg+2
1704  07f2 89            	pushw	x
1705  07f3 be00          	ldw	x,c_lreg
1706  07f5 89            	pushw	x
1707  07f6 cd0000        	call	_ABS
1709  07f9 9c            	rvf
1710  07fa 5b04          	addw	sp,#4
1711  07fc 96            	ldw	x,sp
1712  07fd 1c0009        	addw	x,#OFST-3
1713  0800 cd0000        	call	c_fcmp
1715  0803 2e35          	jrsge	L153
1716                     ; 155 			test5 = speed[3] = (double) 16000000 / (990*difftImp[3]);
1718  0805 ae0051        	ldw	x,#L11_difftImp+12
1719  0808 cd0000        	call	c_ltor
1721  080b ae002a        	ldw	x,#L25
1722  080e cd0000        	call	c_lmul
1724  0811 cd0000        	call	c_ltof
1726  0814 96            	ldw	x,sp
1727  0815 1c0009        	addw	x,#OFST-3
1728  0818 cd0000        	call	c_rtol
1731  081b ae006f        	ldw	x,#L572
1732  081e cd0000        	call	c_ltor
1734  0821 96            	ldw	x,sp
1735  0822 1c0009        	addw	x,#OFST-3
1736  0825 cd0000        	call	c_fdiv
1738  0828 ae000d        	ldw	x,#L52_speed+12
1739  082b cd0000        	call	c_rtol
1741  082e ce000f        	ldw	x,L52_speed+14
1742  0831 cf0014        	ldw	_test5+2,x
1743  0834 ce000d        	ldw	x,L52_speed+12
1744  0837 cf0012        	ldw	_test5,x
1745  083a               L153:
1746                     ; 158 		vtImp[3] = tImp[3];
1748  083a ce0063        	ldw	x,L7_tImp+14
1749  083d cf0043        	ldw	L31_vtImp+14,x
1750  0840 ce0061        	ldw	x,L7_tImp+12
1751  0843 cf0041        	ldw	L31_vtImp+12,x
1752                     ; 159 		vTopRaggiunti[3] = topRaggiuntiProv[3];
1754  0846 ce0033        	ldw	x,L51_topRaggiuntiProv+14
1755  0849 cf0023        	ldw	L71_vTopRaggiunti+14,x
1756  084c ce0031        	ldw	x,L51_topRaggiuntiProv+12
1757  084f cf0021        	ldw	L71_vTopRaggiunti+12,x
1758                     ; 161 	}
1761  0852 5b0c          	addw	sp,#12
1762  0854 85            	popw	x
1763  0855 bf00          	ldw	c_lreg,x
1764  0857 85            	popw	x
1765  0858 bf02          	ldw	c_lreg+2,x
1766  085a 85            	popw	x
1767  085b bf00          	ldw	c_y,x
1768  085d 320002        	pop	c_y+2
1769  0860 85            	popw	x
1770  0861 bf00          	ldw	c_x,x
1771  0863 320002        	pop	c_x+2
1772  0866 80            	iret
1796                     ; 167 @svlreg @far @interrupt void ISR_TIM2(void){
1797                     	switch	.text
1798  0867               f_ISR_TIM2:
1800  0867 8a            	push	cc
1801  0868 84            	pop	a
1802  0869 a4bf          	and	a,#191
1803  086b 88            	push	a
1804  086c 86            	pop	cc
1805  086d 3b0002        	push	c_x+2
1806  0870 be00          	ldw	x,c_x
1807  0872 89            	pushw	x
1808  0873 3b0002        	push	c_y+2
1809  0876 be00          	ldw	x,c_y
1810  0878 89            	pushw	x
1811  0879 be02          	ldw	x,c_lreg+2
1812  087b 89            	pushw	x
1813  087c be00          	ldw	x,c_lreg
1814  087e 89            	pushw	x
1817                     ; 168 	topRaggiunti++;
1819  087f ae0011        	ldw	x,#L12_topRaggiunti
1820  0882 a601          	ld	a,#1
1821  0884 cd0000        	call	c_lgadc
1823                     ; 169 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
1825  0887 ae0001        	ldw	x,#1
1826  088a cd0000        	call	_TIM2_ClearFlag
1828                     ; 170 }
1831  088d 85            	popw	x
1832  088e bf00          	ldw	c_lreg,x
1833  0890 85            	popw	x
1834  0891 bf02          	ldw	c_lreg+2,x
1835  0893 85            	popw	x
1836  0894 bf00          	ldw	c_y,x
1837  0896 320002        	pop	c_y+2
1838  0899 85            	popw	x
1839  089a bf00          	ldw	c_x,x
1840  089c 320002        	pop	c_x+2
1841  089f 80            	iret
1873                     ; 176 @svlreg @far @interrupt void ISR_TIM2_CC(void){													//2ms
1874                     	switch	.text
1875  08a0               f_ISR_TIM2_CC:
1877  08a0 8a            	push	cc
1878  08a1 84            	pop	a
1879  08a2 a4bf          	and	a,#191
1880  08a4 88            	push	a
1881  08a5 86            	pop	cc
1882  08a6 3b0002        	push	c_x+2
1883  08a9 be00          	ldw	x,c_x
1884  08ab 89            	pushw	x
1885  08ac 3b0002        	push	c_y+2
1886  08af be00          	ldw	x,c_y
1887  08b1 89            	pushw	x
1888  08b2 be02          	ldw	x,c_lreg+2
1889  08b4 89            	pushw	x
1890  08b5 be00          	ldw	x,c_lreg
1891  08b7 89            	pushw	x
1894                     ; 177 	TIM1_SetCompare1(test6 = (uint16_t)CalcPid(0));
1896  08b8 4f            	clr	a
1897  08b9 cd0037        	call	_CalcPid
1899  08bc b602          	ld	a,c_lreg+2
1900  08be 97            	ld	xl,a
1901  08bf b603          	ld	a,c_lreg+3
1902  08c1 02            	rlwa	x,a
1903  08c2 cd0000        	call	c_uitof
1905  08c5 ae0016        	ldw	x,#_test6
1906  08c8 cd0000        	call	c_rtol
1908  08cb ae0016        	ldw	x,#_test6
1909  08ce cd0000        	call	c_ltor
1911  08d1 cd0000        	call	c_ftoi
1913  08d4 cd0000        	call	_TIM1_SetCompare1
1915                     ; 178 	TIM1_SetCompare2(test7 = (uint16_t)CalcPid(1));
1917  08d7 a601          	ld	a,#1
1918  08d9 cd0037        	call	_CalcPid
1920  08dc b602          	ld	a,c_lreg+2
1921  08de 97            	ld	xl,a
1922  08df b603          	ld	a,c_lreg+3
1923  08e1 02            	rlwa	x,a
1924  08e2 cd0000        	call	c_uitof
1926  08e5 ae001a        	ldw	x,#_test7
1927  08e8 cd0000        	call	c_rtol
1929  08eb ae001a        	ldw	x,#_test7
1930  08ee cd0000        	call	c_ltor
1932  08f1 cd0000        	call	c_ftoi
1934  08f4 cd0000        	call	_TIM1_SetCompare2
1936                     ; 179 	TIM1_SetCompare3(test8 = (uint16_t)CalcPid(2));
1938  08f7 a602          	ld	a,#2
1939  08f9 cd0037        	call	_CalcPid
1941  08fc b602          	ld	a,c_lreg+2
1942  08fe 97            	ld	xl,a
1943  08ff b603          	ld	a,c_lreg+3
1944  0901 02            	rlwa	x,a
1945  0902 cd0000        	call	c_uitof
1947  0905 ae001e        	ldw	x,#_test8
1948  0908 cd0000        	call	c_rtol
1950  090b ae001e        	ldw	x,#_test8
1951  090e cd0000        	call	c_ltor
1953  0911 cd0000        	call	c_ftoi
1955  0914 cd0000        	call	_TIM1_SetCompare3
1957                     ; 180 	TIM1_SetCompare4(test9 = (uint16_t)CalcPid(3));
1959  0917 a603          	ld	a,#3
1960  0919 cd0037        	call	_CalcPid
1962  091c b602          	ld	a,c_lreg+2
1963  091e 97            	ld	xl,a
1964  091f b603          	ld	a,c_lreg+3
1965  0921 02            	rlwa	x,a
1966  0922 cd0000        	call	c_uitof
1968  0925 ae0022        	ldw	x,#_test9
1969  0928 cd0000        	call	c_rtol
1971  092b ae0022        	ldw	x,#_test9
1972  092e cd0000        	call	c_ltor
1974  0931 cd0000        	call	c_ftoi
1976  0934 cd0000        	call	_TIM1_SetCompare4
1978                     ; 181 	TIM2_ClearFlag(TIM2_FLAG_CC1);
1980  0937 ae0002        	ldw	x,#2
1981  093a cd0000        	call	_TIM2_ClearFlag
1983                     ; 182 }
1986  093d 85            	popw	x
1987  093e bf00          	ldw	c_lreg,x
1988  0940 85            	popw	x
1989  0941 bf02          	ldw	c_lreg+2,x
1990  0943 85            	popw	x
1991  0944 bf00          	ldw	c_y,x
1992  0946 320002        	pop	c_y+2
1993  0949 85            	popw	x
1994  094a bf00          	ldw	c_x,x
1995  094c 320002        	pop	c_x+2
1996  094f 80            	iret
2029                     ; 184 void status_msg(void){
2031                     	switch	.text
2032  0950               _status_msg:
2034  0950 88            	push	a
2035       00000001      OFST:	set	1
2038                     ; 185 	u8 walls = VL6180X_GetWalls();
2040  0951 cd0000        	call	_VL6180X_GetWalls
2042  0954 6b01          	ld	(OFST+0,sp),a
2044                     ; 188 	if (walls & 1<<0) Serial_Send_String("1");
2046  0956 7b01          	ld	a,(OFST+0,sp)
2047  0958 a501          	bcp	a,#1
2048  095a 2708          	jreq	L704
2051  095c ae006d        	ldw	x,#L114
2052  095f cd0000        	call	_Serial_Send_String
2055  0962 2006          	jra	L314
2056  0964               L704:
2057                     ; 189 	else Serial_Send_String("0");
2059  0964 ae006b        	ldw	x,#L514
2060  0967 cd0000        	call	_Serial_Send_String
2062  096a               L314:
2063                     ; 190 	if (walls & 1<<1) Serial_Send_String("1");
2065  096a 7b01          	ld	a,(OFST+0,sp)
2066  096c a502          	bcp	a,#2
2067  096e 2708          	jreq	L714
2070  0970 ae006d        	ldw	x,#L114
2071  0973 cd0000        	call	_Serial_Send_String
2074  0976 2006          	jra	L124
2075  0978               L714:
2076                     ; 191 	else Serial_Send_String("0");
2078  0978 ae006b        	ldw	x,#L514
2079  097b cd0000        	call	_Serial_Send_String
2081  097e               L124:
2082                     ; 192 	if (walls & 1<<2) Serial_Send_String("1");
2084  097e 7b01          	ld	a,(OFST+0,sp)
2085  0980 a504          	bcp	a,#4
2086  0982 2708          	jreq	L324
2089  0984 ae006d        	ldw	x,#L114
2090  0987 cd0000        	call	_Serial_Send_String
2093  098a 2006          	jra	L524
2094  098c               L324:
2095                     ; 193 	else Serial_Send_String("0");
2097  098c ae006b        	ldw	x,#L514
2098  098f cd0000        	call	_Serial_Send_String
2100  0992               L524:
2101                     ; 195 	Serial_Send_String("\n");
2103  0992 ae0069        	ldw	x,#L724
2104  0995 cd0000        	call	_Serial_Send_String
2106                     ; 196 }
2109  0998 84            	pop	a
2110  0999 81            	ret
2144                     ; 198 @svlreg @far @interrupt void ISR_Ser(void){
2146                     	switch	.text
2147  099a               f_ISR_Ser:
2149  099a 8a            	push	cc
2150  099b 84            	pop	a
2151  099c a4bf          	and	a,#191
2152  099e 88            	push	a
2153  099f 86            	pop	cc
2154       00000001      OFST:	set	1
2155  09a0 3b0002        	push	c_x+2
2156  09a3 be00          	ldw	x,c_x
2157  09a5 89            	pushw	x
2158  09a6 3b0002        	push	c_y+2
2159  09a9 be00          	ldw	x,c_y
2160  09ab 89            	pushw	x
2161  09ac be02          	ldw	x,c_lreg+2
2162  09ae 89            	pushw	x
2163  09af be00          	ldw	x,c_lreg
2164  09b1 89            	pushw	x
2165  09b2 88            	push	a
2168                     ; 199 	char n=UART3 -> DR;
2170  09b3 c65241        	ld	a,21057
2171  09b6 6b01          	ld	(OFST+0,sp),a
2173                     ; 200 	sendId=0;
2175  09b8 725f0000      	clr	L34_sendId
2176                     ; 201 	switch (n)
2178  09bc 7b01          	ld	a,(OFST+0,sp)
2180                     ; 211 		break;
2181  09be a030          	sub	a,#48
2182  09c0 2709          	jreq	L554
2183  09c2 4a            	dec	a
2184  09c3 2706          	jreq	L554
2185  09c5               L534:
2186                     ; 209 		default:
2186                     ; 210 		Serial_Send_String("default\n");
2188  09c5 ae0060        	ldw	x,#L754
2189  09c8 cd0000        	call	_Serial_Send_String
2191                     ; 211 		break;
2193  09cb               L554:
2194                     ; 213 }
2197  09cb 84            	pop	a
2198  09cc 85            	popw	x
2199  09cd bf00          	ldw	c_lreg,x
2200  09cf 85            	popw	x
2201  09d0 bf02          	ldw	c_lreg+2,x
2202  09d2 85            	popw	x
2203  09d3 bf00          	ldw	c_y,x
2204  09d5 320002        	pop	c_y+2
2205  09d8 85            	popw	x
2206  09d9 bf00          	ldw	c_x,x
2207  09db 320002        	pop	c_x+2
2208  09de 80            	iret
2245                     ; 214 @svlreg @far @interrupt void ISR_Ser1(void){
2246                     	switch	.text
2247  09df               f_ISR_Ser1:
2249  09df 8a            	push	cc
2250  09e0 84            	pop	a
2251  09e1 a4bf          	and	a,#191
2252  09e3 88            	push	a
2253  09e4 86            	pop	cc
2254       00000001      OFST:	set	1
2255  09e5 3b0002        	push	c_x+2
2256  09e8 be00          	ldw	x,c_x
2257  09ea 89            	pushw	x
2258  09eb 3b0002        	push	c_y+2
2259  09ee be00          	ldw	x,c_y
2260  09f0 89            	pushw	x
2261  09f1 be02          	ldw	x,c_lreg+2
2262  09f3 89            	pushw	x
2263  09f4 be00          	ldw	x,c_lreg
2264  09f6 89            	pushw	x
2265  09f7 88            	push	a
2268                     ; 215 	char n=UART1 -> DR;
2270  09f8 c65231        	ld	a,21041
2271  09fb 6b01          	ld	(OFST+0,sp),a
2273                     ; 216 	sendId=0;
2275  09fd 725f0000      	clr	L34_sendId
2276                     ; 217 	switch (n)
2278  0a01 7b01          	ld	a,(OFST+0,sp)
2280                     ; 243 		break;
2281  0a03 a030          	sub	a,#48
2282  0a05 270e          	jreq	L164
2283  0a07 4a            	dec	a
2284  0a08 2735          	jreq	L364
2285  0a0a 4a            	dec	a
2286  0a0b 2759          	jreq	L564
2287  0a0d               L764:
2288                     ; 241 		default:
2288                     ; 242 		Serial_Send_String("niente\n");
2290  0a0d ae002e        	ldw	x,#L715
2291  0a10 cd0000        	call	_Serial_Send_String
2293                     ; 243 		break;
2295  0a13 2076          	jra	L705
2296  0a15               L164:
2297                     ; 219 		case '0':
2297                     ; 220 		GPIO_WriteHigh(GPIOE,GPIO_PIN_0|GPIO_PIN_3);
2299  0a15 4b09          	push	#9
2300  0a17 ae5014        	ldw	x,#20500
2301  0a1a cd0000        	call	_GPIO_WriteHigh
2303  0a1d 84            	pop	a
2304                     ; 221 		delay_ms(2000);
2306  0a1e ae07d0        	ldw	x,#2000
2307  0a21 89            	pushw	x
2308  0a22 ae0000        	ldw	x,#0
2309  0a25 89            	pushw	x
2310  0a26 cd0000        	call	_delay_ms
2312  0a29 5b04          	addw	sp,#4
2313                     ; 222 		GPIO_WriteLow(GPIOE,GPIO_PIN_0|GPIO_PIN_3);
2315  0a2b 4b09          	push	#9
2316  0a2d ae5014        	ldw	x,#20500
2317  0a30 cd0000        	call	_GPIO_WriteLow
2319  0a33 84            	pop	a
2320                     ; 223 		Serial_Send_String("30cm\n");
2322  0a34 ae005a        	ldw	x,#L115
2323  0a37 cd0000        	call	_Serial_Send_String
2325                     ; 224 		status_msg();
2327  0a3a cd0950        	call	_status_msg
2329                     ; 225 		break;
2331  0a3d 204c          	jra	L705
2332  0a3f               L364:
2333                     ; 227 		case '1':
2333                     ; 228 		GPIO_WriteHigh(GPIOE,GPIO_PIN_0);
2335  0a3f 4b01          	push	#1
2336  0a41 ae5014        	ldw	x,#20500
2337  0a44 cd0000        	call	_GPIO_WriteHigh
2339  0a47 84            	pop	a
2340                     ; 229 		delay_ms(2000);
2342  0a48 ae07d0        	ldw	x,#2000
2343  0a4b 89            	pushw	x
2344  0a4c ae0000        	ldw	x,#0
2345  0a4f 89            	pushw	x
2346  0a50 cd0000        	call	_delay_ms
2348  0a53 5b04          	addw	sp,#4
2349                     ; 230 		GPIO_WriteLow(GPIOE,GPIO_PIN_0);
2351  0a55 4b01          	push	#1
2352  0a57 ae5014        	ldw	x,#20500
2353  0a5a cd0000        	call	_GPIO_WriteLow
2355  0a5d 84            	pop	a
2356                     ; 231 		Serial_Send_String("girato a destra\n");
2358  0a5e ae0049        	ldw	x,#L315
2359  0a61 cd0000        	call	_Serial_Send_String
2361                     ; 232 		break;
2363  0a64 2025          	jra	L705
2364  0a66               L564:
2365                     ; 234 		case '2':
2365                     ; 235 		GPIO_WriteHigh(GPIOE,GPIO_PIN_3);
2367  0a66 4b08          	push	#8
2368  0a68 ae5014        	ldw	x,#20500
2369  0a6b cd0000        	call	_GPIO_WriteHigh
2371  0a6e 84            	pop	a
2372                     ; 236 		delay_ms(2000);
2374  0a6f ae07d0        	ldw	x,#2000
2375  0a72 89            	pushw	x
2376  0a73 ae0000        	ldw	x,#0
2377  0a76 89            	pushw	x
2378  0a77 cd0000        	call	_delay_ms
2380  0a7a 5b04          	addw	sp,#4
2381                     ; 237 		GPIO_WriteLow(GPIOE,GPIO_PIN_3);
2383  0a7c 4b08          	push	#8
2384  0a7e ae5014        	ldw	x,#20500
2385  0a81 cd0000        	call	_GPIO_WriteLow
2387  0a84 84            	pop	a
2388                     ; 238 		Serial_Send_String("girato a sinistra\n");
2390  0a85 ae0036        	ldw	x,#L515
2391  0a88 cd0000        	call	_Serial_Send_String
2393                     ; 239 		break;
2395  0a8b               L705:
2396                     ; 245 }
2399  0a8b 84            	pop	a
2400  0a8c 85            	popw	x
2401  0a8d bf00          	ldw	c_lreg,x
2402  0a8f 85            	popw	x
2403  0a90 bf02          	ldw	c_lreg+2,x
2404  0a92 85            	popw	x
2405  0a93 bf00          	ldw	c_y,x
2406  0a95 320002        	pop	c_y+2
2407  0a98 85            	popw	x
2408  0a99 bf00          	ldw	c_x,x
2409  0a9b 320002        	pop	c_x+2
2410  0a9e 80            	iret
2497                     	xdef	f_ISR_Ser1
2498                     	xdef	f_ISR_Ser
2499                     	xdef	_status_msg
2500                     	xdef	f_ISR_TIM2_CC
2501                     	xdef	f_ISR_TIM2
2502                     	xdef	f_ISR_MOT3
2503                     	xdef	f_ISR_MOT2
2504                     	xdef	f_ISR_MOT1
2505                     	xdef	f_ISR_MOT0
2506                     	xdef	_main
2507                     	xdef	_test9
2508                     	xdef	_test8
2509                     	xdef	_test7
2510                     	xdef	_test6
2511                     	xdef	_test5
2512                     	xdef	_test4
2513                     	xdef	_test3
2514                     	xdef	_test2
2515                     	xdef	_test1
2516                     	xdef	_test
2517                     	xref	_delay_ms
2518                     	xref	_VL6180X_GetWalls
2519                     	xref	_VaiAvanti
2520                     	xdef	_CalcPid
2521                     	xref	_InitPwm
2522                     	xref	_ABS
2523                     	xref	_imptemp
2524                     	xref	_duty
2525                     	xref	_old_error
2526                     	xref	_setpoint
2527                     	xref	_derivative
2528                     	xref	_integral
2529                     	xref	_proportional
2530                     	xref	_error
2531                     	xref	_InitCLK
2532                     	xref	_InitISR
2533                     	switch	.bss
2534  0000               L34_sendId:
2535  0000 00            	ds.b	1
2536  0001               L52_speed:
2537  0001 000000000000  	ds.b	16
2538  0011               L12_topRaggiunti:
2539  0011 00000000      	ds.b	4
2540  0015               L71_vTopRaggiunti:
2541  0015 000000000000  	ds.b	16
2542  0025               L51_topRaggiuntiProv:
2543  0025 000000000000  	ds.b	16
2544  0035               L31_vtImp:
2545  0035 000000000000  	ds.b	16
2546  0045               L11_difftImp:
2547  0045 000000000000  	ds.b	16
2548  0055               L7_tImp:
2549  0055 000000000000  	ds.b	16
2550                     	xref	_Serial_Send_String
2551                     	xref	_InitSer
2552                     	xref	_TIM2_ClearFlag
2553                     	xref	_TIM2_GetCounter
2554                     	xref	_TIM1_SetCompare4
2555                     	xref	_TIM1_SetCompare3
2556                     	xref	_TIM1_SetCompare2
2557                     	xref	_TIM1_SetCompare1
2558                     	xref	_GPIO_WriteLow
2559                     	xref	_GPIO_WriteHigh
2560                     	switch	.const
2561  002e               L715:
2562  002e 6e69656e7465  	dc.b	"niente",10,0
2563  0036               L515:
2564  0036 67697261746f  	dc.b	"girato a sinistra",10,0
2565  0049               L315:
2566  0049 67697261746f  	dc.b	"girato a destra",10,0
2567  005a               L115:
2568  005a 3330636d0a00  	dc.b	"30cm",10,0
2569  0060               L754:
2570  0060 64656661756c  	dc.b	"default",10,0
2571  0069               L724:
2572  0069 0a00          	dc.b	10,0
2573  006b               L514:
2574  006b 3000          	dc.b	"0",0
2575  006d               L114:
2576  006d 3100          	dc.b	"1",0
2577  006f               L572:
2578  006f 4b742400      	dc.w	19316,9216
2579  0073               L162:
2580  0073 6361696f0a00  	dc.b	"caio",10,0
2581  0079               L542:
2582  0079 41980000      	dc.w	16792,0
2583  007d               L532:
2584  007d 46480000      	dc.w	17992,0
2585  0081               L522:
2586  0081 469c4000      	dc.w	18076,16384
2587  0085               L512:
2588  0085 3b03126e      	dc.w	15107,4718
2589  0089               L502:
2590  0089 3d23d70a      	dc.w	15651,-10486
2591  008d               L551:
2592  008d 61760a00      	dc.b	"av",10,0
2593  0091               L351:
2594  0091 78640a00      	dc.b	"xd",10,0
2595                     	xref.b	c_lreg
2596                     	xref.b	c_x
2597                     	xref.b	c_y
2617                     	xref	c_lmul
2618                     	xref	c_ladd
2619                     	xref	c_lsub
2620                     	xref	c_lcmp
2621                     	xref	c_lgadc
2622                     	xref	c_uitolx
2623                     	xref	c_ftoi
2624                     	xref	c_fadd
2625                     	xref	c_fdiv
2626                     	xref	c_ltof
2627                     	xref	c_uitof
2628                     	xref	c_itof
2629                     	xref	c_ctof
2630                     	xref	c_fgadd
2631                     	xref	c_fmul
2632                     	xref	c_fcmp
2633                     	xref	c_rtol
2634                     	xref	c_fsub
2635                     	xref	c_ltor
2636                     	end
