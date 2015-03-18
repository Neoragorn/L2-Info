package battleship;

public class Position
{
	private int x;
	private int y;

	/**
	*  Constructeur de Position
	* 
	*/
	public Position(int x, int y)
	{
		this.x = x;
		this.y = y;
	}

	/**
	* Retourne l'attribut x
	* 
	*/
	public int getX() 
	{
		return this.x;
	}

	/**
	* Retourne l'attribut y
	* 
	*/
	public int getY() 
	{
		return this.y;
	}

	/**
	* Verifie si l'objet @param o est identique
	*  @return true si l'objet est identique
	*/
	public boolean equals(Object o)
	{
		if (o instanceof Position)
		{
			Position new_o = (Position) o;
			if ((new_o.getX() == this.x) && (new_o.getY() == this.y))
				return true;
		}
		return false;
	}

	/**
	* 
	*  @return String affichant les positions de l'objet
	*/

	public String toString()
	{
		return ("Position x: " + this.x + " Position y : " + this.y);
	}
}