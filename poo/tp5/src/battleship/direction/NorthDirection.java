package battleship.direction;

import battleship.Position;

/**
* Methode modifiant la position de y - 1
* @return la nouvelle position modifiee
*/

public class NorthDirection implements battleship.Direction
{
	public Position nextPosition(Position p)
	{
		return (new Position(p.getX(),p.getY() - 1));
	}
}