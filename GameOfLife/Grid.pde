public class Grid
{
  
  private int len, sz;
  
  public Grid(int len, int sz)
  {
    this.sz = sz;
    this.len = len;
  }
  
  public void show()
  {
    for ( int cols = 0 ; cols < len*sz ; cols += sz )
    {
      for ( int rows = 0 ; rows < len*sz ; rows += sz )
      {
        pushMatrix();
        translate(cols, rows);
        line(0,0,0,sz);
        line(0,0,sz,0);
        popMatrix();
      }
    }
  }
}