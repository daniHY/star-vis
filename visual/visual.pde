Table twi;
import java.util.ArrayList;
ArrayList<Light> fImageInstances = new ArrayList<Light>();

PImage fImage;
String[]names;
String x;
float y;
float size;

float x1;
float y1;

void setup() {
  size(1080, 720, P3D);
  twi=loadTable("data.CSV");
  imageMode(CENTER);
  fImage = loadImage("glow-doto-no-transparent.png");

  for (int i=0; i<twi.getRowCount(); i++) {
    fImageInstances.add(new Light(random(width), random(height), 255, random(2, 32)));
    TableRow row=twi.getRow(i);
    x=row.getString(0);
    println(x);
  }
}

void draw() {
  background(0);
  blendMode(SCREEN);
  tint(255);

  for (int i=0; i<twi.getRowCount(); i++) {
    TableRow row=twi.getRow(i);
    y=row.getFloat(1);
    size=y;
    //println(x, y);
  }
  for (Light p : fImageInstances) {
    tint(p.brightness);
    image(fImage, p.postion.x, p.postion.y, y, y);
    textSize(15);
    for (int i=0; i<twi.getRowCount(); i++) {
      TableRow row=twi.getRow(i);
      x=row.getString(0);
      //text(x, p.postion.x+10, p.postion.y);
      println(x, y);
      noLoop();
    }
  }

  //fill(255);
  textSize(10);
  x1=mouseX;
  y1=mouseY;
  text(x1, mouseX+10, mouseY);
  text(y1, mouseX+10, mouseY+10);
  //noLoop();
}


class Light {
  PVector postion = new PVector();
  float brightness;
  float size;

  Light(float x, float y, float brightness, float size) {
    postion.x = x;
    postion.y = y;
    this.brightness = brightness;
    this.size = size;
  }
} 
