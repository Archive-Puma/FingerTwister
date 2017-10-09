class Cell {
  
  boolean state;
  
  public Cell(boolean state)
  {
    this.state = state;
  }
  
  public boolean update(int aliveNeightbours)
  {
    // loneliness
    if( aliveNeightbours < 3 )
    {
      this.state = false;
    // birth
    } else if( aliveNeightbours == 3)
    {
      this.state = true;
    // overpopulated
    } else if( aliveNeightbours > 3)
    {
      this.state = false;
    }

    return this.state;
  }
  
  public void show(int sz)
  {
    if(state)
    {
      fill(0);
      rect(0,0,sz,sz);
    } else {
      fill(255);
      rect(0,0,sz,sz);
    }
  }
  
  public boolean getState()
  {
    return this.state;
  }
}