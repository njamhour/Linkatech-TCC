// String data="Hello from Arduino!";
long randNumber;
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

//void loop() {
  // put your main code here, to run repeatedly:
//Serial.println();
//delay(10);
//}

void loop()
{
  int l=2;
  char *j = "test";
  long k = 123456789;
  char s = 'g';
  float f = 2.3;

  Serial.println("test %d %l %c %s %f", l, k, s, j, f);

  delay(5000);

}
