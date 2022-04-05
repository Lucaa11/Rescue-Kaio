import cv2 
vidcap = cv2.VideoCapture(1) 
def getFrame(sec): 
    vidcap.set(cv2.CAP_PROP_POS_MSEC,sec*1000) 
    hasFrames,image = vidcap.read() 
    if hasFrames: 
        cv2.imwrite("frame "+str(sec)+" sec.jpg", image)     # save frame as JPG file 
    return hasFrames 
sec = 0 
frameRate = 0.5#it will capture image in each 0.5 second 
success = getFrame(sec) 
while success: 
    sec = sec + frameRate 
    sec = round(sec, 2) 
    success = getFrame(sec) 