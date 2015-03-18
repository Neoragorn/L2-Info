import org.junit.*;
import static org.junit.Assert.*;

import battleship.*;

public class SeaTest
{

	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(SeaTest.class);
	}

	@Test
	public void viseTest()
	{
		Sea plateau = new Sea(5,5);
		Position p = new Position(1,1);
		assertEquals(plateau.shoot(p),Answer.MISSED);
	}

	@Test
	public void placeShipTest()
	{
		Sea plateau = new Sea(10,10);
		Position p1 = new Position(1,1);
		Ship b = new Ship(2);
		Direction d = new SouthDirection();
		Position p2 = d.nextPosition(p1);

		plateau.placeShip(b,p1,d);
		assertEquals("le bateau est-il bien pose ?",plateau.getBoard()[p1.getX()][p1.getY()].getShip(),b);
		assertFalse("le bateau est-il bien pose ?",plateau.getBoard()[d.nextPosition(p1).getX()][d.nextPosition(p2).getY()].getShip() == b);
	}

}