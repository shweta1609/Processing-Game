class LevelUp{
  float x,y;
  
  LevelUp(){
    x = width-random(40,stage*50);
    y = height-random(400,stage*10);
  }
  
  void displayDoor(int stage){
    stroke(random(0,50));
    fill(random(180,220),random(180,200),random(150,225));
    strokeWeight(3);
    rect(x,y,40/stage,200/stage);    
  }
}
