class EndScreen {

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
  public EndScreen() {
  }


  void display() {

    background(119, 136, 153);
    //aligns all text to center point
    textAlign(CENTER, CENTER);

    //Game Title
    textFont(font);
    textSize(24);
    fill(0);
    text("You were able to infiltrate the Stock Market", width/2, height/4);


    //Game Logo
    textFont(font4);
    textSize(70);
    fill(0);
    text("EO", width/2, height/2);

    //A Time Close to Now
    textFont(font2);
    textSize(12);
    fill(50);
    text("9hfg92ug", width/2, height /3.3);

    //Press Spacebar to start
    textFont(font3);
    textSize(16);
    fill(0);
    text("Thanks for playing", width/2, 400);
  }
}

