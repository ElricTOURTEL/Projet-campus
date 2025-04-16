int diceOne, diceTwo;
int [] board = new int [64];
int numberPlayers = 4;
int [] positionPlayer = new int [numberPlayers];
int indexPlayer=0;
boolean victory=false;


void setup () {
  size(1200, 1300);
  background(255);
  initBoard();
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
  diceOne = int(random(6+1));
  diceTwo = int(random(6+1));
}
void showPlayer(int currentPos) { // le rectangle avec la position du joueur actuellement
  fill(40, 180, 180);
  rect(20+(currentPos*15), 40, 15, 40);
  textAlign(CENTER, CENTER);
  fill(0);
  text(currentPos, 28+(currentPos*15), 60);
}
void mouseClicked() {
  println("Clic à la position → X : " + mouseX + ", Y : " + mouseY);
  if (positionPlayer[indexPlayer]!=63) {
    if (!victory && mouseX >= 55 && mouseX <= 85 && mouseY >=115 && mouseY <=145) {
      if (indexPlayer <= numberPlayers) {

        while (indexPlayer <= numberPlayers) {
          diceThrow();
          moving();
        }
      } else {
        indexPlayer=0;
      }
      println("jeu terminé");
    }
  }
}



void moving() {
  int overDice = 0;
  println(positionPlayer[indexPlayer]);
  positionPlayer[indexPlayer] = positionPlayer[indexPlayer] + diceOne + diceTwo;
  if (positionPlayer[indexPlayer]>63) {
    overDice=positionPlayer[indexPlayer]-63;
    positionPlayer[indexPlayer]=63-overDice;
  } else if (positionPlayer[indexPlayer]==63) {
    println(positionPlayer[indexPlayer]);
    println("Victoire");
    victory=true;
  }
  showPlayer(positionPlayer[indexPlayer]);
}
