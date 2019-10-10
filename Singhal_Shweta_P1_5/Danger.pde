class Danger{
  float x,y;
  
  Danger(int i){
    x = width/3+(i*150);
    y = height-190;
  }
  
  void display(){
    noStroke();
    fill(random(180,220),random(180,200),random(150,225));
    triangle(x,y,x-40 ,y,x-20, y-40);
  }
}
