class TitleScreen {
  TitleScreen() {
    drawButtons();
    startGame();
  }

  void drawButtons() {
    
  }

  void startGame() {
    board = new Board();
    playerService = new PlayerService();
    titleScreen = null;
  }
}
