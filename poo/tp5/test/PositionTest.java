import org.junit.*;
import static org.junit.Assert.*;

import battleship.Position;

public class PositionTest {

	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(PositionTest.class);
	}

	@Test
	public void coordinateTest()
	{
		Position one_position = new Position(1,-1);
		assertEquals("la position a-t-elle une abscisse valide ?",one_position.getX(),1);
		assertEquals("la position a-t-elle une ordonnee valide ?",one_position.getY(),-1);
	}

	@Test
	public void equalsTest()
	{
		Position position1 = new Position(1,2);
		Position position2 = new Position(1,2);
		assertTrue("les deux positions sont-elles egales ?",position1.equals(position2));
	}

}
