Board board;

float boardWidth;
float boardHeight;
float cellWidth;
float cellHeight;

PlayerService playerService;
TitleScreen titleScreen;

void setup() {
  size(1000, 700);
  titleScreen = new TitleScreen();
}

ArrayList<Animation> animations = new ArrayList<Animation>();
// Animations that are should no longer be running
ArrayList<Animation> toBeRemoved = new ArrayList<Animation>();

void draw() {
  if (board == null) return;
  board.timer.run();
  for (Animation a : animations) {
    a.run();
  }
  for (Animation a : toBeRemoved) {
    animations.remove(a);
  }
}
