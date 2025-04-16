int diceOne, diceTwo;
int [] board = new int [64];
int numberPlayers = 4;
int [] positionPlayer = new int [numberPlayers];
int [] previousPosition = new int [numberPlayers];
int indexPlayer=0;
boolean victory=false;
boolean[] firstThrow= new boolean [numberPlayers];


void setup () {
  size(1200, 1300);
  background(255);
  initBoard();
  for (int i = 0; i < numberPlayers; i++) {
    firstThrow[i] = true;
  }
}
void draw() {
}

void initBoard() {
  for (int i=0; i<64; i++) {
    fill(255);
    stroke(0);
    if (i==0) {
      fill(40, 180, 180);
      rect(20+(i*15), 40, 15, 40);
    }
    rect(20+(i*15), 40, 15, 40);
    fill(0);
    textAlign(CENTER, CENTER);
    text(i, 28+(i*15), 60);
  }
  fill(40, 150, 150);
  rect(55, 115, 30, 30);
}
void diceThrow() {
  diceOne = int(random(1, 7));
  diceTwo = int(random(1, 7));
}
void showPlayer(int currentPos) { // le rectangle avec la position du joueur actuellement
  switch(indexPlayer) {
  case 0:
    fill(255, 0, 0);
    break;
  case 1:
    fill(0, 255, 0);
    break;
  case 2:
    fill(255, 165, 0);
    break;
  case 3:
    fill(255, 165, 0);
    break;
  default:
    fill(100);
    break;
  }
  rect(20+(currentPos*15), 40, 15, 40);
  textAlign(CENTER, CENTER);
  fill(0);
  text(currentPos, 28+(currentPos*15), 60);
  if (previousPosition[indexPlayer]!=0) {
    fill(255);
    rect(20+(previousPosition[indexPlayer]*15), 40, 15, 40);
    textAlign(CENTER, CENTER);
    fill(0);
    text(currentPos, 28+(previousPosition[indexPlayer]*15), 60);
  }
}
void mouseClicked() {
  println("Clic à la position → X : " + mouseX + ", Y : " + mouseY);

  if (!victory && mouseX >= 55 && mouseX <= 85 && mouseY >=115 && mouseY <=145) {
    if (positionPlayer[indexPlayer]!=63) {
      diceThrow();
      moving();
      if (!victory) {
        indexPlayer++;
        if (indexPlayer >= numberPlayers) {
          indexPlayer=0;
        }
      }
    }
  }
}
void firstthrow() {
  //if (firstThrow[indexPlayer]) {
  if ((diceOne==6 && diceTwo==3) || (diceOne==3 && diceTwo==6)) {
    previousPosition[indexPlayer] = positionPlayer[indexPlayer];
    positionPlayer[indexPlayer] = positionPlayer[indexPlayer] + diceOne + diceTwo;
  } else if (diceOne==4 && diceTwo==5 || diceOne==5 && diceTwo==4) {
    previousPosition[indexPlayer] = positionPlayer [indexPlayer];
    positionPlayer[indexPlayer] = 53;
  } else if (diceOne+diceTwo==6) {
    previousPosition[indexPlayer] = positionPlayer [indexPlayer];
    positionPlayer[indexPlayer] = 12;
  }
  //  firstThrow[indexPlayer]=false;
  //}
}


void moving() {
  println("Joueur " + (indexPlayer + 1) + " lance : " + diceOne + " et " + diceTwo);
  int overDice = 0;
  previousPosition[indexPlayer] = positionPlayer[indexPlayer];
  positionPlayer[indexPlayer] = positionPlayer[indexPlayer] + diceOne + diceTwo;
  firstthrow();
  if (positionPlayer[indexPlayer]>63) {
    overDice=positionPlayer[indexPlayer]-63;
    positionPlayer[indexPlayer]=63-overDice;
  } else if (positionPlayer[indexPlayer]==63) {
    println(positionPlayer[indexPlayer]);
    println("Victoire");
    victory=true;
  }
  println(positionPlayer[indexPlayer]);
  showPlayer(positionPlayer[indexPlayer]);
}
