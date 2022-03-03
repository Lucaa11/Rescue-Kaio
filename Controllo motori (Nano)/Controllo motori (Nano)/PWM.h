
/*
 * PWM.h
 *
 * Created: 07/06/2021 16:31:28
 *  Author: tollardogiacomo
 */ 
#include <avr/io.h>
#define MA 0
#define MD 1
#define dutyMA OCR3A
#define dutyMD OCR1A
#define Kp 650
#define Ki 250
#define Kd 0.3
#define limP 1000
#define limI 1
#define Kpg 0.05
#define Kig 0.00
#define Kdg 0.0000001


volatile double error[2], proportional[2], integral[2], derivative[2], setpoint[2], old_error[2];
volatile double errorGy, integralGy , derivativeGy, setpointGy, old_errorGy, increase[2],set[2],objDegree;
volatile unsigned int M;
volatile int Ti;
volatile double angle;
void InitPWM(void);
void Avantitutta(double );
void setGiriCoppia(double , double );
int CalculatePID(int );
void Turn(double degrees);
void stopMotori();
void servo(double degrees);