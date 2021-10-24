int x1 = -200;
int x2 = 200;
int x3 = 600;
int x4 = 400;
int x5 = -200;
int x6 = 0;
int x7 = 200;
int x8 = 400;
int x9 = 600;
int x10 = 800;
float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float floor;

Cannon cannon;
ArrayList<Enemy> planes;
ArrayList<Explosion> explosions;
int carInterval = 1000;
int markTime = 0;
boolean debug = true;
color debugColor = color(255, 127, 0);

PImage explosionImg;
PImage img,img02;

void setup(){
  size(800,600,P2D);
  noStroke();
  floor = height;
  cannon = new Cannon(width/2, height - 100);
  planes = new ArrayList<Enemy>();
  explosions = new ArrayList<Explosion>();
  
  img = loadImage("Tank.png");
  img02 = loadImage("enemy.png");
  explosionImg = loadImage("explosion.png");
  explosionImg.resize(256, 256);
  imageMode(CENTER);
  
  
}

void draw(){
  background(30,144,255);
  int t = millis();
  
  fill(246,248,255);
  noStroke();
  ellipse(x4, 150, 100, 100);
  ellipse(x4, 200, 100, 100);
  ellipse(x4-50, 200, 100, 100);
  ellipse(x4+50, 200, 100, 100);
  
  fill(50,205,50);
  noStroke();
  ellipse(x1,400,400,400);
  ellipse(x2,400,400,400);
  ellipse(x3,400,400,400);
  
  fill(0,128,0);
  noStroke();
  ellipse(x5,400,200,200);
  ellipse(x6,400,200,200);
  ellipse(x7,400,200,200);
  ellipse(x8,400,200,200);
  ellipse(x9,400,200,200);
  ellipse(x10,400,200,200);
  
  fill(245,222,179);
  noStroke();
  rect(0,400,800,200);
  
  x4 = x4 + 1;
  if(x4 == 1000){
    x4 = -200;
  }
  if(x1 >= 1000){
    x1 = -200;
  }
  if(x2 >= 1000){
    x2 = -200;
  }
  if(x3 >= 1000){
    x3 = -200;
  }
  if(x5 >= 1000){
    x5 = -200;
  }
   if(x6 >= 1000){
    x6 = -200;
  }
   if(x7 >= 1000){
    x7 = -200;
  }
   if(x8 >= 1000){
    x8 = -200;
  }
   if(x9 >= 1000){
    x9 = -200;
  }
   if(x10 >= 1000){
    x10 = -200;
  }
  x1 = x1 + 2;
  x2 = x2 + 2;
  x3 = x3 + 2;
  x5 = x5 + 4;
  x6 = x6 + 4;
  x7 = x7 + 4;
  x8 = x8 + 4;
  x9 = x9 + 4;
  x10 = x10 + 4;
  
  if (t > markTime + carInterval) {
    planes.add(new Enemy());
    markTime = t;
  }
  
   cannon.run();
   
  for (int i=planes.size()-1; i>=0; i--) {
    Enemy plane = planes.get(i);
    
    if (plane.alive) {
      plane.run();
    } else {
      planes.remove(i);
    }
  }
  
  for (int i=explosions.size()-1; i>=0; i--) {
    Explosion explosion = explosions.get(i);
    
    if (explosion.alive) {
      explosion.run();
    } else {
      explosions.remove(i);
    }
  }
  
  println("Number of bullets: " + cannon.bullets.size());
  
  surface.setTitle("" + frameRate);
}

boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}
