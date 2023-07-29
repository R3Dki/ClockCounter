long sumCount = 0, prevTime = 0;
int delta = 0;
float frequency;

void setup() {
  Serial.begin(9600);
}

void loop() {
  if (delta < 1000) {
    sumCount++;
  }else{
    frequency = sumCount*0.000053333;
    Serial.println("CPU Clock Frequency: " + (String)frequency + "MHz");
    sumCount = 0;
    prevTime = millis();
  }
  delta = millis()-prevTime;
}
