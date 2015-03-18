import org.junit.*;
import static org.junit.Assert.*;

import battleship.*;

public class DirectionTest
{
	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(DirectionTest.class);
	}

	@Test
	public void DirectionNordTest()
	{
		Direction d = new NorthDirection();
		Position p1 = new Position(1,2);
		Position p2 = new Position(1,1);
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getX(),p2.getX());
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getY(),p2.getY());
	}

	@Test
	public void DirectionEstTest() {
		Direction d = new EastDirection();
		Position p1 = new Position(1,2);
		Position p2 = new Position(2,2);
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getX(),p2.getX());
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getY(),p2.getY());
	}

	@Test
	public void DirectionOuestTest() {
		Direction d = new WestDirection();
		Position p1 = new Position(1,2);
		Position p2 = new Position(0,2);
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getX(),p2.getX());
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getY(),p2.getY());
	}

	@Test
	public void DirectionSudTest() {
		Direction d = new SouthDirection();
		Position p1 = new Position(2,2);
		Position p2 = new Position(2,3);
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getX(),p2.getX());
		assertEquals("la direction nord est-elle valide ?",d.nextPosition(p1).getY(),p2.getY());
	}
}