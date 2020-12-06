class PlayerService {

  Player playerOne;
  Player playerTwo;
  Player activePlayer;

  PlayerService() {
    playerOne = new Player(true);
    playerTwo = new Player(false);
    activePlayer = playerOne;
  }

  void togglePlayer() {
    if (activePlayer == playerOne) {
      activePlayer = playerTwo;
    } else {
      activePlayer = playerOne;
    }
  }

  Player getCurrentPlayer () {
    return activePlayer;
  }
}

class Player {
  private boolean white;

  Player(boolean white) {
    this.white = white;
  }

  boolean isWhite() {
    return white;
  }

  boolean canMovePiece(Piece piece) {
    return piece.isWhite() == white;
  }
}
