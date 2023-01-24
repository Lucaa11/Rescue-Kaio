   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 49 void TIM4_DeInit(void)
  41                     ; 50 {
  43                     	switch	.text
  44  0000               _TIM4_DeInit:
  48                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  50  0000 725f5340      	clr	21312
  51                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  53  0004 725f5341      	clr	21313
  54                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  56  0008 725f5344      	clr	21316
  57                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  59  000c 725f5345      	clr	21317
  60                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  62  0010 35ff5346      	mov	21318,#255
  63                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  65  0014 725f5342      	clr	21314
  66                     ; 57 }
  69  0018 81            	ret
 173                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 173                     ; 66 {
 174                     	switch	.text
 175  0019               _TIM4_TimeBaseInit:
 179                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 181                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 183  0019 9e            	ld	a,xh
 184  001a c75345        	ld	21317,a
 185                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 187  001d 9f            	ld	a,xl
 188  001e c75346        	ld	21318,a
 189                     ; 73 }
 192  0021 81            	ret
 247                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 247                     ; 82 {
 248                     	switch	.text
 249  0022               _TIM4_Cmd:
 253                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 255                     ; 87   if (NewState != DISABLE)
 257  0022 4d            	tnz	a
 258  0023 2706          	jreq	L311
 259                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 261  0025 72105340      	bset	21312,#0
 263  0029 2004          	jra	L511
 264  002b               L311:
 265                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 267  002b 72115340      	bres	21312,#0
 268  002f               L511:
 269                     ; 95 }
 272  002f 81            	ret
 330                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 330                     ; 108 {
 331                     	switch	.text
 332  0030               _TIM4_ITConfig:
 334  0030 89            	pushw	x
 335       00000000      OFST:	set	0
 338                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 340                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 342                     ; 113   if (NewState != DISABLE)
 344  0031 9f            	ld	a,xl
 345  0032 4d            	tnz	a
 346  0033 2709          	jreq	L741
 347                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 349  0035 9e            	ld	a,xh
 350  0036 ca5341        	or	a,21313
 351  0039 c75341        	ld	21313,a
 353  003c 2009          	jra	L151
 354  003e               L741:
 355                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 357  003e 7b01          	ld	a,(OFST+1,sp)
 358  0040 43            	cpl	a
 359  0041 c45341        	and	a,21313
 360  0044 c75341        	ld	21313,a
 361  0047               L151:
 362                     ; 123 }
 365  0047 85            	popw	x
 366  0048 81            	ret
 402                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 402                     ; 132 {
 403                     	switch	.text
 404  0049               _TIM4_UpdateDisableConfig:
 408                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410                     ; 137   if (NewState != DISABLE)
 412  0049 4d            	tnz	a
 413  004a 2706          	jreq	L171
 414                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 416  004c 72125340      	bset	21312,#1
 418  0050 2004          	jra	L371
 419  0052               L171:
 420                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 422  0052 72135340      	bres	21312,#1
 423  0056               L371:
 424                     ; 145 }
 427  0056 81            	ret
 485                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 485                     ; 156 {
 486                     	switch	.text
 487  0057               _TIM4_UpdateRequestConfig:
 491                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 493                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 495  0057 4d            	tnz	a
 496  0058 2706          	jreq	L322
 497                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 499  005a 72145340      	bset	21312,#2
 501  005e 2004          	jra	L522
 502  0060               L322:
 503                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 505  0060 72155340      	bres	21312,#2
 506  0064               L522:
 507                     ; 169 }
 510  0064 81            	ret
 567                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 567                     ; 180 {
 568                     	switch	.text
 569  0065               _TIM4_SelectOnePulseMode:
 573                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 575                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 577  0065 4d            	tnz	a
 578  0066 2706          	jreq	L552
 579                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 581  0068 72165340      	bset	21312,#3
 583  006c 2004          	jra	L752
 584  006e               L552:
 585                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 587  006e 72175340      	bres	21312,#3
 588  0072               L752:
 589                     ; 193 }
 592  0072 81            	ret
 660                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 660                     ; 216 {
 661                     	switch	.text
 662  0073               _TIM4_PrescalerConfig:
 666                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 668                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 670                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 672  0073 9e            	ld	a,xh
 673  0074 c75345        	ld	21317,a
 674                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 676  0077 9f            	ld	a,xl
 677  0078 c75343        	ld	21315,a
 678                     ; 226 }
 681  007b 81            	ret
 717                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 717                     ; 235 {
 718                     	switch	.text
 719  007c               _TIM4_ARRPreloadConfig:
 723                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 240   if (NewState != DISABLE)
 727  007c 4d            	tnz	a
 728  007d 2706          	jreq	L133
 729                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 731  007f 721e5340      	bset	21312,#7
 733  0083 2004          	jra	L333
 734  0085               L133:
 735                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 737  0085 721f5340      	bres	21312,#7
 738  0089               L333:
 739                     ; 248 }
 742  0089 81            	ret
 791                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 791                     ; 258 {
 792                     	switch	.text
 793  008a               _TIM4_GenerateEvent:
 797                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 799                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 801  008a c75343        	ld	21315,a
 802                     ; 264 }
 805  008d 81            	ret
 837                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 837                     ; 273 {
 838                     	switch	.text
 839  008e               _TIM4_SetCounter:
 843                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 845  008e c75344        	ld	21316,a
 846                     ; 276 }
 849  0091 81            	ret
 881                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 881                     ; 285 {
 882                     	switch	.text
 883  0092               _TIM4_SetAutoreload:
 887                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 889  0092 c75346        	ld	21318,a
 890                     ; 288 }
 893  0095 81            	ret
 916                     ; 295 uint8_t TIM4_GetCounter(void)
 916                     ; 296 {
 917                     	switch	.text
 918  0096               _TIM4_GetCounter:
 922                     ; 298   return (uint8_t)(TIM4->CNTR);
 924  0096 c65344        	ld	a,21316
 927  0099 81            	ret
 951                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 951                     ; 307 {
 952                     	switch	.text
 953  009a               _TIM4_GetPrescaler:
 957                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 959  009a c65345        	ld	a,21317
 962  009d 81            	ret
1041                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1041                     ; 320 {
1042                     	switch	.text
1043  009e               _TIM4_GetFlagStatus:
1045  009e 88            	push	a
1046       00000001      OFST:	set	1
1049                     ; 321   FlagStatus bitstatus = RESET;
1051                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1053                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1055  009f c45342        	and	a,21314
1056  00a2 2706          	jreq	L174
1057                     ; 328     bitstatus = SET;
1059  00a4 a601          	ld	a,#1
1060  00a6 6b01          	ld	(OFST+0,sp),a
1063  00a8 2002          	jra	L374
1064  00aa               L174:
1065                     ; 332     bitstatus = RESET;
1067  00aa 0f01          	clr	(OFST+0,sp)
1069  00ac               L374:
1070                     ; 334   return ((FlagStatus)bitstatus);
1072  00ac 7b01          	ld	a,(OFST+0,sp)
1075  00ae 5b01          	addw	sp,#1
1076  00b0 81            	ret
1111                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1111                     ; 345 {
1112                     	switch	.text
1113  00b1               _TIM4_ClearFlag:
1117                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1119                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1121  00b1 43            	cpl	a
1122  00b2 c75342        	ld	21314,a
1123                     ; 351 }
1126  00b5 81            	ret
1186                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1186                     ; 361 {
1187                     	switch	.text
1188  00b6               _TIM4_GetITStatus:
1190  00b6 88            	push	a
1191  00b7 89            	pushw	x
1192       00000002      OFST:	set	2
1195                     ; 362   ITStatus bitstatus = RESET;
1197                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1201                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1203                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1205  00b8 c45342        	and	a,21314
1206  00bb 6b01          	ld	(OFST-1,sp),a
1208                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1210  00bd c65341        	ld	a,21313
1211  00c0 1403          	and	a,(OFST+1,sp)
1212  00c2 6b02          	ld	(OFST+0,sp),a
1214                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1216  00c4 0d01          	tnz	(OFST-1,sp)
1217  00c6 270a          	jreq	L145
1219  00c8 0d02          	tnz	(OFST+0,sp)
1220  00ca 2706          	jreq	L145
1221                     ; 375     bitstatus = (ITStatus)SET;
1223  00cc a601          	ld	a,#1
1224  00ce 6b02          	ld	(OFST+0,sp),a
1227  00d0 2002          	jra	L345
1228  00d2               L145:
1229                     ; 379     bitstatus = (ITStatus)RESET;
1231  00d2 0f02          	clr	(OFST+0,sp)
1233  00d4               L345:
1234                     ; 381   return ((ITStatus)bitstatus);
1236  00d4 7b02          	ld	a,(OFST+0,sp)
1239  00d6 5b03          	addw	sp,#3
1240  00d8 81            	ret
1276                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1276                     ; 392 {
1277                     	switch	.text
1278  00d9               _TIM4_ClearITPendingBit:
1282                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1284                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1286  00d9 43            	cpl	a
1287  00da c75342        	ld	21314,a
1288                     ; 398 }
1291  00dd 81            	ret
1304                     	xdef	_TIM4_ClearITPendingBit
1305                     	xdef	_TIM4_GetITStatus
1306                     	xdef	_TIM4_ClearFlag
1307                     	xdef	_TIM4_GetFlagStatus
1308                     	xdef	_TIM4_GetPrescaler
1309                     	xdef	_TIM4_GetCounter
1310                     	xdef	_TIM4_SetAutoreload
1311                     	xdef	_TIM4_SetCounter
1312                     	xdef	_TIM4_GenerateEvent
1313                     	xdef	_TIM4_ARRPreloadConfig
1314                     	xdef	_TIM4_PrescalerConfig
1315                     	xdef	_TIM4_SelectOnePulseMode
1316                     	xdef	_TIM4_UpdateRequestConfig
1317                     	xdef	_TIM4_UpdateDisableConfig
1318                     	xdef	_TIM4_ITConfig
1319                     	xdef	_TIM4_Cmd
1320                     	xdef	_TIM4_TimeBaseInit
1321                     	xdef	_TIM4_DeInit
1340                     	end
