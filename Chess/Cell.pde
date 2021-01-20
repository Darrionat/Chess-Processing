class Cell {

  private int xPos;
  private int yPos;
  private Piece piece;

  Cell(int x, int y, Piece piece) {
    this.xPos = x;
    this.yPos = y;
    this.piece = piece;
  }

  int getXPos() {
    return xPos;
  }
  int getYPos() {
    return yPos;
  }

  void drawPiece() {
    PImage img = piece.getImage();
    if (img == null) 
      return;
    image(img, getX(xPos), getY(yPos), cellWidth, cellHeight);
  }

  boolean containsPiece() {
    return piece != null;
  }

  Piece getPiece() {
    return piece;
  }

  void setPiece(Piece piece) {
    this.piece = piece;
  }
}
