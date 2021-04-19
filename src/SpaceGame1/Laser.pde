class Laser {
  int x, y, speed, rad; 
  color c; 

  Laser(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c; 
    speed = 6;
  }

  void display() {
    rectMode(CENTER); 
    noStroke(); 
    fill(#FCB500);
    rect(x, y, 3, 6);
  }

  void fire() {
    y+=speed;
  }

  boolean reachedTop() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
