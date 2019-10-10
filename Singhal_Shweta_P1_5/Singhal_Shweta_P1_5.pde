import ddf.minim.*;

PImage groundImg;
Character mychar;
Candies[] candies;
Danger[] danger;
LevelUp level;
boolean swap,stop,jump, newstage, reset;
int stage, score;
float ground, dist;
Minim minim;
AudioPlayer candy, dead, gameOver, gameStart, levelup;
void setup(){
   size(1000,800);
   ground = height - 250;
   mychar = new Character(30,ground-50);
   swap = false;
   stop = true;
   jump = false;
   reset = false;
   frameRate(10);
   stage = 0;
   score = 0;
   candies = new Candies[11];
   for(int i=0; i<11 ; i++){
    candies[i] = new Candies();
  }
  danger = new Danger[4];
  for(int i=0; i<4; i++){
    danger[i] = new Danger(i);
  }
  level = new LevelUp();
  newstage = true;
  groundImg = loadImage("ground.png");
  minim = new Minim(this);
  candy = minim.loadFile("score.wav");
  dead = minim.loadFile("dead.wav");
  gameOver = minim.loadFile("gameover.wav");
  gameStart = minim.loadFile("start.wav");
  levelup = minim.loadFile("levelup.wav");
  //All above sound-effects are fetched from source: https://themushroomkingdom.net/media/smb/wav

}

void draw(){
  //Welcome page to start the game
  if(stage == 0){
    gameStart.play();
    background(200);
    strokeWeight(4);
    textSize(24);
    textAlign(CENTER);
    fill(random(100,220),random(10,100),random(50,225));
    text("Welcome to Candy-land!! Click on the screen to collect some trick-o-treats...", width/2,height/2);
  }
  //Exit page after game is completed
  else if(stage == 4){
    gameOver.play();
    background(random(180,220),random(180,200),random(150,225));
    strokeWeight(4);
    textSize(32);
    textAlign(CENTER);
    fill(0);
    text("Congratulations, you won!! Click to play again....", width/2,height/2);
    mychar.displayScore();
  }
  //Game active for any of the 3 stages
  else{
    //see if character is alive, only then continue the game
    if(mychar.isAlive){
     background(#B2EBFF);
     //set candies and character position when a new stage is started
      if(newstage){
        mychar.x = 30;
        mychar.y = ground;
        for(int i=0; i<(5+stage); i++){
          candies[i].visible = true;
        }
        newstage = false;
      }
     //when all candies are collected in the stage, show door to move to next stage 
  if((score == 6 && stage ==1)|| (score == 13 && stage==2)|| (score == 21 && stage ==3)){
     level.displayDoor(stage);
  }
  //image captured for ground pattern, created through processing myself
  image(groundImg,0,height-190,width,200);
  //displaying the character based on the position
  mychar.display();
  //display candies according to the stage number
  for(int i=0; i<(5+stage) ; i++){
    candies[i].display();
  }
  //display danger hurdles according to the stage number
  for(int i=0; i<(2*(stage-1)); i++){
    danger[i].display();
  }
  //hide the candies collected by the character and increase the score
  for(int i=0; i<(5+stage) ; i++){
    dist = dist(mychar.x,mychar.y,candies[i].x,candies[i].y);
      if(dist<25 && candies[i].visible){
        candy.play();
        candy.rewind();
        candies[i].visible = false;
        score +=1;
      }
   }
   //allow to go to next stage when all candies collected and character has reached the door
   if(dist(mychar.x,mychar.y,level.x,(level.y+(150/stage))) <= 50/stage && ((score == 6 || score == 13 || score == 21))){
     stage += 1;
     newstage = true;
     levelup.play();
     levelup.rewind();
   }
   //take one life when character hits the danger hurdle
   for(int i=0; i<(2*(stage-1)) && i<4; i++){
    if(dist(mychar.x+20,mychar.y+70,danger[i].x,danger[i].y) <= 20){
     mychar.reduceLife();
     dead.play();
     dead.rewind();
     reset = true;
   }
  }
  //once the character hits danger, reset the current stage to start, losing the points collected for this stage
  if(reset){
    mychar.resetStage();
    reset = false;
  }
   mychar.displayScore();
   mychar.displayStage();
   mychar.displayLife();
  }
  //if the character has lost life 3 times, GAME OVER
  else{
    dead.pause();
    dead.rewind();
    gameOver.play();
    background(255);
    strokeWeight(4);
    textSize(28);
    textAlign(CENTER);
    fill(0);
    text("GAME OVER! You are DEAD....Click to start again", width/2,height/2);
    mychar.displayScore();
  }
 }
  
}

void keyPressed(){
  if(keyCode == UP){
    mychar.moveUp = true;
  }
  else if(keyCode == RIGHT){ 
    mychar.moveRight = true;    
  }
  else if(keyCode == LEFT){
    mychar.moveLeft = true;
  } 
}
void keyReleased() {
  if (keyCode == RIGHT) {
    mychar.moveRight = false;
  }
  if (keyCode == LEFT) {
    mychar.moveLeft = false;
  }
}

void mouseClicked(){
  //to start the game from message screen
  levelup.play();
  levelup.rewind();
  gameOver.rewind();
  stage = 1;
  score = 0;
  newstage = true;
  mychar.isAlive = true;
}
