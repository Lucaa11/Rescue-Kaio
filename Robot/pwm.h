#include <stm8s.h>
#include "isr.h"

#define Kp 20000
#define Ki 12800
#define Kd 19
#define limP 51200
#define limI 192
#define Kpg 0.05
#define Kig 0.00
#define Kdg 0.0000001
#define Destra TRUE
#define Sinistra FALSE



extern volatile double error[4], proportional[4], integral[4], derivative[4], setpoint[4], old_error[4];					
extern volatile double errorGy, integralGy , derivativeGy, setpointGy, old_errorGy, increase[4],set[4],objDegree;
extern volatile bool Ti;
extern volatile double angle;
extern volatile long duty[4], imptemp[4];

double long ABS(double long);
void InitPwm(void);
void verify_option(uint16_t address, uint8_t data);
long CalcPid(uint8_t N);
void VaiAvanti(void);
void Gira(bool verso);



