class Cell {
  
  boolean state;
  color specie = 0;
  //color specie = color(random(255), random(255), random(255));
  
  public Cell(boolean state)
  {
    this.state = state;
  }
  
  public void show(int sz)
  {
    if(state)
    {
      fill(specie);
      rect(0,0,sz,sz);
    }
  }
  
  public boolean getState()
  {
    return this.state;
  }
}