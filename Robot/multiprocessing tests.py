from multiprocessing import *
import time

from kivy.config import Config

Config.set('graphics', 'resizable', 'False')
Config.set('graphics', 'height', '600')
Config.set('graphics', 'width', '600')

from kivy.app import App

from map import *
from RedCrossCam import *
import cv2


if __name__ == "__main__":
    Q = Queue()
    cap=cv2.VideoCapture(0)
    cam=Cam(cap)
    camProcess = Process(target=cam.run,args=(Q,))
    camProcess.start()
    App = MapApp(Q)
    App.run()
