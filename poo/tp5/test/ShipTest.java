import org.junit.*;
import static org.junit.Assert.*;

import battleship.Ship;

public class ShipTest
{

	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(ShipTest.class);
	}

	@Test
	public void getPdvTest()
	{
		Ship the_ship = new Ship(3);
		assertEquals("les points de vie du bateau sont-ils valides ?",the_ship.getPdv(),3);
	}

	@Test
	public void hitTest()
	{
		Ship the_ship = new Ship(3);
		the_ship.hitted();
		assertEquals("le bateau a-t-il ete touche ?", the_ship.getPdv(),2);
	}

}