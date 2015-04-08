package game;

public class Main
{

	/**
	*   Methode main permettant le lancement du programme
	*   @param = args, le nombre de tours de jeu
	*/
	public static void main(String[] args)
	{
		try
		{
			if (Integer.parseInt(args[0]) < 1)
				throw new IllegalArgumentException();
			Game game = new Game(Integer.parseInt(args[0]));
			game.game_mode();
			game.begin_Game();
		}
		catch (Exception e)
		{
			System.out.println("Vous devez mettre un chiffre en lancant le programme et supérieur a 0");
		}
	}

}