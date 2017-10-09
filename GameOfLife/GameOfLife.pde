int gridSz = 30;
Cell[][] cell;

void setup ()
{
  size(600,600);
  frameRate(2);
  cell = new Cell[width/gridSz][height/gridSz];
  initCells(gridSz);
  createCells();
}

void draw ()
{
  background(255); // clear background with white
  drawGrid(gridSz);
  drawCells(gridSz);
  updateCells(gridSz);
}

private void drawGrid(int sz)
{
 for(int i = 0; i < height; i += sz)
 {
   line(i, 0, i, height);
   line(0, i, width , i);
 }
}

private void initCells(int sz)
{
 for(int i = 0; i < width/sz; i++)
 {
   for(int j = 0; j < height/sz; j++)
   {
     cell[i][j] = new Cell(false);
   }
 }
}

private void createCells()
{
  cell[2][2] = new Cell(true);
  cell[3][3] = new Cell(true);
  cell[4][1] = new Cell(true);
  cell[4][2] = new Cell(true);
  cell[4][3] = new Cell(true);
}

private void drawCells(int sz)
{
 for(int i = 0; i < width/sz; i++)
 {
   for(int j = 0; j < height/sz; j++)
   {
     pushMatrix();
     translate(i*sz,j*sz);
     cell[i][j].show(sz);
     popMatrix();
   }
 }
}


private void updateCells(int sz)
{
  Cell[][] newCell = new Cell[width/gridSz][height/gridSz];
  
  for (int i = 0; i < width/sz; i++)
  {
    for (int j = 0; j < height/sz; j++)
    {
      int neight = 0;
      
      // left
      if( i - 1 >= 0 ) {
        if( j - 1 >= 0 ) if(cell[i-1][j-1].getState()) neight++;
        if(cell[i-1][j].getState()) neight++;
        if( j + 1 < height/sz ) if(cell[i-1][j+1].getState()) neight++;
      }
      
      //middle
      if( j - 1 >= 0 ) if(cell[i][j-1].getState()) neight++;
      if( j + 1 < height/sz ) if(cell[i][j+1].getState()) neight++;
      
      //right
      if( i + 1 < width/sz ) {
        if( j - 1 >= 0 ) if(cell[i+1][j-1].getState()) neight++;
        if(cell[i+1][j].getState()) neight++;
        if( j + 1 < height/sz ) if(cell[i+1][j+1].getState()) neight++;
      }
      
      // update cells
      if (cell[i][j].getState() && (neight == 2 || neight == 3))
        newCell[i][j] = new Cell(true);
      else if((!cell[i][j].getState()) && neight == 3)
        newCell[i][j] = new Cell(true);
      else
        newCell[i][j] = new Cell(false);
    }
  }
  
  cell = newCell;
}