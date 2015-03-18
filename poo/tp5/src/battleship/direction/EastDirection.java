package battleship.direction;

import battleship.Position;

/**
* Methode modifiant la position de x + 1
* @return la nouvelle position modifiee
*/

public class EastDirection implements battleship.Direction
{
	public Position nextPosition(Position p)
	{
		return (new Position(p.getX() + 1,p.getY()));
	}
}