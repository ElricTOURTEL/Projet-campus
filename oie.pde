int diceOne, diceTwo;
int [] board = new int [64];
int numberPlayers = 4;
int [] positionPlayer = new int [numberPlayers];
int [] previousPosition = new int [numberPlayers];
int [] tempPosition = new int [numberPlayers];
int indexPlayer=0;
boolean victory=false;
boolean[] firstThrow= new boolean [numberPlayers];
int [] stuck = new int [numberPlayers];
int [] doubleThrow = {9, 18, 27, 36, 45, 54};
boolean [] pit = new boolean [numberPlayers];
boolean [] jail = new boolean [numberPlayers];


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
  //diceOne=0;
  //diceTwo=0;
}

void showPlayer(int currentPos) { // le rectangle avec la position du joueur actuellement
  switchcolor();
  int compare = numberPlayers;
  rect(20+(currentPos*15), 40, 15, 40);
  textAlign(CENTER, CENTER);
  fill(0);
  text(currentPos, 28+(currentPos*15), 60);
  boolean occupied = false;
  for (int i=0; i < numberPlayers; i++) {
    if (i != indexPlayer && positionPlayer[i] == previousPosition[indexPlayer]) {
      occupied=true;
      break;
    }
  }
  if ((!occupied && tempPosition[indexPlayer]!= -1 && tempPosition[indexPlayer]!=currentPos) && (tempPosition[indexPlayer]!=0)) {
    fill(255);
    rect(20+(tempPosition[indexPlayer]*15), 40, 15, 40);
    textAlign(CENTER, CENTER);
    fill(0);
    text(tempPosition[indexPlayer], 28+(tempPosition[indexPlayer]*15), 60);
  }
}


void switchcolor() {
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
    fill(255, 0, 165);
    break;
  default:
    fill(100);
    break;
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
  if (firstThrow[indexPlayer]) {
    if ((diceOne==6 && diceTwo==3) || (diceOne==3 && diceTwo==6)) {
      previousPosition[indexPlayer] = positionPlayer[indexPlayer];
      positionPlayer[indexPlayer] = 26;
      println("go case 26");
    } else if (diceOne==4 && diceTwo==5 || diceOne==5 && diceTwo==4) {
      previousPosition[indexPlayer] = positionPlayer [indexPlayer];
      positionPlayer[indexPlayer] = 53;
    } else if (diceOne+diceTwo==6) {
      previousPosition[indexPlayer] = positionPlayer [indexPlayer];
      positionPlayer[indexPlayer] = 12;
    }
    firstThrow[indexPlayer]=false;
  }
}

void specialCondition() {
  twice();
  lab();
  hotel();
  pit();
  jail();
  skull();
  sameposition();
}

void twice() {
  for (int i=0; i < doubleThrow.length; i++) {
    if (positionPlayer[indexPlayer]==doubleThrow[i]) {
      previousPosition[indexPlayer] = positionPlayer[indexPlayer];
      positionPlayer[indexPlayer] = positionPlayer[indexPlayer] + diceOne + diceTwo;
      println("Double Throw");
      break;
    }
  }
}
void lab() {
  if (positionPlayer[indexPlayer]==42) {
    previousPosition[indexPlayer] = positionPlayer[indexPlayer];
    positionPlayer[indexPlayer] = 30;
    println("Tu es tombé sur le labyrinthe, retour à la case 30");
  }
}
void hotel() {
  if (positionPlayer[indexPlayer]==19 && stuck[indexPlayer]==0) {
    stuck[indexPlayer]=2;
  }
  if (stuck[indexPlayer]!=0) {
    stuck[indexPlayer]--;
    positionPlayer[indexPlayer] = 19;
    println("le joueur est bloqué pour: " + stuck[indexPlayer] + "tours");
  }
}
void pit() {
  if (positionPlayer[indexPlayer]==3) {
    pit[indexPlayer]=true;
    for (int i=0; i < numberPlayers; i++) {
      if (i != indexPlayer && positionPlayer[i] == positionPlayer[indexPlayer]) {
        pit[i]=false;
        println("Le joueur " + (i+1) +" est liberé");
        break;
      }
    }
  }
  if (pit[indexPlayer]) {
    positionPlayer[indexPlayer] = 3;
    println("Le joueur "+ (indexPlayer+1) + " est toujours bloqué dans le puit");
  }
}
void jail() {
  if (positionPlayer[indexPlayer]==52) {
    jail[indexPlayer]=true;
    println("Le joueur: "+ (indexPlayer+1)+ " est en prison");
    for (int i=0; i<numberPlayers; i++) {
      if (i!=indexPlayer && positionPlayer[i] == positionPlayer[indexPlayer]) {
        jail[i]=false;
        jail[indexPlayer]=false;
        println("Le joueur: "+ (i+1) + " est liberé");
        println("Le joueur: "+ (indexPlayer+1)+ " est liberé");
        break;
      }
    }
  }
  if (jail[indexPlayer]) {
    positionPlayer[indexPlayer]=52;
    println("Le joueur "+ (indexPlayer+1) + " est toujours bloqué en prison");
  }
}
void skull() {
  if (positionPlayer[indexPlayer]==58) {
    previousPosition[indexPlayer] = positionPlayer[indexPlayer];
    positionPlayer[indexPlayer] = 0;
    println("Tu es tombé sur la tête de mort, retour à la case départ");
  }
}
void sameposition() {
  for (int i=0; i<numberPlayers; i++) {
    if (i!=indexPlayer && positionPlayer[i] == positionPlayer[indexPlayer]) {
      positionPlayer[indexPlayer] = previousPosition[i];
      println("Le joueur: "+ (indexPlayer+1) + " retour à la position précédente du joueur " + (i+1)+" cad la case" + previousPosition[i]);
      break;
    }
  }
}

void moving() {
  println("Joueur " + (indexPlayer + 1) + " lance : " + diceOne + " et " + diceTwo);
  int overDice = 0;
  tempPosition[indexPlayer]= positionPlayer[indexPlayer];
  previousPosition[indexPlayer] = positionPlayer[indexPlayer];
  positionPlayer[indexPlayer] = positionPlayer[indexPlayer] + diceOne + diceTwo;

  firstthrow();
  specialCondition();

  if (positionPlayer[indexPlayer]>63) {
    overDice=positionPlayer[indexPlayer]-63;
    positionPlayer[indexPlayer]=63-overDice;
  } else if (positionPlayer[indexPlayer]==63) {
    println("Le joueur a gagné" + indexPlayer);
    victory=true;
  }
  println(positionPlayer[indexPlayer]);
  showPlayer(positionPlayer[indexPlayer]);
}
