int repeat = 1, maximum = 8;
boolean colors = false;
float diameter = 600;

public void setup()
{
  size(600,600);
  noFill();
  ellipseMode(CENTER);
  stroke(255);
  frameRate(1);
}


public void draw()
{
  background(50);
  fractalCircle(width/2, height/2, diameter/2, 1);
  if (repeat < maximum)
  {
    repeat = repeat + 1;
  } else {
    repeat = 1;
  }
}

public void keyPressed()
{
  if(colors)
    colors = false;
   else
    colors = true;
}

private void fractalCircle(float x, float y, float r, int c)
{
  if(r > 2 && c < repeat)
  {
    if(colors)
      stroke(random(155)+100, random(155)+100, random(155)+100);
    ellipse(x, y, r, r);
    
    fractalCircle(x + r/2, y, r * 0.5, c + 1);
    fractalCircle(x - r/2, y, r * 0.5, c + 1);
    fractalCircle(x, y + r/2, r * 0.5, c + 1);
    fractalCircle(x, y - r/2, r * 0.5, c + 1);
  }
  return;
}