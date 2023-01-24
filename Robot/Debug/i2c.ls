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
 119                     	switch	.data
 120  0000               _start:
 121  0000 00            	dc.b	0
 122  0001               _startedCom:
 123  0001 00            	dc.b	0
 124  0002               _secondSent:
 125  0002 00            	dc.b	0
 126  0003               _I2C_received:
 127  0003 00            	dc.b	0
 354                     ; 13 ErrorStatus I2C_CheckEvent1(I2C_Event_TypeDef I2C_Event)
 354                     ; 14 {
 356                     	switch	.text
 357  0000               _I2C_CheckEvent1:
 359  0000 89            	pushw	x
 360  0001 5206          	subw	sp,#6
 361       00000006      OFST:	set	6
 364                     ; 15   __IO uint16_t lastevent = 0x00;
 366  0003 5f            	clrw	x
 367  0004 1f04          	ldw	(OFST-2,sp),x
 369                     ; 16   uint8_t flag1 = 0x00 ;
 371                     ; 17   uint8_t flag2 = 0x00;
 373                     ; 18   ErrorStatus status = ERROR;
 375                     ; 21   assert_param(IS_I2C_EVENT_OK(I2C_Event));
 377                     ; 23   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
 379  0006 1e07          	ldw	x,(OFST+1,sp)
 380  0008 a30004        	cpw	x,#4
 381  000b 260b          	jrne	L361
 382                     ; 25     lastevent = I2C->SR2 & I2C_SR2_AF;
 384  000d c65218        	ld	a,21016
 385  0010 a404          	and	a,#4
 386  0012 5f            	clrw	x
 387  0013 97            	ld	xl,a
 388  0014 1f04          	ldw	(OFST-2,sp),x
 391  0016 2036          	jra	L561
 392  0018               L361:
 393                     ; 29     flag1 = I2C->SR1;
 395  0018 c65217        	ld	a,21015
 396  001b 6b03          	ld	(OFST-3,sp),a
 398                     ; 30     flag2 = I2C->SR3;
 400  001d c65219        	ld	a,21017
 401  0020 6b06          	ld	(OFST+0,sp),a
 403                     ; 31     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
 405  0022 7b03          	ld	a,(OFST-3,sp)
 406  0024 5f            	clrw	x
 407  0025 97            	ld	xl,a
 408  0026 1f01          	ldw	(OFST-5,sp),x
 410  0028 7b06          	ld	a,(OFST+0,sp)
 411  002a 5f            	clrw	x
 412  002b 97            	ld	xl,a
 413  002c 4f            	clr	a
 414  002d 02            	rlwa	x,a
 415  002e 01            	rrwa	x,a
 416  002f 1a02          	or	a,(OFST-4,sp)
 417  0031 01            	rrwa	x,a
 418  0032 1a01          	or	a,(OFST-5,sp)
 419  0034 01            	rrwa	x,a
 420  0035 1f04          	ldw	(OFST-2,sp),x
 422                     ; 32 		if(lastevent!=0x44)Serial_Send_Hex(lastevent);
 424  0037 1e04          	ldw	x,(OFST-2,sp)
 425  0039 a30044        	cpw	x,#68
 426  003c 2710          	jreq	L561
 429  003e 1e04          	ldw	x,(OFST-2,sp)
 430  0040 cd0000        	call	c_uitolx
 432  0043 be02          	ldw	x,c_lreg+2
 433  0045 89            	pushw	x
 434  0046 be00          	ldw	x,c_lreg
 435  0048 89            	pushw	x
 436  0049 cd0000        	call	_Serial_Send_Hex
 438  004c 5b04          	addw	sp,#4
 439  004e               L561:
 440                     ; 35   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
 442  004e 1e04          	ldw	x,(OFST-2,sp)
 443  0050 01            	rrwa	x,a
 444  0051 1408          	and	a,(OFST+2,sp)
 445  0053 01            	rrwa	x,a
 446  0054 1407          	and	a,(OFST+1,sp)
 447  0056 01            	rrwa	x,a
 448  0057 1307          	cpw	x,(OFST+1,sp)
 449  0059 2606          	jrne	L171
 450                     ; 38     status = SUCCESS;
 452  005b a601          	ld	a,#1
 453  005d 6b06          	ld	(OFST+0,sp),a
 456  005f 2002          	jra	L371
 457  0061               L171:
 458                     ; 43     status = ERROR;
 460  0061 0f06          	clr	(OFST+0,sp)
 462  0063               L371:
 463                     ; 47   return status;
 465  0063 7b06          	ld	a,(OFST+0,sp)
 468  0065 5b08          	addw	sp,#8
 469  0067 81            	ret
 511                     ; 51 void InitI2C(void){
 512                     	switch	.text
 513  0068               _InitI2C:
 515  0068 89            	pushw	x
 516       00000002      OFST:	set	2
 519                     ; 52 	int i=0;
 521                     ; 54 	GPIO_DeInit(GPIOE);
 523  0069 ae5014        	ldw	x,#20500
 524  006c cd0000        	call	_GPIO_DeInit
 526                     ; 55 	GPIO_Init(GPIOE,GPIO_PIN_1|GPIO_PIN_2, GPIO_MODE_OUT_OD_HIZ_FAST);
 528  006f 4bb0          	push	#176
 529  0071 4b06          	push	#6
 530  0073 ae5014        	ldw	x,#20500
 531  0076 cd0000        	call	_GPIO_Init
 533  0079 85            	popw	x
 534                     ; 56 	GPIO_Init(GPIOC, GPIO_PIN_6|GPIO_PIN_7 , GPIO_MODE_OUT_PP_LOW_FAST);
 536  007a 4be0          	push	#224
 537  007c 4bc0          	push	#192
 538  007e ae500a        	ldw	x,#20490
 539  0081 cd0000        	call	_GPIO_Init
 541  0084 85            	popw	x
 542                     ; 57 	GPIO_Init(GPIOG, GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
 544  0085 4be0          	push	#224
 545  0087 4b3f          	push	#63
 546  0089 ae501e        	ldw	x,#20510
 547  008c cd0000        	call	_GPIO_Init
 549  008f 85            	popw	x
 550                     ; 58 	GPIO_WriteLow(GPIOG, GPIO_PIN_ALL);
 552  0090 4bff          	push	#255
 553  0092 ae501e        	ldw	x,#20510
 554  0095 cd0000        	call	_GPIO_WriteLow
 556  0098 84            	pop	a
 557                     ; 59 	GPIO_WriteLow(GPIOC, GPIO_PIN_6|GPIO_PIN_7);
 559  0099 4bc0          	push	#192
 560  009b ae500a        	ldw	x,#20490
 561  009e cd0000        	call	_GPIO_WriteLow
 563  00a1 84            	pop	a
 564                     ; 60 	delay_ms(30000);
 566  00a2 ae7530        	ldw	x,#30000
 567  00a5 89            	pushw	x
 568  00a6 ae0000        	ldw	x,#0
 569  00a9 89            	pushw	x
 570  00aa cd0000        	call	_delay_ms
 572  00ad 5b04          	addw	sp,#4
 573                     ; 61 	I2C_DeInit();
 575  00af cd0000        	call	_I2C_DeInit
 577                     ; 62 	I2C_Init(I2C_MAX_STANDARD_FREQ, 0xA0, I2C_DUTYCYCLE_2, I2C_ACK_NONE, I2C_ADDMODE_7BIT, 16);
 579  00b2 4b10          	push	#16
 580  00b4 4b00          	push	#0
 581  00b6 4b00          	push	#0
 582  00b8 4b00          	push	#0
 583  00ba ae00a0        	ldw	x,#160
 584  00bd 89            	pushw	x
 585  00be ae86a0        	ldw	x,#34464
 586  00c1 89            	pushw	x
 587  00c2 ae0001        	ldw	x,#1
 588  00c5 89            	pushw	x
 589  00c6 cd0000        	call	_I2C_Init
 591  00c9 5b0a          	addw	sp,#10
 592                     ; 63 	for (i=7;i>5;i--)VL6180X_Init((7-i),0x20+(7-i)*2,GPIOC,1<<i);
 594  00cb ae0007        	ldw	x,#7
 595  00ce 1f01          	ldw	(OFST-1,sp),x
 597  00d0               L112:
 600  00d0 7b02          	ld	a,(OFST+0,sp)
 601  00d2 5f            	clrw	x
 602  00d3 4d            	tnz	a
 603  00d4 2a01          	jrpl	L01
 604  00d6 53            	cplw	x
 605  00d7               L01:
 606  00d7 97            	ld	xl,a
 607  00d8 a601          	ld	a,#1
 608  00da 5d            	tnzw	x
 609  00db 2704          	jreq	L21
 610  00dd               L41:
 611  00dd 48            	sll	a
 612  00de 5a            	decw	x
 613  00df 26fc          	jrne	L41
 614  00e1               L21:
 615  00e1 88            	push	a
 616  00e2 ae500a        	ldw	x,#20490
 617  00e5 89            	pushw	x
 618  00e6 a607          	ld	a,#7
 619  00e8 1005          	sub	a,(OFST+3,sp)
 620  00ea 48            	sll	a
 621  00eb ab20          	add	a,#32
 622  00ed 97            	ld	xl,a
 623  00ee a607          	ld	a,#7
 624  00f0 1005          	sub	a,(OFST+3,sp)
 625  00f2 95            	ld	xh,a
 626  00f3 cd0000        	call	_VL6180X_Init
 628  00f6 5b03          	addw	sp,#3
 631  00f8 1e01          	ldw	x,(OFST-1,sp)
 632  00fa 1d0001        	subw	x,#1
 633  00fd 1f01          	ldw	(OFST-1,sp),x
 637  00ff 9c            	rvf
 638  0100 1e01          	ldw	x,(OFST-1,sp)
 639  0102 a30006        	cpw	x,#6
 640  0105 2ec9          	jrsge	L112
 641                     ; 65 	Serial_Send_String("laser ok\n");
 643  0107 ae00e5        	ldw	x,#L712
 644  010a cd0000        	call	_Serial_Send_String
 646                     ; 66 	if(!BNO055_Init(OPERATION_MODE_NDOF))Serial_Send_String("gyro non va\n");
 648  010d a60c          	ld	a,#12
 649  010f cd0000        	call	_BNO055_Init
 651  0112 4d            	tnz	a
 652  0113 2608          	jrne	L122
 655  0115 ae00d8        	ldw	x,#L322
 656  0118 cd0000        	call	_Serial_Send_String
 659  011b 2006          	jra	L522
 660  011d               L122:
 661                     ; 67 	else Serial_Send_String("va da dio\n");
 663  011d ae00cd        	ldw	x,#L722
 664  0120 cd0000        	call	_Serial_Send_String
 666  0123               L522:
 667                     ; 68 	delay_ms(1000);
 669  0123 ae03e8        	ldw	x,#1000
 670  0126 89            	pushw	x
 671  0127 ae0000        	ldw	x,#0
 672  012a 89            	pushw	x
 673  012b cd0000        	call	_delay_ms
 675  012e 5b04          	addw	sp,#4
 676                     ; 69 	BNO055_SetExternalCrystalUse(TRUE);
 678  0130 a601          	ld	a,#1
 679  0132 cd0000        	call	_BNO055_SetExternalCrystalUse
 681                     ; 70 	delay_ms(1000);
 683  0135 ae03e8        	ldw	x,#1000
 684  0138 89            	pushw	x
 685  0139 ae0000        	ldw	x,#0
 686  013c 89            	pushw	x
 687  013d cd0000        	call	_delay_ms
 689  0140 5b04          	addw	sp,#4
 690                     ; 71 }
 693  0142 85            	popw	x
 694  0143 81            	ret
 811                     ; 73 uint8_t I2C_Send(uint8_t EdiS_add, uint16_t register_EdiS_address, uint16_t iData, bool VL6180X)
 811                     ; 74 {
 812                     	switch	.text
 813  0144               _I2C_Send:
 815  0144 88            	push	a
 816  0145 5204          	subw	sp,#4
 817       00000004      OFST:	set	4
 820                     ; 75 	uint8_t a1 = (uint8_t)((register_EdiS_address >> 8) & 0xFF);
 822  0147 7b08          	ld	a,(OFST+4,sp)
 823  0149 6b02          	ld	(OFST-2,sp),a
 825                     ; 76 	uint8_t a0 = (uint8_t)(register_EdiS_address & 0xFF);
 827  014b 7b09          	ld	a,(OFST+5,sp)
 828  014d a4ff          	and	a,#255
 829  014f 6b03          	ld	(OFST-1,sp),a
 831                     ; 77 	uint8_t d1 = (uint8_t)((iData >> 8) & 0xFF);
 833                     ; 78 	uint8_t d0 = (uint8_t)(iData & 0xFF);
 835  0151 7b0b          	ld	a,(OFST+7,sp)
 836  0153 a4ff          	and	a,#255
 837  0155 6b04          	ld	(OFST+0,sp),a
 839                     ; 79 	stopWatch(0);
 841  0157 4f            	clr	a
 842  0158 cd0000        	call	_stopWatch
 845  015b 201b          	jra	L772
 846  015d               L572:
 847                     ; 81 		if(TIM4_GetCounter()>200){
 849  015d cd0000        	call	_TIM4_GetCounter
 851  0160 a1c9          	cp	a,#201
 852  0162 2514          	jrult	L772
 853                     ; 82 				Serial_Send_String("SEND: busy error\n");
 855  0164 ae00bb        	ldw	x,#L503
 856  0167 cd0000        	call	_Serial_Send_String
 858                     ; 83 				stopWatch(1);
 860  016a a601          	ld	a,#1
 861  016c cd0000        	call	_stopWatch
 863                     ; 84 				I2C_GenerateSTOP(ENABLE);
 865  016f a601          	ld	a,#1
 866  0171 cd0000        	call	_I2C_GenerateSTOP
 868                     ; 85 				return BUSY_ERROR[0];
 870  0174 a601          	ld	a,#1
 872  0176 202d          	jra	L02
 873  0178               L772:
 874                     ; 80 	while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
 876  0178 ae0302        	ldw	x,#770
 877  017b cd0000        	call	_I2C_GetFlagStatus
 879  017e 4d            	tnz	a
 880  017f 26dc          	jrne	L572
 881                     ; 87   I2C_GenerateSTART(ENABLE);
 883  0181 a601          	ld	a,#1
 884  0183 cd0000        	call	_I2C_GenerateSTART
 886                     ; 88 	stopWatch(0);
 888  0186 4f            	clr	a
 889  0187 cd0000        	call	_stopWatch
 892  018a 201c          	jra	L113
 893  018c               L703:
 894                     ; 90 		if(TIM4_GetCounter()>200){
 896  018c cd0000        	call	_TIM4_GetCounter
 898  018f a1c9          	cp	a,#201
 899  0191 2515          	jrult	L113
 900                     ; 91 				Serial_Send_String("SEND: start error\n"); 
 902  0193 ae00a8        	ldw	x,#L713
 903  0196 cd0000        	call	_Serial_Send_String
 905                     ; 92 				stopWatch(1);
 907  0199 a601          	ld	a,#1
 908  019b cd0000        	call	_stopWatch
 910                     ; 93 				I2C_GenerateSTOP(ENABLE);
 912  019e a601          	ld	a,#1
 913  01a0 cd0000        	call	_I2C_GenerateSTOP
 915                     ; 94 				return START_ERROR[0];
 917  01a3 a63f          	ld	a,#63
 919  01a5               L02:
 921  01a5 5b05          	addw	sp,#5
 922  01a7 81            	ret
 923  01a8               L113:
 924                     ; 89   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
 926  01a8 ae0301        	ldw	x,#769
 927  01ab cd0000        	call	_I2C_CheckEvent
 929  01ae 4d            	tnz	a
 930  01af 27db          	jreq	L703
 931                     ; 96 	I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_TX);
 933  01b1 7b05          	ld	a,(OFST+1,sp)
 934  01b3 48            	sll	a
 935  01b4 c75216        	ld	21014,a
 936                     ; 97 	stopWatch(0);	
 938  01b7 4f            	clr	a
 939  01b8 cd0000        	call	_stopWatch
 942  01bb 201b          	jra	L323
 943  01bd               L123:
 944                     ; 99 		if(TIM4_GetCounter()>200){
 946  01bd cd0000        	call	_TIM4_GetCounter
 948  01c0 a1c9          	cp	a,#201
 949  01c2 2514          	jrult	L323
 950                     ; 100 				Serial_Send_String("SEND: add error\n");
 952  01c4 ae0097        	ldw	x,#L133
 953  01c7 cd0000        	call	_Serial_Send_String
 955                     ; 101 				stopWatch(1);
 957  01ca a601          	ld	a,#1
 958  01cc cd0000        	call	_stopWatch
 960                     ; 102 				I2C_GenerateSTOP(ENABLE);
 962  01cf a601          	ld	a,#1
 963  01d1 cd0000        	call	_I2C_GenerateSTOP
 965                     ; 103 				return ADD_ERROR[0];
 967  01d4 a67f          	ld	a,#127
 969  01d6 20cd          	jra	L02
 970  01d8               L323:
 971                     ; 98   while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 973  01d8 ae0782        	ldw	x,#1922
 974  01db cd0000        	call	_I2C_CheckEvent
 976  01de 4d            	tnz	a
 977  01df 27dc          	jreq	L123
 978                     ; 105 	if(VL6180X){	//only to VL6180X because it has 2bytes register address
 980  01e1 0d0c          	tnz	(OFST+8,sp)
 981  01e3 272f          	jreq	L333
 982                     ; 106 		I2C_SendData(a1);
 984  01e5 7b02          	ld	a,(OFST-2,sp)
 985  01e7 cd0000        	call	_I2C_SendData
 987                     ; 107 		stopWatch(0);
 989  01ea 4f            	clr	a
 990  01eb cd0000        	call	_stopWatch
 993  01ee 201b          	jra	L733
 994  01f0               L533:
 995                     ; 109 			if(TIM4_GetCounter()>200){
 997  01f0 cd0000        	call	_TIM4_GetCounter
 999  01f3 a1c9          	cp	a,#201
1000  01f5 2514          	jrult	L733
1001                     ; 110 				Serial_Send_String("SEND: send error\n");
1003  01f7 ae0085        	ldw	x,#L543
1004  01fa cd0000        	call	_Serial_Send_String
1006                     ; 111 				stopWatch(1);
1008  01fd a601          	ld	a,#1
1009  01ff cd0000        	call	_stopWatch
1011                     ; 112 				I2C_GenerateSTOP(ENABLE);				
1013  0202 a601          	ld	a,#1
1014  0204 cd0000        	call	_I2C_GenerateSTOP
1016                     ; 113 				return SEND_ERROR[0];
1018  0207 a6bf          	ld	a,#191
1020  0209 209a          	jra	L02
1021  020b               L733:
1022                     ; 108 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1024  020b ae0784        	ldw	x,#1924
1025  020e cd0000        	call	_I2C_CheckEvent
1027  0211 4d            	tnz	a
1028  0212 27dc          	jreq	L533
1029  0214               L333:
1030                     ; 116 	I2C_SendData(a0);
1032  0214 7b03          	ld	a,(OFST-1,sp)
1033  0216 cd0000        	call	_I2C_SendData
1035                     ; 117 	stopWatch(0);
1037  0219 4f            	clr	a
1038  021a cd0000        	call	_stopWatch
1041  021d 201d          	jra	L153
1042  021f               L743:
1043                     ; 119 		if(TIM4_GetCounter()>200){
1045  021f cd0000        	call	_TIM4_GetCounter
1047  0222 a1c9          	cp	a,#201
1048  0224 2516          	jrult	L153
1049                     ; 120 				Serial_Send_String("SEND: send error\n");
1051  0226 ae0085        	ldw	x,#L543
1052  0229 cd0000        	call	_Serial_Send_String
1054                     ; 121 				stopWatch(1);
1056  022c a601          	ld	a,#1
1057  022e cd0000        	call	_stopWatch
1059                     ; 122 				I2C_GenerateSTOP(ENABLE);
1061  0231 a601          	ld	a,#1
1062  0233 cd0000        	call	_I2C_GenerateSTOP
1064                     ; 123 				return SEND_ERROR[0];
1066  0236 a6bf          	ld	a,#191
1068  0238 aca501a5      	jpf	L02
1069  023c               L153:
1070                     ; 118 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1072  023c ae0784        	ldw	x,#1924
1073  023f cd0000        	call	_I2C_CheckEvent
1075  0242 4d            	tnz	a
1076  0243 27da          	jreq	L743
1077                     ; 125 	I2C_SendData(d0);
1079  0245 7b04          	ld	a,(OFST+0,sp)
1080  0247 cd0000        	call	_I2C_SendData
1082                     ; 126 	stopWatch(0);
1084  024a 4f            	clr	a
1085  024b cd0000        	call	_stopWatch
1088  024e 201d          	jra	L163
1089  0250               L753:
1090                     ; 128 		if(TIM4_GetCounter()>200){
1092  0250 cd0000        	call	_TIM4_GetCounter
1094  0253 a1c9          	cp	a,#201
1095  0255 2516          	jrult	L163
1096                     ; 129 				Serial_Send_String("SEND: send error\n");
1098  0257 ae0085        	ldw	x,#L543
1099  025a cd0000        	call	_Serial_Send_String
1101                     ; 130 				stopWatch(1);
1103  025d a601          	ld	a,#1
1104  025f cd0000        	call	_stopWatch
1106                     ; 131 				I2C_GenerateSTOP(ENABLE);
1108  0262 a601          	ld	a,#1
1109  0264 cd0000        	call	_I2C_GenerateSTOP
1111                     ; 132 				return SEND_ERROR[0];
1113  0267 a6bf          	ld	a,#191
1115  0269 aca501a5      	jpf	L02
1116  026d               L163:
1117                     ; 127 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1119  026d ae0784        	ldw	x,#1924
1120  0270 cd0000        	call	_I2C_CheckEvent
1122  0273 4d            	tnz	a
1123  0274 27da          	jreq	L753
1124                     ; 134 	I2C_GenerateSTOP(ENABLE);
1126  0276 a601          	ld	a,#1
1127  0278 cd0000        	call	_I2C_GenerateSTOP
1129                     ; 135 	return 0;
1131  027b 4f            	clr	a
1133  027c aca501a5      	jpf	L02
1252                     	switch	.const
1253  001e               L42:
1254  001e 0000000a      	dc.l	10
1255                     ; 139 uint8_t* I2C_Recv(uint8_t EdiS_add, uint16_t register_EdiS_address, uint8_t nBytes, bool VL6180X)
1255                     ; 140 {
1256                     	switch	.text
1257  0280               _I2C_Recv:
1259  0280 88            	push	a
1260  0281 521c          	subw	sp,#28
1261       0000001c      OFST:	set	28
1264                     ; 142 	long i=0,j=0,k=0;
1266  0283 ae0000        	ldw	x,#0
1267  0286 1f17          	ldw	(OFST-5,sp),x
1268  0288 ae0000        	ldw	x,#0
1269  028b 1f15          	ldw	(OFST-7,sp),x
1273  028d ae0000        	ldw	x,#0
1274  0290 1f07          	ldw	(OFST-21,sp),x
1275  0292 ae0000        	ldw	x,#0
1276  0295 1f05          	ldw	(OFST-23,sp),x
1280  0297 ae0000        	ldw	x,#0
1281  029a 1f1b          	ldw	(OFST-1,sp),x
1282  029c ae0000        	ldw	x,#0
1283  029f 1f19          	ldw	(OFST-3,sp),x
1285                     ; 145 	for(i;i<10;i++)data[i]=0;
1288  02a1 2015          	jra	L534
1289  02a3               L134:
1292  02a3 96            	ldw	x,sp
1293  02a4 1c000b        	addw	x,#OFST-17
1294  02a7 1f03          	ldw	(OFST-25,sp),x
1296  02a9 1e17          	ldw	x,(OFST-5,sp)
1297  02ab 72fb03        	addw	x,(OFST-25,sp)
1298  02ae 7f            	clr	(x)
1301  02af 96            	ldw	x,sp
1302  02b0 1c0015        	addw	x,#OFST-7
1303  02b3 a601          	ld	a,#1
1304  02b5 cd0000        	call	c_lgadc
1307  02b8               L534:
1310  02b8 9c            	rvf
1311  02b9 96            	ldw	x,sp
1312  02ba 1c0015        	addw	x,#OFST-7
1313  02bd cd0000        	call	c_ltor
1315  02c0 ae001e        	ldw	x,#L42
1316  02c3 cd0000        	call	c_lcmp
1318  02c6 2fdb          	jrslt	L134
1319                     ; 146 	for(i=0;i<nBytes;i++){
1321  02c8 ae0000        	ldw	x,#0
1322  02cb 1f17          	ldw	(OFST-5,sp),x
1323  02cd ae0000        	ldw	x,#0
1324  02d0 1f15          	ldw	(OFST-7,sp),x
1327  02d2 ac650565      	jpf	L544
1328  02d6               L144:
1329                     ; 147 		a1 = (uint8_t)((register_EdiS_address >> 8) & 0xFF);
1331  02d6 7b20          	ld	a,(OFST+4,sp)
1332  02d8 6b0a          	ld	(OFST-18,sp),a
1334                     ; 148 		a0 = (uint8_t)(register_EdiS_address & 0xFF);
1336  02da 7b21          	ld	a,(OFST+5,sp)
1337  02dc a4ff          	and	a,#255
1338  02de 6b09          	ld	(OFST-19,sp),a
1340                     ; 149 		stopWatch(0);
1342  02e0 4f            	clr	a
1343  02e1 cd0000        	call	_stopWatch
1346  02e4 2020          	jra	L354
1347  02e6               L154:
1348                     ; 151 			if(TIM4_GetCounter()>250){
1350  02e6 cd0000        	call	_TIM4_GetCounter
1352  02e9 a1fb          	cp	a,#251
1353  02eb 2519          	jrult	L354
1354                     ; 152 				Serial_Send_String("RECV: busy error\n"); 
1356  02ed ae0073        	ldw	x,#L164
1357  02f0 cd0000        	call	_Serial_Send_String
1359                     ; 153 				stopWatch(1);
1361  02f3 a601          	ld	a,#1
1362  02f5 cd0000        	call	_stopWatch
1364                     ; 154 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
1366  02f8 4f            	clr	a
1367  02f9 cd0000        	call	_I2C_AcknowledgeConfig
1369                     ; 155 				I2C_GenerateSTOP(ENABLE);
1371  02fc a601          	ld	a,#1
1372  02fe cd0000        	call	_I2C_GenerateSTOP
1374                     ; 156 				return BUSY_ERROR;
1376  0301 ae0000        	ldw	x,#L3_BUSY_ERROR
1378  0304 2053          	jra	L62
1379  0306               L354:
1380                     ; 150 		while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
1382  0306 ae0302        	ldw	x,#770
1383  0309 cd0000        	call	_I2C_GetFlagStatus
1385  030c 4d            	tnz	a
1386  030d 26d7          	jrne	L154
1387                     ; 158 		Serial_Send_String("caio");
1389  030f ae006e        	ldw	x,#L364
1390  0312 cd0000        	call	_Serial_Send_String
1392                     ; 159 		Serial_Send_Int(k++);
1394  0315 96            	ldw	x,sp
1395  0316 1c0019        	addw	x,#OFST-3
1396  0319 cd0000        	call	c_ltor
1398  031c 96            	ldw	x,sp
1399  031d 1c0019        	addw	x,#OFST-3
1400  0320 a601          	ld	a,#1
1401  0322 cd0000        	call	c_lgadc
1404  0325 be02          	ldw	x,c_lreg+2
1405  0327 89            	pushw	x
1406  0328 be00          	ldw	x,c_lreg
1407  032a 89            	pushw	x
1408  032b cd0000        	call	_Serial_Send_Int
1410  032e 5b04          	addw	sp,#4
1411                     ; 160 		I2C_GenerateSTART(ENABLE);
1413  0330 a601          	ld	a,#1
1414  0332 cd0000        	call	_I2C_GenerateSTART
1416                     ; 161 		stopWatch(0);
1418  0335 4f            	clr	a
1419  0336 cd0000        	call	_stopWatch
1422  0339 2021          	jra	L764
1423  033b               L564:
1424                     ; 163 			if(TIM4_GetCounter()>250){
1426  033b cd0000        	call	_TIM4_GetCounter
1428  033e a1fb          	cp	a,#251
1429  0340 251a          	jrult	L764
1430                     ; 164 				Serial_Send_String("RECV: start error\n");
1432  0342 ae005b        	ldw	x,#L574
1433  0345 cd0000        	call	_Serial_Send_String
1435                     ; 165 				stopWatch(1);
1437  0348 a601          	ld	a,#1
1438  034a cd0000        	call	_stopWatch
1440                     ; 166 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
1442  034d 4f            	clr	a
1443  034e cd0000        	call	_I2C_AcknowledgeConfig
1445                     ; 167 		I2C_GenerateSTOP(ENABLE);
1447  0351 a601          	ld	a,#1
1448  0353 cd0000        	call	_I2C_GenerateSTOP
1450                     ; 168 				return START_ERROR;
1452  0356 ae0006        	ldw	x,#L5_START_ERROR
1454  0359               L62:
1456  0359 5b1d          	addw	sp,#29
1457  035b 81            	ret
1458  035c               L764:
1459                     ; 162 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1461  035c ae0301        	ldw	x,#769
1462  035f cd0000        	call	_I2C_CheckEvent
1464  0362 4d            	tnz	a
1465  0363 27d6          	jreq	L564
1466                     ; 170 		Serial_Send_String("caio");
1468  0365 ae006e        	ldw	x,#L364
1469  0368 cd0000        	call	_Serial_Send_String
1471                     ; 171 		Serial_Send_Int(k++);
1473  036b 96            	ldw	x,sp
1474  036c 1c0019        	addw	x,#OFST-3
1475  036f cd0000        	call	c_ltor
1477  0372 96            	ldw	x,sp
1478  0373 1c0019        	addw	x,#OFST-3
1479  0376 a601          	ld	a,#1
1480  0378 cd0000        	call	c_lgadc
1483  037b be02          	ldw	x,c_lreg+2
1484  037d 89            	pushw	x
1485  037e be00          	ldw	x,c_lreg
1486  0380 89            	pushw	x
1487  0381 cd0000        	call	_Serial_Send_Int
1489  0384 5b04          	addw	sp,#4
1490                     ; 172 		I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_TX);
1492  0386 7b1d          	ld	a,(OFST+1,sp)
1493  0388 48            	sll	a
1494  0389 c75216        	ld	21014,a
1495                     ; 173 		stopWatch(0);
1497  038c 4f            	clr	a
1498  038d cd0000        	call	_stopWatch
1501  0390               L105:
1502                     ; 174 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
1504  0390 ae0782        	ldw	x,#1922
1505  0393 cd0000        	call	_I2C_CheckEvent
1507  0396 4d            	tnz	a
1508  0397 27f7          	jreq	L105
1509                     ; 175 		Serial_Send_String("caio");
1511  0399 ae006e        	ldw	x,#L364
1512  039c cd0000        	call	_Serial_Send_String
1514                     ; 176 		Serial_Send_Int(k++);
1516  039f 96            	ldw	x,sp
1517  03a0 1c0019        	addw	x,#OFST-3
1518  03a3 cd0000        	call	c_ltor
1520  03a6 96            	ldw	x,sp
1521  03a7 1c0019        	addw	x,#OFST-3
1522  03aa a601          	ld	a,#1
1523  03ac cd0000        	call	c_lgadc
1526  03af be02          	ldw	x,c_lreg+2
1527  03b1 89            	pushw	x
1528  03b2 be00          	ldw	x,c_lreg
1529  03b4 89            	pushw	x
1530  03b5 cd0000        	call	_Serial_Send_Int
1532  03b8 5b04          	addw	sp,#4
1533                     ; 177 		if(VL6180X){//only to VL6180X because it has 2bytes register address
1535  03ba 0d23          	tnz	(OFST+7,sp)
1536  03bc 2736          	jreq	L505
1537                     ; 178 			I2C_SendData(a1);
1539  03be 7b0a          	ld	a,(OFST-18,sp)
1540  03c0 cd0000        	call	_I2C_SendData
1542                     ; 179 			stopWatch(0);
1544  03c3 4f            	clr	a
1545  03c4 cd0000        	call	_stopWatch
1548  03c7 2022          	jra	L115
1549  03c9               L705:
1550                     ; 181 				if(TIM4_GetCounter()>250){
1552  03c9 cd0000        	call	_TIM4_GetCounter
1554  03cc a1fb          	cp	a,#251
1555  03ce 251b          	jrult	L115
1556                     ; 182 					Serial_Send_String("RECV: send error\n"); 
1558  03d0 ae0049        	ldw	x,#L715
1559  03d3 cd0000        	call	_Serial_Send_String
1561                     ; 183 					stopWatch(1);
1563  03d6 a601          	ld	a,#1
1564  03d8 cd0000        	call	_stopWatch
1566                     ; 184 					I2C_AcknowledgeConfig(I2C_ACK_NONE);
1568  03db 4f            	clr	a
1569  03dc cd0000        	call	_I2C_AcknowledgeConfig
1571                     ; 185 		I2C_GenerateSTOP(ENABLE);
1573  03df a601          	ld	a,#1
1574  03e1 cd0000        	call	_I2C_GenerateSTOP
1576                     ; 186 					return SEND_ERROR;
1578  03e4 ae0012        	ldw	x,#L11_SEND_ERROR
1580  03e7 ac590359      	jpf	L62
1581  03eb               L115:
1582                     ; 180 			while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1584  03eb ae0784        	ldw	x,#1924
1585  03ee cd0000        	call	_I2C_CheckEvent
1587  03f1 4d            	tnz	a
1588  03f2 27d5          	jreq	L705
1589  03f4               L505:
1590                     ; 189 		Serial_Send_String("caio");
1592  03f4 ae006e        	ldw	x,#L364
1593  03f7 cd0000        	call	_Serial_Send_String
1595                     ; 190 		Serial_Send_Int(k++);
1597  03fa 96            	ldw	x,sp
1598  03fb 1c0019        	addw	x,#OFST-3
1599  03fe cd0000        	call	c_ltor
1601  0401 96            	ldw	x,sp
1602  0402 1c0019        	addw	x,#OFST-3
1603  0405 a601          	ld	a,#1
1604  0407 cd0000        	call	c_lgadc
1607  040a be02          	ldw	x,c_lreg+2
1608  040c 89            	pushw	x
1609  040d be00          	ldw	x,c_lreg
1610  040f 89            	pushw	x
1611  0410 cd0000        	call	_Serial_Send_Int
1613  0413 5b04          	addw	sp,#4
1614                     ; 191 		I2C_SendData(a0);
1616  0415 7b09          	ld	a,(OFST-19,sp)
1617  0417 cd0000        	call	_I2C_SendData
1619                     ; 192 		stopWatch(0);
1621  041a 4f            	clr	a
1622  041b cd0000        	call	_stopWatch
1625  041e 2022          	jra	L325
1626  0420               L125:
1627                     ; 194 			if(TIM4_GetCounter()>250){
1629  0420 cd0000        	call	_TIM4_GetCounter
1631  0423 a1fb          	cp	a,#251
1632  0425 251b          	jrult	L325
1633                     ; 195 				Serial_Send_String("RECV: send error\n"); 
1635  0427 ae0049        	ldw	x,#L715
1636  042a cd0000        	call	_Serial_Send_String
1638                     ; 196 				stopWatch(1);
1640  042d a601          	ld	a,#1
1641  042f cd0000        	call	_stopWatch
1643                     ; 197 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
1645  0432 4f            	clr	a
1646  0433 cd0000        	call	_I2C_AcknowledgeConfig
1648                     ; 198 		I2C_GenerateSTOP(ENABLE);
1650  0436 a601          	ld	a,#1
1651  0438 cd0000        	call	_I2C_GenerateSTOP
1653                     ; 199 				return SEND_ERROR;
1655  043b ae0012        	ldw	x,#L11_SEND_ERROR
1657  043e ac590359      	jpf	L62
1658  0442               L325:
1659                     ; 193 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1661  0442 ae0784        	ldw	x,#1924
1662  0445 cd0000        	call	_I2C_CheckEvent
1664  0448 4d            	tnz	a
1665  0449 27d5          	jreq	L125
1666                     ; 201 		Serial_Send_String("caio");
1668  044b ae006e        	ldw	x,#L364
1669  044e cd0000        	call	_Serial_Send_String
1671                     ; 202 		Serial_Send_Int(k++);
1673  0451 96            	ldw	x,sp
1674  0452 1c0019        	addw	x,#OFST-3
1675  0455 cd0000        	call	c_ltor
1677  0458 96            	ldw	x,sp
1678  0459 1c0019        	addw	x,#OFST-3
1679  045c a601          	ld	a,#1
1680  045e cd0000        	call	c_lgadc
1683  0461 be02          	ldw	x,c_lreg+2
1684  0463 89            	pushw	x
1685  0464 be00          	ldw	x,c_lreg
1686  0466 89            	pushw	x
1687  0467 cd0000        	call	_Serial_Send_Int
1689  046a 5b04          	addw	sp,#4
1690                     ; 203 		I2C_GenerateSTART(ENABLE); 
1692  046c a601          	ld	a,#1
1693  046e cd0000        	call	_I2C_GenerateSTART
1695                     ; 204 		stopWatch(0);
1697  0471 4f            	clr	a
1698  0472 cd0000        	call	_stopWatch
1701  0475 2022          	jra	L335
1702  0477               L135:
1703                     ; 206 			if(TIM4_GetCounter()>250){
1705  0477 cd0000        	call	_TIM4_GetCounter
1707  047a a1fb          	cp	a,#251
1708  047c 251b          	jrult	L335
1709                     ; 207 				Serial_Send_String("RECV: restart error\n"); 
1711  047e ae0034        	ldw	x,#L145
1712  0481 cd0000        	call	_Serial_Send_String
1714                     ; 208 				stopWatch(1);
1716  0484 a601          	ld	a,#1
1717  0486 cd0000        	call	_stopWatch
1719                     ; 209 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
1721  0489 4f            	clr	a
1722  048a cd0000        	call	_I2C_AcknowledgeConfig
1724                     ; 210 		I2C_GenerateSTOP(ENABLE);
1726  048d a601          	ld	a,#1
1727  048f cd0000        	call	_I2C_GenerateSTOP
1729                     ; 211 				return START_ERROR;
1731  0492 ae0006        	ldw	x,#L5_START_ERROR
1733  0495 ac590359      	jpf	L62
1734  0499               L335:
1735                     ; 205 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1737  0499 ae0301        	ldw	x,#769
1738  049c cd0000        	call	_I2C_CheckEvent
1740  049f 4d            	tnz	a
1741  04a0 27d5          	jreq	L135
1742                     ; 213 		Serial_Send_String("caio");
1744  04a2 ae006e        	ldw	x,#L364
1745  04a5 cd0000        	call	_Serial_Send_String
1747                     ; 214 		Serial_Send_Int(k++);
1749  04a8 96            	ldw	x,sp
1750  04a9 1c0019        	addw	x,#OFST-3
1751  04ac cd0000        	call	c_ltor
1753  04af 96            	ldw	x,sp
1754  04b0 1c0019        	addw	x,#OFST-3
1755  04b3 a601          	ld	a,#1
1756  04b5 cd0000        	call	c_lgadc
1759  04b8 be02          	ldw	x,c_lreg+2
1760  04ba 89            	pushw	x
1761  04bb be00          	ldw	x,c_lreg
1762  04bd 89            	pushw	x
1763  04be cd0000        	call	_Serial_Send_Int
1765  04c1 5b04          	addw	sp,#4
1766                     ; 215 		I2C->DR = (uint8_t)(EdiS_add<<1 | I2C_DIRECTION_RX);
1768  04c3 7b1d          	ld	a,(OFST+1,sp)
1769  04c5 48            	sll	a
1770  04c6 aa01          	or	a,#1
1771  04c8 c75216        	ld	21014,a
1772                     ; 216 		stopWatch(0);
1774  04cb 4f            	clr	a
1775  04cc cd0000        	call	_stopWatch
1778  04cf 2022          	jra	L545
1779  04d1               L345:
1780                     ; 218 			if(TIM4_GetCounter()>250){
1782  04d1 cd0000        	call	_TIM4_GetCounter
1784  04d4 a1fb          	cp	a,#251
1785  04d6 251b          	jrult	L545
1786                     ; 219 				Serial_Send_String("RECV: recv error\n"); 
1788  04d8 ae0022        	ldw	x,#L355
1789  04db cd0000        	call	_Serial_Send_String
1791                     ; 220 				stopWatch(1);
1793  04de a601          	ld	a,#1
1794  04e0 cd0000        	call	_stopWatch
1796                     ; 221 				I2C_AcknowledgeConfig(I2C_ACK_NONE);
1798  04e3 4f            	clr	a
1799  04e4 cd0000        	call	_I2C_AcknowledgeConfig
1801                     ; 222 		I2C_GenerateSTOP(ENABLE);
1803  04e7 a601          	ld	a,#1
1804  04e9 cd0000        	call	_I2C_GenerateSTOP
1806                     ; 223 				return RECV_ERROR;
1808  04ec ae0018        	ldw	x,#L31_RECV_ERROR
1810  04ef ac590359      	jpf	L62
1811  04f3               L545:
1812                     ; 217 		while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))
1814  04f3 ae0340        	ldw	x,#832
1815  04f6 cd0000        	call	_I2C_CheckEvent
1817  04f9 4d            	tnz	a
1818  04fa 27d5          	jreq	L345
1819                     ; 225 		Serial_Send_String("caio");
1821  04fc ae006e        	ldw	x,#L364
1822  04ff cd0000        	call	_Serial_Send_String
1824                     ; 226 		Serial_Send_Int(k++);
1826  0502 96            	ldw	x,sp
1827  0503 1c0019        	addw	x,#OFST-3
1828  0506 cd0000        	call	c_ltor
1830  0509 96            	ldw	x,sp
1831  050a 1c0019        	addw	x,#OFST-3
1832  050d a601          	ld	a,#1
1833  050f cd0000        	call	c_lgadc
1836  0512 be02          	ldw	x,c_lreg+2
1837  0514 89            	pushw	x
1838  0515 be00          	ldw	x,c_lreg
1839  0517 89            	pushw	x
1840  0518 cd0000        	call	_Serial_Send_Int
1842  051b 5b04          	addw	sp,#4
1843                     ; 227 		data[j++] = I2C_ReceiveData();
1845  051d 96            	ldw	x,sp
1846  051e 1c000b        	addw	x,#OFST-17
1847  0521 bf02          	ldw	c_lreg+2,x
1848  0523 5f            	clrw	x
1849  0524 bf00          	ldw	c_lreg,x
1850  0526 96            	ldw	x,sp
1851  0527 1c0001        	addw	x,#OFST-27
1852  052a cd0000        	call	c_rtol
1855  052d 96            	ldw	x,sp
1856  052e 1c0005        	addw	x,#OFST-23
1857  0531 cd0000        	call	c_ltor
1859  0534 96            	ldw	x,sp
1860  0535 1c0005        	addw	x,#OFST-23
1861  0538 a601          	ld	a,#1
1862  053a cd0000        	call	c_lgadc
1865  053d 96            	ldw	x,sp
1866  053e 1c0001        	addw	x,#OFST-27
1867  0541 cd0000        	call	c_ladd
1869  0544 be02          	ldw	x,c_lreg+2
1870  0546 89            	pushw	x
1871  0547 cd0000        	call	_I2C_ReceiveData
1873  054a 85            	popw	x
1874  054b f7            	ld	(x),a
1875                     ; 229 		I2C_AcknowledgeConfig(I2C_ACK_NONE);
1877  054c 4f            	clr	a
1878  054d cd0000        	call	_I2C_AcknowledgeConfig
1880                     ; 230 		I2C_GenerateSTOP(ENABLE);
1882  0550 a601          	ld	a,#1
1883  0552 cd0000        	call	_I2C_GenerateSTOP
1885                     ; 231 		register_EdiS_address+=1;
1887  0555 1e20          	ldw	x,(OFST+4,sp)
1888  0557 1c0001        	addw	x,#1
1889  055a 1f20          	ldw	(OFST+4,sp),x
1890                     ; 146 	for(i=0;i<nBytes;i++){
1892  055c 96            	ldw	x,sp
1893  055d 1c0015        	addw	x,#OFST-7
1894  0560 a601          	ld	a,#1
1895  0562 cd0000        	call	c_lgadc
1898  0565               L544:
1901  0565 9c            	rvf
1902  0566 7b22          	ld	a,(OFST+6,sp)
1903  0568 b703          	ld	c_lreg+3,a
1904  056a 3f02          	clr	c_lreg+2
1905  056c 3f01          	clr	c_lreg+1
1906  056e 3f00          	clr	c_lreg
1907  0570 96            	ldw	x,sp
1908  0571 1c0015        	addw	x,#OFST-7
1909  0574 cd0000        	call	c_lcmp
1911  0577 2d03          	jrsle	L03
1912  0579 cc02d6        	jp	L144
1913  057c               L03:
1914                     ; 233 	Serial_Send_Hex(data[0]);
1916  057c 7b0b          	ld	a,(OFST-17,sp)
1917  057e b703          	ld	c_lreg+3,a
1918  0580 3f02          	clr	c_lreg+2
1919  0582 3f01          	clr	c_lreg+1
1920  0584 3f00          	clr	c_lreg
1921  0586 be02          	ldw	x,c_lreg+2
1922  0588 89            	pushw	x
1923  0589 be00          	ldw	x,c_lreg
1924  058b 89            	pushw	x
1925  058c cd0000        	call	_Serial_Send_Hex
1927  058f 5b04          	addw	sp,#4
1928                     ; 234 	return data;
1930  0591 96            	ldw	x,sp
1931  0592 1c000b        	addw	x,#OFST-17
1933  0595 ac590359      	jpf	L62
2009                     	xref	_stopWatch
2010                     	xref	_delay_ms
2011                     	xref	_Serial_Send_String
2012                     	xref	_Serial_Send_Hex
2013                     	xref	_Serial_Send_Int
2014                     	xref	_BNO055_SetExternalCrystalUse
2015                     	xref	_BNO055_Init
2016                     	xref	_VL6180X_Init
2017                     	switch	.bss
2018  0000               _a0:
2019  0000 00            	ds.b	1
2020                     	xdef	_a0
2021  0001               _a1:
2022  0001 00            	ds.b	1
2023                     	xdef	_a1
2024  0002               _data0:
2025  0002 00            	ds.b	1
2026                     	xdef	_data0
2027                     	xdef	_I2C_received
2028                     	xdef	_secondSent
2029                     	xdef	_startedCom
2030                     	xdef	_start
2031                     	xdef	_I2C_CheckEvent1
2032                     	xdef	_I2C_Recv
2033                     	xdef	_I2C_Send
2034                     	xdef	_InitI2C
2035                     	xref	_TIM4_GetCounter
2036                     	xref	_I2C_GetFlagStatus
2037                     	xref	_I2C_CheckEvent
2038                     	xref	_I2C_SendData
2039                     	xref	_I2C_ReceiveData
2040                     	xref	_I2C_AcknowledgeConfig
2041                     	xref	_I2C_GenerateSTOP
2042                     	xref	_I2C_GenerateSTART
2043                     	xref	_I2C_Init
2044                     	xref	_I2C_DeInit
2045                     	xref	_GPIO_WriteLow
2046                     	xref	_GPIO_Init
2047                     	xref	_GPIO_DeInit
2048                     	switch	.const
2049  0022               L355:
2050  0022 524543563a20  	dc.b	"RECV: recv error",10,0
2051  0034               L145:
2052  0034 524543563a20  	dc.b	"RECV: restart erro"
2053  0046 720a00        	dc.b	"r",10,0
2054  0049               L715:
2055  0049 524543563a20  	dc.b	"RECV: send error",10,0
2056  005b               L574:
2057  005b 524543563a20  	dc.b	"RECV: start error",10,0
2058  006e               L364:
2059  006e 6361696f00    	dc.b	"caio",0
2060  0073               L164:
2061  0073 524543563a20  	dc.b	"RECV: busy error",10,0
2062  0085               L543:
2063  0085 53454e443a20  	dc.b	"SEND: send error",10,0
2064  0097               L133:
2065  0097 53454e443a20  	dc.b	"SEND: add error",10,0
2066  00a8               L713:
2067  00a8 53454e443a20  	dc.b	"SEND: start error",10,0
2068  00bb               L503:
2069  00bb 53454e443a20  	dc.b	"SEND: busy error",10,0
2070  00cd               L722:
2071  00cd 766120646120  	dc.b	"va da dio",10,0
2072  00d8               L322:
2073  00d8 6779726f206e  	dc.b	"gyro non va",10,0
2074  00e5               L712:
2075  00e5 6c6173657220  	dc.b	"laser ok",10,0
2076                     	xref.b	c_lreg
2096                     	xref	c_ladd
2097                     	xref	c_rtol
2098                     	xref	c_lcmp
2099                     	xref	c_ltor
2100                     	xref	c_lgadc
2101                     	xref	c_uitolx
2102                     	end
