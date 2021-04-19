//SpaceGame
//Miles Groussman || December 2020


Spaceship s1; 
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars; 
//ArrayList<PowerUp> pUps;
Timer timer, puTimer;
int score, pass, level;
boolean play;
Spaceship spaceship;
SoundFile laser;
import processing.sound.*;

void setup() {
  size(500, 500);
  s1 = new Spaceship();
  lasers = new ArrayList();
  rocks = new ArrayList(); 
  stars = new ArrayList(); 
  //pUps = new ArrayList();
  timer = new Timer(int(random(500, 1000)));
  score = 0; 
  timer.start();
  play = false;
  pass = 0;
  laser = new SoundFile(this, "Narn-FighterGun.wav");
}  

void draw () {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(11);

    stars.add(new Star(int(random(width)), 0, color(128))); 
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.move();
      star.display(); 
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }


    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50, color(128)));
      timer.start();
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i); 
      laser. display(); 
      laser.fire();
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.laserIntersection(laser)) {
          rock.health-=25;
          lasers.remove(laser);
          if (rock.health>1) {
            rocks.remove(rock);
            score+=rock.health;
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

 //   if (puTimer.isFinished()) {
//      pUps.add(new PowerUp(int(random(width)), -20));
//      puTimer.start();
//    }

//    for (int i = 0; i<pUps.size(); i++) {
//      PowerUp pu = pUps.get(i);
//      pu.move();
//      pu.display();
      // PowerUp and ship intersection
//      if (s1.puIntersect(pu)) {

//        if (pu.pu == 0) { // Adds ammo
 //         s1.ammo+=1000;
//        } else if (pu.pu == 1) { //Adds health
//          s1.health+=100;
//        } else if (pu.pu == 2) { //Adds lasers
//          weaponCount++;
 //       } else if (pu.pu == 3) { //Adds super weapon
 //         superWeapon++;
//        }
//        pUps.remove(pu);
//      }
      
      for (int i = 0; i < rocks.size(); i++) {
        Rock rock = rocks.get(i);
        rock.display();
        rock.move(); 
        if (s1.rockIntersection(rock)) {
          s1.health-=rock.health;
          rocks.remove(rock);
          score+=25;
        }
        if (rock.reachedBottom()) {
          rocks.remove(rock);
        }
      }
      infoPanel();
      s1.display(mouseX, mouseY);

      if (s1.health <1) {
        s1.lives--;
      }

      if (s1.health<1 && s1.lives < 1 || pass>10) {
        play = false;
        gameOver();
      }
    }
  }
// }
void mousePressed() {
  laser.play();
  if (s1.ammo > 0) {
    lasers.add(new Laser(mouseX, mouseY, color(255, 0, 0)));
    s1.ammo--;
  }
}

void KeyPressed() {
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER); 
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health:" + s1.health, 20, height-20);
  text("Ammo:" + s1.ammo, 100, height-20);
  text("Lives:" + s1.lives, 180, height-20);
  text("Score:" + score, 260, height-20);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  text("You made it to level " + level, width/2, height/2+40);
  noLoop();
}
