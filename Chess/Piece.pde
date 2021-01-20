abstract class Piece {

  protected String name;
  protected boolean white;
  protected boolean dead;
  protected boolean hasMoved;

  Piece(String name, boolean white) {
    this.name = name;
    this.white = white;
  }

  PImage getImage() {
    if (name == null) 
      return null;

    if (white) {
      switch(name) {
      case "King":
        return kingW;
      case "Queen":
        return queenW;
      case "Bishop":
        return bishopW;
      case "Knight":
        return knightW;
      case "Rook":
        return rookW;
      case "Pawn":
        return pawnW;
      default:
        return null;
      }
    }
    switch(name) {
    case "King":
      return kingB;
    case "Queen":
      return queenB;
    case "Bishop":
      return bishopB;
    case "Knight":
      return knightB;
    case "Rook":
      return rookB;
    case "Pawn":
      return pawnB;
    default:
      return null;
    }
  }

  abstract boolean canMove(Cell startPoint, Cell endPoint);

  String getName() {
    return name;
  }
  boolean isWhite() {
    return white;
  }
  boolean isDead() {
    return dead;
  }
  void kill() {
    dead = true;
  }
  void setHasMoved(boolean b) {
    hasMoved = b;
  }
}
