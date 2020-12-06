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
    if (!piece.canMove(start, end)) {
      return false;
    }
    return true;
  }

  void move() {
    if (end.getPiece() != null) {
      end.getPiece().kill();
    }
    end.setPiece(spot1.getPiece());
    spot1.setPiece(null);
    spot1 = null;
    board.drawSquares();
    board.drawPieces();
    
    piece.setHasMoved(true);
  }
}
