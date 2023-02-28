int val = 0; // Data received from the serial port
int speaker = 8; // Refers to PIN 8 where we have our speaker
int ottava = 0; // Refers to the octave we're in
int o1 = 4;  // Pins to show the first octave
int o2 = 5;  // Pins to show the second octave
int o3 = 6;  // Pins to show the third octave
int o4 = 7;  // Pins to show the fourth octave

void setup() {
  
  // Set the speaker's PIN as output
  pinMode(speaker, OUTPUT);
  
  // Set the different pins to show the octave
  pinMode(o1, OUTPUT);      
  pinMode(o2, OUTPUT);
  pinMode(o3, OUTPUT);
  pinMode(o4, OUTPUT);

  // Start serial communication at 9600 bps
  Serial.begin(9600);

}

void loop() {
   if (Serial.available()) 
   { // If data is available to read,
     val = Serial.read(); // read it and store it in val
   }

   //We receive a "=" symbol that means silence (ASCII value 61)
   
   if(val == 61){
    noTone(speaker);
   }

   //We receive a symbol that refers to an octave change
   
   if(val == 118){ // v = octave 1
     ottava = 0;
     digitalWrite(o1, HIGH);
     digitalWrite(o2, LOW);
     digitalWrite(o3, LOW);
     digitalWrite(o4, LOW);
   }
   if(val == 98){ // b = octave 2
     ottava = 1;
     digitalWrite(o1, HIGH);
     digitalWrite(o2, HIGH);
     digitalWrite(o3, LOW);
     digitalWrite(o4, LOW);
   }
   if(val == 110){ // n = octave 3
     ottava = 2;
     digitalWrite(o1, HIGH);
     digitalWrite(o2, HIGH);
     digitalWrite(o3, HIGH);
     digitalWrite(o4, LOW);
   }
   if(val == 109){ // m = octave 4
     ottava = 3;
     digitalWrite(o1, HIGH);
     digitalWrite(o2, HIGH);
     digitalWrite(o3, HIGH);
     digitalWrite(o4, HIGH);
   }
   

   //We receive a value that has a meaning in frequency (Hz)

   //White keys
   
   if(val == 65){
    tone(speaker, 65*pow(2,ottava)); //A = Do
   }
   if(val == 83){
    tone(speaker, 73*pow(2,ottava)); //S = Re
   }
   if(val == 68){
    tone(speaker, 82*pow(2,ottava)); //D = Mi
   }
   if(val == 70){
    tone(speaker, 87*pow(2,ottava)); //F = Fa
   }
   if(val == 71){
    tone(speaker, 98*pow(2,ottava)); //G = Sol
   }
   if(val == 72){
    tone(speaker, 110*pow(2,ottava)); //H = La
   }
   if(val == 74){
    tone(speaker, 123*pow(2,ottava)); //J = Si
   }
   if(val == 75){
    tone(speaker, 131*pow(2,ottava)); //K = Do2
   }

   //Black keys
   
   if(val == 87){
    tone(speaker, 69*pow(2,ottava)); //W = Do#
   }
   if(val == 69){
    tone(speaker, 78*pow(2,ottava)); //E = Re#
   }
   if(val == 84){
    tone(speaker, 93*pow(2,ottava)); //T = Fa#
   }
   if(val == 89){
    tone(speaker, 104*pow(2,ottava)); //Y = G#
   }
   if(val == 85){
    tone(speaker, 117*pow(2,ottava)); //U = A#
   }
}
