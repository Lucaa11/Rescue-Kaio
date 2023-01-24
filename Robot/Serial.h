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

#include <stm8s.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>



void InitSer(void);

void Serial_Tx(uint8_t data);
void Serial_Send_Int(int32_t num);//NUMERO
void Serial_Send_Hex(int32_t num);
void Serial_Send_Bin(int32_t num);
void Serial_Send_String(char *string1);//STRINGA
void SerialN(void);


