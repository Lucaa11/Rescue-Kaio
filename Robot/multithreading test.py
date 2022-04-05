#!/usr/bin/python
import threading
import time
from I2C import *
class Gyro (threading.Thread):
   def __init__(self):
      threading.Thread.__init__(self)
   def run(self):
      sensors.bno.stampa()
class ToF(threading.Thread):
    def __init__(self, n):
        threading.Thread.__init__(self)
    def run(self):
        pass
sensors=initialization()
gyro=Gyro()
gyro.start()

while True:
    pass

