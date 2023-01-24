   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  45                     ; 22 void InitUART(){
  47                     	switch	.text
  48  0000               _InitUART:
  52                     ; 23 	UART1_DeInit();
  54  0000 cd0000        	call	_UART1_DeInit
  56                     ; 24 	UART1_Init(500000,UART1_WORDLENGTH_8D,UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE,UART1_MODE_TXRX_ENABLE);
  58  0003 4b0c          	push	#12
  59  0005 4b80          	push	#128
  60  0007 4b00          	push	#0
  61  0009 4b00          	push	#0
  62  000b 4b00          	push	#0
  63  000d aea120        	ldw	x,#41248
  64  0010 89            	pushw	x
  65  0011 ae0007        	ldw	x,#7
  66  0014 89            	pushw	x
  67  0015 cd0000        	call	_UART1_Init
  69  0018 5b09          	addw	sp,#9
  70                     ; 25 	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
  72  001a 4b01          	push	#1
  73  001c ae0255        	ldw	x,#597
  74  001f cd0000        	call	_UART1_ITConfig
  76  0022 84            	pop	a
  77                     ; 26 	UART1_Cmd(ENABLE);
  79  0023 a601          	ld	a,#1
  80  0025 cd0000        	call	_UART1_Cmd
  82                     ; 28 }
  85  0028 81            	ret
 136                     .const:	section	.text
 137  0000               L21:
 138  0000 0000000a      	dc.l	10
 139                     ; 29 void Serial_Send_Int(int32_t num)
 139                     ; 30 {
 140                     	switch	.text
 141  0029               _Serial_Send_Int:
 143  0029 5208          	subw	sp,#8
 144       00000008      OFST:	set	8
 147                     ; 31 	if(num<0)
 149  002b 9c            	rvf
 150  002c 9c            	rvf
 151  002d 0d0b          	tnz	(OFST+3,sp)
 152  002f 2e0d          	jrsge	L34
 153                     ; 33 		Serial_Send_String("-");
 155  0031 ae000e        	ldw	x,#L54
 156  0034 cd00d9        	call	_Serial_Send_String
 158                     ; 34 		num=-num;
 160  0037 96            	ldw	x,sp
 161  0038 1c000b        	addw	x,#OFST+3
 162  003b cd0000        	call	c_lgneg
 164  003e               L34:
 165                     ; 36 	if(num==0){UART1_SendData8('0');}
 167  003e 96            	ldw	x,sp
 168  003f 1c000b        	addw	x,#OFST+3
 169  0042 cd0000        	call	c_lzmp
 171  0045 2608          	jrne	L74
 174  0047 a630          	ld	a,#48
 175  0049 cd0000        	call	_UART1_SendData8
 178  004c               L15:
 179                     ; 52 }
 182  004c 5b08          	addw	sp,#8
 183  004e 81            	ret
 184  004f               L74:
 185                     ; 41 		for(i=0;i<7;i++) str[i]=0; // cancella la stringa
 187  004f 0f08          	clr	(OFST+0,sp)
 189  0051               L35:
 192  0051 96            	ldw	x,sp
 193  0052 1c0001        	addw	x,#OFST-7
 194  0055 9f            	ld	a,xl
 195  0056 5e            	swapw	x
 196  0057 1b08          	add	a,(OFST+0,sp)
 197  0059 2401          	jrnc	L01
 198  005b 5c            	incw	x
 199  005c               L01:
 200  005c 02            	rlwa	x,a
 201  005d 7f            	clr	(x)
 204  005e 0c08          	inc	(OFST+0,sp)
 208  0060 7b08          	ld	a,(OFST+0,sp)
 209  0062 a107          	cp	a,#7
 210  0064 25eb          	jrult	L35
 211                     ; 42 		i=7;
 213  0066 a607          	ld	a,#7
 214  0068 6b08          	ld	(OFST+0,sp),a
 217  006a 2037          	jra	L56
 218  006c               L16:
 219                     ; 45 			str[i]=num%10+'0';		// converte il numero da trasmettere in una stringa (dalla cifra meno significativa)
 221  006c 96            	ldw	x,sp
 222  006d 1c000b        	addw	x,#OFST+3
 223  0070 cd0000        	call	c_ltor
 225  0073 ae0000        	ldw	x,#L21
 226  0076 cd0000        	call	c_lmod
 228  0079 a630          	ld	a,#48
 229  007b cd0000        	call	c_ladc
 231  007e 96            	ldw	x,sp
 232  007f 1c0001        	addw	x,#OFST-7
 233  0082 9f            	ld	a,xl
 234  0083 5e            	swapw	x
 235  0084 1b08          	add	a,(OFST+0,sp)
 236  0086 2401          	jrnc	L41
 237  0088 5c            	incw	x
 238  0089               L41:
 239  0089 02            	rlwa	x,a
 240  008a b603          	ld	a,c_lreg+3
 241  008c f7            	ld	(x),a
 242                     ; 46 			num/=10;
 244  008d 96            	ldw	x,sp
 245  008e 1c000b        	addw	x,#OFST+3
 246  0091 cd0000        	call	c_ltor
 248  0094 ae0000        	ldw	x,#L21
 249  0097 cd0000        	call	c_ldiv
 251  009a 96            	ldw	x,sp
 252  009b 1c000b        	addw	x,#OFST+3
 253  009e cd0000        	call	c_rtol
 255                     ; 47 			i--;
 257  00a1 0a08          	dec	(OFST+0,sp)
 259  00a3               L56:
 260                     ; 43 		while (num)
 260                     ; 44 		{
 260                     ; 45 			str[i]=num%10+'0';		// converte il numero da trasmettere in una stringa (dalla cifra meno significativa)
 260                     ; 46 			num/=10;
 260                     ; 47 			i--;
 262  00a3 96            	ldw	x,sp
 263  00a4 1c000b        	addw	x,#OFST+3
 264  00a7 cd0000        	call	c_lzmp
 266  00aa 26c0          	jrne	L16
 267                     ; 49 		for (i=0;i<7;i++)			// invia la stringa un carattere alla volta
 269  00ac 0f08          	clr	(OFST+0,sp)
 271  00ae               L17:
 272                     ; 50 		if (str[i]) UART1_SendData8(str[i]);
 274  00ae 96            	ldw	x,sp
 275  00af 1c0001        	addw	x,#OFST-7
 276  00b2 9f            	ld	a,xl
 277  00b3 5e            	swapw	x
 278  00b4 1b08          	add	a,(OFST+0,sp)
 279  00b6 2401          	jrnc	L61
 280  00b8 5c            	incw	x
 281  00b9               L61:
 282  00b9 02            	rlwa	x,a
 283  00ba 7d            	tnz	(x)
 284  00bb 2710          	jreq	L77
 287  00bd 96            	ldw	x,sp
 288  00be 1c0001        	addw	x,#OFST-7
 289  00c1 9f            	ld	a,xl
 290  00c2 5e            	swapw	x
 291  00c3 1b08          	add	a,(OFST+0,sp)
 292  00c5 2401          	jrnc	L02
 293  00c7 5c            	incw	x
 294  00c8               L02:
 295  00c8 02            	rlwa	x,a
 296  00c9 f6            	ld	a,(x)
 297  00ca cd0000        	call	_UART1_SendData8
 299  00cd               L77:
 300                     ; 49 		for (i=0;i<7;i++)			// invia la stringa un carattere alla volta
 302  00cd 0c08          	inc	(OFST+0,sp)
 306  00cf 7b08          	ld	a,(OFST+0,sp)
 307  00d1 a107          	cp	a,#7
 308  00d3 25d9          	jrult	L17
 309  00d5 ac4c004c      	jpf	L15
 353                     ; 55 void Serial_Send_String(char *string1)
 353                     ; 56 {
 354                     	switch	.text
 355  00d9               _Serial_Send_String:
 357  00d9 89            	pushw	x
 358  00da 89            	pushw	x
 359       00000002      OFST:	set	2
 362                     ; 57 	int i=0;
 364                     ; 58 	for(i=0;i<strlen(string1);i++)
 366  00db 5f            	clrw	x
 367  00dc 1f01          	ldw	(OFST-1,sp),x
 370  00de 2010          	jra	L521
 371  00e0               L121:
 372                     ; 60 		UART1_SendData8(string1[i]);
 374  00e0 1e01          	ldw	x,(OFST-1,sp)
 375  00e2 72fb03        	addw	x,(OFST+1,sp)
 376  00e5 f6            	ld	a,(x)
 377  00e6 cd0000        	call	_UART1_SendData8
 379                     ; 58 	for(i=0;i<strlen(string1);i++)
 381  00e9 1e01          	ldw	x,(OFST-1,sp)
 382  00eb 1c0001        	addw	x,#1
 383  00ee 1f01          	ldw	(OFST-1,sp),x
 385  00f0               L521:
 388  00f0 1e03          	ldw	x,(OFST+1,sp)
 389  00f2 cd0000        	call	_strlen
 391  00f5 1301          	cpw	x,(OFST-1,sp)
 392  00f7 22e7          	jrugt	L121
 393                     ; 62 }
 396  00f9 5b04          	addw	sp,#4
 397  00fb 81            	ret
 421                     ; 63 void SerialN()
 421                     ; 64 {
 422                     	switch	.text
 423  00fc               _SerialN:
 427                     ; 65 	UART1_SendData8(13);
 429  00fc a60d          	ld	a,#13
 430  00fe cd0000        	call	_UART1_SendData8
 432                     ; 66 	UART1_SendData8(10);
 434  0101 a60a          	ld	a,#10
 435  0103 cd0000        	call	_UART1_SendData8
 437                     ; 67 }
 440  0106 81            	ret
 533                     ; 68 void Serial_Send_Float(double data)
 533                     ; 69 {
 534                     	switch	.text
 535  0107               _Serial_Send_Float:
 537  0107 5210          	subw	sp,#16
 538       00000010      OFST:	set	16
 541                     ; 71 	int diff,i,k=0,j=0;
 543  0109 5f            	clrw	x
 544  010a 1f0b          	ldw	(OFST-5,sp),x
 548  010c 5f            	clrw	x
 549  010d 1f09          	ldw	(OFST-7,sp),x
 551                     ; 73 	if(data<0)
 553  010f 9c            	rvf
 554  0110 9c            	rvf
 555  0111 0d13          	tnz	(OFST+3,sp)
 556  0113 2e0c          	jrsge	L571
 557                     ; 75 		Serial_Send_String("-");
 559  0115 ae000e        	ldw	x,#L54
 560  0118 adbf          	call	_Serial_Send_String
 562                     ; 76 		data=-data;
 564  011a 96            	ldw	x,sp
 565  011b 1c0013        	addw	x,#OFST+3
 566  011e cd0000        	call	c_fgneg
 568  0121               L571:
 569                     ; 78 	var=data;
 571  0121 96            	ldw	x,sp
 572  0122 1c0013        	addw	x,#OFST+3
 573  0125 cd0000        	call	c_ltor
 575  0128 cd0000        	call	c_ftol
 577  012b 96            	ldw	x,sp
 578  012c 1c0005        	addw	x,#OFST-11
 579  012f cd0000        	call	c_rtol
 582                     ; 79 	Serial_Send_Int(var);
 584  0132 1e07          	ldw	x,(OFST-9,sp)
 585  0134 89            	pushw	x
 586  0135 1e07          	ldw	x,(OFST-9,sp)
 587  0137 89            	pushw	x
 588  0138 cd0029        	call	_Serial_Send_Int
 590  013b 5b04          	addw	sp,#4
 591                     ; 81 	Num=data;
 593  013d 1e15          	ldw	x,(OFST+5,sp)
 594  013f 1f0f          	ldw	(OFST-1,sp),x
 595  0141 1e13          	ldw	x,(OFST+3,sp)
 596  0143 1f0d          	ldw	(OFST-3,sp),x
 599  0145 2013          	jra	L302
 600  0147               L771:
 601                     ; 86 		Num*=10;
 603  0147 a60a          	ld	a,#10
 604  0149 cd0000        	call	c_ctof
 606  014c 96            	ldw	x,sp
 607  014d 1c000d        	addw	x,#OFST-3
 608  0150 cd0000        	call	c_fgmul
 611                     ; 87 		k++;
 613  0153 1e0b          	ldw	x,(OFST-5,sp)
 614  0155 1c0001        	addw	x,#1
 615  0158 1f0b          	ldw	(OFST-5,sp),x
 617  015a               L302:
 618                     ; 84 	while (fmod(Num,1.00)!=0)
 620  015a ce000c        	ldw	x,L312+2
 621  015d 89            	pushw	x
 622  015e ce000a        	ldw	x,L312
 623  0161 89            	pushw	x
 624  0162 1e13          	ldw	x,(OFST+3,sp)
 625  0164 89            	pushw	x
 626  0165 1e13          	ldw	x,(OFST+3,sp)
 627  0167 89            	pushw	x
 628  0168 cd0000        	call	_fmod
 630  016b 5b08          	addw	sp,#8
 631  016d 9c            	rvf
 632  016e 3d00          	tnz	c_lreg
 633  0170 26d5          	jrne	L771
 634                     ; 89 	data1=Num;
 637                     ; 92 	var=var*pow(10,k);
 639  0172 1e0b          	ldw	x,(OFST-5,sp)
 640  0174 cd0000        	call	c_itof
 642  0177 be02          	ldw	x,c_lreg+2
 643  0179 89            	pushw	x
 644  017a be00          	ldw	x,c_lreg
 645  017c 89            	pushw	x
 646  017d ce0008        	ldw	x,L322+2
 647  0180 89            	pushw	x
 648  0181 ce0006        	ldw	x,L322
 649  0184 89            	pushw	x
 650  0185 cd0000        	call	_pow
 652  0188 5b08          	addw	sp,#8
 653  018a 96            	ldw	x,sp
 654  018b 1c0001        	addw	x,#OFST-15
 655  018e cd0000        	call	c_rtol
 658  0191 96            	ldw	x,sp
 659  0192 1c0005        	addw	x,#OFST-11
 660  0195 cd0000        	call	c_ltor
 662  0198 cd0000        	call	c_ltof
 664  019b 96            	ldw	x,sp
 665  019c 1c0001        	addw	x,#OFST-15
 666  019f cd0000        	call	c_fmul
 668  01a2 cd0000        	call	c_ftol
 670  01a5 96            	ldw	x,sp
 671  01a6 1c0005        	addw	x,#OFST-11
 672  01a9 cd0000        	call	c_rtol
 675                     ; 94 	data1=data1-var;
 677  01ac 96            	ldw	x,sp
 678  01ad 1c0005        	addw	x,#OFST-11
 679  01b0 cd0000        	call	c_ltor
 681  01b3 cd0000        	call	c_ltof
 683  01b6 96            	ldw	x,sp
 684  01b7 1c000d        	addw	x,#OFST-3
 685  01ba cd0000        	call	c_fgsub
 688                     ; 96 	NuM=data1;
 690  01bd 1e0f          	ldw	x,(OFST-1,sp)
 691  01bf 1f07          	ldw	(OFST-9,sp),x
 692  01c1 1e0d          	ldw	x,(OFST-3,sp)
 693  01c3 1f05          	ldw	(OFST-11,sp),x
 696  01c5 2014          	jra	L332
 697  01c7               L722:
 698                     ; 98 		data1/=10.00;
 700  01c7 ae0006        	ldw	x,#L322
 701  01ca cd0000        	call	c_ltor
 703  01cd 96            	ldw	x,sp
 704  01ce 1c000d        	addw	x,#OFST-3
 705  01d1 cd0000        	call	c_fgdiv
 708                     ; 99 		j++;
 710  01d4 1e09          	ldw	x,(OFST-7,sp)
 711  01d6 1c0001        	addw	x,#1
 712  01d9 1f09          	ldw	(OFST-7,sp),x
 714  01db               L332:
 715                     ; 97 	while (data1>1){
 717  01db 9c            	rvf
 718  01dc a601          	ld	a,#1
 719  01de cd0000        	call	c_ctof
 721  01e1 96            	ldw	x,sp
 722  01e2 1c0001        	addw	x,#OFST-15
 723  01e5 cd0000        	call	c_rtol
 726  01e8 96            	ldw	x,sp
 727  01e9 1c000d        	addw	x,#OFST-3
 728  01ec cd0000        	call	c_ltor
 730  01ef 96            	ldw	x,sp
 731  01f0 1c0001        	addw	x,#OFST-15
 732  01f3 cd0000        	call	c_fcmp
 734  01f6 2ccf          	jrsgt	L722
 735                     ; 102 	diff=k-j;
 737  01f8 1e0b          	ldw	x,(OFST-5,sp)
 738  01fa 72f009        	subw	x,(OFST-7,sp)
 739  01fd 1f09          	ldw	(OFST-7,sp),x
 741                     ; 103 	Serial_Send_String(".");
 743  01ff ae0004        	ldw	x,#L732
 744  0202 cd00d9        	call	_Serial_Send_String
 746                     ; 105 	for(i=0;i<diff;i++)UART1_SendData8('0');
 748  0205 5f            	clrw	x
 749  0206 1f0b          	ldw	(OFST-5,sp),x
 752  0208 200c          	jra	L542
 753  020a               L142:
 756  020a a630          	ld	a,#48
 757  020c cd0000        	call	_UART1_SendData8
 761  020f 1e0b          	ldw	x,(OFST-5,sp)
 762  0211 1c0001        	addw	x,#1
 763  0214 1f0b          	ldw	(OFST-5,sp),x
 765  0216               L542:
 768  0216 9c            	rvf
 769  0217 1e0b          	ldw	x,(OFST-5,sp)
 770  0219 1309          	cpw	x,(OFST-7,sp)
 771  021b 2fed          	jrslt	L142
 772                     ; 106 	Serial_Send_Int(NuM);
 774  021d 96            	ldw	x,sp
 775  021e 1c0005        	addw	x,#OFST-11
 776  0221 cd0000        	call	c_ltor
 778  0224 cd0000        	call	c_ftol
 780  0227 be02          	ldw	x,c_lreg+2
 781  0229 89            	pushw	x
 782  022a be00          	ldw	x,c_lreg
 783  022c 89            	pushw	x
 784  022d cd0029        	call	_Serial_Send_Int
 786  0230 5b04          	addw	sp,#4
 787                     ; 107 }
 790  0232 5b10          	addw	sp,#16
 791  0234 81            	ret
 804                     	xref	_strlen
 805                     	xref	_pow
 806                     	xref	_fmod
 807                     	xdef	_SerialN
 808                     	xdef	_Serial_Send_Float
 809                     	xdef	_Serial_Send_String
 810                     	xdef	_Serial_Send_Int
 811                     	xdef	_InitUART
 812                     	xref	_UART1_SendData8
 813                     	xref	_UART1_ITConfig
 814                     	xref	_UART1_Cmd
 815                     	xref	_UART1_Init
 816                     	xref	_UART1_DeInit
 817                     	switch	.const
 818  0004               L732:
 819  0004 2e00          	dc.b	".",0
 820  0006               L322:
 821  0006 41200000      	dc.w	16672,0
 822  000a               L312:
 823  000a 3f800000      	dc.w	16256,0
 824  000e               L54:
 825  000e 2d00          	dc.b	"-",0
 826                     	xref.b	c_lreg
 827                     	xref.b	c_x
 847                     	xref	c_fcmp
 848                     	xref	c_fgdiv
 849                     	xref	c_fgsub
 850                     	xref	c_fmul
 851                     	xref	c_itof
 852                     	xref	c_ltof
 853                     	xref	c_fgmul
 854                     	xref	c_ctof
 855                     	xref	c_ftol
 856                     	xref	c_fgneg
 857                     	xref	c_rtol
 858                     	xref	c_ldiv
 859                     	xref	c_ladc
 860                     	xref	c_lmod
 861                     	xref	c_ltor
 862                     	xref	c_lzmp
 863                     	xref	c_lgneg
 864                     	end
