from multiprocessing import *
import time

class Caio():
    def __init__(self):
        self.i=0
    def ciao(self,q):
        while True:
            q.put(str(self.i))
            time.sleep(1)
            self.i+=1