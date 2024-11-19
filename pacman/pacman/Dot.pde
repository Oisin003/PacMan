public class Dot
{
  private int x;
  private int y;
  private Location location;

  public Dot(Location location)
  {
    int xy[] = location.getXY();
    this.x=xy[0];
    this.y=xy[1];
    this.location=location;
  }  
  
  public int getX()
  {
    return this.x;
  }

  public void setY(int y)  
  {
    this.y=y;
  }

  public int getY()
  {
    return this.y;
  }
  
  public Location getLocation()
  {
    return location;
  }
  
   public String toString() {
    return "[Dot:location=" + location.toString() + ", x=" + getX() + ", y=" + getY() + "]";
}
  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(255, 255, 255);
    stroke(153);

    pushMatrix();    
    
    translate(getX(), getY()); 
    ellipse(0+Game.PACMAN_SIZE/2,0+Game.PACMAN_SIZE/2, Game.DOTSIZE, Game.DOTSIZE);
    
    popMatrix();
  }
}
