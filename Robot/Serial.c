/** @file ClockUartLed.h
 *
 * @author Wassim FILALI taken over from http://blog.mark-stevens.co.uk/
 *
 * @compiler IAR STM8
 *
 *
 * $Date: 20.09.2015
 * $Revision:
 *
 */

#include "Serial.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stm8s.h>

void InitSer(){
	int i;
	GPIO_Init(GPIOD,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOD,GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	UART1_DeInit();
	UART1_Init(500000,UART1_WORDLENGTH_8D,UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE,UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_RXNE, ENABLE);
	UART1_Cmd(ENABLE);
}
void Serial_Tx(uint8_t data){
	while(!(UART1 -> SR & UART1_SR_TC));
	UART1 -> DR = data;
}
void Serial_Send_Int(int32_t num)
{
	if(num<0)
	{
		Serial_Send_String("-");
		num=-num;
	}
	if(num==0){Serial_Tx('0');}
	else
	{
		char str[10];				// definisce una stringa sulla quale convertire il numero da trasmettere (max 10 cifre)
		char i;						// contatore ciclo
		uint8_t remainder;
		for(i=0;i<10;i++) str[i]=0; // cancella la stringa
		i=0;
		while (num)
		{
        remainder = num % 10;
        str[i++] = 48 + remainder;
        num/=10;
		}
		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
		if (str[9-i]) Serial_Tx(str[9-i]);
	}
	SerialN();
}
void Serial_Send_Hex(int32_t num){
	if(num<0)
	{
		Serial_Send_String("-");
		num=-num;
	}
	Serial_Send_String("0x");
	if(num==0)Serial_Tx('0');
	else{
		char str[10];				// definisce una stringa sulla quale convertire il numero da trasmettere (max 10 cifre)
		char i;						// contatore ciclo
		long remainder;			//resto
		for(i=0;i<10;i++) str[i]=0; // cancella la stringa
		i=0;
		while (num)
		{
        remainder = num % 16;
        if (remainder < 10)str[i++] = 48 + remainder;
        else str[i++] = 55 + remainder;
        num/=16;
		}
		for (i=0; i<10; i++)			// invia la stringa un carattere alla volta
		if (str[9-i]) Serial_Tx(str[9-i]);
	}
	SerialN();
}
void Serial_Send_Bin(int32_t num){
	if(num<0)
	{
		Serial_Send_String("-");
		num=-num;
	}
	Serial_Send_String("0b");
	if(num==0)Serial_Tx('0');
	else{
		char str[16];				// definisce una stringa sulla quale convertire il numero da trasmettere (max 10 cifre)
		char i;						// contatore ciclo
		long remainder;			//resto
		for(i=0;i<16;i++) str[i]='0'; // cancella la stringa
		i=0;
		while (num)
		{
        remainder = num % 2;
        str[i++] = 48 + remainder;
        num/=2;
		}
		for (i=0; i<16; i++)			// invia la stringa un carattere alla volta
		Serial_Tx(str[15-i]);
	}
	SerialN();
}
void Serial_Send_String(char *string1)
{
	int i=0;
	for(i=0;i<strlen(string1);i++)
	{
		Serial_Tx(string1[i]);
	}
}
void SerialN()
{
	Serial_Tx(13);
	Serial_Tx(10);
}
