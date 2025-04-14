int cols = 10;
int rows = 10;
int cellSize = 40;
int[][] board;
boolean[][] revealed;
int totalMines = 3;

void settings() {
  size(cols * cellSize +300, rows * cellSize);
}

void setup() {
  board = new int[cols][rows];
  revealed = new boolean[cols][rows];
  placeMines();
  calculateNumbers();
}

void draw() {
  background(255);
  fill(0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Le Demineur ", 550, rows * cellSize/3);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * cellSize;
      int y = j * cellSize;
      stroke(0);
      fill(200);
      rect(x, y, cellSize, cellSize);

      if (revealed[i][j]) {
        if (board[i][j] == 99) {
          fill(255, 0, 0);
          ellipse(x + cellSize / 2, y + cellSize / 2, cellSize * 0.5, cellSize * 0.5);
        } else {
          fill(255);
          rect(x, y, cellSize, cellSize);
          fill(0);
          textAlign(CENTER, CENTER);
          textSize(20);
          if (board[i][j] > 0) {
            text(board[i][j], x + cellSize / 2, y + cellSize / 2);
          }
        }
      }
    }
  }
}

void mousePressed() {
  int i = mouseX / cellSize;
  int j = mouseY / cellSize;
  if (i >= 0 && i < cols && j >= 0 && j < rows) {
    revealed[i][j] = true;
    if (board[i][j] == 99) {
      println("💥 BOOM! Tu as cliqué sur une mine !");
      revealAll();
    }
  }
}

void placeMines() {
  int minesPlaced = 0;
  while (minesPlaced < totalMines) {
    int i = int(random(cols));
    int j = int(random(rows));
    if (board[i][j] != 99) {
      board[i][j] = 99;
      minesPlaced++;
    }
  }
}

void calculateNumbers() {
  int[] directions = {-1, 0, 1};
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (board[i][j] == 99) continue;

      int mineCount = 0;
      for (int di : directions) {
        for (int dj : directions) {
          if (di == 0 && dj == 0) continue;
          int ni = i + di;
          int nj = j + dj;
          if (ni >= 0 && ni < cols && nj >= 0 && nj < rows) {
            if (board[ni][nj] == 99) {
              mineCount++;
            }
          }
        }
      }
      board[i][j] = mineCount;
    }
  }
}

void revealAll() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      revealed[i][j] = true;
    }
  }
}
