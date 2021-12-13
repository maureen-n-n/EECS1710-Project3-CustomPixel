class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;
 
  boolean isRunning = false;

  
  Dot(float x, float y, color _col) {
    position = new PVector(width/2, height/2);
    target = new PVector(random(width), random(height));
    col = _col;
    
    float b = brightness(col) / 255;
    speed = b / 100;
    dotSize = abs(10 - (b * 10)) + 10;
  }
  
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isRunning = position.dist(mousePos) < 100;
  
    if (isRunning) {
      position = position.lerp(target, 0.08);
      if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
      }
    }
   
    position.lerp(target, speed);
  
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }

}
