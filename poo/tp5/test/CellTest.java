import org.junit.*;
import static org.junit.Assert.*;

import battleship.*;

public class CellTest
{

    public static junit.framework.Test suite()
    {
        return new junit.framework.JUnit4TestAdapter(CellTest.class);
    }

	@Test
	public void testCell() {
		Cell c = new Cell();
		assertNotNull(c);
	}

	@Test
	public void testGetAndSetShip() {
		Cell c = new Cell();
		assertNull(c.getShip());
		
		Ship s = new Ship(4);
		c.setShip(s);
		assertSame(s,c.getShip());
	}


	@Test
	public void testHasBeenShot() {
		Cell c = new Cell();
		assertFalse(c.hasBeenShot());
		c.shot();
		assertTrue(c.hasBeenShot());		
	}

	@Test
	public void testShot() {
		Cell c = new Cell();
		Ship s = new Ship(4);
		c.setShip(s);
		c.shot();
		assertEquals(3,s.getPdv());
	}

	@Test
	public void testGetCharacterForEmptyCell() {
		Cell c = new Cell();
		assertEquals( Cell.EMPTY, c.getCharacter(true));
		assertEquals(Cell.UNKNOWN, c.getCharacter(false));
		c.shot();
		assertEquals(Cell.EMPTY, c.getCharacter(false) );
	}

	@Test
	public void testGetCharacterForNonEmptyCell() {
		Cell c = new Cell();
		Ship s = new Ship(4);
		c.setShip(s);
		// cell has not yet been shot
		assertEquals(Cell.SHIP, c.getCharacter(true)  );
		assertEquals(Cell.UNKNOWN,c.getCharacter(false)  );
		c.shot();
		assertEquals(Cell.HIT,c.getCharacter(true) );
		assertEquals(Cell.HIT,c.getCharacter(false)  );
	}
}
