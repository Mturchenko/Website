void setup() {
  size(600, 600);
}

void draw() {
  background(150, 105, 200);
  zoog(mouseX-100, mouseY, #CE171A);
  zoog(mouseX+100, mouseY, #1D029B);
  zoog(mouseX, mouseY, #14A51E);
}

void zoog(int xpos, int ypos, color c1) {
  ellipseMode(CENTER);
  rectMode(CENTER);

  stroke(0);
  fill(c1);
  rect(xpos, ypos, 20, 100);

  stroke(0);
  fill(230);
  ellipse(xpos, ypos-30, 60, 60);

  fill(random(180, 255), random(100), random(80, 100));
  ellipse(xpos-18, ypos-30, 16, 32);
  ellipse(xpos+18, ypos-30, 16, 32);

  stroke(0);
  line(xpos-10, ypos+50, xpos-20, ypos+60);
  line(xpos+10, ypos+50, xpos+20, ypos+60);

  fill(0);
  rect(xpos, ypos-80, 40, 50);
  ellipse(xpos, ypos-60, 80, 15);

  line(xpos-10, ypos+10, xpos-20, ypos+20);
  line(xpos+10, ypos+10, xpos+20, ypos+20);
}



