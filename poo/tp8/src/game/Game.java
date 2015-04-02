package game;

import game.utils.*;

public class Game
{
	/**
	* Classe Player pour le mode 2 joueurs
	*/
	private Player  p1;
	private Player  p2;
	/**
	* Classe Ia pour le mode 1 joueur
	*/
	private Ia		ia;
	/**
	* Nombre de tours de jeu
	*/
	private int		tours;
	/**
	* Mode de jeu (1 ou 2 joueurs)
	*/
	private int		gamemod;

	public Game(int tours)
	{
		this.tours = tours;
	}

	/**
	* Methode permettant de choisir le niveau de l'IA
	* @exception = IOException si l'on ecrit autre chose qu'une information pouvat être transformée en integer
	*/
	public	void choose_IA_level()
	{
		int level = -1;
		boolean check = false;

		System.out.println("Choisissez le niveau de l'IA : '0' ou '1");
		while (!check)
		{
			try
			{
			level = Input.readInt();
			if (level == 0 || level == 1)
				check = true;
			}
			catch (java.io.IOException e)
			{
				System.out.println("Choississez un niveau d'IA conforme");
			}
		}
		ia = new Ia("IA", level);
	}

	/**
	* Methode permettant de choisir le mode de jeu
	* @exception = IOException si l'on ecrit autre chose qu'une information pouvat être transformée en integer
	*/
	public void		game_mode()
	{
		int		mode = -1;
		boolean check = false;

		System.out.println("Choisissez le mode de jeu : '1' ou '2' joueurs");
		while (!check)
		{
			try
			{
			mode = Input.readInt();
			if (mode == 1)
				check = true;
			else if (mode == 2)
				check = true;
			}
			catch (java.io.IOException e)
			{
				System.out.println("Choississez '1' ou '2");
			}
		}
		if (mode == 1)
			this.gamemod = 1;
		else
			this.gamemod = 2;
	}

	/**
	* Methode renvoyant le nombre de tours de jeu
	* @return = le nombre de tours de jeu
	*/
	public int		getTours()
	{
		return this.tours;
	}

	/**
	*  Met en place les joueurs du mode 2 joueurs
	*/
	public void setPlayers()
	{
		String name1, name2;

		System.out.println("Entrez le nom du joueur 1");
		name1 = Input.readString();
		p1 = new Player(name1);
		System.out.println("Entrez le nom du joueur 2");
		name2 = Input.readString();
		p2 = new Player(name2);
		System.out.println("Le nom du joueur 1 est " + p1.getName() + " et le nom du joueur 2 est " + p2.getName());
	}

	/**
	*  Presentation du mode 1 joueur
	*/
	public void	presentation()
	{
		this.p1 = new Player("Joueur 1");
		System.out.println("Voici le jeu de Pierre-Feuille-Ciseaux");
		System.out.println("Vous jouez en mode 1 joueur et vous avez " + this.tours + " tours.");
		System.out.println("Il vous suffit d'ecrire quel coup vous voulez jouer.");
		System.out.println("Les coups possibles sont 'pierre', 'papier' et 'ciseaux'");
		System.out.println("Celui qui comptabilise le plus de victoires gagne.");
		System.out.println("A vous de jouer!");
	}

	/**
	*  Presentation du mode 2 joueurs
	*/
 	public void	presentation_2()
	{
		System.out.println("Voici le jeu de Pierre-Feuille-Ciseaux");
		System.out.println("Tout d'abord, choisissez les noms des deux joueurs");
		this.setPlayers();
		System.out.println("A present, vous avez " + this.tours + " tours pour jouer.");
		System.out.println("Il vous suffit d'ecrire chacun votre tour quel coup vous voulez jouer.");
		System.out.println("Les coups possibles sont 'pierre', 'papier' et 'ciseaux'");
		System.out.println("Celui qui comptabilise le plus de victoires gagne.");
		System.out.println("A vous de jouer!");
	}

	/**
	*   Methode permettant de savoir quel Player a gagné le tour en mode 2 joueurs
	*   @return = retourne le Player gagnant
	*/
	public	Player decide_winner()
	{
		if ((this.p1.getChoice() == GameChoice.ROCK) && (this.p2.getChoice() == GameChoice.PAPER))
			return this.p2;
		else if ((this.p1.getChoice() == GameChoice.SCISSORS) && (this.p2.getChoice() == GameChoice.ROCK))
			return this.p2;
		else if ((this.p1.getChoice() == GameChoice.PAPER) && (this.p2.getChoice() == GameChoice.SCISSORS))
			return this.p2;
		else if ((this.p1.getChoice() == (this.p2.getChoice())))
			return null;
		else
			return this.p1;
	}

	/**
	*   Methode permettant de savoir quel Player ou IA a gagné le tour en mode 1 joueur
	*   @return = retourne le Player ou l'IA gagnant
	*/
	public	Player decide_winner_ia()
	{
		if ((this.p1.getChoice() == GameChoice.ROCK) && (this.ia.getChoice() == GameChoice.PAPER))
			return this.ia;
		else if ((this.p1.getChoice() == GameChoice.SCISSORS) && (this.ia.getChoice() == GameChoice.ROCK))
			return this.ia;
		else if ((this.p1.getChoice() == GameChoice.PAPER) && (this.ia.getChoice() == GameChoice.SCISSORS))
			return this.ia;
		else if ((this.p1.getChoice() == (this.ia.getChoice())))
			return null;
		else
			return this.p1;
	}

	/**
	*   Methode permettant de jouer un tour de jeu en mode 1 joueur
	*/
	public	void	playOneRound()
	{
		boolean check = false;
		String	game_choice;
		System.out.println("Joueur 1, choisissez votre coup");
		while (!check)
		{
			game_choice = Input.readString();
			check = p1.setChoice(game_choice);
			if (check)
				System.out.println("\033[2J\n");
		}
		if (this.ia.getLevel() == 0)
			this.ia.iaRandom();
		if (this.ia.getLevel() == 1)
			this.ia.ia_level1();
		Player winner = decide_winner_ia();
		if (winner == null)
			System.out.println("Pas de gagant. Egalité!");
		else
		{
			winner.compteurIncr();
			System.out.println("Gagnant du tour : " + winner.getName());
			System.out.println("Son compteur est a : " + winner.getCompteur());
		}
	}

	/**
	*   Methode permettant de jouer un tour de jeu en mode 2 joueurs
	*/
	public	void 	playOneRound_players()
	{
		boolean check = false;
		String	game_choice;
		System.out.println("Joueur 1, choisissez votre coup");
		while (!check)
		{
			game_choice = Input.readString();
			check = p1.setChoice(game_choice);
			if (check)
			System.out.println("\033[2J\n");
		}
		check = false;
		System.out.println("Joueur 2, choisissez votre coup");
		while (!check)
		{
			game_choice = Input.readString();
			check = p2.setChoice(game_choice);
			if (check)
				System.out.println("\033[2J\n");
		}
		Player winner = decide_winner();
		if (winner == null)
			System.out.println("Pas de gagant. Egalité!");
		else
		{
			winner.compteurIncr();
			System.out.println("Gagnant du tour : " + winner.getName());
			System.out.println("Son compteur est a : " + winner.getCompteur());
		}
	}

	/**
	*   Methode lancant le jeu
	*/
	public void		begin_Game()
	{
		if (this.gamemod == 2)
		{
			this.presentation_2();
			for (int i = 0; i != this.getTours(); i++)
				playOneRound_players();			
		}
		else
		{
			this.presentation();
			choose_IA_level();
			for (int i = 0; i != this.getTours(); i++)
				playOneRound();
		}
	}
}