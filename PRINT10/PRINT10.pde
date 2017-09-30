/** AUTHOR:
Cosas de Puma (https://github.com/cosasdepuma) */

/** INSPIRED BY:
10PRINT, a one-line Commodore 64 program (10print.org) 
The Coding Train (https://www.youtube.com/watch?v=bEyTZ5ZZxZs) */

// position and separation variables
int x = 0, y = 0, space = 20;

void setup()
{
  // black screen and white lines
  size (600, 600);
  background (0);
  stroke (255);
}

void draw()
{
  // randomly draw \ or /
  if (random (1) < 0.5)
  {
    // draw a \
    line (x, y, x + space, y + space);
  } else {
    // draw a /
    line (x, y + space, x + space, y);
  }

  // move x and y to next position inside the window
  x = x + space;
  if (x > width)
  {
    x = 0;
    y = y + space;
  }
  
  // if is no more screen, stop the program
  if (y > height)
  {
    noLoop();
  }
}