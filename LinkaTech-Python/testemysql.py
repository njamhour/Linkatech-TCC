import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from random import seed
#from random import random
from random import randint
import random
import string
import serial

ser=serial.Serial("/dev/ttyUSB0",9600)
ser.baudrate=9600

#readSerial = ser.readline()
#print(readSerial)

def randomString(stringLenght=8):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLenght))

def InserirValoresNaTabela(inteiro, macaco):

    try:
        conn = mysql.connector.connect( 
            host="localhost",
            user="rushadores",
            password="rushadores@123",
            database="rushadores"
            )
        cursor = conn.cursor()
        mySql_query = "INSERT INTO python_teste (inteiro, macaco) VALUES (%s, %s)"
        record = (inteiro, macaco)
        #cursor = conn.cursor()
        cursor.execute(mySql_query, record)
        conn.commit() 
        #print(cursor.rowcount, "Inserido com sucesso")
        #cursor.close()

    except mysql.connector.Error as error:
        print("Erro {}".format(error))
    
    finally:
        if(conn.is_connected()):
            conn.close()
            print("Conexao finalizada")

#InserirValoresNaTabela(randomString(), randomString())
while 1:
    readSerial = ser.readline()
    print("Inserindo valores:",readSerial,readSerial)
    InserirValoresNaTabela(readSerial, readSerial)
#mycursor = mydb.cursor()
#sql = "INSERT INTO python_teste (inteiro) VALUES (1)"
#mycursor.execute(sql)
#mydb.commit

#print(mycursor.rowcount, "rushadores")
