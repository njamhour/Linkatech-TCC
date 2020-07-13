import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
import serial

## Iniciando a conexão serial

ser = serial.Serial("/dev/ttyUSB0, 9600")
ser.baudrate = 9600

## Funcao para inserir no banco de dados

def InserirValores(cliente, piezo1, piezo2, piezo3):

    try: conn = mysql.connector.connect(
            host="localhost",
            user="rushadores",
            password="rushadores@123",
            database="rushadores"
            )

        cursor = conn.cursor()
        mysql_query = "INSERT INTO piezo_sensores_teste (cliente, piezo1, piezo2, piezo3) VALUES (%s, %s, %s, %s)"
        record = (cliente, piezo1, piezo2, piezo3)

        cursor.execute(mysql_query, record)
        conn.commit()

    except mysql.connector.Error as error:
        print("Erro {}".format(error))

    finally:
        if(conn.is_connected()):
            conn.close()
            print("Fechando conexao")

## Loop para ler/escrever os dados

while 1:
    readSerial = ser.readLine()
    print("Inserindo valores:", cliente, piezo1, piezo2, piezo3)
    InserirValores()

