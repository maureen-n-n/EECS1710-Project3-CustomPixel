PImage img, imgOrig, ghostimg;
Ghost ghost;

void setup() {
  size(1280, 1000, P2D);
 
  // Have to resize the image to the size of the screen so pixels[loc] will be in index
  imgOrig = loadImage("forest.jpg");
  ghostimg = loadImage("ghost.png");
  
  
  imgOrig.resize(1280, 1000);
  imgOrig.loadPixels();
  
  img = imgOrig.get();
  img.loadPixels();
  loadPixels();
  
  ghost = new Ghost();
}

void draw() {
  flashlight();
  // Dont need this if flashlight is active
  // image(img, 0, 0);
  ghost.run();
    
  if (ghost.attacking==true){
    tint(255,0,0,100);
    image(ghostimg, 0,0);
    // set all pixels red for a short amount of time
    //for (int i=0; i<img.pixels.length; i++) {
    //  //if (i % index1 == 0) {
    //    img.pixels[i] = color(255,0,0);
      
    //  // }
    
    
  } 
  
}

void mousePressed() {
  if (ghost.on_ghost()==true){
    ghost.x=width;
    ghost.y=random(height);
    ghost.attacking=false;
    ghost.speed+=1.5;
    

}

}
