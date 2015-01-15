//create array of cars
Car [] myCars = new Car [200];

void setup() {
  size(1500, 800);

  //initiate array
  for (int i = 0; i<myCars.length; i++) {
    myCars[i] = new Car(random(width), random(height), random(-10, 10), color(random(255), random(255), random(255) ));
  }
}

void draw() {
  background(255);

  for (int i = 0; i<myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}

class Car {
  //member variables
  float xspeed;
  color cColor;
  float xpos, ypos;

  //constructor #1
  Car (float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    xspeed = 30;
    cColor = color(255, 0, 0);
  }

  //constructor #2
  Car (float tempX, float tempY, float tempSpeed, color tempColor) {
    xpos = tempX;
    ypos = tempY;
    xspeed = tempSpeed;
    cColor = tempColor;
  }
  //member methods
  void display() {
    rectMode(CENTER);
    fill(cColor);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-6, ypos-5, 6, 3);
    rect(xpos+6, ypos-5, 6, 3);
    rect(xpos-6, ypos+5, 6, 3);
    rect(xpos+6, ypos+5, 6, 3);
    fill(255);
    ellipse(xpos, ypos, 10, 5);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    else if (xpos < 0) {
        xpos = width;
      }
  }
}


