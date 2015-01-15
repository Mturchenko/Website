Lines[] myLines = new Lines [30];

void setup() {
  size(950, 500);
  background(#000E62);
  for (int i = 0; i < myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}

void draw() {
  if (frameCount == 500) {
    frameCount = 0;
    background(#000E62);
  } else {
    for (int i = 0; i < myLines.length; i++) {
      Lines iLines = myLines[i];
      iLines.display();
    }
  }
}

class Lines {
  //class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }

  //display
  void display() {
    strokeW = random(1, 10);
    lineLength = random(1, 20);

    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>82) {
        stroke(random(100));
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>69) {
        stroke(random(50), random(255), random(50));
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>55) {
        stroke(random(50), random(50), random(255));
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else if (random(100)>35) {
        stroke(random(255), random(50), random(50));
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      }
    }
  }
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX + i, startY);
      xpos = startX + 1;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX - i, startY);
      xpos = startX - 1;
      ypos = startY;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY - i);
      ypos = startY - 1;
      xpos = startX;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY + i);
      ypos = startY + 1;
      xpos = startX;
    }
  }
}


