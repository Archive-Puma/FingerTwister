/** AUTHOR:
Cosas de Puma (https://github.com/cosasdepuma) */

/** INSPIRED BY:
Conway's Game of Life (http://www.conwaylife.com/w/index.php?title=Conway%27s_Game_of_Life) 
The Coding Train (https://www.youtube.com/watch?v=tENSCEO-LEc) */

/** CONTROLS:

F ......... Faster
S ......... Slower
R ......... Reset the camera view
+ / - ..... Zoom in / out
SPACE ..... Draw mode on / off
ARROWS .... Move the camera

*/

/* |------------| */
/**|    VARS    |**/
/* |------------| */

private short delay = 0;
private Grid grid = null;
private Cell cell[][] = null;
private boolean drawMode = true;
private PVector gridSettings = null, map = null;

/* |------------| */
/**|   CUSTOM   |**/
/**|    MAPS    |**/
/* |------------| */

protected static final short EMPTY = 0;
protected static final short RANDOM = 1;
/* STILL LIFES */
protected static final short BLOCK = '0';
protected static final short BEEHIVE = '1';
protected static final short LOAF = '2';
protected static final short BOAT = '3';
protected static final short TUB = '4';
/* OSCILLATORS */
protected static final short BLINKER = '5';
protected static final short TOAD = '6';
protected static final short BEACON = '7';
protected static final short PULSAR = '8';
protected static final short PENTADECATHLON = '9';
 
/* |------------| */
/**|    VOID    |**/
/**|   SETUP()  |**/
/* |------------| */

public void setup()
{
  // canvas options
  size(600,600);
  frameRate(60);
  stroke(0);
  
  //delay
  delay = 15;
  
  // grid options (gridSettings (numberOfCells in a row, sizeOfCells))
  gridSettings = new PVector(60,10);
  grid = new Grid( (short) gridSettings.x, (short) gridSettings.y);
  
  // map options (posX, posY, zoom)
  map = new PVector(0,0,1);
  
  // cells
  cell = new Cell[(short) gridSettings.x][(short) gridSettings.x];
  createCells(); createCellMap(RANDOM);
}

/* |------------| */
/**|    VOID    |**/
/**|    DRAW    |**/
/* |------------| */

public void draw()
{  
  background(51);
  
  if(!drawMode)
  {
    translate(width/2,height/2);
    scale(map.z);
    translate(-width/2,-height/2);
  }
  
  pushMatrix();
  if (!drawMode) translate(map.x,map.y);
  
  grid.show();
  drawCells();
  
  if (!drawMode) 
  {
    // some delay
    if(frameCount % delay == 0) updateCells();
    drawCells();
  } else {
    // drawMode colour
    fill(0,50);
    rect(0,0,width,height);
  }
  popMatrix();
}

/* |------------| */
/**|    KEY     |**/
/**|    EVENT   |**/
/* |------------| */

public void keyPressed()
{
  // move map
  if (key == CODED)
  {
    if (keyCode == UP) map.y += 3;
    else if (keyCode == DOWN) map.y -= 3;
    else if (keyCode == LEFT) map.x += 3;
    else if (keyCode == RIGHT) map.x -= 3;
  }
  
  // delay
  else if (key == 's' || key == 'S') delay *= 2;
  else if (key == 'f' || key == 'F')
  {
    if( delay / 2 > 1 ) delay /= 2;
  }

  // zoom map
  else if (key == '+') map.z = map.z + 0.05;
  else if (key == '-') map.z = map.z - 0.05;
  
  // draw mode
  else if (key == ' ') drawMode = !drawMode;
  // reset map view
  else if (key == 'R' || key == 'r') map = new PVector(0,0,1);
  
  return;
}

/* |------------| */
/**|   MOUSE    |**/
/**|    EVENT   |**/
/* |------------| */

public void mousePressed()
{
  // draw new cells
  if (drawMode)
  {
    short x = (short) ((mouseX)/gridSettings.y);
    short y = (short) ((mouseY)/gridSettings.y);
    
    cell[x][y].change();
  }
  return;
}

/* |------------| */
/**|   CREATE   |**/
/**|  CELLS ()  |**/
/* |------------| */

// create all dead cells (origin)
private void createCells()
{
  for ( short i = 0; i < gridSettings.x ; i++ )
    for ( short j = 0; j < gridSettings.x ; j++ )
      cell[i][j] = new Cell();
  return;
}

// create all alived cells (first generation)
private void createCellMap(short pattern)
{
  // center of the map
  int ctr = (int) gridSettings.x / 2 - 2;
  
  switch(pattern)
  {
    // EMPTY //
    case 0: break;
    
    // RANDOM //
    case 1:
      for (short i = 0; i < gridSettings.x; i++)
        for (short j = 0; j < gridSettings.x; j++)
          if( (short) random(3) == 2 )
            cell[i][j].alived();        
      break;
    
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
    
    default: break;
  }
  return;
}

private void drawCells()
{
  for ( short i = 0; i < gridSettings.x ; i++ )
  {
    for ( short j = 0; j < gridSettings.x ; j++ )
    {
      PVector settings = new PVector((short)i, (short)j, (short)gridSettings.y);
      cell[i][j].show(settings);
    }
  }
  return;
}

private void updateCells()
{
  Cell[][] nextGen = new Cell[(short) gridSettings.x][(short) gridSettings.x];
  
  for (short i = 0; i < gridSettings.x; i++)
  {
    for (short j = 0; j < gridSettings.x; j++)
    {
      short neights = 0;
      
      if ( i - 1 >= 0 )
      {
        if ( j - 1 >= 0 ) if ( !cell[i-1][j-1].isDeath() ) neights++;
        if ( !cell[i-1][j].isDeath() ) neights++;
        if ( j + 1 < gridSettings.x ) if ( !cell[i-1][j+1].isDeath() ) neights++;
      }
      
      if ( j - 1 >= 0 ) if ( !cell[i][j-1].isDeath() ) neights++;
      if ( j + 1 < gridSettings.x ) if ( !cell[i][j+1].isDeath() ) neights++;
      
      if( i + 1 < gridSettings.x ) {
        if( j - 1 >= 0 ) if( !cell[i+1][j-1].isDeath() ) neights++;
        if( !cell[i+1][j].isDeath() ) neights++;
        if( j + 1 < gridSettings.x ) if( !cell[i+1][j+1].isDeath() ) neights++;
      }
      
      nextGen[i][j] = new Cell();
      if( (neights == 3) || (neights == 2 && !cell[i][j].isDeath()) )
        nextGen[i][j].alived();      
    }
  }
  
  for (short i = 0; i < gridSettings.x; i++)
    for (short j = 0; j < gridSettings.x; j++)
      cell[i][j] = nextGen[i][j];
      
  return;
}