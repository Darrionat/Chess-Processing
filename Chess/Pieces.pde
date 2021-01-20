class King extends Piece {

  King(boolean white) {
    super("King", white);
  }

  boolean canMove(Cell start, Cell end) {
    int xDiff = abs(end.getXPos() - start.getXPos());
    int yDiff = abs(end.getYPos() - start.getYPos());
    if (xDiff < 2 && yDiff < 2) {
      return true;
    }
    return validCastle(end);
  }

  boolean validCastle(Cell end) {
    if (hasMoved)
      return false;
    int y = 0;
    if (white) {
      y = 7;
    }
    if (end.getYPos() != y)
      return false;

    // Queen side castle
    if (end.getXPos() == 2) {
      Piece rook = board.getCell(0, y).getPiece();
      if (rook == null || !(rook instanceof Rook) || rook.hasMoved)
        return false;
      return board.getCell(1, y).getPiece() == null 
        && board.getCell(2, y).getPiece() == null 
        && board.getCell(3, y).getPiece() == null;
    }

    // King side castle
    if (end.getXPos() == 6) {
      Piece rook = board.getCell(7, y).getPiece();
      if (rook == null || !(rook instanceof Rook) || rook.hasMoved)
        return false;
      return board.getCell(5, y).getPiece() == null 
        && board.getCell(6, y).getPiece() == null;
    }
    return false;
  }
  
  // Should only be used when a valid castle is being performed
  Cell getCastleRookCell(Cell end) {
    int y = 0;
    if (white) {
      y = 7;
    }
    if (end.getXPos() == 2) {
      return board.getCell(0, y);
    }
    if (end.getXPos() == 6) {
      return board.getCell(7, y);
    }
    return null;
  }
}

class Queen extends Piece {
  Queen(boolean white) {
    super("Queen", white);
  }

  // Goes by the logic that the queen is just a bishop and rook mixed together
  boolean canMove(Cell start, Cell end) {
    return new Bishop(white).canMove(start, end) || new Rook(white).canMove(start, end);
  }
}

class Bishop extends Piece {
  Bishop(boolean white) {
    super("Bishop", white);
  } 

  boolean canMove(Cell start, Cell end) {
    int xDiff = abs(end.getXPos() - start.getXPos());
    int yDiff = abs(end.getYPos() - start.getYPos());
    if (xDiff != yDiff)
      return false;

    return !diagonalCollision(start, end);
  }
}

class Knight extends Piece {
  Knight(boolean white) {
    super("Knight", white);
  } 

  boolean canMove(Cell start, Cell end) {
    int xDiff = abs(end.getXPos() - start.getXPos());
    int yDiff = abs(end.getYPos() - start.getYPos());
    return xDiff * yDiff == 2;
  }
}

class Rook extends Piece {
  Rook(boolean white) {
    super("Rook", white);
  } 
  boolean canMove(Cell start, Cell end) {
    int xDiff = end.getXPos() - start.getXPos();
    int yDiff = end.getYPos() - start.getYPos();

    if (xDiff != 0 && yDiff != 0)
      return false;
    if (xDiff == 0 && yDiff == 0)
      return false;
    // Can not move if there is a collision that would prevent the movement
    return !horzVertCollision(start, end);
  }
}

class Pawn extends Piece {

  int dir;

  Pawn(boolean white) {
    super("Pawn", white);
    if (white) {
      dir = -1;
    } else {
      dir = 1;
    }
  }

  boolean canMove(Cell start, Cell end) {
    int xDiff = end.getXPos() - start.getXPos();
    int yDiff = end.getYPos() - start.getYPos();

    // Clicked spot has an enemy piece
    if (end.getPiece() != null) {
      if (xDiff != -1 && xDiff != 1)
        return false;
      if (yDiff != dir)
        return false;
      // Attack diagonally
      return true;
    }
    if (xDiff != 0)
      return false;

    if (hasMoved && yDiff != dir) {
      return false;
    }
    if (!hasMoved && yDiff != dir && yDiff != 2*dir) {
      return false;
    }
    return !horzVertCollision(start, end);
  }
}

PImage kingB;
PImage kingW;
PImage queenB;
PImage queenW;
PImage bishopB;
PImage bishopW;
PImage knightB;
PImage knightW;
PImage rookB;
PImage rookW;
PImage pawnB;
PImage pawnW;
// Preloads the images for performance
void loadImages() { 
  kingB = loadImage("images/King-black.png");
  kingW = loadImage("images/King-white.png");
  queenB = loadImage("images/Queen-black.png");
  queenW = loadImage("images/Queen-white.png");
  bishopB = loadImage("images/Bishop-black.png");
  bishopW = loadImage("images/Bishop-white.png");
  knightB = loadImage("images/Knight-black.png");
  knightW = loadImage("images/Knight-white.png");
  rookB = loadImage("images/Rook-black.png");
  rookW = loadImage("images/Rook-white.png");
  pawnB = loadImage("images/Pawn-black.png");
  pawnW = loadImage("images/Pawn-white.png");
}
