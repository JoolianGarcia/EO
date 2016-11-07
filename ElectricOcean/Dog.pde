class Dog {
  
  /*------------Properties----------------*/
  int xPos;
  int yPos;
  PImage img;


  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public Dog(int xPos_, int yPos_) {
    /*------------Properties----------------*/
    xPos_ = xPos;
    yPos_ = yPos;
    //calls sprite
    img = loadImage("dog.png");
  } 


  void display() {

    image(img, xPos, yPos);

    //set bounds for dog within playing zone
    if (xPos < 0) {

      xPos = 0;
    };

    if (xPos > width-50) {

      xPos = width-50;
    };


    if (yPos < 50) {
      yPos = 50;
    }

    if (yPos > height-50) {

      yPos =  height-50;
    }
  }
}

