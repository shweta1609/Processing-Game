class Character{
  float x;
  float y;
  int life;
  float x_speed, y_pos;
  boolean isAlive;
  boolean step;
  boolean moveLeft, moveRight, moveUp, midAir;
  
  Character(float xPos, float yPos){
    x = xPos;
    y = yPos;
    life = 3;
    isAlive = true;
    step = true;
  }
  
  void display(){
    x_speed = 0;
    if(moveRight && x< width-20) x_speed += 20;
    if(moveLeft && x > 20) x_speed -= 20;
    x += x_speed;
    
    if(moveUp && !midAir){
      midAir = true;
      y_pos = -40;
    }
    y +=y_pos;
    y_pos +=3;
    if(y>=ground){
      y = ground;
      midAir =false;
      moveUp = false;
      y_pos = 0;
    }
    if(moveUp){
      jump();
    }
    else if (moveRight || moveLeft){
      walk();
    }
    else
    stand();
      
  }
  
  void drawChar(){
    stroke(0);
    strokeWeight(2);
    //cap
    fill(0);
    rect(x-2,y-5,20,5,25,15,150,5);
    //face
    fill(#FCEAB8);
    rect(x,y,15,20,10,10,150,5);
    //eyes
    fill(255);
    ellipse(x+12,y+7,4,8);
    fill(0);
    ellipse(x+13,y+10,2,3);
    //neck
    rect(x+3,y+20,8,3);
    fill(#712236);
    //upper body
    rect(x,y+22,12,30,5,180,180,5);
    //quad(50,50,60,50,80,80,70,80);
    stroke(0);
    strokeWeight(2);
    line(x+10,y+16,x+14,y+16);
  }
  
  void stand(){
    drawChar();
    strokeWeight(5);
    stroke(#131CBC);
    //leg1.1
    line(x+5,y+52,x+1,y+67);
    line(x-2,y+72,x+1,y+67);
    //leg1.2
    line(x+9,y+52,x+13,y+67);
    line(x+13,y+72,x+13,y+67);
    stroke(#712236);
    //hand1
    line(x+6,y+25,x+16,y+42);
    //hand2
    line(x-2,y+35,x-6,y+42);
  }
  
  void walk(){
    drawChar();
      strokeWeight(5);
      if(step){
        stroke(#131CBC);
        //leg2.1
        line(x+5,y+52,x-2,y+65);
        line(x-6,y+72,x-2,y+65);
        //leg2.2
        line(x+9,y+52,x+10,y+65);
        line(x+6,y+72,x+10,y+65);
        stroke(#712236);
        //hand1
        line(x+6,y+25,x+20,y+40);
        //hand2
        line(x-2,y+35,x-8,y+40);
        step = !step;
        }
      else{
        stroke(#131CBC);
        //leg1.1
        line(x+5,y+52,x+1,y+67);
        line(x-2,y+72,x+1,y+67);
        //leg1.2
        line(x+9,y+52,x+13,y+67);
        line(x+13,y+72,x+13,y+67);
        stroke(#712236);
        //hand1
        line(x+6,y+25,x+16,y+42);
        //hand2
        line(x-2,y+35,x-6,y+42);
        step = !step;
       }
   }
  
  void jump(){
    drawChar();
    strokeWeight(5);
    stroke(#131CBC);
    //leg2.1
    line(x+5,y+52,x-2,y+65);
    line(x-6,y+72,x-2,y+65);
    //leg2.2
    line(x+9,y+52,x+10,y+65);
    line(x+6,y+72,x+10,y+65);
    stroke(#712236);
    //hand1 (to jump)
    line(x+6,y+25,x+20,y+10);
    //hand2
    line(x-2,y+35,x-8,y+40);
  }
  
  void reduceLife(){
    life = life - 1;
    if (life == 0){
      isAlive = false;
    }
    else{
      x = 30;
      y = ground;
    }
  }
  void resetStage(){
    for(int i=0; i<(stage+5);i++){
      if(candies[i].visible == false){
        score = score -1;
        candies[i].visible = true;
      }
    }
    reset = false;
  }
  
  void displayLife(){
    strokeWeight(2);
    textSize(18);
    textAlign(CENTER);
    fill(0);
    text("Life:"+str(life), width/2,70);
  }
  
  void displayScore(){
    strokeWeight(2);
    textSize(18);
    textAlign(RIGHT);
    fill(0);
    text("Score:"+str(score), width-50,70);
  }
  
  void displayStage(){
    strokeWeight(2);
    textSize(18);
    textAlign(LEFT);
    fill(0);
    text("Stage:"+str(stage), 50,70);
  }
 }
