Table twi;
ArrayList<Light> fImageInstances = new ArrayList<Light>();
PImage fImage;

void setup() {
  size(1080, 720, P3D);
  twi=loadTable("data.CSV", "header");
  imageMode(CENTER);
  fImage = loadImage("glow-doto-no-transparent.png");
}

void draw() {
  background(0);
  blendMode(SCREEN);

  for (int i=0; i<twi.getRowCount(); i++) {
    TableRow row=twi.getRow(i);

    String x=row.getString(0);
    float y=row.getFloat(1);
    float size=y*0.5;
    fImageInstances.add(new Light(random(width), random(height), size, size));
    println(x, y);
    for (Light p : fImageInstances) {
      tint(p.brightness);
      image(fImage, p.postion.x, p.postion.y, size, size);
      textSize(20);
      text(x,p.postion.x,p.postion.y);
      noLoop();
    }
  }
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
