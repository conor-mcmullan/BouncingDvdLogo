// Bouncing DVD Logo

float x;
float y;

int speed = 50;
int xspeed;
int yspeed;

PImage dvd;

float r, g, b;

void setup() {
  fullScreen();  
  // size(400, 400);
  dvd = loadImage("dvd_logo.png");
  x = random(width);
  
  y = random(height);
  xspeed = speed;
  yspeed = speed;
  pickColor();
}

void pickColor() {
  r = random(100, 256);
  g = random(100, 256);
  b = random(100, 256);
}

void draw() {
  background(0);
  tint(r, g, b);
  image(dvd, x, y);

  x = x + xspeed;
  y = y + yspeed;

  if (x + dvd.width >= width) {
    xspeed = -xspeed;
    x = width - dvd.width;
    pickColor();
  } else if (x <= 0) {
    xspeed = -xspeed;
    x = 0;
    pickColor();
  }

  if (y + dvd.height >= height) {
    yspeed = -yspeed;
    y = height - dvd.height;
    pickColor();
  } else if (y <= 0) {
    yspeed = -yspeed;
    y = 0;
    pickColor();
  }
  
  detectHit(dvd, x, y);
  
}


boolean detectHit(PImage dvd, float x, float y){
  boolean hit = false;

  println("\n");
  println("height", int(height));
  println("width", int(width));
  println("height", int(dvd.height));
  println("width", int(dvd.width));
  println("x", int(x));
  println("y", int(y));

  
  println("width-dvd.width", width-dvd.width);
  println("height-dvd.height", height-dvd.height);
  

  if (
      (x==0 && y==0) || 
      (x==int(width-dvd.width) && y==height)  ||
      (x==int(width-dvd.width) && y==int(height-dvd.height)) ||
      (x==0 && y==int(height-dvd.height))
  ){
    println("HIT");
    println(x, y);
    stop();  
  }


  return hit;
}
