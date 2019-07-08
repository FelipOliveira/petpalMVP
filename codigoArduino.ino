//Definindo as bibliotecas
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

//Definindo SSID e senha do Wi-fi
const char* ssid = "IBMHackatruckIoT";
const char* password = "IOT2017IBM";

//Definindo o led de sinalização de conexão
#define LED_BUILTIN D4

//Definindo os valores de org, device type, device id e token
#define ORG "o9htlk"
#define DEVICE_TYPE "sensor_cardiaco"
#define DEVICE_ID "scpetpal"
#define TOKEN "petpal04"

//Definindo o MessageSight broker server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;

WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);

//Inicializando as variáveis
int UpperThreshold = 518;
int LowerThreshold = 490;
int reading = 0;
float BPM = 0.0;
bool IgnoreReading = false;
bool FirstPulseDetected = false;
unsigned long FirstPulseTime = 0;
unsigned long SecondPulseTime = 0;
unsigned long PulseInterval = 0;


void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.println("Iniciando...");
  Serial.print("Conectando na rede WiFi "); Serial.print(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("[INFO] Conectado WiFi IP: ");
  Serial.println(WiFi.localIP());
  pinMode(LED_BUILTIN, OUTPUT);
}


float calculaBPM(void) {
  reading = analogRead(0); 
  if(reading > UpperThreshold && IgnoreReading == false){
    if(FirstPulseDetected == false){
      FirstPulseTime = millis();
      FirstPulseDetected = true;
    }
    else{
      SecondPulseTime = millis();
      PulseInterval = SecondPulseTime - FirstPulseTime;
      FirstPulseTime = SecondPulseTime;
    }
    IgnoreReading = true;
  }
  if(reading < LowerThreshold){
    IgnoreReading = false;
  }  
  BPM = (1.0/PulseInterval) * 60.0 * 10000;
  return BPM;
}


void loop() {
  if (!!!client.connected()) {
    Serial.print("Reconnecting client to ");
    Serial.println(server);
    while (!!!client.connect(clientId, authMethod, token)){
      Serial.print(".");
      delay(500);
    }
    Serial.println();
  }
  float bpm = calculaBPM();
  
  // Conversao Floats para Strings
  // Array de character temporario
  char TempString[32];  

  // dtostrf( [Float variable] , [Minimum SizeBeforePoint] , [sizeAfterPoint] , [WhereToStoreIt] )
  dtostrf(bpm, 2, 1, TempString);
  String bpmstr =  String(TempString);

  // Prepara JSON para IoT Platform
  int length = 0;
  String payload = "{\"BPM\":\"" + bpmstr + "\"}";
  Serial.print("Sending payload: ");
  Serial.println(payload);

  if (client.publish(topic, (char*) payload.c_str())){
    Serial.println("Publish ok");
    digitalWrite(LED_BUILTIN, LOW);
    delay(500);
    digitalWrite(LED_BUILTIN, HIGH);
    delay(500);
  }
  else{
    Serial.println("Publish failed");
    Serial.println(client.state());
  }
}
