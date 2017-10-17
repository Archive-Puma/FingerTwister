public class Cell
{  
  private boolean isAlived = false;
  
  public Cell() { }
  
  public Cell(boolean state)
  {
    this.isAlived = state;
  }
  
  public void show(PVector settings)
  {
    if(isAlived) fill(0);
    else fill(255);
    
    pushMatrix();
    translate(settings.x*settings.z, settings.y*settings.z);
    rect(0,0,settings.z,settings.z);
    popMatrix();
    
    return;
  }
  
  public void alived()
  {
    this.isAlived = true;
    return;
  }
  
  public void death()
  {
    this.isAlived = false;
    return;
  }
  
  public void change()
  {
    this.isAlived = !this.isAlived;
    return;
  }
  
  public boolean isDeath()
  {
    return !isAlived;
  }
  
}