#!/usr/bin/python
import threading
import time
from multithreadingtest2 import Caio
from BNO055 import *
class Gyro (threading.Thread):
   def __init__(self):
      threading.Thread.__init__(self)
   def run(self):
      bno = BNO055()
      if bno.begin() is not True:
          print("Error initializing device")
          exit()
      bno.setExternalCrystalUse(True)
      bno.stampa()

gyro=Gyro()
gyro.start()

