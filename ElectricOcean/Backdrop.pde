class Backdrop {


  PFont font4 = loadFont("Scrawl3rd-100.vlw");


  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public Backdrop() {
    /*------------Properties----------------*/
  } 


  void display() {
    //backdrop
    fill(0);
    rect(0, 0, width, height/10);
    fill(176, 196, 222);
    rect(-5, 50, width+5, height/10);
    fill(119, 136, 153);
    rect(-5, 100, width+5, height/10);
    fill(176, 196, 222);
    rect(-5, 150, width+5, height/10);
    fill(119, 136, 153);
    rect(-5, 200, width+5, height/10);
    fill(176, 196, 222);
    rect(-5, 250, width+5, height/10);
    fill(119, 136, 153);
    rect(-5, 300, width+5, height/10);
    fill(176, 196, 222);
    rect(-5, 350, width+5, height/10);
    fill(119, 136, 153);
    rect(-5, 400, width+5, height/10);
    fill(176, 196, 222);
    rect(-5, 450, width+5, height/10);
    fill(200, 60);
    rect(0, 50, 50, height);
    rect(100, 50, 50, height);
    rect(200, 50, 50, height);
    rect(300, 50, 50, height);
    rect(400, 50, 50, height);

    //Game Logo
    textFont(font4);
    textSize(36);
    fill(255);
    text("EO", width/2, 20);
  }
}

