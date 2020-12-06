// Gets the x location of a cell based on its X index
float getX(int cellX) {
  return cellX * (width/8);
}

// Gets the y loction of a cell based on its Y index
float getY(int cellY) {
  return cellY * (height/8);
}

// Collision detection for Rooks, Queens, and Pawns
boolean horzVertCollision(Cell start, Cell end) {
  int xDiff = end.getXPos() - start.getXPos();

  boolean horizontal;
  int min;
  int max;
  if (xDiff == 0) {
    // Moved vertically
    min = min(start.getYPos(), end.getYPos());
    max = max(start.getYPos(), end.getYPos());
    horizontal = false;
  } else {
    min = min(start.getXPos(), end.getXPos());
    max = max(start.getXPos(), end.getXPos());
    horizontal = true;
  }

  for (int i = min + 1; i < max; i++) {
    if (horizontal) {
      if (board.getCell(i, start.getYPos()).getPiece() != null)
        return true;
    } else {
      if (board.getCell(start.getXPos(), i).getPiece() != null)
        return true;
    }
  }
  return false;
}

// Collision detection for Queens and Bishops
boolean diagonalCollision(Cell start, Cell end) {
  int xDir;
  if (start.getXPos() < end.getXPos()) {
    xDir = 1;
  } else {
    xDir = -1;
  }

  int yDir;
  if (start.getYPos() < end.getYPos()) {
    yDir = 1;
  } else {
    yDir = -1;
  }

  int y = start.getYPos() + yDir;
  for (int x = start.getXPos() + xDir; x != end.getXPos(); x+=xDir, y+=yDir ) {
    if (board.getCell(x, y).getPiece() != null)
      return true;
  }
  return false;
}
