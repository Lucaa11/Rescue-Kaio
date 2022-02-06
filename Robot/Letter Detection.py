import cv2
import numpy as np
import imutils

    

#setto i livelli massimi e minimi per GIALLO
low_yellow = np.array([18, 130, 95])
up_yellow = np.array([40, 255, 255])
    
#setto i livelli massimi e minimi per VERDE
low_green = np.array([40, 90, 35])
up_green = np.array([100, 240, 200])
    
#setto i livelli massimi e minimi per ROSSO
low_red = np.array([0, 160, 120])
up_red = np.array([15, 225, 230])

#setto i livelli massimi e minimi per NERO
low_black = np.array([0, 0, 0])
up_black = np.array([205, 85, 76])
    
cap = cv2.VideoCapture(0)
j=0
i=1
isCornerBlack=[False,False,False,False]

while True:
    k = cv2.waitKey(1)
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    mask_B = cv2.inRange(hsv, low_black, up_black)
    cnts_B = cv2.findContours(mask_B, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cnts_B = imutils.grab_contours(cnts_B)
    
    for item in cnts_B:
        area = cv2.contourArea(item)
        if area > 500:
            cv2.drawContours(frame, [item], -1, (0,255,0), 3)
            x, y, w, h = cv2.boundingRect(item)
            cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 3)
            Xc = int(x + (w/2))
            cv2.rectangle(frame, (x+10,y+10), (x+20,y+20), (0, 0, 255),2)
            cv2.rectangle(frame, (x+10,y+h-20), (x+20,y+h-10), (0, 0, 255),2)
            cv2.rectangle(frame, (x+w-20,y+10), (x+w-10,y+20), (0, 0, 255),2)
            cv2.rectangle(frame, (x+w-20,y+h-20), (x+w-10,y+h-10), (0, 0, 255),2)
    #                 print(type(Xc))
    #                 print(type(Yc))
                #for i in range(10):
                 #   for i2 in range(10):
                  #      for i3 in range(10):
                   #         if (frame[Xc, Yc] == np.array([i, i2, i3])).all():
                #                         and (frame[Xc, Yc] == ex2) and (frame[Xc, Yc +1] == ex2)
                    #            print('TROVATO!!')
                     #           break

#             Xcenter = int(x + w/2)
#             center = (Xcenter, y)
#             print(type(center))
#             print(type(Xcenter))
#             cv2.circle(frame, center, 7, (255, 255, 255), -1)
#             print(area)
            Corners=[frame[(y+10):(y+20),(x+10):(x+20)], frame[(y+10):(y+20),(x+w-20):(x+w-10)], frame[(y+h-20):(y+h-10),(x+10):(x+20)],  frame[(y+h-20):(y+h-10),(x+w-20):(x+w-10)]]
    
    if k == ord('t'):
        for cornerIndex in range(4):
            j=0
            i=1
            for Y in Corners[cornerIndex]:
                for color in Y:
                    if color[0]>0:
                        
                        j+=color[0]
                        i+=1
            if (j/i) < 50:
                isCornerBlack[cornerIndex]=True
            
        if(isCornerBlack[0] or isCornerBlack[1]):
            if(isCornerBlack[2] or isCornerBlack[3]):
                print("H")
            else:
                print("U")
        else:
            print("S")
        isCornerBlack=[False,False,False,False]
        
#        for item in range(y, (y + h)):
                
#            Yc = int(item)
#            ex2 = (255, 255, 80)
#            print(str(frame[Xc, Yc]))

#     mask_B = cv2.inRange(frame, low_black, up_black)
#     cnts_B = cv2.findContours(mask_B, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
#     for item in cnts_B:
#         area  = cv2.contourArea(cnts_B)
        
#     frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
#     blur_frame = cv2.GaussianBlur(frame_gray, (7, 7), 0)
# 
#     _, threshold = cv2.threshold(frame, 155, 255, cv2.THRESH_BINARY)
# 
#     mean_c = cv2.adaptiveThreshold(mask_B, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 15, 12)
#     gaus = cv2.adaptiveThreshold(mask_B, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 91, 12)
#     
#     x, y, w, h = cv2.boundingRect(gaus)
#     cv2.rectangle(frame,(x,y),(x+w,y+h),(255,0,0),3)

   
    
    
    cv2.imshow('Frame', frame)
    cv2.imshow('Mask', mask_B)

    if k == 27:
        break
cap.release()
cv2.destroyAllWindows()
    

