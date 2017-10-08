int repeat = 1, maximum = 8;
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

private void fractalCircle(float x, float y, float r, int c)
{
  if(r > 2 && c < repeat)
  {
    ellipse(x, y, r, r);
    
    fractalCircle(x + r/2, y, r * 0.5, c + 1);
    fractalCircle(x - r/2, y, r * 0.5, c + 1);
    fractalCircle(x, y + r/2, r * 0.5, c + 1);
    fractalCircle(x, y - r/2, r * 0.5, c + 1);
  }
  return;
}