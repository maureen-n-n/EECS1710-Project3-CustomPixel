/** Ghost Class **/

class Ghost {
  /** An object the user has to click **/
  boolean clicked, attacking;
  float x, y, speed;
  
  Ghost(){
    clicked = false;
    attacking = false;
    x = random(width);
    y = random(height);
    speed = 5;
  }
  
  boolean on_ghost(){
    /** Determines if the mouse is on the circle
      Code Inspired by: https://processing.org/examples/button.html
    **/
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < 200/2 ) {
      return true;
    } else{
      return false;
    }  
  }
  
  
  void draw() {
     imageMode(CENTER);
     image(ghostimg, x, y, width/4, height/4);
     //ellipseMode(CENTER);
     //noStroke();
     //fill(0);
     //ellipse(x, y, 220, 220);
     
     x=x-speed;
     if(x<=0){
      attacking=true;
      x=width;
      y=random(height);
     }
   
     println(on_ghost());
    
  }
  
  void run() {
    draw();
  }
  
}
