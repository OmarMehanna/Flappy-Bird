// boolean variables to make the Score to be incremented only once per each condition
boolean IncrementedAt300 = false;
boolean IncrementedAt500 = false;
boolean IncrementedAt700 = false;
boolean IncrementedAt900 =false;
boolean IncrementedAt1100 = false;
boolean IncrementedAt1300 =false;

boolean ClearText = false; // variable to control when to remove the how to play information

String howtoplay = "Click Left or Right Mouse Button and Release To Make the Bird Fly"; // this variable stores how to play information text

int Score = 0; // Score counter

boolean waitingforclick = true; // variable to store the state of the bird

float jumpStartTime; // variable to store time in milliseconds

final float gravity = 0.5; // a constant that holds the pulling gravity value of the bird

float VelX = 0; // variable storing the velocity of the bird at the x-coordinate, (the x-coordinate of the top left corner)
float VelY = 0; // variable storing the velocity of the bird at the y-coordinate, (the y-coordinate of the top left corner)

boolean up = false; // variable storing the state of the bird, wether it is going up or going down

float rectX = 70; // variable storing the x-coordinate of the bird(the x-coordinate of the top left corner)
float rectY = 500; // variable storing the y-coordinate of the bird(the y-coordinate of the top left corner)

// the function that calculates the score
void CountScore() {
  /*
  if the bird passes the first set of blocks infront of each other successfully
  AND IncrementedAt300 is false meaning that the Score was not incremented before from that specific condition 
  then incement the Score
  */
  if (rectX > 300 && IncrementedAt300 == false) {
    IncrementedAt300 = true; // we did that to stop the score from incrementing again as the CountScore is in the draw() function which is called many times.
    Score++;
    fill(0, 0, 0);
    textSize(30);
    text("Score: " + Score, 34, 819);
  }
  if (rectX > 500 && IncrementedAt500 == false) {
    IncrementedAt500 = true;
    Score++;
    fill(0, 0, 0);
    textSize(30);
    text("Score: " + Score, 34, 819);
  }
  if (rectX > 700 && IncrementedAt700 == false) {
    IncrementedAt700 = true;
    Score++;
    fill(0, 0, 0);
    textSize(30);
    text("Score: " + Score, 34, 819);
  }
  if (rectX > 900 && IncrementedAt900 == false) {
    IncrementedAt900 = true;
    Score++;
    fill(0, 0, 0);
    textSize(30);
    text("Score: " + Score, 34, 819);
  }
  if (rectX > 1100 && IncrementedAt1100 == false) {
    IncrementedAt1100 = true;
    Score++;
    fill(0, 0, 0);
    textSize(30);
    text("Score: " + Score, 34, 819);
  }
  if (rectX > 1300 && IncrementedAt1300 == false) {
    IncrementedAt1300 = true;
    Score++;
  }
  // Now if the Score is equal to 6 meaning that we passed all sets of blocks successfully, the game is going to stop meaning that you won.
  if (Score == 6) {
    stop();
    fill(0, 153, 153);
    textSize(80);
    text("YOU WON!", 450, height/2);
  }
}
void setup() {
  size(1350, 900);// window size
}

