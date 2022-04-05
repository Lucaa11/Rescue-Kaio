#COLOR AND SHAPES DETECTION

import cv2
import numpy as np
import imutils
from multiprocessing import *
import time
from multiprocessing import Pipe
class cam:
    def __init__(self,cap):
        #catturo il video dalla camera 
        self.cap = cap
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH,250)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT,250)
        
        self.res=''
        #setto i livelli massimi e minimi per GIALLO
        self.low_yellow = np.array([18, 130, 95])
        self.up_yellow = np.array([40, 255, 255])
            
        #setto i livelli massimi e minimi per VERDE
        self.low_green = np.array([40, 90, 35])
        self.up_green = np.array([100, 240, 200])
            
        #setto i livelli massimi e minimi per ROSSO
        self.low_red = np.array([0, 160, 120])
        self.up_red = np.array([15, 225, 230])

        #setto i livelli massimi e minimi per NERO
        self.low_black = np.array([0, 0, 0])
        self.up_black = np.array([205, 85, 76])

    def run(self,res):
        while True:
            #leggo il video come self.frame di immagini
            self.net, self.frame = self.cap.read()
            #converto ogni immagine di self.frame BGR in hsv(gue-saturation-value)
            if self.net:
                 hsv = cv2.cvtColor(self.frame, cv2.COLOR_BGR2HSV)
             
                 #definisco le maschere dei 4 colori 
                 self.mask_Y = cv2.inRange(hsv, self.low_yellow, self.up_yellow)
                 self.mask_G = cv2.inRange(hsv, self.low_green, self.up_green)
                 self.mask_R = cv2.inRange(hsv, self.low_red, self.up_red)
                 self.mask_B = cv2.inRange(hsv, self.low_black, self.up_black)
                
                 #definisco i contorni della self.mask1
                 self.cnts_Y = cv2.findContours(self.mask_Y, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                 self.cnts_Y = imutils.grab_contours(self.cnts_Y)
                
                 #definisco i contorni della self.mask2
                 self.cnts_G = cv2.findContours(self.mask_G, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                 self.cnts_G = imutils.grab_contours(self.cnts_G)
                
                 #definisco i contorni della self.mask3
                 self.cnts_R = cv2.findContours(self.mask_R, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                 self.cnts_R = imutils.grab_contours(self.cnts_R)
                
                 #definisco i contorni della self.mask4
                 self.cnts_B = cv2.findContours(self.mask_B, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
                 self.cnts_B = imutils.grab_contours(self.cnts_B)

                 for item in self.cnts_R:
                    area3 = cv2.contourArea(item)
                    approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
                    x = approx.ravel()[0]
                    y = approx.ravel()[1]
                    
                    
                    if area3 > 500:
                        cv2.drawContours(self.frame, [approx], -1, (0,255,0), 3)
                        if len(approx) == 4 or 10 < len(approx) < 20:
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
                        
                 for item in self.cnts_Y:
                    area1 = cv2.contourArea(item)
                    approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
                    x = approx.ravel()[0]
                    y = approx.ravel()[1]
                    
                    
                    if area1 > 500:
                        cv2.drawContours(self.frame, [approx], -1, (0,255,0), 3)
                        if len(approx) == 4 or 10 < len(approx) < 20:
                            self.res='yellow shape'
                        if len(approx) == 4:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0,255,255), 3)
                        if 10 < len(approx) < 20:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0,255,255), 3)
                 for item in self.cnts_G:
                    area2 = cv2.contourArea(item)
                    approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
                    x = approx.ravel()[0]
                    y = approx.ravel()[1]
                    
                    
                    if area2 > 500:
                        cv2.drawContours(self.frame, [approx], -1, (0,255,0), 3)
                        if len(approx) == 4 or 10 < len(approx) < 20:
                            self.res='green shape'
                        if len(approx) == 4:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 255, 0), 3)
                        if 10 < len(approx) < 20:
                            M = cv2.moments(item)
                            itemx = int(M['m10']/M['m00'])
                            itemy = int(M['m01']/M['m00'])
                            cv2.circle(self.frame, (itemx,itemy), 7, (255,255,255), -1)
                            cv2.putText(self.frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 255, 0), 3)
                
                            
                 for item in self.cnts_B:
                    area = cv2.contourArea(item)
                    if area > 500:
                        cv2.drawContours(self.frame, [item], -1, (0,255,0), 3)
                        x, y, w, h = cv2.boundingRect(item)
                        cv2.rectangle(self.frame, (x, y), (x + w, y + h), (255, 0, 0), 3)
                        Xc = int(x + (w/2))
                        cv2.rectangle(self.frame, (x+10,y+10), (x+20,y+20), (0, 0, 255),2)
                        cv2.rectangle(self.frame, (x+10,y+h-20), (x+20,y+h-10), (0, 0, 255),2)
                        cv2.rectangle(self.frame, (x+w-20,y+10), (x+w-10,y+20), (0, 0, 255),2)
                        cv2.rectangle(self.frame, (x+w-20,y+h-20), (x+w-10,y+h-10), (0, 0, 255),2)
                        #controllo 4 angoli per determinare la lettera
                        Corners=[self.frame[(y+10):(y+20),(x+10):(x+20)], self.frame[(y+10):(y+20),(x+w-20):(x+w-10)], self.frame[(y+h-20):(y+h-10),(x+10):(x+20)],  self.frame[(y+h-20):(y+h-10),(x+w-20):(x+w-10)]]
                        isCornerBlack=[False,False,False,False]
                        for cornerIndex in range(4):
                            j=0
                            i=1
                            for Y in Corners[cornerIndex]:
                                for color in Y:
                                    if color[0]>0:
                                        
                                        j+=color[0]
                                        i+=1
                            if (j/i-1) < 50:
                                isCornerBlack[cornerIndex]=True
                        if(isCornerBlack[0] or isCornerBlack[1]):
                            if(isCornerBlack[2] or isCornerBlack[3]):
                                cv2.putText(self.frame, 'H', (x+w, y+h), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 0), 3)
                                self.res='H'
                            else:
                                cv2.putText(self.frame, 'U', (x+w, y+h), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 0), 3)
                                self.res='U'
                        else:
                            cv2.putText(self.frame, 'S', (x+w, y+h), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 0), 3)
                            self.res='S'
                #mostro a schermo il video con il detector
                 cv2.imshow('Result', self.frame)
                #res.send(self.res)
                 if self.res=="red shape":
                     print('visto')
                     self.res=0
                 else:
                     print('niente')
                 time.sleep(0.001)
                 k = cv2.waitKey(5)
    #se premo 'esc' il programma si interrompe
                 if k == 27:
                     break    
        
if __name__ == '__main__':
    cap=cv2.VideoCapture(0)
    ciaao=cam(cap)
    ciaao.run('a')
    cap.release()
    cv2.destroyAllWindows()


        


