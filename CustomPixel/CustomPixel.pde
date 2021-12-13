/** EECS1710 Project 3 - Custom Pixel 
    ------------Maureen Navera, Nov/Dec 2021------------
    
    This project breaks down the pixels of a picture and creates many dots which interact with
    the user's cursor. To see the pixels and draw the original picture, user's must click on their mouse.
    The dots which are made from the pixels of the original picture will avoid the mouse's cursor.
   
**/
PImage img;
ArrayList<Dot> dots;
int scaler = 20; // will use only every 20th pixel from the image

void setup() {
  size(1000, 1000, P2D);  
  img = loadImage("flower.png");
  
  img.loadPixels();
  dots = new ArrayList<Dot>();
}

void draw() { 
  background(0);
  
  for (Dot dot : dots) {
    dot.run();
  }
}

void mousePressed(){
  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      
      // this translates x and y coordinates into a location in the pixels array
      int loc = x + y * (img.width);
      
      dots.add(new Dot(x, y, img.pixels[loc]));
    }
  }
}

