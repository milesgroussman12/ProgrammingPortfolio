class Rock {
  int x, y, speed, rad, health;
  color c; 
  PImage rock1;


  Rock(int x, int y, color c) {
    this.x = x; 
    this.y = y; 
    this.c = c; 
    speed = int(random(3, 9));
    health = 50;
    rock1 = loadImage("New Piskel.png");
    rad = 25;
  }

  void display() {
    image(rock1, x, y);
    rectMode(CENTER); 
    noStroke(); 
    fill(c);
    ellipse(x, y, 50, 50);
  }

  void move() {
    y+=speed;
  }

  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
