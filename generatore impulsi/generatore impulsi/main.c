/*
 * generatore impulsi.c
 *
 * Created: 11/11/2021 15:59:36
 * Author : tollardogiacomo
 */ 
#define F_CPU 16000000ul
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	DDRA=0xFF;
    while (1) 
    {
		PORTA=1;
		_delay_ms(100);
		PORTA=0;
		_delay_ms(100);
    }
}

