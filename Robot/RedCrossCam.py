#COLOR AND SHAPES DETECTION

import cv2
import numpy as np
import imutils
from multiprocessing import *
import time

class Cam:
    def __init__(self,cap):
        #catturo il video dalla camera 
        self.cap = cap
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH,250)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT,250)
        
        self.res=''
            
        #setto i livelli massimi e minimi per ROSSO
        self.low_red = np.array([0, 160, 120])
        self.up_red = np.array([15, 225, 230])


    def run(self,res):
        while True:
            #leggo il video come self.frame di immagini
            self.net, self.frame = self.cap.read()
            #converto ogni immagine di self.frame BGR in hsv(gue-saturation-value)
            if self.net:
                 hsv = cv2.cvtColor(self.frame, cv2.COLOR_BGR2HSV)
             
                 #definisco le maschere dei 4 colori 

                 self.mask_R = cv2.inRange(hsv, self.low_red, self.up_red)
            
                 #definisco i contorni della self.mask3
                 self.cnts_R = cv2.findContours(self.mask_R, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                 self.cnts_R = imutils.grab_contours(self.cnts_R)


                 for item in self.cnts_R:
                    area3 = cv2.contourArea(item)
                    approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
                    x = approx.ravel()[0]
                    y = approx.ravel()[1]
                    
                    
                    if area3 > 500:
                        cv2.drawContours(self.frame, [approx], -1, (0,255,0), 3)
                        self.res='red shape'
                        if len(approx) == 4:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 255), 3)
                        if 10 < len(approx) < 20:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 255), 3)
                        

                #mostro a schermo il video con il detector
                 cv2.imshow('Result', self.frame)
                 if self.res=="red shape":
                     try:
                         res.put(True)
                     except AttributeError:
                         print('visto')
                     self.res=0
                 else:
                     try:
                         res.put(False)
                     except AttributeError:
                         print('non visto')
                 time.sleep(0.001)
                 k = cv2.waitKey(5)
    #se premo 'esc' il programma si interrompe
                 if k == 27:
                     break    
        
if __name__ == '__main__':
    cap=cv2.VideoCapture(0)
    ciaao=Cam(cap)
    ciaao.run('a')
    cap.release()
    cv2.destroyAllWindows()


        



