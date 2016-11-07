class StartScreen {

  /*------------Properties----------------*/
  PFont font = loadFont("NewsGothicStd-Bold-36.vlw");
  PFont font2 = loadFont("NokianvirallinenkirjasinREGULAR-Regular-24.vlw");
  PFont font3 = loadFont("NewsGothicBT-Light-24.vlw");
  PFont font4 = loadFont("Scrawl3rd-100.vlw");
  int xPos;
  int yPos;


  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public StartScreen() {
  }


  void display() {

    background(119, 136, 153);
    //aligns all text to center point
    textAlign(CENTER, CENTER);

    //Game Title
    textFont(font);
    textSize(36);
    fill(0);
    text("Electric Ocean", width/2, height/4);


    //Game Logo
    textFont(font4);
    textSize(70);
    fill(0);
    text("EO", width/2, height/2);

    //A Time Close to Now
    textFont(font2);
    textSize(12);
    fill(50);
    text("A TIME CLOSE TO NOW", width/2, height /3.3);

    //Press Spacebar to start
    textFont(font3);
    textSize(16);
    fill(0);
    text("Press Any Key to Start", width/2, 400);
  }
}

