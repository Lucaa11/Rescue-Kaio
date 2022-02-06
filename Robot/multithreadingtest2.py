import time
class Caio():
    def __init__(self,n):
        self.n=n
        self.caio()
    def caio(self):
        while True:
            print('caio'+ self.n)
            time.sleep(1)
        