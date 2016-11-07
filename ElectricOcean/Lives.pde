class Lives {

  PFont font = loadFont("NewsGothicStd-Bold-36.vlw");

  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public Lives(int lives_) {

    lives_ = livesLeft;
  }



  void display() {

    textFont(font);
    textSize(36);
    fill(255);
    //Passes amount of lives to display
    text(livesLeft+"/3", 50, 25);
  }
}

