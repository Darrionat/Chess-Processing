class Timer {

  float x;
  float y;

  boolean on;
  long start;
  Timer() {
    x = width * .85;
    y = height * .5;
  }

  void start() {
    start = millis();
    on = true;
    this.drawBackground();
  }


  void run() {
    this.drawBackground();
    long current = millis();
    double totalSeconds = (current-start) / 1000;
    int minutes = (int) Math.floor(totalSeconds % 3600 / 60);
    int seconds = (int) Math.floor(totalSeconds % 60);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(40);
    
     String minutesStr = String.valueOf(minutes);
    if (minutes < 10){
     minutesStr = "0" + minutes; 
    }
    
    String secondsStr = String.valueOf(seconds);
    if (seconds < 10){
     secondsStr = "0" + seconds; 
    }
    text(minutesStr + ":" + secondsStr, x, y);
  }
  
  void drawBackground(){
    fill(0);
   rect(width * .7, 0, width * .3, height); 
  }

  void stop() {
  }
}
