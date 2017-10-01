float angle = 0;
ArrayList<Box> boxes = new ArrayList<Box>();

public void setup()
{
  size(600,600,P3D);
  boxes.add(new Box(0,0,0, 150));
}

public void draw()
{
  background(50);
  translate(width/2, height/2, 0);
  rotateX(angle*0.2);
  rotateY(angle);
  rotateZ(angle*0.6);
  
  for(Box bx : boxes)
  {
    bx.show();
  }
  
  angle = angle + 0.01;
}

public void mousePressed()
{
  ArrayList<Box> newBoxes = new ArrayList<Box>();
  
  for(Box bx : boxes)
  {
    int sz = bx.info("sz") / 3;
    
    for(int i = -1; i < 2; i++)
    {
      for(int j = -1; j < 2; j++)
      {
        for(int k = -1; k < 2; k++)
        {
          if(abs(i) + abs(j) + abs(k) <= 1) {
            continue;
          }
          newBoxes.add(new Box(i + bx.info("x"), j + bx.info("y"), k + bx.info("z"), sz));
        }
      }
    }          
  }
  boxes.clear();
  boxes.addAll(newBoxes);
}