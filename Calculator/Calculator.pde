//Initiate each of the classification of buttons
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[10];
CalcButton[] spButtons = new CalcButton[2];

//Global variables
String displayValue = "0";
String valueToCompute = ""; //string value left of op
String valueToCompute2 = ""; //string value right of op
float valueToComputeI = 0; //float value left of op
float valueToComputeI2 = 0; //float value right of op
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(300, 500);
  background(190, 50, 50);
  noFill();
  strokeWeight(3);
  stroke(100);
  rect(1, 1, 297, 497);

  //Populate number buttons
  numButtons[0] = new CalcButton(40, 420).asNumber(0, 100, 40);
  numButtons[1] = new CalcButton(40, 360).asNumber(1, 40, 40);
  numButtons[2] = new CalcButton(100, 360).asNumber(2, 40, 40);
  numButtons[3] = new CalcButton(160, 360).asNumber(3, 40, 40);
  numButtons[4] = new CalcButton(40, 300).asNumber(4, 40, 40);
  numButtons[5] = new CalcButton(100, 300).asNumber(5, 40, 40);
  numButtons[6] = new CalcButton(160, 300).asNumber(6, 40, 40);
  numButtons[7] = new CalcButton(40, 240).asNumber(7, 40, 40);
  numButtons[8] = new CalcButton(100, 240).asNumber(8, 40, 40);
  numButtons[9] = new CalcButton(160, 240).asNumber(9, 40, 40);

  opButtons[0] = new CalcButton(220, 360).asOperator("+", 40, 40);                                                                                                                                                                                                      
  opButtons[1] = new CalcButton(220, 300).asOperator("-", 40, 40);
  opButtons[2] = new CalcButton(220, 240).asOperator("×", 40, 40);
  opButtons[3] = new CalcButton(220, 180).asOperator("÷", 40, 40);
  opButtons[4] = new CalcButton(220, 420).asOperator("=", 40, 40);
  opButtons[5] = new CalcButton(40, 180).asOperator("C", 40, 40);
  opButtons[6] = new CalcButton(160, 180).asOperator("%", 40, 40);
  opButtons[7] = new CalcButton(40, 120).asOperator("x^2", 60, 40);
  opButtons[8] = new CalcButton(120, 120).asOperator("x^3", 60, 40);
  opButtons[9] = new CalcButton(200, 120).asOperator("x^4", 60, 40);
  
  spButtons[0] = new CalcButton(100, 180).asSpecial("n", 40, 40);
  spButtons[1] = new CalcButton(160, 420).asSpecial(".", 40, 40);

  firstNum = true;
}

void draw() {
  //draw number buttons
  for (int i = 0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }

  //draw op buttons
  for (int i = 0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  
  //draw sp buttons
  for (int i = 0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}

void performCalculation() {
  //set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  //perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '×') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result); 

    //let = work multiple times
    if (firstNum) {
      valueToCompute = displayValue;
    } else {
      valueToCompute = displayValue;
      valueToCompute2 = "";
    }
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI );
    }
  }
}

void updateDisplay() {
  fill(0);
  rect(40, 40, 220, 35);
  fill(255);
  textSize(25);
  text(displayValue, 50, 67);
}

void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.on) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.click();
    if (iopButton.on) {
      if (iopButton.opButtonValue == "+") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iopButton.opButtonValue == "-") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iopButton.opButtonValue == "=") {
        //Perform Calculation
        firstNum = true;
        performCalculation();
      } else if (iopButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iopButton.opButtonValue == "×") {
        if (result !=0) {
          opValue = '×';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "×";
        } else {
          opValue = '×';
          firstNum = false;
          displayValue = "×";
        } 
      } else if (iopButton.opButtonValue == "n") {
        opValue = 'n';
        performCalculation();
      }
    }
  }
  for (int i=0; i<spButtons.length;i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.click();
    if (ispButton.on) {
      if (ispButton.spButtonValue == ".") {
        if (ispButton.on && firstNum == true) {
          valueToCompute += ispButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (ispButton.on && firstNum == false) {
          valueToCompute2 += ispButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}
class CalcButton {

  // Class variables
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int boxSize = 40;
  int buttonW = 40;
  int buttonH = 40;
  boolean on = false;

  CalcButton(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
  }

  //Constructor for numbers
  CalcButton asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW; 
    buttonH = tempH;
    return this;
  }

  //Constructor for operators
  CalcButton asOperator(String tempOpButtonValue, int tempW, int tempH) {
    opButtonValue = tempOpButtonValue;
    buttonW = tempW; 
    buttonH = tempH;
    return this;
  }
  //Constructor for special
  CalcButton asSpecial(String buttonValue, int tempW, int tempH) {
    isSpecial = true;
    spButtonValue = buttonValue;
    buttonW = tempW; 
    buttonH = tempH;
    return this;
  }

  void display() {
    //Draw rounded button
    if (isNumber) {
      fill(0);
      stroke(0, 150, 0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text(int(numButtonValue), xpos+15, ypos+30);
    } else if (isSpecial) {
      fill(0);
      stroke(0, 150, 0);
      strokeWeight(2);
      rect(xpos, ypos, boxSize, boxSize);
      fill(255);
      textSize(24);
      text(spButtonValue, xpos+15, ypos+30);
    } else {
      fill(0);
      stroke(0, 150, 0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH);
      fill(255);
      textSize(24);
      text(opButtonValue, xpos+15, ypos+30);
    }
  }

  void click() {
    on = mouseX > xpos && mouseX < xpos+boxSize && mouseY > ypos && mouseY < ypos+boxSize;
    }
}

