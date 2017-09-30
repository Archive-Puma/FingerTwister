/** AUTHOR:
Cosas de Puma (https://github.com/cosasdepuma) */

/** INSPIRED BY:
Recursivity - Draw a Beautiful Fractal Tree (http://gregtatum.com/interactive/2014/recursive-3-draw)
The Coding Train (https://www.youtube.com/watch?v=0jjeOYMjmDU) */

int alpha = 255;
float cutter = 0.7;
float initLen = 150;
float angle = PI/6.5;

color palette = color(90, 43, 11);

public void setup()
{
  size (600,600);
  background (255);
}

public void draw()
{
  translate(width/2, height);
  branch(initLen, palette, alpha);
  noLoop();
}

private void branch(float len, color palette, int alpha)
{
  alpha = alpha - 25;
  palette = palette + 10;
  
  stroke(palette);
  strokeWeight(len / 15.0);
  float newLen = len * cutter;
  
  if (len > 4) {
    line (0,0, 0, -len);
    
    pushMatrix();
    translate(0, -len);
    rotate(angle);
    branch(newLen, palette, alpha);
    popMatrix();
    
    pushMatrix();
    translate(0, -len);
    rotate(-angle);
    branch(newLen, palette, alpha);
    popMatrix();
  }
}