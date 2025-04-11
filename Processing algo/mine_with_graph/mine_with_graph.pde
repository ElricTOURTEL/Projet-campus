int[][] board;
int cols=22;
int rows=22;
int cellSize=40;
boolean[][] reveal;

void settings(){
  size(cols * cellSize, rows * cellSize);
}
void draw(){
background(255);
for (int i= 0; i < cols; i++){
  for (int j=0; j< rows; j++){
    int x = i * cellSize;
    int y = j * cellSize;
    fill(200);
    rect(x, y, cellSize,cellSize);
    if(reveal[i][j]){
      if(board[i][j]
    }
  }
}
}
void reveal(){
  for (int i=0; i < cols; i++){
    for (int j=0; j < rows ;j++){
      reveal[i][j]=true;
    }
  }
}

void setup() {
  initBoard(10, 30);  // Exemple : tableau 10x10 avec 3 mines
  printBoard();     
  getMines();
}

// Initialiser le tableau de jeu avec des mines
void initBoard(int size, int mines) {
  board = new int[size][size];
  int placedMines = 0;
  
  while (placedMines < mines) {
    int x = int(random(size));
    int y = int(random(size));

    if (board[x][y] != 99) {  // Si la case n'a pas encore de mine
      board[x][y] = 99;  // Placer la mine (représentée par 99)
      placedMines++;
    }
  }
}

// Afficher la grille avec un symbole pour les mines et les cases vides
void printBoard() {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == 99) {
        print("*\t");  // Afficher '*' pour une mine
      } else {
        print(board[i][j] + "\t");  // Afficher le nombre de mines autour de la case
      }
    }
    println();
  }
}

// Vérifier si une case contient une mine
boolean isAMine(int row, int col){
  return board[row][col] == 99;
}

// Calculer et afficher le nombre de mines autour de chaque case
void getMines() {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      int mineCount = 0;  // Compteur pour les mines voisines

      // Vérifier les cases voisines autour de board[i][j]
      int[] directions = {-1, 0, 1}; // Déplacement dans les 3 directions (haut, bas, gauche, droite, diagonales)
      
      for (int di : directions) {
        for (int dj : directions) {
          if (di == 0 && dj == 0) continue;  // Ignorer la case elle-même
          int ni = i + di;  // Nouvelle ligne
          int nj = j + dj;  // Nouvelle colonne

          // Vérifier si les indices sont valides
          if (ni >= 0 && ni < board.length && nj >= 0 && nj < board[i].length) {
            if (isAMine(ni, nj)) {
              mineCount++;  // Incrémenter le compteur si une mine est trouvée
            } else{
              // Si la case ne contient pas de mine, afficher le nombre de mines autour
              board[i][j] = mineCount;
            }
          }
        }
      }
      // Si la case ne contient pas de mine, afficher le nombre de mines autour
    }
  }

  // Afficher à nouveau la grille avec les informations sur les mines voisines
  println("Grille avec le nombre de mines autour de chaque case :");
  printBoard();
}
