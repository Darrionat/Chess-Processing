Cell spot1;

void mousePressed() {
  int xPos = mouseX / (width/8);
  int yPos = mouseY / (height/8);

  Cell selected = board.getCell(xPos, yPos);
  // Pick first square
  if (spot1 == null) {
    Piece piece = selected.getPiece();
    if (piece == null)
      return;
    if (!playerService.getCurrentPlayer().canMovePiece(piece))
      return;

    spot1 = selected;
    board.selectSquare(spot1);
    board.drawPiece(spot1.getXPos(), spot1.getYPos());
    return;
  }

  // Clicks same spot
  if (spot1 == selected) {
    spot1 = null;
    board.drawSquares();
    board.drawPieces();
    return;
  }

  Move move = new Move(spot1, selected, spot1.getPiece());
  if (!move.isValid()) {
    return;
  }
  move.move();
  playerService.togglePlayer();
}
