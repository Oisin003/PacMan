public class Pacman implements Edible
{
  
  private int x;
  private int y;
  private color colour;
  private int direction;
  private float speed;
  private int distanceMoved;
  private boolean moving;
  private boolean edible = true;
  private int bearing;
  private Location location;

  public Pacman(Location location)
  {
    int xy[] = location.getXY();
    this.x=xy[0];
    this.y=xy[1];

    this.colour=Game.YELLOW;
    this.direction=1;
    this.speed=Game.SPEED;
    this.distanceMoved=0;
    this.moving=false;
    this.bearing=Game.RIGHT;
    this.location=location;
  }
  @Override
    public void edible(boolean edible) {
    this.edible = edible;
  }

  @Override
    public boolean isEdible() {
    return edible;
  }

  public void move(boolean value, int bearing)
  {
    if (moving==true)   // ignore any request to move if moving
      return;

    location.updateLocation(bearing);

    this.moving=value;
    this.bearing=bearing;
    if (bearing<0)
      this.direction=-1;
    else
      this.direction=1;
  }

  public boolean moving()
  {
    return moving;
  }

  public void setX(int x)
  {
    this.x=x;
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

  void incX()
  {
    setX(getX()+(this.direction*(int)this.speed));
  }

  void incY()
  {
    setY(getY()+(this.direction*(int)this.speed));
  }

  public boolean intersect(int x, int y)
  {
    if (dist(x, y, getX(), getY()) < Game.DOTSIZE)
      return true;
    else
      return false;
  }

  public boolean eats(Dot dot)
  {
    if (this.intersect(dot.getX(), dot.getY())==true)
      return true;
    else
      return false;
  }

  boolean validMove(Location location, int bearing)
  {
    switch(bearing)
    {
    case Game.RIGHT:
      if (location.getX()+1>Game.GRID_COLS-1) return false;
      break;
    case Game.LEFT:
      if (location.getX()-1<0) return false;
      break;
    case Game.DOWN:
      if (location.getY()+1>Game.GRID_ROWS-1) return false;
      break;
    case Game.UP:
      if (location.getY()-1<0) return false;
      break;
    }

    return true;
  }
  public String toString() {
    return "[Pacman:location=" + location + ", direction=" + direction + ", speed=" + speed + ", moving=" + moving + ", bearing=" + bearing + "]";
  }
  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //
  public void display() // CAREFUL IF YOU MODIFY THIS CODE!!
  {
    if (moving) {
      if (this.distanceMoved!=Game.Pacman_STEP) {
        this.distanceMoved++;
        if (this.bearing==Game.LEFT || this.bearing==Game.RIGHT)
          incX();
        if (this.bearing==Game.UP || this.bearing==Game.DOWN)
          incY();
      } else
      {
        this.distanceMoved=0;
        moving=false;
      }
    }

    stroke(this.colour);
    fill(this.colour);
    pushMatrix();
    translate(getX(), getY());
    switch(this.bearing)
    {
    case Game.RIGHT:
      arc(Game.PACMAN_SIZE/2, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, QUARTER_PI, PI+HALF_PI+QUARTER_PI, PIE);
      break;
    case Game.LEFT:
      arc(Game.PACMAN_SIZE/2, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, PI+QUARTER_PI, PI+PI+HALF_PI+QUARTER_PI, PIE);
      break;
    case Game.DOWN:
      arc(Game.PACMAN_SIZE/2, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, HALF_PI+QUARTER_PI, PI+PI+QUARTER_PI, PIE);
      break;
    case Game.UP:
      arc(Game.PACMAN_SIZE/2, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, PI+HALF_PI+QUARTER_PI, PI+PI+PI+QUARTER_PI, PIE);
      break;
    }
    popMatrix();
  }
}