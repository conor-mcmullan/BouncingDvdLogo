// Bouncing DVD Logo


// ***** VARIABLE DECLARATIONS ***** \\
int minColor = 100;
int maxColor = 255;

int minSpeed = 1;
int maxSpeed = 5; 

int xspeed, yspeed;
float x, y, r, g, b;
PImage dvd;


// ***** METHODS ***** \\

void setup() {
  fullScreen();  
  // size(400, 400);
  dvd = loadImage("dvd_logo.png");
  float xy[] = randomXYStart(dvd);
  x = xy[0]; y = xy[1]; 
  
  xspeed = int(random(minSpeed, maxSpeed));
  yspeed = int(random(minSpeed, maxSpeed));
  pickColor();
}

float getRandomCanvasX(PImage dvd){
  return random(width-dvd.width);
}

float getRandomCanvasY(PImage dvd){
  return random(height-dvd.height);
}

float[] randomXYStart(PImage dvd){
  float randomX = getRandomCanvasX(dvd);
  float randomY = getRandomCanvasY(dvd);
  boolean invalid = detectCornerHit(dvd, randomX, randomY);
  if (invalid){
    while (invalid){
      // regenerate new random combo until it wont end on iter 0
      randomX = getRandomCanvasX(dvd);
      randomY = getRandomCanvasY(dvd);
      invalid = detectCornerHit(dvd, randomX, randomY);
    }
  }
  
  println("start x:\t", randomX);
  println("start y:\t", randomY);
  
return new float[]{randomX, randomY};
}


float randomColor(){
  return random(minColor, maxColor);
}

float[] randomRGB(){
  return new float[] {randomColor(), randomColor(), randomColor()};
}

void pickColor() {
  r = randomColor(); g = randomColor(); b = randomColor();
}

void draw() {
  background(0);
  tint(r, g, b);
  image(dvd, x, y);
  
  if (detectCornerHit(dvd, x, y)){
    stop();
    dosomethingcool();  
  }
  else{ 
    x = x + xspeed;
    y = y + yspeed;      
    changeDirection(x, y);
  }
}

void changeDirection(float x, float y){
  changeXDirection(x);
  changeYDirection(y);
}

void changeXDirection(float x){
if (x + dvd.width >= width) {
    xspeed = -xspeed;
    x = width - dvd.width;
    pickColor();
  } else if (x <= 0) {
    xspeed = -xspeed;
    x = 0;
    pickColor();
  }
}

void changeYDirection(float y){
  if (y + dvd.height >= height) {
    yspeed = -yspeed;
    y = height - dvd.height;
    pickColor();
  } else if (y <= 0) {
    yspeed = -yspeed;
    y = 0;
    pickColor();
  }
}

boolean detectCornerHit(PImage dvd, float x, float y){
  // println("\n\nCorner Co-Ordinates:");
  // println("TOP LEFT\n", "\tx=", 0, "\ty=", 0);
  // println("TOP RIGHT\n", "\tx=", int(width-dvd.width), "\ty=", 0);
  // println("BOTTOM RIGHT\n", "\tx=", int(width-dvd.width), "\ty=", int(height-dvd.height));
  // println("BOTTOM LEFT\n", "\tx=", 0, "\ty=", int(height-dvd.height));
  return ((x==0 && y==0) || (x==int(width-dvd.width) && y==0)  ||
          (x==int(width-dvd.width) && y==int(height-dvd.height)) ||
          (x==0 && y==int(height-dvd.height)));
}

void dosomethingcool(){
  print("something cool is gonna happen now");
}
