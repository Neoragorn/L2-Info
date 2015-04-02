package game;

import java.util.Random;
import game.utils.GameChoice;

public class Ia extends Player
{
	/**
	*  Niveau de l'IA
	*/
	private int level;

	/**
	*  Precedent choix de coup de l'IA
	*/
	private GameChoice tmp_choice;

	/**
	* Constructeur de l'IA
	*/
	public Ia(String name, int level)
	{
		this.name = name;
		this.level = level;
	};

	public String getName()
	{
		return this.name;		
	}

	public int getLevel()
	{
		return this.level;		
	}

	/**
	*  Mode de choix aleatoire de l'IA
	*/
	public void iaRandom()
	{
		Random rand = new Random();
		int num = rand.nextInt((2 - 0) + 1) + 0;
		if (num == 0)
			this.choice = GameChoice.PAPER;
		if (num == 1)
			this.choice = GameChoice.ROCK;
		if (num == 2)
			this.choice = GameChoice.SCISSORS;
	}

	/**
	*  Mode de choix préféfini selon le dernier coup de l'IA
	*/
	public void ia_level1()
	{
		if (this.tmp_choice == null)
			this.choice = GameChoice.ROCK;
		if (this.tmp_choice == GameChoice.ROCK)
			this.choice = GameChoice.SCISSORS;
		if (this.tmp_choice == GameChoice.PAPER)
			this.choice = GameChoice.ROCK;
		this.tmp_choice = this.choice;
	}
}