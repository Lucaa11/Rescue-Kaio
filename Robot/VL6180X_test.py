#!/usr/bin/python

""" ST VL6180X ToF range finder program
 - power explorer board with 3.3 V
 - explorer board includes pull-ups on i2c """

import sys
from ST_VL6180X import VL6180Xs
from time import sleep
import RPi.GPIO as GPIO  # Import GPIO functions

"""-- Setup --"""
debug = False
if len(sys.argv) > 1:
    if sys.argv[1] == "debug":  # sys.argv[0] is the filename
        debug = True
sensors=VL6180Xs(numSens=5)
for sensor in sensors.tof_sensor:
    if sensor.idModel != 0xB4:
        print("Not a valid sensor id: %X" % sensor.idModel)
    else:
        print("Sensor model: %X" % sensor.idModel)
        print("Sensor model rev.: %d.%d" % \
             (sensor.idModelRevMajor, sensor.idModelRevMinor))
        print("Sensor module rev.: %d.%d" % \
             (sensor.idModuleRevMajor, sensor.idModuleRevMinor))
        print("Sensor date/time: %X/%X" % (sensor.idDate, sensor.idTime))
    sensor.default_settings()


"""-- MAIN LOOP --"""
while True:
    for sensor in sensors.tof_sensor:
        print ("Distance measured by "+str(hex(sensor.get_register(0x0212)))+" is : %d mm" % sensor.get_distance())
    sleep(2)
