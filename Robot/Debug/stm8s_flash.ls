   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  73                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  73                     ; 88 {
  75                     	switch	.text
  76  0000               _FLASH_Unlock:
  80                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  82                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  84  0000 a1fd          	cp	a,#253
  85  0002 260a          	jrne	L73
  86                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  88  0004 35565062      	mov	20578,#86
  89                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  91  0008 35ae5062      	mov	20578,#174
  93  000c 2008          	jra	L14
  94  000e               L73:
  95                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  97  000e 35ae5064      	mov	20580,#174
  98                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 100  0012 35565064      	mov	20580,#86
 101  0016               L14:
 102                     ; 104 }
 105  0016 81            	ret
 140                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 140                     ; 113 {
 141                     	switch	.text
 142  0017               _FLASH_Lock:
 146                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 148                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 150  0017 c4505f        	and	a,20575
 151  001a c7505f        	ld	20575,a
 152                     ; 119 }
 155  001d 81            	ret
 178                     ; 126 void FLASH_DeInit(void)
 178                     ; 127 {
 179                     	switch	.text
 180  001e               _FLASH_DeInit:
 184                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 186  001e 725f505a      	clr	20570
 187                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 189  0022 725f505b      	clr	20571
 190                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 192  0026 35ff505c      	mov	20572,#255
 193                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 195  002a 7217505f      	bres	20575,#3
 196                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 198  002e 7213505f      	bres	20575,#1
 199                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 201  0032 c6505f        	ld	a,20575
 202                     ; 134 }
 205  0035 81            	ret
 260                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 260                     ; 143 {
 261                     	switch	.text
 262  0036               _FLASH_ITConfig:
 266                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 268                     ; 147   if(NewState != DISABLE)
 270  0036 4d            	tnz	a
 271  0037 2706          	jreq	L711
 272                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 274  0039 7212505a      	bset	20570,#1
 276  003d 2004          	jra	L121
 277  003f               L711:
 278                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 280  003f 7213505a      	bres	20570,#1
 281  0043               L121:
 282                     ; 155 }
 285  0043 81            	ret
 317                     ; 164 void FLASH_EraseByte(uint32_t Address)
 317                     ; 165 {
 318                     	switch	.text
 319  0044               _FLASH_EraseByte:
 321       00000000      OFST:	set	0
 324                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 326                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 328  0044 7b04          	ld	a,(OFST+4,sp)
 329  0046 b700          	ld	c_x,a
 330  0048 1e05          	ldw	x,(OFST+5,sp)
 331  004a bf01          	ldw	c_x+1,x
 332  004c 4f            	clr	a
 333  004d 92bd0000      	ldf	[c_x.e],a
 334                     ; 171 }
 337  0051 81            	ret
 376                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 376                     ; 182 {
 377                     	switch	.text
 378  0052               _FLASH_ProgramByte:
 380       00000000      OFST:	set	0
 383                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 385                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 387  0052 7b07          	ld	a,(OFST+7,sp)
 388  0054 88            	push	a
 389  0055 7b05          	ld	a,(OFST+5,sp)
 390  0057 b700          	ld	c_x,a
 391  0059 1e06          	ldw	x,(OFST+6,sp)
 392  005b 84            	pop	a
 393  005c bf01          	ldw	c_x+1,x
 394  005e 92bd0000      	ldf	[c_x.e],a
 395                     ; 186 }
 398  0062 81            	ret
 430                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 430                     ; 196 {
 431                     	switch	.text
 432  0063               _FLASH_ReadByte:
 434       00000000      OFST:	set	0
 437                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 439                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 441  0063 7b04          	ld	a,(OFST+4,sp)
 442  0065 b700          	ld	c_x,a
 443  0067 1e05          	ldw	x,(OFST+5,sp)
 444  0069 bf01          	ldw	c_x+1,x
 445  006b 92bc0000      	ldf	a,[c_x.e]
 448  006f 81            	ret
 487                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 487                     ; 213 {
 488                     	switch	.text
 489  0070               _FLASH_ProgramWord:
 491       00000000      OFST:	set	0
 494                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 496                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 498  0070 721c505b      	bset	20571,#6
 499                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 501  0074 721d505c      	bres	20572,#6
 502                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 504  0078 7b07          	ld	a,(OFST+7,sp)
 505  007a 88            	push	a
 506  007b 7b05          	ld	a,(OFST+5,sp)
 507  007d b700          	ld	c_x,a
 508  007f 1e06          	ldw	x,(OFST+6,sp)
 509  0081 84            	pop	a
 510  0082 bf01          	ldw	c_x+1,x
 511  0084 92bd0000      	ldf	[c_x.e],a
 512                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 514  0088 7b08          	ld	a,(OFST+8,sp)
 515  008a 88            	push	a
 516  008b 7b05          	ld	a,(OFST+5,sp)
 517  008d b700          	ld	c_x,a
 518  008f 1e06          	ldw	x,(OFST+6,sp)
 519  0091 84            	pop	a
 520  0092 90ae0001      	ldw	y,#1
 521  0096 bf01          	ldw	c_x+1,x
 522  0098 93            	ldw	x,y
 523  0099 92a70000      	ldf	([c_x.e],x),a
 524                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 526  009d 7b09          	ld	a,(OFST+9,sp)
 527  009f 88            	push	a
 528  00a0 7b05          	ld	a,(OFST+5,sp)
 529  00a2 b700          	ld	c_x,a
 530  00a4 1e06          	ldw	x,(OFST+6,sp)
 531  00a6 84            	pop	a
 532  00a7 90ae0002      	ldw	y,#2
 533  00ab bf01          	ldw	c_x+1,x
 534  00ad 93            	ldw	x,y
 535  00ae 92a70000      	ldf	([c_x.e],x),a
 536                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 538  00b2 7b0a          	ld	a,(OFST+10,sp)
 539  00b4 88            	push	a
 540  00b5 7b05          	ld	a,(OFST+5,sp)
 541  00b7 b700          	ld	c_x,a
 542  00b9 1e06          	ldw	x,(OFST+6,sp)
 543  00bb 84            	pop	a
 544  00bc 90ae0003      	ldw	y,#3
 545  00c0 bf01          	ldw	c_x+1,x
 546  00c2 93            	ldw	x,y
 547  00c3 92a70000      	ldf	([c_x.e],x),a
 548                     ; 229 }
 551  00c7 81            	ret
 592                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 592                     ; 238 {
 593                     	switch	.text
 594  00c8               _FLASH_ProgramOptionByte:
 596  00c8 89            	pushw	x
 597       00000000      OFST:	set	0
 600                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 602                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 604  00c9 721e505b      	bset	20571,#7
 605                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 607  00cd 721f505c      	bres	20572,#7
 608                     ; 247   if(Address == 0x4800)
 610  00d1 a34800        	cpw	x,#18432
 611  00d4 2607          	jrne	L522
 612                     ; 250     *((NEAR uint8_t*)Address) = Data;
 614  00d6 7b05          	ld	a,(OFST+5,sp)
 615  00d8 1e01          	ldw	x,(OFST+1,sp)
 616  00da f7            	ld	(x),a
 618  00db 200c          	jra	L722
 619  00dd               L522:
 620                     ; 255     *((NEAR uint8_t*)Address) = Data;
 622  00dd 7b05          	ld	a,(OFST+5,sp)
 623  00df 1e01          	ldw	x,(OFST+1,sp)
 624  00e1 f7            	ld	(x),a
 625                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 627  00e2 7b05          	ld	a,(OFST+5,sp)
 628  00e4 43            	cpl	a
 629  00e5 1e01          	ldw	x,(OFST+1,sp)
 630  00e7 e701          	ld	(1,x),a
 631  00e9               L722:
 632                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 634  00e9 a6fd          	ld	a,#253
 635  00eb cd01d3        	call	_FLASH_WaitForLastOperation
 637                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 639  00ee 721f505b      	bres	20571,#7
 640                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 642  00f2 721e505c      	bset	20572,#7
 643                     ; 263 }
 646  00f6 85            	popw	x
 647  00f7 81            	ret
 681                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 681                     ; 271 {
 682                     	switch	.text
 683  00f8               _FLASH_EraseOptionByte:
 685  00f8 89            	pushw	x
 686       00000000      OFST:	set	0
 689                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 691                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 693  00f9 721e505b      	bset	20571,#7
 694                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 696  00fd 721f505c      	bres	20572,#7
 697                     ; 280   if(Address == 0x4800)
 699  0101 a34800        	cpw	x,#18432
 700  0104 2603          	jrne	L542
 701                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 703  0106 7f            	clr	(x)
 705  0107 2009          	jra	L742
 706  0109               L542:
 707                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 709  0109 1e01          	ldw	x,(OFST+1,sp)
 710  010b 7f            	clr	(x)
 711                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 713  010c 1e01          	ldw	x,(OFST+1,sp)
 714  010e a6ff          	ld	a,#255
 715  0110 e701          	ld	(1,x),a
 716  0112               L742:
 717                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 719  0112 a6fd          	ld	a,#253
 720  0114 cd01d3        	call	_FLASH_WaitForLastOperation
 722                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 724  0117 721f505b      	bres	20571,#7
 725                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 727  011b 721e505c      	bset	20572,#7
 728                     ; 296 }
 731  011f 85            	popw	x
 732  0120 81            	ret
 787                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 787                     ; 304 {
 788                     	switch	.text
 789  0121               _FLASH_ReadOptionByte:
 791  0121 5204          	subw	sp,#4
 792       00000004      OFST:	set	4
 795                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 797                     ; 306   uint16_t res_value = 0;
 799                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 801                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 803  0123 f6            	ld	a,(x)
 804  0124 6b01          	ld	(OFST-3,sp),a
 806                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 808  0126 e601          	ld	a,(1,x)
 809  0128 6b02          	ld	(OFST-2,sp),a
 811                     ; 315   if(Address == 0x4800)	 
 813  012a a34800        	cpw	x,#18432
 814  012d 2608          	jrne	L372
 815                     ; 317     res_value =	 value_optbyte;
 817  012f 7b01          	ld	a,(OFST-3,sp)
 818  0131 5f            	clrw	x
 819  0132 97            	ld	xl,a
 820  0133 1f03          	ldw	(OFST-1,sp),x
 823  0135 2023          	jra	L572
 824  0137               L372:
 825                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 827  0137 7b02          	ld	a,(OFST-2,sp)
 828  0139 43            	cpl	a
 829  013a 1101          	cp	a,(OFST-3,sp)
 830  013c 2617          	jrne	L772
 831                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 833  013e 7b01          	ld	a,(OFST-3,sp)
 834  0140 5f            	clrw	x
 835  0141 97            	ld	xl,a
 836  0142 4f            	clr	a
 837  0143 02            	rlwa	x,a
 838  0144 1f03          	ldw	(OFST-1,sp),x
 840                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 842  0146 7b02          	ld	a,(OFST-2,sp)
 843  0148 5f            	clrw	x
 844  0149 97            	ld	xl,a
 845  014a 01            	rrwa	x,a
 846  014b 1a04          	or	a,(OFST+0,sp)
 847  014d 01            	rrwa	x,a
 848  014e 1a03          	or	a,(OFST-1,sp)
 849  0150 01            	rrwa	x,a
 850  0151 1f03          	ldw	(OFST-1,sp),x
 853  0153 2005          	jra	L572
 854  0155               L772:
 855                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 857  0155 ae5555        	ldw	x,#21845
 858  0158 1f03          	ldw	(OFST-1,sp),x
 860  015a               L572:
 861                     ; 331   return(res_value);
 863  015a 1e03          	ldw	x,(OFST-1,sp)
 866  015c 5b04          	addw	sp,#4
 867  015e 81            	ret
 941                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 941                     ; 341 {
 942                     	switch	.text
 943  015f               _FLASH_SetLowPowerMode:
 945  015f 88            	push	a
 946       00000000      OFST:	set	0
 949                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 951                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 953  0160 c6505a        	ld	a,20570
 954  0163 a4f3          	and	a,#243
 955  0165 c7505a        	ld	20570,a
 956                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 958  0168 c6505a        	ld	a,20570
 959  016b 1a01          	or	a,(OFST+1,sp)
 960  016d c7505a        	ld	20570,a
 961                     ; 350 }
 964  0170 84            	pop	a
 965  0171 81            	ret
1023                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1023                     ; 359 {
1024                     	switch	.text
1025  0172               _FLASH_SetProgrammingTime:
1029                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1031                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1033  0172 7211505a      	bres	20570,#0
1034                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1036  0176 ca505a        	or	a,20570
1037  0179 c7505a        	ld	20570,a
1038                     ; 365 }
1041  017c 81            	ret
1066                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1066                     ; 373 {
1067                     	switch	.text
1068  017d               _FLASH_GetLowPowerMode:
1072                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1074  017d c6505a        	ld	a,20570
1075  0180 a40c          	and	a,#12
1078  0182 81            	ret
1103                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1103                     ; 383 {
1104                     	switch	.text
1105  0183               _FLASH_GetProgrammingTime:
1109                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1111  0183 c6505a        	ld	a,20570
1112  0186 a401          	and	a,#1
1115  0188 81            	ret
1147                     ; 392 uint32_t FLASH_GetBootSize(void)
1147                     ; 393 {
1148                     	switch	.text
1149  0189               _FLASH_GetBootSize:
1151  0189 5204          	subw	sp,#4
1152       00000004      OFST:	set	4
1155                     ; 394   uint32_t temp = 0;
1157                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1159  018b c6505d        	ld	a,20573
1160  018e 5f            	clrw	x
1161  018f 97            	ld	xl,a
1162  0190 90ae0200      	ldw	y,#512
1163  0194 cd0000        	call	c_umul
1165  0197 96            	ldw	x,sp
1166  0198 1c0001        	addw	x,#OFST-3
1167  019b cd0000        	call	c_rtol
1170                     ; 400   if(FLASH->FPR == 0xFF)
1172  019e c6505d        	ld	a,20573
1173  01a1 a1ff          	cp	a,#255
1174  01a3 2611          	jrne	L714
1175                     ; 402     temp += 512;
1177  01a5 ae0200        	ldw	x,#512
1178  01a8 bf02          	ldw	c_lreg+2,x
1179  01aa ae0000        	ldw	x,#0
1180  01ad bf00          	ldw	c_lreg,x
1181  01af 96            	ldw	x,sp
1182  01b0 1c0001        	addw	x,#OFST-3
1183  01b3 cd0000        	call	c_lgadd
1186  01b6               L714:
1187                     ; 406   return(temp);
1189  01b6 96            	ldw	x,sp
1190  01b7 1c0001        	addw	x,#OFST-3
1191  01ba cd0000        	call	c_ltor
1195  01bd 5b04          	addw	sp,#4
1196  01bf 81            	ret
1305                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1305                     ; 418 {
1306                     	switch	.text
1307  01c0               _FLASH_GetFlagStatus:
1309  01c0 88            	push	a
1310       00000001      OFST:	set	1
1313                     ; 419   FlagStatus status = RESET;
1315                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1317                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1319  01c1 c4505f        	and	a,20575
1320  01c4 2706          	jreq	L174
1321                     ; 426     status = SET; /* FLASH_FLAG is set */
1323  01c6 a601          	ld	a,#1
1324  01c8 6b01          	ld	(OFST+0,sp),a
1327  01ca 2002          	jra	L374
1328  01cc               L174:
1329                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1331  01cc 0f01          	clr	(OFST+0,sp)
1333  01ce               L374:
1334                     ; 434   return status;
1336  01ce 7b01          	ld	a,(OFST+0,sp)
1339  01d0 5b01          	addw	sp,#1
1340  01d2 81            	ret
1429                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1429                     ; 550 {
1430                     	switch	.text
1431  01d3               _FLASH_WaitForLastOperation:
1433  01d3 5203          	subw	sp,#3
1434       00000003      OFST:	set	3
1437                     ; 551   uint8_t flagstatus = 0x00;
1439  01d5 0f03          	clr	(OFST+0,sp)
1441                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1443  01d7 aeffff        	ldw	x,#65535
1444  01da 1f01          	ldw	(OFST-2,sp),x
1446                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1448  01dc a1fd          	cp	a,#253
1449  01de 2628          	jrne	L155
1451  01e0 200e          	jra	L735
1452  01e2               L535:
1453                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1453                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1455  01e2 c6505f        	ld	a,20575
1456  01e5 a405          	and	a,#5
1457  01e7 6b03          	ld	(OFST+0,sp),a
1459                     ; 563         timeout--;
1461  01e9 1e01          	ldw	x,(OFST-2,sp)
1462  01eb 1d0001        	subw	x,#1
1463  01ee 1f01          	ldw	(OFST-2,sp),x
1465  01f0               L735:
1466                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1468  01f0 0d03          	tnz	(OFST+0,sp)
1469  01f2 261c          	jrne	L545
1471  01f4 1e01          	ldw	x,(OFST-2,sp)
1472  01f6 26ea          	jrne	L535
1473  01f8 2016          	jra	L545
1474  01fa               L745:
1475                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1475                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1477  01fa c6505f        	ld	a,20575
1478  01fd a441          	and	a,#65
1479  01ff 6b03          	ld	(OFST+0,sp),a
1481                     ; 572         timeout--;
1483  0201 1e01          	ldw	x,(OFST-2,sp)
1484  0203 1d0001        	subw	x,#1
1485  0206 1f01          	ldw	(OFST-2,sp),x
1487  0208               L155:
1488                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1490  0208 0d03          	tnz	(OFST+0,sp)
1491  020a 2604          	jrne	L545
1493  020c 1e01          	ldw	x,(OFST-2,sp)
1494  020e 26ea          	jrne	L745
1495  0210               L545:
1496                     ; 584   if(timeout == 0x00 )
1498  0210 1e01          	ldw	x,(OFST-2,sp)
1499  0212 2604          	jrne	L755
1500                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1502  0214 a602          	ld	a,#2
1503  0216 6b03          	ld	(OFST+0,sp),a
1505  0218               L755:
1506                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1508  0218 7b03          	ld	a,(OFST+0,sp)
1511  021a 5b03          	addw	sp,#3
1512  021c 81            	ret
1571                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1571                     ; 600 {
1572                     	switch	.text
1573  021d               _FLASH_EraseBlock:
1575  021d 89            	pushw	x
1576  021e 5207          	subw	sp,#7
1577       00000007      OFST:	set	7
1580                     ; 601   uint32_t startaddress = 0;
1582                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1584                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1586  0220 7b0c          	ld	a,(OFST+5,sp)
1587  0222 a1fd          	cp	a,#253
1588  0224 260c          	jrne	L706
1589                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1591                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1593  0226 ae8000        	ldw	x,#32768
1594  0229 1f03          	ldw	(OFST-4,sp),x
1595  022b ae0000        	ldw	x,#0
1596  022e 1f01          	ldw	(OFST-6,sp),x
1599  0230 200a          	jra	L116
1600  0232               L706:
1601                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1603                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1605  0232 ae4000        	ldw	x,#16384
1606  0235 1f03          	ldw	(OFST-4,sp),x
1607  0237 ae0000        	ldw	x,#0
1608  023a 1f01          	ldw	(OFST-6,sp),x
1610  023c               L116:
1611                     ; 625   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1613  023c 1e08          	ldw	x,(OFST+1,sp)
1614  023e a680          	ld	a,#128
1615  0240 cd0000        	call	c_cmulx
1617  0243 96            	ldw	x,sp
1618  0244 1c0001        	addw	x,#OFST-6
1619  0247 cd0000        	call	c_ladd
1621  024a 450100        	mov	c_x,c_lreg+1
1622  024d be02          	ldw	x,c_lreg+2
1623  024f b600          	ld	a,c_x
1624  0251 6b05          	ld	(OFST-2,sp),a
1625  0253 1f06          	ldw	(OFST-1,sp),x
1627                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1629  0255 721a505b      	bset	20571,#5
1630                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1632  0259 721b505c      	bres	20572,#5
1633                     ; 640     *pwFlash = (uint8_t)0;
1635  025d 7b05          	ld	a,(OFST-2,sp)
1636  025f b700          	ld	c_x,a
1637  0261 1e06          	ldw	x,(OFST-1,sp)
1638  0263 bf01          	ldw	c_x+1,x
1639  0265 4f            	clr	a
1640  0266 92bd0000      	ldf	[c_x.e],a
1641                     ; 641   *(pwFlash + 1) = (uint8_t)0;
1643  026a 7b05          	ld	a,(OFST-2,sp)
1644  026c b700          	ld	c_x,a
1645  026e 1e06          	ldw	x,(OFST-1,sp)
1646  0270 90ae0001      	ldw	y,#1
1647  0274 bf01          	ldw	c_x+1,x
1648  0276 93            	ldw	x,y
1649  0277 4f            	clr	a
1650  0278 92a70000      	ldf	([c_x.e],x),a
1651                     ; 642   *(pwFlash + 2) = (uint8_t)0;
1653  027c 7b05          	ld	a,(OFST-2,sp)
1654  027e b700          	ld	c_x,a
1655  0280 1e06          	ldw	x,(OFST-1,sp)
1656  0282 90ae0002      	ldw	y,#2
1657  0286 bf01          	ldw	c_x+1,x
1658  0288 93            	ldw	x,y
1659  0289 4f            	clr	a
1660  028a 92a70000      	ldf	([c_x.e],x),a
1661                     ; 643   *(pwFlash + 3) = (uint8_t)0;    
1663  028e 7b05          	ld	a,(OFST-2,sp)
1664  0290 b700          	ld	c_x,a
1665  0292 1e06          	ldw	x,(OFST-1,sp)
1666  0294 90ae0003      	ldw	y,#3
1667  0298 bf01          	ldw	c_x+1,x
1668  029a 93            	ldw	x,y
1669  029b 4f            	clr	a
1670  029c 92a70000      	ldf	([c_x.e],x),a
1671                     ; 645 }
1674  02a0 5b09          	addw	sp,#9
1675  02a2 81            	ret
1773                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1773                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1773                     ; 658 {
1774                     	switch	.text
1775  02a3               _FLASH_ProgramBlock:
1777  02a3 89            	pushw	x
1778  02a4 5206          	subw	sp,#6
1779       00000006      OFST:	set	6
1782                     ; 659   uint16_t Count = 0;
1784                     ; 660   uint32_t startaddress = 0;
1786                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1788                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1790                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1792  02a6 7b0b          	ld	a,(OFST+5,sp)
1793  02a8 a1fd          	cp	a,#253
1794  02aa 260c          	jrne	L756
1795                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1797                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1799  02ac ae8000        	ldw	x,#32768
1800  02af 1f03          	ldw	(OFST-3,sp),x
1801  02b1 ae0000        	ldw	x,#0
1802  02b4 1f01          	ldw	(OFST-5,sp),x
1805  02b6 200a          	jra	L166
1806  02b8               L756:
1807                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1809                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1811  02b8 ae4000        	ldw	x,#16384
1812  02bb 1f03          	ldw	(OFST-3,sp),x
1813  02bd ae0000        	ldw	x,#0
1814  02c0 1f01          	ldw	(OFST-5,sp),x
1816  02c2               L166:
1817                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1819  02c2 1e07          	ldw	x,(OFST+1,sp)
1820  02c4 a680          	ld	a,#128
1821  02c6 cd0000        	call	c_cmulx
1823  02c9 96            	ldw	x,sp
1824  02ca 1c0001        	addw	x,#OFST-5
1825  02cd cd0000        	call	c_lgadd
1828                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1830  02d0 0d0c          	tnz	(OFST+6,sp)
1831  02d2 260a          	jrne	L366
1832                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
1834  02d4 7210505b      	bset	20571,#0
1835                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1837  02d8 7211505c      	bres	20572,#0
1839  02dc 2008          	jra	L566
1840  02de               L366:
1841                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
1843  02de 7218505b      	bset	20571,#4
1844                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1846  02e2 7219505c      	bres	20572,#4
1847  02e6               L566:
1848                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1850  02e6 5f            	clrw	x
1851  02e7 1f05          	ldw	(OFST-1,sp),x
1853  02e9               L766:
1854                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1856  02e9 1e0d          	ldw	x,(OFST+7,sp)
1857  02eb 72fb05        	addw	x,(OFST-1,sp)
1858  02ee f6            	ld	a,(x)
1859  02ef 88            	push	a
1860  02f0 7b03          	ld	a,(OFST-3,sp)
1861  02f2 b700          	ld	c_x,a
1862  02f4 1e04          	ldw	x,(OFST-2,sp)
1863  02f6 84            	pop	a
1864  02f7 1605          	ldw	y,(OFST-1,sp)
1865  02f9 bf01          	ldw	c_x+1,x
1866  02fb 93            	ldw	x,y
1867  02fc 92a70000      	ldf	([c_x.e],x),a
1868                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1870  0300 1e05          	ldw	x,(OFST-1,sp)
1871  0302 1c0001        	addw	x,#1
1872  0305 1f05          	ldw	(OFST-1,sp),x
1876  0307 1e05          	ldw	x,(OFST-1,sp)
1877  0309 a30080        	cpw	x,#128
1878  030c 25db          	jrult	L766
1879                     ; 698 }
1882  030e 5b08          	addw	sp,#8
1883  0310 81            	ret
1896                     	xdef	_FLASH_WaitForLastOperation
1897                     	xdef	_FLASH_ProgramBlock
1898                     	xdef	_FLASH_EraseBlock
1899                     	xdef	_FLASH_GetFlagStatus
1900                     	xdef	_FLASH_GetBootSize
1901                     	xdef	_FLASH_GetProgrammingTime
1902                     	xdef	_FLASH_GetLowPowerMode
1903                     	xdef	_FLASH_SetProgrammingTime
1904                     	xdef	_FLASH_SetLowPowerMode
1905                     	xdef	_FLASH_EraseOptionByte
1906                     	xdef	_FLASH_ProgramOptionByte
1907                     	xdef	_FLASH_ReadOptionByte
1908                     	xdef	_FLASH_ProgramWord
1909                     	xdef	_FLASH_ReadByte
1910                     	xdef	_FLASH_ProgramByte
1911                     	xdef	_FLASH_EraseByte
1912                     	xdef	_FLASH_ITConfig
1913                     	xdef	_FLASH_DeInit
1914                     	xdef	_FLASH_Lock
1915                     	xdef	_FLASH_Unlock
1916                     	xref.b	c_lreg
1917                     	xref.b	c_x
1918                     	xref.b	c_y
1937                     	xref	c_ladd
1938                     	xref	c_cmulx
1939                     	xref	c_ltor
1940                     	xref	c_lgadd
1941                     	xref	c_rtol
1942                     	xref	c_umul
1943                     	end
