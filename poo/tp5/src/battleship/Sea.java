package battleship;

import battleship.direction.*;

public class Sea
{
	private Cell[][] board;
	private int max_x;
	private int max_y;

	/**
	* Constructeur de la classe Sea
	* 
	*/

	public Sea(int posx, int posy)
	{
		int i;
		int y;
		this.board = new Cell[posy][posx];
		this.max_x = posx;
		this.max_y = posy;
		for (i = 0; i < posy; i++)
			for (y = 0; y < posx; y++)
				this.board[i][y] = new Cell();
	}

	public Cell[][] getBoard()
	{
		return this.board;
	}

	/**
	* Simule un tir sur la case de la position mis en parametre
	* @return MISSED si il n'y a rien sur la case
	* @return HIT si un vaisseau se trouvait sur la case
	* @return SUNK si le vaisseau est detruit lorsqu'il est touche
	*/

	public Answer shoot(Position p)
	{
		Cell one_case = this.board[p.getY()][p.getX()];

		if (one_case.hasBeenShot())
				return Answer.MISSED;
		else
		{
			one_case.shot();
			if (one_case.getShip() != null)
			{
				if (one_case.getShip().getPdv() == 0)
					return Answer.SUNK;
				else
					return Answer.HIT;
			}
			else
				return Answer.MISSED;
		}
	}

	/**
	* Affiche le tableau de jeu de la bataille navale
	* 
	*/

	public void display(boolean defenseur)
	{
		int i;
		int y;
		int x;
		System.out.print("\t ");
		System.out.print(" 0 1 2 3 4 5 6 7 8\n");
		System.out.print("\t ");
		for (i = 1; i < max_x * 2 + 2; i++)
			System.out.print("-");
		System.out.print("\n");
		i = 0;
		for (i = 0; i < max_y; i++)
		{
			System.out.print("\t" + i);
			for (y = 0; y < this.max_x; y++)
				System.out.print("|" + board[i][y].getCharacter(defenseur));
			System.out.print("|\n");
			System.out.print("\t ");
			for (x = 1; x < max_x * 2 + 2; x++)
				System.out.print("-");
			System.out.print("\n");
		}
		System.out.print("\t");
		System.out.print("\n");
	}

	/**
	* Place un vaiseau sur une position et avec une direction donnée en parametre
	* @exception IllegalStateException si la position et directon donnee sont impossibles
	*/
    public void placeShip(Ship shipToPlace, Position position, Direction direction) throws IllegalStateException
	{
		try
		{
			int	i;
			int len = shipToPlace.getPdv();
			Position p = position;

			for (i = 0; i != len; i++)
			{
				if (this.board[p.getY()][p.getX()].getShip() != null)
					throw new IllegalStateException();
				p = direction.nextPosition(p);
			}
		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			throw new IllegalStateException();
		}

		int	len = shipToPlace.getPdv();
		int	i;
		Position p = position;
		for (i = 0; i != len; i++)
		{
			this.board[p.getY()][p.getX()].setShip(shipToPlace);
			p = direction.nextPosition(p);
		}
	}
}