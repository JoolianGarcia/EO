class Score {

  PFont font = loadFont("NewsGothicStd-Bold-36.vlw");

  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public Score() {
  }

  void display(int gameTime) {
    //sets up displayed timer 
    textFont(font);
    textSize(36);
    fill(255);
    text(gameTime, 460, 25);
  }
}