// the function that executes whenever the mouse is clicked to make the bird fly
void mouseClicked() { 
  ClearText = true; // game started so clear the how to play info text
  up = true; // 
  jumpStartTime = millis(); // opens a timer 
  VelY = -3; // speed of the bird in relation to the y-axis, this velocity makes the bird goes up
  VelX = 2.5;// speed of the bird in relation to the x-axis, this velocity makes the bird goes to the right
}
// the function that executes when the mouse is released, making the bird go down
void mouseReleased() {
  waitingforclick = false; // the bird is going down now
  up = false;
}
void draw() {
  background(224, 224, 224);
  fill(50, 150, 250);
  
  fill(0, 128, 255);
  textSize(30);
  text(howtoplay, 300, height/2);
  if (ClearText == true) {
    howtoplay = " "; // clears the how to play information once you start playing, it becomes a space
  }
  
  // the following block of code builds the below blocks in the game
  fill(204, 204, 0);
  rect(200, 700 ,100, 300);
  
  fill(255, 178, 102);
  rect(400, 550 ,100, 1000);
  
  fill(153, 255, 51);
  rect(600, 650 ,100, 500);
  
  fill(229, 204, 255);
  rect(800, 600 ,100, 700);
  
  fill(128, 128, 128);
  rect(1000, 500 ,100, 1000);
  
  fill(204, 204, 204);
  rect(1200, 650 ,100, 1000);
  
  
  // the following block of code builds the upper blocks in the game
  fill(204, 204, 204);
  rect(200, 0 ,100, 250);
  
  fill(128, 128, 128);
  rect(400, 0 ,100, 100);
  
  fill(229, 204, 255);
  rect(600, 0 ,100, 300);
  
  fill(153, 255, 51);
  rect(800, 0 ,100, 200);
  
  fill(255, 178, 102);
  rect(1000, 0 ,100, 200);
  
  fill(204, 204, 0);
  rect(1200, 0 ,100, 300);
  
  // this creates the square(the bird)
  fill(255, 255, 0);
  rect(rectX, rectY, 70, 70);
  
  /*
  if the bird is going up(flying)
  AND the difference representing the time since the bird started flying is less than 300 milliseconds
  */
  if (up && (millis() - jumpStartTime < 300)) {
    VelY = -3; // keep going up with the same speed
  } else if(waitingforclick == false){ // if the the bird(square) is going down
    VelY = VelY + gravity; // pull the bird down
    up = false;
  }
  
  rectX = rectX + VelX; // updates the position of rectY
  rectY = rectY + VelY; // updates the position of rectY
  
  // this if statement ends the game if the the bird collides with any of the upper blocks
  if (((rectY > 0 && rectY < 249) && (rectX > 130 && rectX < 300) )
  || ((rectY > 0 && rectY < 99) && (rectX > 330 && rectX < 500))
  || ((rectY > 0 && rectY < 300) && (rectX > 530 && rectX < 700))
  || ((rectY > 0 && rectY < 200) && (rectX > 730 && rectX < 900))
  || ((rectY > 0 && rectY < 200) && (rectX > 930 && rectX < 1100))
  || ((rectY > 0 && rectY < 300) && (rectX > 1130 && rectX < 1300))){
    stop();
    textSize(60);
    fill(0, 0, 0);
    text("Game Over", 658, 465);
    
    //the follwing block of code fills the below blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 700 ,100, 300);
  
    fill(255, 0, 0);
    rect(400, 550 ,100, 1000);
  
    fill(255, 0, 0);
    rect(600, 650 ,100, 500);
  
    fill(255, 0, 0);
    rect(800, 600 ,100, 700);
  
    fill(255, 0, 0);
    rect(1000, 500 ,100, 1000);
  
    fill(255, 0, 0);
    rect(1200, 650 ,100, 1000);
  
  
    // the follwing block of code fills the upper blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 0 ,100, 250);
  
    fill(255, 0, 0);
    rect(400, 0 ,100, 100);
  
    fill(255, 0, 0);
    rect(600, 0 ,100, 300);
  
    fill(255, 0, 0);
    rect(800, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1000, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1200, 0 ,100, 300);
  }
  else{
      CountScore();// call CountScore() if the bird is not colliding with the upper blocks
  }
  
  // this if statement ends the game if the the bird collides with any of the below blocks
  if (((rectY > 632 && rectY < 899) && (rectX > 130 && rectX < 300)) 
  || ((rectY > 482 && rectY < 899) && (rectX > 330 && rectX < 500))
  || ((rectY > 582 && rectY < 899) && (rectX > 530 && rectX < 700))
  || ((rectY > 532 && rectY < 899) && (rectX > 730 && rectX < 900))
  || ((rectY > 432 && rectY < 899) && (rectX > 930 && rectX < 1100))
  || ((rectY > 582 && rectY < 899) && (rectX > 1130 && rectX < 1300))){
    stop();
    fill(0, 0, 0);
    textSize(60);
    text("Game Over", 550, height/2);
    
    //the following block of code fills the below blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 700 ,100, 300);
  
    fill(255, 0, 0);
    rect(400, 550 ,100, 1000);
  
    fill(255, 0, 0);
    rect(600, 650 ,100, 500);
  
    fill(255, 0, 0);
    rect(800, 600 ,100, 700);
  
    fill(255, 0, 0);
    rect(1000, 500 ,100, 1000);
  
    fill(255, 0, 0);
    rect(1200, 650 ,100, 1000);
  
    //the follwing block of code fills the upper blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 0 ,100, 250);
  
    fill(255, 0, 0);
    rect(400, 0 ,100, 100);
  
    fill(255, 0, 0);
    rect(600, 0 ,100, 300);
  
    fill(255, 0, 0);
    rect(800, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1000, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1200, 0 ,100, 300);
  }
   else{
      CountScore(); // call CountScore() if the bird is not colliding with the below blocks
  }
  
  // this if statement ends the game if the the bird collides with the ceiling
  if (rectY < 1) {
    fill(0, 0, 0);
    textSize(60);
    text("Game Over", 550, height/2);
    stop();
    
    //the follwing block of code fills the below blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 700 ,100, 300);
  
    fill(255, 0, 0);
    rect(400, 550 ,100, 1000);
  
    fill(255, 0, 0);
    rect(600, 650 ,100, 500);
  
    fill(255, 0, 0);
    rect(800, 600 ,100, 700);
  
    fill(255, 0, 0);
    rect(1000, 500 ,100, 1000);
  
    fill(255, 0, 0);
    rect(1200, 650 ,100, 1000);
  
    //the follwing block of code fills the upper blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 0 ,100, 250);
  
    fill(255, 0, 0);
    rect(400, 0 ,100, 100);
  
    fill(255, 0, 0);
    rect(600, 0 ,100, 300);
  
    fill(255, 0, 0);
    rect(800, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1000, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1200, 0 ,100, 300);
  }
   else{
      CountScore(); // calls CountScore() if the bird didn't collide with the ceiling
  }
  
  // this if statement ends the game if the the bird collides with the floor
  if (rectY  > (height - 58)) {
    fill(0, 0, 0);
    textSize(60);
    text("Game Over", 550, height/2);
    stop();
    
    //the follwing block of code fills the below blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 700 ,100, 300);
  
    fill(255, 0, 0);
    rect(400, 550 ,100, 1000);
  
    fill(255, 0, 0);
    rect(600, 650 ,100, 500);
  
    fill(255, 0, 0);
    rect(800, 600 ,100, 700);
  
    fill(255, 0, 0);
    rect(1000, 500 ,100, 1000);
  
    fill(255, 0, 0);
    rect(1200, 650 ,100, 1000);
  
  
    //the follwing block of code fills the upper blocks with red if you lose
    fill(255, 0, 0);
    rect(200, 0 ,100, 250);
  
    fill(255, 0, 0);
    rect(400, 0 ,100, 100);
  
    fill(255, 0, 0);
    rect(600, 0 ,100, 300);
  
    fill(255, 0, 0);
    rect(800, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1000, 0 ,100, 200);
  
    fill(255, 0, 0);
    rect(1200, 0 ,100, 300);
  } else {
    CountScore(); // calls CountScore() if the bird didn't collide with the floor
  }
  
  // prints Score to the window
  textSize(30);
  fill(0, 0, 0);
  text("Score: " + Score, 34, 800);
}
