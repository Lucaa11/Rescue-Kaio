   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  57                     ; 6 unsigned int ADC_Read()
  57                     ; 7 {
  59                     	switch	.text
  60  0000               _ADC_Read:
  62  0000 89            	pushw	x
  63       00000002      OFST:	set	2
  66                     ; 8 	unsigned int result = 0;
  68                     ; 9  ADC2_DeInit();
  70  0001 cd0000        	call	_ADC2_DeInit
  72                     ; 10  ADC2_Init(ADC2_CONVERSIONMODE_SINGLE,
  72                     ; 11              ADC2_CHANNEL_0,
  72                     ; 12              ADC2_PRESSEL_FCPU_D18,
  72                     ; 13              ADC2_EXTTRIG_TIM,
  72                     ; 14              DISABLE,
  72                     ; 15              ADC2_ALIGN_RIGHT,
  72                     ; 16              ADC2_SCHMITTTRIG_ALL,
  72                     ; 17              DISABLE);
  74  0004 4b00          	push	#0
  75  0006 4b1f          	push	#31
  76  0008 4b08          	push	#8
  77  000a 4b00          	push	#0
  78  000c 4b00          	push	#0
  79  000e 4b70          	push	#112
  80  0010 5f            	clrw	x
  81  0011 cd0000        	call	_ADC2_Init
  83  0014 5b06          	addw	sp,#6
  84                     ; 18 	ADC2_Cmd(ENABLE);
  86  0016 a601          	ld	a,#1
  87  0018 cd0000        	call	_ADC2_Cmd
  89                     ; 20 	ADC2_StartConversion();
  91  001b cd0000        	call	_ADC2_StartConversion
  94  001e               L72:
  95                     ; 21 		while(ADC2_GetFlagStatus() == FALSE);
  97  001e cd0000        	call	_ADC2_GetFlagStatus
  99  0021 4d            	tnz	a
 100  0022 27fa          	jreq	L72
 101                     ; 22 		result = ADC2_GetConversionValue();
 103  0024 cd0000        	call	_ADC2_GetConversionValue
 105  0027 1f01          	ldw	(OFST-1,sp),x
 107                     ; 23 		ADC2_ClearFlag();
 109  0029 cd0000        	call	_ADC2_ClearFlag
 111                     ; 24 return result;
 113  002c 1e01          	ldw	x,(OFST-1,sp)
 116  002e 5b02          	addw	sp,#2
 117  0030 81            	ret
 130                     	xdef	_ADC_Read
 131                     	xref	_ADC2_ClearFlag
 132                     	xref	_ADC2_GetFlagStatus
 133                     	xref	_ADC2_GetConversionValue
 134                     	xref	_ADC2_StartConversion
 135                     	xref	_ADC2_Cmd
 136                     	xref	_ADC2_Init
 137                     	xref	_ADC2_DeInit
 156                     	end
