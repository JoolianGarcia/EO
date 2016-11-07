

/*Title: Breakout Mod
 *Author: Julian Garcia
 *Course: CART253
 *Date: January 15th, 2015
 *Description: 
 * Electric Ocean (A Time Close to Now) serves as an introduction to an original science fiction story 
 * where a pack of sentinel dogs manifest the emergence of a form of Artificial Intelligence. 
 * This AI originates inside a High Frequency Trading computer in Wall Street. 
 * In the game, players assume the perspective of a dog inside the stock market. If they are hit by 3 stock points, the market opens and they become ethereal once again. 
 * The goal of the game is to survive inside the Stock Market for as long as possible.
 
 */

//Imports Minim sound library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;



//Calls Instances of classes used in game
Backdrop setting1;
Dog dog1;
StockPoints [] pointsarray = new StockPoints [26];
StartScreen screen1;
EndScreen screen4;
Score score1;
Lives lives1;
Minim minim;
AudioPlayer player;

//Creates states for different parts of the program
int state = 0;

//Amount of lives
int livesLeft = 3;

//Game Timer
int gameTime = 0;
float startGameTime = 0;

//Initial game speed
int gameSpeed = 1;

//Initial collision state
boolean ignoreCollision = false;

//Variable for disabling collision when ignoreCollision = true
int startTimer = 0;
int timePassed;

void setup() {
  //initializes canvas
  size(500, 500);
  noStroke();
  smooth();

  //initializes game objects
  dog1 = new Dog(50, 200);
  setting1 = new Backdrop();
  screen1 = new StartScreen();
  screen4 = new EndScreen();
  score1 = new Score();
  lives1 = new Lives(livesLeft);
  minim = new Minim(this);
  player = minim.loadFile("VFX1 Tonal FX 02 G#.wav");

  //Populates and initializes array
  //First Lane
  pointsarray[0] = new StockPoints(525, 75);
  pointsarray[1] = new StockPoints(650, 75);
  pointsarray[2] = new StockPoints(800, 75);

  //Second Lane
  pointsarray[3] = new StockPoints(525, 125);
  pointsarray[4] = new StockPoints(650, 125);
  pointsarray[5] = new StockPoints(900, 125);

  //Third Lane
  pointsarray[6] = new StockPoints(500, 175);
  pointsarray[7] = new StockPoints(620, 175);
  pointsarray[8] = new StockPoints(750, 175);

  //Fourth Lane
  pointsarray[9] = new StockPoints(700, 225);
  pointsarray[10] = new StockPoints(800, 225);
  pointsarray[11] = new StockPoints(820, 225);

  //Fifth Lane
  pointsarray[12] = new StockPoints(550, 275);
  pointsarray[13] = new StockPoints(700, 275);
  pointsarray[14] = new StockPoints(710, 275);

  //Sixth Lane
  pointsarray[15] = new StockPoints(700, 325);
  pointsarray[16] = new StockPoints(780, 325);
  pointsarray[17] = new StockPoints(900, 325);

  //Seventh Lane
  pointsarray[18] = new StockPoints(600, 375);
  pointsarray[19] = new StockPoints(690, 375);
  pointsarray[20] = new StockPoints(950, 375);

  //Eight Lane
  pointsarray[21] = new StockPoints(540, 425);
  pointsarray[22] = new StockPoints(800, 425);
  pointsarray[23] = new StockPoints(980, 425);

  //Ninth Lane
  pointsarray[24] = new StockPoints(500, 475);
  pointsarray[25] = new StockPoints(540, 475);
  pointsarray[25] = new StockPoints(900, 475);
}

