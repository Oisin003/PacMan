public class Inky extends Ghost implements Comparable<Location>
{
  //private int x;
  //private int y;
  //private color colour;
  //private int direction;
  //private float speed;
  //private int distanceMoved;
  //private boolean moving;
  //private int bearing;
  //private Location location;
  //private int[] moves = {Game.UP, Game.LEFT, Game.RIGHT, Game.DOWN};

  public Inky(Location location)
  {
    super(location);
    int xy[] = location.getXY();
    this.x=xy[0];
    this.y=xy[1];
    this.colour=Game.CYAN;
    this.direction=1;
    this.speed=Game.SPEED;
    this.distanceMoved=0;
    this.moving=false;
    this.bearing=Game.RIGHT;

    //this.location=location;
  }


  //public void move(boolean value)
  //{
  //  // get a random bearing for ghost
  //  bearing=getRandomBearing();
  //  // valid bearing?
  //  if (!validMove(location, bearing))
  //    return;

  //  if (moving==true)   // ignore any request to move if already moving
  //    return;

  //  location.updateLocation(bearing);

  //  this.moving=value;
  //  if (bearing<0)
  //    this.direction=-1;
  //  else
  //    this.direction=1;
  //}

  //public boolean moving()
  //{
  //  return moving;
  //}

  //public void setX(int x)
  //{
  //  this.x=x;
  //}

  //public int getX()
  //{
  //  return this.x;
  //}

  //public void setY(int y)
  //{
  //  this.y=y;
  //}

  //public int getY()
  //{
  //  return this.y;
  //}

  //public Location getLocation()
  //{
  //  return location;
  //}

  //public int getRandomBearing()
  //{
  //  int index = int(random(moves.length));
  //  return moves[index];
  //}

  //public boolean validMove(Location location, int bearing)
  //{
  //  switch(bearing)
  //  {
  //  case Game.RIGHT:
  //    if (location.getX()+1>Game.GRID_COLS-1) return false;
  //    break;
  //  case Game.LEFT:
  //    if (location.getX()-1<0) return false;
  //    break;
  //  case Game.DOWN:
  //    if (location.getY()+1>Game.GRID_ROWS-1) return false;
  //    break;
  //  case Game.UP:
  //    if (location.getY()-1<0) return false;
  //    break;
  //  }

  //  return true;
  //}

  //public boolean intersect(int x, int y)
  //{
  //  if (dist(x, y, getX(), getY()) < Game.PACMAN_SIZE)
  //    return true;
  //  else
  //    return false;
  //}

  //public boolean eats(Pacman pacman)
  //{
  //  if (this.intersect(pacman.getX(), pacman.getY())==true)
  //    return true;
  //  else
  //    return false;
  //}

  @Override
    public int compareTo(Location otherLocation) {

    int i = Integer.compare(getLocation().getX(), otherLocation.getX());
    if (i == 0) {
      i = Integer.compare(getLocation().getY(), otherLocation.getY());
    }
    return i;
  }
  @Override
    public String toString() {
    return "[Inky:location=" + location.toString() + ", direction=" + direction + ", speed=" + speed + ", moving=" + moving + ", bearing=" + bearing + "]";
  }

  /////////////////////////////////////////////////////////////////////////////////////////////

  //
  // Add your code ABOVE this method
  //

  public void incX()
  {
    setX(getX()+(this.direction*(int)this.speed));
  }

  public void incY()
  {
    setY(getY()+(this.direction*(int)this.speed));
  }

  @Override
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

    rect(0, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE/2);
    arc(Game.PACMAN_SIZE/2, Game.PACMAN_SIZE/2, Game.PACMAN_SIZE, Game.PACMAN_SIZE, PI, PI*2, PIE);

    fill(255, 255, 255);
    ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 15, 20);
    ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 15, 20);

    fill(0, 0, 0);
    stroke(0, 0, 0);
    //ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
    //ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
    switch(this.bearing)
    {
    case Game.RIGHT:
      ellipse(Game.PACMAN_SIZE/2-(Game.PACMAN_SIZE/8), Game.PACMAN_SIZE/2, 10, 10);
      ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2+(Game.PACMAN_SIZE/10), Game.PACMAN_SIZE/2, 10, 10);
      break;
    case Game.LEFT:
      ellipse(Game.PACMAN_SIZE/2/2/2, Game.PACMAN_SIZE/2, 10, 10);
      ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2-(Game.PACMAN_SIZE/8), Game.PACMAN_SIZE/2, 10, 10);
      break;
    case Game.DOWN:
      ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2+(Game.PACMAN_SIZE/5), 10, 10);
      ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2+(Game.PACMAN_SIZE/5), 10, 10);
      break;
    case Game.UP:
      ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/3, 10, 10);
      ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/3, 10, 10);
      break;

    default:
      ellipse(Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
      ellipse(Game.PACMAN_SIZE-Game.PACMAN_SIZE/2/2, Game.PACMAN_SIZE/2, 10, 10);
    }

    popMatrix();
  }
}