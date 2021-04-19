class Star {
  int x, y, speed, dia;
  color c;

  Star(int x, int y, color c) {
    this.x = x; 
    this.y = y; 
    this.c = color(255); 
    speed = int(random(1, 6));
    dia = int(random(1, 4));
  }

  void display() {
    rectMode(CENTER); 
    noStroke(); 
    fill(c);
    ellipse(x, y, dia, dia);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
}
