const int piezoPin1 = A5;
const int piezoPin2 = A4;
const int piezoPin3 = A3;
const int piezoPin4 = A2;
const int piezoPin5 = A1;

const int ledPin1 = 6;
const int ledPin2 = 5;
const int ledPin3 = 4;
const int ledPin4 = 3;
const int ledPin5 = 2;

int batida = 40;
int sensorValor1 = 0;
int sensorValor2 = 0;
int sensorValor3 = 0;
int sensorValor4 = 0;
int sensorValor5 = 0;

int brilhoLed1 = 0;
int brilhoLed2 = 0;
int brilhoLed3 = 0;
int brilhoLed4 = 0;
int brilhoLed5 = 0;

int flag = 0;
int posicao = 0;
int validafrontal = 0;
int validatraseira = 0;


void setup() {
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  sensorValor1 = analogRead(piezoPin1);
  sensorValor2 = analogRead(piezoPin2);
  sensorValor3 = analogRead(piezoPin3);
  sensorValor4 = analogRead(piezoPin4);
  sensorValor5 = analogRead(piezoPin5);
   

#Frontal

if (sensorValor1 = batida) {
    brilhoLed1 = 255;
    posicao = 1;
    validafrontal = 1;
    analogWrite(ledPin1, brilhoLed1 );
    delay(500);
  }
 if ((flag == 0) && (sensorValor3 = batida) && (posicao == 1)) {
    flag = 1;
    brilhoLed3 = 255;
    analogWrite(ledPin3, brilhoLed3 );
  
  while (flag == 1) {
    sensorValor4 = analogRead(piezoPin4);
    sensorValor5 = analogRead(piezoPin5);
    
      if (sensorValor4 = batida){
    brilhoLed4 = 255;
    posicao=0;
    validafrontal = 0;
    analogWrite(ledPin4, brilhoLed4 );
    Serial.println(Pisada Frontal e Neutra);
    flag = 2;
    delay(500);
      }
    if (sensorValor5 = batida){
    brilhoLed5 = 255;
    posicao=0;
    validafrontal = 0;
    analogWrite(ledPin5, brilhoLed5 );
    Serial.println(Pisada Frontal e Pronada);
    flag = 3;
    delay(500);
      }  
    }
  }

if ((flag == 0) && (sensorValor4 = batida) && (posicao == 1)) {
    brilhoLed4 = 255;
    analogWrite(ledPin4, brilhoLed4 );
    flag = 6;
    posicao = 0;
    Serial.println(Pisada Frontal e Supinada); 
    delay(500); 
}

#Traseira  

 if (sensorValor5 = batida) {
    posicao = 2;
    brilhoLed5 = 255;
    validatraseira = 1;
    analogWrite(ledPin5, brilhoLed5 );
    delay(500);
  }
  
 if ((flag == 0) && (sensorValor4 = batida) && (posicao == 2)) {
    flag = 1;
    brilhoLed4 = 255;
    analogWrite(ledPin4, brilhoLed4 );
  
  while (flag == 1) {
    sensorValor3 = analogRead(piezoPin3);
    sensorValor2 = analogRead(piezoPin2);
    
      if (sensorValor3 = batida){
    brilhoLed3 = 255;
    posicao=0;
    validatraseira = 0;
    analogWrite(ledPin3, brilhoLed3 );
    Serial.println(Pisada Traseira e Neutra);
    flag = 4;
    delay(500);
      }
    if (sensorValor2 = batida){
    brilhoLed2 = 255;
    posicao=0;
    analogWrite(ledPin2, brilhoLed2 );
    Serial.println(Pisada Traseira e Supinada);
    flag = 5;
    validatraseira = 0;
    delay(500);
      }    
    }
  }

if ((flag == 0) && (sensorValor3 = batida) && (posicao == 2)) {
    brilhoLed3 = 255;
    analogWrite(ledPin3, brilhoLed3 );
    flag = 1;
    posicao = 0;
    Serial.println(Pisada Traseira e Pronada); 
    delay(500); 
}

#Inexistente 

if ((flag==0)&&  ((validatraseira == 1) && ((sensorValor1 = batida)(validafrontal == 1) && (sensorValor5 = batida)))) {
    brilhoLed1 = 0;
    brilhoLed5 = 0;
    analogWrite(ledPin1, brilhoLed1 );
    analogWrite(ledPin5, brilhoLed5 );
    flag = 0;
    posicao = 0;
    validafrontal = 0;
    validatraseira = 0;
    Serial.println(Pisada Inexistente); 
    delay(500); 
}
Apagar Leds
if ((sensorValor1  batida) && (sensorValor3   batida)&&((sensorValor4   batida) && (flag == 2))((sensorValor5   batida) && (flag == 3))) {
    flag = 0;
    brilhoLed1 = 0;
    brilhoLed3 = 0;
    brilhoLed4 = 0;
    brilhoLed5 = 0;
    validatraseira = 0;
    analogWrite(ledPin1, brilhoLed1);
    analogWrite(ledPin3, brilhoLed3);
    analogWrite(ledPin4, brilhoLed4);
    analogWrite(ledPin5, brilhoLed5);
  }
if ((sensorValor1  batida) && (sensorValor4   batida) && (flag == 6)) {
    flag = 0;
    brilhoLed1 = 0;
    brilhoLed4 = 0;
    validafrontal = 0;
    analogWrite(ledPin1, brilhoLed1);
    analogWrite(ledPin4, brilhoLed4);
  }

if ((sensorValor5  batida) && (sensorValor4   batida)&&((sensorValor3   batida) && (flag == 4))((sensorValor2   batida) && (flag == 5))) {
    flag = 0;
    brilhoLed2 = 0;
    brilhoLed3 = 0;
    brilhoLed4 = 0;
    brilhoLed5 = 0;
    analogWrite(ledPin2, brilhoLed2);
    analogWrite(ledPin3, brilhoLed3);
    analogWrite(ledPin4, brilhoLed4);
    analogWrite(ledPin5, brilhoLed5);
  }
if ((sensorValor5  batida) && (sensorValor3   batida) && (flag == 1)) {
    flag = 0;
    brilhoLed3 = 0;
    brilhoLed5 = 0;
    validatraseira = 0;
    analogWrite(ledPin3, brilhoLed3);
    analogWrite(ledPin5, brilhoLed5);
  } 
}
