/*
 * ISR.h
 *
 * Created: 09/06/2021 12:34:15
 *  Author: tollardogiacomo
 */ 
#include <avr/io.h>
void InitISR(void);
volatile double tImp1,difftImp1,vtImp1;
volatile unsigned int topRaggiuntiProv1,vTopRaggiunti1;
volatile double tImp2,difftImp2,vtImp2;
volatile unsigned int topRaggiuntiProv2,vTopRaggiunti2;
volatile double tImp3,difftImp3,vtImp3;
volatile unsigned int topRaggiuntiProv3,vTopRaggiunti3;
volatile double tImp4,difftImp4,vtImp4;
volatile unsigned int topRaggiuntiProv4,vTopRaggiunti4;
volatile unsigned long topRaggiunti,impTot;
volatile double sommaVel1,sommaVel2,sommaVel3,sommaVel4;
volatile int duty[5];
volatile double speed[5],old_millis,current_millis;


volatile int countForSer;
char num[64];
volatile double Num;
char operation;