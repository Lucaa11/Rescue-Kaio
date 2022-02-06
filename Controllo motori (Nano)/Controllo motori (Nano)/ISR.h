/*
 * ISR.h
 *
 * Created: 09/06/2021 12:34:15
 *  Author: tollardogiacomo
 */ 
#include <avr/io.h>
void InitISR(void);
volatile unsigned long tImp[2],difftImp[2],vtImp[2];
volatile unsigned long topRaggiuntiProv[2],vTopRaggiunti[2];
volatile int duty[2];
volatile double speed[2];
volatile int countForSer;
char num[64];
volatile double Num;
char operation;