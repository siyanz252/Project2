class Cannon {

  PVector position;
  float rot = 0;
  float rotDelta = 2;
  ArrayList<Bullet> bullets;
  
  
  Cannon(float x, float y) {
    position = new PVector(x, y);
    bullets = new ArrayList<Bullet>();
  }
  
  void update() {
    rot += rotDelta;    
    if (rot < -90 || rot > 90) rotDelta *= -1;  
    
    
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.alive) {
        bullet.run();
      } else {
        bullets.remove(i);
      }
    }
  }
  
  void fire() {
    bullets.add(new Bullet(position.x, position.y, rot));
  }
  
  void draw() {
    noStroke();
    imageMode(CENTER);
    image(img, position.x, position.y, 150, 150);
    
  }
  
  void run() {
    update();
    draw();
  }

}
