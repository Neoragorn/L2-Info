package battleship;

public class Ship
{
	private int pdv;

	/**
	* Constructeur de la classe
	* 
	*/

	public Ship(int length)
	{
		this.pdv = length;
	}

	public int getPdv()
	{
		return (this.pdv);
	}

	/**
	* Si le ship est touché, la methode lui retire un point de vie
	* 
	*/
	public void hitted()
	{
		if (this.pdv > 0)
			this.pdv -= 1;
	}
}