from multiprocessing import *
import time

from kivy.config import Config

Config.set('graphics', 'resizable', 'False')
Config.set('graphics', 'height', '600')
Config.set('graphics', 'width', '600')

from kivy.app import App

from map import *
from RedCrossCam import *
from I2C import *
from Comunication import *
import cv2


if __name__ == "__main__":
    R,B = Queue(),Queue()
    I2C=I2CDevices()
    Ser=Ser(BlackQueue=B,I2C=I2C)
    cap=cv2.VideoCapture(0)
    cam=Cam(cap)
    camProcess = Process(target=cam.run,args=(R,))
    camProcess.start()
    App = MapApp(R,B,I2C)
    App.run()
