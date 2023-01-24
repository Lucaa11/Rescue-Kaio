   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  33                     	switch	.data
  34  0000               _imptemp:
  35  0000 00000000      	dc.l	0
  36  0004 00000000      	dc.l	0
  37  0008 00000000      	dc.l	0
  38  000c 00000000      	dc.l	0
  83                     ; 14 void InitPwm(void){
  85                     	switch	.text
  86  0000               _InitPwm:
  90                     ; 15 	verify_option(0x4803,1<<4);				//enable tim1_ch4 port
  92  0000 4b10          	push	#16
  93  0002 ae4803        	ldw	x,#18435
  94  0005 cd015c        	call	_verify_option
  96  0008 84            	pop	a
  97                     ; 16 	TIM1_DeInit(); 																																	//timer1 pwm 
  99  0009 cd0000        	call	_TIM1_DeInit
 101                     ; 17 	TIM1_OC1Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
 103  000c 4b00          	push	#0
 104  000e 4b55          	push	#85
 105  0010 4b00          	push	#0
 106  0012 4b00          	push	#0
 107  0014 aeffff        	ldw	x,#65535
 108  0017 89            	pushw	x
 109  0018 4b00          	push	#0
 110  001a ae6011        	ldw	x,#24593
 111  001d cd0000        	call	_TIM1_OC1Init
 113  0020 5b07          	addw	sp,#7
 114                     ; 18 	TIM1_OC2Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
 116  0022 4b00          	push	#0
 117  0024 4b55          	push	#85
 118  0026 4b00          	push	#0
 119  0028 4b00          	push	#0
 120  002a aeffff        	ldw	x,#65535
 121  002d 89            	pushw	x
 122  002e 4b00          	push	#0
 123  0030 ae6011        	ldw	x,#24593
 124  0033 cd0000        	call	_TIM1_OC2Init
 126  0036 5b07          	addw	sp,#7
 127                     ; 19 	TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE, 65535, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, TIM1_OCNIDLESTATE_RESET);
 129  0038 4b00          	push	#0
 130  003a 4b55          	push	#85
 131  003c 4b00          	push	#0
 132  003e 4b00          	push	#0
 133  0040 aeffff        	ldw	x,#65535
 134  0043 89            	pushw	x
 135  0044 4b00          	push	#0
 136  0046 ae6011        	ldw	x,#24593
 137  0049 cd0000        	call	_TIM1_OC3Init
 139  004c 5b07          	addw	sp,#7
 140                     ; 20 	TIM1_OC4Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE,  65535, TIM1_OCPOLARITY_HIGH, TIM1_OCIDLESTATE_SET);
 142  004e 4b55          	push	#85
 143  0050 4b00          	push	#0
 144  0052 aeffff        	ldw	x,#65535
 145  0055 89            	pushw	x
 146  0056 ae6011        	ldw	x,#24593
 147  0059 cd0000        	call	_TIM1_OC4Init
 149  005c 5b04          	addw	sp,#4
 150                     ; 21 	TIM1_TimeBaseInit(4, TIM1_COUNTERMODE_UP, 65535, 0);//N=4, Top=65535, f=61.04Hz
 152  005e 4b00          	push	#0
 153  0060 aeffff        	ldw	x,#65535
 154  0063 89            	pushw	x
 155  0064 4b00          	push	#0
 156  0066 ae0004        	ldw	x,#4
 157  0069 cd0000        	call	_TIM1_TimeBaseInit
 159  006c 5b04          	addw	sp,#4
 160                     ; 22 	TIM3_DeInit();
 162  006e cd0000        	call	_TIM3_DeInit
 164                     ; 23 	TIM3_OC1Init(TIM3_OCMODE_PWM1, TIM3_OUTPUTSTATE_ENABLE, 0, TIM3_OCPOLARITY_HIGH);
 166  0071 4b00          	push	#0
 167  0073 5f            	clrw	x
 168  0074 89            	pushw	x
 169  0075 ae6011        	ldw	x,#24593
 170  0078 cd0000        	call	_TIM3_OC1Init
 172  007b 5b03          	addw	sp,#3
 173                     ; 24 	TIM3_OC2Init(TIM3_OCMODE_PWM1, TIM3_OUTPUTSTATE_ENABLE, 0, TIM3_OCPOLARITY_HIGH);
 175  007d 4b00          	push	#0
 176  007f 5f            	clrw	x
 177  0080 89            	pushw	x
 178  0081 ae6011        	ldw	x,#24593
 179  0084 cd0000        	call	_TIM3_OC2Init
 181  0087 5b03          	addw	sp,#3
 182                     ; 25 	TIM3_TimeBaseInit(TIM3_PRESCALER_8, 40000);
 184  0089 ae9c40        	ldw	x,#40000
 185  008c 89            	pushw	x
 186  008d a603          	ld	a,#3
 187  008f cd0000        	call	_TIM3_TimeBaseInit
 189  0092 85            	popw	x
 190                     ; 26 	TIM1_Cmd(ENABLE);
 192  0093 a601          	ld	a,#1
 193  0095 cd0000        	call	_TIM1_Cmd
 195                     ; 27 	TIM1_CtrlPWMOutputs(ENABLE);
 197  0098 a601          	ld	a,#1
 198  009a cd0000        	call	_TIM1_CtrlPWMOutputs
 200                     ; 28 	TIM3_Cmd(ENABLE);
 202  009d a601          	ld	a,#1
 203  009f cd0000        	call	_TIM3_Cmd
 205                     ; 30 	GPIO_DeInit(GPIOB);
 207  00a2 ae5005        	ldw	x,#20485
 208  00a5 cd0000        	call	_GPIO_DeInit
 210                     ; 31 	GPIO_Init(GPIOB, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
 212  00a8 4be0          	push	#224
 213  00aa 4bff          	push	#255
 214  00ac ae5005        	ldw	x,#20485
 215  00af cd0000        	call	_GPIO_Init
 217  00b2 85            	popw	x
 218                     ; 32 }
 221  00b3 81            	ret
 255                     ; 33 void VaiAvanti(void){
 256                     	switch	.text
 257  00b4               _VaiAvanti:
 259  00b4 89            	pushw	x
 260       00000002      OFST:	set	2
 263                     ; 35 	GPIO_WriteHigh(GPIOB,GPIO_PIN_0|GPIO_PIN_2|GPIO_PIN_4|GPIO_PIN_6);
 265  00b5 4b55          	push	#85
 266  00b7 ae5005        	ldw	x,#20485
 267  00ba cd0000        	call	_GPIO_WriteHigh
 269  00bd 84            	pop	a
 270                     ; 37 	for(i=0;i<4;i++)setpoint[i]=1;
 272  00be 5f            	clrw	x
 273  00bf 1f01          	ldw	(OFST-1,sp),x
 275  00c1               L111:
 278  00c1 1e01          	ldw	x,(OFST-1,sp)
 279  00c3 58            	sllw	x
 280  00c4 58            	sllw	x
 281  00c5 a601          	ld	a,#1
 282  00c7 cd0000        	call	c_ctof
 284  00ca 1c005d        	addw	x,#_setpoint
 285  00cd cd0000        	call	c_rtol
 289  00d0 1e01          	ldw	x,(OFST-1,sp)
 290  00d2 1c0001        	addw	x,#1
 291  00d5 1f01          	ldw	(OFST-1,sp),x
 295  00d7 9c            	rvf
 296  00d8 1e01          	ldw	x,(OFST-1,sp)
 297  00da a30004        	cpw	x,#4
 298  00dd 2fe2          	jrslt	L111
 299                     ; 43 }
 302  00df 85            	popw	x
 303  00e0 81            	ret
 369                     ; 44 void Gira(bool verso){
 370                     	switch	.text
 371  00e1               _Gira:
 373  00e1 89            	pushw	x
 374       00000002      OFST:	set	2
 377                     ; 46 	if(verso)GPIO_WriteHigh(GPIOB,GPIO_PIN_0|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_7);
 379  00e2 4d            	tnz	a
 380  00e3 270b          	jreq	L741
 383  00e5 4b99          	push	#153
 384  00e7 ae5005        	ldw	x,#20485
 385  00ea cd0000        	call	_GPIO_WriteHigh
 387  00ed 84            	pop	a
 389  00ee 2009          	jra	L151
 390  00f0               L741:
 391                     ; 47 	else GPIO_WriteHigh(GPIOB,GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_5|GPIO_PIN_6);
 393  00f0 4b66          	push	#102
 394  00f2 ae5005        	ldw	x,#20485
 395  00f5 cd0000        	call	_GPIO_WriteHigh
 397  00f8 84            	pop	a
 398  00f9               L151:
 399                     ; 48 	for(i=0;i<4;i++)setpoint[i]=1;
 401  00f9 5f            	clrw	x
 402  00fa 1f01          	ldw	(OFST-1,sp),x
 404  00fc               L351:
 407  00fc 1e01          	ldw	x,(OFST-1,sp)
 408  00fe 58            	sllw	x
 409  00ff 58            	sllw	x
 410  0100 a601          	ld	a,#1
 411  0102 cd0000        	call	c_ctof
 413  0105 1c005d        	addw	x,#_setpoint
 414  0108 cd0000        	call	c_rtol
 418  010b 1e01          	ldw	x,(OFST-1,sp)
 419  010d 1c0001        	addw	x,#1
 420  0110 1f01          	ldw	(OFST-1,sp),x
 424  0112 9c            	rvf
 425  0113 1e01          	ldw	x,(OFST-1,sp)
 426  0115 a30004        	cpw	x,#4
 427  0118 2fe2          	jrslt	L351
 428                     ; 49 	delay_ms(1000);
 430  011a ae03e8        	ldw	x,#1000
 431  011d 89            	pushw	x
 432  011e ae0000        	ldw	x,#0
 433  0121 89            	pushw	x
 434  0122 cd0000        	call	_delay_ms
 436  0125 5b04          	addw	sp,#4
 437                     ; 50 	for(i=0;i<4;i++)setpoint[i]=0;
 439  0127 5f            	clrw	x
 440  0128 1f01          	ldw	(OFST-1,sp),x
 442  012a               L161:
 445  012a 1e01          	ldw	x,(OFST-1,sp)
 446  012c 58            	sllw	x
 447  012d 58            	sllw	x
 448  012e a600          	ld	a,#0
 449  0130 d70060        	ld	(_setpoint+3,x),a
 450  0133 a600          	ld	a,#0
 451  0135 d7005f        	ld	(_setpoint+2,x),a
 452  0138 a600          	ld	a,#0
 453  013a d7005e        	ld	(_setpoint+1,x),a
 454  013d a600          	ld	a,#0
 455  013f d7005d        	ld	(_setpoint,x),a
 458  0142 1e01          	ldw	x,(OFST-1,sp)
 459  0144 1c0001        	addw	x,#1
 460  0147 1f01          	ldw	(OFST-1,sp),x
 464  0149 9c            	rvf
 465  014a 1e01          	ldw	x,(OFST-1,sp)
 466  014c a30004        	cpw	x,#4
 467  014f 2fd9          	jrslt	L161
 468                     ; 51 	GPIO_WriteLow(GPIOB,GPIO_PIN_ALL);
 470  0151 4bff          	push	#255
 471  0153 ae5005        	ldw	x,#20485
 472  0156 cd0000        	call	_GPIO_WriteLow
 474  0159 84            	pop	a
 475                     ; 52 }
 478  015a 85            	popw	x
 479  015b 81            	ret
 530                     ; 53 void verify_option(uint16_t address, uint8_t data)
 530                     ; 54 {
 531                     	switch	.text
 532  015c               _verify_option:
 534  015c 89            	pushw	x
 535  015d 89            	pushw	x
 536       00000002      OFST:	set	2
 539                     ; 55 	uint16_t stored_data = FLASH_ReadOptionByte( address );
 541  015e cd0000        	call	_FLASH_ReadOptionByte
 543  0161 1f01          	ldw	(OFST-1,sp),x
 545                     ; 56 	if( ( FLASH_OPTIONBYTE_ERROR == stored_data ) || ( data != (uint8_t)( stored_data>>8 ) ) )
 547  0163 1e01          	ldw	x,(OFST-1,sp)
 548  0165 a35555        	cpw	x,#21845
 549  0168 2706          	jreq	L112
 551  016a 7b07          	ld	a,(OFST+5,sp)
 552  016c 1101          	cp	a,(OFST-1,sp)
 553  016e 271e          	jreq	L702
 554  0170               L112:
 555                     ; 58 		FLASH_Unlock( FLASH_MEMTYPE_DATA );
 557  0170 a6f7          	ld	a,#247
 558  0172 cd0000        	call	_FLASH_Unlock
 560                     ; 59     FLASH_EraseOptionByte( address );
 562  0175 1e03          	ldw	x,(OFST+1,sp)
 563  0177 cd0000        	call	_FLASH_EraseOptionByte
 565                     ; 60     FLASH_ProgramOptionByte( address, data );
 567  017a 7b07          	ld	a,(OFST+5,sp)
 568  017c 88            	push	a
 569  017d 1e04          	ldw	x,(OFST+2,sp)
 570  017f cd0000        	call	_FLASH_ProgramOptionByte
 572  0182 84            	pop	a
 573                     ; 61     FLASH_Lock( FLASH_MEMTYPE_DATA );	
 575  0183 a6f7          	ld	a,#247
 576  0185 cd0000        	call	_FLASH_Lock
 578                     ; 65 		IWDG->KR = IWDG_KEY_ENABLE;
 580  0188 35cc50e0      	mov	20704,#204
 581  018c               L312:
 582                     ; 67     while(1);
 584  018c 20fe          	jra	L312
 585  018e               L702:
 586                     ; 69 }
 589  018e 5b04          	addw	sp,#4
 590  0190 81            	ret
 622                     ; 70 double long ABS(double long x){
 623                     	switch	.text
 624  0191               _ABS:
 626       00000000      OFST:	set	0
 629                     ; 71 	if (x<0)x=-x;
 631  0191 9c            	rvf
 632  0192 9c            	rvf
 633  0193 0d03          	tnz	(OFST+3,sp)
 634  0195 2e07          	jrsge	L332
 637  0197 96            	ldw	x,sp
 638  0198 1c0003        	addw	x,#OFST+3
 639  019b cd0000        	call	c_fgneg
 641  019e               L332:
 642                     ; 72 	return x;
 644  019e 96            	ldw	x,sp
 645  019f 1c0003        	addw	x,#OFST+3
 646  01a2 cd0000        	call	c_ltor
 650  01a5 81            	ret
 838                     	xref	_delay_ms
 839                     	xdef	_Gira
 840                     	xdef	_VaiAvanti
 841                     	xdef	_verify_option
 842                     	xdef	_InitPwm
 843                     	xdef	_ABS
 844                     	xdef	_imptemp
 845                     	switch	.bss
 846  0000               _duty:
 847  0000 000000000000  	ds.b	16
 848                     	xdef	_duty
 849  0010               _angle:
 850  0010 00000000      	ds.b	4
 851                     	xdef	_angle
 852  0014               _Ti:
 853  0014 00            	ds.b	1
 854                     	xdef	_Ti
 855  0015               _objDegree:
 856  0015 00000000      	ds.b	4
 857                     	xdef	_objDegree
 858  0019               _set:
 859  0019 000000000000  	ds.b	16
 860                     	xdef	_set
 861  0029               _increase:
 862  0029 000000000000  	ds.b	16
 863                     	xdef	_increase
 864  0039               _old_errorGy:
 865  0039 00000000      	ds.b	4
 866                     	xdef	_old_errorGy
 867  003d               _setpointGy:
 868  003d 00000000      	ds.b	4
 869                     	xdef	_setpointGy
 870  0041               _derivativeGy:
 871  0041 00000000      	ds.b	4
 872                     	xdef	_derivativeGy
 873  0045               _integralGy:
 874  0045 00000000      	ds.b	4
 875                     	xdef	_integralGy
 876  0049               _errorGy:
 877  0049 00000000      	ds.b	4
 878                     	xdef	_errorGy
 879  004d               _old_error:
 880  004d 000000000000  	ds.b	16
 881                     	xdef	_old_error
 882  005d               _setpoint:
 883  005d 000000000000  	ds.b	16
 884                     	xdef	_setpoint
 885  006d               _derivative:
 886  006d 000000000000  	ds.b	16
 887                     	xdef	_derivative
 888  007d               _integral:
 889  007d 000000000000  	ds.b	16
 890                     	xdef	_integral
 891  008d               _proportional:
 892  008d 000000000000  	ds.b	16
 893                     	xdef	_proportional
 894  009d               _error:
 895  009d 000000000000  	ds.b	16
 896                     	xdef	_error
 897                     	xref	_TIM3_Cmd
 898                     	xref	_TIM3_OC2Init
 899                     	xref	_TIM3_OC1Init
 900                     	xref	_TIM3_TimeBaseInit
 901                     	xref	_TIM3_DeInit
 902                     	xref	_TIM1_CtrlPWMOutputs
 903                     	xref	_TIM1_Cmd
 904                     	xref	_TIM1_OC4Init
 905                     	xref	_TIM1_OC3Init
 906                     	xref	_TIM1_OC2Init
 907                     	xref	_TIM1_OC1Init
 908                     	xref	_TIM1_TimeBaseInit
 909                     	xref	_TIM1_DeInit
 910                     	xref	_GPIO_WriteLow
 911                     	xref	_GPIO_WriteHigh
 912                     	xref	_GPIO_Init
 913                     	xref	_GPIO_DeInit
 914                     	xref	_FLASH_EraseOptionByte
 915                     	xref	_FLASH_ProgramOptionByte
 916                     	xref	_FLASH_ReadOptionByte
 917                     	xref	_FLASH_Lock
 918                     	xref	_FLASH_Unlock
 938                     	xref	c_ltor
 939                     	xref	c_fgneg
 940                     	xref	c_rtol
 941                     	xref	c_ctof
 942                     	end
