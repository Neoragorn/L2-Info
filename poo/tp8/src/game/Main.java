package game;

public class Main
{

	/**
	*   Methode main permettant le lancement du programme
	*   @param = args, le nombre de tours de jeu
	*/
	public static void main(String[] args)
	{
		Game game = new Game(Integer.parseInt(args[0]));
		game.game_mode();
		game.begin_Game();
	}

}