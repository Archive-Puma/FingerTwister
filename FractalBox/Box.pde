public class Box
{
  int sz;
  PVector pos;
  
  public Box(int x, int y, int z, int size)
  {
    sz = size;
    pos = new PVector(x, y, z);
  }
  
  public void show()
  {
    pushMatrix();
    translate(pos.x * sz, pos.y * sz, pos.z * sz);
    box(sz);
    popMatrix();
  }
  
  public int info(String value)
  {
    switch(value)
    {
      case "sz":
        return sz;
      case "x":
        return int(pos.x);
      case "y":
        return int(pos.y);
      case "z":
        return int(pos.z);
      default:
        return 0xDEAD;
    }
  }
  
}