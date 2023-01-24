   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  41                     ; 58 void TIM1_DeInit(void)
  41                     ; 59 {
  43                     	switch	.text
  44  0000               _TIM1_DeInit:
  48                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  50  0000 725f5250      	clr	21072
  51                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  53  0004 725f5251      	clr	21073
  54                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  56  0008 725f5252      	clr	21074
  57                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  59  000c 725f5253      	clr	21075
  60                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  62  0010 725f5254      	clr	21076
  63                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  65  0014 725f5256      	clr	21078
  66                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  68  0018 725f525c      	clr	21084
  69                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  71  001c 725f525d      	clr	21085
  72                     ; 70   TIM1->CCMR1 = 0x01;
  74  0020 35015258      	mov	21080,#1
  75                     ; 71   TIM1->CCMR2 = 0x01;
  77  0024 35015259      	mov	21081,#1
  78                     ; 72   TIM1->CCMR3 = 0x01;
  80  0028 3501525a      	mov	21082,#1
  81                     ; 73   TIM1->CCMR4 = 0x01;
  83  002c 3501525b      	mov	21083,#1
  84                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  86  0030 725f525c      	clr	21084
  87                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  89  0034 725f525d      	clr	21085
  90                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  92  0038 725f5258      	clr	21080
  93                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  95  003c 725f5259      	clr	21081
  96                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  98  0040 725f525a      	clr	21082
  99                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 101  0044 725f525b      	clr	21083
 102                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 104  0048 725f525e      	clr	21086
 105                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 107  004c 725f525f      	clr	21087
 108                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 110  0050 725f5260      	clr	21088
 111                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 113  0054 725f5261      	clr	21089
 114                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 116  0058 35ff5262      	mov	21090,#255
 117                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 119  005c 35ff5263      	mov	21091,#255
 120                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 122  0060 725f5265      	clr	21093
 123                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 125  0064 725f5266      	clr	21094
 126                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 128  0068 725f5267      	clr	21095
 129                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 131  006c 725f5268      	clr	21096
 132                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 134  0070 725f5269      	clr	21097
 135                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 137  0074 725f526a      	clr	21098
 138                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 140  0078 725f526b      	clr	21099
 141                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 143  007c 725f526c      	clr	21100
 144                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 146  0080 725f526f      	clr	21103
 147                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 149  0084 35015257      	mov	21079,#1
 150                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 152  0088 725f526e      	clr	21102
 153                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 155  008c 725f526d      	clr	21101
 156                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 158  0090 725f5264      	clr	21092
 159                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 161  0094 725f5255      	clr	21077
 162                     ; 101 }
 165  0098 81            	ret
 268                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 268                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 268                     ; 113                        uint16_t TIM1_Period,
 268                     ; 114                        uint8_t TIM1_RepetitionCounter)
 268                     ; 115 {
 269                     	switch	.text
 270  0099               _TIM1_TimeBaseInit:
 272  0099 89            	pushw	x
 273       00000000      OFST:	set	0
 276                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 278                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 280  009a 7b06          	ld	a,(OFST+6,sp)
 281  009c c75262        	ld	21090,a
 282                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 284  009f 7b07          	ld	a,(OFST+7,sp)
 285  00a1 c75263        	ld	21091,a
 286                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 288  00a4 9e            	ld	a,xh
 289  00a5 c75260        	ld	21088,a
 290                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 292  00a8 9f            	ld	a,xl
 293  00a9 c75261        	ld	21089,a
 294                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 294                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 296  00ac c65250        	ld	a,21072
 297  00af a48f          	and	a,#143
 298  00b1 1a05          	or	a,(OFST+5,sp)
 299  00b3 c75250        	ld	21072,a
 300                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 302  00b6 7b08          	ld	a,(OFST+8,sp)
 303  00b8 c75264        	ld	21092,a
 304                     ; 133 }
 307  00bb 85            	popw	x
 308  00bc 81            	ret
 591                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 591                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 591                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 591                     ; 157                   uint16_t TIM1_Pulse,
 591                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 591                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 591                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 591                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 591                     ; 162 {
 592                     	switch	.text
 593  00bd               _TIM1_OC1Init:
 595  00bd 89            	pushw	x
 596  00be 5203          	subw	sp,#3
 597       00000003      OFST:	set	3
 600                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 602                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 604                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 606                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 608                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 610                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 612                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 614                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 614                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 616  00c0 c6525c        	ld	a,21084
 617  00c3 a4f0          	and	a,#240
 618  00c5 c7525c        	ld	21084,a
 619                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 619                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 619                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 619                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 621  00c8 7b0c          	ld	a,(OFST+9,sp)
 622  00ca a408          	and	a,#8
 623  00cc 6b03          	ld	(OFST+0,sp),a
 625  00ce 7b0b          	ld	a,(OFST+8,sp)
 626  00d0 a402          	and	a,#2
 627  00d2 1a03          	or	a,(OFST+0,sp)
 628  00d4 6b02          	ld	(OFST-1,sp),a
 630  00d6 7b08          	ld	a,(OFST+5,sp)
 631  00d8 a404          	and	a,#4
 632  00da 6b01          	ld	(OFST-2,sp),a
 634  00dc 9f            	ld	a,xl
 635  00dd a401          	and	a,#1
 636  00df 1a01          	or	a,(OFST-2,sp)
 637  00e1 1a02          	or	a,(OFST-1,sp)
 638  00e3 ca525c        	or	a,21084
 639  00e6 c7525c        	ld	21084,a
 640                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 640                     ; 185                           (uint8_t)TIM1_OCMode);
 642  00e9 c65258        	ld	a,21080
 643  00ec a48f          	and	a,#143
 644  00ee 1a04          	or	a,(OFST+1,sp)
 645  00f0 c75258        	ld	21080,a
 646                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 648  00f3 c6526f        	ld	a,21103
 649  00f6 a4fc          	and	a,#252
 650  00f8 c7526f        	ld	21103,a
 651                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 651                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 653  00fb 7b0e          	ld	a,(OFST+11,sp)
 654  00fd a402          	and	a,#2
 655  00ff 6b03          	ld	(OFST+0,sp),a
 657  0101 7b0d          	ld	a,(OFST+10,sp)
 658  0103 a401          	and	a,#1
 659  0105 1a03          	or	a,(OFST+0,sp)
 660  0107 ca526f        	or	a,21103
 661  010a c7526f        	ld	21103,a
 662                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 664  010d 7b09          	ld	a,(OFST+6,sp)
 665  010f c75265        	ld	21093,a
 666                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 668  0112 7b0a          	ld	a,(OFST+7,sp)
 669  0114 c75266        	ld	21094,a
 670                     ; 196 }
 673  0117 5b05          	addw	sp,#5
 674  0119 81            	ret
 776                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 776                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 776                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 776                     ; 220                   uint16_t TIM1_Pulse,
 776                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 776                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 776                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 776                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 776                     ; 225 {
 777                     	switch	.text
 778  011a               _TIM1_OC2Init:
 780  011a 89            	pushw	x
 781  011b 5203          	subw	sp,#3
 782       00000003      OFST:	set	3
 785                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 787                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 789                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 791                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 793                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 795                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 797                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 799                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 799                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 801  011d c6525c        	ld	a,21084
 802  0120 a40f          	and	a,#15
 803  0122 c7525c        	ld	21084,a
 804                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 804                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 804                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 804                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 806  0125 7b0c          	ld	a,(OFST+9,sp)
 807  0127 a480          	and	a,#128
 808  0129 6b03          	ld	(OFST+0,sp),a
 810  012b 7b0b          	ld	a,(OFST+8,sp)
 811  012d a420          	and	a,#32
 812  012f 1a03          	or	a,(OFST+0,sp)
 813  0131 6b02          	ld	(OFST-1,sp),a
 815  0133 7b08          	ld	a,(OFST+5,sp)
 816  0135 a440          	and	a,#64
 817  0137 6b01          	ld	(OFST-2,sp),a
 819  0139 9f            	ld	a,xl
 820  013a a410          	and	a,#16
 821  013c 1a01          	or	a,(OFST-2,sp)
 822  013e 1a02          	or	a,(OFST-1,sp)
 823  0140 ca525c        	or	a,21084
 824  0143 c7525c        	ld	21084,a
 825                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 825                     ; 249                           (uint8_t)TIM1_OCMode);
 827  0146 c65259        	ld	a,21081
 828  0149 a48f          	and	a,#143
 829  014b 1a04          	or	a,(OFST+1,sp)
 830  014d c75259        	ld	21081,a
 831                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 833  0150 c6526f        	ld	a,21103
 834  0153 a4f3          	and	a,#243
 835  0155 c7526f        	ld	21103,a
 836                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 836                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 838  0158 7b0e          	ld	a,(OFST+11,sp)
 839  015a a408          	and	a,#8
 840  015c 6b03          	ld	(OFST+0,sp),a
 842  015e 7b0d          	ld	a,(OFST+10,sp)
 843  0160 a404          	and	a,#4
 844  0162 1a03          	or	a,(OFST+0,sp)
 845  0164 ca526f        	or	a,21103
 846  0167 c7526f        	ld	21103,a
 847                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 849  016a 7b09          	ld	a,(OFST+6,sp)
 850  016c c75267        	ld	21095,a
 851                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 853  016f 7b0a          	ld	a,(OFST+7,sp)
 854  0171 c75268        	ld	21096,a
 855                     ; 260 }
 858  0174 5b05          	addw	sp,#5
 859  0176 81            	ret
 961                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 961                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 961                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 961                     ; 284                   uint16_t TIM1_Pulse,
 961                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 961                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 961                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 961                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 961                     ; 289 {
 962                     	switch	.text
 963  0177               _TIM1_OC3Init:
 965  0177 89            	pushw	x
 966  0178 5203          	subw	sp,#3
 967       00000003      OFST:	set	3
 970                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 972                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 974                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 976                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 978                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 980                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 982                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 984                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 984                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 986  017a c6525d        	ld	a,21085
 987  017d a4f0          	and	a,#240
 988  017f c7525d        	ld	21085,a
 989                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 989                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 989                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 989                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 991  0182 7b0c          	ld	a,(OFST+9,sp)
 992  0184 a408          	and	a,#8
 993  0186 6b03          	ld	(OFST+0,sp),a
 995  0188 7b0b          	ld	a,(OFST+8,sp)
 996  018a a402          	and	a,#2
 997  018c 1a03          	or	a,(OFST+0,sp)
 998  018e 6b02          	ld	(OFST-1,sp),a
1000  0190 7b08          	ld	a,(OFST+5,sp)
1001  0192 a404          	and	a,#4
1002  0194 6b01          	ld	(OFST-2,sp),a
1004  0196 9f            	ld	a,xl
1005  0197 a401          	and	a,#1
1006  0199 1a01          	or	a,(OFST-2,sp)
1007  019b 1a02          	or	a,(OFST-1,sp)
1008  019d ca525d        	or	a,21085
1009  01a0 c7525d        	ld	21085,a
1010                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1010                     ; 312                           (uint8_t)TIM1_OCMode);
1012  01a3 c6525a        	ld	a,21082
1013  01a6 a48f          	and	a,#143
1014  01a8 1a04          	or	a,(OFST+1,sp)
1015  01aa c7525a        	ld	21082,a
1016                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1018  01ad c6526f        	ld	a,21103
1019  01b0 a4cf          	and	a,#207
1020  01b2 c7526f        	ld	21103,a
1021                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1021                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1023  01b5 7b0e          	ld	a,(OFST+11,sp)
1024  01b7 a420          	and	a,#32
1025  01b9 6b03          	ld	(OFST+0,sp),a
1027  01bb 7b0d          	ld	a,(OFST+10,sp)
1028  01bd a410          	and	a,#16
1029  01bf 1a03          	or	a,(OFST+0,sp)
1030  01c1 ca526f        	or	a,21103
1031  01c4 c7526f        	ld	21103,a
1032                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1034  01c7 7b09          	ld	a,(OFST+6,sp)
1035  01c9 c75269        	ld	21097,a
1036                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1038  01cc 7b0a          	ld	a,(OFST+7,sp)
1039  01ce c7526a        	ld	21098,a
1040                     ; 323 }
1043  01d1 5b05          	addw	sp,#5
1044  01d3 81            	ret
1116                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1116                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1116                     ; 340                   uint16_t TIM1_Pulse,
1116                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1116                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1116                     ; 343 {
1117                     	switch	.text
1118  01d4               _TIM1_OC4Init:
1120  01d4 89            	pushw	x
1121  01d5 88            	push	a
1122       00000001      OFST:	set	1
1125                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1127                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1129                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1131                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1133                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1135  01d6 c6525d        	ld	a,21085
1136  01d9 a4cf          	and	a,#207
1137  01db c7525d        	ld	21085,a
1138                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1138                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1140  01de 7b08          	ld	a,(OFST+7,sp)
1141  01e0 a420          	and	a,#32
1142  01e2 6b01          	ld	(OFST+0,sp),a
1144  01e4 9f            	ld	a,xl
1145  01e5 a410          	and	a,#16
1146  01e7 1a01          	or	a,(OFST+0,sp)
1147  01e9 ca525d        	or	a,21085
1148  01ec c7525d        	ld	21085,a
1149                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1149                     ; 358                           TIM1_OCMode);
1151  01ef c6525b        	ld	a,21083
1152  01f2 a48f          	and	a,#143
1153  01f4 1a02          	or	a,(OFST+1,sp)
1154  01f6 c7525b        	ld	21083,a
1155                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1157  01f9 0d09          	tnz	(OFST+8,sp)
1158  01fb 270a          	jreq	L714
1159                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1161  01fd c6526f        	ld	a,21103
1162  0200 aadf          	or	a,#223
1163  0202 c7526f        	ld	21103,a
1165  0205 2004          	jra	L124
1166  0207               L714:
1167                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1169  0207 721d526f      	bres	21103,#6
1170  020b               L124:
1171                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1173  020b 7b06          	ld	a,(OFST+5,sp)
1174  020d c7526b        	ld	21099,a
1175                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1177  0210 7b07          	ld	a,(OFST+6,sp)
1178  0212 c7526c        	ld	21100,a
1179                     ; 373 }
1182  0215 5b03          	addw	sp,#3
1183  0217 81            	ret
1386                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1386                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1386                     ; 390                      uint8_t TIM1_DeadTime,
1386                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1386                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1386                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1386                     ; 394 {
1387                     	switch	.text
1388  0218               _TIM1_BDTRConfig:
1390  0218 89            	pushw	x
1391  0219 88            	push	a
1392       00000001      OFST:	set	1
1395                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1397                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1399                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1401                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1403                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1405                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1407  021a 7b06          	ld	a,(OFST+5,sp)
1408  021c c7526e        	ld	21102,a
1409                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1409                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1409                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1411  021f 7b07          	ld	a,(OFST+6,sp)
1412  0221 1a08          	or	a,(OFST+7,sp)
1413  0223 1a09          	or	a,(OFST+8,sp)
1414  0225 6b01          	ld	(OFST+0,sp),a
1416  0227 9f            	ld	a,xl
1417  0228 1a02          	or	a,(OFST+1,sp)
1418  022a 1a01          	or	a,(OFST+0,sp)
1419  022c c7526d        	ld	21101,a
1420                     ; 409 }
1423  022f 5b03          	addw	sp,#3
1424  0231 81            	ret
1624                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1624                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1624                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1624                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1624                     ; 427                  uint8_t TIM1_ICFilter)
1624                     ; 428 {
1625                     	switch	.text
1626  0232               _TIM1_ICInit:
1628  0232 89            	pushw	x
1629       00000000      OFST:	set	0
1632                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1634                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1636                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1638                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1640                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1642                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1644  0233 9e            	ld	a,xh
1645  0234 4d            	tnz	a
1646  0235 2614          	jrne	L546
1647                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1647                     ; 440                (uint8_t)TIM1_ICSelection,
1647                     ; 441                (uint8_t)TIM1_ICFilter);
1649  0237 7b07          	ld	a,(OFST+7,sp)
1650  0239 88            	push	a
1651  023a 7b06          	ld	a,(OFST+6,sp)
1652  023c 97            	ld	xl,a
1653  023d 7b03          	ld	a,(OFST+3,sp)
1654  023f 95            	ld	xh,a
1655  0240 cd080e        	call	L3_TI1_Config
1657  0243 84            	pop	a
1658                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1660  0244 7b06          	ld	a,(OFST+6,sp)
1661  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1664  0249 2046          	jra	L746
1665  024b               L546:
1666                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1668  024b 7b01          	ld	a,(OFST+1,sp)
1669  024d a101          	cp	a,#1
1670  024f 2614          	jrne	L156
1671                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1671                     ; 449                (uint8_t)TIM1_ICSelection,
1671                     ; 450                (uint8_t)TIM1_ICFilter);
1673  0251 7b07          	ld	a,(OFST+7,sp)
1674  0253 88            	push	a
1675  0254 7b06          	ld	a,(OFST+6,sp)
1676  0256 97            	ld	xl,a
1677  0257 7b03          	ld	a,(OFST+3,sp)
1678  0259 95            	ld	xh,a
1679  025a cd083e        	call	L5_TI2_Config
1681  025d 84            	pop	a
1682                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1684  025e 7b06          	ld	a,(OFST+6,sp)
1685  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1688  0263 202c          	jra	L746
1689  0265               L156:
1690                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1692  0265 7b01          	ld	a,(OFST+1,sp)
1693  0267 a102          	cp	a,#2
1694  0269 2614          	jrne	L556
1695                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1695                     ; 458                (uint8_t)TIM1_ICSelection,
1695                     ; 459                (uint8_t)TIM1_ICFilter);
1697  026b 7b07          	ld	a,(OFST+7,sp)
1698  026d 88            	push	a
1699  026e 7b06          	ld	a,(OFST+6,sp)
1700  0270 97            	ld	xl,a
1701  0271 7b03          	ld	a,(OFST+3,sp)
1702  0273 95            	ld	xh,a
1703  0274 cd086e        	call	L7_TI3_Config
1705  0277 84            	pop	a
1706                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1708  0278 7b06          	ld	a,(OFST+6,sp)
1709  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1712  027d 2012          	jra	L746
1713  027f               L556:
1714                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1714                     ; 467                (uint8_t)TIM1_ICSelection,
1714                     ; 468                (uint8_t)TIM1_ICFilter);
1716  027f 7b07          	ld	a,(OFST+7,sp)
1717  0281 88            	push	a
1718  0282 7b06          	ld	a,(OFST+6,sp)
1719  0284 97            	ld	xl,a
1720  0285 7b03          	ld	a,(OFST+3,sp)
1721  0287 95            	ld	xh,a
1722  0288 cd089e        	call	L11_TI4_Config
1724  028b 84            	pop	a
1725                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1727  028c 7b06          	ld	a,(OFST+6,sp)
1728  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1730  0291               L746:
1731                     ; 472 }
1734  0291 85            	popw	x
1735  0292 81            	ret
1825                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1825                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1825                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1825                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1825                     ; 492                      uint8_t TIM1_ICFilter)
1825                     ; 493 {
1826                     	switch	.text
1827  0293               _TIM1_PWMIConfig:
1829  0293 89            	pushw	x
1830  0294 89            	pushw	x
1831       00000002      OFST:	set	2
1834                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1836                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1838                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1840                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1842                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1844                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1846                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1848  0295 9f            	ld	a,xl
1849  0296 a101          	cp	a,#1
1850  0298 2706          	jreq	L127
1851                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1853  029a a601          	ld	a,#1
1854  029c 6b01          	ld	(OFST-1,sp),a
1857  029e 2002          	jra	L327
1858  02a0               L127:
1859                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1861  02a0 0f01          	clr	(OFST-1,sp)
1863  02a2               L327:
1864                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1866  02a2 7b07          	ld	a,(OFST+5,sp)
1867  02a4 a101          	cp	a,#1
1868  02a6 2606          	jrne	L527
1869                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1871  02a8 a602          	ld	a,#2
1872  02aa 6b02          	ld	(OFST+0,sp),a
1875  02ac 2004          	jra	L727
1876  02ae               L527:
1877                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1879  02ae a601          	ld	a,#1
1880  02b0 6b02          	ld	(OFST+0,sp),a
1882  02b2               L727:
1883                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1885  02b2 0d03          	tnz	(OFST+1,sp)
1886  02b4 2626          	jrne	L137
1887                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1887                     ; 527                (uint8_t)TIM1_ICFilter);
1889  02b6 7b09          	ld	a,(OFST+7,sp)
1890  02b8 88            	push	a
1891  02b9 7b08          	ld	a,(OFST+6,sp)
1892  02bb 97            	ld	xl,a
1893  02bc 7b05          	ld	a,(OFST+3,sp)
1894  02be 95            	ld	xh,a
1895  02bf cd080e        	call	L3_TI1_Config
1897  02c2 84            	pop	a
1898                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1900  02c3 7b08          	ld	a,(OFST+6,sp)
1901  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1903                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1905  02c8 7b09          	ld	a,(OFST+7,sp)
1906  02ca 88            	push	a
1907  02cb 7b03          	ld	a,(OFST+1,sp)
1908  02cd 97            	ld	xl,a
1909  02ce 7b02          	ld	a,(OFST+0,sp)
1910  02d0 95            	ld	xh,a
1911  02d1 cd083e        	call	L5_TI2_Config
1913  02d4 84            	pop	a
1914                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1916  02d5 7b08          	ld	a,(OFST+6,sp)
1917  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1920  02da 2024          	jra	L337
1921  02dc               L137:
1922                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1922                     ; 542                (uint8_t)TIM1_ICFilter);
1924  02dc 7b09          	ld	a,(OFST+7,sp)
1925  02de 88            	push	a
1926  02df 7b08          	ld	a,(OFST+6,sp)
1927  02e1 97            	ld	xl,a
1928  02e2 7b05          	ld	a,(OFST+3,sp)
1929  02e4 95            	ld	xh,a
1930  02e5 cd083e        	call	L5_TI2_Config
1932  02e8 84            	pop	a
1933                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1935  02e9 7b08          	ld	a,(OFST+6,sp)
1936  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1938                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1940  02ee 7b09          	ld	a,(OFST+7,sp)
1941  02f0 88            	push	a
1942  02f1 7b03          	ld	a,(OFST+1,sp)
1943  02f3 97            	ld	xl,a
1944  02f4 7b02          	ld	a,(OFST+0,sp)
1945  02f6 95            	ld	xh,a
1946  02f7 cd080e        	call	L3_TI1_Config
1948  02fa 84            	pop	a
1949                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1951  02fb 7b08          	ld	a,(OFST+6,sp)
1952  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1954  0300               L337:
1955                     ; 553 }
1958  0300 5b04          	addw	sp,#4
1959  0302 81            	ret
2014                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2014                     ; 562 {
2015                     	switch	.text
2016  0303               _TIM1_Cmd:
2020                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2022                     ; 567   if (NewState != DISABLE)
2024  0303 4d            	tnz	a
2025  0304 2706          	jreq	L367
2026                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2028  0306 72105250      	bset	21072,#0
2030  030a 2004          	jra	L567
2031  030c               L367:
2032                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2034  030c 72115250      	bres	21072,#0
2035  0310               L567:
2036                     ; 575 }
2039  0310 81            	ret
2075                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2075                     ; 584 {
2076                     	switch	.text
2077  0311               _TIM1_CtrlPWMOutputs:
2081                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2083                     ; 590   if (NewState != DISABLE)
2085  0311 4d            	tnz	a
2086  0312 2706          	jreq	L5001
2087                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2089  0314 721e526d      	bset	21101,#7
2091  0318 2004          	jra	L7001
2092  031a               L5001:
2093                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2095  031a 721f526d      	bres	21101,#7
2096  031e               L7001:
2097                     ; 598 }
2100  031e 81            	ret
2207                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2207                     ; 618 {
2208                     	switch	.text
2209  031f               _TIM1_ITConfig:
2211  031f 89            	pushw	x
2212       00000000      OFST:	set	0
2215                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2217                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2219                     ; 623   if (NewState != DISABLE)
2221  0320 9f            	ld	a,xl
2222  0321 4d            	tnz	a
2223  0322 2709          	jreq	L7501
2224                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2226  0324 9e            	ld	a,xh
2227  0325 ca5254        	or	a,21076
2228  0328 c75254        	ld	21076,a
2230  032b 2009          	jra	L1601
2231  032d               L7501:
2232                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2234  032d 7b01          	ld	a,(OFST+1,sp)
2235  032f 43            	cpl	a
2236  0330 c45254        	and	a,21076
2237  0333 c75254        	ld	21076,a
2238  0336               L1601:
2239                     ; 633 }
2242  0336 85            	popw	x
2243  0337 81            	ret
2267                     ; 640 void TIM1_InternalClockConfig(void)
2267                     ; 641 {
2268                     	switch	.text
2269  0338               _TIM1_InternalClockConfig:
2273                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2275  0338 c65252        	ld	a,21074
2276  033b a4f8          	and	a,#248
2277  033d c75252        	ld	21074,a
2278                     ; 644 }
2281  0340 81            	ret
2396                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2396                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2396                     ; 664                               uint8_t ExtTRGFilter)
2396                     ; 665 {
2397                     	switch	.text
2398  0341               _TIM1_ETRClockMode1Config:
2400  0341 89            	pushw	x
2401       00000000      OFST:	set	0
2404                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2406                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2408                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2410  0342 7b05          	ld	a,(OFST+5,sp)
2411  0344 88            	push	a
2412  0345 9f            	ld	a,xl
2413  0346 97            	ld	xl,a
2414  0347 7b02          	ld	a,(OFST+2,sp)
2415  0349 95            	ld	xh,a
2416  034a ad1f          	call	_TIM1_ETRConfig
2418  034c 84            	pop	a
2419                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2419                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2421  034d c65252        	ld	a,21074
2422  0350 a488          	and	a,#136
2423  0352 aa77          	or	a,#119
2424  0354 c75252        	ld	21074,a
2425                     ; 676 }
2428  0357 85            	popw	x
2429  0358 81            	ret
2485                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2485                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2485                     ; 696                               uint8_t ExtTRGFilter)
2485                     ; 697 {
2486                     	switch	.text
2487  0359               _TIM1_ETRClockMode2Config:
2489  0359 89            	pushw	x
2490       00000000      OFST:	set	0
2493                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2495                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2497                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2499  035a 7b05          	ld	a,(OFST+5,sp)
2500  035c 88            	push	a
2501  035d 9f            	ld	a,xl
2502  035e 97            	ld	xl,a
2503  035f 7b02          	ld	a,(OFST+2,sp)
2504  0361 95            	ld	xh,a
2505  0362 ad07          	call	_TIM1_ETRConfig
2507  0364 84            	pop	a
2508                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2510  0365 721c5253      	bset	21075,#6
2511                     ; 707 }
2514  0369 85            	popw	x
2515  036a 81            	ret
2569                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2569                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2569                     ; 727                     uint8_t ExtTRGFilter)
2569                     ; 728 {
2570                     	switch	.text
2571  036b               _TIM1_ETRConfig:
2573  036b 89            	pushw	x
2574       00000000      OFST:	set	0
2577                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2579                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2579                     ; 733                          (uint8_t)ExtTRGFilter );
2581  036c 9f            	ld	a,xl
2582  036d 1a01          	or	a,(OFST+1,sp)
2583  036f 1a05          	or	a,(OFST+5,sp)
2584  0371 ca5253        	or	a,21075
2585  0374 c75253        	ld	21075,a
2586                     ; 734 }
2589  0377 85            	popw	x
2590  0378 81            	ret
2677                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2677                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2677                     ; 753                                  uint8_t ICFilter)
2677                     ; 754 {
2678                     	switch	.text
2679  0379               _TIM1_TIxExternalClockConfig:
2681  0379 89            	pushw	x
2682       00000000      OFST:	set	0
2685                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2687                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2689                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2691                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2693  037a 9e            	ld	a,xh
2694  037b a160          	cp	a,#96
2695  037d 260e          	jrne	L1521
2696                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2698  037f 7b05          	ld	a,(OFST+5,sp)
2699  0381 88            	push	a
2700  0382 9f            	ld	a,xl
2701  0383 ae0001        	ldw	x,#1
2702  0386 95            	ld	xh,a
2703  0387 cd083e        	call	L5_TI2_Config
2705  038a 84            	pop	a
2707  038b 200d          	jra	L3521
2708  038d               L1521:
2709                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2711  038d 7b05          	ld	a,(OFST+5,sp)
2712  038f 88            	push	a
2713  0390 7b03          	ld	a,(OFST+3,sp)
2714  0392 ae0001        	ldw	x,#1
2715  0395 95            	ld	xh,a
2716  0396 cd080e        	call	L3_TI1_Config
2718  0399 84            	pop	a
2719  039a               L3521:
2720                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2722  039a 7b01          	ld	a,(OFST+1,sp)
2723  039c ad0a          	call	_TIM1_SelectInputTrigger
2725                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2727  039e c65252        	ld	a,21074
2728  03a1 aa07          	or	a,#7
2729  03a3 c75252        	ld	21074,a
2730                     ; 775 }
2733  03a6 85            	popw	x
2734  03a7 81            	ret
2819                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2819                     ; 788 {
2820                     	switch	.text
2821  03a8               _TIM1_SelectInputTrigger:
2823  03a8 88            	push	a
2824       00000000      OFST:	set	0
2827                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2829                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2831  03a9 c65252        	ld	a,21074
2832  03ac a48f          	and	a,#143
2833  03ae 1a01          	or	a,(OFST+1,sp)
2834  03b0 c75252        	ld	21074,a
2835                     ; 794 }
2838  03b3 84            	pop	a
2839  03b4 81            	ret
2875                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2875                     ; 804 {
2876                     	switch	.text
2877  03b5               _TIM1_UpdateDisableConfig:
2881                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2883                     ; 809   if (NewState != DISABLE)
2885  03b5 4d            	tnz	a
2886  03b6 2706          	jreq	L1331
2887                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2889  03b8 72125250      	bset	21072,#1
2891  03bc 2004          	jra	L3331
2892  03be               L1331:
2893                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2895  03be 72135250      	bres	21072,#1
2896  03c2               L3331:
2897                     ; 817 }
2900  03c2 81            	ret
2958                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2958                     ; 828 {
2959                     	switch	.text
2960  03c3               _TIM1_UpdateRequestConfig:
2964                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2966                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2968  03c3 4d            	tnz	a
2969  03c4 2706          	jreq	L3631
2970                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2972  03c6 72145250      	bset	21072,#2
2974  03ca 2004          	jra	L5631
2975  03cc               L3631:
2976                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2978  03cc 72155250      	bres	21072,#2
2979  03d0               L5631:
2980                     ; 841 }
2983  03d0 81            	ret
3019                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3019                     ; 850 {
3020                     	switch	.text
3021  03d1               _TIM1_SelectHallSensor:
3025                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3027                     ; 855   if (NewState != DISABLE)
3029  03d1 4d            	tnz	a
3030  03d2 2706          	jreq	L5041
3031                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3033  03d4 721e5251      	bset	21073,#7
3035  03d8 2004          	jra	L7041
3036  03da               L5041:
3037                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3039  03da 721f5251      	bres	21073,#7
3040  03de               L7041:
3041                     ; 863 }
3044  03de 81            	ret
3101                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3101                     ; 874 {
3102                     	switch	.text
3103  03df               _TIM1_SelectOnePulseMode:
3107                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3109                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3111  03df 4d            	tnz	a
3112  03e0 2706          	jreq	L7341
3113                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3115  03e2 72165250      	bset	21072,#3
3117  03e6 2004          	jra	L1441
3118  03e8               L7341:
3119                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3121  03e8 72175250      	bres	21072,#3
3122  03ec               L1441:
3123                     ; 888 }
3126  03ec 81            	ret
3224                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3224                     ; 904 {
3225                     	switch	.text
3226  03ed               _TIM1_SelectOutputTrigger:
3228  03ed 88            	push	a
3229       00000000      OFST:	set	0
3232                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3234                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3234                     ; 910                         (uint8_t) TIM1_TRGOSource);
3236  03ee c65251        	ld	a,21073
3237  03f1 a48f          	and	a,#143
3238  03f3 1a01          	or	a,(OFST+1,sp)
3239  03f5 c75251        	ld	21073,a
3240                     ; 911 }
3243  03f8 84            	pop	a
3244  03f9 81            	ret
3318                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3318                     ; 924 {
3319                     	switch	.text
3320  03fa               _TIM1_SelectSlaveMode:
3322  03fa 88            	push	a
3323       00000000      OFST:	set	0
3326                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3328                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3328                     ; 930                          (uint8_t)TIM1_SlaveMode);
3330  03fb c65252        	ld	a,21074
3331  03fe a4f8          	and	a,#248
3332  0400 1a01          	or	a,(OFST+1,sp)
3333  0402 c75252        	ld	21074,a
3334                     ; 931 }
3337  0405 84            	pop	a
3338  0406 81            	ret
3374                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3374                     ; 940 {
3375                     	switch	.text
3376  0407               _TIM1_SelectMasterSlaveMode:
3380                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3382                     ; 945   if (NewState != DISABLE)
3384  0407 4d            	tnz	a
3385  0408 2706          	jreq	L3551
3386                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3388  040a 721e5252      	bset	21074,#7
3390  040e 2004          	jra	L5551
3391  0410               L3551:
3392                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3394  0410 721f5252      	bres	21074,#7
3395  0414               L5551:
3396                     ; 953 }
3399  0414 81            	ret
3485                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3485                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3485                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3485                     ; 978 {
3486                     	switch	.text
3487  0415               _TIM1_EncoderInterfaceConfig:
3489  0415 89            	pushw	x
3490       00000000      OFST:	set	0
3493                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3495                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3497                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3499                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3501  0416 9f            	ld	a,xl
3502  0417 4d            	tnz	a
3503  0418 2706          	jreq	L7161
3504                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3506  041a 7212525c      	bset	21084,#1
3508  041e 2004          	jra	L1261
3509  0420               L7161:
3510                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3512  0420 7213525c      	bres	21084,#1
3513  0424               L1261:
3514                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3516  0424 0d05          	tnz	(OFST+5,sp)
3517  0426 2706          	jreq	L3261
3518                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3520  0428 721a525c      	bset	21084,#5
3522  042c 2004          	jra	L5261
3523  042e               L3261:
3524                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3526  042e 721b525c      	bres	21084,#5
3527  0432               L5261:
3528                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3528                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3530  0432 c65252        	ld	a,21074
3531  0435 a4f0          	and	a,#240
3532  0437 1a01          	or	a,(OFST+1,sp)
3533  0439 c75252        	ld	21074,a
3534                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3534                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3536  043c c65258        	ld	a,21080
3537  043f a4fc          	and	a,#252
3538  0441 aa01          	or	a,#1
3539  0443 c75258        	ld	21080,a
3540                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3540                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3542  0446 c65259        	ld	a,21081
3543  0449 a4fc          	and	a,#252
3544  044b aa01          	or	a,#1
3545  044d c75259        	ld	21081,a
3546                     ; 1011 }
3549  0450 85            	popw	x
3550  0451 81            	ret
3615                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3615                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3615                     ; 1025 {
3616                     	switch	.text
3617  0452               _TIM1_PrescalerConfig:
3619  0452 89            	pushw	x
3620       00000000      OFST:	set	0
3623                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3625                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3627  0453 9e            	ld	a,xh
3628  0454 c75260        	ld	21088,a
3629                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3631  0457 9f            	ld	a,xl
3632  0458 c75261        	ld	21089,a
3633                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3635  045b 7b05          	ld	a,(OFST+5,sp)
3636  045d c75257        	ld	21079,a
3637                     ; 1035 }
3640  0460 85            	popw	x
3641  0461 81            	ret
3677                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3677                     ; 1049 {
3678                     	switch	.text
3679  0462               _TIM1_CounterModeConfig:
3681  0462 88            	push	a
3682       00000000      OFST:	set	0
3685                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3687                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3687                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3689  0463 c65250        	ld	a,21072
3690  0466 a48f          	and	a,#143
3691  0468 1a01          	or	a,(OFST+1,sp)
3692  046a c75250        	ld	21072,a
3693                     ; 1057 }
3696  046d 84            	pop	a
3697  046e 81            	ret
3755                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3755                     ; 1068 {
3756                     	switch	.text
3757  046f               _TIM1_ForcedOC1Config:
3759  046f 88            	push	a
3760       00000000      OFST:	set	0
3763                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3765                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3765                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3767  0470 c65258        	ld	a,21080
3768  0473 a48f          	and	a,#143
3769  0475 1a01          	or	a,(OFST+1,sp)
3770  0477 c75258        	ld	21080,a
3771                     ; 1075 }
3774  047a 84            	pop	a
3775  047b 81            	ret
3811                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3811                     ; 1086 {
3812                     	switch	.text
3813  047c               _TIM1_ForcedOC2Config:
3815  047c 88            	push	a
3816       00000000      OFST:	set	0
3819                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3821                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3821                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3823  047d c65259        	ld	a,21081
3824  0480 a48f          	and	a,#143
3825  0482 1a01          	or	a,(OFST+1,sp)
3826  0484 c75259        	ld	21081,a
3827                     ; 1093 }
3830  0487 84            	pop	a
3831  0488 81            	ret
3867                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3867                     ; 1105 {
3868                     	switch	.text
3869  0489               _TIM1_ForcedOC3Config:
3871  0489 88            	push	a
3872       00000000      OFST:	set	0
3875                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3877                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3877                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3879  048a c6525a        	ld	a,21082
3880  048d a48f          	and	a,#143
3881  048f 1a01          	or	a,(OFST+1,sp)
3882  0491 c7525a        	ld	21082,a
3883                     ; 1112 }
3886  0494 84            	pop	a
3887  0495 81            	ret
3923                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3923                     ; 1124 {
3924                     	switch	.text
3925  0496               _TIM1_ForcedOC4Config:
3927  0496 88            	push	a
3928       00000000      OFST:	set	0
3931                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3933                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3933                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3935  0497 c6525b        	ld	a,21083
3936  049a a48f          	and	a,#143
3937  049c 1a01          	or	a,(OFST+1,sp)
3938  049e c7525b        	ld	21083,a
3939                     ; 1131 }
3942  04a1 84            	pop	a
3943  04a2 81            	ret
3979                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3979                     ; 1140 {
3980                     	switch	.text
3981  04a3               _TIM1_ARRPreloadConfig:
3985                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3987                     ; 1145   if (NewState != DISABLE)
3989  04a3 4d            	tnz	a
3990  04a4 2706          	jreq	L3102
3991                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3993  04a6 721e5250      	bset	21072,#7
3995  04aa 2004          	jra	L5102
3996  04ac               L3102:
3997                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3999  04ac 721f5250      	bres	21072,#7
4000  04b0               L5102:
4001                     ; 1153 }
4004  04b0 81            	ret
4039                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4039                     ; 1162 {
4040                     	switch	.text
4041  04b1               _TIM1_SelectCOM:
4045                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4047                     ; 1167   if (NewState != DISABLE)
4049  04b1 4d            	tnz	a
4050  04b2 2706          	jreq	L5302
4051                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4053  04b4 72145251      	bset	21073,#2
4055  04b8 2004          	jra	L7302
4056  04ba               L5302:
4057                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4059  04ba 72155251      	bres	21073,#2
4060  04be               L7302:
4061                     ; 1175 }
4064  04be 81            	ret
4100                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4100                     ; 1184 {
4101                     	switch	.text
4102  04bf               _TIM1_CCPreloadControl:
4106                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4108                     ; 1189   if (NewState != DISABLE)
4110  04bf 4d            	tnz	a
4111  04c0 2706          	jreq	L7502
4112                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4114  04c2 72105251      	bset	21073,#0
4116  04c6 2004          	jra	L1602
4117  04c8               L7502:
4118                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4120  04c8 72115251      	bres	21073,#0
4121  04cc               L1602:
4122                     ; 1197 }
4125  04cc 81            	ret
4161                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4161                     ; 1206 {
4162                     	switch	.text
4163  04cd               _TIM1_OC1PreloadConfig:
4167                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4169                     ; 1211   if (NewState != DISABLE)
4171  04cd 4d            	tnz	a
4172  04ce 2706          	jreq	L1012
4173                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4175  04d0 72165258      	bset	21080,#3
4177  04d4 2004          	jra	L3012
4178  04d6               L1012:
4179                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4181  04d6 72175258      	bres	21080,#3
4182  04da               L3012:
4183                     ; 1219 }
4186  04da 81            	ret
4222                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4222                     ; 1228 {
4223                     	switch	.text
4224  04db               _TIM1_OC2PreloadConfig:
4228                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4230                     ; 1233   if (NewState != DISABLE)
4232  04db 4d            	tnz	a
4233  04dc 2706          	jreq	L3212
4234                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4236  04de 72165259      	bset	21081,#3
4238  04e2 2004          	jra	L5212
4239  04e4               L3212:
4240                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4242  04e4 72175259      	bres	21081,#3
4243  04e8               L5212:
4244                     ; 1241 }
4247  04e8 81            	ret
4283                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4283                     ; 1250 {
4284                     	switch	.text
4285  04e9               _TIM1_OC3PreloadConfig:
4289                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4291                     ; 1255   if (NewState != DISABLE)
4293  04e9 4d            	tnz	a
4294  04ea 2706          	jreq	L5412
4295                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4297  04ec 7216525a      	bset	21082,#3
4299  04f0 2004          	jra	L7412
4300  04f2               L5412:
4301                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4303  04f2 7217525a      	bres	21082,#3
4304  04f6               L7412:
4305                     ; 1263 }
4308  04f6 81            	ret
4344                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4344                     ; 1272 {
4345                     	switch	.text
4346  04f7               _TIM1_OC4PreloadConfig:
4350                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4352                     ; 1277   if (NewState != DISABLE)
4354  04f7 4d            	tnz	a
4355  04f8 2706          	jreq	L7612
4356                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4358  04fa 7216525b      	bset	21083,#3
4360  04fe 2004          	jra	L1712
4361  0500               L7612:
4362                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4364  0500 7217525b      	bres	21083,#3
4365  0504               L1712:
4366                     ; 1285 }
4369  0504 81            	ret
4404                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4404                     ; 1294 {
4405                     	switch	.text
4406  0505               _TIM1_OC1FastConfig:
4410                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4412                     ; 1299   if (NewState != DISABLE)
4414  0505 4d            	tnz	a
4415  0506 2706          	jreq	L1122
4416                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4418  0508 72145258      	bset	21080,#2
4420  050c 2004          	jra	L3122
4421  050e               L1122:
4422                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4424  050e 72155258      	bres	21080,#2
4425  0512               L3122:
4426                     ; 1307 }
4429  0512 81            	ret
4464                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4464                     ; 1316 {
4465                     	switch	.text
4466  0513               _TIM1_OC2FastConfig:
4470                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4472                     ; 1321   if (NewState != DISABLE)
4474  0513 4d            	tnz	a
4475  0514 2706          	jreq	L3322
4476                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4478  0516 72145259      	bset	21081,#2
4480  051a 2004          	jra	L5322
4481  051c               L3322:
4482                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4484  051c 72155259      	bres	21081,#2
4485  0520               L5322:
4486                     ; 1329 }
4489  0520 81            	ret
4524                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4524                     ; 1338 {
4525                     	switch	.text
4526  0521               _TIM1_OC3FastConfig:
4530                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4532                     ; 1343   if (NewState != DISABLE)
4534  0521 4d            	tnz	a
4535  0522 2706          	jreq	L5522
4536                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4538  0524 7214525a      	bset	21082,#2
4540  0528 2004          	jra	L7522
4541  052a               L5522:
4542                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4544  052a 7215525a      	bres	21082,#2
4545  052e               L7522:
4546                     ; 1351 }
4549  052e 81            	ret
4584                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4584                     ; 1360 {
4585                     	switch	.text
4586  052f               _TIM1_OC4FastConfig:
4590                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4592                     ; 1365   if (NewState != DISABLE)
4594  052f 4d            	tnz	a
4595  0530 2706          	jreq	L7722
4596                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4598  0532 7214525b      	bset	21083,#2
4600  0536 2004          	jra	L1032
4601  0538               L7722:
4602                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4604  0538 7215525b      	bres	21083,#2
4605  053c               L1032:
4606                     ; 1373 }
4609  053c 81            	ret
4714                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4714                     ; 1390 {
4715                     	switch	.text
4716  053d               _TIM1_GenerateEvent:
4720                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4722                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4724  053d c75257        	ld	21079,a
4725                     ; 1396 }
4728  0540 81            	ret
4764                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4764                     ; 1407 {
4765                     	switch	.text
4766  0541               _TIM1_OC1PolarityConfig:
4770                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4772                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4774  0541 4d            	tnz	a
4775  0542 2706          	jreq	L3632
4776                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4778  0544 7212525c      	bset	21084,#1
4780  0548 2004          	jra	L5632
4781  054a               L3632:
4782                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4784  054a 7213525c      	bres	21084,#1
4785  054e               L5632:
4786                     ; 1420 }
4789  054e 81            	ret
4825                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4825                     ; 1431 {
4826                     	switch	.text
4827  054f               _TIM1_OC1NPolarityConfig:
4831                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4833                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4835  054f 4d            	tnz	a
4836  0550 2706          	jreq	L5042
4837                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4839  0552 7216525c      	bset	21084,#3
4841  0556 2004          	jra	L7042
4842  0558               L5042:
4843                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4845  0558 7217525c      	bres	21084,#3
4846  055c               L7042:
4847                     ; 1444 }
4850  055c 81            	ret
4886                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4886                     ; 1455 {
4887                     	switch	.text
4888  055d               _TIM1_OC2PolarityConfig:
4892                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4894                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4896  055d 4d            	tnz	a
4897  055e 2706          	jreq	L7242
4898                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4900  0560 721a525c      	bset	21084,#5
4902  0564 2004          	jra	L1342
4903  0566               L7242:
4904                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4906  0566 721b525c      	bres	21084,#5
4907  056a               L1342:
4908                     ; 1468 }
4911  056a 81            	ret
4947                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4947                     ; 1479 {
4948                     	switch	.text
4949  056b               _TIM1_OC2NPolarityConfig:
4953                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4955                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4957  056b 4d            	tnz	a
4958  056c 2706          	jreq	L1542
4959                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4961  056e 721e525c      	bset	21084,#7
4963  0572 2004          	jra	L3542
4964  0574               L1542:
4965                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4967  0574 721f525c      	bres	21084,#7
4968  0578               L3542:
4969                     ; 1492 }
4972  0578 81            	ret
5008                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5008                     ; 1503 {
5009                     	switch	.text
5010  0579               _TIM1_OC3PolarityConfig:
5014                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5016                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5018  0579 4d            	tnz	a
5019  057a 2706          	jreq	L3742
5020                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5022  057c 7212525d      	bset	21085,#1
5024  0580 2004          	jra	L5742
5025  0582               L3742:
5026                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5028  0582 7213525d      	bres	21085,#1
5029  0586               L5742:
5030                     ; 1516 }
5033  0586 81            	ret
5069                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5069                     ; 1528 {
5070                     	switch	.text
5071  0587               _TIM1_OC3NPolarityConfig:
5075                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5077                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5079  0587 4d            	tnz	a
5080  0588 2706          	jreq	L5152
5081                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5083  058a 7216525d      	bset	21085,#3
5085  058e 2004          	jra	L7152
5086  0590               L5152:
5087                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5089  0590 7217525d      	bres	21085,#3
5090  0594               L7152:
5091                     ; 1541 }
5094  0594 81            	ret
5130                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5130                     ; 1552 {
5131                     	switch	.text
5132  0595               _TIM1_OC4PolarityConfig:
5136                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5138                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5140  0595 4d            	tnz	a
5141  0596 2706          	jreq	L7352
5142                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5144  0598 721a525d      	bset	21085,#5
5146  059c 2004          	jra	L1452
5147  059e               L7352:
5148                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5150  059e 721b525d      	bres	21085,#5
5151  05a2               L1452:
5152                     ; 1565 }
5155  05a2 81            	ret
5200                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5200                     ; 1580 {
5201                     	switch	.text
5202  05a3               _TIM1_CCxCmd:
5204  05a3 89            	pushw	x
5205       00000000      OFST:	set	0
5208                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5210                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5212                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5214  05a4 9e            	ld	a,xh
5215  05a5 4d            	tnz	a
5216  05a6 2610          	jrne	L5652
5217                     ; 1588     if (NewState != DISABLE)
5219  05a8 9f            	ld	a,xl
5220  05a9 4d            	tnz	a
5221  05aa 2706          	jreq	L7652
5222                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5224  05ac 7210525c      	bset	21084,#0
5226  05b0 2040          	jra	L3752
5227  05b2               L7652:
5228                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5230  05b2 7211525c      	bres	21084,#0
5231  05b6 203a          	jra	L3752
5232  05b8               L5652:
5233                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5235  05b8 7b01          	ld	a,(OFST+1,sp)
5236  05ba a101          	cp	a,#1
5237  05bc 2610          	jrne	L5752
5238                     ; 1601     if (NewState != DISABLE)
5240  05be 0d02          	tnz	(OFST+2,sp)
5241  05c0 2706          	jreq	L7752
5242                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5244  05c2 7218525c      	bset	21084,#4
5246  05c6 202a          	jra	L3752
5247  05c8               L7752:
5248                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5250  05c8 7219525c      	bres	21084,#4
5251  05cc 2024          	jra	L3752
5252  05ce               L5752:
5253                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5255  05ce 7b01          	ld	a,(OFST+1,sp)
5256  05d0 a102          	cp	a,#2
5257  05d2 2610          	jrne	L5062
5258                     ; 1613     if (NewState != DISABLE)
5260  05d4 0d02          	tnz	(OFST+2,sp)
5261  05d6 2706          	jreq	L7062
5262                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5264  05d8 7210525d      	bset	21085,#0
5266  05dc 2014          	jra	L3752
5267  05de               L7062:
5268                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5270  05de 7211525d      	bres	21085,#0
5271  05e2 200e          	jra	L3752
5272  05e4               L5062:
5273                     ; 1625     if (NewState != DISABLE)
5275  05e4 0d02          	tnz	(OFST+2,sp)
5276  05e6 2706          	jreq	L5162
5277                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5279  05e8 7218525d      	bset	21085,#4
5281  05ec 2004          	jra	L3752
5282  05ee               L5162:
5283                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5285  05ee 7219525d      	bres	21085,#4
5286  05f2               L3752:
5287                     ; 1634 }
5290  05f2 85            	popw	x
5291  05f3 81            	ret
5336                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5336                     ; 1648 {
5337                     	switch	.text
5338  05f4               _TIM1_CCxNCmd:
5340  05f4 89            	pushw	x
5341       00000000      OFST:	set	0
5344                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5346                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5348                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5350  05f5 9e            	ld	a,xh
5351  05f6 4d            	tnz	a
5352  05f7 2610          	jrne	L3462
5353                     ; 1656     if (NewState != DISABLE)
5355  05f9 9f            	ld	a,xl
5356  05fa 4d            	tnz	a
5357  05fb 2706          	jreq	L5462
5358                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5360  05fd 7214525c      	bset	21084,#2
5362  0601 202a          	jra	L1562
5363  0603               L5462:
5364                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5366  0603 7215525c      	bres	21084,#2
5367  0607 2024          	jra	L1562
5368  0609               L3462:
5369                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5371  0609 7b01          	ld	a,(OFST+1,sp)
5372  060b a101          	cp	a,#1
5373  060d 2610          	jrne	L3562
5374                     ; 1668     if (NewState != DISABLE)
5376  060f 0d02          	tnz	(OFST+2,sp)
5377  0611 2706          	jreq	L5562
5378                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5380  0613 721c525c      	bset	21084,#6
5382  0617 2014          	jra	L1562
5383  0619               L5562:
5384                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5386  0619 721d525c      	bres	21084,#6
5387  061d 200e          	jra	L1562
5388  061f               L3562:
5389                     ; 1680     if (NewState != DISABLE)
5391  061f 0d02          	tnz	(OFST+2,sp)
5392  0621 2706          	jreq	L3662
5393                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5395  0623 7214525d      	bset	21085,#2
5397  0627 2004          	jra	L1562
5398  0629               L3662:
5399                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5401  0629 7215525d      	bres	21085,#2
5402  062d               L1562:
5403                     ; 1689 }
5406  062d 85            	popw	x
5407  062e 81            	ret
5452                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5452                     ; 1713 {
5453                     	switch	.text
5454  062f               _TIM1_SelectOCxM:
5456  062f 89            	pushw	x
5457       00000000      OFST:	set	0
5460                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5462                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5464                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5466  0630 9e            	ld	a,xh
5467  0631 4d            	tnz	a
5468  0632 2610          	jrne	L1172
5469                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5471  0634 7211525c      	bres	21084,#0
5472                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5472                     ; 1725                             | (uint8_t)TIM1_OCMode);
5474  0638 c65258        	ld	a,21080
5475  063b a48f          	and	a,#143
5476  063d 1a02          	or	a,(OFST+2,sp)
5477  063f c75258        	ld	21080,a
5479  0642 203a          	jra	L3172
5480  0644               L1172:
5481                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5483  0644 7b01          	ld	a,(OFST+1,sp)
5484  0646 a101          	cp	a,#1
5485  0648 2610          	jrne	L5172
5486                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5488  064a 7219525c      	bres	21084,#4
5489                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5489                     ; 1734                             | (uint8_t)TIM1_OCMode);
5491  064e c65259        	ld	a,21081
5492  0651 a48f          	and	a,#143
5493  0653 1a02          	or	a,(OFST+2,sp)
5494  0655 c75259        	ld	21081,a
5496  0658 2024          	jra	L3172
5497  065a               L5172:
5498                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5500  065a 7b01          	ld	a,(OFST+1,sp)
5501  065c a102          	cp	a,#2
5502  065e 2610          	jrne	L1272
5503                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5505  0660 7211525d      	bres	21085,#0
5506                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5506                     ; 1743                             | (uint8_t)TIM1_OCMode);
5508  0664 c6525a        	ld	a,21082
5509  0667 a48f          	and	a,#143
5510  0669 1a02          	or	a,(OFST+2,sp)
5511  066b c7525a        	ld	21082,a
5513  066e 200e          	jra	L3172
5514  0670               L1272:
5515                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5517  0670 7219525d      	bres	21085,#4
5518                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5518                     ; 1752                             | (uint8_t)TIM1_OCMode);
5520  0674 c6525b        	ld	a,21083
5521  0677 a48f          	and	a,#143
5522  0679 1a02          	or	a,(OFST+2,sp)
5523  067b c7525b        	ld	21083,a
5524  067e               L3172:
5525                     ; 1754 }
5528  067e 85            	popw	x
5529  067f 81            	ret
5561                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5561                     ; 1763 {
5562                     	switch	.text
5563  0680               _TIM1_SetCounter:
5567                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5569  0680 9e            	ld	a,xh
5570  0681 c7525e        	ld	21086,a
5571                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5573  0684 9f            	ld	a,xl
5574  0685 c7525f        	ld	21087,a
5575                     ; 1767 }
5578  0688 81            	ret
5610                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5610                     ; 1776 {
5611                     	switch	.text
5612  0689               _TIM1_SetAutoreload:
5616                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5618  0689 9e            	ld	a,xh
5619  068a c75262        	ld	21090,a
5620                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5622  068d 9f            	ld	a,xl
5623  068e c75263        	ld	21091,a
5624                     ; 1780  }
5627  0691 81            	ret
5659                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5659                     ; 1789 {
5660                     	switch	.text
5661  0692               _TIM1_SetCompare1:
5665                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5667  0692 9e            	ld	a,xh
5668  0693 c75265        	ld	21093,a
5669                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5671  0696 9f            	ld	a,xl
5672  0697 c75266        	ld	21094,a
5673                     ; 1793 }
5676  069a 81            	ret
5708                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5708                     ; 1802 {
5709                     	switch	.text
5710  069b               _TIM1_SetCompare2:
5714                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5716  069b 9e            	ld	a,xh
5717  069c c75267        	ld	21095,a
5718                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5720  069f 9f            	ld	a,xl
5721  06a0 c75268        	ld	21096,a
5722                     ; 1806 }
5725  06a3 81            	ret
5757                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5757                     ; 1815 {
5758                     	switch	.text
5759  06a4               _TIM1_SetCompare3:
5763                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5765  06a4 9e            	ld	a,xh
5766  06a5 c75269        	ld	21097,a
5767                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5769  06a8 9f            	ld	a,xl
5770  06a9 c7526a        	ld	21098,a
5771                     ; 1819 }
5774  06ac 81            	ret
5806                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5806                     ; 1828 {
5807                     	switch	.text
5808  06ad               _TIM1_SetCompare4:
5812                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5814  06ad 9e            	ld	a,xh
5815  06ae c7526b        	ld	21099,a
5816                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5818  06b1 9f            	ld	a,xl
5819  06b2 c7526c        	ld	21100,a
5820                     ; 1832 }
5823  06b5 81            	ret
5859                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5859                     ; 1845 {
5860                     	switch	.text
5861  06b6               _TIM1_SetIC1Prescaler:
5863  06b6 88            	push	a
5864       00000000      OFST:	set	0
5867                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5869                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5869                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5871  06b7 c65258        	ld	a,21080
5872  06ba a4f3          	and	a,#243
5873  06bc 1a01          	or	a,(OFST+1,sp)
5874  06be c75258        	ld	21080,a
5875                     ; 1852 }
5878  06c1 84            	pop	a
5879  06c2 81            	ret
5915                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5915                     ; 1865 {
5916                     	switch	.text
5917  06c3               _TIM1_SetIC2Prescaler:
5919  06c3 88            	push	a
5920       00000000      OFST:	set	0
5923                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5925                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5925                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5927  06c4 c65259        	ld	a,21081
5928  06c7 a4f3          	and	a,#243
5929  06c9 1a01          	or	a,(OFST+1,sp)
5930  06cb c75259        	ld	21081,a
5931                     ; 1873 }
5934  06ce 84            	pop	a
5935  06cf 81            	ret
5971                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5971                     ; 1886 {
5972                     	switch	.text
5973  06d0               _TIM1_SetIC3Prescaler:
5975  06d0 88            	push	a
5976       00000000      OFST:	set	0
5979                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5981                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5981                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5983  06d1 c6525a        	ld	a,21082
5984  06d4 a4f3          	and	a,#243
5985  06d6 1a01          	or	a,(OFST+1,sp)
5986  06d8 c7525a        	ld	21082,a
5987                     ; 1894 }
5990  06db 84            	pop	a
5991  06dc 81            	ret
6027                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6027                     ; 1907 {
6028                     	switch	.text
6029  06dd               _TIM1_SetIC4Prescaler:
6031  06dd 88            	push	a
6032       00000000      OFST:	set	0
6035                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6037                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6037                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6039  06de c6525b        	ld	a,21083
6040  06e1 a4f3          	and	a,#243
6041  06e3 1a01          	or	a,(OFST+1,sp)
6042  06e5 c7525b        	ld	21083,a
6043                     ; 1915 }
6046  06e8 84            	pop	a
6047  06e9 81            	ret
6093                     ; 1922 uint16_t TIM1_GetCapture1(void)
6093                     ; 1923 {
6094                     	switch	.text
6095  06ea               _TIM1_GetCapture1:
6097  06ea 5204          	subw	sp,#4
6098       00000004      OFST:	set	4
6101                     ; 1926   uint16_t tmpccr1 = 0;
6103                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6107                     ; 1929   tmpccr1h = TIM1->CCR1H;
6109  06ec c65265        	ld	a,21093
6110  06ef 6b02          	ld	(OFST-2,sp),a
6112                     ; 1930   tmpccr1l = TIM1->CCR1L;
6114  06f1 c65266        	ld	a,21094
6115  06f4 6b01          	ld	(OFST-3,sp),a
6117                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6119  06f6 7b01          	ld	a,(OFST-3,sp)
6120  06f8 5f            	clrw	x
6121  06f9 97            	ld	xl,a
6122  06fa 1f03          	ldw	(OFST-1,sp),x
6124                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6126  06fc 7b02          	ld	a,(OFST-2,sp)
6127  06fe 5f            	clrw	x
6128  06ff 97            	ld	xl,a
6129  0700 4f            	clr	a
6130  0701 02            	rlwa	x,a
6131  0702 01            	rrwa	x,a
6132  0703 1a04          	or	a,(OFST+0,sp)
6133  0705 01            	rrwa	x,a
6134  0706 1a03          	or	a,(OFST-1,sp)
6135  0708 01            	rrwa	x,a
6136  0709 1f03          	ldw	(OFST-1,sp),x
6138                     ; 1935   return (uint16_t)tmpccr1;
6140  070b 1e03          	ldw	x,(OFST-1,sp)
6143  070d 5b04          	addw	sp,#4
6144  070f 81            	ret
6190                     ; 1943 uint16_t TIM1_GetCapture2(void)
6190                     ; 1944 {
6191                     	switch	.text
6192  0710               _TIM1_GetCapture2:
6194  0710 5204          	subw	sp,#4
6195       00000004      OFST:	set	4
6198                     ; 1947   uint16_t tmpccr2 = 0;
6200                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6204                     ; 1950   tmpccr2h = TIM1->CCR2H;
6206  0712 c65267        	ld	a,21095
6207  0715 6b02          	ld	(OFST-2,sp),a
6209                     ; 1951   tmpccr2l = TIM1->CCR2L;
6211  0717 c65268        	ld	a,21096
6212  071a 6b01          	ld	(OFST-3,sp),a
6214                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6216  071c 7b01          	ld	a,(OFST-3,sp)
6217  071e 5f            	clrw	x
6218  071f 97            	ld	xl,a
6219  0720 1f03          	ldw	(OFST-1,sp),x
6221                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6223  0722 7b02          	ld	a,(OFST-2,sp)
6224  0724 5f            	clrw	x
6225  0725 97            	ld	xl,a
6226  0726 4f            	clr	a
6227  0727 02            	rlwa	x,a
6228  0728 01            	rrwa	x,a
6229  0729 1a04          	or	a,(OFST+0,sp)
6230  072b 01            	rrwa	x,a
6231  072c 1a03          	or	a,(OFST-1,sp)
6232  072e 01            	rrwa	x,a
6233  072f 1f03          	ldw	(OFST-1,sp),x
6235                     ; 1956   return (uint16_t)tmpccr2;
6237  0731 1e03          	ldw	x,(OFST-1,sp)
6240  0733 5b04          	addw	sp,#4
6241  0735 81            	ret
6287                     ; 1964 uint16_t TIM1_GetCapture3(void)
6287                     ; 1965 {
6288                     	switch	.text
6289  0736               _TIM1_GetCapture3:
6291  0736 5204          	subw	sp,#4
6292       00000004      OFST:	set	4
6295                     ; 1967   uint16_t tmpccr3 = 0;
6297                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6301                     ; 1970   tmpccr3h = TIM1->CCR3H;
6303  0738 c65269        	ld	a,21097
6304  073b 6b02          	ld	(OFST-2,sp),a
6306                     ; 1971   tmpccr3l = TIM1->CCR3L;
6308  073d c6526a        	ld	a,21098
6309  0740 6b01          	ld	(OFST-3,sp),a
6311                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6313  0742 7b01          	ld	a,(OFST-3,sp)
6314  0744 5f            	clrw	x
6315  0745 97            	ld	xl,a
6316  0746 1f03          	ldw	(OFST-1,sp),x
6318                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6320  0748 7b02          	ld	a,(OFST-2,sp)
6321  074a 5f            	clrw	x
6322  074b 97            	ld	xl,a
6323  074c 4f            	clr	a
6324  074d 02            	rlwa	x,a
6325  074e 01            	rrwa	x,a
6326  074f 1a04          	or	a,(OFST+0,sp)
6327  0751 01            	rrwa	x,a
6328  0752 1a03          	or	a,(OFST-1,sp)
6329  0754 01            	rrwa	x,a
6330  0755 1f03          	ldw	(OFST-1,sp),x
6332                     ; 1976   return (uint16_t)tmpccr3;
6334  0757 1e03          	ldw	x,(OFST-1,sp)
6337  0759 5b04          	addw	sp,#4
6338  075b 81            	ret
6384                     ; 1984 uint16_t TIM1_GetCapture4(void)
6384                     ; 1985 {
6385                     	switch	.text
6386  075c               _TIM1_GetCapture4:
6388  075c 5204          	subw	sp,#4
6389       00000004      OFST:	set	4
6392                     ; 1987   uint16_t tmpccr4 = 0;
6394                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6398                     ; 1990   tmpccr4h = TIM1->CCR4H;
6400  075e c6526b        	ld	a,21099
6401  0761 6b02          	ld	(OFST-2,sp),a
6403                     ; 1991   tmpccr4l = TIM1->CCR4L;
6405  0763 c6526c        	ld	a,21100
6406  0766 6b01          	ld	(OFST-3,sp),a
6408                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6410  0768 7b01          	ld	a,(OFST-3,sp)
6411  076a 5f            	clrw	x
6412  076b 97            	ld	xl,a
6413  076c 1f03          	ldw	(OFST-1,sp),x
6415                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6417  076e 7b02          	ld	a,(OFST-2,sp)
6418  0770 5f            	clrw	x
6419  0771 97            	ld	xl,a
6420  0772 4f            	clr	a
6421  0773 02            	rlwa	x,a
6422  0774 01            	rrwa	x,a
6423  0775 1a04          	or	a,(OFST+0,sp)
6424  0777 01            	rrwa	x,a
6425  0778 1a03          	or	a,(OFST-1,sp)
6426  077a 01            	rrwa	x,a
6427  077b 1f03          	ldw	(OFST-1,sp),x
6429                     ; 1996   return (uint16_t)tmpccr4;
6431  077d 1e03          	ldw	x,(OFST-1,sp)
6434  077f 5b04          	addw	sp,#4
6435  0781 81            	ret
6467                     ; 2004 uint16_t TIM1_GetCounter(void)
6467                     ; 2005 {
6468                     	switch	.text
6469  0782               _TIM1_GetCounter:
6471  0782 89            	pushw	x
6472       00000002      OFST:	set	2
6475                     ; 2006   uint16_t tmpcntr = 0;
6477                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6479  0783 c6525e        	ld	a,21086
6480  0786 5f            	clrw	x
6481  0787 97            	ld	xl,a
6482  0788 4f            	clr	a
6483  0789 02            	rlwa	x,a
6484  078a 1f01          	ldw	(OFST-1,sp),x
6486                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6488  078c c6525f        	ld	a,21087
6489  078f 5f            	clrw	x
6490  0790 97            	ld	xl,a
6491  0791 01            	rrwa	x,a
6492  0792 1a02          	or	a,(OFST+0,sp)
6493  0794 01            	rrwa	x,a
6494  0795 1a01          	or	a,(OFST-1,sp)
6495  0797 01            	rrwa	x,a
6498  0798 5b02          	addw	sp,#2
6499  079a 81            	ret
6531                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6531                     ; 2020 {
6532                     	switch	.text
6533  079b               _TIM1_GetPrescaler:
6535  079b 89            	pushw	x
6536       00000002      OFST:	set	2
6539                     ; 2021   uint16_t temp = 0;
6541                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6543  079c c65260        	ld	a,21088
6544  079f 5f            	clrw	x
6545  07a0 97            	ld	xl,a
6546  07a1 4f            	clr	a
6547  07a2 02            	rlwa	x,a
6548  07a3 1f01          	ldw	(OFST-1,sp),x
6550                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6552  07a5 c65261        	ld	a,21089
6553  07a8 5f            	clrw	x
6554  07a9 97            	ld	xl,a
6555  07aa 01            	rrwa	x,a
6556  07ab 1a02          	or	a,(OFST+0,sp)
6557  07ad 01            	rrwa	x,a
6558  07ae 1a01          	or	a,(OFST-1,sp)
6559  07b0 01            	rrwa	x,a
6562  07b1 5b02          	addw	sp,#2
6563  07b3 81            	ret
6733                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6733                     ; 2048 {
6734                     	switch	.text
6735  07b4               _TIM1_GetFlagStatus:
6737  07b4 89            	pushw	x
6738  07b5 89            	pushw	x
6739       00000002      OFST:	set	2
6742                     ; 2049   FlagStatus bitstatus = RESET;
6744                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6748                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6750                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6752  07b6 9f            	ld	a,xl
6753  07b7 c45255        	and	a,21077
6754  07ba 6b01          	ld	(OFST-1,sp),a
6756                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6758  07bc 7b03          	ld	a,(OFST+1,sp)
6759  07be 6b02          	ld	(OFST+0,sp),a
6761                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6763  07c0 c65256        	ld	a,21078
6764  07c3 1402          	and	a,(OFST+0,sp)
6765  07c5 1a01          	or	a,(OFST-1,sp)
6766  07c7 2706          	jreq	L7433
6767                     ; 2060     bitstatus = SET;
6769  07c9 a601          	ld	a,#1
6770  07cb 6b02          	ld	(OFST+0,sp),a
6773  07cd 2002          	jra	L1533
6774  07cf               L7433:
6775                     ; 2064     bitstatus = RESET;
6777  07cf 0f02          	clr	(OFST+0,sp)
6779  07d1               L1533:
6780                     ; 2066   return (FlagStatus)(bitstatus);
6782  07d1 7b02          	ld	a,(OFST+0,sp)
6785  07d3 5b04          	addw	sp,#4
6786  07d5 81            	ret
6821                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6821                     ; 2088 {
6822                     	switch	.text
6823  07d6               _TIM1_ClearFlag:
6825  07d6 89            	pushw	x
6826       00000000      OFST:	set	0
6829                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6831                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6833  07d7 9f            	ld	a,xl
6834  07d8 43            	cpl	a
6835  07d9 c75255        	ld	21077,a
6836                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6836                     ; 2095                         (uint8_t)0x1E);
6838  07dc 7b01          	ld	a,(OFST+1,sp)
6839  07de 43            	cpl	a
6840  07df a41e          	and	a,#30
6841  07e1 c75256        	ld	21078,a
6842                     ; 2096 }
6845  07e4 85            	popw	x
6846  07e5 81            	ret
6906                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6906                     ; 2113 {
6907                     	switch	.text
6908  07e6               _TIM1_GetITStatus:
6910  07e6 88            	push	a
6911  07e7 89            	pushw	x
6912       00000002      OFST:	set	2
6915                     ; 2114   ITStatus bitstatus = RESET;
6917                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6921                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6923                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6925  07e8 c45255        	and	a,21077
6926  07eb 6b01          	ld	(OFST-1,sp),a
6928                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6930  07ed c65254        	ld	a,21076
6931  07f0 1403          	and	a,(OFST+1,sp)
6932  07f2 6b02          	ld	(OFST+0,sp),a
6934                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6936  07f4 0d01          	tnz	(OFST-1,sp)
6937  07f6 270a          	jreq	L7143
6939  07f8 0d02          	tnz	(OFST+0,sp)
6940  07fa 2706          	jreq	L7143
6941                     ; 2126     bitstatus = SET;
6943  07fc a601          	ld	a,#1
6944  07fe 6b02          	ld	(OFST+0,sp),a
6947  0800 2002          	jra	L1243
6948  0802               L7143:
6949                     ; 2130     bitstatus = RESET;
6951  0802 0f02          	clr	(OFST+0,sp)
6953  0804               L1243:
6954                     ; 2132   return (ITStatus)(bitstatus);
6956  0804 7b02          	ld	a,(OFST+0,sp)
6959  0806 5b03          	addw	sp,#3
6960  0808 81            	ret
6996                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6996                     ; 2150 {
6997                     	switch	.text
6998  0809               _TIM1_ClearITPendingBit:
7002                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7004                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7006  0809 43            	cpl	a
7007  080a c75255        	ld	21077,a
7008                     ; 2156 }
7011  080d 81            	ret
7057                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7057                     ; 2175                        uint8_t TIM1_ICSelection,
7057                     ; 2176                        uint8_t TIM1_ICFilter)
7057                     ; 2177 {
7058                     	switch	.text
7059  080e               L3_TI1_Config:
7061  080e 89            	pushw	x
7062  080f 88            	push	a
7063       00000001      OFST:	set	1
7066                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7068  0810 7211525c      	bres	21084,#0
7069                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7069                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7071  0814 7b06          	ld	a,(OFST+5,sp)
7072  0816 97            	ld	xl,a
7073  0817 a610          	ld	a,#16
7074  0819 42            	mul	x,a
7075  081a 9f            	ld	a,xl
7076  081b 1a03          	or	a,(OFST+2,sp)
7077  081d 6b01          	ld	(OFST+0,sp),a
7079  081f c65258        	ld	a,21080
7080  0822 a40c          	and	a,#12
7081  0824 1a01          	or	a,(OFST+0,sp)
7082  0826 c75258        	ld	21080,a
7083                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7085  0829 0d02          	tnz	(OFST+1,sp)
7086  082b 2706          	jreq	L1643
7087                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7089  082d 7212525c      	bset	21084,#1
7091  0831 2004          	jra	L3643
7092  0833               L1643:
7093                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7095  0833 7213525c      	bres	21084,#1
7096  0837               L3643:
7097                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7099  0837 7210525c      	bset	21084,#0
7100                     ; 2197 }
7103  083b 5b03          	addw	sp,#3
7104  083d 81            	ret
7150                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7150                     ; 2216                        uint8_t TIM1_ICSelection,
7150                     ; 2217                        uint8_t TIM1_ICFilter)
7150                     ; 2218 {
7151                     	switch	.text
7152  083e               L5_TI2_Config:
7154  083e 89            	pushw	x
7155  083f 88            	push	a
7156       00000001      OFST:	set	1
7159                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7161  0840 7219525c      	bres	21084,#4
7162                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7162                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7164  0844 7b06          	ld	a,(OFST+5,sp)
7165  0846 97            	ld	xl,a
7166  0847 a610          	ld	a,#16
7167  0849 42            	mul	x,a
7168  084a 9f            	ld	a,xl
7169  084b 1a03          	or	a,(OFST+2,sp)
7170  084d 6b01          	ld	(OFST+0,sp),a
7172  084f c65259        	ld	a,21081
7173  0852 a40c          	and	a,#12
7174  0854 1a01          	or	a,(OFST+0,sp)
7175  0856 c75259        	ld	21081,a
7176                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7178  0859 0d02          	tnz	(OFST+1,sp)
7179  085b 2706          	jreq	L5053
7180                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7182  085d 721a525c      	bset	21084,#5
7184  0861 2004          	jra	L7053
7185  0863               L5053:
7186                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7188  0863 721b525c      	bres	21084,#5
7189  0867               L7053:
7190                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7192  0867 7218525c      	bset	21084,#4
7193                     ; 2236 }
7196  086b 5b03          	addw	sp,#3
7197  086d 81            	ret
7243                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7243                     ; 2255                        uint8_t TIM1_ICSelection,
7243                     ; 2256                        uint8_t TIM1_ICFilter)
7243                     ; 2257 {
7244                     	switch	.text
7245  086e               L7_TI3_Config:
7247  086e 89            	pushw	x
7248  086f 88            	push	a
7249       00000001      OFST:	set	1
7252                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7254  0870 7211525d      	bres	21085,#0
7255                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7255                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7257  0874 7b06          	ld	a,(OFST+5,sp)
7258  0876 97            	ld	xl,a
7259  0877 a610          	ld	a,#16
7260  0879 42            	mul	x,a
7261  087a 9f            	ld	a,xl
7262  087b 1a03          	or	a,(OFST+2,sp)
7263  087d 6b01          	ld	(OFST+0,sp),a
7265  087f c6525a        	ld	a,21082
7266  0882 a40c          	and	a,#12
7267  0884 1a01          	or	a,(OFST+0,sp)
7268  0886 c7525a        	ld	21082,a
7269                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7271  0889 0d02          	tnz	(OFST+1,sp)
7272  088b 2706          	jreq	L1353
7273                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7275  088d 7212525d      	bset	21085,#1
7277  0891 2004          	jra	L3353
7278  0893               L1353:
7279                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7281  0893 7213525d      	bres	21085,#1
7282  0897               L3353:
7283                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7285  0897 7210525d      	bset	21085,#0
7286                     ; 2276 }
7289  089b 5b03          	addw	sp,#3
7290  089d 81            	ret
7336                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7336                     ; 2295                        uint8_t TIM1_ICSelection,
7336                     ; 2296                        uint8_t TIM1_ICFilter)
7336                     ; 2297 {
7337                     	switch	.text
7338  089e               L11_TI4_Config:
7340  089e 89            	pushw	x
7341  089f 88            	push	a
7342       00000001      OFST:	set	1
7345                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7347  08a0 7219525d      	bres	21085,#4
7348                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7348                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7350  08a4 7b06          	ld	a,(OFST+5,sp)
7351  08a6 97            	ld	xl,a
7352  08a7 a610          	ld	a,#16
7353  08a9 42            	mul	x,a
7354  08aa 9f            	ld	a,xl
7355  08ab 1a03          	or	a,(OFST+2,sp)
7356  08ad 6b01          	ld	(OFST+0,sp),a
7358  08af c6525b        	ld	a,21083
7359  08b2 a40c          	and	a,#12
7360  08b4 1a01          	or	a,(OFST+0,sp)
7361  08b6 c7525b        	ld	21083,a
7362                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7364  08b9 0d02          	tnz	(OFST+1,sp)
7365  08bb 2706          	jreq	L5553
7366                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7368  08bd 721a525d      	bset	21085,#5
7370  08c1 2004          	jra	L7553
7371  08c3               L5553:
7372                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7374  08c3 721b525d      	bres	21085,#5
7375  08c7               L7553:
7376                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7378  08c7 7218525d      	bset	21085,#4
7379                     ; 2317 }
7382  08cb 5b03          	addw	sp,#3
7383  08cd 81            	ret
7396                     	xdef	_TIM1_ClearITPendingBit
7397                     	xdef	_TIM1_GetITStatus
7398                     	xdef	_TIM1_ClearFlag
7399                     	xdef	_TIM1_GetFlagStatus
7400                     	xdef	_TIM1_GetPrescaler
7401                     	xdef	_TIM1_GetCounter
7402                     	xdef	_TIM1_GetCapture4
7403                     	xdef	_TIM1_GetCapture3
7404                     	xdef	_TIM1_GetCapture2
7405                     	xdef	_TIM1_GetCapture1
7406                     	xdef	_TIM1_SetIC4Prescaler
7407                     	xdef	_TIM1_SetIC3Prescaler
7408                     	xdef	_TIM1_SetIC2Prescaler
7409                     	xdef	_TIM1_SetIC1Prescaler
7410                     	xdef	_TIM1_SetCompare4
7411                     	xdef	_TIM1_SetCompare3
7412                     	xdef	_TIM1_SetCompare2
7413                     	xdef	_TIM1_SetCompare1
7414                     	xdef	_TIM1_SetAutoreload
7415                     	xdef	_TIM1_SetCounter
7416                     	xdef	_TIM1_SelectOCxM
7417                     	xdef	_TIM1_CCxNCmd
7418                     	xdef	_TIM1_CCxCmd
7419                     	xdef	_TIM1_OC4PolarityConfig
7420                     	xdef	_TIM1_OC3NPolarityConfig
7421                     	xdef	_TIM1_OC3PolarityConfig
7422                     	xdef	_TIM1_OC2NPolarityConfig
7423                     	xdef	_TIM1_OC2PolarityConfig
7424                     	xdef	_TIM1_OC1NPolarityConfig
7425                     	xdef	_TIM1_OC1PolarityConfig
7426                     	xdef	_TIM1_GenerateEvent
7427                     	xdef	_TIM1_OC4FastConfig
7428                     	xdef	_TIM1_OC3FastConfig
7429                     	xdef	_TIM1_OC2FastConfig
7430                     	xdef	_TIM1_OC1FastConfig
7431                     	xdef	_TIM1_OC4PreloadConfig
7432                     	xdef	_TIM1_OC3PreloadConfig
7433                     	xdef	_TIM1_OC2PreloadConfig
7434                     	xdef	_TIM1_OC1PreloadConfig
7435                     	xdef	_TIM1_CCPreloadControl
7436                     	xdef	_TIM1_SelectCOM
7437                     	xdef	_TIM1_ARRPreloadConfig
7438                     	xdef	_TIM1_ForcedOC4Config
7439                     	xdef	_TIM1_ForcedOC3Config
7440                     	xdef	_TIM1_ForcedOC2Config
7441                     	xdef	_TIM1_ForcedOC1Config
7442                     	xdef	_TIM1_CounterModeConfig
7443                     	xdef	_TIM1_PrescalerConfig
7444                     	xdef	_TIM1_EncoderInterfaceConfig
7445                     	xdef	_TIM1_SelectMasterSlaveMode
7446                     	xdef	_TIM1_SelectSlaveMode
7447                     	xdef	_TIM1_SelectOutputTrigger
7448                     	xdef	_TIM1_SelectOnePulseMode
7449                     	xdef	_TIM1_SelectHallSensor
7450                     	xdef	_TIM1_UpdateRequestConfig
7451                     	xdef	_TIM1_UpdateDisableConfig
7452                     	xdef	_TIM1_SelectInputTrigger
7453                     	xdef	_TIM1_TIxExternalClockConfig
7454                     	xdef	_TIM1_ETRConfig
7455                     	xdef	_TIM1_ETRClockMode2Config
7456                     	xdef	_TIM1_ETRClockMode1Config
7457                     	xdef	_TIM1_InternalClockConfig
7458                     	xdef	_TIM1_ITConfig
7459                     	xdef	_TIM1_CtrlPWMOutputs
7460                     	xdef	_TIM1_Cmd
7461                     	xdef	_TIM1_PWMIConfig
7462                     	xdef	_TIM1_ICInit
7463                     	xdef	_TIM1_BDTRConfig
7464                     	xdef	_TIM1_OC4Init
7465                     	xdef	_TIM1_OC3Init
7466                     	xdef	_TIM1_OC2Init
7467                     	xdef	_TIM1_OC1Init
7468                     	xdef	_TIM1_TimeBaseInit
7469                     	xdef	_TIM1_DeInit
7488                     	end
