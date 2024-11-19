Game game;

void setup()
{
  size(640, 840);
  game = new Game();

  //pacmanPart1
  GameData gameData = new GameData();
  println(gameData);
  gameData.setScore(500);
  gameData.incScore(10);
  println("score="+gameData.getScore());
  gameData.setLives(3);
  gameData.addLife();
  gameData.addLife();
  gameData.loseLife();
  println("lives="+gameData.getLives());
  println(gameData);


  ////pacmanpart2
  //println();
  //println();
  //GameCharacter character = new GameCharacter(new Location(5, 5));
  //println(character);
  //character.setLocation(new Location(6, 6));
  //println(character);
  //println(character.getLocation());
}


void draw()
{
  game.update();
}

void keyPressed()
{
  //
  if (key=='a')
    game.action(Game.LEFT);

  if (key=='s')
    game.action(Game.RIGHT);

  if (key=='p')
    game.action(Game.UP);

  if (key=='l')
    game.action(Game.DOWN);

 else if (key == CODED)
  {
    if (keyCode == UP) {
      game.action(Game.UP);
    }
    if (keyCode == DOWN) {
      game.action(Game.DOWN);
    }
    if (keyCode == RIGHT) {
      game.action(Game.RIGHT);
    }
    if (keyCode == LEFT) {
      game.action(Game.LEFT);
    }
  }

  // add solution for using arrow keys here
}
