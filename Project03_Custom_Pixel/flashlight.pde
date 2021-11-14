void flashlight(){
  // Code Inspired by Daniel Shiffman 
  // https://processing.org/examples/brightnesspixels.html
   for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 150;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      // color c = color(r);  Makes it black and white 
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}
