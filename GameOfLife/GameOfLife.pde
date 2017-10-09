/** https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life */

/* STILL LIFES */
static final char BLOCK = '0';
static final char BEEHIVE = '1';
static final char LOAF = '2';
static final char BOAT = '3';
static final char TUB = '4';

/* OSCILLATORS */
static final char BLINKER = '5';
static final char TOAD = '6';
static final char BEACON = '7';
static final char PULSAR = '8';
static final char PENTADECATHLON = '9';

Cell[][] cell;
int gridSz = 30;

void setup ()
{
  size(600,600);
  frameRate(2);
  // stoke
  stroke(100);
  strokeWeight(1.5);
  // initial Cells
  cell = new Cell[width/gridSz][height/gridSz];
  initCells(gridSz);
  
  createCells(PENTADECATHLON);
}

void draw ()
{
  background(255); // clear background with white
  drawCells(gridSz);
  drawGrid(gridSz);
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

private void createCells(int figure)
{
  int ctr = (int) width/(2*gridSz) -1;
  
  switch(figure)
  {
    // STILL LIFES //
    case '0': //BLOCK
      cell[ctr][ctr] = new Cell(true);
      cell[ctr][ctr+1] = new Cell(true);
      cell[ctr+1][ctr] = new Cell(true);
      cell[ctr+1][ctr+1] = new Cell(true);
      break;
    case '1': //BEEHIVE
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr+1][ctr-1] = new Cell(true);
      cell[ctr-1][ctr] = new Cell(true);
      cell[ctr+2][ctr] = new Cell(true);
      cell[ctr][ctr+1] = new Cell(true);
      cell[ctr+1][ctr+1] = new Cell(true);
      break;
    case '2': //LOAF
      cell[ctr][ctr-2] = new Cell(true);
      cell[ctr+1][ctr-2] = new Cell(true);
      cell[ctr-1][ctr-1] = new Cell(true);
      cell[ctr+2][ctr-1] = new Cell(true);
      cell[ctr][ctr] = new Cell(true);
      cell[ctr+2][ctr] = new Cell(true);
      cell[ctr+1][ctr+1] = new Cell(true);
      break;
    case '3': //BOAT
      cell[ctr-1][ctr-1] = new Cell(true);
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr-1][ctr] = new Cell(true);
      cell[ctr+1][ctr] = new Cell(true);
      cell[ctr][ctr+1] = new Cell(true);
      break;
    case '4': //TUB
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr-1][ctr] = new Cell(true);
      cell[ctr+1][ctr] = new Cell(true);
      cell[ctr][ctr+1] = new Cell(true);
      break;
      
    // OSCILATORS //
    case '5': //BLINKER
      cell[ctr-1][ctr] = new Cell(true);
      cell[ctr][ctr] = new Cell(true);
      cell[ctr+1][ctr] = new Cell(true);
      break;
    case '6': //TOAD
      cell[ctr-1][ctr-1] = new Cell(true);
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr+1][ctr-1] = new Cell(true);
      cell[ctr][ctr] = new Cell(true);
      cell[ctr+1][ctr] = new Cell(true);
      cell[ctr+2][ctr] = new Cell(true);
      break;
    case '7': //BEACON
      cell[ctr-1][ctr-1] = new Cell(true);
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr-1][ctr] = new Cell(true);
      cell[ctr+2][ctr+1] = new Cell(true);
      cell[ctr+1][ctr+2] = new Cell(true);
      cell[ctr+2][ctr+2] = new Cell(true);
      break;
    case '8': //PULSAR
      cell[ctr-4][ctr-6] = new Cell(true);
      cell[ctr-3][ctr-6] = new Cell(true);
      cell[ctr-2][ctr-6] = new Cell(true);
      cell[ctr-4][ctr-1] = new Cell(true);
      cell[ctr-3][ctr-1] = new Cell(true);
      cell[ctr-2][ctr-1] = new Cell(true);
      cell[ctr-6][ctr-4] = new Cell(true);
      cell[ctr-6][ctr-3] = new Cell(true);
      cell[ctr-6][ctr-2] = new Cell(true);
      cell[ctr-1][ctr-4] = new Cell(true);
      cell[ctr-1][ctr-3] = new Cell(true);
      cell[ctr-1][ctr-2] = new Cell(true);
      
      cell[ctr-4][ctr+6] = new Cell(true);
      cell[ctr-3][ctr+6] = new Cell(true);
      cell[ctr-2][ctr+6] = new Cell(true);
      cell[ctr-4][ctr+1] = new Cell(true);
      cell[ctr-3][ctr+1] = new Cell(true);
      cell[ctr-2][ctr+1] = new Cell(true);
      cell[ctr-6][ctr+4] = new Cell(true);
      cell[ctr-6][ctr+3] = new Cell(true);
      cell[ctr-6][ctr+2] = new Cell(true);
      cell[ctr-1][ctr+4] = new Cell(true);
      cell[ctr-1][ctr+3] = new Cell(true);
      cell[ctr-1][ctr+2] = new Cell(true);
      
      cell[ctr+4][ctr-6] = new Cell(true);
      cell[ctr+3][ctr-6] = new Cell(true);
      cell[ctr+2][ctr-6] = new Cell(true);
      cell[ctr+4][ctr-1] = new Cell(true);
      cell[ctr+3][ctr-1] = new Cell(true);
      cell[ctr+2][ctr-1] = new Cell(true);
      cell[ctr+6][ctr-4] = new Cell(true);
      cell[ctr+6][ctr-3] = new Cell(true);
      cell[ctr+6][ctr-2] = new Cell(true);
      cell[ctr+1][ctr-4] = new Cell(true);
      cell[ctr+1][ctr-3] = new Cell(true);
      cell[ctr+1][ctr-2] = new Cell(true);
      
      cell[ctr+4][ctr+6] = new Cell(true);
      cell[ctr+3][ctr+6] = new Cell(true);
      cell[ctr+2][ctr+6] = new Cell(true);
      cell[ctr+4][ctr+1] = new Cell(true);
      cell[ctr+3][ctr+1] = new Cell(true);
      cell[ctr+2][ctr+1] = new Cell(true);
      cell[ctr+6][ctr+4] = new Cell(true);
      cell[ctr+6][ctr+3] = new Cell(true);
      cell[ctr+6][ctr+2] = new Cell(true);
      cell[ctr+1][ctr+4] = new Cell(true);
      cell[ctr+1][ctr+3] = new Cell(true);
      cell[ctr+1][ctr+2] = new Cell(true);
      break;
    case '9': //PENTADECATHLON
      cell[ctr-1][ctr-2] = new Cell(true);
      cell[ctr-1][ctr+3] = new Cell(true);
      cell[ctr+1][ctr-2] = new Cell(true);
      cell[ctr+1][ctr+3] = new Cell(true);
      
      cell[ctr][ctr-4] = new Cell(true);
      cell[ctr][ctr-3] = new Cell(true);
      cell[ctr][ctr-1] = new Cell(true);
      cell[ctr][ctr] = new Cell(true);
      cell[ctr][ctr+1] = new Cell(true);
      cell[ctr][ctr+2] = new Cell(true);
      cell[ctr][ctr+4] = new Cell(true);
      cell[ctr][ctr+5] = new Cell(true);
      break;
  }
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