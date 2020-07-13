import serial
import time
#import split
try:
    ser = serial.Serial(
            port='/dev/ttyUSB0', 
            baudrate=9600,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS,
            timeout=5
            )
except IOError:
    print("Falha\n")

while 1:
    x=ser.readline()
    t = x.split()
    #print(x)
    print(t[0], t[2], t[4])


#ser=serial.Serial("/dev/ttyACM0",9600)
#ser.baudrate=9600

#LerSerial = ser.readline()

#while True:
#    ser=serial.Serial("/dev/ttyACM0", 9600, timeout=1)
#    ser.baudrate=9600
#    parity=serial.PARITY_NONE
#    stopbits=serial.STOPBITS_ONE
#    bytesize=serial.EIGHTBITS
#    #ser.open()
#    LerSerial = ser.readline()
#    print(LerSerial)
#    #ser.close()
