public class Game
{
  //
  public static final int INITIAL_LIVES = 3;
  public static final int GRID_ROWS = 8;
  public static final int GRID_COLS = 7;
  public static final int PACMAN_SIZE = 40;
  public static final int Pacman_STEP = 50;
  public static final float SPEED = 2.0;
  public static final int LEFT = -1;
  public static final int RIGHT = 1;
  public static final int UP = -2;
  public static final int DOWN = 2;
  public static final int DOTSIZE = 10;
  public static final color YELLOW = #FFFF00;  // Pacman
  public static final color CYAN = #21FFD6;  // Inky
  public static final color RED = #FF0000;  // Blinky
  public static final color PINK = #FEA7D6;  // Pinky
  public static final color ORANGE = #FEAA38;  // Clyde
  public static final color BLUE = #0000FF;
  public static final int DOT_SCORE= 10;
  public static final int ENERGIZER_SCORE= 100;

  // class variables
  private Pacman pacman;
  private GameData gameData;
  // private Inky inky;
  private ArrayList<Ghost> ghosts;
  private ArrayList<Dot> dots;
  private Energizer energizer;

  public Game()
  {
    try {
      // create pacman
      pacman = new Pacman(new Location(1, 1));
      println(pacman);

      ghosts = new ArrayList<Ghost>();
      for (int i = 0; i < 1; i++) {
        ghosts.add(new Inky(new Location(3, 6)));
        ghosts.add(new Blinky(new Location(3, 6)));
        ghosts.add(new Pinky(new Location(3, 6)));
        ghosts.add(new Clyde(new Location(3, 6)));
      }
      // create dot(s)
      dots = new ArrayList<Dot>();
      dots.add(new Dot(new Location(0, 0)));
      // use code in drawGrid() as a guide as how to create the 8x7(56) dots
      for (int i = 0; i < Game.GRID_COLS; i++) {
        for (int j = 0; j < Game.GRID_ROWS; j++) {
          dots.add(new Dot(new Location(i, j)));
        }
      }
      // create energizer
      energizer = new Energizer(new Location(3, 6));
      dots.add(energizer);

      // create game data
      gameData = new GameData();
    }
    catch (InvalidLocationException e) {
      System.out.println(e.getMessage());
      exit();
    }
  }

  public void action(int value)
  {
    switch(value)
    {
    case Game.LEFT:
    case Game.RIGHT:
    case Game.UP:
    case Game.DOWN:
      if (pacman.validMove(pacman.getLocation(), value)) {
        pacman.move(true, value);
      }
      break;
    }
  }

  public void update()
  {
    drawGrid();
    // display game data
    gameData.display();
    energizer.display();
    // draw dots
    for (Dot dot : dots)
      dot.display();
    for (Ghost ghost : ghosts) {
      if (!ghost.moving()) {
        ghost.move(true);
      }
      ghost.display();
    }
    // display pacman
    pacman.display();
    // check for pacman eating dot(s)
    Dot dotEaten=null;
    for (Dot dot : dots)
    {
      if (pacman.eats(dot))
      {
        background(YELLOW);
        //gameData.incScore(Game.DOT_SCORE);
        if (pacman.isEdible()) {
          gameData.incScore(Game.DOT_SCORE * 2);  // Double the score when pacman is edible
        } else {
          gameData.incScore(Game.DOT_SCORE);
        }
        dotEaten=dot;  // store dot eaten
        break;
      }
      if (pacman.eats(energizer))
      {
        background(0, 255, 0);
        gameData.incScore(Game.DOT_SCORE);
        dotEaten=dot;  // store dot eaten
        for (Ghost ghost : ghosts) {
          ghost.setColour(Game.BLUE);
        }
        break;
      }
    }
    if (dotEaten!=null)
    {
      dots.remove(dotEaten);  // remove the dot eaten
    }
    if (pacman.isEdible()) {
      for (Ghost ghost : ghosts) {
        if (ghost.eats(pacman)) {
          newPacman();
          gameData.loseLife();
          break;
        }
      }
    }
    if (gameData.getLives() == 0) {
      exit();
    }
  }
  
  private void newPacman() {
  try {
    pacman = new Pacman(new Location(1, 1));
  } catch (InvalidLocationException e) {
    System.out.println(e.getMessage());
    exit();
  }
}

  public void drawGrid()
  {
    // blue outline
    fill(38, 38, 38);
    stroke(0, 0, 255);
    strokeWeight(5);
    rect(0, 0, width, height-100);

    // draw dots locations
    ellipseMode(CENTER);
    strokeWeight(1);
    fill(135, 135, 135);
    stroke(135, 135, 135);
    for (int i=0; i<Game.GRID_COLS; i++)
      for (int j=0; j<Game.GRID_ROWS; j++)
        ellipse((100*i)+(Game.PACMAN_SIZE/2), (100*j)+(Game.PACMAN_SIZE/2), Game.DOTSIZE/2, Game.DOTSIZE/2);
  }
}