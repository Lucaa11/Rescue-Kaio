
/*
 * PWM.h
 *
 * Created: 07/06/2021 16:31:28
 *  Author: tollardogiacomo
 */ 
#include <avr/io.h>
#define MSxA 1
#define MDxA 2
#define MSxD 3
#define MDxD 4
#define dutyMSxA OCR3A
#define dutyMDxA OCR1A
#define dutyMSxD OCR1C
#define dutyMDxD OCR1B
#define Kp 0
#define Ki 250
#define Kd 0
#define limP 0
#define limI 0.5
#define limD 0


volatile double error[5], integral[5], derivative[5], setpoint[5], speed[5], old_error[5];
volatile unsigned int M;
volatile double errorGy, integralGy , derivativeGy, setpointGy, old_errorGy, increase[5],set[5],objDegree;
volatile int Ti;
volatile double angle;
void InitPWM(void);
void Avantitutta(double );
void setGiriCoppia(double , double );
int CalculatePID(int );
void Turn(double degrees);
void stopMotori();
