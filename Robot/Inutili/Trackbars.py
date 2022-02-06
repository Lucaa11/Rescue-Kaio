import cv2
import numpy as np

def nothing(x):
    #qualunque operazione, non fa nulla
    pass

cap = cv2.VideoCapture(0)
cv2.namedWindow('Trackbars')

cv2.createTrackbar('L - H', 'Trackbars', 0, 360, nothing)
cv2.createTrackbar('L - S', 'Trackbars', 0, 100, nothing)
cv2.createTrackbar('L - V', 'Trackbars', 0, 100, nothing)
cv2.createTrackbar('U - H', 'Trackbars', 0, 360, nothing)
cv2.createTrackbar('U - S', 'Trackbars', 0, 100, nothing)
cv2.createTrackbar('U - V', 'Trackbars', 0, 100, nothing)


while True:
    ret, frame = cap.read()
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    l_h = cv2.getTrackbarPos('L - H', 'Trackbars')
    l_s = cv2.getTrackbarPos('L - S', 'Trackbars')
    l_v = cv2.getTrackbarPos('L - V', 'Trackbars')
    u_h = cv2.getTrackbarPos('U - H', 'Trackbars')
    u_s = cv2.getTrackbarPos('U - S', 'Trackbars')
    u_v = cv2.getTrackbarPos('U - V', 'Trackbars')

    low_black = np.array([l_h, l_s, l_v])
    up_black = np.array([u_h, u_s, u_v])
    mask_B = cv2.inRange(hsv, low_black, up_black)
    
    
    cv2.imshow('Frame', frame)
    cv2.imshow('Mask', mask_B)
    if cv2.waitKey(1) == 27:
        print(l_h)
        print(l_s)
        print(l_v)
        print(u_h)
        print(u_s)
        print(u_v)
        break
cap.release()
cv2.destroyAllWindows()