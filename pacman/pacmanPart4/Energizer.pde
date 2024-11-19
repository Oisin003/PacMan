public class Energizer extends Dot {
  public Energizer(Location location) {
    super(location);
  }

  @Override
    public void display() {
    fill(0, 255, 0);
    stroke(153);

    pushMatrix();

    int[] xy = getLocation().getXY();
    translate(xy[0], xy[1]);
    ellipse(0 + Game.PACMAN_SIZE / 2, 0 + Game.PACMAN_SIZE / 2, Game.DOTSIZE, Game.DOTSIZE);

    popMatrix();
  }

  @Override
    public String toString() {
    return "[Energizer:location=" + getLocation().toString() + "]";
  }
}