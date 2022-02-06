import cv2
import numpy as np
import imutils

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    low_red = np.array([0, 50, 0])
    up_red = np.array([5, 255, 255])
    
    mask3 = cv2.inRange(hsv, low_red, up_red)
    kernel = np.ones((5, 5), np.uint8)
    mask3 = cv2.erode(mask3, kernel)
    
    cnts3 = cv2.findContours(mask3, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    cnts3 = imutils.grab_contours(cnts3)

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
                cv2.putText(frame, 'Rectangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255,255,255), 3)
            if len(approx) == 3:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Triangle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255,255,255), 3)
            if len(approx) == 6:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Hexagon', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255,255,255), 3)
            if 10 < len(approx) < 20:
                M = cv2.moments(item)
                itemx = int(M['m10']/M['m00'])
                itemy = int(M['m01']/M['m00'])
                cv2.circle(frame, (itemx,itemy), 7, (255,255,255), -1)
                cv2.putText(frame, 'Circle', (itemx-20, itemy-20), cv2.FONT_HERSHEY_SIMPLEX, 1.5, (255,255,255), 3)
                
                
    
    cv2.imshow('frame', frame)
    key = cv2.waitKey(1)
    if key ==27:
        break
cap.release()
cv2.destroyAllWindows()