
static volatile uint8_t interruptAvailable[4];
static volatile unsigned long nImp[4];
static volatile long tImp[4],difftImp[4],vtImp[4];
static volatile unsigned long topRaggiuntiProv[4],vTopRaggiunti[4];
static volatile unsigned long topRaggiunti,impTot;
static volatile double speed[4];
static volatile int countForSer;
static char num[64];
static volatile double Num;
static volatile char operation;
static volatile float data;
static volatile uint8_t send,sendId, black;

void InitISR(void);
void InitCLK(void);





