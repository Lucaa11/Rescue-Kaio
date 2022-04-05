import smbus
import time
import cv2
from ColorShapesAndLetterDetection import cam
from BNO055 import BNO055
from multiprocessing import *



cap=[cv2.VideoCapture(0),cv2.VideoCapture(2)]
#cap1=cv2.VideoCapture(0)
#cap2=cv2.VideoCapture(2)
res = [Pipe(),Pipe()]
cam=[cam(cap[0]),cam(cap[1])]
#gyro=BNO055()
#if not gyro.begin():
#   print("Error initializing device")
#    exit()
#gyro.setExternalCrystalUse(True)

#Process(target=gyro.stampa,).start()
pCam=[Process(target=cam[0].run, args=(res[0][0],)),Process(target=cam[1].run, args=(res[1][0],))]
pCam[0].start()
pCam[1].start()
#cam.Cam()
while True:
    print(res[0][1].recv(),res[1][1].recv())
    time.sleep(0.5)
cap.release()
cv2.destroyAllWindows()