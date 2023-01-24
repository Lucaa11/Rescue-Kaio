   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  77                     ; 5 void stopWatch(bool disable){
  79                     	switch	.text
  80  0000               _stopWatch:
  84                     ; 7 			if(disable){
  86  0000 4d            	tnz	a
  87  0001 270b          	jreq	L73
  88                     ; 8 				TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  90  0003 a601          	ld	a,#1
  91  0005 cd0000        	call	_TIM4_ClearFlag
  93                     ; 9 		  	TIM4_Cmd(DISABLE);
  95  0008 4f            	clr	a
  96  0009 cd0000        	call	_TIM4_Cmd
  99  000c 200e          	jra	L14
 100  000e               L73:
 101                     ; 12 				TIM4_DeInit();
 103  000e cd0000        	call	_TIM4_DeInit
 105                     ; 13 				TIM4_TimeBaseInit(TIM4_PRESCALER_128, 255);
 107  0011 ae07ff        	ldw	x,#2047
 108  0014 cd0000        	call	_TIM4_TimeBaseInit
 110                     ; 14 				TIM4_Cmd(ENABLE);
 112  0017 a601          	ld	a,#1
 113  0019 cd0000        	call	_TIM4_Cmd
 115  001c               L14:
 116                     ; 16 }
 119  001c 81            	ret
 156                     ; 17 void delay_us(int us)
 156                     ; 18 	{
 157                     	switch	.text
 158  001d               _delay_us:
 160  001d 89            	pushw	x
 161       00000000      OFST:	set	0
 164                     ; 19 				 TIM4_DeInit();     
 166  001e cd0000        	call	_TIM4_DeInit
 168                     ; 20 				 if((us <= 200) && (us >= 0))
 170  0021 9c            	rvf
 171  0022 1e01          	ldw	x,(OFST+1,sp)
 172  0024 a300c9        	cpw	x,#201
 173  0027 2e12          	jrsge	L75
 175  0029 9c            	rvf
 176  002a 1e01          	ldw	x,(OFST+1,sp)
 177  002c 2f0d          	jrslt	L75
 178                     ; 22 								TIM4_TimeBaseInit(TIM4_PRESCALER_16, 200);
 180  002e ae04c8        	ldw	x,#1224
 181  0031 cd0000        	call	_TIM4_TimeBaseInit
 183                     ; 23 								TIM4_Cmd(ENABLE);  
 185  0034 a601          	ld	a,#1
 186  0036 cd0000        	call	_TIM4_Cmd
 189  0039 206b          	jra	L77
 190  003b               L75:
 191                     ; 25 				 else if((us <= 400) && (us > 200))
 193  003b 9c            	rvf
 194  003c 1e01          	ldw	x,(OFST+1,sp)
 195  003e a30191        	cpw	x,#401
 196  0041 2e19          	jrsge	L36
 198  0043 9c            	rvf
 199  0044 1e01          	ldw	x,(OFST+1,sp)
 200  0046 a300c9        	cpw	x,#201
 201  0049 2f11          	jrslt	L36
 202                     ; 27 								us >>= 1;
 204  004b 0701          	sra	(OFST+1,sp)
 205  004d 0602          	rrc	(OFST+2,sp)
 206                     ; 28 								TIM4_TimeBaseInit(TIM4_PRESCALER_32, 200);
 208  004f ae05c8        	ldw	x,#1480
 209  0052 cd0000        	call	_TIM4_TimeBaseInit
 211                     ; 29 								TIM4_Cmd(ENABLE);  
 213  0055 a601          	ld	a,#1
 214  0057 cd0000        	call	_TIM4_Cmd
 217  005a 204a          	jra	L77
 218  005c               L36:
 219                     ; 31 				 else if((us <= 800) && (us > 400))
 221  005c 9c            	rvf
 222  005d 1e01          	ldw	x,(OFST+1,sp)
 223  005f a30321        	cpw	x,#801
 224  0062 2e1e          	jrsge	L76
 226  0064 9c            	rvf
 227  0065 1e01          	ldw	x,(OFST+1,sp)
 228  0067 a30191        	cpw	x,#401
 229  006a 2f16          	jrslt	L76
 230                     ; 33 								us >>= 2;
 232  006c a602          	ld	a,#2
 233  006e               L01:
 234  006e 0701          	sra	(OFST+1,sp)
 235  0070 0602          	rrc	(OFST+2,sp)
 236  0072 4a            	dec	a
 237  0073 26f9          	jrne	L01
 238                     ; 34 								TIM4_TimeBaseInit(TIM4_PRESCALER_64, 200);
 240  0075 ae06c8        	ldw	x,#1736
 241  0078 cd0000        	call	_TIM4_TimeBaseInit
 243                     ; 35 								TIM4_Cmd(ENABLE);  
 245  007b a601          	ld	a,#1
 246  007d cd0000        	call	_TIM4_Cmd
 249  0080 2024          	jra	L77
 250  0082               L76:
 251                     ; 37 				 else if((us <= 1600) && (us > 800))
 253  0082 9c            	rvf
 254  0083 1e01          	ldw	x,(OFST+1,sp)
 255  0085 a30641        	cpw	x,#1601
 256  0088 2e1c          	jrsge	L77
 258  008a 9c            	rvf
 259  008b 1e01          	ldw	x,(OFST+1,sp)
 260  008d a30321        	cpw	x,#801
 261  0090 2f14          	jrslt	L77
 262                     ; 39 								us >>= 3;
 264  0092 a603          	ld	a,#3
 265  0094               L21:
 266  0094 0701          	sra	(OFST+1,sp)
 267  0096 0602          	rrc	(OFST+2,sp)
 268  0098 4a            	dec	a
 269  0099 26f9          	jrne	L21
 270                     ; 40 								TIM4_TimeBaseInit(TIM4_PRESCALER_128, 200);
 272  009b ae07c8        	ldw	x,#1992
 273  009e cd0000        	call	_TIM4_TimeBaseInit
 275                     ; 41 								TIM4_Cmd(ENABLE);  
 277  00a1 a601          	ld	a,#1
 278  00a3 cd0000        	call	_TIM4_Cmd
 280  00a6               L77:
 281                     ; 43 				 while(TIM4_GetCounter() < us);
 283  00a6 9c            	rvf
 284  00a7 cd0000        	call	_TIM4_GetCounter
 286  00aa 9c            	rvf
 287  00ab 5f            	clrw	x
 288  00ac 97            	ld	xl,a
 289  00ad 1301          	cpw	x,(OFST+1,sp)
 290  00af 2ff5          	jrslt	L77
 291                     ; 44 				 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 293  00b1 a601          	ld	a,#1
 294  00b3 cd0000        	call	_TIM4_ClearFlag
 296                     ; 45 				 TIM4_Cmd(DISABLE);    
 298  00b6 4f            	clr	a
 299  00b7 cd0000        	call	_TIM4_Cmd
 301                     ; 46 	}
 304  00ba 85            	popw	x
 305  00bb 81            	ret
 338                     ; 47 	void delay_ms(long ms)
 338                     ; 48 	{
 339                     	switch	.text
 340  00bc               _delay_ms:
 342       00000000      OFST:	set	0
 345  00bc 2006          	jra	L121
 346  00be               L711:
 347                     ; 51 								delay_us(1000);
 349  00be ae03e8        	ldw	x,#1000
 350  00c1 cd001d        	call	_delay_us
 352  00c4               L121:
 353                     ; 49 				 while(ms--)
 355  00c4 96            	ldw	x,sp
 356  00c5 1c0003        	addw	x,#OFST+3
 357  00c8 cd0000        	call	c_ltor
 359  00cb 96            	ldw	x,sp
 360  00cc 1c0003        	addw	x,#OFST+3
 361  00cf a601          	ld	a,#1
 362  00d1 cd0000        	call	c_lgsbc
 364  00d4 cd0000        	call	c_lrzmp
 366  00d7 26e5          	jrne	L711
 367                     ; 53 	}
 370  00d9 81            	ret
 383                     	xdef	_stopWatch
 384                     	xdef	_delay_ms
 385                     	xdef	_delay_us
 386                     	xref	_TIM4_ClearFlag
 387                     	xref	_TIM4_GetCounter
 388                     	xref	_TIM4_Cmd
 389                     	xref	_TIM4_TimeBaseInit
 390                     	xref	_TIM4_DeInit
 409                     	xref	c_lrzmp
 410                     	xref	c_lgsbc
 411                     	xref	c_ltor
 412                     	end
