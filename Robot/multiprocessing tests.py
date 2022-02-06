from multiprocessing import *
import time
from multiprocessingtests2 import Caio


if __name__ == "__main__":
    Q = Queue()
    C=Caio()
    p = Process(target=C.ciao, args=(Q,))
    p.start()
    while True:
        print(Q.get())