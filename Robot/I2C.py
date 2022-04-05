from BNO055 import BNO055
from ST_VL6180X import VL6180Xs
class I2CDevices:
    def __init__(self):
        self.initDevices()
    def initDevices(self):
        self.lasers=VL6180Xs(5)
        self.bno=BNO055(i2c=self.lasers.i2c)
        if self.bno.begin() is not True:
            print("Error initializing device")
            exit()
        self.bno.setExternalCrystalUse(True)

if __name__=='__main__':
    print ('initalizing')
    c=I2CDevices()
    print('done')