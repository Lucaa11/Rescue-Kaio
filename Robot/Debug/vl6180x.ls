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
 328                     ; 10 void VL6180X_Init( uint8_t N,uint8_t newAddress,GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef shdnPin){
 330                     	switch	.text
 331  0000               _VL6180X_Init:
 333  0000 89            	pushw	x
 334       00000000      OFST:	set	0
 337                     ; 11 				GPIO_WriteHigh(GPIOx,shdnPin);
 339  0001 7b07          	ld	a,(OFST+7,sp)
 340  0003 88            	push	a
 341  0004 1e06          	ldw	x,(OFST+6,sp)
 342  0006 cd0000        	call	_GPIO_WriteHigh
 344  0009 84            	pop	a
 345                     ; 12 				delay_ms(11);
 347  000a ae000b        	ldw	x,#11
 348  000d 89            	pushw	x
 349  000e ae0000        	ldw	x,#0
 350  0011 89            	pushw	x
 351  0012 cd0000        	call	_delay_ms
 353  0015 5b04          	addw	sp,#4
 354                     ; 13         address[N]= 0x29;
 356  0017 7b01          	ld	a,(OFST+1,sp)
 357  0019 5f            	clrw	x
 358  001a 97            	ld	xl,a
 359  001b a629          	ld	a,#41
 360  001d d70007        	ld	(_address,x),a
 361                     ; 15 				Serial_Send_String("Fresh\n");
 363  0020 ae0051        	ldw	x,#L171
 364  0023 cd0000        	call	_Serial_Send_String
 366                     ; 16 				if (I2C_Recv(address[N],__VL6180X_SYSTEM_FRESH_OUT_OF_RESET,1,1)[0] == 1){ 
 368  0026 4b01          	push	#1
 369  0028 4b01          	push	#1
 370  002a ae0016        	ldw	x,#22
 371  002d 89            	pushw	x
 372  002e 7b05          	ld	a,(OFST+5,sp)
 373  0030 5f            	clrw	x
 374  0031 97            	ld	xl,a
 375  0032 d60007        	ld	a,(_address,x)
 376  0035 cd0000        	call	_I2C_Recv
 378  0038 5b04          	addw	sp,#4
 379  003a f6            	ld	a,(x)
 380  003b a101          	cp	a,#1
 381  003d 2611          	jrne	L371
 382                     ; 17 					Serial_Send_String("TRUE\n");
 384  003f ae004b        	ldw	x,#L571
 385  0042 cd0000        	call	_Serial_Send_String
 387                     ; 18 					ready[N]=TRUE;
 389  0045 7b01          	ld	a,(OFST+1,sp)
 390  0047 5f            	clrw	x
 391  0048 97            	ld	xl,a
 392  0049 a601          	ld	a,#1
 393  004b d70000        	ld	(_ready,x),a
 395  004e 2045          	jra	L771
 396  0050               L371:
 397                     ; 21 					delay_ms(1000);
 399  0050 ae03e8        	ldw	x,#1000
 400  0053 89            	pushw	x
 401  0054 ae0000        	ldw	x,#0
 402  0057 89            	pushw	x
 403  0058 cd0000        	call	_delay_ms
 405  005b 5b04          	addw	sp,#4
 406                     ; 22 					if (I2C_Recv(address[N],__VL6180X_SYSTEM_FRESH_OUT_OF_RESET,1,1)[0] == 1){ 
 408  005d 4b01          	push	#1
 409  005f 4b01          	push	#1
 410  0061 ae0016        	ldw	x,#22
 411  0064 89            	pushw	x
 412  0065 7b05          	ld	a,(OFST+5,sp)
 413  0067 5f            	clrw	x
 414  0068 97            	ld	xl,a
 415  0069 d60007        	ld	a,(_address,x)
 416  006c cd0000        	call	_I2C_Recv
 418  006f 5b04          	addw	sp,#4
 419  0071 f6            	ld	a,(x)
 420  0072 a101          	cp	a,#1
 421  0074 2611          	jrne	L102
 422                     ; 23 						Serial_Send_String("TRUE\n");
 424  0076 ae004b        	ldw	x,#L571
 425  0079 cd0000        	call	_Serial_Send_String
 427                     ; 24 						ready[N]=TRUE;
 429  007c 7b01          	ld	a,(OFST+1,sp)
 430  007e 5f            	clrw	x
 431  007f 97            	ld	xl,a
 432  0080 a601          	ld	a,#1
 433  0082 d70000        	ld	(_ready,x),a
 435  0085 200e          	jra	L771
 436  0087               L102:
 437                     ; 27 						Serial_Send_String("FALSE\n");
 439  0087 ae0044        	ldw	x,#L502
 440  008a cd0000        	call	_Serial_Send_String
 442                     ; 28 						ready[N]=FALSE;
 444  008d 7b01          	ld	a,(OFST+1,sp)
 445  008f 5f            	clrw	x
 446  0090 97            	ld	xl,a
 447  0091 724f0000      	clr	(_ready,x)
 448  0095               L771:
 449                     ; 33 				if(ready[N]){
 451  0095 7b01          	ld	a,(OFST+1,sp)
 452  0097 5f            	clrw	x
 453  0098 97            	ld	xl,a
 454  0099 724d0000      	tnz	(_ready,x)
 455  009d 2603          	jrne	L6
 456  009f cc035c        	jp	L702
 457  00a2               L6:
 458                     ; 34 					I2C_Send(address[N],0x0207, 0x01,1);
 460  00a2 4b01          	push	#1
 461  00a4 ae0001        	ldw	x,#1
 462  00a7 89            	pushw	x
 463  00a8 ae0207        	ldw	x,#519
 464  00ab 89            	pushw	x
 465  00ac 7b06          	ld	a,(OFST+6,sp)
 466  00ae 5f            	clrw	x
 467  00af 97            	ld	xl,a
 468  00b0 d60007        	ld	a,(_address,x)
 469  00b3 cd0000        	call	_I2C_Send
 471  00b6 5b05          	addw	sp,#5
 472                     ; 35 					I2C_Send(address[N],0x0208, 0x01,1);
 474  00b8 4b01          	push	#1
 475  00ba ae0001        	ldw	x,#1
 476  00bd 89            	pushw	x
 477  00be ae0208        	ldw	x,#520
 478  00c1 89            	pushw	x
 479  00c2 7b06          	ld	a,(OFST+6,sp)
 480  00c4 5f            	clrw	x
 481  00c5 97            	ld	xl,a
 482  00c6 d60007        	ld	a,(_address,x)
 483  00c9 cd0000        	call	_I2C_Send
 485  00cc 5b05          	addw	sp,#5
 486                     ; 36 					I2C_Send(address[N],0x0096, 0x00,1);
 488  00ce 4b01          	push	#1
 489  00d0 5f            	clrw	x
 490  00d1 89            	pushw	x
 491  00d2 ae0096        	ldw	x,#150
 492  00d5 89            	pushw	x
 493  00d6 7b06          	ld	a,(OFST+6,sp)
 494  00d8 5f            	clrw	x
 495  00d9 97            	ld	xl,a
 496  00da d60007        	ld	a,(_address,x)
 497  00dd cd0000        	call	_I2C_Send
 499  00e0 5b05          	addw	sp,#5
 500                     ; 37 					I2C_Send(address[N],0x0097, 0xfd,1);
 502  00e2 4b01          	push	#1
 503  00e4 ae00fd        	ldw	x,#253
 504  00e7 89            	pushw	x
 505  00e8 ae0097        	ldw	x,#151
 506  00eb 89            	pushw	x
 507  00ec 7b06          	ld	a,(OFST+6,sp)
 508  00ee 5f            	clrw	x
 509  00ef 97            	ld	xl,a
 510  00f0 d60007        	ld	a,(_address,x)
 511  00f3 cd0000        	call	_I2C_Send
 513  00f6 5b05          	addw	sp,#5
 514                     ; 38 					I2C_Send(address[N],0x00e3, 0x00,1);
 516  00f8 4b01          	push	#1
 517  00fa 5f            	clrw	x
 518  00fb 89            	pushw	x
 519  00fc ae00e3        	ldw	x,#227
 520  00ff 89            	pushw	x
 521  0100 7b06          	ld	a,(OFST+6,sp)
 522  0102 5f            	clrw	x
 523  0103 97            	ld	xl,a
 524  0104 d60007        	ld	a,(_address,x)
 525  0107 cd0000        	call	_I2C_Send
 527  010a 5b05          	addw	sp,#5
 528                     ; 39 					I2C_Send(address[N],0x00e4, 0x04,1);
 530  010c 4b01          	push	#1
 531  010e ae0004        	ldw	x,#4
 532  0111 89            	pushw	x
 533  0112 ae00e4        	ldw	x,#228
 534  0115 89            	pushw	x
 535  0116 7b06          	ld	a,(OFST+6,sp)
 536  0118 5f            	clrw	x
 537  0119 97            	ld	xl,a
 538  011a d60007        	ld	a,(_address,x)
 539  011d cd0000        	call	_I2C_Send
 541  0120 5b05          	addw	sp,#5
 542                     ; 40 					I2C_Send(address[N],0x00e5, 0x02,1);
 544  0122 4b01          	push	#1
 545  0124 ae0002        	ldw	x,#2
 546  0127 89            	pushw	x
 547  0128 ae00e5        	ldw	x,#229
 548  012b 89            	pushw	x
 549  012c 7b06          	ld	a,(OFST+6,sp)
 550  012e 5f            	clrw	x
 551  012f 97            	ld	xl,a
 552  0130 d60007        	ld	a,(_address,x)
 553  0133 cd0000        	call	_I2C_Send
 555  0136 5b05          	addw	sp,#5
 556                     ; 41 					I2C_Send(address[N],0x00e6, 0x01,1);
 558  0138 4b01          	push	#1
 559  013a ae0001        	ldw	x,#1
 560  013d 89            	pushw	x
 561  013e ae00e6        	ldw	x,#230
 562  0141 89            	pushw	x
 563  0142 7b06          	ld	a,(OFST+6,sp)
 564  0144 5f            	clrw	x
 565  0145 97            	ld	xl,a
 566  0146 d60007        	ld	a,(_address,x)
 567  0149 cd0000        	call	_I2C_Send
 569  014c 5b05          	addw	sp,#5
 570                     ; 42 					I2C_Send(address[N],0x00e7, 0x03,1);
 572  014e 4b01          	push	#1
 573  0150 ae0003        	ldw	x,#3
 574  0153 89            	pushw	x
 575  0154 ae00e7        	ldw	x,#231
 576  0157 89            	pushw	x
 577  0158 7b06          	ld	a,(OFST+6,sp)
 578  015a 5f            	clrw	x
 579  015b 97            	ld	xl,a
 580  015c d60007        	ld	a,(_address,x)
 581  015f cd0000        	call	_I2C_Send
 583  0162 5b05          	addw	sp,#5
 584                     ; 43 					I2C_Send(address[N],0x00f5, 0x02,1);
 586  0164 4b01          	push	#1
 587  0166 ae0002        	ldw	x,#2
 588  0169 89            	pushw	x
 589  016a ae00f5        	ldw	x,#245
 590  016d 89            	pushw	x
 591  016e 7b06          	ld	a,(OFST+6,sp)
 592  0170 5f            	clrw	x
 593  0171 97            	ld	xl,a
 594  0172 d60007        	ld	a,(_address,x)
 595  0175 cd0000        	call	_I2C_Send
 597  0178 5b05          	addw	sp,#5
 598                     ; 44 					I2C_Send(address[N],0x00d9, 0x05,1);
 600  017a 4b01          	push	#1
 601  017c ae0005        	ldw	x,#5
 602  017f 89            	pushw	x
 603  0180 ae00d9        	ldw	x,#217
 604  0183 89            	pushw	x
 605  0184 7b06          	ld	a,(OFST+6,sp)
 606  0186 5f            	clrw	x
 607  0187 97            	ld	xl,a
 608  0188 d60007        	ld	a,(_address,x)
 609  018b cd0000        	call	_I2C_Send
 611  018e 5b05          	addw	sp,#5
 612                     ; 45 					I2C_Send(address[N],0x00db, 0xce,1);
 614  0190 4b01          	push	#1
 615  0192 ae00ce        	ldw	x,#206
 616  0195 89            	pushw	x
 617  0196 ae00db        	ldw	x,#219
 618  0199 89            	pushw	x
 619  019a 7b06          	ld	a,(OFST+6,sp)
 620  019c 5f            	clrw	x
 621  019d 97            	ld	xl,a
 622  019e d60007        	ld	a,(_address,x)
 623  01a1 cd0000        	call	_I2C_Send
 625  01a4 5b05          	addw	sp,#5
 626                     ; 46 					I2C_Send(address[N],0x00dc, 0x03,1);
 628  01a6 4b01          	push	#1
 629  01a8 ae0003        	ldw	x,#3
 630  01ab 89            	pushw	x
 631  01ac ae00dc        	ldw	x,#220
 632  01af 89            	pushw	x
 633  01b0 7b06          	ld	a,(OFST+6,sp)
 634  01b2 5f            	clrw	x
 635  01b3 97            	ld	xl,a
 636  01b4 d60007        	ld	a,(_address,x)
 637  01b7 cd0000        	call	_I2C_Send
 639  01ba 5b05          	addw	sp,#5
 640                     ; 47 					I2C_Send(address[N],0x00dd, 0xf8,1);
 642  01bc 4b01          	push	#1
 643  01be ae00f8        	ldw	x,#248
 644  01c1 89            	pushw	x
 645  01c2 ae00dd        	ldw	x,#221
 646  01c5 89            	pushw	x
 647  01c6 7b06          	ld	a,(OFST+6,sp)
 648  01c8 5f            	clrw	x
 649  01c9 97            	ld	xl,a
 650  01ca d60007        	ld	a,(_address,x)
 651  01cd cd0000        	call	_I2C_Send
 653  01d0 5b05          	addw	sp,#5
 654                     ; 48 					I2C_Send(address[N],0x009f, 0x00,1);
 656  01d2 4b01          	push	#1
 657  01d4 5f            	clrw	x
 658  01d5 89            	pushw	x
 659  01d6 ae009f        	ldw	x,#159
 660  01d9 89            	pushw	x
 661  01da 7b06          	ld	a,(OFST+6,sp)
 662  01dc 5f            	clrw	x
 663  01dd 97            	ld	xl,a
 664  01de d60007        	ld	a,(_address,x)
 665  01e1 cd0000        	call	_I2C_Send
 667  01e4 5b05          	addw	sp,#5
 668                     ; 49 					I2C_Send(address[N],0x00a3, 0x3c,1);
 670  01e6 4b01          	push	#1
 671  01e8 ae003c        	ldw	x,#60
 672  01eb 89            	pushw	x
 673  01ec ae00a3        	ldw	x,#163
 674  01ef 89            	pushw	x
 675  01f0 7b06          	ld	a,(OFST+6,sp)
 676  01f2 5f            	clrw	x
 677  01f3 97            	ld	xl,a
 678  01f4 d60007        	ld	a,(_address,x)
 679  01f7 cd0000        	call	_I2C_Send
 681  01fa 5b05          	addw	sp,#5
 682                     ; 50 					I2C_Send(address[N],0x00b7, 0x00,1);
 684  01fc 4b01          	push	#1
 685  01fe 5f            	clrw	x
 686  01ff 89            	pushw	x
 687  0200 ae00b7        	ldw	x,#183
 688  0203 89            	pushw	x
 689  0204 7b06          	ld	a,(OFST+6,sp)
 690  0206 5f            	clrw	x
 691  0207 97            	ld	xl,a
 692  0208 d60007        	ld	a,(_address,x)
 693  020b cd0000        	call	_I2C_Send
 695  020e 5b05          	addw	sp,#5
 696                     ; 51 					I2C_Send(address[N],0x00bb, 0x3c,1);
 698  0210 4b01          	push	#1
 699  0212 ae003c        	ldw	x,#60
 700  0215 89            	pushw	x
 701  0216 ae00bb        	ldw	x,#187
 702  0219 89            	pushw	x
 703  021a 7b06          	ld	a,(OFST+6,sp)
 704  021c 5f            	clrw	x
 705  021d 97            	ld	xl,a
 706  021e d60007        	ld	a,(_address,x)
 707  0221 cd0000        	call	_I2C_Send
 709  0224 5b05          	addw	sp,#5
 710                     ; 52 					I2C_Send(address[N],0x00b2, 0x09,1);
 712  0226 4b01          	push	#1
 713  0228 ae0009        	ldw	x,#9
 714  022b 89            	pushw	x
 715  022c ae00b2        	ldw	x,#178
 716  022f 89            	pushw	x
 717  0230 7b06          	ld	a,(OFST+6,sp)
 718  0232 5f            	clrw	x
 719  0233 97            	ld	xl,a
 720  0234 d60007        	ld	a,(_address,x)
 721  0237 cd0000        	call	_I2C_Send
 723  023a 5b05          	addw	sp,#5
 724                     ; 53 					I2C_Send(address[N],0x00ca, 0x09,1);
 726  023c 4b01          	push	#1
 727  023e ae0009        	ldw	x,#9
 728  0241 89            	pushw	x
 729  0242 ae00ca        	ldw	x,#202
 730  0245 89            	pushw	x
 731  0246 7b06          	ld	a,(OFST+6,sp)
 732  0248 5f            	clrw	x
 733  0249 97            	ld	xl,a
 734  024a d60007        	ld	a,(_address,x)
 735  024d cd0000        	call	_I2C_Send
 737  0250 5b05          	addw	sp,#5
 738                     ; 54 					I2C_Send(address[N],0x0198, 0x01,1);
 740  0252 4b01          	push	#1
 741  0254 ae0001        	ldw	x,#1
 742  0257 89            	pushw	x
 743  0258 ae0198        	ldw	x,#408
 744  025b 89            	pushw	x
 745  025c 7b06          	ld	a,(OFST+6,sp)
 746  025e 5f            	clrw	x
 747  025f 97            	ld	xl,a
 748  0260 d60007        	ld	a,(_address,x)
 749  0263 cd0000        	call	_I2C_Send
 751  0266 5b05          	addw	sp,#5
 752                     ; 55 					I2C_Send(address[N],0x01b0, 0x17,1);
 754  0268 4b01          	push	#1
 755  026a ae0017        	ldw	x,#23
 756  026d 89            	pushw	x
 757  026e ae01b0        	ldw	x,#432
 758  0271 89            	pushw	x
 759  0272 7b06          	ld	a,(OFST+6,sp)
 760  0274 5f            	clrw	x
 761  0275 97            	ld	xl,a
 762  0276 d60007        	ld	a,(_address,x)
 763  0279 cd0000        	call	_I2C_Send
 765  027c 5b05          	addw	sp,#5
 766                     ; 56 					I2C_Send(address[N],0x01ad, 0x00,1);
 768  027e 4b01          	push	#1
 769  0280 5f            	clrw	x
 770  0281 89            	pushw	x
 771  0282 ae01ad        	ldw	x,#429
 772  0285 89            	pushw	x
 773  0286 7b06          	ld	a,(OFST+6,sp)
 774  0288 5f            	clrw	x
 775  0289 97            	ld	xl,a
 776  028a d60007        	ld	a,(_address,x)
 777  028d cd0000        	call	_I2C_Send
 779  0290 5b05          	addw	sp,#5
 780                     ; 57 					I2C_Send(address[N],0x00ff, 0x05,1);
 782  0292 4b01          	push	#1
 783  0294 ae0005        	ldw	x,#5
 784  0297 89            	pushw	x
 785  0298 ae00ff        	ldw	x,#255
 786  029b 89            	pushw	x
 787  029c 7b06          	ld	a,(OFST+6,sp)
 788  029e 5f            	clrw	x
 789  029f 97            	ld	xl,a
 790  02a0 d60007        	ld	a,(_address,x)
 791  02a3 cd0000        	call	_I2C_Send
 793  02a6 5b05          	addw	sp,#5
 794                     ; 58 					I2C_Send(address[N],0x0100, 0x05,1);
 796  02a8 4b01          	push	#1
 797  02aa ae0005        	ldw	x,#5
 798  02ad 89            	pushw	x
 799  02ae ae0100        	ldw	x,#256
 800  02b1 89            	pushw	x
 801  02b2 7b06          	ld	a,(OFST+6,sp)
 802  02b4 5f            	clrw	x
 803  02b5 97            	ld	xl,a
 804  02b6 d60007        	ld	a,(_address,x)
 805  02b9 cd0000        	call	_I2C_Send
 807  02bc 5b05          	addw	sp,#5
 808                     ; 59 					I2C_Send(address[N],0x0199, 0x05,1);
 810  02be 4b01          	push	#1
 811  02c0 ae0005        	ldw	x,#5
 812  02c3 89            	pushw	x
 813  02c4 ae0199        	ldw	x,#409
 814  02c7 89            	pushw	x
 815  02c8 7b06          	ld	a,(OFST+6,sp)
 816  02ca 5f            	clrw	x
 817  02cb 97            	ld	xl,a
 818  02cc d60007        	ld	a,(_address,x)
 819  02cf cd0000        	call	_I2C_Send
 821  02d2 5b05          	addw	sp,#5
 822                     ; 60 					I2C_Send(address[N],0x01a6, 0x1b,1);
 824  02d4 4b01          	push	#1
 825  02d6 ae001b        	ldw	x,#27
 826  02d9 89            	pushw	x
 827  02da ae01a6        	ldw	x,#422
 828  02dd 89            	pushw	x
 829  02de 7b06          	ld	a,(OFST+6,sp)
 830  02e0 5f            	clrw	x
 831  02e1 97            	ld	xl,a
 832  02e2 d60007        	ld	a,(_address,x)
 833  02e5 cd0000        	call	_I2C_Send
 835  02e8 5b05          	addw	sp,#5
 836                     ; 61 					I2C_Send(address[N],0x01ac, 0x3e,1);
 838  02ea 4b01          	push	#1
 839  02ec ae003e        	ldw	x,#62
 840  02ef 89            	pushw	x
 841  02f0 ae01ac        	ldw	x,#428
 842  02f3 89            	pushw	x
 843  02f4 7b06          	ld	a,(OFST+6,sp)
 844  02f6 5f            	clrw	x
 845  02f7 97            	ld	xl,a
 846  02f8 d60007        	ld	a,(_address,x)
 847  02fb cd0000        	call	_I2C_Send
 849  02fe 5b05          	addw	sp,#5
 850                     ; 62 					I2C_Send(address[N],0x01a7, 0x1f,1);
 852  0300 4b01          	push	#1
 853  0302 ae001f        	ldw	x,#31
 854  0305 89            	pushw	x
 855  0306 ae01a7        	ldw	x,#423
 856  0309 89            	pushw	x
 857  030a 7b06          	ld	a,(OFST+6,sp)
 858  030c 5f            	clrw	x
 859  030d 97            	ld	xl,a
 860  030e d60007        	ld	a,(_address,x)
 861  0311 cd0000        	call	_I2C_Send
 863  0314 5b05          	addw	sp,#5
 864                     ; 63 					I2C_Send(address[N],0x0030, 0x00,1);
 866  0316 4b01          	push	#1
 867  0318 5f            	clrw	x
 868  0319 89            	pushw	x
 869  031a ae0030        	ldw	x,#48
 870  031d 89            	pushw	x
 871  031e 7b06          	ld	a,(OFST+6,sp)
 872  0320 5f            	clrw	x
 873  0321 97            	ld	xl,a
 874  0322 d60007        	ld	a,(_address,x)
 875  0325 cd0000        	call	_I2C_Send
 877  0328 5b05          	addw	sp,#5
 878                     ; 64 					if (I2C_Recv(address[N],__VL6180X_IDENTIFICATION_MODEL_ID,1,1)[0] != 0xB4){
 880  032a 4b01          	push	#1
 881  032c 4b01          	push	#1
 882  032e 5f            	clrw	x
 883  032f 89            	pushw	x
 884  0330 7b05          	ld	a,(OFST+5,sp)
 885  0332 5f            	clrw	x
 886  0333 97            	ld	xl,a
 887  0334 d60007        	ld	a,(_address,x)
 888  0337 cd0000        	call	_I2C_Recv
 890  033a 5b04          	addw	sp,#4
 891  033c f6            	ld	a,(x)
 892  033d a1b4          	cp	a,#180
 893  033f 2708          	jreq	L112
 894                     ; 65 						Serial_Send_String("Not a valid sensor id");
 896  0341 ae002e        	ldw	x,#L312
 897  0344 cd0000        	call	_Serial_Send_String
 900  0347 2006          	jra	L512
 901  0349               L112:
 902                     ; 68 						Serial_Send_String("valid sensor id");
 904  0349 ae001e        	ldw	x,#L712
 905  034c cd0000        	call	_Serial_Send_String
 907  034f               L512:
 908                     ; 70 					VL6180X_DefaultSettings(N);
 910  034f 7b01          	ld	a,(OFST+1,sp)
 911  0351 ad0b          	call	_VL6180X_DefaultSettings
 913                     ; 71 					VL6180X_ChangeAddress(N,newAddress);
 915  0353 7b02          	ld	a,(OFST+2,sp)
 916  0355 97            	ld	xl,a
 917  0356 7b01          	ld	a,(OFST+1,sp)
 918  0358 95            	ld	xh,a
 919  0359 cd04a9        	call	_VL6180X_ChangeAddress
 921  035c               L702:
 922                     ; 73 }
 925  035c 85            	popw	x
 926  035d 81            	ret
 961                     ; 75     void VL6180X_DefaultSettings(uint8_t N){
 962                     	switch	.text
 963  035e               _VL6180X_DefaultSettings:
 965  035e 88            	push	a
 966       00000000      OFST:	set	0
 969                     ; 79         I2C_Send(address[N],__VL6180X_SYSTEM_MODE_GPIO1, 0x10,1);
 971  035f 4b01          	push	#1
 972  0361 ae0010        	ldw	x,#16
 973  0364 89            	pushw	x
 974  0365 ae0011        	ldw	x,#17
 975  0368 89            	pushw	x
 976  0369 5f            	clrw	x
 977  036a 97            	ld	xl,a
 978  036b d60007        	ld	a,(_address,x)
 979  036e cd0000        	call	_I2C_Send
 981  0371 5b05          	addw	sp,#5
 982                     ; 81         I2C_Send(address[N],__VL6180X_READOUT_AVERAGING_SAMPLE_PERIOD, 0x30,1);
 984  0373 4b01          	push	#1
 985  0375 ae0030        	ldw	x,#48
 986  0378 89            	pushw	x
 987  0379 ae010a        	ldw	x,#266
 988  037c 89            	pushw	x
 989  037d 7b06          	ld	a,(OFST+6,sp)
 990  037f 5f            	clrw	x
 991  0380 97            	ld	xl,a
 992  0381 d60007        	ld	a,(_address,x)
 993  0384 cd0000        	call	_I2C_Send
 995  0387 5b05          	addw	sp,#5
 996                     ; 83         I2C_Send(address[N],__VL6180X_SYSALS_ANALOGUE_GAIN, 0x46,1);
 998  0389 4b01          	push	#1
 999  038b ae0046        	ldw	x,#70
1000  038e 89            	pushw	x
1001  038f ae003f        	ldw	x,#63
1002  0392 89            	pushw	x
1003  0393 7b06          	ld	a,(OFST+6,sp)
1004  0395 5f            	clrw	x
1005  0396 97            	ld	xl,a
1006  0397 d60007        	ld	a,(_address,x)
1007  039a cd0000        	call	_I2C_Send
1009  039d 5b05          	addw	sp,#5
1010                     ; 85         I2C_Send(address[N],__VL6180X_SYSRANGE_VHV_REPEAT_RATE, 0xFF,1);
1012  039f 4b01          	push	#1
1013  03a1 ae00ff        	ldw	x,#255
1014  03a4 89            	pushw	x
1015  03a5 ae0031        	ldw	x,#49
1016  03a8 89            	pushw	x
1017  03a9 7b06          	ld	a,(OFST+6,sp)
1018  03ab 5f            	clrw	x
1019  03ac 97            	ld	xl,a
1020  03ad d60007        	ld	a,(_address,x)
1021  03b0 cd0000        	call	_I2C_Send
1023  03b3 5b05          	addw	sp,#5
1024                     ; 87         I2C_Send(address[N],__VL6180X_SYSALS_INTEGRATION_PERIOD, 0x63,1);
1026  03b5 4b01          	push	#1
1027  03b7 ae0063        	ldw	x,#99
1028  03ba 89            	pushw	x
1029  03bb ae0040        	ldw	x,#64
1030  03be 89            	pushw	x
1031  03bf 7b06          	ld	a,(OFST+6,sp)
1032  03c1 5f            	clrw	x
1033  03c2 97            	ld	xl,a
1034  03c3 d60007        	ld	a,(_address,x)
1035  03c6 cd0000        	call	_I2C_Send
1037  03c9 5b05          	addw	sp,#5
1038                     ; 89         I2C_Send(address[N],__VL6180X_SYSRANGE_VHV_RECALIBRATE, 0x01,1);
1040  03cb 4b01          	push	#1
1041  03cd ae0001        	ldw	x,#1
1042  03d0 89            	pushw	x
1043  03d1 ae002e        	ldw	x,#46
1044  03d4 89            	pushw	x
1045  03d5 7b06          	ld	a,(OFST+6,sp)
1046  03d7 5f            	clrw	x
1047  03d8 97            	ld	xl,a
1048  03d9 d60007        	ld	a,(_address,x)
1049  03dc cd0000        	call	_I2C_Send
1051  03df 5b05          	addw	sp,#5
1052                     ; 93         I2C_Send(address[N],__VL6180X_SYSRANGE_INTERMEASUREMENT_PERIOD, 0x09,1);
1054  03e1 4b01          	push	#1
1055  03e3 ae0009        	ldw	x,#9
1056  03e6 89            	pushw	x
1057  03e7 ae001b        	ldw	x,#27
1058  03ea 89            	pushw	x
1059  03eb 7b06          	ld	a,(OFST+6,sp)
1060  03ed 5f            	clrw	x
1061  03ee 97            	ld	xl,a
1062  03ef d60007        	ld	a,(_address,x)
1063  03f2 cd0000        	call	_I2C_Send
1065  03f5 5b05          	addw	sp,#5
1066                     ; 95         I2C_Send(address[N],__VL6180X_SYSALS_INTERMEASUREMENT_PERIOD, 0x31,1);
1068  03f7 4b01          	push	#1
1069  03f9 ae0031        	ldw	x,#49
1070  03fc 89            	pushw	x
1071  03fd ae003e        	ldw	x,#62
1072  0400 89            	pushw	x
1073  0401 7b06          	ld	a,(OFST+6,sp)
1074  0403 5f            	clrw	x
1075  0404 97            	ld	xl,a
1076  0405 d60007        	ld	a,(_address,x)
1077  0408 cd0000        	call	_I2C_Send
1079  040b 5b05          	addw	sp,#5
1080                     ; 97         I2C_Send(address[N],__VL6180X_SYSTEM_INTERRUPT_CONFIG_GPIO, 0x24,1);
1082  040d 4b01          	push	#1
1083  040f ae0024        	ldw	x,#36
1084  0412 89            	pushw	x
1085  0413 ae0014        	ldw	x,#20
1086  0416 89            	pushw	x
1087  0417 7b06          	ld	a,(OFST+6,sp)
1088  0419 5f            	clrw	x
1089  041a 97            	ld	xl,a
1090  041b d60007        	ld	a,(_address,x)
1091  041e cd0000        	call	_I2C_Send
1093  0421 5b05          	addw	sp,#5
1094                     ; 99         I2C_Send(address[N],__VL6180X_SYSRANGE_MAX_CONVERGENCE_TIME, 0x32,1);
1096  0423 4b01          	push	#1
1097  0425 ae0032        	ldw	x,#50
1098  0428 89            	pushw	x
1099  0429 ae001c        	ldw	x,#28
1100  042c 89            	pushw	x
1101  042d 7b06          	ld	a,(OFST+6,sp)
1102  042f 5f            	clrw	x
1103  0430 97            	ld	xl,a
1104  0431 d60007        	ld	a,(_address,x)
1105  0434 cd0000        	call	_I2C_Send
1107  0437 5b05          	addw	sp,#5
1108                     ; 100         I2C_Send(address[N],__VL6180X_SYSRANGE_RANGE_CHECK_ENABLES, 0x10,1);
1110  0439 4b01          	push	#1
1111  043b ae0010        	ldw	x,#16
1112  043e 89            	pushw	x
1113  043f ae002d        	ldw	x,#45
1114  0442 89            	pushw	x
1115  0443 7b06          	ld	a,(OFST+6,sp)
1116  0445 5f            	clrw	x
1117  0446 97            	ld	xl,a
1118  0447 d60007        	ld	a,(_address,x)
1119  044a cd0000        	call	_I2C_Send
1121  044d 5b05          	addw	sp,#5
1122                     ; 101         I2C_Send(address[N],__VL6180X_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE, 0x7B,1);
1124  044f 4b01          	push	#1
1125  0451 ae007b        	ldw	x,#123
1126  0454 89            	pushw	x
1127  0455 ae0022        	ldw	x,#34
1128  0458 89            	pushw	x
1129  0459 7b06          	ld	a,(OFST+6,sp)
1130  045b 5f            	clrw	x
1131  045c 97            	ld	xl,a
1132  045d d60007        	ld	a,(_address,x)
1133  0460 cd0000        	call	_I2C_Send
1135  0463 5b05          	addw	sp,#5
1136                     ; 102         I2C_Send(address[N],__VL6180X_SYSALS_INTEGRATION_PERIOD, 0x64,1);
1138  0465 4b01          	push	#1
1139  0467 ae0064        	ldw	x,#100
1140  046a 89            	pushw	x
1141  046b ae0040        	ldw	x,#64
1142  046e 89            	pushw	x
1143  046f 7b06          	ld	a,(OFST+6,sp)
1144  0471 5f            	clrw	x
1145  0472 97            	ld	xl,a
1146  0473 d60007        	ld	a,(_address,x)
1147  0476 cd0000        	call	_I2C_Send
1149  0479 5b05          	addw	sp,#5
1150                     ; 103         I2C_Send(address[N],__VL6180X_SYSALS_ANALOGUE_GAIN, 0x40,1);
1152  047b 4b01          	push	#1
1153  047d ae0040        	ldw	x,#64
1154  0480 89            	pushw	x
1155  0481 ae003f        	ldw	x,#63
1156  0484 89            	pushw	x
1157  0485 7b06          	ld	a,(OFST+6,sp)
1158  0487 5f            	clrw	x
1159  0488 97            	ld	xl,a
1160  0489 d60007        	ld	a,(_address,x)
1161  048c cd0000        	call	_I2C_Send
1163  048f 5b05          	addw	sp,#5
1164                     ; 104         I2C_Send(address[N],__VL6180X_FIRMWARE_RESULT_SCALER, 0x01,1);
1166  0491 4b01          	push	#1
1167  0493 ae0001        	ldw	x,#1
1168  0496 89            	pushw	x
1169  0497 ae0120        	ldw	x,#288
1170  049a 89            	pushw	x
1171  049b 7b06          	ld	a,(OFST+6,sp)
1172  049d 5f            	clrw	x
1173  049e 97            	ld	xl,a
1174  049f d60007        	ld	a,(_address,x)
1175  04a2 cd0000        	call	_I2C_Send
1177  04a5 5b05          	addw	sp,#5
1178                     ; 106 }
1181  04a7 84            	pop	a
1182  04a8 81            	ret
1226                     ; 107     uint8_t VL6180X_ChangeAddress(uint8_t N, uint8_t new_address){
1227                     	switch	.text
1228  04a9               _VL6180X_ChangeAddress:
1230  04a9 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 110         if (address[N] == new_address) return address[N];
1236  04aa 9e            	ld	a,xh
1237  04ab 5f            	clrw	x
1238  04ac 97            	ld	xl,a
1239  04ad d60007        	ld	a,(_address,x)
1240  04b0 1102          	cp	a,(OFST+2,sp)
1241  04b2 2609          	jrne	L352
1244  04b4 7b01          	ld	a,(OFST+1,sp)
1245  04b6 5f            	clrw	x
1246  04b7 97            	ld	xl,a
1247  04b8 d60007        	ld	a,(_address,x)
1249  04bb 200d          	jra	L41
1250  04bd               L352:
1251                     ; 111         if (new_address > 127) return address[N];
1253  04bd 7b02          	ld	a,(OFST+2,sp)
1254  04bf a180          	cp	a,#128
1255  04c1 2509          	jrult	L552
1258  04c3 7b01          	ld	a,(OFST+1,sp)
1259  04c5 5f            	clrw	x
1260  04c6 97            	ld	xl,a
1261  04c7 d60007        	ld	a,(_address,x)
1263  04ca               L41:
1265  04ca 85            	popw	x
1266  04cb 81            	ret
1267  04cc               L552:
1268                     ; 112         I2C_Send(address[N], __VL6180X_I2C_SLAVE_DEVICE_ADDRESS, new_address, 1);
1270  04cc 4b01          	push	#1
1271  04ce 7b03          	ld	a,(OFST+3,sp)
1272  04d0 5f            	clrw	x
1273  04d1 97            	ld	xl,a
1274  04d2 89            	pushw	x
1275  04d3 ae0212        	ldw	x,#530
1276  04d6 89            	pushw	x
1277  04d7 7b06          	ld	a,(OFST+6,sp)
1278  04d9 5f            	clrw	x
1279  04da 97            	ld	xl,a
1280  04db d60007        	ld	a,(_address,x)
1281  04de cd0000        	call	_I2C_Send
1283  04e1 5b05          	addw	sp,#5
1284                     ; 113 				Serial_Send_Hex(address[N]);
1286  04e3 7b01          	ld	a,(OFST+1,sp)
1287  04e5 5f            	clrw	x
1288  04e6 97            	ld	xl,a
1289  04e7 d60007        	ld	a,(_address,x)
1290  04ea b703          	ld	c_lreg+3,a
1291  04ec 3f02          	clr	c_lreg+2
1292  04ee 3f01          	clr	c_lreg+1
1293  04f0 3f00          	clr	c_lreg
1294  04f2 be02          	ldw	x,c_lreg+2
1295  04f4 89            	pushw	x
1296  04f5 be00          	ldw	x,c_lreg
1297  04f7 89            	pushw	x
1298  04f8 cd0000        	call	_Serial_Send_Hex
1300  04fb 5b04          	addw	sp,#4
1301                     ; 114         address[N] = new_address;
1303  04fd 7b01          	ld	a,(OFST+1,sp)
1304  04ff 5f            	clrw	x
1305  0500 97            	ld	xl,a
1306  0501 7b02          	ld	a,(OFST+2,sp)
1307  0503 d70007        	ld	(_address,x),a
1308                     ; 115 				Serial_Send_Hex(address[N]);
1310  0506 7b01          	ld	a,(OFST+1,sp)
1311  0508 5f            	clrw	x
1312  0509 97            	ld	xl,a
1313  050a d60007        	ld	a,(_address,x)
1314  050d b703          	ld	c_lreg+3,a
1315  050f 3f02          	clr	c_lreg+2
1316  0511 3f01          	clr	c_lreg+1
1317  0513 3f00          	clr	c_lreg
1318  0515 be02          	ldw	x,c_lreg+2
1319  0517 89            	pushw	x
1320  0518 be00          	ldw	x,c_lreg
1321  051a 89            	pushw	x
1322  051b cd0000        	call	_Serial_Send_Hex
1324  051e 5b04          	addw	sp,#4
1325                     ; 116         return I2C_Recv(address[N], __VL6180X_I2C_SLAVE_DEVICE_ADDRESS,1,1)[0];
1327  0520 4b01          	push	#1
1328  0522 4b01          	push	#1
1329  0524 ae0212        	ldw	x,#530
1330  0527 89            	pushw	x
1331  0528 7b05          	ld	a,(OFST+5,sp)
1332  052a 5f            	clrw	x
1333  052b 97            	ld	xl,a
1334  052c d60007        	ld	a,(_address,x)
1335  052f cd0000        	call	_I2C_Recv
1337  0532 5b04          	addw	sp,#4
1338  0534 f6            	ld	a,(x)
1340  0535 2093          	jra	L41
1384                     ; 118     uint8_t VL6180X_GetDistance(uint8_t N){
1385                     	switch	.text
1386  0537               _VL6180X_GetDistance:
1388  0537 88            	push	a
1389  0538 89            	pushw	x
1390       00000002      OFST:	set	2
1393                     ; 121         I2C_Send(address[N],__VL6180X_SYSRANGE_START, 0x01, 1);
1395  0539 4b01          	push	#1
1396  053b ae0001        	ldw	x,#1
1397  053e 89            	pushw	x
1398  053f ae0018        	ldw	x,#24
1399  0542 89            	pushw	x
1400  0543 5f            	clrw	x
1401  0544 97            	ld	xl,a
1402  0545 d60007        	ld	a,(_address,x)
1403  0548 cd0000        	call	_I2C_Send
1405  054b 5b05          	addw	sp,#5
1406                     ; 122 				delay_ms(10);
1408  054d ae000a        	ldw	x,#10
1409  0550 89            	pushw	x
1410  0551 ae0000        	ldw	x,#0
1411  0554 89            	pushw	x
1412  0555 cd0000        	call	_delay_ms
1414  0558 5b04          	addw	sp,#4
1415                     ; 123         distance = I2C_Recv(address[N],__VL6180X_RESULT_RANGE_VAL,1,1)[0];
1417  055a 4b01          	push	#1
1418  055c 4b01          	push	#1
1419  055e ae0062        	ldw	x,#98
1420  0561 89            	pushw	x
1421  0562 7b07          	ld	a,(OFST+5,sp)
1422  0564 5f            	clrw	x
1423  0565 97            	ld	xl,a
1424  0566 d60007        	ld	a,(_address,x)
1425  0569 cd0000        	call	_I2C_Recv
1427  056c 5b04          	addw	sp,#4
1428  056e f6            	ld	a,(x)
1429  056f 5f            	clrw	x
1430  0570 97            	ld	xl,a
1431  0571 1f01          	ldw	(OFST-1,sp),x
1433                     ; 124         I2C_Send(address[N],__VL6180X_SYSTEM_INTERRUPT_CLEAR, 0x07, 1);
1435  0573 4b01          	push	#1
1436  0575 ae0007        	ldw	x,#7
1437  0578 89            	pushw	x
1438  0579 ae0015        	ldw	x,#21
1439  057c 89            	pushw	x
1440  057d 7b08          	ld	a,(OFST+6,sp)
1441  057f 5f            	clrw	x
1442  0580 97            	ld	xl,a
1443  0581 d60007        	ld	a,(_address,x)
1444  0584 cd0000        	call	_I2C_Send
1446  0587 5b05          	addw	sp,#5
1447                     ; 125         return distance;
1449  0589 7b02          	ld	a,(OFST+0,sp)
1452  058b 5b03          	addw	sp,#3
1453  058d 81            	ret
1486                     ; 127  uint8_t VL6180X_GetWalls(){
1487                     	switch	.text
1488  058e               _VL6180X_GetWalls:
1490  058e 88            	push	a
1491       00000001      OFST:	set	1
1494                     ; 128 	u8 walls=0;
1496  058f 0f01          	clr	(OFST+0,sp)
1498                     ; 129 	if (VL6180X_GetDistance(0)<100 && VL6180X_GetDistance(1)<100) walls|=1<<0;
1500  0591 4f            	clr	a
1501  0592 ada3          	call	_VL6180X_GetDistance
1503  0594 a164          	cp	a,#100
1504  0596 240e          	jruge	L113
1506  0598 a601          	ld	a,#1
1507  059a ad9b          	call	_VL6180X_GetDistance
1509  059c a164          	cp	a,#100
1510  059e 2406          	jruge	L113
1513  05a0 7b01          	ld	a,(OFST+0,sp)
1514  05a2 aa01          	or	a,#1
1515  05a4 6b01          	ld	(OFST+0,sp),a
1517  05a6               L113:
1518                     ; 130 	if (VL6180X_GetDistance(2)<100 && VL6180X_GetDistance(3)<100) walls|=1<<1;
1520  05a6 a602          	ld	a,#2
1521  05a8 ad8d          	call	_VL6180X_GetDistance
1523  05aa a164          	cp	a,#100
1524  05ac 240e          	jruge	L313
1526  05ae a603          	ld	a,#3
1527  05b0 ad85          	call	_VL6180X_GetDistance
1529  05b2 a164          	cp	a,#100
1530  05b4 2406          	jruge	L313
1533  05b6 7b01          	ld	a,(OFST+0,sp)
1534  05b8 aa02          	or	a,#2
1535  05ba 6b01          	ld	(OFST+0,sp),a
1537  05bc               L313:
1538                     ; 131 	if (VL6180X_GetDistance(4)<100 && VL6180X_GetDistance(5)<100) walls|=1<<2;
1540  05bc a604          	ld	a,#4
1541  05be cd0537        	call	_VL6180X_GetDistance
1543  05c1 a164          	cp	a,#100
1544  05c3 240f          	jruge	L513
1546  05c5 a605          	ld	a,#5
1547  05c7 cd0537        	call	_VL6180X_GetDistance
1549  05ca a164          	cp	a,#100
1550  05cc 2406          	jruge	L513
1553  05ce 7b01          	ld	a,(OFST+0,sp)
1554  05d0 aa04          	or	a,#4
1555  05d2 6b01          	ld	(OFST+0,sp),a
1557  05d4               L513:
1558                     ; 132 	return walls;
1560  05d4 7b01          	ld	a,(OFST+0,sp)
1563  05d6 5b01          	addw	sp,#1
1564  05d8 81            	ret
1621                     	xref	_Serial_Send_String
1622                     	xref	_Serial_Send_Hex
1623                     	xref	_I2C_Recv
1624                     	xref	_I2C_Send
1625                     	xdef	_VL6180X_GetWalls
1626                     	xdef	_VL6180X_GetDistance
1627                     	xdef	_VL6180X_ChangeAddress
1628                     	xdef	_VL6180X_DefaultSettings
1629                     	xdef	_VL6180X_Init
1630                     	switch	.bss
1631  0000               _ready:
1632  0000 000000000000  	ds.b	7
1633                     	xdef	_ready
1634  0007               _address:
1635  0007 000000000000  	ds.b	7
1636                     	xdef	_address
1637                     	xref	_delay_ms
1638                     	xref	_GPIO_WriteHigh
1639                     	switch	.const
1640  001e               L712:
1641  001e 76616c696420  	dc.b	"valid sensor id",0
1642  002e               L312:
1643  002e 4e6f74206120  	dc.b	"Not a valid sensor"
1644  0040 20696400      	dc.b	" id",0
1645  0044               L502:
1646  0044 46414c53450a  	dc.b	"FALSE",10,0
1647  004b               L571:
1648  004b 545255450a00  	dc.b	"TRUE",10,0
1649  0051               L171:
1650  0051 46726573680a  	dc.b	"Fresh",10,0
1651                     	xref.b	c_lreg
1671                     	end
