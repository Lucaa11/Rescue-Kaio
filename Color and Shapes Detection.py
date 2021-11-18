#COLOR AND SHAPES DETECTION

import cv2
import numpy as np
# import matplotlib.pyplot as plt
# import pandas as pd
import imutils

def nothing(x):
    #qualunque operazione, non fa nulla
    pass
    
#catturo il video dalla camera 
cap = cv2.VideoCapture(0)

while True:
    #leggo il video come frame di immagini
    ret,frame = cap.read()
    
    #converto ogni immagine di frame BGR in HSV(gue-saturation-value)
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    #setto i livelli massimi e minimi per GIALLO
    low_yellow = np.array([18, 130, 95])
    up_yellow = np.array([40, 255, 255])
    
    #setto i livelli massimi e minimi per VERDE
    low_green = np.array([40, 90, 35])
    up_green = np.array([100, 240, 200])
    
    #setto i livelli massimi e minimi per ROSSO
    low_red = np.array([0, 160, 120])
    up_red = np.array([15, 225, 230])
    
    #definisco le maschere dei tre colori 
    mask1 = cv2.inRange(hsv, low_yellow, up_yellow)
    mask2 = cv2.inRange(hsv, low_green, up_green)
    mask3 = cv2.inRange(hsv, low_red, up_red)
    
        #definisco i contorni della MASK1
    cnts1 = cv2.findContours(mask1, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cnts1 = imutils.grab_contours(cnts1)
    
    #definisco i contorni della MASK2
    cnts2 = cv2.findContours(mask2, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cnts2 = imutils.grab_contours(cnts2)
    
    #definisco i contorni della MASK3
    cnts3 = cv2.findContours(mask3, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cnts3 = imutils.grab_contours(cnts3)
    
    for item in cnts1:
        area1 = cv2.contourArea(item)
        approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
        x = approx.ravel()[0]
        y = approx.ravel()[1]
        
        
        if area1 > 500:
            cv2.drawContours(frame, [approx], -1, (0,255,0), 3)
            
            if len(approx) == 4:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0,255,255), 3)
            if 10 < len(approx) < 20:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0,255,255), 3)
    
    for item in cnts2:
        area2 = cv2.contourArea(item)
        approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
        x = approx.ravel()[0]
        y = approx.ravel()[1]
        
        
        if area2 > 500:
            cv2.drawContours(frame, [approx], -1, (0,255,0), 3)
            
            if len(approx) == 4:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 255, 0), 3)
            if 10 < len(approx) < 20:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 255, 0), 3)
    
    for item in cnts3:
        area3 = cv2.contourArea(item)
        approx = cv2.approxPolyDP(item, 0.01*cv2.arcLength(item, True), True)
        x = approx.ravel()[0]
        y = approx.ravel()[1]
        
        
        if area3 > 500:
            cv2.drawContours(frame, [approx], -1, (0,255,0), 3)
            
            if len(approx) == 4:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 255), 3)
            if 10 < len(approx) < 20:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (0, 0, 255), 3)
            
    #mostro a schermo il video con il detector
    cv2.imshow('Result', frame)
    k = cv2.waitKey(5)
    #se premo 'esc' il programma si interrompe
    if k == 27:
        break
cap.release()
cv2.destroyAllWindows()


        

