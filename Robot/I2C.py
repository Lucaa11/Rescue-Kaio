from BNO055 import BNO055
from ST_VL6180X import VL6180Xs

def initDevices():
    lasers=VL6180Xs(5)
    bno=BNO055()
    if bno.begin() is not True:
        print("Error initializing device")
        exit()
    bno.setExternalCrystalUse(True)

if __name__=='__main__':
    print ('initalizing')
    initDevices()
    print('done')