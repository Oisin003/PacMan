public class GameData
{
  //Wrote private instance variables for score and lives, both int
  private int score;
  private int lives;

  public GameData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////

  //Wrote getter and setter methods for the game data class
  public void setScore(int score) {
    this.score=score;
  }

  public int getScore() {
    return score;
  }

  public void  setLives(int lives) {
    this.lives=lives;
  }

  public int getLives() {
    return lives;
  }

  public void addLife() {
    lives=lives+1;
  }
  public void loseLife() {
    lives=lives-1;
  }

  public void incScore(int value) {
    score += value;
  }

  //
  // Add your code ABOVE this method
  //

  public void display()
  {
    // data area colour bar
    fill(14, 0, 189);
    rect(0, height-100, width, height);
    textSize(28);
    fill(255);
    // display lives and score
    text("SCORE:" + getScore(), 5, height-10);
    text("LIVES:" + getLives(), width-110, height-10);
    // display minature pacman icons here
    float pacmanSize = 30;
    float pacmanSpacing = 40;
    float startX = width - 350;

    for (int i = 0; i < getLives(); i++) {
      drawPacmanIcon(startX + i * pacmanSpacing, height - 70, pacmanSize);
    }
  }
  private void drawPacmanIcon(float x, float y, float size) {
    fill(255, 255, 0); // Yellow color for Pacman
    noStroke();

    // Draw Pacman body
    arc(x, y, size, size, PI / 6, 11 * PI / 6, PIE); //https://processing.org/reference/arc_.html
  }
  //toString method to display data in the terminal
  public String toString()
  {
    return("[GameData:score="+getScore()+", "+"lives="+getLives()+"]");
  }
}