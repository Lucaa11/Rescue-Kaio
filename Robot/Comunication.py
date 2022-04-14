import serial
import time
#from I2C import Initialization
class Ser:
    def __init__(self,BlackQueue,I2C):
        self.devNames=['/dev/ttyUSB0','/dev/ttyUSB1','/dev/ttyUSB2','/dev/ttyACM0','/dev/ttyACM1','/dev/ttyACM2']
        self.serCons=[]
        self.msgs=[0,0,0]
        self.black=BlackQueue
        self.i2c=I2C
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
            #print (msg)
            if msg=='servo':
                self.serCons[0],self.serCons[self.msgs.index(msg)]=self.serCons[self.msgs.index(msg)],self.serCons[0]
            if msg=='left':
                self.serCons[1],self.serCons[self.msgs.index(msg)]=self.serCons[self.msgs.index(msg)],self.serCons[1]

        for con in self.serCons:
            print(con.port) 
    def write(self,dev, comType, data=0):
        self.serCons[dev].write(bytes(str(data)+str(comType)+'e','utf-8'))
    def read(self, dev):
        self.msgs[dev]=0
        while not self.msgs[dev]:
            self.msgs[dev]=self.serCons[dev].readline().decode('utf-8').rstrip()
        return self.msgs[dev]
    def forward30cm(self):
        self.write(1,1,1)
        self.write(2,1,1)
        self.msgs[1:]=0,0
        while self.msgs[1:] != ('done','done'):
            self.msgs[0]=self.serCons[0].readline().decode('utf-8').rstrip()
            if self.msgs[1] != 'done':
                self.msgs[1]=self.serCons[1].readline().decode('utf-8').rstrip()
            if self.msgs[2] != 'done':
                self.msgs[2]=self.serCons[2].readline().decode('utf-8').rstrip()
            if self.msgs[0]=='black':
                self.write(1,2,1)
                self.write(2,2,1)
                self.black.put(True)
                break
        if self.msgs[1:] == ('done','done'):
            self.write(1,0,0)
            self.write(2,0,0)
    def turn(self,degrees):
        objDegree=self.i2c.bno.readAxis()+degrees
        while objDegree > 360:
            objDegree -= 360
        while objDegree < 0:
            objDegree += 360
        if degrees > 0:
            self.write(1,0,0.5)
            self.write(2,0,-0.5)
        if degrees > 0:
            self.write(1,0,-0.5)
            self.write(2,0,0.5)
        while not objDegree == self.i2c.bno.readAxis():
            pass
        self.write(1,0,0)
        self.write(2,0,0)
if __name__ == '__main__':
    
    Ser = Ser(1,1)
    #i2c= Initialization()

    #while True:
        
        
        
        
        
        
        
        #test con invio continuo: successed
    Ser.write(1,0,1)
    Ser.write(2,0,1)
    Ser.write(0,0,1) 
    print('avanti')
        
        