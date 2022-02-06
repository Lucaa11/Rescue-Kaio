import time
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(8,GPIO.OUT)
while True: 
    GPIO.output(8,GPIO.LOW)
    time.sleep(1)
    #GPIO.output(8,GPIO.HIGH)
    time.sleep(1)
    