void draw() {

  //Runs intro screen if int state == 0
  if (state == 0) {
    screen1.display();
  }

  //Runs first level screen if int state == 1
  if (state == 1) {

    //checks for time
    if (gameTime < 30) {

      gameTime = (int)(millis()- startGameTime) / 1000;


      if (ignoreCollision == true) {

        timePassed = millis() - startTimer;

        if (timePassed > 1000) {

          ignoreCollision = false;
        }
      }

      //calls up instances of game elements needed
      setting1.display();
      score1.display(gameTime);
      dog1.display();
      lives1.display();

      //draws instances of object called through array
      for (int i = 0; i < pointsarray.length; i++) {

        pointsarray[i].display();
        pointsarray[i].animate();

        //calls up actions when collision is detected
        if (ignoreCollision == false) {
          if (pointsarray[i].testCollision(dog1) == true) {
            //dog has collided 
            println("crash");
            player.play();
            livesLeft --;
            startTimer = millis();
            timePassed = 0;
            ignoreCollision = true;
            player.rewind();
          }
        }
      }

      //restarts game if player runs out of lives
      if ( livesLeft == 0) {
        state = 0; 
        livesLeft = 3;
        dog1.xPos = 0;
        dog1.yPos = 50;
      }
    } else {
      //runs next level of game, increases speed and restarts timer
      state = 2; 
      gameSpeed = 2;
      gameTime = 0;
      startGameTime= millis();
    }
  }

  if (state == 2) {

    if (gameTime < 30) {

      gameTime = (int)(millis()- startGameTime) / 1000;
      
      if (ignoreCollision == true) {

        timePassed = millis() - startTimer;

        if (timePassed > 1000) {

          ignoreCollision = false;
        }
      }

      //calls up instances of game elements needed
      setting1.display();
      score1.display(gameTime);
      dog1.display();

      lives1.display();

      //draws instances of object called through array
      for (int i = 0; i < pointsarray.length; i++) {

        pointsarray[i].display();
        pointsarray[i].animate();

        //calls up actions when collision is detected
        if (ignoreCollision == false) {
          if (pointsarray[i].testCollision(dog1) == true) {
            //dog has collided 
            println("crash");
            player.play();
            livesLeft --;
            startTimer = millis();
            timePassed = 0;
            ignoreCollision = true;
            player.rewind();
          }
        }
      }

      if ( livesLeft == 0) {

        state = 0; 
        livesLeft = 3;
        dog1.xPos = 0;
        dog1.yPos = 50;
      }
    } else {
      //runs next level of game, increases speed and restarts timer
      state = 3; 
      gameSpeed = 3;
      gameTime = 0;
      startGameTime= millis();
    }
  }



  if (state == 3) {

    if (gameTime < 30) {

      gameTime = (int)(millis()- startGameTime) / 1000;

      if (ignoreCollision == true) {

        timePassed = millis() - startTimer;

        if (timePassed > 1000) {

          ignoreCollision = false;
        }
      }

      //calls up instances of game elements needed
      setting1.display();
      score1.display(gameTime);
      dog1.display();

      lives1.display();


      for (int i = 0; i < pointsarray.length; i++) {

        pointsarray[i].display();
        pointsarray[i].animate();

        if (ignoreCollision == false) {
          if (pointsarray[i].testCollision(dog1) == true) {
            //dog has collided 
            println("crash");
            player.play();
            livesLeft --;
            startTimer = millis();
            timePassed = 0;
            ignoreCollision = true;
            player.rewind();
          }
        }
      }

      if ( livesLeft == 0) {

        state = 0; 
        livesLeft = 3;
        dog1.xPos = 0;
        dog1.yPos = 50;
      }
    } else {
      //runs next level of game, increases speed and restarts timer
      state = 4; 
      gameSpeed = 3;
      gameTime = 0;
      startGameTime= millis();
    }
  }

  if (state == 4) {
    //runs game finished screen
    screen4.display();
  }
}


void keyPressed() {
  //triggers game once key is pressed
  if (state == 0) {
    //millis reset
    state = 1;
    gameTime = 0;
    startGameTime= millis();
  }

  //creates one direction at the time
  int k = keyCode;
  //specifies direction per key
  if (k == UP)   dog1.yPos-=50;
  else if (k == DOWN)   dog1.yPos+=50;
  else if (k == LEFT)   dog1.xPos -=50;
  else if (k == RIGHT)  dog1.xPos+=50;
}

