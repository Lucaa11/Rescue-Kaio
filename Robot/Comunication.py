import serial
import time


def 
if __name__ == '__main__':
    #ser = [serial.Serial('/dev/ttyUSB0', 1000000, timeout = 1),serial.Serial('/dev/ttyUSB2', 1000000, timeout = 1),serial.Serial('/dev/ttyACM1', 1000000, timeout = 1)]
    ser = [serial.Serial('/dev/ttyUSB0', 1000000, timeout = 1),serial.Serial('/dev/ttyUSB1', 1000000, timeout = 1)]
    ser[0].reset_input_buffer()
    ser[1].reset_input_buffer()
    #ser1.reset_input_buffer()
    while (not(ser[0].readline().decode('utf-8').rstrip()) or not(ser[1].readline().decode('utf-8').rstrip())):
            pass
    while True:
        ser[0].write(b'10e')
        ser[1].write(b'10e')
        
        #line = ser[0].readline().decode('utf-8').rstrip()
        #line1 = ser[1].readline().decode('utf-8').rstrip()
        
        #print(line)
        time.sleep(3)
        
        ser[0].write(b'00e')
        ser[1].write(b'00e')
        
        #line = ser[0].readline().decode('utf-8').rstrip()
        #line1 = ser[1].readline().decode('utf-8').rstrip()
        
        #print(line)
        time.sleep(3)