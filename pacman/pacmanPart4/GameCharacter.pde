public abstract class GameCharacter
{
  public Location location;
  
  public GameCharacter(Location location)
  {
    this.location=location;
  }

  public Location getLocation()
  {
    return this.location;
  }

  public void setLocation(Location location)
  {
    this.location=location;
  }

  public String toString() {
    return "[GameCharacter:location=(Location" + getLocation() + ")]";
  }

  public abstract void display();
  
}
