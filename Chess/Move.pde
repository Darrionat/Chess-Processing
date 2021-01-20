class Move {

  private Cell start;
  private Cell end;
  private Piece piece;

  Move(Cell start, Cell end, Piece piece) {
    this.start = start;
    this.end = end;
    this.piece = piece;
  }

  boolean isValid() {
    // Colors are the same
    if (end.getPiece() != null)
      if (start.getPiece().isWhite() == end.getPiece().isWhite()) {
        return false;
      }
    if (!piece.canMove(start, end))
      return false;

    if (piece instanceof King) {
      return !resultsInCheck();
    }
    return true;
  }

  boolean resultsInCheck() {
    King king = (King) start.getPiece();

    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        Cell cell = board.getCell(x, y);
        if (cell.getPiece() == null) {
          println("null");
          continue;
        }

        Piece piece = cell.getPiece();
        if (piece.isWhite() == king.isWhite()) {
         println("white");
          continue;
        }

        if (cell.getPiece() == king) continue;
        if (new Move(cell, start, piece).isValid()) {
          print(x+ ", " + y);
          return true;
        }
      }
    }
    println("false");
    return false;
  }

  void move() {
    if (end.getPiece() != null) {
      end.getPiece().kill();
    }
    if (piece instanceof King) {
      checkCastling();
    }
    animations.add(new Animation(start, end));
  }

  void checkCastling() {
    King king = (King) piece;
    if (!king.validCastle(end)) 
      return;
    Cell rook = king.getCastleRookCell(end);
    int y = 0;
    if (rook.getPiece().isWhite()) {
      y = 7;
    }
    // Queen side castle
    if (rook.getXPos() == 0) {
      animations.add(new Animation(rook, board.getCell(3, y)));
    } else {
      // King side castle
      animations.add(new Animation(rook, board.getCell(5, y)));
    }
  }
}

class Animation {

  final int FRAMES = 10;

  Cell original;
  Cell destination;
  Piece piece;
  PImage img;
  // Location of the image
  float x;
  float y;
  // Target Location
  float targetX;
  float targetY;

  // Differences
  float dX;
  float dY;

  Animation(Cell original, Cell destination) {
    this.original = original;
    this.destination = destination;
    this.piece = original.getPiece();
    img = piece.getImage();
    x = getX(original.getXPos());
    y = getY(original.getYPos());
    targetX = getX(destination.getXPos());
    targetY = getY(destination.getYPos());

    dX = (x-targetX);
    dY = (y-targetY);
  }
  int frames = 0;
  void run() {
    frames++;
    original.setPiece(null);
    board.drawSquares();
    board.drawPieces();
    x-=dX/FRAMES;
    y-=dY/FRAMES;
    image(img, x, y, cellWidth, cellHeight);
    if (frames == FRAMES) {
      destination.setPiece(piece);
      original.setPiece(null);
      spot1 = null;
      board.drawSquares();
      board.drawPieces();
      piece.setHasMoved(true);
      toBeRemoved.add(this);
    }
  }
}
