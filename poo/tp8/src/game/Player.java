package game;

import game.utils.*;

public class Player
{
	/**
	*  Nombre de tours gagnés
	*/
	protected int			compteur;
	protected String 		name;
	protected GameChoice  choice;

	/**
	* Constructeur de Player
	*/
	public Player()
	{
		this.compteur = 0;
	}

	public Player(String name)
	{
		this.compteur = 0;
		this.name = name;
	}

	public GameChoice getChoice()
	{
		return this.choice;
	}

	public void 	setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}

	public int		getCompteur()
	{
		return this.compteur;
	}

	/**
	* Si le Player gagne, on incrémente son compteur de victoires
	*/
	public void		compteurIncr()
	{
		this.compteur += 1;
	}

	/**
	* Permet de stocker le coup choisi par le joueur
	* @return true si le choix du coup est valide
	*/
	public boolean setChoice(String choice)
	{
		if (choice.equals("pierre"))
			this.choice = GameChoice.ROCK;
		else if (choice.equals("ciseaux"))
			this.choice = GameChoice.SCISSORS;
		else if (choice.equals("papier"))
			this.choice = GameChoice.PAPER;
		else
		{
			System.out.println("Choix non conforme");
			return false;
		}
		return true;
	}
}