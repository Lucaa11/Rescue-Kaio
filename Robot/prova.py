import smbus
import time
import cv2
from ColorShapesAndLetterDetection import cam
from BNO055 import BNO055
from multiprocessing import *



cap=cv2.VideoCapture(0)
res = [Queue(),Queue()]
cam=cam(cap)
gyro=BNO055()
#if not gyro.begin():
#   print("Error initializing device")
#    exit()
#gyro.setExternalCrystalUse(True)

#Process(target=gyro.stampa,).start()
pCam=[Process(target=cam[0].run, args=(res[0],)),Process(target=cam[1].run, args=(res[1],))]
pCam[0].start()
pCam[1].start()
#cam.Cam()
while True:
    print(res.get())
cap.release()
cv2.destroyAllWindows()