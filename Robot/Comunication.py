import serial
import time
from I2C import Initialization
class Ser:
    def __init__(self):
        self.devNames=['/dev/ttyUSB0','/dev/ttyUSB1','/dev/ttyUSB2','/dev/ttyACM0','/dev/ttyACM1','/dev/ttyACM2']
        self.serCons=[]
        self.msgs=[0,0,0]
        self.initDevices()
    def initDevices(self):
        self.k=0
        for i in range(3):
            for name in self.devNames:
                try:
                    self.serCons.append(serial.Serial(name, 1000000, timeout = 1))
                    print(name+' working')
                    self.k+=1
                    self.devNames.remove(name)
                    break
                except:
                    pass
        if self.k<3:
            print("less than 3 device connected")
        
        for con in self.serCons:
            con.reset_input_buffer()
        while (not(self.msgs[0]) or not (self.msgs[1]) or not (self.msgs[2])):
            if not self.msgs[0]:
                self.msgs[0]=self.serCons[0].readline().decode('utf-8').rstrip()
            if not self.msgs[1]:
                self.msgs[1]=self.serCons[1].readline().decode('utf-8').rstrip()
            if not self.msgs[2]:
                self.msgs[2]=self.serCons[2].readline().decode('utf-8').rstrip()
        for msg in self.msgs:
            print (msg)
            if msg=='servo':
                self.serCons[0],self.serCons[self.msgs.index(msg)]=self.serCons[self.msgs.index(msg)],self.serCons[0]
                print('done')
        for con in self.serCons:
            print(con.port) 
    def write(self,dev, comType, data=0):
        self.serCons[dev].write(bytes(str(data)+str(comType)+'e','utf-8'))
    def read(self, dev):
        msg=0
        while not msg:
            msg=self.serCons[dev].readline().decode('utf-8').rstrip()
        return msg

if __name__ == '__main__':
    
    Ser = Ser()
    #i2c= Initialization()

    while True:
        '''ser[0].write(b'10e')
        ser[1].write(b'10e')
        
        #line = ser[0].readline().decode('utf-8').rstrip()
        #line1 = ser[1].readline().decode('utf-8').rstrip()
        
        #print(line)
        time.sleep(3)
        
        ser[0].write(b'00e')
        ser[1].write(b'00e')
        
        #line = ser[0].readline().decode('utf-8').rstrip()
        #line1 = ser[1].readline().decode('utf-8').rstrip()
        
        #print(line)
        time.sleep(3)'''
        
        
        
        
        
        
        #test con invio continuo: successed
        Ser.write(0,0,1)
        Ser.write(1,0,1)
        time.sleep(3)
        Ser.write(0,0,0)
        Ser.write(1,0,0)
        time.sleep(3)
        