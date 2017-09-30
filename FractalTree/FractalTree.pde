/** AUTHOR:
Cosas de Puma (https://github.com/cosasdepuma) */

/** INSPIRED BY:
Recursivity - Draw a Beautiful Fractal Tree (http://gregtatum.com/interactive/2014/recursive-3-draw)
The Coding Train (https://www.youtube.com/watch?v=0jjeOYMjmDU) */


float initLen = 150;
float angle = PI/8.0;

public void setup()
{
  size (600,600);
  background (50);
  stroke(255);
}

public void draw()
{
  translate(width/2, height);
  branch(initLen);
  noLoop();
}

private void branch(float len)
{
  float newLen = len * 0.7;
  
  if (len > 4) {
    line (0,0, 0, -len);
    
    pushMatrix();
    translate(0, -len);
    rotate(angle);
    branch(newLen);
    popMatrix();
    
    pushMatrix();
    translate(0, -len);
    rotate(-angle);
    branch(newLen);
    popMatrix();
  }
}