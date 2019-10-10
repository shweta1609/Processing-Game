class Candies{
  float size;
  float x,y;
  boolean visible;
  float r,g,b;
  
  Candies(){
    //size = 30;
    x = random(20,width-20);
    y = random(height/3+100, height-300);
    visible = true;
    r = random(100,255);
    g = random(0,150);
    b = random(0,50);
  }
  
  void drawCandy(){
    if(x > 10 && x < width - 10){
      x = x+ random(-5,5);
    }
    else{
      x = 30;
    }
    stroke(0);
    strokeWeight(2);
    fill(r,g,b);
    ellipse(x,y,12,10);
    triangle(x-5,y-3,x-10,y,x-8,y-7);
    triangle(x+5,y+3,x+10,y,x+8,y+7);
  }
  
  void display(){
    if (visible){
      drawCandy();
    }
  } 

}
