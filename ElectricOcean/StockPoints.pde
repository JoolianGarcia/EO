/*
 * This class represents the stock points that are to be avoided during the game
 * In the main tab of the game, an array is created for this class of objects.
 * Mover mover = new Mover(widht/2, height/2);
 * mover.applyForce(new PVector(0, 1)); // add a vertical force (eg. gravity)
 * mover.applyForce(new PVector(0.3, -0.2)); // add a diagonal force (eg. wind)
 * mover.update(); // update the instance's position, velocity and acceleration 
 // and reset the forces to zero
 * mover.display(); // display the object on the screen
 */


class StockPoints {

  /*------Properties----------*/
  
  //class variables: Position
  float xPos;
  int yPos;
  
  //class boolean: collision happening Y/N
  boolean testCollision;


  /*CONSTRUCTOR
   passes the following parameters to the object properties
   */
  public StockPoints(int xPos_, int yPos_) {

    xPos = xPos_;
    yPos = yPos_;
  }  


  void display() {
    rectMode(CENTER);
    stroke(0);
    rect(xPos, yPos, 10, 25);
    line(xPos, yPos-20, xPos, yPos+20 );
    rectMode(CORNER);
    noStroke();
  }

  //Animates Stockpoints from right to left
  //Speeds them up after alloted time as well as randomizes their location once they reach xPos = 0
  void animate() {

    xPos -= gameSpeed;
    if (xPos < 0) {

      xPos = width-random(-25, 50);
    }
  }


  /*Test for Collisions by proximity.
   *Based on handout provided on class website
   */

  boolean testCollision (Dog dog1) {
    // test for collision between dog and stockpoint
    float distance = dist(xPos, yPos, dog1.xPos+25, dog1.yPos+25 );
    float sumHalf = 30;

    if (distance < sumHalf) {
      //confirms collision if condition is true
      return true;
    } 
    //No collision
    return false;
  }
}

