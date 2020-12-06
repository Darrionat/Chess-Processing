class Board {

  private Cell[][] squares = new Cell[8][8];

  Board() {
    reset();
  }

  Cell getCell(int x, int y) {
    return squares[x][y];
  }

  void reset() {
    drawSquares();
    loadImages();
    setPieces();
    drawPieces();
  }

  void drawSquares() {
    rectMode(CORNER);
    noStroke();

    boolean white = true;
    for (int i = 0; i < 8; i++) {
      if (i % 2 == 0) {
        white = true;
      } else {
        white = false;
      }
      for (int j = 0; j < 8; j++) {
        if (white) {
          fill(255, 206, 158);
        } else {
          fill(209, 139, 71);
        }
        rect(j*(width/8), i*(height/8), width/8, height/8);
        white = !white;
      }
    }
  }

  void selectSquare(Cell selected) {
    fill(232,173,115);
    rect(selected.getXPos()*(width/8), selected.getYPos()*(height/8), width/8, height/8);
    selected.drawPiece();
  }

  void setPieces() {
    // Rooks
    squares[0][0] = new Cell(0, 0, new Rook(false));
    squares[7][0] = new Cell(7, 0, new Rook(false));
    squares[0][7] = new Cell(0, 7, new Rook(true));
    squares[7][7] = new Cell(7, 7, new Rook(true));
    // Knights
    squares[1][0] = new Cell(1, 0, new Knight(false));
    squares[6][0] = new Cell(6, 0, new Knight(false));
    squares[1][7] = new Cell(1, 7, new Knight(true));
    squares[6][7] = new Cell(6, 7, new Knight(true));
    // Bishops
    squares[2][0] = new Cell(2, 0, new Bishop(false));
    squares[5][0] = new Cell(5, 0, new Bishop(false));
    squares[2][7] = new Cell(2, 7, new Bishop(true));
    squares[5][7] = new Cell(5, 7, new Bishop(true));
    // Queens
    squares[3][0] = new Cell(3, 0, new Queen(false));
    squares[3][7] = new Cell(3, 7, new Queen(true));
    // Kings
    squares[4][0] = new Cell(4, 0, new King(false));
    squares[4][7] = new Cell(4, 7, new King(true));

    for (int x = 0; x < 8; x++) {
      squares[x][1] = new Cell(x, 1, new Pawn(false)); 
      squares[x][6] = new Cell(x, 6, new Pawn(true));
    }
    for (int x = 0; x < 8; x++) {
      for (int y = 2; y<6; y++) {
        squares[x][y] = new Cell(x, y, null);
      }
    }
  }

  void drawPieces() {
    for (int i = 0; i< 8; i++) {
      for (int j = 0; j< 8; j++) {
        if (squares[i][j].getPiece() == null) continue;
        drawPiece(i, j);
      }
    }
  }
  void drawPiece(int x, int y) {
    squares[x][y].drawPiece();
  }
}
