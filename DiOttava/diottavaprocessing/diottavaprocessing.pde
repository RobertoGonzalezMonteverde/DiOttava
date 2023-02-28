import processing.serial.*;

Serial myPort;

int x1= 720;
int y1= 480;

color off = color(128,64,0);
color on = color(84, 145, 158);
int A0 = 9;

int[] separation = {1,1,0,1,1,1};

int[] values = { 0, 0, 0, 0, 0, 0, 0, 0 };
int[] values_negros = { 0, 0, 0, 0, 0 ,0};

PImage img;

void setup() {
  size(720, 480);
  img = loadImage("di ottava.png");
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(off);
  stroke(on);
  
  image(img, 0, 0);
  
  for (int i = 0; i <= 7; i++) {
    if (values[i] == 1)
      fill(167,130,93);
    else
      fill(207,185,151);
      
    rect((40 + i * 20)*3, 125, 60, 300, 20);
  }
  
  for (int i = 0; i <= 5; i++) {
  if (values_negros[i] == 1)
      fill(on);
    else
      fill(0);
  if (separation[i] == 1)
  {rect(3*(55 + i * 20), 125, 30, 150);
  }
  }
  
}

void keyPressed()
{
  ////teclas blancas
  if (key == 'A' || key == 'a'){
    values[0] = 1;
    myPort.write("A");
   }
   if (key == 'S' || key == 's'){
    values[1] = 1;
    myPort.write("S");
   }
   if (key == 'D' || key == 'd'){
    values[2] = 1;
    myPort.write("D");
   }
   if (key == 'F' || key == 'f'){
    values[3] = 1;
    myPort.write("F");
   }
   if (key == 'G' || key == 'g'){
    values[4] = 1;
    myPort.write("G");
   }
   if (key == 'H' || key == 'h'){
    values[5] = 1;
    myPort.write("H");
   }
   if (key == 'J' || key == 'j'){
    values[6] = 1;
    myPort.write("J");
   }
   if (key == 'K' || key == 'k'){
    values[7] = 1;
    myPort.write("K");
   }
   
   
   ////NEGRAS
   if (key == 'W' || key == 'w'){
    values_negros[0] = 1;
    myPort.write("W");
   }
   if (key == 'E' || key == 'e'){
    values_negros[1] = 1;
    myPort.write("E");
   }
   if (key == 'T' || key == 't'){
    values_negros[3] = 1;
    myPort.write("T");
   }
   if (key == 'Y' || key == 'y'){
    values_negros[4] = 1;
    myPort.write("Y");
   }
   if (key == 'U' || key == 'u'){
    values_negros[5] = 1;
    myPort.write("U");
   }
   
   //Octavas
   if (key == 'V' || key == 'v'){
    myPort.write("v");
   }
   if (key == 'B' || key == 'b'){
    myPort.write("b");
   }
   if (key == 'N' || key == 'n'){
    myPort.write("n");
   }
   if (key == 'M' || key == 'm'){
    myPort.write("m");
   }
}

void keyReleased()
{
  ////teclas blancas
  if (key == 'A' || key == 'a'){
    values[0] = 0;
    myPort.write("=");
   }
   if (key == 'S' || key == 's'){
    values[1] = 0;
    myPort.write("=");
   }
   if (key == 'D' || key == 'd'){
    values[2] = 0;
    myPort.write("=");
   }
   if (key == 'F' || key == 'f'){
    values[3] = 0;
    myPort.write("=");
   }
   if (key == 'G' || key == 'g'){
    values[4] = 0;
    myPort.write("=");
   }
   if (key == 'H' || key == 'h'){
    values[5] = 0;
    myPort.write("=");
   }
   if (key == 'J' || key == 'j'){
    values[6] = 0;
    myPort.write("=");
   }
   if (key == 'K' || key == 'k'){
    values[7] = 0;
    myPort.write("=");
   }
   
   
   ////NEGRAS
   if (key == 'W' || key == 'w'){
    values_negros[0] = 0;
    myPort.write("=");
   }
   if (key == 'E' || key == 'e'){
    values_negros[1] = 0;
    myPort.write("=");
   }
   if (key == 'T' || key == 't'){
    values_negros[3] = 0;
    myPort.write("=");
   }
   if (key == 'Y' || key == 'y'){
    values_negros[4] = 0;
    myPort.write("=");
   }
   if (key == 'U' || key == 'u'){
    values_negros[5] =0;
    myPort.write("=");
   }
   
   //Octavas
      if (key == 'V' || key == 'v'){
    myPort.write("=");
   }
   if (key == 'B' || key == 'b'){
    myPort.write("=");
   }
   if (key == 'N' || key == 'n'){
    myPort.write("=");
   }
   if (key == 'M' || key == 'm'){
    myPort.write("=");
   }
}
