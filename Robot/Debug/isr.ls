   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  69                     ; 7 void InitCLK()
  69                     ; 8 { 
  71                     	switch	.text
  72  0000               _InitCLK:
  76                     ; 9 	FLASH_DeInit();
  78  0000 cd0000        	call	_FLASH_DeInit
  80                     ; 11 	CLK_DeInit();
  82  0003 cd0000        	call	_CLK_DeInit
  84                     ; 12 	CLK_HSECmd(DISABLE);
  86  0006 4f            	clr	a
  87  0007 cd0000        	call	_CLK_HSECmd
  89                     ; 13 	CLK_LSICmd(DISABLE);
  91  000a 4f            	clr	a
  92  000b cd0000        	call	_CLK_LSICmd
  94                     ; 14 	CLK_HSICmd(ENABLE);
  96  000e a601          	ld	a,#1
  97  0010 cd0000        	call	_CLK_HSICmd
  99                     ; 15 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
 101  0013 4f            	clr	a
 102  0014 cd0000        	call	_CLK_SYSCLKConfig
 105  0017               L77:
 106                     ; 16 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 108  0017 ae0102        	ldw	x,#258
 109  001a cd0000        	call	_CLK_GetFlagStatus
 111  001d 4d            	tnz	a
 112  001e 27f7          	jreq	L77
 113                     ; 17   CLK_ClockSwitchCmd(ENABLE);
 115  0020 a601          	ld	a,#1
 116  0022 cd0000        	call	_CLK_ClockSwitchCmd
 118                     ; 18 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 120  0025 a680          	ld	a,#128
 121  0027 cd0000        	call	_CLK_SYSCLKConfig
 123                     ; 19   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 125  002a 4b01          	push	#1
 126  002c 4b00          	push	#0
 127  002e ae01e1        	ldw	x,#481
 128  0031 cd0000        	call	_CLK_ClockSwitchConfig
 130  0034 85            	popw	x
 131                     ; 20 	CLK -> PCKENR1 = 0xff;			  //Enable all peripheral clock
 133  0035 35ff50c7      	mov	20679,#255
 134                     ; 21 	CLK -> PCKENR2 = 0xff;
 136  0039 35ff50ca      	mov	20682,#255
 137                     ; 22 }
 140  003d 81            	ret
 176                     ; 24 void InitISR(void){
 177                     	switch	.text
 178  003e               _InitISR:
 182                     ; 25 	disableInterrupts();
 185  003e 9b            sim
 187                     ; 28 	GPIO_Init(GPIOE,GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
 190  003f 4b60          	push	#96
 191  0041 4b08          	push	#8
 192  0043 ae5014        	ldw	x,#20500
 193  0046 cd0000        	call	_GPIO_Init
 195  0049 85            	popw	x
 196                     ; 29 	GPIO_Init(GPIOD,GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
 198  004a 4b60          	push	#96
 199  004c 4b10          	push	#16
 200  004e ae500f        	ldw	x,#20495
 201  0051 cd0000        	call	_GPIO_Init
 203  0054 85            	popw	x
 204                     ; 30 	GPIO_Init(GPIOC,GPIO_PIN_5, GPIO_MODE_IN_PU_IT);
 206  0055 4b60          	push	#96
 207  0057 4b20          	push	#32
 208  0059 ae500a        	ldw	x,#20490
 209  005c cd0000        	call	_GPIO_Init
 211  005f 85            	popw	x
 212                     ; 31 	GPIO_Init(GPIOA,GPIO_PIN_6, GPIO_MODE_IN_PU_IT);
 214  0060 4b60          	push	#96
 215  0062 4b40          	push	#64
 216  0064 ae5000        	ldw	x,#20480
 217  0067 cd0000        	call	_GPIO_Init
 219  006a 85            	popw	x
 220                     ; 32 	EXTI_DeInit();
 222  006b cd0000        	call	_EXTI_DeInit
 224                     ; 33 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
 226  006e ae0402        	ldw	x,#1026
 227  0071 cd0000        	call	_EXTI_SetExtIntSensitivity
 229                     ; 34 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 231  0074 ae0302        	ldw	x,#770
 232  0077 cd0000        	call	_EXTI_SetExtIntSensitivity
 234                     ; 35 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY);
 236  007a ae0202        	ldw	x,#514
 237  007d cd0000        	call	_EXTI_SetExtIntSensitivity
 239                     ; 36 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
 241  0080 ae0002        	ldw	x,#2
 242  0083 cd0000        	call	_EXTI_SetExtIntSensitivity
 244                     ; 40 	TIM2_DeInit();
 246  0086 cd0000        	call	_TIM2_DeInit
 248                     ; 41 	TIM2_OC1Init(TIM2_OCMODE_ACTIVE, TIM2_OUTPUTSTATE_DISABLE, (double)CLK_GetClockFreq()*0.002, TIM2_OCPOLARITY_HIGH);
 250  0089 4b00          	push	#0
 251  008b cd0000        	call	_CLK_GetClockFreq
 253  008e cd0000        	call	c_ultof
 255  0091 ae0000        	ldw	x,#L711
 256  0094 cd0000        	call	c_fmul
 258  0097 cd0000        	call	c_ftoi
 260  009a 89            	pushw	x
 261  009b ae1000        	ldw	x,#4096
 262  009e cd0000        	call	_TIM2_OC1Init
 264  00a1 5b03          	addw	sp,#3
 265                     ; 42 	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 65535);
 267  00a3 aeffff        	ldw	x,#65535
 268  00a6 89            	pushw	x
 269  00a7 4f            	clr	a
 270  00a8 cd0000        	call	_TIM2_TimeBaseInit
 272  00ab 85            	popw	x
 273                     ; 43 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 275  00ac ae0101        	ldw	x,#257
 276  00af cd0000        	call	_TIM2_ITConfig
 278                     ; 44 	TIM2_ClearFlag(TIM2_IT_UPDATE);
 280  00b2 ae0001        	ldw	x,#1
 281  00b5 cd0000        	call	_TIM2_ClearFlag
 283                     ; 45 	TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
 285  00b8 ae0201        	ldw	x,#513
 286  00bb cd0000        	call	_TIM2_ITConfig
 288                     ; 46 	TIM2_ClearFlag(TIM2_IT_CC1);
 290  00be ae0002        	ldw	x,#2
 291  00c1 cd0000        	call	_TIM2_ClearFlag
 293                     ; 47 	TIM2_Cmd(ENABLE);
 295  00c4 a601          	ld	a,#1
 296  00c6 cd0000        	call	_TIM2_Cmd
 298                     ; 51 	I2C_ITConfig(I2C_IT_ERR|I2C_IT_EVT|I2C_IT_BUF, ENABLE);
 300  00c9 ae0701        	ldw	x,#1793
 301  00cc cd0000        	call	_I2C_ITConfig
 303                     ; 53 	enableInterrupts();
 306  00cf 9a            rim
 308                     ; 55 }
 312  00d0 81            	ret
 325                     	xdef	_InitCLK
 326                     	xdef	_InitISR
 327                     	xref	_TIM2_ClearFlag
 328                     	xref	_TIM2_ITConfig
 329                     	xref	_TIM2_Cmd
 330                     	xref	_TIM2_OC1Init
 331                     	xref	_TIM2_TimeBaseInit
 332                     	xref	_TIM2_DeInit
 333                     	xref	_I2C_ITConfig
 334                     	xref	_GPIO_Init
 335                     	xref	_FLASH_DeInit
 336                     	xref	_EXTI_SetExtIntSensitivity
 337                     	xref	_EXTI_DeInit
 338                     	xref	_CLK_GetFlagStatus
 339                     	xref	_CLK_GetClockFreq
 340                     	xref	_CLK_SYSCLKConfig
 341                     	xref	_CLK_ClockSwitchConfig
 342                     	xref	_CLK_ClockSwitchCmd
 343                     	xref	_CLK_LSICmd
 344                     	xref	_CLK_HSICmd
 345                     	xref	_CLK_HSECmd
 346                     	xref	_CLK_DeInit
 347                     .const:	section	.text
 348  0000               L711:
 349  0000 3b03126e      	dc.w	15107,4718
 350                     	xref.b	c_x
 370                     	xref	c_ftoi
 371                     	xref	c_fmul
 372                     	xref	c_ultof
 373                     	end
