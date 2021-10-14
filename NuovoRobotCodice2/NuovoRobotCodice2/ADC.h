/*
 * ADC.h
 *
 * Created: 22/06/2021 16:56:36
 *  Author: tollardogiacomo
 */ 
#include <avr/io.h>
void InitADC(void);
int StartADC(uint8_t);
double DistanzaIR(uint8_t POS);                                       
// 10CM =500 PATATE CIT. F. POJER